import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../models/reminder.dart';
import '../providers/app_provider.dart';
import '../services/notification_service.dart';
import '../utils/constants.dart';

/// Everything the app is allowed to interrupt the user for, in one place: the
/// built-in reminders they can retime or switch off, and their own.
class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  bool _master = true;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    final enabled = await NotificationService().isEnabled();
    if (!mounted) return;
    setState(() {
      _master = enabled;
      _loading = false;
    });
  }

  Future<void> _reschedule() async {
    final l = AppLocalizations.of(context)!;
    final reminders = context.read<AppProvider>().reminders;
    await NotificationService().scheduleReminders(reminders, l);
  }

  Future<void> _setMaster(bool value) async {
    final l = AppLocalizations.of(context)!;
    setState(() => _master = value);
    await NotificationService().setEnabled(value, l);
    if (value) {
      if (!mounted) return;
      await _reschedule();
    } else {
      await NotificationService().cancelAll();
    }
  }

  // ── Category metadata ─────────────────────────────────────────────────
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

  String _daysLabel(AppLocalizations l, Reminder r) {
    if (r.isDaily) return l.reminderEveryDay;
    const short = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];
    final days = [...r.weekdays]..sort();
    return days.map((d) => short[(d - 1) % 7]).join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    final provider = context.watch<AppProvider>();
    final reminders = provider.reminders;
    final builtIn = reminders.where((r) => !r.isCustom).toList();
    final custom = reminders.where((r) => r.isCustom).toList();
    final activeCount = reminders.where((r) => r.enabled).length;

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      appBar: AppBar(
        backgroundColor: AppColors.scaffold,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          l.notifications,
          style: const TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: _loading
          ? const Center(child: CupertinoActivityIndicator())
          : ListView(
              padding: const EdgeInsets.fromLTRB(16, 4, 16, 40),
              children: [
                // ── Master switch ─────────────────────────────────────
                Container(
                  padding: const EdgeInsets.fromLTRB(18, 16, 14, 16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.primary.withValues(alpha: _master ? 0.16 : 0.05),
                        AppColors.cardFill,
                      ],
                      stops: const [0.0, 0.7],
                    ),
                    borderRadius: BorderRadius.circular(24),
                    border: Border.all(
                      color: AppColors.primary
                          .withValues(alpha: _master ? 0.30 : 0.10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Icon(
                          _master
                              ? CupertinoIcons.bell_fill
                              : CupertinoIcons.bell_slash_fill,
                          color: AppColors.primary,
                          size: 21,
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              l.reminderMasterTitle,
                              style: const TextStyle(
                                fontSize: 15.5,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              _master
                                  ? l.reminderActiveCount(activeCount)
                                  : l.notificationsOff,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.white.withValues(alpha: 0.45),
                              ),
                            ),
                          ],
                        ),
                      ),
                      CupertinoSwitch(
                        value: _master,
                        activeTrackColor: AppColors.primary,
                        onChanged: _setMaster,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 22),

                // ── Built-in reminders ────────────────────────────────
                _GroupLabel(l.reminderBuiltIn),
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 6, 12),
                  child: Row(
                    children: [
                      Icon(CupertinoIcons.hand_point_right_fill,
                          size: 13,
                          color: Colors.white.withValues(alpha: 0.30)),
                      const SizedBox(width: 7),
                      Expanded(
                        child: Text(
                          l.reminderTapHint,
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.38),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ...builtIn.map((r) => _ReminderTile(
                      reminder: r,
                      title: _title(l, r),
                      days: _daysLabel(l, r),
                      icon: _meta[r.category]?.$1 ?? CupertinoIcons.bell_fill,
                      color: _meta[r.category]?.$2 ?? AppColors.primary,
                      dimmed: !_master,
                      onToggle: (v) async {
                        HapticFeedback.selectionClick();
                        provider.updateReminder(r.copyWith(enabled: v));
                        await _reschedule();
                      },
                      onTap: () => _editReminder(r),
                    )),

                const SizedBox(height: 22),

                // ── The user's own ────────────────────────────────────
                _GroupLabel(l.reminderYourOwn),
                if (custom.isEmpty)
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 22),
                    decoration: BoxDecoration(
                      color: AppColors.cardFill,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.06)),
                    ),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.bell_circle,
                            size: 22,
                            color: Colors.white.withValues(alpha: 0.28)),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            l.reminderEmptyHint,
                            style: TextStyle(
                              fontSize: 12.5,
                              height: 1.4,
                              fontWeight: FontWeight.w500,
                              color: Colors.white.withValues(alpha: 0.42),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  ...custom.map((r) => _ReminderTile(
                        reminder: r,
                        title: _title(l, r),
                        days: _daysLabel(l, r),
                        icon: CupertinoIcons.bell_fill,
                        color: AppColors.orange,
                        dimmed: !_master,
                        onToggle: (v) async {
                          HapticFeedback.selectionClick();
                          provider.updateReminder(r.copyWith(enabled: v));
                          await _reschedule();
                        },
                        onTap: () => _editReminder(r),
                        onDelete: () async {
                          provider.deleteReminder(r.id);
                          await _reschedule();
                        },
                      )),

                const SizedBox(height: 14),
                GestureDetector(
                  onTap: _addReminder,
                  child: Container(
                    height: 52,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, Color(0xFF6D28D9)],
                      ),
                      borderRadius: BorderRadius.circular(18),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.35),
                          blurRadius: 18,
                          offset: const Offset(0, 6),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(CupertinoIcons.add,
                            size: 18, color: Colors.white),
                        const SizedBox(width: 8),
                        Flexible(
                          child: Text(
                            l.reminderAdd,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
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

  // ── Editing ───────────────────────────────────────────────────────────
  Future<void> _addReminder() async {
    final result = await showModalBottomSheet<Reminder>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _ReminderEditor(
        reminder: Reminder(
          id: 'custom_${DateTime.now().millisecondsSinceEpoch}',
          category: 'custom',
          hour: 9,
          minute: 0,
        ),
        isNew: true,
      ),
    );
    if (result == null || !mounted) return;
    context.read<AppProvider>().addReminder(result);
    await _reschedule();
  }

  Future<void> _editReminder(Reminder reminder) async {
    final result = await showModalBottomSheet<Reminder>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (_) => _ReminderEditor(
        reminder: reminder,
        isNew: false,
        title: _title(AppLocalizations.of(context)!, reminder),
      ),
    );
    if (result == null || !mounted) return;
    context.read<AppProvider>().updateReminder(result);
    await _reschedule();
  }
}

