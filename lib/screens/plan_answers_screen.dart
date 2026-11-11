import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../services/notification_service.dart';
import '../utils/constants.dart';
import '../utils/design_tokens.dart';
import '../utils/haptics.dart';

/// The answers the plan is built from, open to change after the onboarding:
/// how often the user trains, how long the program runs, and the two times
/// of day the plan and its reminders hang on.
class PlanAnswersScreen extends StatelessWidget {
  const PlanAnswersScreen({super.key});

  static String _goalLabel(AppLocalizations l, String v) => switch (v) {
    '90' => l.obGoalDaysN(90),
    '120' => l.obGoalDaysN(120),
    '180' => l.obGoalDaysN(180),
    '365' => l.obGoalYear,
    _ => l.obGoalOpen,
  };

  /// Puts the reminders back on the clock for the changed answers.
  static void _reschedule(BuildContext context, AppProvider provider) {
    provider.rebuildReminders();
    unawaited(
      NotificationService().scheduleReminders(
        provider.reminders,
        AppLocalizations.of(context)!,
        context: provider.reminderContext,
      ),
    );
  }

  Future<void> _choose(
    BuildContext context, {
    required String title,
    required List<(String, String)> options,
    required ValueChanged<String> onPick,
  }) async {
    final picked = await showCupertinoModalPopup<String>(
      context: context,
      builder: (ctx) => CupertinoActionSheet(
        title: Text(title),
        actions: [
          for (final (value, label) in options)
            CupertinoActionSheetAction(
              onPressed: () => Navigator.pop(ctx, value),
              child: Text(label),
            ),
        ],
        cancelButton: CupertinoActionSheetAction(
          onPressed: () => Navigator.pop(ctx),
          child: Text(AppLocalizations.of(ctx)!.cancel),
        ),
      ),
    );
    if (picked != null) {
      Haptics.select();
      onPick(picked);
    }
  }

  Future<void> _pickTime(
    BuildContext context, {
    required String current,
    required ValueChanged<String> onPick,
  }) async {
    final parts = current.split(':');
    var value = DateTime(
      2024,
      1,
      1,
      int.tryParse(parts.first) ?? 12,
      parts.length > 1 ? int.tryParse(parts[1]) ?? 0 : 0,
    );
    final l = AppLocalizations.of(context)!;
    final saved = await showCupertinoModalPopup<bool>(
      context: context,
      builder: (ctx) => Container(
        height: 320,
        decoration: const BoxDecoration(
          color: AppColors.surfaceDark,
          borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        ),
        child: SafeArea(
          top: false,
          child: Column(
            children: [
              Align(
                alignment: AlignmentDirectional.centerEnd,
                child: CupertinoButton(
                  onPressed: () => Navigator.pop(ctx, true),
                  child: Text(
                    l.save,
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              Expanded(
                child: CupertinoTheme(
                  data: const CupertinoThemeData(brightness: Brightness.dark),
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: MediaQuery.of(ctx).alwaysUse24HourFormat,
                    minuteInterval: 5,
                    initialDateTime: value.subtract(
                      Duration(minutes: value.minute % 5),
                    ),
                    onDateTimeChanged: (d) => value = d,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    if (saved == true) {
      String two(int n) => n.toString().padLeft(2, '0');
      onPick('${two(value.hour)}:${two(value.minute)}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    final profile = provider.profile;
    final workout = provider.weeklyWorkout;
    final goal = provider.onboardingAnswers['goalDays'] as String? ?? 'open';

    String time(String hhmm) {
      final p = hhmm.split(':');
      return TimeOfDay(
        hour: int.tryParse(p.first) ?? 0,
        minute: p.length > 1 ? int.tryParse(p[1]) ?? 0 : 0,
      ).format(context);
    }

    return Scaffold(
      backgroundColor: BtColors.page,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 8, 20, 0),
              child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(
                  CupertinoIcons.chevron_left,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 6, 20, 6),
              child: Text(l.paTitle, style: BtType.screenTitle),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 18),
              child: Text(
                l.paSubtitle,
                style: TextStyle(
                  fontSize: 15,
                  height: 1.4,
                  color: BtColors.textMute,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: BtColors.card,
                  borderRadius: BorderRadius.circular(BtRadius.lg),
                  border: Border.all(color: BtColors.stroke),
                ),
                child: Column(
                  children: [
                    _Row(
                      icon: Icons.fitness_center_rounded,
                      label: l.paWorkout,
                      value: workout.isEmpty ? '' : workout,
                      onTap: () => _choose(
                        context,
                        title: l.paWorkout,
                        options: [
                          for (final v in const ['0-2', '3-5', '6+'])
                            (v, '$v ${l.workoutsPerWeek}'),
                        ],
                        onPick: (v) {
                          provider.setOnboardingAnswers({'weeklyWorkout': v});
                          _reschedule(context, provider);
                        },
                      ),
                    ),
                    const _Line(),
                    _Row(
                      icon: CupertinoIcons.flag_fill,
                      label: l.paGoal,
                      value: _goalLabel(l, goal),
                      onTap: () => _choose(
                        context,
                        title: l.paGoal,
                        options: [
                          for (final v in const [
                            '90',
                            '120',
                            '180',
                            '365',
                            'open',
                          ])
                            (v, _goalLabel(l, v)),
                        ],
                        onPick: (v) =>
                            provider.setOnboardingAnswers({'goalDays': v}),
                      ),
                    ),
                    if (profile != null) ...[
                      const _Line(),
                      _Row(
                        icon: CupertinoIcons.moon_fill,
                        label: l.paBedtime,
                        value: time(profile.bedtime),
                        onTap: () => _pickTime(
                          context,
                          current: profile.bedtime,
                          onPick: (v) {
                            provider.updateProfile(
                              profile.copyWith(bedtime: v),
                            );
                            _reschedule(context, provider);
                          },
                        ),
                      ),
                      const _Line(),
                      _Row(
                        icon: CupertinoIcons.time_solid,
                        label: l.paWorkoutTime,
                        value: time(profile.workoutTime),
                        onTap: () => _pickTime(
                          context,
                          current: profile.workoutTime,
                          onPick: (v) {
                            provider.updateProfile(
                              profile.copyWith(workoutTime: v),
                            );
                            _reschedule(context, provider);
                          },
                        ),
                      ),
                    ],
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

class _Line extends StatelessWidget {
  const _Line();

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsetsDirectional.only(start: 50),
    child: Container(height: 1, color: BtColors.stroke),
  );
}

class _Row extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final VoidCallback onTap;
  const _Row({
    required this.icon,
    required this.label,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) => Semantics(
    button: true,
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 15, 14, 15),
        child: Row(
          children: [
            Icon(icon, size: 20, color: AppColors.primaryLight),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(width: 10),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 150),
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.end,
                style: TextStyle(fontSize: 15, color: BtColors.textMute),
              ),
            ),
            const SizedBox(width: 6),
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
