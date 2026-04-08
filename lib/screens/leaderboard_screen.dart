import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../l10n/app_localizations.dart';
import '../providers/app_provider.dart';
import '../utils/constants.dart';

// ─────────────────────────────────────────────────────────────────
//  Synthetic peer data model
// ─────────────────────────────────────────────────────────────────

class _PeerEntry {
  final String username;
  final int level;
  final int xp;
  final int streak;
  final bool isYou;

  const _PeerEntry({
    required this.username,
    required this.level,
    required this.xp,
    required this.streak,
    this.isYou = false,
  });
}

List<_PeerEntry> _generatePeers(
  int userAge,
  String gender,
  int userXP,
  int userLevel,
  int userStreak,
) {
  // Deterministic seed based on age + gender so rankings are stable across restarts
  final seed = userAge * 1000 + (gender == 'male' ? 1 : 2);
  final rng = math.Random(seed);

  const adjectives = [
    'Silent',
    'Iron',
    'Tall',
    'Bold',
    'Quick',
    'Brave',
    'Wild',
    'Sharp',
    'Calm',
    'Steel',
    'Dark',
    'Bright',
    'Storm',
    'Pure',
    'Free',
    'Strong',
    'Apex',
    'Elite',
    'Prime',
    'Rapid',
  ];
  const nouns = [
    'Wolf',
    'Eagle',
    'Tiger',
    'Falcon',
    'Phoenix',
    'Lion',
    'Bear',
    'Hawk',
    'Cobra',
    'Dragon',
    'Panther',
    'Shark',
    'Viper',
    'Raven',
    'Stallion',
    'Jaguar',
    'Stag',
    'Kraken',
    'Titan',
    'Hydra',
  ];

  final peers = <_PeerEntry>[];
  for (int i = 0; i < 50; i++) {
    final adj = adjectives[rng.nextInt(adjectives.length)];
    final noun = nouns[rng.nextInt(nouns.length)];
    final num = rng.nextInt(99) + 1;
    final username = '$adj$noun$num';
    final lvl = 1 + rng.nextInt(20);
    final xp = lvl * 250 + rng.nextInt(300);
    final streak = rng.nextInt(60);
    peers.add(_PeerEntry(
      username: username,
      level: lvl,
      xp: xp,
      streak: streak,
    ));
  }

  // Add user
  peers.add(_PeerEntry(
    username: 'YOU',
    level: userLevel,
    xp: userXP,
    streak: userStreak,
    isYou: true,
  ));

  // Sort by XP desc
  peers.sort((a, b) => b.xp.compareTo(a.xp));

  return peers;
}

// ─────────────────────────────────────────────────────────────────
//  Leaderboard Screen
// ─────────────────────────────────────────────────────────────────

class LeaderboardScreen extends StatefulWidget {
  const LeaderboardScreen({super.key});

  @override
  State<LeaderboardScreen> createState() => _LeaderboardScreenState();
}

