import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/reminder.dart';
import '../providers/app_provider.dart';
import '../screens/notifications_screen.dart';
import '../services/notification_service.dart';
import '../utils/constants.dart';

/// What the app will nudge the user about next, and the way into changing it.
///
/// Scheduling is one of the app's real levers, so it gets a card rather than
/// a settings row buried three screens deep.
class NextReminderCard extends StatefulWidget {
  final bool compact;
  const NextReminderCard({super.key, this.compact = false});

  @override
  State<NextReminderCard> createState() => _NextReminderCardState();
}

class _NextReminderCardState extends State<NextReminderCard> {
  bool _enabled = true;

  static const _meta = <String, (IconData, Color)>{
    'exercise': (CupertinoIcons.bolt_fill, AppColors.primary),
    'nutrition': (CupertinoIcons.leaf_arrow_circlepath, AppColors.lime),
    'water': (CupertinoIcons.drop_fill, AppColors.water),
    'posture': (Icons.accessibility_new_rounded, AppColors.pink),
    'routine': (CupertinoIcons.checkmark_seal_fill, AppColors.warning),
    'sleep': (CupertinoIcons.moon_fill, AppColors.sleep),
    'measurement': (CupertinoIcons.arrow_up_right_circle_fill, AppColors.cyan),
    'custom': (CupertinoIcons.bell_fill, AppColors.orange),
  };

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final on = await NotificationService().isEnabled();
    if (mounted) setState(() => _enabled = on);
  }

  String _title(AppLocalizations l, Reminder r) {
    switch (r.category) {
      case 'exercise':
        return l.reminderExercise;
      case 'nutrition':
        return l.reminderNutrition;
      case 'water':
        return l.reminderWater;
      case 'posture':
        return l.reminderPosture;
      case 'routine':
        return l.reminderRoutine;
      case 'sleep':
        return l.reminderSleep;
      case 'measurement':
        return l.reminderMeasurement;
      default:
        return r.label.isEmpty ? l.reminderCustom : r.label;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final reminders = context.watch<AppProvider>().reminders;
    final next = _enabled ? nextReminder(reminders) : null;

    final color = next == null
        ? AppColors.orange
        : _meta[next.reminder.category]?.$2 ?? AppColors.orange;
    final icon = next == null
        ? CupertinoIcons.bell_slash_fill
        : _meta[next.reminder.category]?.$1 ?? CupertinoIcons.bell_fill;

    return GestureDetector(
      onTap: () async {
        await Navigator.push(
          context,
          CupertinoPageRoute(builder: (_) => const NotificationsScreen()),
        );
        _load();
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 14, 14, 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withValues(alpha: 0.12), AppColors.cardFill],
            stops: const [0.0, 0.68],
          ),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: color.withValues(alpha: 0.26)),
          boxShadow: [
            BoxShadow(
              color: color.withValues(alpha: 0.14),
              blurRadius: 24,
              offset: const Offset(0, 8),
              spreadRadius: -10,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: color.withValues(alpha: 0.28)),
              ),
              child: Icon(icon, size: 20, color: color),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    next == null
                        ? l.reminderMasterTitle
                        : l.reminderNextLabel.toUpperCase(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.2,
                      color: Colors.white.withValues(alpha: 0.40),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    next == null
                        ? l.reminderOffCta
                        : '${_title(l, next.reminder)} · ${next.reminder.timeLabel}',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 15.5,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: -0.3,
                    ),
                  ),
                  if (!widget.compact) ...[
                    const SizedBox(height: 3),
                    Text(
                      l.reminderManageHint,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withValues(alpha: 0.42),
                      ),
                    ),
                  ],
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(CupertinoIcons.chevron_right,
                size: 15, color: color.withValues(alpha: 0.7)),
          ],
        ),
      ),
    );
  }
}
