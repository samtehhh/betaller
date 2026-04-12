import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

class ProgressPhotosScreen extends StatefulWidget {
  const ProgressPhotosScreen({super.key});

  @override
  State<ProgressPhotosScreen> createState() => _ProgressPhotosScreenState();
}

class _ProgressPhotosScreenState extends State<ProgressPhotosScreen> {
  static const List<String> _monthAbbr = [
    'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
  ];

  // ── Date helpers ────────────────────────────────────────────────
  DateTime? _parseDate(String? raw) {
    if (raw == null || raw.isEmpty) return null;
    try {
      return DateTime.parse(raw);
    } catch (_) {
      return null;
    }
  }

  String _formatShortDate(String raw) {
    final dt = _parseDate(raw);
    if (dt == null) return raw;
    final day = dt.day.toString().padLeft(2, '0');
    final month = _monthAbbr[dt.month - 1];
    return '$day $month';
  }

  int _daysBetween(String firstRaw, String lastRaw) {
    final a = _parseDate(firstRaw);
    final b = _parseDate(lastRaw);
    if (a == null || b == null) return 0;
    return b.difference(a).inDays;
  }

  // ── Picker logic ────────────────────────────────────────────────
  Future<void> _pickPhoto(BuildContext context, ImageSource source) async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(
      source: source,
      maxWidth: 1080,
      imageQuality: 85,
    );
    if (picked == null) return;

    final appDir = await getApplicationDocumentsDirectory();
    final photosDir = Directory('${appDir.path}/progress_photos');
    if (!photosDir.existsSync()) photosDir.createSync(recursive: true);
    final filename = 'photo_${DateTime.now().millisecondsSinceEpoch}.jpg';
    final newPath = '${photosDir.path}/$filename';
    await File(picked.path).copy(newPath);

    if (!context.mounted) return;
    // Ask user to confirm/enter the height for this photo
    final height = await _askHeight(context);
    if (height == null) {
      // User cancelled — clean up the file
      try {
        await File(newPath).delete();
      } catch (_) {}
      return;
    }