class _LeaderboardScreenState extends State<LeaderboardScreen> {
  final ScrollController _scrollController = ScrollController();
  List<_PeerEntry> _peers = const [];
  int _userIndex = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _buildAndScroll());
  }

  void _buildAndScroll() {
    final provider = context.read<AppProvider>();
    final age = provider.profile?.age ?? 18;
    final gender = provider.profile?.gender ?? 'male';
    final peers = _generatePeers(
      age,
      gender,
      provider.totalXP,
      provider.level,
      provider.streak,
    );
    final idx = peers.indexWhere((p) => p.isYou);
    setState(() {
      _peers = peers;
      _userIndex = idx < 0 ? 0 : idx;
    });

    // Auto-scroll to user position (rough estimate of row height ~72)
    if (_scrollController.hasClients && _userIndex > 3) {
      final target = (_userIndex * 72.0).clamp(
        0.0,
        _scrollController.position.maxScrollExtent,
      );
      _scrollController.animateTo(
        target,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeOutCubic,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Intentionally unused localization reference (consistent with other screens).
    AppLocalizations.of(context);

    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: _peers.isEmpty
          ? const Center(
              child: CircularProgressIndicator(color: AppColors.primary),
            )
          : _buildContent(),
    );
  }

  Widget _buildContent() {
    final provider = context.watch<AppProvider>();
    final userRank = _userIndex + 1;
    final percentile = provider.peerPercentile;
    final topPct = (100 - percentile).clamp(1, 100);

    final top3 = _peers.take(3).toList();
    final rest = _peers; // full list including top 3

    return CustomScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      slivers: [
        // ── App Bar / Header ──
        SliverAppBar(
          expandedHeight: 140,
          pinned: true,
          backgroundColor: AppColors.surfaceDark,
          leading: IconButton(
            icon: const Icon(CupertinoIcons.back, color: Colors.white),
            onPressed: () {
              HapticFeedback.lightImpact();
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Leaderboard',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0F0B24), Color(0xFF070B1A)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 50,
                    left: 16,
                    right: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'LEADERBOARD',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w900,
                          color: AppColors.primary,
                          letterSpacing: 2.0,
                          shadows: [
                            Shadow(
                              color: AppColors.primary.withValues(alpha: 0.6),
                              blurRadius: 16,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Your age group · Anonymous',
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.textTertiary,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        // ── Body padding ──
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              // 1. USER RANK HERO CARD
              _UserRankHeroCard(
                rank: userRank,
                topPct: topPct,
                level: provider.level,
                xp: provider.totalXP,
                streak: provider.streak,
              ),
              const SizedBox(height: 24),

              // 2. TOP 3 PODIUM
              SectionHeader(
                icon: CupertinoIcons.rosette,
                title: 'Top 3 Champions',
                iconColor: AppColors.warning,
              ),
              const SizedBox(height: 12),
              _PodiumCard(top3: top3),
              const SizedBox(height: 24),

              // 3. FULL LEADERBOARD LIST HEADER
              SectionHeader(
                icon: CupertinoIcons.list_number,
                title: 'Full Ranking',
                iconColor: AppColors.lime,
              ),
              const SizedBox(height: 12),
            ]),
          ),
        ),

        // Full leaderboard sliver list
        SliverPadding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 40),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final peer = rest[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: _LeaderboardRow(
                    rank: index + 1,
                    peer: peer,
                  ),
                );
              },
              childCount: rest.length,
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────
//  User Rank Hero Card
// ─────────────────────────────────────────────────────────────────

class _UserRankHeroCard extends StatelessWidget {
  final int rank;
  final int topPct;
  final int level;
  final int xp;
  final int streak;

  const _UserRankHeroCard({
    required this.rank,
    required this.topPct,
    required this.level,
    required this.xp,
    required this.streak,
  });

  @override
  Widget build(BuildContext context) {
    return GlassCard(
      glowColor: AppColors.warning.withValues(alpha: 0.30),
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            'YOUR RANK',
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: AppColors.textTertiary,
              letterSpacing: 1.8,
            ),
          ),
          const SizedBox(height: 8),
          // Big rank number
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) => const LinearGradient(
              colors: [Color(0xFFF5C542), Color(0xFFFF8A00)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(bounds),
            child: Text(
              '#$rank',
              style: TextStyle(
                fontSize: 64,
                fontWeight: FontWeight.w900,
                letterSpacing: 1.5,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: AppColors.warning.withValues(alpha: 0.6),
                    blurRadius: 24,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.warning.withValues(alpha: 0.25),
                  AppColors.orange.withValues(alpha: 0.18),
                ],
              ),
              borderRadius: BorderRadius.circular(999),
              border: Border.all(
                color: AppColors.warning.withValues(alpha: 0.45),
                width: 1,
              ),
            ),
            child: Text(
              'TOP $topPct%',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w800,
                color: AppColors.warning,
                letterSpacing: 1.4,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // Divider
          Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.06),
          ),
          const SizedBox(height: 16),
          // Stats row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _HeroStat(
                label: 'LEVEL',
                value: '$level',
                color: AppColors.primary,
                icon: CupertinoIcons.star_fill,
              ),
              Container(
                width: 1,
                height: 36,
                color: Colors.white.withValues(alpha: 0.08),
              ),
              _HeroStat(
                label: 'XP',
                value: _formatXp(xp),
                color: AppColors.cyan,
                icon: CupertinoIcons.bolt_fill,
              ),
              Container(
                width: 1,
                height: 36,
                color: Colors.white.withValues(alpha: 0.08),
              ),
              _HeroStat(
                label: 'STREAK',
                value: '$streak',
                color: AppColors.orange,
                icon: CupertinoIcons.flame_fill,
              ),
            ],
          ),
        ],
      ),
    );
  }

  String _formatXp(int xp) {
    if (xp >= 1000) {
      return '${(xp / 1000).toStringAsFixed(1)}k';
    }
    return '$xp';
  }
}