// ═════════════════════════════════════════════════════════════════════════════

class _GroupLabel extends StatelessWidget {
  final String text;
  const _GroupLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(6, 0, 6, 10),
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          fontSize: 10.5,
          fontWeight: FontWeight.w900,
          letterSpacing: 1.4,
          color: Colors.white.withValues(alpha: 0.38),
        ),
      ),
    );
  }
}

class _ReminderTile extends StatelessWidget {
  final Reminder reminder;
  final String title;
  final String days;
  final IconData icon;
  final Color color;
  final bool dimmed;
  final ValueChanged<bool> onToggle;
  final VoidCallback onTap;
  final VoidCallback? onDelete;

  const _ReminderTile({
    required this.reminder,
    required this.title,
    required this.days,
    required this.icon,
    required this.color,
    required this.dimmed,
    required this.onToggle,
    required this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final on = reminder.enabled && !dimmed;
    final tile = GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.fromLTRB(14, 13, 12, 13),
        decoration: BoxDecoration(
          color: AppColors.cardFill,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: on
                ? color.withValues(alpha: 0.24)
                : Colors.white.withValues(alpha: 0.05),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: color.withValues(alpha: on ? 0.14 : 0.05),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(icon,
                  size: 18, color: color.withValues(alpha: on ? 1 : 0.35)),
            ),
            const SizedBox(width: 13),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.white.withValues(alpha: on ? 1 : 0.45),
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        reminder.timeLabel,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w800,
                          color: color.withValues(alpha: on ? 0.95 : 0.35),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          days,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w500,
                            color: Colors.white.withValues(alpha: 0.35),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            CupertinoSwitch(
              value: reminder.enabled,
              activeTrackColor: color,
              onChanged: dimmed ? null : onToggle,
            ),
          ],
        ),
      ),
    );

    final shown = dimmed ? Opacity(opacity: 0.45, child: tile) : tile;
    if (onDelete == null) return shown;
    return Dismissible(
      key: Key(reminder.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        margin: const EdgeInsets.only(bottom: 10),
        padding: const EdgeInsets.only(right: 22),
        decoration: BoxDecoration(
          color: AppColors.error.withValues(alpha: 0.18),
          borderRadius: BorderRadius.circular(20),
        ),
        child: const Icon(CupertinoIcons.delete,
            color: AppColors.error, size: 20),
      ),
      onDismissed: (_) => onDelete!(),
      child: shown,
    );
  }
}

