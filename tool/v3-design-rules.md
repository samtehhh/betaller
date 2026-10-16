# BeTaller v3 design rules

Shared by everyone changing screens on the `v3` branch.

## Feel
Dark, premium, calm confidence. The app sells one idea: *you can get taller, and this is your plan*. Every screen should answer "what do I do now" and "am I moving up".

## Tokens (lib/utils/constants.dart, AppColors)
- Background `AppColors.scaffold`, cards `AppColors.cardFill` with a 1px `Colors.white @ 6%` border.
- Accent roles, one per meaning, never decorative:
  - `AppColors.lime`: growth, potential, progress up.
  - `AppColors.warning` (gold): achievements, trophies, streak milestones.
  - `AppColors.primary` / `primaryLight` (violet): brand, primary actions, measured data.
  - `AppColors.cyan`: water. `AppColors.sleepColor`: sleep. `AppColors.orange`: nutrition / protein.
- Radii: cards 24, inner tiles 16, chips and pills full, buttons 16.
- Type: one family (Inter on Android, SF on iOS, set by the theme). Headlines w900 with tight tracking (-0.5 to -1). Body 14-15. Labels 11-12 w700. Numbers are big and bold, units small and dimmed.
- No glow on everything. Use glow only on the single hero element of a screen.

## Rules
- Real data only, never `Random()` or invented users. Projections are labelled as targets or potential.
- Empty states invite the first action with one button.
- Every number a user cares about has a unit and a "what it means" line.
- Touch feedback through `lib/utils/haptics.dart` only: `Haptics.tap` on presses, `Haptics.select` on choices and picker detents, `Haptics.success` on completion and save, `Haptics.impact` on reveals and milestones.
- Respect `MediaQuery.disableAnimations`: animations collapse to their end state.
- No em dashes or en dashes in user-visible strings. Write strings for all 8 languages (en, tr, de, fr, es, it, pt, hi), informal "you".
- Free versus premium: a metered free tier (`lib/utils/free_tier.dart`, quota in AppProvider). Free users see everything and can always read it; acting is metered. The daily loop (ticking the plan and the program day, water, sleep, the nutrition checklist) is free on the first day; the guided workout, a posture check, a photo comparison, the weekly report, the score breakdown and an article are free once. Always free: home, the potential hero, height measurements and chart, the score number, the tour, settings and profile. Before use a metered action carries a lime "1 free" / "Free today" chip (`FreeChip`); after use the content stays on screen with a gold lock and one unlock button (`FreeLockBanner`, `ProgressLockedPreview`); the first tap after a quota ran out opens the short `FreeLimitSheet` once, later taps the paywall with a reason line. Gate a new action with `guardFree(context, feature)`, and never open a paywall on your own: `showPremiumPaywall` refuses a second one.
- Data safety: never rename or delete a stored field in AppProvider; add new fields with defaults. See `test/data_migration_test.dart`.

## Strings
Add keys with the scratch script pattern: put them in `tool/l10n_keys/<area>.json` (format `{"key": {"en": "...", "tr": "...", ..., "_types": {"n": "int"}}}`), then run `python tool/arb_add.py tool/l10n_keys/<area>.json` and `flutter gen-l10n`.
