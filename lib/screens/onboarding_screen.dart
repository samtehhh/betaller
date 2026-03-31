import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../models/user_profile.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';
import 'main_screen.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final _pageController = PageController();
  int _currentPage = 0;

  final _nameController = TextEditingController();
  String _gender = 'male';
  DateTime _birthDate = DateTime(2005, 1, 1);
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();
  final _fatherHeightController = TextEditingController();
  final _motherHeightController = TextEditingController();

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _heightController.dispose();
    _weightController.dispose();
    _fatherHeightController.dispose();
    _motherHeightController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      _saveProfile();
    }
  }

  void _prevPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
    }
  }

  bool _canProceed() {
    switch (_currentPage) {
      case 0: return true;
      case 1: return _nameController.text.trim().isNotEmpty;
      case 2: return _heightController.text.isNotEmpty && _weightController.text.isNotEmpty;
      case 3: return _fatherHeightController.text.isNotEmpty && _motherHeightController.text.isNotEmpty;
      default: return false;
    }
  }

  void _saveProfile() {
    if (!_canProceed()) return;
    final profile = UserProfile(
      name: _nameController.text.trim(),
      gender: _gender,
      birthDate: _birthDate.toIso8601String().substring(0, 10),
      currentHeight: double.tryParse(_heightController.text) ?? 170,
      weight: double.tryParse(_weightController.text) ?? 60,
      fatherHeight: double.tryParse(_fatherHeightController.text) ?? 175,
      motherHeight: double.tryParse(_motherHeightController.text) ?? 162,
    );
    context.read<AppProvider>().setProfile(profile);
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const MainScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF1E1B4B), Color(0xFF0F0A2E), Color(0xFF0A0A1A)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Progress indicators
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                child: Row(
                  children: List.generate(4, (index) {
                    return Expanded(
                      child: Container(
                        height: 3,
                        margin: const EdgeInsets.symmetric(horizontal: 3),
                        decoration: BoxDecoration(
                          color: index <= _currentPage
                              ? AppColors.primary
                              : Colors.white.withValues(alpha: 0.12),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: (page) => setState(() => _currentPage = page),
                  children: [
                    _buildWelcomePage(),
                    _buildPersonalInfoPage(),
                    _buildBodyInfoPage(),
                    _buildParentsInfoPage(),
                  ],
                ),
              ),
              // Navigation
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
                child: Row(
                  children: [
                    if (_currentPage > 0)
                      CupertinoButton(
                        onPressed: _prevPage,
                        child: Row(
                          children: [
                            Icon(CupertinoIcons.chevron_back, color: Colors.white.withValues(alpha: 0.85), size: 16),
                            const SizedBox(width: 4),
                            Text('Geri', style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 15)),
                          ],
                        ),
                      ),
                    const Spacer(),
                    CupertinoButton(
                      color: _canProceed() ? AppColors.primary : AppColors.primary.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(30),
                      padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
                      onPressed: _canProceed() ? _nextPage : null,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            _currentPage == 3 ? 'Başla' : 'Devam',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: _canProceed() ? Colors.white : Colors.white.withValues(alpha: 0.4),
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            _currentPage == 3 ? CupertinoIcons.checkmark : CupertinoIcons.arrow_right,
                            size: 16,
                            color: _canProceed() ? Colors.white : Colors.white.withValues(alpha: 0.4),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWelcomePage() {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 100, height: 100,
            decoration: BoxDecoration(
              gradient: AppColors.gradientPrimary,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.4),
                  blurRadius: 40,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: const Center(
              child: Icon(CupertinoIcons.arrow_up_circle_fill, color: Colors.white, size: 48),
            ),
          ),
          const SizedBox(height: 36),
          const Text(
            'BeTaller',
            style: TextStyle(
              fontSize: 52,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: -2,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Büyüme Potansiyelini Keşfet',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white.withValues(alpha: 0.78),
              fontWeight: FontWeight.w500,
              letterSpacing: 0.3,
            ),
          ),
          const SizedBox(height: 44),
          GlassCard(
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                _FeatureItem(icon: CupertinoIcons.arrow_up_right_circle, text: 'Genetik boy potansiyelini öğren'),
                const SizedBox(height: 18),
                _FeatureItem(icon: CupertinoIcons.bolt_fill, text: 'Günlük egzersiz rutinleri'),
                const SizedBox(height: 18),
                _FeatureItem(icon: CupertinoIcons.graph_square_fill, text: 'Boy gelişimini takip et'),
                const SizedBox(height: 18),
                _FeatureItem(icon: CupertinoIcons.star_fill, text: 'Başarımlar kazan'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPersonalInfoPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        const Text(
          'Seni Tanıyalım',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2),
        ),
        const SizedBox(height: 8),
        Text(
          'Sana özel bir program oluşturmamız için bilgilerine ihtiyacımız var.',
          style: TextStyle(color: Colors.white.withValues(alpha: 0.78), fontSize: 15, fontWeight: FontWeight.w400, height: 1.4, letterSpacing: -0.1),
        ),
        const SizedBox(height: 36),
        _buildInputField(controller: _nameController, label: 'Adın', icon: CupertinoIcons.person, onChanged: (_) => setState(() {})),
        const SizedBox(height: 20),
        Text('Cinsiyet', style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
        const SizedBox(height: 10),
        Row(children: [
          Expanded(child: _GenderCard(label: 'Erkek', icon: CupertinoIcons.person_fill, selected: _gender == 'male', onTap: () => setState(() => _gender = 'male'))),
          const SizedBox(width: 12),
          Expanded(child: _GenderCard(label: 'Kadın', icon: CupertinoIcons.person_fill, selected: _gender == 'female', onTap: () => setState(() => _gender = 'female'))),
        ]),
        const SizedBox(height: 20),
        Text('Doğum Tarihi', style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 13, fontWeight: FontWeight.w600, letterSpacing: 0.5)),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () async {
            final picked = await showDatePicker(
              context: context,
              initialDate: _birthDate,
              firstDate: DateTime(1990),
              lastDate: DateTime.now(),
              locale: const Locale('tr', 'TR'),
              builder: (context, child) {
                return Theme(
                  data: ThemeData.dark().copyWith(
                    colorScheme: const ColorScheme.dark(
                      primary: AppColors.primary,
                      surface: AppColors.surfaceDark,
                    ),
                  ),
                  child: child!,
                );
              },
            );
            if (picked != null) setState(() => _birthDate = picked);
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.06),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: Colors.white.withValues(alpha: 0.1)),
            ),
            child: Row(children: [
              Icon(CupertinoIcons.calendar, color: Colors.white.withValues(alpha: 0.4), size: 18),
              const SizedBox(width: 12),
              Text(
                '${_birthDate.day.toString().padLeft(2, '0')}.${_birthDate.month.toString().padLeft(2, '0')}.${_birthDate.year}',
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.2),
              ),
            ]),
          ),
        ),
      ]),
    );
  }

  Widget _buildBodyInfoPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        const Text(
          'Vücut Ölçülerin',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2),
        ),
        const SizedBox(height: 8),
        Text(
          'Mevcut boyunu ve kilonu gir.',
          style: TextStyle(color: Colors.white.withValues(alpha: 0.78), fontSize: 15, fontWeight: FontWeight.w400, letterSpacing: -0.1),
        ),
        const SizedBox(height: 36),
        _buildInputField(controller: _heightController, label: 'Boyun (cm)', icon: CupertinoIcons.resize_v, keyboardType: TextInputType.number, onChanged: (_) => setState(() {})),
        const SizedBox(height: 20),
        _buildInputField(controller: _weightController, label: 'Kilon (kg)', icon: CupertinoIcons.gauge, keyboardType: TextInputType.number, onChanged: (_) => setState(() {})),
        const SizedBox(height: 32),
        GlassCard(
          child: Row(children: [
            Icon(CupertinoIcons.lightbulb, color: AppColors.primaryLight, size: 20),
            const SizedBox(width: 12),
            Expanded(child: Text(
              'Sabah kalktığında ölç - en doğru sonuç sabah saatlerinde alınır.',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.78), fontSize: 13, fontWeight: FontWeight.w500, height: 1.4, letterSpacing: -0.1),
            )),
          ]),
        ),
      ]),
    );
  }

  Widget _buildParentsInfoPage() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const SizedBox(height: 20),
        const Text(
          'Aile Bilgileri',
          style: TextStyle(fontSize: 34, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -1.2),
        ),
        const SizedBox(height: 8),
        Text(
          'Genetik boy potansiyelini hesaplamak için anne ve baba boyunu gir.',
          style: TextStyle(color: Colors.white.withValues(alpha: 0.78), fontSize: 15, fontWeight: FontWeight.w400, height: 1.4, letterSpacing: -0.1),
        ),
        const SizedBox(height: 36),
        _buildInputField(controller: _fatherHeightController, label: 'Baba Boyu (cm)', icon: CupertinoIcons.person, keyboardType: TextInputType.number, onChanged: (_) => setState(() {})),
        const SizedBox(height: 20),
        _buildInputField(controller: _motherHeightController, label: 'Anne Boyu (cm)', icon: CupertinoIcons.person, keyboardType: TextInputType.number, onChanged: (_) => setState(() {})),
        const SizedBox(height: 32),
        GlassCard(
          child: Row(children: [
            Icon(CupertinoIcons.lab_flask, color: AppColors.primaryLight, size: 20),
            const SizedBox(width: 12),
            Expanded(child: Text(
              'Khamis-Roche yöntemi ile genetik potansiyelin hesaplanacak. Bu bilgiler yalnızca cihazında saklanır.',
              style: TextStyle(color: Colors.white.withValues(alpha: 0.78), fontSize: 13, fontWeight: FontWeight.w500, height: 1.4, letterSpacing: -0.1),
            )),
          ]),
        ),
      ]),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    ValueChanged<String>? onChanged,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      onChanged: onChanged,
      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600, letterSpacing: -0.2),
      cursorColor: AppColors.primary,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.white.withValues(alpha: 0.4), fontWeight: FontWeight.w500),
        prefixIcon: Icon(icon, color: Colors.white.withValues(alpha: 0.50), size: 18),
        filled: true,
        fillColor: Colors.white.withValues(alpha: 0.06),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: BorderSide(color: Colors.white.withValues(alpha: 0.1))),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(14), borderSide: const BorderSide(color: AppColors.primary, width: 1.5)),
      ),
    );
  }
}