class _HeroStat extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  final IconData icon;

  const _HeroStat({
    required this.label,
    required this.value,
    required this.color,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: color, size: 16),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: Colors.white,
            shadows: [
              Shadow(
                color: color.withValues(alpha: 0.6),
                blurRadius: 10,
              ),
            ],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w700,
            color: AppColors.textTertiary,
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────
//  Podium Card (Top 3)
// ─────────────────────────────────────────────────────────────────

class _PodiumCard extends StatelessWidget {
  final List<_PeerEntry> top3;

  const _PodiumCard({required this.top3});

  @override
  Widget build(BuildContext context) {
    // Ensure we always have 3 entries
    final first = top3.isNotEmpty ? top3[0] : null;
    final second = top3.length > 1 ? top3[1] : null;
    final third = top3.length > 2 ? top3[2] : null;

    return GlassCard(
      glowColor: AppColors.warning.withValues(alpha: 0.20),
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // 2nd
          Expanded(
            child: second != null
                ? _PodiumColumn(
                    peer: second,
                    position: 2,
                    height: 90,
                    color: const Color(0xFFC0C0C0), // Silver
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(width: 8),
          // 1st
          Expanded(
            child: first != null
                ? _PodiumColumn(
                    peer: first,
                    position: 1,
                    height: 120,
                    color: AppColors.warning, // Gold
                    isChampion: true,
                  )
                : const SizedBox.shrink(),
          ),
          const SizedBox(width: 8),
          // 3rd
          Expanded(
            child: third != null
                ? _PodiumColumn(
                    peer: third,
                    position: 3,
                    height: 70,
                    color: const Color(0xFFCD7F32), // Bronze
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }
}

class _PodiumColumn extends StatelessWidget {
  final _PeerEntry peer;
  final int position;
  final double height;
  final Color color;
  final bool isChampion;

  const _PodiumColumn({
    required this.peer,
    required this.position,
    required this.height,
    required this.color,
    this.isChampion = false,
  });

  @override
  Widget build(BuildContext context) {
    final avatarSize = isChampion ? 58.0 : 46.0;
    final initials = peer.username.length >= 2
        ? peer.username.substring(0, 2).toUpperCase()
        : peer.username.toUpperCase();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isChampion)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Icon(
              CupertinoIcons.rosette,
              color: color,
              size: 22,
              shadows: [
                Shadow(
                  color: color.withValues(alpha: 0.8),
                  blurRadius: 12,
                ),
              ],
            ),
          ),
        // Avatar
        Container(
          width: avatarSize,
          height: avatarSize,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              colors: peer.isYou
                  ? [AppColors.primary, AppColors.primaryDark]
                  : [color, color.withValues(alpha: 0.6)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            border: Border.all(
              color: peer.isYou
                  ? AppColors.primaryBright
                  : color.withValues(alpha: 0.9),
              width: 2,
            ),
            boxShadow: [
              BoxShadow(
                color: (peer.isYou ? AppColors.primary : color)
                    .withValues(alpha: 0.55),
                blurRadius: 16,
              ),
            ],
          ),
          child: Center(
            child: Text(
              initials,
              style: TextStyle(
                fontSize: isChampion ? 20 : 16,
                fontWeight: FontWeight.w800,
                color: Colors.white,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        // Username (truncated)
        Text(
          peer.isYou ? 'YOU' : peer.username,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w800,
            color: peer.isYou ? AppColors.primaryBright : Colors.white,
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          '${peer.xp} XP',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: AppColors.textTertiary,
          ),
        ),
        const SizedBox(height: 8),
        // Podium pillar
        Container(
          height: height,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                color.withValues(alpha: 0.35),
                color.withValues(alpha: 0.08),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(10),
            ),
            border: Border(
              top: BorderSide(color: color.withValues(alpha: 0.7), width: 2),
              left: BorderSide(color: color.withValues(alpha: 0.25)),
              right: BorderSide(color: color.withValues(alpha: 0.25)),
            ),
            boxShadow: [
              BoxShadow(
                color: color.withValues(alpha: 0.30),
                blurRadius: 18,
                offset: const Offset(0, -4),
              ),
            ],
          ),
          child: Center(
            child: Text(
              '$position',
              style: TextStyle(
                fontSize: isChampion ? 28 : 22,
                fontWeight: FontWeight.w900,
                color: color,
                shadows: [
                  Shadow(
                    color: color.withValues(alpha: 0.8),
                    blurRadius: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────
//  Leaderboard Row
// ─────────────────────────────────────────────────────────────────

class _LeaderboardRow extends StatelessWidget {
  final int rank;
  final _PeerEntry peer;

  const _LeaderboardRow({
    required this.rank,
    required this.peer,
  });

  @override
  Widget build(BuildContext context) {
    final isYou = peer.isYou;
    final initials = peer.username.length >= 2
        ? peer.username.substring(0, 2).toUpperCase()
        : peer.username.toUpperCase();

    // Rank color accent for top 3
    Color rankColor = AppColors.textTertiary;
    if (rank == 1) rankColor = AppColors.warning;
    if (rank == 2) rankColor = const Color(0xFFC0C0C0);
    if (rank == 3) rankColor = const Color(0xFFCD7F32);

    return GestureDetector(
      onTap: () => HapticFeedback.selectionClick(),
      child: Container(
        decoration: BoxDecoration(
          gradient: isYou
              ? LinearGradient(
                  colors: [
                    AppColors.primary.withValues(alpha: 0.28),
                    AppColors.primaryDark.withValues(alpha: 0.20),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : const LinearGradient(
                  colors: [Color(0xFF141432), Color(0xFF0B0B22)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: isYou
                ? AppColors.primary.withValues(alpha: 0.7)
                : Colors.white.withValues(alpha: 0.06),
            width: isYou ? 1.5 : 1,
          ),
          boxShadow: isYou
              ? [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.45),
                    blurRadius: 20,
                    offset: const Offset(0, 0),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.30),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            // Rank number
            SizedBox(
              width: 34,
              child: Text(
                '#$rank',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w800,
                  color: rankColor,
                  shadows: rank <= 3
                      ? [
                          Shadow(
                            color: rankColor.withValues(alpha: 0.6),
                            blurRadius: 8,
                          ),
                        ]
                      : null,
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Avatar
            Container(
              width: 38,
              height: 38,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: isYou
                      ? [AppColors.primary, AppColors.primaryDark]
                      : [
                          AppColors.cardFillLight,
                          AppColors.cardFill,
                        ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(
                  color: isYou
                      ? AppColors.primaryBright
                      : Colors.white.withValues(alpha: 0.12),
                  width: 1.2,
                ),
              ),
              child: Center(
                child: Text(
                  initials,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),
            // Username
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isYou ? 'YOU' : peer.username,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: isYou
                          ? AppColors.primaryBright
                          : Colors.white,
                      letterSpacing: 0.2,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.flame_fill,
                        size: 10,
                        color: AppColors.orange.withValues(alpha: 0.85),
                      ),
                      const SizedBox(width: 3),
                      Text(
                        '${peer.streak}',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textTertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Level badge
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                gradient: isYou
                    ? AppColors.gradientGrowth
                    : LinearGradient(
                        colors: [
                          AppColors.primary.withValues(alpha: 0.25),
                          AppColors.primaryDark.withValues(alpha: 0.18),
                        ],
                      ),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.primary.withValues(alpha: 0.45),
                  width: 0.8,
                ),
              ),
              child: Text(
                'LV ${peer.level}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                  letterSpacing: 0.8,
                ),
              ),
            ),
            const SizedBox(width: 10),
            // XP
            SizedBox(
              width: 62,
              child: Text(
                '${peer.xp} XP',
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  color: isYou ? AppColors.lime : AppColors.cyan,
                  shadows: [
                    Shadow(
                      color: (isYou ? AppColors.lime : AppColors.cyan)
                          .withValues(alpha: 0.5),
                      blurRadius: 8,
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
}
