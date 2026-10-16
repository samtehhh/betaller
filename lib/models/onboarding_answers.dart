/// Stable ids for the onboarding answers that live in
/// `AppProvider.onboardingAnswers`.
///
/// These strings are stored on the device. They are never shown to the user
/// (each screen maps them to its own localized label) and must never be
/// renamed: an id that changes turns every saved answer into an unknown one.
/// New options get new ids; old ones stay.
abstract final class OnboardingIds {
  /// `whyTaller`: why the user wants to be taller. A list, in the order the
  /// user picked them, so the first one is the main reason.
  static const whyTaller = [
    'confidence',
    'impression',
    'sports',
    'clothes',
    'photos',
    'potential',
  ];

  /// `triedApps`: whether the user has used another height app.
  static const triedApps = ['stopped', 'still', 'first'];

  /// `blockers`: what gets in the way. A list, in the order picked, so the
  /// first one is the one the user felt most.
  static const blockers = [
    'forget',
    'time',
    'exercises',
    'motivation',
    'bedtime',
    'meals',
  ];

  /// `firstWhenTaller`: the first thing the user wants to do once taller.
  static const firstWhenTaller = [
    'wardrobe',
    'muscle',
    'photos',
    'team',
    'feelGood',
  ];
}