class _FeatureItem extends StatelessWidget {
  final IconData icon;
  final String text;
  const _FeatureItem({required this.icon, required this.text});
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Container(
        width: 36, height: 36,
        decoration: BoxDecoration(
          color: AppColors.primary.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: AppColors.primaryLight, size: 18),
      ),
      const SizedBox(width: 14),
      Expanded(child: Text(
        text,
        style: TextStyle(color: Colors.white.withValues(alpha: 0.92), fontSize: 15, fontWeight: FontWeight.w500, letterSpacing: -0.2),
      )),
    ]);
  }
}

class _GenderCard extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool selected;
  final VoidCallback onTap;
  const _GenderCard({required this.label, required this.icon, required this.selected, required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(vertical: 18),
        decoration: BoxDecoration(
          color: selected ? AppColors.primary.withValues(alpha: 0.2) : Colors.white.withValues(alpha: 0.05),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.primary : Colors.white.withValues(alpha: 0.1),
            width: selected ? 1.5 : 0.5,
          ),
        ),
        child: Column(children: [
          Icon(icon, color: selected ? AppColors.primaryLight : Colors.white.withValues(alpha: 0.4), size: 28),
          const SizedBox(height: 8),
          Text(label, style: TextStyle(
            color: selected ? Colors.white : Colors.white.withValues(alpha: 0.78),
            fontSize: 15,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
          )),
        ]),
      ),
    );
  }
}
