import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/camera_utils.dart';
import '../utils/constants.dart';
import '../utils/haptics.dart';
import '../widgets/premium_paywall.dart';
import '../widgets/progress_locked_preview.dart';
import '../utils/text_case.dart';
import '../utils/num_format.dart';

/// How often the app suggests a new photo. Two weeks is long enough for a
/// visible change in posture and short enough to keep the habit.
const int _kPhotoEveryDays = 14;

/// Progress photos as a transformation tool: a dated timeline with the height
/// on each photo, and a before/after comparison of any two of them.
///
/// Adding photos is premium (as it always was); photos already taken stay
/// visible and comparable for everyone.
class ProgressPhotosScreen extends StatefulWidget {
  const ProgressPhotosScreen({super.key});

  @override
  State<ProgressPhotosScreen> createState() => _ProgressPhotosScreenState();
}

class _ProgressPhotosScreenState extends State<ProgressPhotosScreen> {
  /// The pair being compared, by photo id. Null means first and last.
  String? _beforeId;
  String? _afterId;

  // ── Picker flow ─────────────────────────────────────────────────────────
  Future<void> _startCapture() async {
    Haptics.tap();
    final provider = context.read<AppProvider>();
    if (!provider.isPremium) {
      await showPremiumPaywall(context);
      return;
    }
    final photos = provider.progressPhotos;
    final source = await showModalBottomSheet<ImageSource>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => _PhotoGuideSheet(
        ghostPath: photos.isEmpty ? null : photos.last['path'] as String?,
      ),
    );
    if (source == null || !mounted) return;
    await _pickPhoto(source);
  }

  Future<void> _pickPhoto(ImageSource source) async {
    final picked = await pickImageWithCountdown(context, source);
    if (picked == null) return;

    final appDir = await getApplicationDocumentsDirectory();
    final photosDir = Directory('${appDir.path}/progress_photos');
    if (!photosDir.existsSync()) photosDir.createSync(recursive: true);
    final filename = 'photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final newPath = '${photosDir.path}/$filename';
    await File(picked.path).copy(newPath);

    if (!mounted) return;
    final height = await _askHeight();
    if (height == null) {
      // Cancelled: keep nothing on disk that no record points at.
      try {
        await File(newPath).delete();
      } catch (_) {}
      return;
    }
    if (!mounted) return;
    final provider = context.read<AppProvider>();
    final hadOne = provider.progressPhotos.length == 1;
    provider.addProgressPhoto(newPath, height);
    // The second photo is the moment the comparison appears.
    if (hadOne) {
      Haptics.impact();
    } else {
      Haptics.success();
    }
    setState(() {
      _beforeId = null;
      _afterId = null;
    });
  }

  /// The height for this photo, pre-filled with the latest measurement.
  Future<double?> _askHeight() async {
    final provider = context.read<AppProvider>();
    final suggested = provider.latestHeight > 0 ? provider.latestHeight : 170.0;
    final controller = TextEditingController(
      text: provider.heightNumber(suggested).toStringAsFixed(1),
    );
    final l = AppLocalizations.of(context)!;

    final result = await showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
        title: Text(
          l.yourHeightDialog,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l.heightDialogMessage,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.70),
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w900,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                suffixText: provider.heightUnit,
                suffixStyle: TextStyle(
                  color: Colors.white.withValues(alpha: 0.5),
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                ),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.04),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(
                    color: Colors.white.withValues(alpha: 0.08),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: const BorderSide(
                    color: AppColors.primary,
                    width: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Haptics.tap();
              Navigator.of(ctx).pop();
            },
            child: Text(
              l.cancel,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
            ),
          ),
          TextButton(
            onPressed: () {
              final typed = double.tryParse(
                controller.text.replaceAll(',', '.'),
              );
              final value = typed == null
                  ? null
                  : provider.heightFromInput(typed);
              if (value == null || value < 80 || value > 250) {
                Haptics.warning();
                return;
              }
              Navigator.of(ctx).pop(value);
            },
            child: Text(
              l.save,
              style: const TextStyle(
                color: AppColors.primaryLight,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
    controller.dispose();
    return result;
  }

  // ── Delete ──────────────────────────────────────────────────────────────
  void _confirmDelete(Map<String, dynamic> photo) {
    Haptics.warning();
    final l = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.cardFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
        title: Text(
          l.deletePhotoTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w900,
            letterSpacing: -0.5,
          ),
        ),
        content: Text(
          l.deletePhotoBody,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.75)),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: Text(
              l.cancel,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
            ),
          ),
          TextButton(
            onPressed: () {
              Haptics.warning();
              context.read<AppProvider>().deleteProgressPhoto(
                photo['id'] as String,
              );
              Navigator.of(dialogContext).pop();
            },
            child: Text(
              l.delete,
              style: const TextStyle(
                color: AppColors.error,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openViewer(Map<String, dynamic> photo, int dayNumber) {
    Haptics.tap();
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black.withValues(alpha: 0.95),
        pageBuilder: (ctx, anim, secondaryAnim) => FadeTransition(
          opacity: anim,
          child: _PhotoViewer(
            photo: photo,
            dayNumber: dayNumber,
            onDelete: () => _confirmDelete(photo),
          ),
        ),
      ),
    );
  }

  Future<void> _choosePhoto({required bool before}) async {
    Haptics.tap();
    final photos = context.read<AppProvider>().progressPhotos;
    final current = before ? _beforeId : _afterId;
    final picked = await showModalBottomSheet<String>(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (_) => _PhotoPickerSheet(photos: photos, selectedId: current),
    );
    if (picked == null || !mounted) return;
    Haptics.select();
    setState(() {
      if (before) {
        _beforeId = picked;
      } else {
        _afterId = picked;
      }
    });
  }

  // ── Build ───────────────────────────────────────────────────────────────
  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final photos = provider.progressPhotos;
        final locked = !provider.isPremium;

        Map<String, dynamic>? byId(String? id) {
          if (id == null) return null;
          for (final p in photos) {
            if (p['id'] == id) return p;
          }
          return null;
        }

        final before = photos.length >= 2
            ? (byId(_beforeId) ?? photos.first)
            : null;
        final after = photos.length >= 2
            ? (byId(_afterId) ?? photos.last)
            : null;

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                _TopBar(count: photos.length),
                Expanded(
                  child: ListView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
                    children: [
                      if (photos.isEmpty)
                        locked
                            ? ProgressLockedPreview(
                                title: l.pgPhotosLockedTitle,
                                body: l.pgPhotosLockedBody,
                                preview: const _SilhouetteComparePreview(),
                              )
                            : _EmptyState(onStart: _startCapture)
                      else if (photos.length == 1)
                        _SinglePhotoCard(
                          photo: photos.first,
                          onTap: () => _openViewer(photos.first, 1),
                        )
                      else
                        _CompareCard(
                          before: before!,
                          after: after!,
                          totalPhotos: photos.length,
                          onChooseBefore: () => _choosePhoto(before: true),
                          onChooseAfter: () => _choosePhoto(before: false),
                        ),
                      if (photos.isNotEmpty) ...[
                        const SizedBox(height: 24),
                        _TimelineHeader(
                          lastDate: DateTime.tryParse(
                            photos.last['date'] as String? ?? '',
                          ),
                        ),
                        const SizedBox(height: 12),
                        _TimelineGrid(
                          photos: photos,
                          onOpen: _openViewer,
                          onDelete: _confirmDelete,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: photos.isEmpty
              ? null
              : _NewPhotoButton(locked: locked, onTap: _startCapture),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
        );
      },
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Helpers
// ═════════════════════════════════════════════════════════════════════════════

DateTime? _date(Map<String, dynamic> photo) =>
    DateTime.tryParse(photo['date'] as String? ?? '');

double _height(Map<String, dynamic> photo) =>
    (photo['height'] as num?)?.toDouble() ?? 0;

String _shortDate(BuildContext context, DateTime? d) {
  if (d == null) return '';
  return DateFormat(
    'd MMM',
    Localizations.localeOf(context).languageCode,
  ).format(d);
}

String _longDate(BuildContext context, DateTime? d) {
  if (d == null) return '';
  return DateFormat(
    'd MMM y',
    Localizations.localeOf(context).languageCode,
  ).format(d);
}

/// The height number alone, in the user's unit, with a sign.
String _signedNumber(AppProvider p, double deltaCm) {
  final v = p.heightNumber(deltaCm);
  final s = v.fixedL(1);
  return v > 0.04 ? '+$s' : s;
}

bool _reduceMotion(BuildContext context) =>
    MediaQuery.maybeDisableAnimationsOf(context) ?? false;

/// A stored photo, or a quiet placeholder when the file has gone.
class _PhotoImage extends StatelessWidget {
  final String? path;
  final int? cacheWidth;
  const _PhotoImage({required this.path, this.cacheWidth});

  @override
  Widget build(BuildContext context) {
    final placeholder = Container(
      color: AppColors.surfaceDark,
      alignment: Alignment.center,
      child: Icon(
        CupertinoIcons.photo,
        color: Colors.white.withValues(alpha: 0.18),
        size: 32,
      ),
    );
    if (path == null || path!.isEmpty) return placeholder;
    return Image.file(
      File(path!),
      fit: BoxFit.cover,
      cacheWidth: cacheWidth,
      gaplessPlayback: true,
      errorBuilder: (_, _, _) => placeholder,
    );
  }
}

class _CardBox extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  const _CardBox({
    required this.child,
    this.padding = const EdgeInsets.all(16),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.cardFill,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.06)),
      ),
      child: child,
    );
  }
}

