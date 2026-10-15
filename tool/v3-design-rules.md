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
- Free versus premium: free users must be able to run the daily loop. Premium unlocks depth (history, analysis detail, the program, photo comparisons), and a locked area shows what is inside, blurred, with one clear unlock button.
- Data safety: never rename or delete a stored field in AppProvider; add new fields with defaults. See `test/data_migration_test.dart`.

## Strings
Add keys with the scratch script pattern: put them in `tool/l10n_keys/<area>.json` (format `{"key": {"en": "...", "tr": "...", ..., "_types": {"n": "int"}}}`), then run `python tool/arb_add.py tool/l10n_keys/<area>.json` and `flutter gen-l10n`.
