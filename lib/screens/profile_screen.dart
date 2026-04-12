import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../models/user_profile.dart';
import '../providers/app_provider.dart';
import '../services/notification_service.dart';
import '../utils/constants.dart';
import '../utils/localized_data.dart';
import 'onboarding_screen.dart';
import '../widgets/premium_paywall.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = false;

  @override
  void initState() {
    super.initState();
    _loadNotifPref();
  }

  Future<void> _loadNotifPref() async {
    final enabled = await NotificationService().isEnabled();
    if (mounted) setState(() => _notificationsEnabled = enabled);
  }

  @override
  Widget build(BuildContext context) {
    final l = AppLocalizations.of(context)!;
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final profile = provider.profile;
        if (profile == null) return const SizedBox();

        final achievements = provider.unlockedAchievements;

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              // ── Header ──────────────────────────────
              SliverToBoxAdapter(
                child: Container(
                  color: AppColors.scaffold,
                  child: SafeArea(
                    bottom: false,
                    child: const Padding(
                      padding: EdgeInsets.fromLTRB(20, 12, 20, 16),
                      child: SizedBox(),
                    ),
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 100),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    // ── Stats ─────────────────────────
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeader(icon: CupertinoIcons.chart_bar_fill, title: l.statistics),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              _StatBox(icon: CupertinoIcons.flame_fill, label: l.currentStreak, value: '${provider.streak}', color: AppColors.orange),
                              const SizedBox(width: 10),
                              _StatBox(icon: CupertinoIcons.rosette, label: l.bestStreakLabel, value: '${provider.bestStreak}', color: AppColors.primary),
                              const SizedBox(width: 10),
                              _StatBox(icon: CupertinoIcons.star_fill, label: l.achievementLabel, value: '${provider.earnedAchievementCount}/${achievements.length}', color: AppColors.warning),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Sosyal ───────────────────────
                    GlassCard(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: [
                          _MenuRow(
                            icon: CupertinoIcons.star_fill,
                            label: l.rateUs,
                            subtitle: l.rateSubtitle,
                            color: AppColors.warning,
                            onTap: () async {
                              const url = 'https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                              }
                            },
                          ),
                          _menuDivider(),
                          _MenuRow(
                            icon: CupertinoIcons.share,
                            label: l.share,
                            subtitle: l.shareSubtitle,
                            color: AppColors.cyan,
                            onTap: () {
                              SharePlus.instance.share(
                                ShareParams(text: l.shareText),
                              );
                            },
                          ),
                          _menuDivider(),
                          _MenuRow(
                            icon: CupertinoIcons.mail_solid,
                            label: l.feedback,
                            subtitle: l.feedbackSubtitle,
                            color: AppColors.sleep,
                            onTap: () async {
                              final uri = Uri(scheme: 'mailto', path: 'contact.betaller@gmail.com', queryParameters: {'subject': l.emailSubject});
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Achievements ──────────────────
                    if (provider.isPremium)
                      GlassCard(
                        padding: const EdgeInsets.fromLTRB(12, 20, 12, 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: SectionHeader(icon: CupertinoIcons.star_circle_fill, title: l.achievements),
                            ),
                            const SizedBox(height: 12),
                            ...List.generate((achievements.length / 5).ceil(), (row) {
                              final start = row * 5;
                              final end = (start + 5).clamp(0, achievements.length);
                              final rowItems = achievements.sublist(start, end);
                              return Padding(
                                padding: EdgeInsets.only(bottom: row < (achievements.length / 5).ceil() - 1 ? 14 : 0),
                                child: Row(
                                  children: rowItems.map((a) {
                                    final earned = a['earned'] == true;
                                    final locAch = localizedAchievement(l, a['id'] as String);
                                    final localA = {...a, 'title': locAch['title'] ?? a['title'], 'description': locAch['description'] ?? a['description']};
                                    return Expanded(
                                      child: GestureDetector(
                                        onTap: () => _showAchievementDialog(context, localA),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 46,
                                              height: 46,
                                              decoration: BoxDecoration(
                                                color: earned
                                                    ? AppColors.primary.withValues(alpha: 0.15)
                                                    : Colors.white.withValues(alpha: 0.14),
                                                borderRadius: BorderRadius.circular(20),
                                                border: earned
                                                    ? Border.all(color: AppColors.primary.withValues(alpha: 0.3), width: 1)
                                                    : null,
                                              ),
                                              child: Center(
                                                child: Text(
                                                  earned ? a['icon'] : '🔒',
                                                  style: TextStyle(fontSize: 20, color: earned ? null : Colors.grey),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              localA['title'],
                                              style: TextStyle(
                                                fontSize: 9,
                                                fontWeight: FontWeight.w600,
                                                color: earned ? Colors.white.withValues(alpha: 0.82) : AppColors.textTertiary,
                                              ),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),
                              );
                            }),
                          ],
                        ),
                      )
                    else
                      PremiumLockedOverlay(
                        onTap: () => showPremiumPaywall(context),
                        child: GlassCard(
                          padding: const EdgeInsets.fromLTRB(12, 20, 12, 16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8),
                                child: SectionHeader(icon: CupertinoIcons.star_circle_fill, title: l.achievements),
                              ),
                              const SizedBox(height: 12),
                              ...List.generate((achievements.length / 5).ceil(), (row) {
                                final start = row * 5;
                                final end = (start + 5).clamp(0, achievements.length);
                                final rowItems = achievements.sublist(start, end);
                                return Padding(
                                  padding: EdgeInsets.only(bottom: row < (achievements.length / 5).ceil() - 1 ? 14 : 0),
                                  child: Row(
                                    children: rowItems.map((a) {
                                      return Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Container(
                                              width: 46,
                                              height: 46,
                                              decoration: BoxDecoration(
                                                color: Colors.white.withValues(alpha: 0.14),
                                                borderRadius: BorderRadius.circular(20),
                                              ),
                                              child: const Center(
                                                child: Text('🔒', style: TextStyle(fontSize: 20)),
                                              ),
                                            ),
                                            const SizedBox(height: 4),
                                            Text(
                                              a['title'] as String,
                                              style: TextStyle(fontSize: 9, fontWeight: FontWeight.w600, color: AppColors.textTertiary),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                    const SizedBox(height: 14),

                    // ── Hesap ────────────────────────
                    GlassCard(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: [
                          _MenuRow(
                            icon: CupertinoIcons.pencil,
                            label: l.editProfile,
                            subtitle: l.editProfileSubtitle,
                            color: AppColors.primary,
                            onTap: () => _showEditProfileSheet(context, provider, profile),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Uygulama ─────────────────────
                    GlassCard(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: [
                          _MenuRow(
                            icon: CupertinoIcons.globe,
                            label: l.language,
                            subtitle: _languageName(provider.locale),
                            color: AppColors.primary,
                            onTap: () => _showLanguagePicker(context, provider),
                          ),
                          _menuDivider(),
                          _MenuRow(
                            icon: Icons.straighten_rounded,
                            label: l.unitSystem,
                            subtitle: provider.useImperial ? l.unitImperial : l.unitMetric,
                            color: AppColors.cyan,
                            onTap: () => provider.setUseImperial(!provider.useImperial),
                          ),
                          _menuDivider(),
                          _MenuToggleRow(
                            icon: CupertinoIcons.bell_fill,
                            label: l.notifications,
                            subtitle: _notificationsEnabled ? l.notificationsOn : l.notificationsOff,
                            color: AppColors.orange,
                            value: _notificationsEnabled,
                            onChanged: (val) async {
                              await NotificationService().setEnabled(val, l);
                              setState(() => _notificationsEnabled = val);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Tehlike ──────────────────────
                    GlassCard(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: [
                          _MenuRow(
                            icon: CupertinoIcons.trash,
                            label: l.resetData,
                            subtitle: l.resetSubtitle,
                            color: AppColors.error,
                            onTap: () => _showResetDialog(context, provider),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 28),
                    // ── BeTaller Branding ────────────────
                    Center(
                      child: Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) => const LinearGradient(
                              colors: [AppColors.primaryDark, AppColors.primary, AppColors.primaryLight],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ).createShader(bounds),
                            child: const Text(
                              'BeTaller',
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.w900,
                                color: Colors.white,
                                letterSpacing: -1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            l.brandingSubtitle,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              color: AppColors.textTertiary,
                              letterSpacing: 0.5,
                            ),
                          ),
                          const SizedBox(height: 16),
                          // Privacy + Terms + Rate + Version
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () => launchUrl(Uri.parse('https://samtehhh.github.io/betaller/privacy.html'), mode: LaunchMode.externalApplication),
                                child: Text(l.privacyPolicy, style: TextStyle(fontSize: 11, color: AppColors.textTertiary, decoration: TextDecoration.underline, decorationColor: AppColors.textTertiary)),
                              ),
                              Text('  ·  ', style: TextStyle(fontSize: 11, color: AppColors.textTertiary)),
                              GestureDetector(
                                onTap: () => launchUrl(Uri.parse('https://samtehhh.github.io/betaller/terms.html'), mode: LaunchMode.externalApplication),
                                child: Text(l.termsOfService, style: TextStyle(fontSize: 11, color: AppColors.textTertiary, decoration: TextDecoration.underline, decorationColor: AppColors.textTertiary)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12),
                            child: Text(
                              l.healthDisclaimerBody,
                              style: TextStyle(fontSize: 10, color: Colors.white.withValues(alpha: 0.22), height: 1.5),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ]),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _showAchievementDialog(BuildContext context, Map<String, dynamic> achievement) {
    final l = AppLocalizations.of(context)!;
    final earned = achievement['earned'] == true;
    final type = achievement['type'] as String? ?? '';
    final Color accent = type == 'streak'
        ? AppColors.orange
        : type == 'measures'
            ? AppColors.cyan
            : type == 'growth'
                ? AppColors.lime
                : AppColors.primary;

    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.75),
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 28),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF12101E),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: (earned ? accent : Colors.white).withValues(alpha: 0.12)),
            boxShadow: earned
                ? [BoxShadow(color: accent.withValues(alpha: 0.18), blurRadius: 40, spreadRadius: 2)]
                : null,
          ),
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Icon badge
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    width: 72, height: 72,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: (earned ? accent : Colors.white).withValues(alpha: 0.08),
                      border: Border.all(color: (earned ? accent : Colors.white).withValues(alpha: 0.18)),
                      boxShadow: earned ? [BoxShadow(color: accent.withValues(alpha: 0.25), blurRadius: 24)] : null,
                    ),
                    child: Center(
                      child: Text(
                        earned ? (achievement['icon'] as String? ?? '🏆') : '🔒',
                        style: const TextStyle(fontSize: 34),
                      ),
                    ),
                  ),
                  if (earned)
                    Container(
                      width: 22, height: 22,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: accent,
                        border: Border.all(color: const Color(0xFF12101E), width: 2),
                      ),
                      child: const Icon(CupertinoIcons.checkmark, color: Colors.white, size: 11),
                    ),
                ],
              ),
              const SizedBox(height: 18),
              // Title
              Text(
                achievement['title'] as String? ?? '',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.3),
              ),
              const SizedBox(height: 8),
              // Description
              Text(
                achievement['description'] as String? ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5, color: Colors.white.withValues(alpha: 0.48), height: 1.5),
              ),
              const SizedBox(height: 18),
              // Status pill
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 7),
                decoration: BoxDecoration(
                  color: (earned ? accent : Colors.white).withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: (earned ? accent : Colors.white).withValues(alpha: 0.18)),
                ),
                child: Text(
                  earned ? l.earned : l.notEarned,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: earned ? accent : Colors.white.withValues(alpha: 0.35),
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(height: 22),
              // OK button
              GestureDetector(
                onTap: () => Navigator.pop(ctx),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    color: earned ? accent.withValues(alpha: 0.12) : AppColors.cardFill,
                    borderRadius: BorderRadius.circular(18),
                    border: earned ? Border.all(color: accent.withValues(alpha: 0.35)) : null,
                  ),
                  child: Center(
                    child: Text(
                      l.ok,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: earned ? accent : Colors.white.withValues(alpha: 0.55),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEditProfileSheet(BuildContext context, AppProvider provider, UserProfile profile) {
    final l = AppLocalizations.of(context)!;
    final nameCtrl = TextEditingController(text: profile.name);
    final heightCtrl = TextEditingController(text: profile.currentHeight.toStringAsFixed(1));
    final weightCtrl = TextEditingController(text: profile.weight.toStringAsFixed(1));
    final fatherCtrl = TextEditingController(text: profile.fatherHeight.toStringAsFixed(0));
    final motherCtrl = TextEditingController(text: profile.motherHeight.toStringAsFixed(0));
    String gender = profile.gender;
    DateTime birthDate = DateTime.tryParse(profile.birthDate) ?? DateTime(2008, 1, 1);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StatefulBuilder(
        builder: (context, setSheetState) => Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.surfaceDark,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
              border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.14))),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 36, height: 4, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.50), borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 24),
                  Text(l.editProfile, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1)),
                  const SizedBox(height: 24),
                  _EditField(controller: nameCtrl, label: l.name, icon: CupertinoIcons.person),
                  const SizedBox(height: 12),
                  // Gender selector
                  Row(
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setSheetState(() => gender = 'male'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: gender == 'male' ? AppColors.primary.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: gender == 'male' ? AppColors.primary : Colors.white.withValues(alpha: 0.1), width: gender == 'male' ? 1.5 : 0.5),
                            ),
                            child: Center(child: Text(l.male, style: TextStyle(color: gender == 'male' ? Colors.white : Colors.white.withValues(alpha: 0.82), fontSize: 15, fontWeight: gender == 'male' ? FontWeight.w700 : FontWeight.w500))),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => setSheetState(() => gender = 'female'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            decoration: BoxDecoration(
                              color: gender == 'female' ? AppColors.primary.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.10),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(color: gender == 'female' ? AppColors.primary : Colors.white.withValues(alpha: 0.1), width: gender == 'female' ? 1.5 : 0.5),
                            ),
                            child: Center(child: Text(l.female, style: TextStyle(color: gender == 'female' ? Colors.white : Colors.white.withValues(alpha: 0.82), fontSize: 15, fontWeight: gender == 'female' ? FontWeight.w700 : FontWeight.w500))),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  // Birth date
                  GestureDetector(
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context, initialDate: birthDate, firstDate: DateTime(1990), lastDate: DateTime.now(),
                        locale: Localizations.localeOf(context),
                        builder: (context, child) => Theme(data: ThemeData.dark().copyWith(colorScheme: const ColorScheme.dark(primary: AppColors.primary, surface: AppColors.surfaceDark)), child: child!),
                      );
                      if (picked != null) setSheetState(() => birthDate = picked);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(18)),
                      child: Row(children: [
                        Icon(CupertinoIcons.calendar, color: Colors.white.withValues(alpha: 0.82), size: 18),
                        const SizedBox(width: 12),
                        Text(l.birthDate('${birthDate.day.toString().padLeft(2, '0')}.${birthDate.month.toString().padLeft(2, '0')}.${birthDate.year}'), style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                        const Spacer(),
                        Icon(CupertinoIcons.chevron_down, color: Colors.white.withValues(alpha: 0.45), size: 14),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _EditField(controller: heightCtrl, label: l.heightCm, icon: CupertinoIcons.resize_v, isNumber: true),
                  const SizedBox(height: 12),
                  _EditField(controller: weightCtrl, label: l.weightKg, icon: CupertinoIcons.gauge, isNumber: true),
                  const SizedBox(height: 12),
                  _EditField(controller: fatherCtrl, label: l.fatherHeight, icon: CupertinoIcons.person, isNumber: true),
                  const SizedBox(height: 12),
                  _EditField(controller: motherCtrl, label: l.motherHeight, icon: CupertinoIcons.person, isNumber: true),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(18),
                      onPressed: () {
                        final name = nameCtrl.text.trim();
                        final height = double.tryParse(heightCtrl.text.replaceAll(',', '.'));
                        final weight = double.tryParse(weightCtrl.text.replaceAll(',', '.'));
                        final father = double.tryParse(fatherCtrl.text.replaceAll(',', '.'));
                        final mother = double.tryParse(motherCtrl.text.replaceAll(',', '.'));
                        if (name.isNotEmpty && height != null && weight != null && father != null && mother != null) {
                          final bd = birthDate.toIso8601String().substring(0, 10);
                          provider.updateProfile(profile.copyWith(name: name, gender: gender, birthDate: bd, currentHeight: height, weight: weight, fatherHeight: father, motherHeight: mother));
                          Navigator.pop(context);
                        }
                      },
                      child: Text(l.save, style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white, letterSpacing: -0.3)),
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  String _languageName(Locale? locale) {
    switch (locale?.languageCode) {
      case 'tr': return 'Türkçe';
      case 'en': return 'English';
      case 'de': return 'Deutsch';
      case 'fr': return 'Français';
      case 'hi': return 'हिन्दी';
      case 'pt': return 'Português';
      case 'es': return 'Español';
      case 'it': return 'Italiano';
      default: return AppLocalizations.of(context)?.systemLanguage ?? 'System';
    }
  }

  void _showLanguagePicker(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    final languages = [
      {'locale': null, 'name': l.systemLanguage, 'flag': '🌐'},
      {'locale': const Locale('tr'), 'name': 'Türkçe', 'flag': '🇹🇷'},
      {'locale': const Locale('en'), 'name': 'English', 'flag': '🇬🇧'},
      {'locale': const Locale('de'), 'name': 'Deutsch', 'flag': '🇩🇪'},
      {'locale': const Locale('fr'), 'name': 'Français', 'flag': '🇫🇷'},
      {'locale': const Locale('es'), 'name': 'Español', 'flag': '🇪🇸'},
      {'locale': const Locale('it'), 'name': 'Italiano', 'flag': '🇮🇹'},
      {'locale': const Locale('pt'), 'name': 'Português', 'flag': '🇧🇷'},
      {'locale': const Locale('hi'), 'name': 'हिन्दी', 'flag': '🇮🇳'},
    ];

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.surfaceDark,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(32))),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.65,
        minChildSize: 0.4,
        maxChildSize: 0.85,
        expand: false,
        builder: (context, scrollController) => Padding(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(width: 36, height: 4, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.50), borderRadius: BorderRadius.circular(2))),
              const SizedBox(height: 20),
              Text(l.selectLanguage, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5)),
              const SizedBox(height: 16),
              Expanded(
                child: ListView(
                  controller: scrollController,
                  children: [
                    ...languages.map((lang) {
                      final isSelected = provider.locale?.languageCode == (lang['locale'] as Locale?)?.languageCode
                          && (lang['locale'] != null || provider.locale == null);
                      return GestureDetector(
                        onTap: () {
                          if (lang['locale'] == null) {
                            provider.setLocale(WidgetsBinding.instance.platformDispatcher.locale);
                          } else {
                            provider.setLocale(lang['locale'] as Locale);
                          }
                          Navigator.pop(context);
                        },
                        child: Container(
                          margin: const EdgeInsets.only(bottom: 6),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                          decoration: BoxDecoration(
                            color: isSelected ? AppColors.primary.withValues(alpha: 0.15) : Colors.transparent,
                            borderRadius: BorderRadius.circular(18),
                            border: isSelected ? Border.all(color: AppColors.primary.withValues(alpha: 0.4)) : null,
                          ),
                          child: Row(
                            children: [
                              Text(lang['flag'] as String, style: const TextStyle(fontSize: 24)),
                              const SizedBox(width: 14),
                              Text(lang['name'] as String, style: TextStyle(fontSize: 16, fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500, color: Colors.white)),
                              const Spacer(),
                              if (isSelected) const Icon(CupertinoIcons.checkmark_circle_fill, color: AppColors.primary, size: 22),
                            ],
                          ),
                        ),
                      );
                    }),
                    SizedBox(height: MediaQuery.of(context).padding.bottom + 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showResetDialog(BuildContext context, AppProvider provider) {
    final l = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.75),
      builder: (ctx) => Dialog(
        backgroundColor: Colors.transparent,
        insetPadding: const EdgeInsets.symmetric(horizontal: 28),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFF12101E),
            borderRadius: BorderRadius.circular(28),
            border: Border.all(color: AppColors.error.withValues(alpha: 0.20)),
            boxShadow: [BoxShadow(color: AppColors.error.withValues(alpha: 0.12), blurRadius: 40, spreadRadius: 2)],
          ),
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 60, height: 60,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.error.withValues(alpha: 0.12),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.25)),
                ),
                child: const Icon(CupertinoIcons.trash_fill, color: AppColors.error, size: 26),
              ),
              const SizedBox(height: 18),
              Text(
                l.resetTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.3),
              ),
              const SizedBox(height: 10),
              Text(
                l.resetMessage,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.5, color: Colors.white.withValues(alpha: 0.50), height: 1.55),
              ),
              const SizedBox(height: 26),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () => Navigator.pop(ctx),
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.cardFill,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Center(
                          child: Text(l.cancel, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white.withValues(alpha: 0.65))),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        provider.resetAllData();
                        Navigator.pop(ctx);
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                          (route) => false,
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.error.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(18),
                          border: Border.all(color: AppColors.error.withValues(alpha: 0.40)),
                          boxShadow: [BoxShadow(color: AppColors.error.withValues(alpha: 0.20), blurRadius: 12)],
                        ),
                        child: Center(
                          child: Text(l.reset, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700, color: AppColors.error)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Sub-widgets ───────────────────────────────────────────────────

Widget _menuDivider() => Padding(
  padding: const EdgeInsets.symmetric(horizontal: 18),
  child: Divider(height: 1, color: Colors.white.withValues(alpha: 0.10)),
);

class _MenuRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final VoidCallback onTap;

  const _MenuRow({required this.icon, required this.label, required this.subtitle, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 36, height: 36,
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 18),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: -0.2)),
                  Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.72))),
                ],
              ),
            ),
            Icon(CupertinoIcons.chevron_right, color: Colors.white.withValues(alpha: 0.50), size: 15),
          ],
        ),
      ),
    );
  }
}

