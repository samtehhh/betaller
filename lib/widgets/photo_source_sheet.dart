import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

import '../l10n/app_localizations.dart';
import '../utils/constants.dart';

/// Asks where the photo comes from, in the app's own clothes.
///
/// The stock Cupertino action sheet arrives light grey with system blue text,
/// which lands like a foreign object on top of a dark screen.
Future<ImageSource?> showPhotoSourceSheet(
  BuildContext context, {
  required String title,
  required String subtitle,
}) {
  HapticFeedback.mediumImpact();
  return showModalBottomSheet<ImageSource>(
    context: context,
    backgroundColor: Colors.transparent,
    isScrollControlled: true,
    builder: (sheetContext) => _PhotoSourceSheet(
      title: title,
      subtitle: subtitle,
    ),
  );
}

class _PhotoSourceSheet extends StatelessWidget {
  final String title;
  final String subtitle;
  const _PhotoSourceSheet({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;

    return Container(
      padding: EdgeInsets.fromLTRB(
          20, 14, 20, 20 + MediaQuery.of(context).padding.bottom),
      decoration: BoxDecoration(
        color: const Color(0xFF0B0A16),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(34)),
        border: Border(
          top: BorderSide(color: AppColors.primary.withValues(alpha: 0.22)),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.18),
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 13,
              height: 1.4,
              fontWeight: FontWeight.w500,
              color: Colors.white.withValues(alpha: 0.50),
            ),
          ),
          const SizedBox(height: 22),
          Row(
            children: [
              Expanded(
                child: _SourceTile(
                  icon: CupertinoIcons.camera_fill,
                  label: l.takePhoto,
                  color: AppColors.primary,
                  onTap: () =>
                      Navigator.of(context).pop(ImageSource.camera),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: _SourceTile(
                  icon: CupertinoIcons.photo_fill_on_rectangle_fill,
                  label: l.chooseFromLibrary,
                  color: AppColors.cyan,
                  onTap: () =>
                      Navigator.of(context).pop(ImageSource.gallery),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            behavior: HitTestBehavior.opaque,
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 0.05),
                borderRadius: BorderRadius.circular(16),
                border:
                    Border.all(color: Colors.white.withValues(alpha: 0.08)),
              ),
              child: Center(
                child: Text(
                  l.cancel,
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: Colors.white.withValues(alpha: 0.65),
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

class _SourceTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _SourceTile({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        HapticFeedback.selectionClick();
        onTap();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              color.withValues(alpha: 0.18),
              color.withValues(alpha: 0.06),
            ],
          ),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(color: color.withValues(alpha: 0.34)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.18),
              blurRadius: 20,
              spreadRadius: -6,
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.16),
                borderRadius: BorderRadius.circular(17),
                border: Border.all(color: color.withValues(alpha: 0.30)),
              ),
              child: Icon(icon, size: 23, color: color),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                label,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  height: 1.25,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
