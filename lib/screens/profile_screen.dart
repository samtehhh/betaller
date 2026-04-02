import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/user_profile.dart';
import '../providers/app_provider.dart';
import '../services/notification_service.dart';
import '../utils/constants.dart';
import 'onboarding_screen.dart';

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
    return Consumer<AppProvider>(
      builder: (context, provider, _) {
        final profile = provider.profile;
        if (profile == null) return const SizedBox();

        final achievements = provider.unlockedAchievements;

        return Scaffold(
          backgroundColor: AppColors.scaffold,
          body: CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              // ── Header ──────────────────────────────
              SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xFF1E1B4B), Color(0xFF0A0A1A)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: SafeArea(
                    bottom: false,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 28),
                      child: Column(
                        children: [
                          // Avatar
                          Container(
                            width: 72,
                            height: 72,
                            decoration: BoxDecoration(
                              gradient: AppColors.gradientPrimary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.primary.withValues(alpha: 0.3),
                                  blurRadius: 24,
                                  spreadRadius: 0,
                                ),
                              ],
                            ),
                            child: Center(
                              child: Icon(
                                profile.gender == 'male' ? CupertinoIcons.person_fill : CupertinoIcons.person_fill,
                                color: Colors.white,
                                size: 32,
                              ),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Text(
                            profile.name,
                            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.8),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${profile.currentHeight.toStringAsFixed(1)} cm · ${profile.weight.toStringAsFixed(1)} kg',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white.withValues(alpha: 0.82), letterSpacing: -0.2),
                          ),
                        ],
                      ),
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
                          SectionHeader(icon: CupertinoIcons.chart_bar_fill, title: 'İstatistikler'),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              _StatBox(icon: CupertinoIcons.flame_fill, label: 'Güncel Seri', value: '${provider.streak}', color: AppColors.orange),
                              const SizedBox(width: 10),
                              _StatBox(icon: CupertinoIcons.rosette, label: 'En İyi Seri', value: '${provider.bestStreak}', color: AppColors.primary),
                              const SizedBox(width: 10),
                              _StatBox(icon: CupertinoIcons.star_fill, label: 'Başarım', value: '${provider.earnedAchievementCount}/${achievements.length}', color: AppColors.warning),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Achievements ──────────────────
                    GlassCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SectionHeader(icon: CupertinoIcons.star_circle_fill, title: 'Başarımlar'),
                          const SizedBox(height: 16),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 5,
                              crossAxisSpacing: 8,
                              mainAxisSpacing: 8,
                              childAspectRatio: 0.72,
                            ),
                            itemCount: achievements.length,
                            itemBuilder: (context, index) {
                              final a = achievements[index];
                              final earned = a['earned'] == true;
                              return GestureDetector(
                                onTap: () => _showAchievementDialog(context, a),
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
                                        borderRadius: BorderRadius.circular(14),
                                        border: earned
                                            ? Border.all(color: AppColors.primary.withValues(alpha: 0.3), width: 1)
                                            : null,
                                      ),
                                      child: Center(
                                        child: Text(
                                          earned ? a['icon'] : '🔒',
                                          style: TextStyle(
                                            fontSize: 20,
                                            color: earned ? null : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      a['title'],
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
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Ayarlar ──────────────────────
                    GlassCard(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: [
                          _MenuRow(
                            icon: CupertinoIcons.pencil,
                            label: 'Profili Düzenle',
                            subtitle: 'Boy, kilo, yaş bilgilerini güncelle',
                            color: AppColors.primary,
                            onTap: () => _showEditProfileSheet(context, provider, profile),
                          ),
                          _menuDivider(),
                          _MenuToggleRow(
                            icon: CupertinoIcons.bell_fill,
                            label: 'Bildirimler',
                            subtitle: _notificationsEnabled ? 'Hatırlatmalar aktif' : 'Hatırlatmalar kapalı',
                            color: AppColors.orange,
                            value: _notificationsEnabled,
                            onChanged: (val) async {
                              await NotificationService().setEnabled(val);
                              setState(() => _notificationsEnabled = val);
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Premium & Sosyal ─────────────
                    GlassCard(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: [
                          _MenuRow(
                            icon: CupertinoIcons.gift_fill,
                            label: "Premium'a Yükselt",
                            subtitle: 'Tüm özelliklerin kilidini aç',
                            color: const Color(0xFFFFD700),
                            onTap: () {
                              // TODO: Premium satın alma ekranı
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Premium yakında!'), duration: Duration(seconds: 2)),
                              );
                            },
                          ),
                          _menuDivider(),
                          _MenuRow(
                            icon: CupertinoIcons.star_fill,
                            label: 'Bizi Değerlendir',
                            subtitle: 'Uygulamayı sevdin mi? 5 yıldız ver!',
                            color: AppColors.warning,
                            onTap: () async {
                              // TODO: Store URL'sini güncelle
                              const url = 'https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';
                              if (await canLaunchUrl(Uri.parse(url))) {
                                await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication);
                              }
                            },
                          ),
                          _menuDivider(),
                          _MenuRow(
                            icon: CupertinoIcons.share,
                            label: 'Uygulamayı Paylaş',
                            subtitle: 'Arkadaşlarına BeTaller\'ı anlat',
                            color: AppColors.cyan,
                            onTap: () {
                              SharePlus.instance.share(
                                ShareParams(text: 'BeTaller ile boy uzama potansiyelimi keşfettim! Sen de dene: https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app'),
                              );
                            },
                          ),
                          _menuDivider(),
                          _MenuRow(
                            icon: CupertinoIcons.mail_solid,
                            label: 'Geri Bildirim Ver',
                            subtitle: 'Bize ulaşın',
                            color: AppColors.sleep,
                            onTap: () async {
                              final uri = Uri(scheme: 'mailto', path: 'support@betaller.app', queryParameters: {'subject': 'BeTaller Geri Bildirim'});
                              if (await canLaunchUrl(uri)) {
                                await launchUrl(uri);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),

                    // ── Diğer ────────────────────────
                    GlassCard(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        children: [
                          _MenuRow(
                            icon: CupertinoIcons.info_circle,
                            label: 'Hakkında',
                            subtitle: 'Versiyon 1.0.0',
                            color: AppColors.primaryLight,
                            onTap: () => _showAboutDialog(context),
                          ),
                          _menuDivider(),
                          _MenuRow(
                            icon: CupertinoIcons.trash,
                            label: 'Tüm Verileri Sıfırla',
                            subtitle: 'Tüm veriler silinir',
                            color: AppColors.error,
                            onTap: () => _showResetDialog(context, provider),
                          ),
                        ],
                      ),
                    ),
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
    final earned = achievement['earned'] == true;
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(earned ? achievement['icon'] : '🔒', style: const TextStyle(fontSize: 48)),
            const SizedBox(height: 14),
            Text(
              achievement['title'],
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5),
            ),
            const SizedBox(height: 8),
            Text(
              achievement['description'],
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: AppColors.textSecondary),
            ),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              decoration: BoxDecoration(
                color: (earned ? AppColors.success : Colors.grey).withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                earned ? 'Kazanıldı!' : 'Henüz kazanılmadı',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: earned ? AppColors.success : AppColors.textSecondary,
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam', style: TextStyle(color: AppColors.primaryLight)),
          ),
        ],
      ),
    );
  }

  void _showEditProfileSheet(BuildContext context, AppProvider provider, UserProfile profile) {
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
              borderRadius: const BorderRadius.vertical(top: Radius.circular(28)),
              border: Border(top: BorderSide(color: Colors.white.withValues(alpha: 0.14))),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(width: 36, height: 4, decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.50), borderRadius: BorderRadius.circular(2))),
                  const SizedBox(height: 24),
                  const Text('Profili Düzenle', style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1)),
                  const SizedBox(height: 24),
                  _EditField(controller: nameCtrl, label: 'İsim', icon: CupertinoIcons.person),
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
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: gender == 'male' ? AppColors.primary : Colors.white.withValues(alpha: 0.1), width: gender == 'male' ? 1.5 : 0.5),
                            ),
                            child: Center(child: Text('Erkek', style: TextStyle(color: gender == 'male' ? Colors.white : Colors.white.withValues(alpha: 0.82), fontSize: 15, fontWeight: gender == 'male' ? FontWeight.w700 : FontWeight.w500))),
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
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: gender == 'female' ? AppColors.primary : Colors.white.withValues(alpha: 0.1), width: gender == 'female' ? 1.5 : 0.5),
                            ),
                            child: Center(child: Text('Kadın', style: TextStyle(color: gender == 'female' ? Colors.white : Colors.white.withValues(alpha: 0.82), fontSize: 15, fontWeight: gender == 'female' ? FontWeight.w700 : FontWeight.w500))),
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
                        locale: const Locale('tr', 'TR'),
                        builder: (context, child) => Theme(data: ThemeData.dark().copyWith(colorScheme: const ColorScheme.dark(primary: AppColors.primary, surface: AppColors.surfaceDark)), child: child!),
                      );
                      if (picked != null) setSheetState(() => birthDate = picked);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.12), borderRadius: BorderRadius.circular(14)),
                      child: Row(children: [
                        Icon(CupertinoIcons.calendar, color: Colors.white.withValues(alpha: 0.82), size: 18),
                        const SizedBox(width: 12),
                        Text('Doğum: ${birthDate.day.toString().padLeft(2, '0')}.${birthDate.month.toString().padLeft(2, '0')}.${birthDate.year}', style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600)),
                        const Spacer(),
                        Icon(CupertinoIcons.chevron_down, color: Colors.white.withValues(alpha: 0.45), size: 14),
                      ]),
                    ),
                  ),
                  const SizedBox(height: 12),
                  _EditField(controller: heightCtrl, label: 'Boy (cm)', icon: CupertinoIcons.resize_v, isNumber: true),
                  const SizedBox(height: 12),
                  _EditField(controller: weightCtrl, label: 'Kilo (kg)', icon: CupertinoIcons.gauge, isNumber: true),
                  const SizedBox(height: 12),
                  _EditField(controller: fatherCtrl, label: 'Baba Boyu (cm)', icon: CupertinoIcons.person, isNumber: true),
                  const SizedBox(height: 12),
                  _EditField(controller: motherCtrl, label: 'Anne Boyu (cm)', icon: CupertinoIcons.person, isNumber: true),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    child: CupertinoButton(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(14),
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
                      child: const Text('Kaydet', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16, color: Colors.white, letterSpacing: -0.3)),
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

  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Row(
          children: [
            Container(
              width: 32, height: 32,
              decoration: BoxDecoration(gradient: AppColors.gradientPrimary, borderRadius: BorderRadius.circular(8)),
              child: const Icon(CupertinoIcons.arrow_up_circle_fill, color: Colors.white, size: 18),
            ),
            const SizedBox(width: 10),
            const Text('BeTaller', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800)),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Büyüme Potansiyelini Keşfet',
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),
            ),
            const SizedBox(height: 10),
            Text(
              'Bu uygulama, boy uzama potansiyelinizi en üst düzeye çıkarmanız için tasarlanmıştır. Bilimsel verilere dayalı egzersiz rutinleri, beslenme takibi ve büyüme analizi sunar.',
              style: TextStyle(fontSize: 13, color: AppColors.textSecondary, height: 1.5),
            ),
            const SizedBox(height: 12),
            Text('Versiyon: 1.0.0', style: TextStyle(fontSize: 12, color: AppColors.textTertiary)),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Tamam', style: TextStyle(color: AppColors.primaryLight)),
          ),
        ],
      ),
    );
  }

  void _showResetDialog(BuildContext context, AppProvider provider) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.surfaceDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        title: Row(
          children: [
            const Icon(CupertinoIcons.exclamationmark_triangle, color: AppColors.warning, size: 22),
            const SizedBox(width: 10),
            const Text('Verileri Sıfırla', style: TextStyle(color: Colors.white)),
          ],
        ),
        content: Text(
          'Tüm veriler silinecek ve başlangıç ekranına döneceksin. Bu işlem geri alınamaz!',
          style: TextStyle(fontSize: 14, color: AppColors.textSecondary, height: 1.5),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('İptal', style: TextStyle(color: AppColors.textSecondary)),
          ),
          TextButton(
            onPressed: () {
              provider.resetAllData();
              Navigator.pop(context);
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (_) => const OnboardingScreen()),
                (route) => false,
              );
            },
            child: const Text('Sıfırla', style: TextStyle(color: AppColors.error, fontWeight: FontWeight.w600)),
          ),
        ],
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
                  Text(label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white, letterSpacing: -0.2)),
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
          borderRadius: BorderRadius.circular(16),
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
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
      ),
    );
  }
}