class _Label extends StatelessWidget {
  final String text;
  final Color color;
  const _Label(this.text, {this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Text(
      text.upperIn(context),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w800,
        letterSpacing: 1.2,
        color: color,
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Top bar
// ═════════════════════════════════════════════════════════════════════════════

class _TopBar extends StatelessWidget {
  final int count;
  const _TopBar({required this.count});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.fromLTRB(4, 4, 16, 4),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              Haptics.tap();
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Text(
              l.progressPhotosTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
          ),
          if (count > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.06),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    CupertinoIcons.photo_on_rectangle,
                    size: 13,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '$count',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Compare card
// ═════════════════════════════════════════════════════════════════════════════

class _CompareCard extends StatefulWidget {
  final Map<String, dynamic> before;
  final Map<String, dynamic> after;
  final int totalPhotos;
  final VoidCallback onChooseBefore;
  final VoidCallback onChooseAfter;

  const _CompareCard({
    required this.before,
    required this.after,
    required this.totalPhotos,
    required this.onChooseBefore,
    required this.onChooseAfter,
  });

  @override
  State<_CompareCard> createState() => _CompareCardState();
}

class _CompareCardState extends State<_CompareCard> {
  bool _sideBySide = false;

  void _setMode(bool sideBySide) {
    if (sideBySide == _sideBySide) return;
    Haptics.select();
    setState(() => _sideBySide = sideBySide);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    final bDate = _date(widget.before);
    final aDate = _date(widget.after);
    final days = (bDate != null && aDate != null)
        ? aDate.difference(bDate).inDays.abs()
        : 0;
    final delta = _height(widget.after) - _height(widget.before);
    final grew = delta > 0.04;

    return _CardBox(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Expanded(
                  // One line that shrinks: "Tu transformación" broke inside
                  // the word next to the mode toggle on a 320 pt phone.
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    alignment: AlignmentDirectional.centerStart,
                    child: Text(
                      l.pgTransformationTitle,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w900,
                        letterSpacing: -0.6,
                        color: Colors.white,
                        height: 1.15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                _ModeToggle(sideBySide: _sideBySide, onChanged: _setMode),
              ],
            ),
          ),
          const SizedBox(height: 14),
          AnimatedSwitcher(
            duration: _reduceMotion(context)
                ? Duration.zero
                : const Duration(milliseconds: 220),
            child: _sideBySide
                ? _SideBySide(
                    key: const ValueKey('side'),
                    before: widget.before,
                    after: widget.after,
                    deltaText: provider.formatHeightDelta(delta),
                    grew: grew,
                  )
                : _RevealSlider(
                    key: ValueKey(
                      'slider_${widget.before['id']}_${widget.after['id']}',
                    ),
                    before: widget.before,
                    after: widget.after,
                  ),
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _PickChip(
                  label: l.beforeLabel,
                  date: _shortDate(context, bDate),
                  color: AppColors.primaryLight,
                  onTap: widget.onChooseBefore,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _PickChip(
                  label: l.afterLabel,
                  date: _shortDate(context, aDate),
                  color: AppColors.lime,
                  onTap: widget.onChooseAfter,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _StatTile(
                  value: _signedNumber(provider, delta),
                  unit: provider.heightUnit,
                  label: l.pgHeightChange,
                  color: grew ? AppColors.lime : Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _StatTile(
                  value: '$days',
                  unit: '',
                  label: l.pgDaysApart,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              grew
                  ? l.pgCompareMeaningGrew(
                      provider.formatHeightDelta(delta),
                      days,
                    )
                  : l.pgCompareMeaningSame(days),
              style: TextStyle(
                fontSize: 13,
                height: 1.4,
                color: Colors.white.withValues(alpha: 0.6),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ModeToggle extends StatelessWidget {
  final bool sideBySide;
  final ValueChanged<bool> onChanged;
  const _ModeToggle({required this.sideBySide, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    Widget seg(IconData icon, String tooltip, bool value) {
      final on = sideBySide == value;
      return Semantics(
        button: true,
        selected: on,
        label: tooltip,
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => onChanged(value),
          child: Container(
            width: 44,
            height: 36,
            decoration: BoxDecoration(
              color: on ? Colors.white.withValues(alpha: 0.12) : null,
              borderRadius: BorderRadius.circular(999),
            ),
            child: Icon(
              icon,
              size: 18,
              color: on ? Colors.white : Colors.white.withValues(alpha: 0.45),
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          seg(CupertinoIcons.slider_horizontal_3, l.pgModeSlider, false),
          seg(CupertinoIcons.square_split_2x1, l.pgModeSideBySide, true),
        ],
      ),
    );
  }
}

/// Two photos in one frame: the after photo underneath, the before photo on
/// top clipped to the handle. Drag anywhere to move the handle.
class _RevealSlider extends StatefulWidget {
  final Map<String, dynamic> before;
  final Map<String, dynamic> after;
  const _RevealSlider({super.key, required this.before, required this.after});

  @override
  State<_RevealSlider> createState() => _RevealSliderState();
}

class _RevealSliderState extends State<_RevealSlider> {
  double _split = 0.5;
  static const _detents = [0.25, 0.5, 0.75];

  void _move(double dx, double width) {
    final next = (dx / width).clamp(0.0, 1.0);
    for (final d in _detents) {
      if ((_split - d).sign != (next - d).sign) {
        Haptics.select();
        break;
      }
    }
    setState(() => _split = next);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    return AspectRatio(
      aspectRatio: 3 / 4,
      child: LayoutBuilder(
        builder: (context, c) {
          final w = c.maxWidth;
          final x = w * _split;
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onHorizontalDragStart: (d) => _move(d.localPosition.dx, w),
            onHorizontalDragUpdate: (d) => _move(d.localPosition.dx, w),
            onTapDown: (d) => _move(d.localPosition.dx, w),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  _PhotoImage(
                    path: widget.after['path'] as String?,
                    cacheWidth: 1080,
                  ),
                  ClipRect(
                    clipper: _LeftClipper(x),
                    child: _PhotoImage(
                      path: widget.before['path'] as String?,
                      cacheWidth: 1080,
                    ),
                  ),
                  // Labels sit in the corners of their own half and fade as
                  // the handle covers them.
                  Positioned(
                    left: 10,
                    top: 10,
                    child: Opacity(
                      opacity: (_split * 3).clamp(0.0, 1.0),
                      child: _CornerTag(
                        label: l.beforeLabel,
                        sub: provider.formatHeight(_height(widget.before)),
                        color: AppColors.primaryLight,
                      ),
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: Opacity(
                      opacity: ((1 - _split) * 3).clamp(0.0, 1.0),
                      child: _CornerTag(
                        label: l.afterLabel,
                        sub: provider.formatHeight(_height(widget.after)),
                        color: AppColors.lime,
                      ),
                    ),
                  ),
                  // Handle
                  Positioned(
                    left: x - 1,
                    top: 0,
                    bottom: 0,
                    child: Container(
                      width: 2,
                      color: Colors.white.withValues(alpha: 0.9),
                    ),
                  ),
                  Positioned(
                    left: x - 20,
                    top: c.maxHeight / 2 - 20,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: const Icon(
                        CupertinoIcons.arrow_left_right,
                        size: 18,
                        color: AppColors.scaffold,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 10,
                    child: Center(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(999),
                        ),
                        child: Text(
                          l.pgDragToReveal,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LeftClipper extends CustomClipper<Rect> {
  final double x;
  _LeftClipper(this.x);

  @override
  Rect getClip(Size size) => Rect.fromLTWH(0, 0, x, size.height);

  @override
  bool shouldReclip(_LeftClipper oldClipper) => oldClipper.x != x;
}

class _CornerTag extends StatelessWidget {
  final String label;
  final String sub;
  final Color color;
  const _CornerTag({
    required this.label,
    required this.sub,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(9, 6, 9, 6),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.1,
              color: color,
            ),
          ),
          Text(
            sub,
            style: const TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class _SideBySide extends StatelessWidget {
  final Map<String, dynamic> before;
  final Map<String, dynamic> after;
  final String deltaText;
  final bool grew;

  const _SideBySide({
    super.key,
    required this.before,
    required this.after,
    required this.deltaText,
    required this.grew,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    Widget half(Map<String, dynamic> p, String label, Color color) {
      return Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 3 / 4.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: _PhotoImage(path: p['path'] as String?, cacheWidth: 720),
              ),
            ),
            const SizedBox(height: 8),
            _Label(label, color: color),
            const SizedBox(height: 2),
            Text(
              provider.formatHeight(_height(p)),
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.5,
                color: Colors.white,
              ),
            ),
            Text(
              _longDate(context, _date(p)),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ),
          ],
        ),
      );
    }

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            half(before, l.beforeLabel, AppColors.primaryLight),
            const SizedBox(width: 8),
            half(after, l.afterLabel, AppColors.lime),
          ],
        ),
        Positioned(
          left: 0,
          right: 0,
          top: 12,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.scaffold,
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: (grew ? AppColors.lime : Colors.white).withValues(
                    alpha: 0.45,
                  ),
                ),
              ),
              child: Text(
                deltaText,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: grew ? AppColors.lime : Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PickChip extends StatelessWidget {
  final String label;
  final String date;
  final Color color;
  final VoidCallback onTap;

  const _PickChip({
    required this.label,
    required this.date,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: Container(
          height: 44,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: 0.04),
            borderRadius: BorderRadius.circular(999),
            border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
          ),
          child: Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  date,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              Icon(
                CupertinoIcons.chevron_down,
                size: 13,
                color: Colors.white.withValues(alpha: 0.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final String value;
  final String unit;
  final String label;
  final Color color;

  const _StatTile({
    required this.value,
    required this.unit,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(14, 12, 12, 12),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.03),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            fit: BoxFit.scaleDown,
            alignment: Alignment.centerLeft,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -1,
                    color: color,
                  ),
                ),
                if (unit.isNotEmpty) ...[
                  const SizedBox(width: 3),
                  Text(
                    unit,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: 0.45),
                    ),
                  ),
                ],
              ],
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            maxLines: 2,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white.withValues(alpha: 0.55),
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  One photo: the comparison is one photo away
// ═════════════════════════════════════════════════════════════════════════════

class _SinglePhotoCard extends StatelessWidget {
  final Map<String, dynamic> photo;
  final VoidCallback onTap;
  const _SinglePhotoCard({required this.photo, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    final taken = _date(photo);
    final next = taken?.add(const Duration(days: _kPhotoEveryDays));
    return _CardBox(
      padding: const EdgeInsets.fromLTRB(14, 16, 14, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Text(
              l.pgOnePhotoTitle,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                letterSpacing: -0.6,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 14),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: onTap,
                  child: AspectRatio(
                    aspectRatio: 3 / 4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: _PhotoImage(
                        path: photo['path'] as String?,
                        cacheWidth: 720,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: AspectRatio(
                  aspectRatio: 3 / 4,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.03),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: Colors.white.withValues(alpha: 0.08),
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Positioned.fill(
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(18, 18, 18, 30),
                            child: CustomPaint(
                              painter: _SilhouettePainter(alpha: 0.22),
                            ),
                          ),
                        ),
                        Positioned(
                          left: 8,
                          right: 8,
                          bottom: 10,
                          child: Text(
                            l.afterLabel,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.1,
                              color: AppColors.lime,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${provider.formatHeight(_height(photo))}  ·  ${_longDate(context, taken)}',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  l.pgOnePhotoBody(_longDate(context, next)),
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.4,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Empty state and the locked preview
// ═════════════════════════════════════════════════════════════════════════════

class _EmptyState extends StatelessWidget {
  final VoidCallback onStart;
  const _EmptyState({required this.onStart});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return _CardBox(
      padding: const EdgeInsets.fromLTRB(18, 20, 18, 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 200, child: _GuideFrame(ghostPath: null)),
          const SizedBox(height: 18),
          Text(
            l.pgEmptyTitle,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.7,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l.pgEmptyBody,
            style: TextStyle(
              fontSize: 14,
              height: 1.45,
              color: Colors.white.withValues(alpha: 0.65),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 52,
            child: FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: onStart,
              icon: const Icon(CupertinoIcons.camera_fill, size: 18),
              label: Text(
                l.pgTakeFirstPhoto,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// What the comparison looks like, drawn rather than faked: a before and an
/// after outline either side of the handle. Shown blurred above the unlock.
class _SilhouetteComparePreview extends StatelessWidget {
  const _SilhouetteComparePreview();

  @override
  Widget build(BuildContext context) {
    Widget half(Color color) => Expanded(
      child: Container(
        color: color.withValues(alpha: 0.16),
        padding: const EdgeInsets.fromLTRB(18, 22, 18, 14),
        child: CustomPaint(
          painter: _SilhouettePainter(alpha: 0.9, color: color),
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 14, 14, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          height: 230,
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [half(AppColors.primaryLight), half(AppColors.lime)],
              ),
              Align(
                alignment: Alignment.center,
                child: Container(width: 2, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Timeline
// ═════════════════════════════════════════════════════════════════════════════

class _TimelineHeader extends StatelessWidget {
  final DateTime? lastDate;
  const _TimelineHeader({required this.lastDate});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final due = lastDate?.add(const Duration(days: _kPhotoEveryDays));
    final isDue = due == null || !due.isAfter(today);

    return Row(
      children: [
        _Label(l.timelineTab, color: Colors.white.withValues(alpha: 0.85)),
        const SizedBox(width: 12),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: (isDue ? AppColors.lime : Colors.white).withValues(
                  alpha: isDue ? 0.12 : 0.05,
                ),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isDue ? CupertinoIcons.camera_fill : CupertinoIcons.clock,
                    size: 12,
                    color: isDue
                        ? AppColors.lime
                        : Colors.white.withValues(alpha: 0.6),
                  ),
                  const SizedBox(width: 5),
                  Flexible(
                    // The date is the point of this pill, so it shrinks
                    // instead of losing "29 oct." to an ellipsis.
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        isDue
                            ? l.pgPhotoDueNow
                            : l.pgNextPhotoOn(_shortDate(context, due)),
                        maxLines: 1,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: isDue
                              ? AppColors.lime
                              : Colors.white.withValues(alpha: 0.7),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _TimelineGrid extends StatelessWidget {
  final List<Map<String, dynamic>> photos;
  final void Function(Map<String, dynamic> photo, int day) onOpen;
  final void Function(Map<String, dynamic> photo) onDelete;

  const _TimelineGrid({
    required this.photos,
    required this.onOpen,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AppProvider>();
    final first = photos.first;
    final firstDate = _date(first);
    final firstHeight = _height(first);
    // Newest first: the timeline reads like a feed, day 1 at the bottom.
    final ordered = photos.reversed.toList();

    return LayoutBuilder(
      builder: (context, c) {
        final columns = c.maxWidth >= 520 ? 3 : 2;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: ordered.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: columns,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.72,
          ),
          itemBuilder: (context, i) {
            final p = ordered[i];
            final d = _date(p);
            final day = (d != null && firstDate != null)
                ? d.difference(firstDate).inDays + 1
                : 1;
            final delta = _height(p) - firstHeight;
            return _TimelineTile(
              photo: p,
              day: day,
              date: _shortDate(context, d),
              height: provider.formatHeight(_height(p)),
              delta: identical(p, first) || delta.abs() < 0.05
                  ? null
                  : provider.formatHeightDelta(delta),
              grew: delta > 0.04,
              onTap: () => onOpen(p, day),
              onLongPress: () => onDelete(p),
            );
          },
        );
      },
    );
  }
}

class _TimelineTile extends StatelessWidget {
  final Map<String, dynamic> photo;
  final int day;
  final String date;
  final String height;
  final String? delta;
  final bool grew;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const _TimelineTile({
    required this.photo,
    required this.day,
    required this.date,
    required this.height,
    required this.delta,
    required this.grew,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            _PhotoImage(path: photo['path'] as String?, cacheWidth: 480),
            Positioned(
              left: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.55),
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Text(
                  l.pgDayN(day),
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding: const EdgeInsets.fromLTRB(10, 26, 10, 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withValues(alpha: 0.8),
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      date,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: Colors.white.withValues(alpha: 0.75),
                      ),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: Text(
                            height,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.3,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        if (delta != null) ...[
                          const SizedBox(width: 6),
                          Text(
                            delta!,
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w800,
                              color: grew
                                  ? AppColors.lime
                                  : Colors.white.withValues(alpha: 0.6),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NewPhotoButton extends StatelessWidget {
  final bool locked;
  final VoidCallback onTap;
  const _NewPhotoButton({required this.locked, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return SizedBox(
      height: 52,
      child: FilledButton.icon(
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 22),
          elevation: 8,
          shadowColor: AppColors.primary.withValues(alpha: 0.6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: onTap,
        icon: Icon(
          locked ? CupertinoIcons.lock_fill : CupertinoIcons.camera_fill,
          size: 18,
        ),
        label: Text(
          l.pgNewPhoto,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w800),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Pose guide (shown before every capture)
// ═════════════════════════════════════════════════════════════════════════════

class _PhotoGuideSheet extends StatelessWidget {
  final String? ghostPath;
  const _PhotoGuideSheet({required this.ghostPath});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final media = MediaQuery.of(context);
    final frameHeight = (media.size.height * 0.34).clamp(170.0, 300.0);
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: media.size.height * 0.92),
      child: Container(
        decoration: const BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        child: SafeArea(
          top: false,
          child: SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.min,
              children: [
                Center(
                  child: Container(
                    width: 38,
                    height: 4,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  l.pgGuideTitle,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.6,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  ghostPath == null ? l.pgGuideSubtitle : l.pgGuideGhost,
                  style: TextStyle(
                    fontSize: 13.5,
                    height: 1.4,
                    color: Colors.white.withValues(alpha: 0.6),
                  ),
                ),
                const SizedBox(height: 14),
                SizedBox(
                  height: frameHeight,
                  child: _GuideFrame(ghostPath: ghostPath),
                ),
                const SizedBox(height: 14),
                _GuideStep(
                  icon: CupertinoIcons.arrow_left_right,
                  text: l.pgGuideStep1,
                ),
                _GuideStep(
                  icon: CupertinoIcons.person_fill,
                  text: l.pgGuideStep2,
                ),
                _GuideStep(
                  icon: CupertinoIcons.sun_max_fill,
                  text: l.pgGuideStep3,
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 52,
                  child: FilledButton.icon(
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Haptics.tap();
                      Navigator.of(context).pop(ImageSource.camera);
                    },
                    icon: const Icon(CupertinoIcons.camera_fill, size: 18),
                    label: Text(
                      l.pgTakePhoto,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 48,
                  child: TextButton.icon(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.white.withValues(alpha: 0.8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Haptics.tap();
                      Navigator.of(context).pop(ImageSource.gallery);
                    },
                    icon: const Icon(CupertinoIcons.photo, size: 18),
                    label: Text(
                      l.pgFromGallery,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// The viewfinder drawn as a guide: the last photo faintly behind, a pose
/// outline, and the chest-height line the phone should sit on.
class _GuideFrame extends StatelessWidget {
  final String? ghostPath;
  const _GuideFrame({required this.ghostPath});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.35),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(
        builder: (context, c) {
          final chestY = c.maxHeight * 0.36;
          return Stack(
            children: [
              if (ghostPath != null)
                Positioned.fill(
                  child: Opacity(
                    opacity: 0.28,
                    child: _PhotoImage(path: ghostPath, cacheWidth: 480),
                  ),
                ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 10),
                  child: CustomPaint(
                    painter: _SilhouettePainter(
                      alpha: 0.75,
                      color: AppColors.lime,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                right: 0,
                top: chestY,
                child: CustomPaint(
                  size: Size(c.maxWidth, 1),
                  painter: _DashedLinePainter(),
                ),
              ),
              Positioned(
                right: 8,
                top: chestY - 26,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      CupertinoIcons.device_phone_portrait,
                      size: 13,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      l.pgChestHeight,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 8,
                bottom: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.5),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    l.pgGuideDistance,
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _GuideStep extends StatelessWidget {
  final IconData icon;
  final String text;
  const _GuideStep({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.lime.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 16, color: AppColors.lime),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                height: 1.35,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// A front-facing standing figure, arms relaxed, feet together.
class _SilhouettePainter extends CustomPainter {
  final double alpha;
  final Color color;
  const _SilhouettePainter({required this.alpha, this.color = Colors.white});

  // Right half of the outline, from the neck down and back up to the crotch,
  // as (offset from centre, y) in units of the figure height.
  static const _half = <Offset>[
    Offset(0.030, 0.165),
    Offset(0.040, 0.190),
    Offset(0.115, 0.215),
    Offset(0.140, 0.250),
    Offset(0.150, 0.360),
    Offset(0.160, 0.470),
    Offset(0.150, 0.520),
    Offset(0.128, 0.505),
    Offset(0.118, 0.380),
    Offset(0.100, 0.300),
    Offset(0.090, 0.400),
    Offset(0.098, 0.500),
    Offset(0.092, 0.700),
    Offset(0.082, 0.940),
    Offset(0.090, 0.985),
    Offset(0.022, 0.985),
    Offset(0.026, 0.720),
    Offset(0.000, 0.540),
  ];

  @override
  void paint(Canvas canvas, Size size) {
    final h = size.height;
    final cx = size.width / 2;
    final paint = Paint()
      ..color = color.withValues(alpha: alpha)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(Offset(cx, h * 0.085), h * 0.068, paint);

    final pts = <Offset>[
      for (final p in _half) Offset(cx + p.dx * h * 1.18, p.dy * h),
      for (final p in _half.reversed.skip(1))
        Offset(cx - p.dx * h * 1.18, p.dy * h),
    ];
    final path = Path()..moveTo(pts.first.dx, pts.first.dy);
    for (var i = 1; i < pts.length - 1; i++) {
      final mid = Offset(
        (pts[i].dx + pts[i + 1].dx) / 2,
        (pts[i].dy + pts[i + 1].dy) / 2,
      );
      path.quadraticBezierTo(pts[i].dx, pts[i].dy, mid.dx, mid.dy);
    }
    path.lineTo(pts.last.dx, pts.last.dy);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant _SilhouettePainter old) =>
      old.alpha != alpha || old.color != color;
}

class _DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withValues(alpha: 0.7)
      ..strokeWidth = 1;
    const dash = 6.0;
    const gap = 5.0;
    var x = 0.0;
    while (x < size.width) {
      canvas.drawLine(Offset(x, 0), Offset(x + dash, 0), paint);
      x += dash + gap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// ═════════════════════════════════════════════════════════════════════════════
//  Choosing a photo for the comparison
// ═════════════════════════════════════════════════════════════════════════════

class _PhotoPickerSheet extends StatelessWidget {
  final List<Map<String, dynamic>> photos;
  final String? selectedId;
  const _PhotoPickerSheet({required this.photos, required this.selectedId});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
      ),
      child: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 12, 0, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 38,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 12),
                child: Text(
                  l.pgChoosePhoto,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 190,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: photos.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 10),
                  itemBuilder: (context, i) {
                    final p = photos[i];
                    final on = p['id'] == selectedId;
                    return GestureDetector(
                      onTap: () => Navigator.of(context).pop(p['id'] as String),
                      child: SizedBox(
                        width: 112,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(
                                    color: on
                                        ? AppColors.lime
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: SizedBox.expand(
                                    child: _PhotoImage(
                                      path: p['path'] as String?,
                                      cacheWidth: 320,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _shortDate(context, _date(p)),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              provider.formatHeight(_height(p)),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white.withValues(alpha: 0.55),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════
//  Fullscreen viewer
// ═════════════════════════════════════════════════════════════════════════════

class _PhotoViewer extends StatelessWidget {
  final Map<String, dynamic> photo;
  final int dayNumber;
  final VoidCallback onDelete;

  const _PhotoViewer({
    required this.photo,
    required this.dayNumber,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();

    Widget roundButton({
      required IconData icon,
      required Color color,
      required VoidCallback onTap,
    }) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withValues(alpha: 0.16),
          ),
          child: Icon(icon, color: color, size: 20),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          GestureDetector(
            onTap: () {
              Haptics.tap();
              Navigator.of(context).pop();
            },
            child: Container(color: Colors.black.withValues(alpha: 0.85)),
          ),
          Center(
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 5.0,
              child: Image.file(
                File(photo['path'] as String? ?? ''),
                fit: BoxFit.contain,
                errorBuilder: (_, _, _) => Icon(
                  CupertinoIcons.photo,
                  color: Colors.white.withValues(alpha: 0.2),
                  size: 64,
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 16, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${l.pgDayN(dayNumber)}  ·  ${_longDate(context, _date(photo))}',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.7),
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            provider.formatHeight(_height(photo)),
                            style: const TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.w900,
                              letterSpacing: -0.8,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    roundButton(
                      icon: CupertinoIcons.trash,
                      color: AppColors.error,
                      onTap: () {
                        Navigator.of(context).pop();
                        onDelete();
                      },
                    ),
                    const SizedBox(width: 10),
                    roundButton(
                      icon: CupertinoIcons.xmark,
                      color: Colors.white,
                      onTap: () {
                        Haptics.tap();
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
