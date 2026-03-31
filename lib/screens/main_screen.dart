import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../utils/constants.dart';
import 'home_screen.dart';
import 'analysis_screen.dart';
import 'routines_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final _screens = const [
    HomeScreen(),
    AnalysisScreen(),
    RoutinesScreen(),
    ProgressScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      extendBody: true,
      bottomNavigationBar: ClipRRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.scaffold.withValues(alpha: 0.88),
              border: Border(
                top: BorderSide(
                  color: Colors.white.withValues(alpha: 0.06),
                  width: 0.5,
                ),
              ),
            ),
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _NavItem(
                      icon: CupertinoIcons.house_fill,
                      label: 'Ana Sayfa',
                      selected: _currentIndex == 0,
                      onTap: () => setState(() => _currentIndex = 0),
                    ),
                    _NavItem(
                      icon: CupertinoIcons.chart_bar_fill,
                      label: 'Analiz',
                      selected: _currentIndex == 1,
                      onTap: () => setState(() => _currentIndex = 1),
                    ),
                    _NavItem(
                      icon: CupertinoIcons.bolt_fill,
                      label: 'Rutinler',
                      selected: _currentIndex == 2,
                      onTap: () => setState(() => _currentIndex = 2),
                    ),
                    _NavItem(
                      icon: CupertinoIcons.graph_square_fill,
                      label: 'İlerleme',
                      selected: _currentIndex == 3,
                      onTap: () => setState(() => _currentIndex = 3),
                    ),
                    _NavItem(
                      icon: CupertinoIcons.person_fill,
                      label: 'Profil',
                      selected: _currentIndex == 4,
                      onTap: () => setState(() => _currentIndex = 4),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool selected;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: SizedBox(
        width: 68,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: selected
                  ? AppColors.primary
                  : Colors.white.withValues(alpha: 0.42),
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                color: selected
                    ? AppColors.primary
                    : Colors.white.withValues(alpha: 0.42),
                fontSize: 11,
                fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
                letterSpacing: -0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