    if (!context.mounted) return;
    final provider = context.read<AppProvider>();
    provider.addProgressPhoto(newPath, height);
    HapticFeedback.heavyImpact();
  }

  /// Prompt the user for the height (cm) of this specific photo.
  /// Pre-fills with the current profile height as a suggestion.
  Future<double?> _askHeight(BuildContext context) async {
    final provider = context.read<AppProvider>();
    final defaultHeight = provider.profile?.currentHeight ?? 170.0;
    final controller = TextEditingController(text: defaultHeight.toStringAsFixed(1));
    final l = AppLocalizations.of(context)!;

    return showDialog<double>(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: AppColors.cardFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.cardBorderLight, width: 1),
        ),
        title: Text(
          l.yourHeightDialog,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
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
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller,
              autofocus: true,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.w800,
              ),
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                suffixText: 'cm',
                suffixStyle: TextStyle(
                  color: AppColors.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.04),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: AppColors.cardBorderLight),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide(color: AppColors.cardBorderLight),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: AppColors.primary, width: 1.5),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(null),
            child: Text(
              l.cancel,
              style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
            ),
          ),
          TextButton(
            onPressed: () {
              final value = double.tryParse(controller.text.replaceAll(',', '.'));
              if (value == null || value < 80 || value > 250) {
                HapticFeedback.heavyImpact();
                return;
              }
              HapticFeedback.mediumImpact();
              Navigator.of(ctx).pop(value);
            },
            child: Text(
              l.save,
              style: const TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _openPickerSheet(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    HapticFeedback.mediumImpact();
    showCupertinoModalPopup<void>(
      context: context,
      builder: (sheetContext) => CupertinoActionSheet(
        title: Text(
          l.addProgressPhoto,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        message: Text(l.captureJourney),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(sheetContext).pop();
              _pickPhoto(context, ImageSource.camera);
            },
            child: Text(l.takePhoto),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(sheetContext).pop();
              _pickPhoto(context, ImageSource.gallery);
            },
            child: Text(l.chooseFromLibrary),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () => Navigator.of(sheetContext).pop(),
          child: Text(l.cancel),
        ),
      ),
    );
  }

  // ── Delete confirm ──────────────────────────────────────────────
  void _confirmDelete(BuildContext context, Map<String, dynamic> photo) {
    HapticFeedback.mediumImpact();
    final l = AppLocalizations.of(context)!;
    showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: AppColors.cardFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.cardBorderLight, width: 1),
        ),
        title: Text(
          l.deletePhotoTitle,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            letterSpacing: -0.3,
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
              HapticFeedback.heavyImpact();
              context.read<AppProvider>().deleteProgressPhoto(photo['id'] as String);
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

  // ── Open fullscreen viewer ──────────────────────────────────────
  void _openViewer(BuildContext context, Map<String, dynamic> photo) {
    HapticFeedback.lightImpact();
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black.withValues(alpha: 0.95),
        pageBuilder: (ctx, anim, secondaryAnim) => _PhotoViewer(
          photo: photo,
          onDelete: () => _confirmDelete(context, photo),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final photos = provider.progressPhotos;
        final hasPhotos = photos.isNotEmpty;

        // Stats
        final count = photos.length;
        int daysTracked = 0;
        double cmGained = 0;
        if (photos.length >= 2) {
          daysTracked = _daysBetween(
            photos.first['date'] as String,
            photos.last['date'] as String,
          );
          final startH = (photos.first['height'] as num?)?.toDouble() ?? 0;
          final endH = (photos.last['height'] as num?)?.toDouble() ?? 0;
          cmGained = endH - startH;
        }

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                _buildTopBar(context),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ClampingScrollPhysics(),
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildHeaderCard(context, count, daysTracked, cmGained),
                        const SizedBox(height: 20),
                        if (!hasPhotos)
                          _buildEmptyState(context)
                        else ...[
                          if (photos.length >= 2) ...[
                            _buildBeforeAfterCard(context, photos),
                            const SizedBox(height: 20),
                          ],
                          SectionHeader(
                            icon: CupertinoIcons.photo_on_rectangle,
                            title: AppLocalizations.of(context)!.timelineTab,
                          ),
                          const SizedBox(height: 12),
                          _buildGrid(context, photos),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          floatingActionButton: _buildFab(context),
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
    );
  }

  // ── Top bar ─────────────────────────────────────────────────────
  Widget _buildTopBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColors.cardBorder)),
      ),
      padding: const EdgeInsets.fromLTRB(6, 4, 14, 10),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
            },
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context)!.progressPhotosTitle,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w800,
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Gradient header card ────────────────────────────────────────
  Widget _buildHeaderCard(BuildContext context, int count, int daysTracked, double cmGained) {
    final l = AppLocalizations.of(context)!;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(22, 22, 22, 22),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0F0B24), Color(0xFF070B1A)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.primary.withValues(alpha: 0.22),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withValues(alpha: 0.18),
            blurRadius: 26,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            l.progressPhotosHeader,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: AppColors.primary,
              letterSpacing: 2.0,
              shadows: [
                Shadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 14,
                ),
              ],
            ),
          ),
          const SizedBox(height: 6),
          Text(
            l.progressPhotosSubtitle,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.65),
              letterSpacing: 0.2,
            ),
          ),
          const SizedBox(height: 18),
          Row(
            children: [
              _buildHeaderStat(
                value: count.toString(),
                label: l.photoLabel(count),
                color: AppColors.primary,
              ),
              _buildStatDivider(),
              _buildHeaderStat(
                value: daysTracked.toString(),
                label: l.dayLabel(daysTracked),
                color: AppColors.primaryBright,
              ),
              _buildStatDivider(),
              _buildHeaderStat(
                value: cmGained > 0
                    ? '+${cmGained.toStringAsFixed(1)}'
                    : cmGained.toStringAsFixed(1),
                label: l.cmGained,
                color: cmGained > 0 ? AppColors.lime : Colors.white,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeaderStat({
    required String value,
    required String label,
    required Color color,
  }) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: color,
              letterSpacing: -0.5,
              shadows: [
                Shadow(
                  color: color.withValues(alpha: 0.45),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w700,
              color: Colors.white.withValues(alpha: 0.55),
              letterSpacing: 1.1,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatDivider() {
    return Container(
      width: 1,
      height: 36,
      color: Colors.white.withValues(alpha: 0.08),
    );
  }

  // ── Empty state ─────────────────────────────────────────────────
  Widget _buildEmptyState(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.18),
                    AppColors.primary.withValues(alpha: 0.04),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.35),
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.25),
                    blurRadius: 28,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: const Icon(
                CupertinoIcons.camera_fill,
                size: 52,
                color: AppColors.primary,
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                AppLocalizations.of(context)!.firstPhotoMessage,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white.withValues(alpha: 0.75),
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () => _openPickerSheet(context),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                decoration: BoxDecoration(
                  gradient: AppColors.gradientPrimary,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withValues(alpha: 0.45),
                      blurRadius: 18,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(CupertinoIcons.camera_fill,
                        color: Colors.white, size: 18),
                    const SizedBox(width: 8),
                    Text(
                      AppLocalizations.of(context)!.takeFirstPhoto,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                        letterSpacing: 0.3,
                      ),
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

  // ── Before/After comparison card ────────────────────────────────
  Widget _buildBeforeAfterCard(BuildContext context, List<Map<String, dynamic>> photos) {
    final l = AppLocalizations.of(context)!;
    final first = photos.first;
    final last = photos.last;
    final firstH = (first['height'] as num?)?.toDouble() ?? 0;
    final lastH = (last['height'] as num?)?.toDouble() ?? 0;
    final diff = lastH - firstH;
    final days = _daysBetween(first['date'] as String, last['date'] as String);

    return GlassCard(
      glowColor: AppColors.lime.withValues(alpha: 0.18),
      padding: const EdgeInsets.fromLTRB(18, 18, 18, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(CupertinoIcons.sparkles, color: AppColors.lime, size: 18),
              const SizedBox(width: 8),
              Text(
                l.beforeAfter,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: AppColors.lime,
                  letterSpacing: 1.4,
                  shadows: [
                    Shadow(
                      color: AppColors.lime.withValues(alpha: 0.5),
                      blurRadius: 10,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: _buildComparisonAvatar(
                  photo: first,
                  label: l.beforeLabel,
                  color: AppColors.primaryBright,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.gradientGrowth,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withValues(alpha: 0.5),
                        blurRadius: 14,
                      ),
                    ],
                  ),
                  child: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              ),
              Expanded(
                child: _buildComparisonAvatar(
                  photo: last,
                  label: l.afterLabel,
                  color: AppColors.lime,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: AppColors.lime.withValues(alpha: 0.14),
                borderRadius: BorderRadius.circular(999),
                border: Border.all(
                  color: AppColors.lime.withValues(alpha: 0.4),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lime.withValues(alpha: 0.25),
                    blurRadius: 14,
                  ),
                ],
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    diff >= 0
                        ? CupertinoIcons.arrow_up_right
                        : CupertinoIcons.arrow_down_right,
                    color: AppColors.lime,
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${diff >= 0 ? '+' : ''}${diff.toStringAsFixed(1)} cm in ${l.dayLabel(days)}',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w800,
                      color: AppColors.lime,
                      letterSpacing: 0.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComparisonAvatar({
    required Map<String, dynamic> photo,
    required String label,
    required Color color,
  }) {
    final path = photo['path'] as String;
    final height = (photo['height'] as num?)?.toDouble() ?? 0;
    final date = _formatShortDate(photo['date'] as String);
    return Column(
      children: [
        Container(
          width: 88,
          height: 88,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.65), width: 2),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.35),
                blurRadius: 18,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: ClipOval(
            child: Image.file(
              File(path),
              fit: BoxFit.cover,
              errorBuilder: (ctx, err, stack) => Container(
                color: AppColors.cardFill,
                child: const Icon(
                  CupertinoIcons.photo,
                  color: Colors.white24,
                  size: 28,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w800,
            color: color,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          date,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: Colors.white.withValues(alpha: 0.6),
          ),
        ),
        Text(
          '${height.toStringAsFixed(1)} cm',
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  // ── Grid of photos ──────────────────────────────────────────────
  Widget _buildGrid(BuildContext context, List<Map<String, dynamic>> photos) {
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      childAspectRatio: 0.78,
      children: photos.map((photo) => _buildPhotoTile(context, photo)).toList(),
    );
  }

  Widget _buildPhotoTile(BuildContext context, Map<String, dynamic> photo) {
    final path = photo['path'] as String;
    final height = (photo['height'] as num?)?.toDouble() ?? 0;
    final date = _formatShortDate(photo['date'] as String);

    return GestureDetector(
      onTap: () => _openViewer(context, photo),
      onLongPress: () => _confirmDelete(context, photo),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.primary.withValues(alpha: 0.20),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.45),
              blurRadius: 18,
              offset: const Offset(0, 6),
            ),
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.10),
              blurRadius: 14,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(18),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Image.file(
                File(path),
                fit: BoxFit.cover,
                errorBuilder: (ctx, err, stack) => Container(
                  color: AppColors.cardFill,
                  child: const Icon(
                    CupertinoIcons.photo,
                    color: Colors.white24,
                    size: 40,
                  ),
                ),
              ),
              // Bottom gradient overlay
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(12, 28, 12, 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.3,
                          shadows: [
                            Shadow(color: Colors.black87, blurRadius: 6),
                          ],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '${height.toStringAsFixed(1)} cm',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: AppColors.lime,
                          letterSpacing: 0.2,
                          shadows: [
                            Shadow(
                              color: AppColors.lime.withValues(alpha: 0.6),
                              blurRadius: 8,
                            ),
                            const Shadow(color: Colors.black, blurRadius: 4),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ── FAB ─────────────────────────────────────────────────────────
  Widget _buildFab(BuildContext context) {
    return GestureDetector(
      onTap: () => _openPickerSheet(context),
      child: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppColors.gradientPrimary,
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.55),
              blurRadius: 22,
              offset: const Offset(0, 8),
            ),
            BoxShadow(
              color: AppColors.primary.withValues(alpha: 0.25),
              blurRadius: 40,
            ),
          ],
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.22),
            width: 1.2,
          ),
        ),
        child: const Icon(
          CupertinoIcons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }
}

// ── Fullscreen photo viewer ───────────────────────────────────────

class _PhotoViewer extends StatelessWidget {
  final Map<String, dynamic> photo;
  final VoidCallback onDelete;

  const _PhotoViewer({required this.photo, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    final path = photo['path'] as String;
    final height = (photo['height'] as num?)?.toDouble() ?? 0;
    final rawDate = photo['date'] as String;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Tappable background
          GestureDetector(
            onTap: () {
              HapticFeedback.lightImpact();
              Navigator.of(context).pop();
            },
            child: Container(color: Colors.black.withValues(alpha: 0.85)),
          ),

          // Interactive image
          Center(
            child: InteractiveViewer(
              minScale: 1.0,
              maxScale: 5.0,
              child: Image.file(
                File(path),
                fit: BoxFit.contain,
                errorBuilder: (ctx, err, stack) => Container(
                  color: AppColors.cardFill,
                  padding: const EdgeInsets.all(40),
                  child: const Icon(
                    CupertinoIcons.photo,
                    color: Colors.white24,
                    size: 64,
                  ),
                ),
              ),
            ),
          ),

          // Top info bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            rawDate,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white.withValues(alpha: 0.7),
                              letterSpacing: 1.0,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${height.toStringAsFixed(1)} cm',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.lime,
                              letterSpacing: -0.3,
                              shadows: [
                                Shadow(
                                  color: AppColors.lime.withValues(alpha: 0.5),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        HapticFeedback.lightImpact();
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withValues(alpha: 0.14),
                          border: Border.all(
                            color: Colors.white.withValues(alpha: 0.25),
                            width: 1,
                          ),
                        ),
                        child: const Icon(
                          CupertinoIcons.xmark,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Delete button bottom-right
          Positioned(
            right: 20,
            bottom: 32,
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  onDelete();
                },
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.error.withValues(alpha: 0.18),
                    border: Border.all(
                      color: AppColors.error.withValues(alpha: 0.55),
                      width: 1.2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.error.withValues(alpha: 0.35),
                        blurRadius: 18,
                      ),
                    ],
                  ),
                  child: const Icon(
                    CupertinoIcons.trash_fill,
                    color: AppColors.error,
                    size: 22,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