// ═════════════════════════════════════════════════════════════════════════════

class _ReminderEditor extends StatefulWidget {
  final Reminder reminder;
  final bool isNew;
  final String? title;

  const _ReminderEditor({
    required this.reminder,
    required this.isNew,
    this.title,
  });

  @override
  State<_ReminderEditor> createState() => _ReminderEditorState();
}

class _ReminderEditorState extends State<_ReminderEditor> {
  late int _hour = widget.reminder.hour;
  late int _minute = widget.reminder.minute;
  late Set<int> _days = widget.reminder.weekdays.toSet();
  late final TextEditingController _label =
      TextEditingController(text: widget.reminder.label);

  @override
  void dispose() {
    _label.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    const short = ['Pzt', 'Sal', 'Çar', 'Per', 'Cum', 'Cmt', 'Paz'];

    return Container(
      padding: EdgeInsets.fromLTRB(
          20, 14, 20, 20 + MediaQuery.of(context).viewInsets.bottom),
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
          const SizedBox(height: 18),
          Text(
            widget.title ?? l.reminderAdd,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -0.4,
            ),
          ),
          const SizedBox(height: 18),

          if (widget.reminder.isCustom) ...[
            TextField(
              controller: _label,
              style: const TextStyle(color: Colors.white, fontSize: 15),
              decoration: InputDecoration(
                hintText: l.reminderLabelHint,
                hintStyle:
                    TextStyle(color: Colors.white.withValues(alpha: 0.30)),
                filled: true,
                fillColor: Colors.white.withValues(alpha: 0.05),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
            const SizedBox(height: 16),
          ],

          // ── Time ──────────────────────────────────────────────────────
          SizedBox(
            height: 150,
            child: CupertinoTheme(
              data: const CupertinoThemeData(
                brightness: Brightness.dark,
                textTheme: CupertinoTextThemeData(
                  dateTimePickerTextStyle: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.time,
                use24hFormat: true,
                initialDateTime: DateTime(2026, 1, 1, _hour, _minute),
                onDateTimeChanged: (d) {
                  _hour = d.hour;
                  _minute = d.minute;
                },
              ),
            ),
          ),

          const SizedBox(height: 12),

          // ── Days ──────────────────────────────────────────────────────
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              l.reminderDays.toUpperCase(),
              style: TextStyle(
                fontSize: 10.5,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.3,
                color: Colors.white.withValues(alpha: 0.38),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: List.generate(7, (i) {
              final day = i + 1;
              final selected = _days.isEmpty || _days.contains(day);
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: i == 6 ? 0 : 6),
                  child: GestureDetector(
                    onTap: () {
                      HapticFeedback.selectionClick();
                      setState(() {
                        // an empty set means every day; make it explicit on
                        // the first tap so days can be removed one by one
                        if (_days.isEmpty) {
                          _days = {1, 2, 3, 4, 5, 6, 7};
                        }
                        if (_days.contains(day)) {
                          if (_days.length > 1) _days.remove(day);
                        } else {
                          _days.add(day);
                        }
                      });
                    },
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: selected
                            ? AppColors.primary.withValues(alpha: 0.18)
                            : Colors.white.withValues(alpha: 0.04),
                        borderRadius: BorderRadius.circular(13),
                        border: Border.all(
                          color: selected
                              ? AppColors.primary.withValues(alpha: 0.45)
                              : Colors.white.withValues(alpha: 0.07),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          short[i],
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w800,
                            color: selected
                                ? AppColors.primary
                                : Colors.white.withValues(alpha: 0.35),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 20),

          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.05),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                          color: Colors.white.withValues(alpha: 0.08)),
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
              ),
              const SizedBox(width: 10),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    HapticFeedback.mediumImpact();
                    Navigator.pop(
                      context,
                      widget.reminder.copyWith(
                        hour: _hour,
                        minute: _minute,
                        weekdays:
                            _days.length == 7 ? const [] : _days.toList(),
                        label: _label.text.trim(),
                        enabled: true,
                      ),
                    );
                  },
                  child: Container(
                    height: 48,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, Color(0xFF6D28D9)],
                      ),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primary.withValues(alpha: 0.35),
                          blurRadius: 16,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        l.save,
                        style: const TextStyle(
                          fontSize: 14.5,
                          fontWeight: FontWeight.w800,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