class _MenuToggleRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String subtitle;
  final Color color;
  final bool value;
  final ValueChanged<bool> onChanged;

  const _MenuToggleRow({required this.icon, required this.label, required this.subtitle, required this.color, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 36, height: 36,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 18),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: -0.2)),
                Text(subtitle, style: TextStyle(fontSize: 11, color: Colors.white.withValues(alpha: 0.72))),
              ],
            ),
          ),
          CupertinoSwitch(
            value: value,
            activeTrackColor: color,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class _StatBox extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final Color color;

  const _StatBox({required this.icon, required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(color: color.withValues(alpha: 0.12), width: 0.5),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 20),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5)),
            const SizedBox(height: 2),
            Text(label, style: TextStyle(fontSize: 10, fontWeight: FontWeight.w600, color: AppColors.textTertiary, letterSpacing: 0.5), textAlign: TextAlign.center),
          ],
        ),
      ),
    );
  }
}


class _EditField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool isNumber;

  const _EditField({required this.controller, required this.label, required this.icon, this.isNumber = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: isNumber ? const TextInputType.numberWithOptions(decimal: true) : TextInputType.text,
      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.72)),
        prefixIcon: Icon(icon, color: AppColors.primaryLight, size: 18),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.12),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
      ),
    );
  }
}
