import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/reminder.dart';
import '../providers/app_provider.dart';
import '../screens/notifications_screen.dart';
import '../services/notification_service.dart';
import '../utils/constants.dart';
import '../utils/design_tokens.dart';
import '../utils/haptics.dart';

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
    final provider = context.watch<AppProvider>();
    // Without Pro the everyday reminders are not sent, so the card must not
    // show one of their times as "next".
    final reminders = provider.isPremium
        ? provider.reminders
        : [
            for (final r in provider.reminders)
              if (!NotificationService.kEverydayCategories.contains(r.category))
                r,
          ];
    final next = _enabled ? nextReminder(reminders) : null;

    final color = next == null
        ? BtColors.textMute
        : _meta[next.reminder.category]?.$2 ?? AppColors.primaryLight;
    final icon = next == null
        ? CupertinoIcons.bell_slash_fill
        : _meta[next.reminder.category]?.$1 ?? CupertinoIcons.bell_fill;
    final label = next == null ? l.reminderMasterTitle : l.reminderNextLabel;
    final title = next == null ? l.reminderOffCta : _title(l, next.reminder);
    final sub = l.reminderManageHint;

    return Semantics(
      button: true,
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () async {
          Haptics.tap();
          await Navigator.push(
            context,
            CupertinoPageRoute(builder: (_) => const NotificationsScreen()),
          );
          _load();
        },
        child: Container(
          padding: const EdgeInsets.fromLTRB(14, 14, 14, 14),
          decoration: BoxDecoration(
            color: BtColors.card,
            borderRadius: BorderRadius.circular(BtRadius.lg),
            border: Border.all(color: BtColors.stroke),
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.14),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(icon, size: 21, color: color),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      label,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: BtColors.textMute,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: BtType.headline.copyWith(fontSize: 16),
                    ),
                    if (!widget.compact) ...[
                      const SizedBox(height: 3),
                      Text(
                        sub,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12.5,
                          height: 1.3,
                          color: BtColors.textMute,
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(width: 10),
              // The time is the answer the card exists for: large, on the
              // right, where a clock sits on a lock screen row.
              if (next != null)
                Text(
                  next.reminder.timeLabel,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w800,
                    letterSpacing: -0.6,
                    color: Colors.white,
                  ),
                )
              else
                Icon(
                  CupertinoIcons.chevron_right,
                  size: 15,
                  color: BtColors.textFaint,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
