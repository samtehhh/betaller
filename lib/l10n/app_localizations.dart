import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart';
import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_fr.dart';
import 'app_localizations_hi.dart';
import 'app_localizations_it.dart';
import 'app_localizations_pt.dart';
import 'app_localizations_tr.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en'),
    Locale('es'),
    Locale('fr'),
    Locale('hi'),
    Locale('it'),
    Locale('pt'),
    Locale('tr'),
  ];

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get navAnalysis;

  /// No description provided for @navRoutines.
  ///
  /// In en, this message translates to:
  /// **'Routines'**
  String get navRoutines;

  /// No description provided for @navProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get navProgress;

  /// No description provided for @navProfile.
  ///
  /// In en, this message translates to:
  /// **'Profile'**
  String get navProfile;

  /// No description provided for @greeting.
  ///
  /// In en, this message translates to:
  /// **'Hello, {name}'**
  String greeting(String name);

  /// No description provided for @currentHeight.
  ///
  /// In en, this message translates to:
  /// **'Current Height'**
  String get currentHeight;

  /// No description provided for @target.
  ///
  /// In en, this message translates to:
  /// **'Target'**
  String get target;

  /// No description provided for @completed.
  ///
  /// In en, this message translates to:
  /// **'{pct}% completed'**
  String completed(String pct);

  /// No description provided for @remaining.
  ///
  /// In en, this message translates to:
  /// **'+{cm} cm left'**
  String remaining(String cm);

  /// No description provided for @updateAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Update Analysis'**
  String get updateAnalysis;

  /// No description provided for @analysisSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Get predictions from past heights + habits'**
  String get analysisSubtitle;

  /// No description provided for @dailyRoutines.
  ///
  /// In en, this message translates to:
  /// **'Daily Routines'**
  String get dailyRoutines;

  /// No description provided for @allRoutinesDone.
  ///
  /// In en, this message translates to:
  /// **'All routines completed!'**
  String get allRoutinesDone;

  /// No description provided for @water.
  ///
  /// In en, this message translates to:
  /// **'Water'**
  String get water;

  /// No description provided for @sleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get sleep;

  /// No description provided for @growthSummary.
  ///
  /// In en, this message translates to:
  /// **'Growth Summary'**
  String get growthSummary;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'TOTAL'**
  String get total;

  /// No description provided for @last.
  ///
  /// In en, this message translates to:
  /// **'LAST'**
  String get last;

  /// No description provided for @measurement.
  ///
  /// In en, this message translates to:
  /// **'MEAS.'**
  String get measurement;

  /// No description provided for @dailyTip.
  ///
  /// In en, this message translates to:
  /// **'Tip of the Day'**
  String get dailyTip;

  /// No description provided for @waterTracking.
  ///
  /// In en, this message translates to:
  /// **'Water Tracking'**
  String get waterTracking;

  /// No description provided for @waterToday.
  ///
  /// In en, this message translates to:
  /// **'Today: {amount} L'**
  String waterToday(String amount);

  /// No description provided for @sleepTracking.
  ///
  /// In en, this message translates to:
  /// **'Sleep Tracking'**
  String get sleepTracking;

  /// No description provided for @sleepTarget.
  ///
  /// In en, this message translates to:
  /// **'Target: {hours} hours'**
  String sleepTarget(String hours);

  /// No description provided for @hours.
  ///
  /// In en, this message translates to:
  /// **'hours'**
  String get hours;

  /// No description provided for @save.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @analysis.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get analysis;

  /// No description provided for @betallerScore.
  ///
  /// In en, this message translates to:
  /// **'BeTaller Score'**
  String get betallerScore;

  /// No description provided for @genetic.
  ///
  /// In en, this message translates to:
  /// **'Genetic'**
  String get genetic;

  /// No description provided for @growth.
  ///
  /// In en, this message translates to:
  /// **'Growth'**
  String get growth;

  /// No description provided for @nutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get nutrition;

  /// No description provided for @sleepLabel.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get sleepLabel;

  /// No description provided for @discipline.
  ///
  /// In en, this message translates to:
  /// **'Discipline'**
  String get discipline;

  /// No description provided for @improveScore.
  ///
  /// In en, this message translates to:
  /// **'Boost Your Score'**
  String get improveScore;

  /// No description provided for @gradeProgress.
  ///
  /// In en, this message translates to:
  /// **'{current} → {next}'**
  String gradeProgress(String current, String next);

  /// No description provided for @nutritionCritical.
  ///
  /// In en, this message translates to:
  /// **'Nutrition Critical!'**
  String get nutritionCritical;

  /// No description provided for @nutritionStrengthen.
  ///
  /// In en, this message translates to:
  /// **'Strengthen Nutrition'**
  String get nutritionStrengthen;

  /// No description provided for @sleepRecordAdd.
  ///
  /// In en, this message translates to:
  /// **'Add Sleep Record'**
  String get sleepRecordAdd;

  /// No description provided for @sleepPoor.
  ///
  /// In en, this message translates to:
  /// **'Poor Sleep Schedule'**
  String get sleepPoor;

  /// No description provided for @sleepImprove.
  ///
  /// In en, this message translates to:
  /// **'Improve Sleep'**
  String get sleepImprove;

  /// No description provided for @startToday.
  ///
  /// In en, this message translates to:
  /// **'Start Today!'**
  String get startToday;

  /// No description provided for @routinesRemaining.
  ///
  /// In en, this message translates to:
  /// **'{count} Routines Left'**
  String routinesRemaining(int count);

  /// No description provided for @keepStreak.
  ///
  /// In en, this message translates to:
  /// **'Keep the Streak'**
  String get keepStreak;

  /// No description provided for @addFirstMeasurement.
  ///
  /// In en, this message translates to:
  /// **'Add First Measurement'**
  String get addFirstMeasurement;

  /// No description provided for @addMeasurement.
  ///
  /// In en, this message translates to:
  /// **'Add Measurement'**
  String get addMeasurement;

  /// No description provided for @waterHalfNotReached.
  ///
  /// In en, this message translates to:
  /// **'You haven\'t reached half your water goal today. Drink {amount}L more.'**
  String waterHalfNotReached(String amount);

  /// No description provided for @waterAlmostDone.
  ///
  /// In en, this message translates to:
  /// **'{amount}L left to reach water goal. Almost there!'**
  String waterAlmostDone(String amount);

  /// No description provided for @bmiLow.
  ///
  /// In en, this message translates to:
  /// **'Your BMI is {bmi} — a bit low. Increase protein and calorie intake.'**
  String bmiLow(String bmi);

  /// No description provided for @bmiHigh.
  ///
  /// In en, this message translates to:
  /// **'Your BMI is {bmi} — a bit high. Focus on healthy eating.'**
  String bmiHigh(String bmi);

  /// No description provided for @nutritionDefault.
  ///
  /// In en, this message translates to:
  /// **'Complete your water goal and maintain balanced nutrition.'**
  String get nutritionDefault;

  /// No description provided for @sleepNoRecord.
  ///
  /// In en, this message translates to:
  /// **'No sleep record today. Aim for {hours} hours and log it.'**
  String sleepNoRecord(String hours);

  /// No description provided for @sleepInsufficient.
  ///
  /// In en, this message translates to:
  /// **'You slept {current} hours today — {missing} hours short. Go to bed earlier!'**
  String sleepInsufficient(String current, String missing);

  /// No description provided for @sleepAlmost.
  ///
  /// In en, this message translates to:
  /// **'Almost there. Reaching {hours} hours will maximize growth hormone.'**
  String sleepAlmost(String hours);

  /// No description provided for @sleepGood.
  ///
  /// In en, this message translates to:
  /// **'Great sleep schedule! Keep it up.'**
  String get sleepGood;

  /// No description provided for @noRoutinesDone.
  ///
  /// In en, this message translates to:
  /// **'No routines completed today. Start with one of {total}!'**
  String noRoutinesDone(int total);

  /// No description provided for @routinesPartial.
  ///
  /// In en, this message translates to:
  /// **'{done}/{total} routines done today. {left} more to go!'**
  String routinesPartial(int done, int total, int left);

  /// No description provided for @streakBuilding.
  ///
  /// In en, this message translates to:
  /// **'Great job today! {needed} more days to start a streak.'**
  String streakBuilding(int needed);

  /// No description provided for @streakContinue.
  ///
  /// In en, this message translates to:
  /// **'{days} day streak! Your score rises as you continue.'**
  String streakContinue(int days);

  /// No description provided for @noMeasurements.
  ///
  /// In en, this message translates to:
  /// **'No height measurements yet. Add your first for accurate predictions.'**
  String get noMeasurements;

  /// No description provided for @fewMeasurements.
  ///
  /// In en, this message translates to:
  /// **'Add {count} more measurements to calculate growth velocity.'**
  String fewMeasurements(int count);

  /// No description provided for @goodMeasurements.
  ///
  /// In en, this message translates to:
  /// **'You have {count} measurements. Reaching 5 will greatly improve accuracy.'**
  String goodMeasurements(int count);

  /// No description provided for @keepMeasuring.
  ///
  /// In en, this message translates to:
  /// **'Keep adding measurements. Every new data point improves predictions.'**
  String get keepMeasuring;

  /// No description provided for @heightPrediction.
  ///
  /// In en, this message translates to:
  /// **'Height Prediction'**
  String get heightPrediction;

  /// No description provided for @predictedHeightAt21.
  ///
  /// In en, this message translates to:
  /// **'Predicted height at 21'**
  String get predictedHeightAt21;

  /// No description provided for @predictionMethod.
  ///
  /// In en, this message translates to:
  /// **'Calculated by combining genetic (parents), growth velocity, BMI and age data.'**
  String get predictionMethod;

  /// No description provided for @growthStatus.
  ///
  /// In en, this message translates to:
  /// **'Growth Status'**
  String get growthStatus;

  /// No description provided for @geneticGainLabel.
  ///
  /// In en, this message translates to:
  /// **'Genetic Gain'**
  String get geneticGainLabel;

  /// No description provided for @lifestyleLabel.
  ///
  /// In en, this message translates to:
  /// **'Lifestyle'**
  String get lifestyleLabel;

  /// No description provided for @geneticCeilingLabel.
  ///
  /// In en, this message translates to:
  /// **'Ceiling'**
  String get geneticCeilingLabel;

  /// No description provided for @reachableTargetHeight.
  ///
  /// In en, this message translates to:
  /// **'Your reachable target height'**
  String get reachableTargetHeight;

  /// No description provided for @geneticCeilingProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress toward genetic ceiling'**
  String get geneticCeilingProgress;

  /// No description provided for @completionLabel.
  ///
  /// In en, this message translates to:
  /// **'COMPLETION'**
  String get completionLabel;

  /// No description provided for @growthVelocity.
  ///
  /// In en, this message translates to:
  /// **'GROWTH VELOCITY'**
  String get growthVelocity;

  /// No description provided for @noData.
  ///
  /// In en, this message translates to:
  /// **'NO DATA'**
  String get noData;

  /// No description provided for @growthRate.
  ///
  /// In en, this message translates to:
  /// **'Growth rate: {rating}'**
  String growthRate(String rating);

  /// No description provided for @bmi.
  ///
  /// In en, this message translates to:
  /// **'BMI'**
  String get bmi;

  /// No description provided for @calories.
  ///
  /// In en, this message translates to:
  /// **'Calories'**
  String get calories;

  /// No description provided for @kcalDay.
  ///
  /// In en, this message translates to:
  /// **'kcal/day'**
  String get kcalDay;

  /// No description provided for @daily.
  ///
  /// In en, this message translates to:
  /// **'daily'**
  String get daily;

  /// No description provided for @protein.
  ///
  /// In en, this message translates to:
  /// **'Protein'**
  String get protein;

  /// No description provided for @minimum.
  ///
  /// In en, this message translates to:
  /// **'minimum'**
  String get minimum;

  /// No description provided for @age.
  ///
  /// In en, this message translates to:
  /// **'Age'**
  String get age;

  /// No description provided for @male.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get male;

  /// No description provided for @female.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get female;

  /// No description provided for @yearlyPrediction.
  ///
  /// In en, this message translates to:
  /// **'YEARLY PREDICTION'**
  String get yearlyPrediction;

  /// No description provided for @ageYear.
  ///
  /// In en, this message translates to:
  /// **'{age} yrs'**
  String ageYear(int age);

  /// No description provided for @progressTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress Tracking'**
  String get progressTitle;

  /// No description provided for @totalGrowth.
  ///
  /// In en, this message translates to:
  /// **'Total'**
  String get totalGrowth;

  /// No description provided for @lastDiff.
  ///
  /// In en, this message translates to:
  /// **'Last Diff'**
  String get lastDiff;

  /// No description provided for @measurementCount.
  ///
  /// In en, this message translates to:
  /// **'Meas.'**
  String get measurementCount;

  /// No description provided for @heightChart.
  ///
  /// In en, this message translates to:
  /// **'Height Chart'**
  String get heightChart;

  /// No description provided for @chartMinData.
  ///
  /// In en, this message translates to:
  /// **'At least 2 measurements needed for chart'**
  String get chartMinData;

  /// No description provided for @chartInstruction.
  ///
  /// In en, this message translates to:
  /// **'Add measurements to see your progress chart!'**
  String get chartInstruction;

  /// No description provided for @addMeasurementButton.
  ///
  /// In en, this message translates to:
  /// **'ADD NEW MEASUREMENT'**
  String get addMeasurementButton;

  /// No description provided for @measurementHistory.
  ///
  /// In en, this message translates to:
  /// **'MEASUREMENT HISTORY'**
  String get measurementHistory;

  /// No description provided for @deleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Measurement'**
  String get deleteTitle;

  /// No description provided for @deleteMessage.
  ///
  /// In en, this message translates to:
  /// **'Are you sure you want to delete this measurement?'**
  String get deleteMessage;

  /// No description provided for @dismiss.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get dismiss;

  /// No description provided for @delete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get delete;

  /// No description provided for @newMeasurement.
  ///
  /// In en, this message translates to:
  /// **'New Height Measurement'**
  String get newMeasurement;

  /// No description provided for @routines.
  ///
  /// In en, this message translates to:
  /// **'Routines'**
  String get routines;

  /// No description provided for @streakDays.
  ///
  /// In en, this message translates to:
  /// **'{days} Days'**
  String streakDays(int days);

  /// No description provided for @progressStatus.
  ///
  /// In en, this message translates to:
  /// **'Progress Status'**
  String get progressStatus;

  /// No description provided for @completedLabel.
  ///
  /// In en, this message translates to:
  /// **'Completed!'**
  String get completedLabel;

  /// No description provided for @all.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get all;

  /// No description provided for @exercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get exercise;

  /// No description provided for @posture.
  ///
  /// In en, this message translates to:
  /// **'Posture'**
  String get posture;

  /// No description provided for @bestStreak.
  ///
  /// In en, this message translates to:
  /// **'Best: {days} days'**
  String bestStreak(int days);

  /// No description provided for @editProfile.
  ///
  /// In en, this message translates to:
  /// **'Edit Profile'**
  String get editProfile;

  /// No description provided for @editProfileSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Update height, weight, age info'**
  String get editProfileSubtitle;

  /// No description provided for @name.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get name;

  /// No description provided for @birthDate.
  ///
  /// In en, this message translates to:
  /// **'Birth: {date}'**
  String birthDate(String date);

  /// No description provided for @heightCm.
  ///
  /// In en, this message translates to:
  /// **'Height (cm)'**
  String get heightCm;

  /// No description provided for @weightKg.
  ///
  /// In en, this message translates to:
  /// **'Weight (kg)'**
  String get weightKg;

  /// No description provided for @fatherHeight.
  ///
  /// In en, this message translates to:
  /// **'Father\'s Height (cm)'**
  String get fatherHeight;

  /// No description provided for @motherHeight.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s Height (cm)'**
  String get motherHeight;

  /// No description provided for @notifications.
  ///
  /// In en, this message translates to:
  /// **'Notifications'**
  String get notifications;

  /// No description provided for @notificationsOn.
  ///
  /// In en, this message translates to:
  /// **'Reminders active'**
  String get notificationsOn;

  /// No description provided for @notificationsOff.
  ///
  /// In en, this message translates to:
  /// **'Reminders off'**
  String get notificationsOff;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Upgrade to Premium'**
  String get premium;

  /// No description provided for @premiumSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Unlock all features'**
  String get premiumSubtitle;

  /// No description provided for @rateUs.
  ///
  /// In en, this message translates to:
  /// **'Rate Us'**
  String get rateUs;

  /// No description provided for @rateSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Enjoying the app? Give us 5 stars!'**
  String get rateSubtitle;

  /// No description provided for @share.
  ///
  /// In en, this message translates to:
  /// **'Share App'**
  String get share;

  /// No description provided for @shareSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Tell your friends about BeTaller'**
  String get shareSubtitle;

  /// No description provided for @shareText.
  ///
  /// In en, this message translates to:
  /// **'I discovered my growth potential with BeTaller! Try it too: https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app'**
  String get shareText;

  /// No description provided for @feedback.
  ///
  /// In en, this message translates to:
  /// **'Give Feedback'**
  String get feedback;

  /// No description provided for @feedbackSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Contact us'**
  String get feedbackSubtitle;

  /// No description provided for @resetData.
  ///
  /// In en, this message translates to:
  /// **'Reset All Data'**
  String get resetData;

  /// No description provided for @resetSubtitle.
  ///
  /// In en, this message translates to:
  /// **'All data will be deleted'**
  String get resetSubtitle;

  /// No description provided for @resetTitle.
  ///
  /// In en, this message translates to:
  /// **'Reset Data'**
  String get resetTitle;

  /// No description provided for @resetMessage.
  ///
  /// In en, this message translates to:
  /// **'All data will be deleted and you\'ll return to the onboarding screen. This cannot be undone!'**
  String get resetMessage;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get reset;

  /// No description provided for @premiumSoon.
  ///
  /// In en, this message translates to:
  /// **'Premium coming soon!'**
  String get premiumSoon;

  /// No description provided for @brandingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover your growth potential'**
  String get brandingSubtitle;

  /// No description provided for @statistics.
  ///
  /// In en, this message translates to:
  /// **'Statistics'**
  String get statistics;

  /// No description provided for @currentStreak.
  ///
  /// In en, this message translates to:
  /// **'Current Streak'**
  String get currentStreak;

  /// No description provided for @bestStreakLabel.
  ///
  /// In en, this message translates to:
  /// **'Best Streak'**
  String get bestStreakLabel;

  /// No description provided for @achievementLabel.
  ///
  /// In en, this message translates to:
  /// **'Achievement'**
  String get achievementLabel;

  /// No description provided for @achievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements'**
  String get achievements;

  /// No description provided for @earned.
  ///
  /// In en, this message translates to:
  /// **'Earned!'**
  String get earned;

  /// No description provided for @notEarned.
  ///
  /// In en, this message translates to:
  /// **'Not yet earned'**
  String get notEarned;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @languageSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Change app language'**
  String get languageSubtitle;

  /// No description provided for @onboardingTitle.
  ///
  /// In en, this message translates to:
  /// **'BeTaller'**
  String get onboardingTitle;

  /// No description provided for @onboardingSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Discover your growth potential'**
  String get onboardingSubtitle;

  /// No description provided for @onboardingMeetYou.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Get to Know You'**
  String get onboardingMeetYou;

  /// No description provided for @onboardingInfoNeeded.
  ///
  /// In en, this message translates to:
  /// **'Basic info needed for analysis.'**
  String get onboardingInfoNeeded;

  /// No description provided for @gender.
  ///
  /// In en, this message translates to:
  /// **'GENDER'**
  String get gender;

  /// No description provided for @birthDateLabel.
  ///
  /// In en, this message translates to:
  /// **'BIRTH DATE'**
  String get birthDateLabel;

  /// No description provided for @bodyMeasurements.
  ///
  /// In en, this message translates to:
  /// **'Body Measurements'**
  String get bodyMeasurements;

  /// No description provided for @bodyInfo.
  ///
  /// In en, this message translates to:
  /// **'Your current height and weight are needed for analysis.'**
  String get bodyInfo;

  /// No description provided for @geneticData.
  ///
  /// In en, this message translates to:
  /// **'Genetic Data'**
  String get geneticData;

  /// No description provided for @geneticInfo.
  ///
  /// In en, this message translates to:
  /// **'Parent heights determine your genetic potential.'**
  String get geneticInfo;

  /// No description provided for @pastHeights.
  ///
  /// In en, this message translates to:
  /// **'Past Heights'**
  String get pastHeights;

  /// No description provided for @pastHeightsInfo.
  ///
  /// In en, this message translates to:
  /// **'Enter heights you remember at different ages. You can leave blanks.'**
  String get pastHeightsInfo;

  /// No description provided for @heightHint.
  ///
  /// In en, this message translates to:
  /// **'Enter height...'**
  String get heightHint;

  /// No description provided for @ageLabel.
  ///
  /// In en, this message translates to:
  /// **'age'**
  String get ageLabel;

  /// No description provided for @habits.
  ///
  /// In en, this message translates to:
  /// **'Your Habits'**
  String get habits;

  /// No description provided for @habitsInfo.
  ///
  /// In en, this message translates to:
  /// **'Your lifestyle directly affects predictions.'**
  String get habitsInfo;

  /// No description provided for @weeklyExercise.
  ///
  /// In en, this message translates to:
  /// **'Weekly Exercise'**
  String get weeklyExercise;

  /// No description provided for @dailySleep.
  ///
  /// In en, this message translates to:
  /// **'Daily Sleep'**
  String get dailySleep;

  /// No description provided for @nutritionQuality.
  ///
  /// In en, this message translates to:
  /// **'NUTRITION QUALITY'**
  String get nutritionQuality;

  /// No description provided for @nutritionDesc.
  ///
  /// In en, this message translates to:
  /// **'Protein, dairy, vegetables, fruit intake'**
  String get nutritionDesc;

  /// No description provided for @nutritionBad.
  ///
  /// In en, this message translates to:
  /// **'Bad'**
  String get nutritionBad;

  /// No description provided for @nutritionPoor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get nutritionPoor;

  /// No description provided for @nutritionMedium.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get nutritionMedium;

  /// No description provided for @nutritionGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get nutritionGood;

  /// No description provided for @nutritionGreat.
  ///
  /// In en, this message translates to:
  /// **'Great'**
  String get nutritionGreat;

  /// No description provided for @startAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Start Analysis'**
  String get startAnalysis;

  /// No description provided for @continueBtn.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get continueBtn;

  /// No description provided for @analyzeBtn.
  ///
  /// In en, this message translates to:
  /// **'Analyze'**
  String get analyzeBtn;

  /// No description provided for @analyzing.
  ///
  /// In en, this message translates to:
  /// **'Analyzing'**
  String get analyzing;

  /// No description provided for @analysisComplete.
  ///
  /// In en, this message translates to:
  /// **'Completed!'**
  String get analysisComplete;

  /// No description provided for @yourScore.
  ///
  /// In en, this message translates to:
  /// **'Your BeTaller Score'**
  String get yourScore;

  /// No description provided for @letsStart.
  ///
  /// In en, this message translates to:
  /// **'Let\'s Start'**
  String get letsStart;

  /// No description provided for @doneBtn.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get doneBtn;

  /// No description provided for @analysisStep1.
  ///
  /// In en, this message translates to:
  /// **'Analyzing genetic data...'**
  String get analysisStep1;

  /// No description provided for @analysisStep2.
  ///
  /// In en, this message translates to:
  /// **'Calculating growth velocity...'**
  String get analysisStep2;

  /// No description provided for @analysisStep3.
  ///
  /// In en, this message translates to:
  /// **'Processing nutrition and sleep data...'**
  String get analysisStep3;

  /// No description provided for @analysisStep4.
  ///
  /// In en, this message translates to:
  /// **'Generating height prediction...'**
  String get analysisStep4;

  /// No description provided for @analysisStep5.
  ///
  /// In en, this message translates to:
  /// **'Calculating BeTaller score...'**
  String get analysisStep5;

  /// No description provided for @growthPotential.
  ///
  /// In en, this message translates to:
  /// **'+{cm} cm growth potential'**
  String growthPotential(String cm);

  /// No description provided for @heightAt21.
  ///
  /// In en, this message translates to:
  /// **'at age 21'**
  String get heightAt21;

  /// No description provided for @confidenceLevel.
  ///
  /// In en, this message translates to:
  /// **'{pct}% confidence level'**
  String confidenceLevel(String pct);

  /// No description provided for @heightRange.
  ///
  /// In en, this message translates to:
  /// **'{min} - {max} cm range'**
  String heightRange(String min, String max);

  /// No description provided for @currentLabel.
  ///
  /// In en, this message translates to:
  /// **'CURRENT'**
  String get currentLabel;

  /// No description provided for @predictedLabel.
  ///
  /// In en, this message translates to:
  /// **'PREDICTED'**
  String get predictedLabel;

  /// No description provided for @yearlyPredictions.
  ///
  /// In en, this message translates to:
  /// **'Yearly Predictions'**
  String get yearlyPredictions;

  /// No description provided for @tipMorningMeasure.
  ///
  /// In en, this message translates to:
  /// **'Measure height in the morning - disc pressure causes height loss during the day. Most accurate measurement is in the morning.'**
  String get tipMorningMeasure;

  /// No description provided for @tipProteinSpread.
  ///
  /// In en, this message translates to:
  /// **'Spread protein intake across meals. Don\'t eat all at once, have protein with every meal.'**
  String get tipProteinSpread;

  /// No description provided for @tipGrowthHormone.
  ///
  /// In en, this message translates to:
  /// **'Growth hormone peaks during sleep. Be asleep between 10 PM-2 AM!'**
  String get tipGrowthHormone;

  /// No description provided for @tipVitaminD.
  ///
  /// In en, this message translates to:
  /// **'15 minutes of daily sun exposure increases vitamin D production. Vitamin D is essential for calcium absorption.'**
  String get tipVitaminD;

  /// No description provided for @tipBarHanging.
  ///
  /// In en, this message translates to:
  /// **'Bar hanging decompresses the spine. Try 3x30 seconds daily.'**
  String get tipBarHanging;

  /// No description provided for @tipSwimming.
  ///
  /// In en, this message translates to:
  /// **'Swimming is the best sport for full-body workout and height growth support.'**
  String get tipSwimming;

  /// No description provided for @tipStress.
  ///
  /// In en, this message translates to:
  /// **'Stress suppresses growth hormone. Reduce stress with meditation and yoga.'**
  String get tipStress;

  /// No description provided for @routineMorningStretch.
  ///
  /// In en, this message translates to:
  /// **'Morning Stretching'**
  String get routineMorningStretch;

  /// No description provided for @routineMorningStretchDesc.
  ///
  /// In en, this message translates to:
  /// **'Do 10 minutes of stretching right after waking up. Stretch spine and leg muscles.'**
  String get routineMorningStretchDesc;

  /// No description provided for @routineBarHanging.
  ///
  /// In en, this message translates to:
  /// **'Bar Hanging'**
  String get routineBarHanging;

  /// No description provided for @routineBarHangingDesc.
  ///
  /// In en, this message translates to:
  /// **'Hang from a pull-up bar to extend the spine. 3 sets x 30 seconds.'**
  String get routineBarHangingDesc;

  /// No description provided for @routineCobraStretch.
  ///
  /// In en, this message translates to:
  /// **'Cobra Stretch'**
  String get routineCobraStretch;

  /// No description provided for @routineCobraStretchDesc.
  ///
  /// In en, this message translates to:
  /// **'Lie face down and lift upper body. Stretch the spine. 3 sets x 15 seconds.'**
  String get routineCobraStretchDesc;

  /// No description provided for @routineJumping.
  ///
  /// In en, this message translates to:
  /// **'Jumping Exercises'**
  String get routineJumping;

  /// No description provided for @routineJumpingDesc.
  ///
  /// In en, this message translates to:
  /// **'Jump rope or squat jumps. Stimulates growth plates. 3 sets x 20 reps.'**
  String get routineJumpingDesc;

  /// No description provided for @routineSwimming.
  ///
  /// In en, this message translates to:
  /// **'Swimming or Basketball'**
  String get routineSwimming;

  /// No description provided for @routineSwimmingDesc.
  ///
  /// In en, this message translates to:
  /// **'Do a sport that supports height growth. At least 30 minutes.'**
  String get routineSwimmingDesc;

  /// No description provided for @routineYoga.
  ///
  /// In en, this message translates to:
  /// **'Evening Yoga & Stretching'**
  String get routineYoga;

  /// No description provided for @routineYogaDesc.
  ///
  /// In en, this message translates to:
  /// **'Yoga and stretching routine before bed. Release stress, relax muscles.'**
  String get routineYogaDesc;

  /// No description provided for @routineProtein.
  ///
  /// In en, this message translates to:
  /// **'Protein Intake'**
  String get routineProtein;

  /// No description provided for @routineProteinDesc.
  ///
  /// In en, this message translates to:
  /// **'Eggs, chicken, fish, dairy. At least 1.5g/kg protein daily.'**
  String get routineProteinDesc;

  /// No description provided for @routineCalcium.
  ///
  /// In en, this message translates to:
  /// **'Calcium & Vitamin D'**
  String get routineCalcium;

  /// No description provided for @routineCalciumDesc.
  ///
  /// In en, this message translates to:
  /// **'Consume milk, cheese, yogurt. Sunbathe 15 min. Critical for bone development.'**
  String get routineCalciumDesc;

  /// No description provided for @routineWater.
  ///
  /// In en, this message translates to:
  /// **'Water Intake Goal'**
  String get routineWater;

  /// No description provided for @routineWaterDesc.
  ///
  /// In en, this message translates to:
  /// **'Drink at least 2-3 liters of water daily. Essential for metabolism and growth.'**
  String get routineWaterDesc;

  /// No description provided for @routineAvoidJunk.
  ///
  /// In en, this message translates to:
  /// **'Avoid Junk Food'**
  String get routineAvoidJunk;

  /// No description provided for @routineAvoidJunkDesc.
  ///
  /// In en, this message translates to:
  /// **'Stay away from fast food, sugary drinks and processed foods.'**
  String get routineAvoidJunkDesc;

  /// No description provided for @routineSleep.
  ///
  /// In en, this message translates to:
  /// **'Quality Sleep (8-10 hrs)'**
  String get routineSleep;

  /// No description provided for @routineSleepDesc.
  ///
  /// In en, this message translates to:
  /// **'Growth hormone is released during sleep. 10 PM-6 AM are golden hours.'**
  String get routineSleepDesc;

  /// No description provided for @routineNoScreen.
  ///
  /// In en, this message translates to:
  /// **'Screen Break Before Bed'**
  String get routineNoScreen;

  /// No description provided for @routineNoScreenDesc.
  ///
  /// In en, this message translates to:
  /// **'Put away phone and computer 1 hour before bed. Don\'t block melatonin production.'**
  String get routineNoScreenDesc;

  /// No description provided for @routinePosture.
  ///
  /// In en, this message translates to:
  /// **'Posture Check'**
  String get routinePosture;

  /// No description provided for @routinePostureDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep back straight, shoulders back. Check every hour. Good posture = 2-3 cm difference.'**
  String get routinePostureDesc;

  /// No description provided for @routineWallStand.
  ///
  /// In en, this message translates to:
  /// **'Wall Stand Exercise'**
  String get routineWallStand;

  /// No description provided for @routineWallStandDesc.
  ///
  /// In en, this message translates to:
  /// **'Lean back against wall: heels, hips, shoulders, head touching wall. Hold 5 min.'**
  String get routineWallStandDesc;

  /// No description provided for @routineSprintIntervals.
  ///
  /// In en, this message translates to:
  /// **'Sprint Interval Training'**
  String get routineSprintIntervals;

  /// No description provided for @routineSprintIntervalsDesc.
  ///
  /// In en, this message translates to:
  /// **'Sprint interval training triggers significant growth hormone release through high-intensity bursts.'**
  String get routineSprintIntervalsDesc;

  /// No description provided for @routineHiitWorkout.
  ///
  /// In en, this message translates to:
  /// **'HIIT Workout'**
  String get routineHiitWorkout;

  /// No description provided for @routineHiitWorkoutDesc.
  ///
  /// In en, this message translates to:
  /// **'High intensity interval training to maximize growth hormone release.'**
  String get routineHiitWorkoutDesc;

  /// No description provided for @routineSquats.
  ///
  /// In en, this message translates to:
  /// **'Bodyweight Squats'**
  String get routineSquats;

  /// No description provided for @routineSquatsDesc.
  ///
  /// In en, this message translates to:
  /// **'Bodyweight squats stimulate growth plates in legs and spine.'**
  String get routineSquatsDesc;

  /// No description provided for @routineDeadliftStretch.
  ///
  /// In en, this message translates to:
  /// **'Deadlift Stretch'**
  String get routineDeadliftStretch;

  /// No description provided for @routineDeadliftStretchDesc.
  ///
  /// In en, this message translates to:
  /// **'Deadlift stretch for spinal decompression and vertebral disc health.'**
  String get routineDeadliftStretchDesc;

  /// No description provided for @routineOverheadPress.
  ///
  /// In en, this message translates to:
  /// **'Overhead Press'**
  String get routineOverheadPress;

  /// No description provided for @routineOverheadPressDesc.
  ///
  /// In en, this message translates to:
  /// **'Overhead pressing stretches the spine and strengthens posture muscles.'**
  String get routineOverheadPressDesc;

  /// No description provided for @routineSkippingRope.
  ///
  /// In en, this message translates to:
  /// **'Skipping Rope'**
  String get routineSkippingRope;

  /// No description provided for @routineSkippingRopeDesc.
  ///
  /// In en, this message translates to:
  /// **'Repetitive jumping with a skipping rope stimulates growth plates in lower extremities.'**
  String get routineSkippingRopeDesc;

  /// No description provided for @routinePilatesCore.
  ///
  /// In en, this message translates to:
  /// **'Pilates Core'**
  String get routinePilatesCore;

  /// No description provided for @routinePilatesCoreDesc.
  ///
  /// In en, this message translates to:
  /// **'Pilates core exercises support spinal alignment and posture.'**
  String get routinePilatesCoreDesc;

  /// No description provided for @routineInversionHang.
  ///
  /// In en, this message translates to:
  /// **'Inversion Hanging'**
  String get routineInversionHang;

  /// No description provided for @routineInversionHangDesc.
  ///
  /// In en, this message translates to:
  /// **'Inversion decompresses spinal discs, can temporarily add 1-2cm.'**
  String get routineInversionHangDesc;

  /// No description provided for @routineZincIntake.
  ///
  /// In en, this message translates to:
  /// **'Zinc Rich Foods'**
  String get routineZincIntake;

  /// No description provided for @routineZincIntakeDesc.
  ///
  /// In en, this message translates to:
  /// **'Consume zinc-rich foods throughout the day for growth hormone production.'**
  String get routineZincIntakeDesc;

  /// No description provided for @routineVitaminDSunlight.
  ///
  /// In en, this message translates to:
  /// **'Vitamin D & Sunlight'**
  String get routineVitaminDSunlight;

  /// No description provided for @routineVitaminDSunlightDesc.
  ///
  /// In en, this message translates to:
  /// **'Get at least 15 minutes of direct sunlight for Vitamin D synthesis and bone growth.'**
  String get routineVitaminDSunlightDesc;

  /// No description provided for @routineArginineFoods.
  ///
  /// In en, this message translates to:
  /// **'Arginine Rich Foods'**
  String get routineArginineFoods;

  /// No description provided for @routineArginineFoodsDesc.
  ///
  /// In en, this message translates to:
  /// **'Eat arginine-rich foods to stimulate growth hormone secretion.'**
  String get routineArginineFoodsDesc;

  /// No description provided for @routineSleepEnvironment.
  ///
  /// In en, this message translates to:
  /// **'Optimize Sleep Environment'**
  String get routineSleepEnvironment;

  /// No description provided for @routineSleepEnvironmentDesc.
  ///
  /// In en, this message translates to:
  /// **'Create a dark, cool sleeping environment to maximize melatonin and growth hormone release.'**
  String get routineSleepEnvironmentDesc;

  /// No description provided for @routinePreSleepRoutine.
  ///
  /// In en, this message translates to:
  /// **'Pre-Sleep Wind Down'**
  String get routinePreSleepRoutine;

  /// No description provided for @routinePreSleepRoutineDesc.
  ///
  /// In en, this message translates to:
  /// **'A consistent pre-sleep routine improves deep sleep quality by 23%.'**
  String get routinePreSleepRoutineDesc;

  /// No description provided for @routineNeckStretches.
  ///
  /// In en, this message translates to:
  /// **'Neck Stretches'**
  String get routineNeckStretches;

  /// No description provided for @routineNeckStretchesDesc.
  ///
  /// In en, this message translates to:
  /// **'Neck stretches relieve compression and improve cervical alignment.'**
  String get routineNeckStretchesDesc;

  /// No description provided for @routineShoulderRolls.
  ///
  /// In en, this message translates to:
  /// **'Shoulder Rolls & Opens'**
  String get routineShoulderRolls;

  /// No description provided for @routineShoulderRollsDesc.
  ///
  /// In en, this message translates to:
  /// **'Opening shoulders corrects forward posture, can add 1-2cm in appearance.'**
  String get routineShoulderRollsDesc;

  /// No description provided for @achieveFirstDay.
  ///
  /// In en, this message translates to:
  /// **'First Step'**
  String get achieveFirstDay;

  /// No description provided for @achieveFirstDayDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete your first day'**
  String get achieveFirstDayDesc;

  /// No description provided for @achieveThreeStreak.
  ///
  /// In en, this message translates to:
  /// **'3 Day Streak'**
  String get achieveThreeStreak;

  /// No description provided for @achieveThreeStreakDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete routines 3 days in a row'**
  String get achieveThreeStreakDesc;

  /// No description provided for @achieveWeekStreak.
  ///
  /// In en, this message translates to:
  /// **'7 Day Streak'**
  String get achieveWeekStreak;

  /// No description provided for @achieveWeekStreakDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete routines 7 days in a row'**
  String get achieveWeekStreakDesc;

  /// No description provided for @achieveTwoWeekStreak.
  ///
  /// In en, this message translates to:
  /// **'14 Day Streak'**
  String get achieveTwoWeekStreak;

  /// No description provided for @achieveTwoWeekStreakDesc.
  ///
  /// In en, this message translates to:
  /// **'Keep going for 14 days straight'**
  String get achieveTwoWeekStreakDesc;

  /// No description provided for @achieveMonthStreak.
  ///
  /// In en, this message translates to:
  /// **'30 Day Streak'**
  String get achieveMonthStreak;

  /// No description provided for @achieveMonthStreakDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 30 days in a row'**
  String get achieveMonthStreakDesc;

  /// No description provided for @achieveTwoMonthStreak.
  ///
  /// In en, this message translates to:
  /// **'60 Day Streak'**
  String get achieveTwoMonthStreak;

  /// No description provided for @achieveTwoMonthStreakDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 60 days in a row'**
  String get achieveTwoMonthStreakDesc;

  /// No description provided for @achieveHundredStreak.
  ///
  /// In en, this message translates to:
  /// **'100 Day Streak'**
  String get achieveHundredStreak;

  /// No description provided for @achieveHundredStreakDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 100 days in a row'**
  String get achieveHundredStreakDesc;

  /// No description provided for @achieveFirstMeasure.
  ///
  /// In en, this message translates to:
  /// **'First Measurement'**
  String get achieveFirstMeasure;

  /// No description provided for @achieveFirstMeasureDesc.
  ///
  /// In en, this message translates to:
  /// **'Record your first height measurement'**
  String get achieveFirstMeasureDesc;

  /// No description provided for @achieveThreeMeasures.
  ///
  /// In en, this message translates to:
  /// **'Tracker'**
  String get achieveThreeMeasures;

  /// No description provided for @achieveThreeMeasuresDesc.
  ///
  /// In en, this message translates to:
  /// **'Record 3 height measurements'**
  String get achieveThreeMeasuresDesc;

  /// No description provided for @achieveFiveMeasures.
  ///
  /// In en, this message translates to:
  /// **'Regular Tracking'**
  String get achieveFiveMeasures;

  /// No description provided for @achieveFiveMeasuresDesc.
  ///
  /// In en, this message translates to:
  /// **'Record 5 height measurements'**
  String get achieveFiveMeasuresDesc;

  /// No description provided for @achieveTenMeasures.
  ///
  /// In en, this message translates to:
  /// **'Data Hunter'**
  String get achieveTenMeasures;

  /// No description provided for @achieveTenMeasuresDesc.
  ///
  /// In en, this message translates to:
  /// **'Record 10 height measurements'**
  String get achieveTenMeasuresDesc;

  /// No description provided for @achieveFirstCm.
  ///
  /// In en, this message translates to:
  /// **'First Centimeter'**
  String get achieveFirstCm;

  /// No description provided for @achieveFirstCmDesc.
  ///
  /// In en, this message translates to:
  /// **'Record 1 cm total growth'**
  String get achieveFirstCmDesc;

  /// No description provided for @achieveThreeCm.
  ///
  /// In en, this message translates to:
  /// **'3 cm Growth'**
  String get achieveThreeCm;

  /// No description provided for @achieveThreeCmDesc.
  ///
  /// In en, this message translates to:
  /// **'Record 3 cm total growth'**
  String get achieveThreeCmDesc;

  /// No description provided for @achieveFiveCm.
  ///
  /// In en, this message translates to:
  /// **'5 cm Growth'**
  String get achieveFiveCm;

  /// No description provided for @achieveFiveCmDesc.
  ///
  /// In en, this message translates to:
  /// **'Record 5 cm total growth'**
  String get achieveFiveCmDesc;

  /// No description provided for @achieveTenCm.
  ///
  /// In en, this message translates to:
  /// **'10 cm Growth'**
  String get achieveTenCm;

  /// No description provided for @achieveTenCmDesc.
  ///
  /// In en, this message translates to:
  /// **'Record 10 cm total growth'**
  String get achieveTenCmDesc;

  /// No description provided for @quote1.
  ///
  /// In en, this message translates to:
  /// **'Be better than yesterday, every day.'**
  String get quote1;

  /// No description provided for @quote2.
  ///
  /// In en, this message translates to:
  /// **'Growth doesn\'t happen overnight, but every night brings you closer.'**
  String get quote2;

  /// No description provided for @quote3.
  ///
  /// In en, this message translates to:
  /// **'Growth takes patience, keep going!'**
  String get quote3;

  /// No description provided for @quote4.
  ///
  /// In en, this message translates to:
  /// **'The step you take today builds tomorrow\'s foundation.'**
  String get quote4;

  /// No description provided for @quote5.
  ///
  /// In en, this message translates to:
  /// **'Discipline starts where motivation ends.'**
  String get quote5;

  /// No description provided for @quote6.
  ///
  /// In en, this message translates to:
  /// **'Your body will thank you, keep going!'**
  String get quote6;

  /// No description provided for @quote7.
  ///
  /// In en, this message translates to:
  /// **'You set the limits of your potential.'**
  String get quote7;

  /// No description provided for @quote8.
  ///
  /// In en, this message translates to:
  /// **'Small steps create big changes.'**
  String get quote8;

  /// No description provided for @quote9.
  ///
  /// In en, this message translates to:
  /// **'The best investment is in yourself.'**
  String get quote9;

  /// No description provided for @quote10.
  ///
  /// In en, this message translates to:
  /// **'You\'re getting closer to your goal every day.'**
  String get quote10;

  /// No description provided for @quote11.
  ///
  /// In en, this message translates to:
  /// **'Change is hard, but regret is harder.'**
  String get quote11;

  /// No description provided for @quote12.
  ///
  /// In en, this message translates to:
  /// **'Your body is a temple, take care of it.'**
  String get quote12;

  /// No description provided for @quote13.
  ///
  /// In en, this message translates to:
  /// **'Your rival is yesterday\'s you. Beat it today!'**
  String get quote13;

  /// No description provided for @quote14.
  ///
  /// In en, this message translates to:
  /// **'BeTaller = Patience + Discipline + Belief'**
  String get quote14;

  /// No description provided for @quote15.
  ///
  /// In en, this message translates to:
  /// **'Believe in yourself, the process will shape you.'**
  String get quote15;

  /// No description provided for @quote16.
  ///
  /// In en, this message translates to:
  /// **'Don\'t say I can\'t today, don\'t regret tomorrow.'**
  String get quote16;

  /// No description provided for @quote17.
  ///
  /// In en, this message translates to:
  /// **'Show progress every day, even if it\'s just 1%.'**
  String get quote17;

  /// No description provided for @quote18.
  ///
  /// In en, this message translates to:
  /// **'The mirror will show your progress, be patient.'**
  String get quote18;

  /// No description provided for @bmiNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get bmiNormal;

  /// No description provided for @bmiUnderweight.
  ///
  /// In en, this message translates to:
  /// **'Underweight'**
  String get bmiUnderweight;

  /// No description provided for @bmiOverweight.
  ///
  /// In en, this message translates to:
  /// **'Overweight'**
  String get bmiOverweight;

  /// No description provided for @bmiObese.
  ///
  /// In en, this message translates to:
  /// **'Obese'**
  String get bmiObese;

  /// No description provided for @velocityExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get velocityExcellent;

  /// No description provided for @velocityNormal.
  ///
  /// In en, this message translates to:
  /// **'Normal'**
  String get velocityNormal;

  /// No description provided for @velocitySlow.
  ///
  /// In en, this message translates to:
  /// **'Slow'**
  String get velocitySlow;

  /// No description provided for @velocityVeryLow.
  ///
  /// In en, this message translates to:
  /// **'Very Low'**
  String get velocityVeryLow;

  /// No description provided for @durationMinutes.
  ///
  /// In en, this message translates to:
  /// **'{min} min'**
  String durationMinutes(String min);

  /// No description provided for @durationAllDay.
  ///
  /// In en, this message translates to:
  /// **'All day'**
  String get durationAllDay;

  /// No description provided for @durationNight.
  ///
  /// In en, this message translates to:
  /// **'Night'**
  String get durationNight;

  /// No description provided for @durationHours.
  ///
  /// In en, this message translates to:
  /// **'{hours} hours'**
  String durationHours(String hours);

  /// No description provided for @onboardingStep1.
  ///
  /// In en, this message translates to:
  /// **'Enter your personal info'**
  String get onboardingStep1;

  /// No description provided for @onboardingStep2.
  ///
  /// In en, this message translates to:
  /// **'Share your past heights'**
  String get onboardingStep2;

  /// No description provided for @onboardingStep3.
  ///
  /// In en, this message translates to:
  /// **'Evaluate your habits'**
  String get onboardingStep3;

  /// No description provided for @onboardingStep4.
  ///
  /// In en, this message translates to:
  /// **'See your prediction and score'**
  String get onboardingStep4;

  /// No description provided for @hoursShort.
  ///
  /// In en, this message translates to:
  /// **'hr'**
  String get hoursShort;

  /// No description provided for @selectLanguage.
  ///
  /// In en, this message translates to:
  /// **'Select Language'**
  String get selectLanguage;

  /// No description provided for @systemLanguage.
  ///
  /// In en, this message translates to:
  /// **'System Language'**
  String get systemLanguage;

  /// No description provided for @emailSubject.
  ///
  /// In en, this message translates to:
  /// **'BeTaller Feedback'**
  String get emailSubject;

  /// No description provided for @pastHeightsTip.
  ///
  /// In en, this message translates to:
  /// **'You can leave unknown ages blank. Entering 1-2 past heights is enough.'**
  String get pastHeightsTip;

  String get obPastHeightsTitle;
  String get obPastHeightsSubPart1;
  String get obPastHeightsSubPart2;
  String obHowTallAtAge(String age);
  String get obSkip;
  String get obNext;

  /// No description provided for @currentSuffix.
  ///
  /// In en, this message translates to:
  /// **'(current)'**
  String get currentSuffix;

  /// No description provided for @personalizedProtein.
  ///
  /// In en, this message translates to:
  /// **'Eggs, chicken, fish, dairy. Eat at least {amount}g protein daily.'**
  String personalizedProtein(String amount);

  /// No description provided for @personalizedWater.
  ///
  /// In en, this message translates to:
  /// **'Drink at least {amount}L water daily. Essential for metabolism and growth.'**
  String personalizedWater(String amount);

  /// No description provided for @personalizedSleep.
  ///
  /// In en, this message translates to:
  /// **'Growth hormone releases during sleep. Sleep at least {hours} hours. 10PM-6AM golden hours.'**
  String personalizedSleep(String hours);

  /// No description provided for @personalizedCalcium.
  ///
  /// In en, this message translates to:
  /// **'Consume milk, cheese, yogurt. Sun 15 min. Daily calorie goal: {calories} kcal.'**
  String personalizedCalcium(String calories);

  /// No description provided for @scoreS.
  ///
  /// In en, this message translates to:
  /// **'Excellent! You\'re reaching the peak of your potential.'**
  String get scoreS;

  /// No description provided for @scoreA.
  ///
  /// In en, this message translates to:
  /// **'Going great! Small improvements can take you to the top.'**
  String get scoreA;

  /// No description provided for @scoreB.
  ///
  /// In en, this message translates to:
  /// **'On the right track. Focus a bit more on routines and nutrition.'**
  String get scoreB;

  /// No description provided for @scoreC.
  ///
  /// In en, this message translates to:
  /// **'Room for improvement. Regular routines will make a difference.'**
  String get scoreC;

  /// No description provided for @scoreD.
  ///
  /// In en, this message translates to:
  /// **'High potential but you need to take action.'**
  String get scoreD;

  /// No description provided for @scoreF.
  ///
  /// In en, this message translates to:
  /// **'Start now! A small step every day makes a big difference.'**
  String get scoreF;

  /// No description provided for @cmPerYear.
  ///
  /// In en, this message translates to:
  /// **'cm/year'**
  String get cmPerYear;

  /// No description provided for @howToDoIt.
  ///
  /// In en, this message translates to:
  /// **'How to Do It'**
  String get howToDoIt;

  /// No description provided for @musclesTargeted.
  ///
  /// In en, this message translates to:
  /// **'Muscles & Bones Targeted'**
  String get musclesTargeted;

  /// No description provided for @scientificBasis.
  ///
  /// In en, this message translates to:
  /// **'Scientific Basis'**
  String get scientificBasis;

  /// No description provided for @setXofY.
  ///
  /// In en, this message translates to:
  /// **'Set {current} of {total}'**
  String setXofY(String current, String total);

  /// No description provided for @restBeforeSet.
  ///
  /// In en, this message translates to:
  /// **'Rest before Set {set}'**
  String restBeforeSet(String set);

  /// No description provided for @allSetsComplete.
  ///
  /// In en, this message translates to:
  /// **'All Sets Complete!'**
  String get allSetsComplete;

  /// No description provided for @setTimer.
  ///
  /// In en, this message translates to:
  /// **'Set Timer'**
  String get setTimer;

  /// No description provided for @setTracker.
  ///
  /// In en, this message translates to:
  /// **'Set Tracker'**
  String get setTracker;

  /// No description provided for @builtInTimer.
  ///
  /// In en, this message translates to:
  /// **'Built-in Timer'**
  String get builtInTimer;

  /// No description provided for @markComplete.
  ///
  /// In en, this message translates to:
  /// **'Mark Complete'**
  String get markComplete;

  /// No description provided for @markIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Mark Incomplete'**
  String get markIncomplete;

  /// No description provided for @done.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get done;

  /// No description provided for @doneExclamation.
  ///
  /// In en, this message translates to:
  /// **'Done!'**
  String get doneExclamation;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @pause.
  ///
  /// In en, this message translates to:
  /// **'Pause'**
  String get pause;

  /// No description provided for @resetTimer.
  ///
  /// In en, this message translates to:
  /// **'Reset'**
  String get resetTimer;

  /// No description provided for @skipRest.
  ///
  /// In en, this message translates to:
  /// **'Skip Rest'**
  String get skipRest;

  /// No description provided for @restart.
  ///
  /// In en, this message translates to:
  /// **'Restart'**
  String get restart;

  /// No description provided for @perSet.
  ///
  /// In en, this message translates to:
  /// **'per set'**
  String get perSet;

  /// No description provided for @rest.
  ///
  /// In en, this message translates to:
  /// **'REST'**
  String get rest;

  /// No description provided for @reps.
  ///
  /// In en, this message translates to:
  /// **'reps'**
  String get reps;

  /// No description provided for @difficultyBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get difficultyBeginner;

  /// No description provided for @difficultyIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get difficultyIntermediate;

  /// No description provided for @difficultyAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get difficultyAdvanced;

  /// No description provided for @learnTitle.
  ///
  /// In en, this message translates to:
  /// **'Learn'**
  String get learnTitle;

  /// No description provided for @learnSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Science-backed knowledge for growth'**
  String get learnSubtitle;

  /// No description provided for @categoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get categoryAll;

  /// No description provided for @categoryScience.
  ///
  /// In en, this message translates to:
  /// **'Science'**
  String get categoryScience;

  /// No description provided for @categoryNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get categoryNutrition;

  /// No description provided for @categoryExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get categoryExercise;

  /// No description provided for @categorySleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get categorySleep;

  /// No description provided for @categoryMyths.
  ///
  /// In en, this message translates to:
  /// **'Myths'**
  String get categoryMyths;

  /// No description provided for @scientificReferences.
  ///
  /// In en, this message translates to:
  /// **'Scientific References'**
  String get scientificReferences;

  /// No description provided for @relatedRoutines.
  ///
  /// In en, this message translates to:
  /// **'Related Routines'**
  String get relatedRoutines;

  /// No description provided for @nutritionTitle.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get nutritionTitle;

  /// No description provided for @sectionMealPlan.
  ///
  /// In en, this message translates to:
  /// **'Meal Plan'**
  String get sectionMealPlan;

  /// No description provided for @sectionNutrients.
  ///
  /// In en, this message translates to:
  /// **'Nutrients'**
  String get sectionNutrients;

  /// No description provided for @sectionFoods.
  ///
  /// In en, this message translates to:
  /// **'Foods'**
  String get sectionFoods;

  /// No description provided for @todaysPlan.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Plan — {day}'**
  String todaysPlan(String day);

  /// No description provided for @breakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get breakfast;

  /// No description provided for @lunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get lunch;

  /// No description provided for @dinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get dinner;

  /// No description provided for @snacks.
  ///
  /// In en, this message translates to:
  /// **'Snacks'**
  String get snacks;

  /// No description provided for @searchFoods.
  ///
  /// In en, this message translates to:
  /// **'Search foods...'**
  String get searchFoods;

  /// No description provided for @nFoods.
  ///
  /// In en, this message translates to:
  /// **'{count} foods'**
  String nFoods(String count);

  /// No description provided for @dailyLabel.
  ///
  /// In en, this message translates to:
  /// **'Daily: {amount}'**
  String dailyLabel(String amount);

  /// No description provided for @dailyNeedByAge.
  ///
  /// In en, this message translates to:
  /// **'DAILY NEED BY AGE'**
  String get dailyNeedByAge;

  /// No description provided for @agePrefix.
  ///
  /// In en, this message translates to:
  /// **'Age {range}'**
  String agePrefix(String range);

  /// No description provided for @topFoodSources.
  ///
  /// In en, this message translates to:
  /// **'TOP FOOD SOURCES'**
  String get topFoodSources;

  /// No description provided for @categoryDairy.
  ///
  /// In en, this message translates to:
  /// **'Dairy'**
  String get categoryDairy;

  /// No description provided for @categoryMeatFish.
  ///
  /// In en, this message translates to:
  /// **'Meat & Fish'**
  String get categoryMeatFish;

  /// No description provided for @categoryVegetables.
  ///
  /// In en, this message translates to:
  /// **'Vegetables'**
  String get categoryVegetables;

  /// No description provided for @categoryFruits.
  ///
  /// In en, this message translates to:
  /// **'Fruits'**
  String get categoryFruits;

  /// No description provided for @categoryGrains.
  ///
  /// In en, this message translates to:
  /// **'Grains & Legumes'**
  String get categoryGrains;

  /// No description provided for @categoryNutsSeeds.
  ///
  /// In en, this message translates to:
  /// **'Nuts & Seeds'**
  String get categoryNutsSeeds;

  /// No description provided for @weeklyReportTitle.
  ///
  /// In en, this message translates to:
  /// **'Weekly Report'**
  String get weeklyReportTitle;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @routinesLabel.
  ///
  /// In en, this message translates to:
  /// **'Routines'**
  String get routinesLabel;

  /// No description provided for @streakLabel.
  ///
  /// In en, this message translates to:
  /// **'Streak'**
  String get streakLabel;

  /// No description provided for @heightLabel.
  ///
  /// In en, this message translates to:
  /// **'Height'**
  String get heightLabel;

  /// No description provided for @weightLabel.
  ///
  /// In en, this message translates to:
  /// **'Weight'**
  String get weightLabel;

  /// No description provided for @dadLabel.
  ///
  /// In en, this message translates to:
  /// **'Dad'**
  String get dadLabel;

  /// No description provided for @motherLabel.
  ///
  /// In en, this message translates to:
  /// **'Mother'**
  String get motherLabel;

  /// No description provided for @metricShort.
  ///
  /// In en, this message translates to:
  /// **'Metric'**
  String get metricShort;

  /// No description provided for @imperialShort.
  ///
  /// In en, this message translates to:
  /// **'Imperial'**
  String get imperialShort;

  /// No description provided for @dailyScores.
  ///
  /// In en, this message translates to:
  /// **'Daily Scores'**
  String get dailyScores;

  /// No description provided for @waterToday2.
  ///
  /// In en, this message translates to:
  /// **'Water Today'**
  String get waterToday2;

  /// No description provided for @sleepToday.
  ///
  /// In en, this message translates to:
  /// **'Sleep Today'**
  String get sleepToday;

  /// No description provided for @routineCompletion.
  ///
  /// In en, this message translates to:
  /// **'Routine Completion'**
  String get routineCompletion;

  /// No description provided for @xpAndLevel.
  ///
  /// In en, this message translates to:
  /// **'XP & Level'**
  String get xpAndLevel;

  /// No description provided for @xpToNextLevel.
  ///
  /// In en, this message translates to:
  /// **'{xp} XP to next level'**
  String xpToNextLevel(String xp);

  /// No description provided for @activeChallenges.
  ///
  /// In en, this message translates to:
  /// **'Active Challenges'**
  String get activeChallenges;

  /// No description provided for @nOfMCompleted.
  ///
  /// In en, this message translates to:
  /// **'{n}/{m} completed'**
  String nOfMCompleted(String n, String m);

  /// No description provided for @shareYourProgress.
  ///
  /// In en, this message translates to:
  /// **'Share Your Progress'**
  String get shareYourProgress;

  /// No description provided for @shareComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Share feature coming soon!'**
  String get shareComingSoon;

  /// No description provided for @premiumTest.
  ///
  /// In en, this message translates to:
  /// **'Premium (Test)'**
  String get premiumTest;

  /// No description provided for @premiumActive.
  ///
  /// In en, this message translates to:
  /// **'Active'**
  String get premiumActive;

  /// No description provided for @premiumFree.
  ///
  /// In en, this message translates to:
  /// **'Free'**
  String get premiumFree;

  /// No description provided for @weeklyReportMenu.
  ///
  /// In en, this message translates to:
  /// **'Weekly Report'**
  String get weeklyReportMenu;

  /// No description provided for @weeklyReportMenuSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your progress summary'**
  String get weeklyReportMenuSubtitle;

  /// No description provided for @unlockGrowthPotential.
  ///
  /// In en, this message translates to:
  /// **'Unlock your full growth potential'**
  String get unlockGrowthPotential;

  /// No description provided for @featureGrowthAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Growth analysis & score'**
  String get featureGrowthAnalysis;

  /// No description provided for @featureHeightPrediction.
  ///
  /// In en, this message translates to:
  /// **'Height prediction & forecast'**
  String get featureHeightPrediction;

  /// No description provided for @featureAllRoutines.
  ///
  /// In en, this message translates to:
  /// **'All 14 daily routines'**
  String get featureAllRoutines;

  /// No description provided for @featureWaterSleep.
  ///
  /// In en, this message translates to:
  /// **'Water & sleep tracking'**
  String get featureWaterSleep;

  /// No description provided for @featureProgress.
  ///
  /// In en, this message translates to:
  /// **'Progress & measurements'**
  String get featureProgress;

  /// No description provided for @featureAchievements.
  ///
  /// In en, this message translates to:
  /// **'Achievements & streaks'**
  String get featureAchievements;

  /// No description provided for @planMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get planMonthly;

  /// No description provided for @planYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get planYearly;

  /// No description provided for @bestValue.
  ///
  /// In en, this message translates to:
  /// **'BEST VALUE'**
  String get bestValue;

  /// No description provided for @premiumLabel.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumLabel;

  /// No description provided for @lvl.
  ///
  /// In en, this message translates to:
  /// **'LVL {level}'**
  String lvl(String level);

  /// No description provided for @levelBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get levelBeginner;

  /// No description provided for @levelStarter.
  ///
  /// In en, this message translates to:
  /// **'Starter'**
  String get levelStarter;

  /// No description provided for @levelCommitted.
  ///
  /// In en, this message translates to:
  /// **'Committed'**
  String get levelCommitted;

  /// No description provided for @levelDedicated.
  ///
  /// In en, this message translates to:
  /// **'Dedicated'**
  String get levelDedicated;

  /// No description provided for @levelConsistent.
  ///
  /// In en, this message translates to:
  /// **'Consistent'**
  String get levelConsistent;

  /// No description provided for @levelFocused.
  ///
  /// In en, this message translates to:
  /// **'Focused'**
  String get levelFocused;

  /// No description provided for @levelDetermined.
  ///
  /// In en, this message translates to:
  /// **'Determined'**
  String get levelDetermined;

  /// No description provided for @levelDisciplined.
  ///
  /// In en, this message translates to:
  /// **'Disciplined'**
  String get levelDisciplined;

  /// No description provided for @levelStrong.
  ///
  /// In en, this message translates to:
  /// **'Strong'**
  String get levelStrong;

  /// No description provided for @levelAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get levelAdvanced;

  /// No description provided for @levelExpert.
  ///
  /// In en, this message translates to:
  /// **'Expert'**
  String get levelExpert;

  /// No description provided for @levelMaster.
  ///
  /// In en, this message translates to:
  /// **'Master'**
  String get levelMaster;

  /// No description provided for @levelElite.
  ///
  /// In en, this message translates to:
  /// **'Elite'**
  String get levelElite;

  /// No description provided for @levelChampion.
  ///
  /// In en, this message translates to:
  /// **'Champion'**
  String get levelChampion;

  /// No description provided for @levelLegend.
  ///
  /// In en, this message translates to:
  /// **'Legend'**
  String get levelLegend;

  /// No description provided for @levelTitan.
  ///
  /// In en, this message translates to:
  /// **'Titan'**
  String get levelTitan;

  /// No description provided for @levelMythic.
  ///
  /// In en, this message translates to:
  /// **'Mythic'**
  String get levelMythic;

  /// No description provided for @levelImmortal.
  ///
  /// In en, this message translates to:
  /// **'Immortal'**
  String get levelImmortal;

  /// No description provided for @levelTranscendent.
  ///
  /// In en, this message translates to:
  /// **'Transcendent'**
  String get levelTranscendent;

  /// No description provided for @levelUltimate.
  ///
  /// In en, this message translates to:
  /// **'Ultimate'**
  String get levelUltimate;

  /// No description provided for @challengeCompleteAllRoutines.
  ///
  /// In en, this message translates to:
  /// **'Complete All Routines'**
  String get challengeCompleteAllRoutines;

  /// No description provided for @challengeCompleteAllRoutinesDesc.
  ///
  /// In en, this message translates to:
  /// **'Finish every routine today'**
  String get challengeCompleteAllRoutinesDesc;

  /// No description provided for @challengeHydrationHero.
  ///
  /// In en, this message translates to:
  /// **'Hydration Hero'**
  String get challengeHydrationHero;

  /// No description provided for @challengeHydrationHeroDesc.
  ///
  /// In en, this message translates to:
  /// **'Reach your daily water goal'**
  String get challengeHydrationHeroDesc;

  /// No description provided for @challengeEarlySleeper.
  ///
  /// In en, this message translates to:
  /// **'Early Sleeper'**
  String get challengeEarlySleeper;

  /// No description provided for @challengeEarlySleeperDesc.
  ///
  /// In en, this message translates to:
  /// **'Log 8+ hours of sleep'**
  String get challengeEarlySleeperDesc;

  /// No description provided for @challengeExerciseTrio.
  ///
  /// In en, this message translates to:
  /// **'Exercise Trio'**
  String get challengeExerciseTrio;

  /// No description provided for @challengeExerciseTrioDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 3 exercise routines'**
  String get challengeExerciseTrioDesc;

  /// No description provided for @challengeMorningStretch.
  ///
  /// In en, this message translates to:
  /// **'Morning Stretch'**
  String get challengeMorningStretch;

  /// No description provided for @challengeMorningStretchDesc.
  ///
  /// In en, this message translates to:
  /// **'Do morning stretching before 9 AM'**
  String get challengeMorningStretchDesc;

  /// No description provided for @challenge7DayWarrior.
  ///
  /// In en, this message translates to:
  /// **'7-Day Warrior'**
  String get challenge7DayWarrior;

  /// No description provided for @challenge7DayWarriorDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete all routines for 7 consecutive days'**
  String get challenge7DayWarriorDesc;

  /// No description provided for @challengeGrowthTracker.
  ///
  /// In en, this message translates to:
  /// **'Growth Tracker'**
  String get challengeGrowthTracker;

  /// No description provided for @challengeGrowthTrackerDesc.
  ///
  /// In en, this message translates to:
  /// **'Log a height measurement this week'**
  String get challengeGrowthTrackerDesc;

  /// No description provided for @challengeHydrationWeek.
  ///
  /// In en, this message translates to:
  /// **'Hydration Week'**
  String get challengeHydrationWeek;

  /// No description provided for @challengeHydrationWeekDesc.
  ///
  /// In en, this message translates to:
  /// **'Hit water goal 5 days this week'**
  String get challengeHydrationWeekDesc;

  /// No description provided for @challengeFitnessChampion.
  ///
  /// In en, this message translates to:
  /// **'Fitness Champion'**
  String get challengeFitnessChampion;

  /// No description provided for @challengeFitnessChampionDesc.
  ///
  /// In en, this message translates to:
  /// **'Complete 15 exercise routines this week'**
  String get challengeFitnessChampionDesc;

  /// No description provided for @challengeSleepMaster.
  ///
  /// In en, this message translates to:
  /// **'Sleep Master'**
  String get challengeSleepMaster;

  /// No description provided for @challengeSleepMasterDesc.
  ///
  /// In en, this message translates to:
  /// **'Log 8+ hours of sleep for 5 days'**
  String get challengeSleepMasterDesc;

  /// No description provided for @performanceDashboard.
  ///
  /// In en, this message translates to:
  /// **'PERFORMANCE DASHBOARD'**
  String get performanceDashboard;

  /// No description provided for @tierA.
  ///
  /// In en, this message translates to:
  /// **'TIER A'**
  String get tierA;

  /// No description provided for @tierB.
  ///
  /// In en, this message translates to:
  /// **'TIER B'**
  String get tierB;

  /// No description provided for @tierC.
  ///
  /// In en, this message translates to:
  /// **'TIER C'**
  String get tierC;

  /// No description provided for @tierD.
  ///
  /// In en, this message translates to:
  /// **'TIER D'**
  String get tierD;

  /// No description provided for @tierE.
  ///
  /// In en, this message translates to:
  /// **'TIER E'**
  String get tierE;

  /// No description provided for @maxTierReached.
  ///
  /// In en, this message translates to:
  /// **'MAX TIER REACHED'**
  String get maxTierReached;

  /// No description provided for @nextTierHint.
  ///
  /// In en, this message translates to:
  /// **'Next Tier: {tier} · +{pts} pts needed'**
  String nextTierHint(String tier, String pts);

  /// No description provided for @premiumBadge.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premiumBadge;

  /// No description provided for @manageRoutines.
  ///
  /// In en, this message translates to:
  /// **'Manage Routines'**
  String get manageRoutines;

  /// No description provided for @manageRoutinesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Show or hide routines from your daily list'**
  String get manageRoutinesSubtitle;

  /// No description provided for @nVisibleOfTotal.
  ///
  /// In en, this message translates to:
  /// **'{visible} of {total} active'**
  String nVisibleOfTotal(String visible, String total);

  /// No description provided for @showAll.
  ///
  /// In en, this message translates to:
  /// **'Show all'**
  String get showAll;

  /// No description provided for @hideAll.
  ///
  /// In en, this message translates to:
  /// **'Hide all'**
  String get hideAll;

  /// No description provided for @heightAnalysis.
  ///
  /// In en, this message translates to:
  /// **'Height Analysis'**
  String get heightAnalysis;

  /// No description provided for @heightVsPopulation.
  ///
  /// In en, this message translates to:
  /// **'Your Position in Global Population'**
  String get heightVsPopulation;

  /// No description provided for @globalAveragesTable.
  ///
  /// In en, this message translates to:
  /// **'Global Averages by Age'**
  String get globalAveragesTable;

  /// No description provided for @standingTall.
  ///
  /// In en, this message translates to:
  /// **'Standing Tall'**
  String get standingTall;

  /// No description provided for @standingAboveAverage.
  ///
  /// In en, this message translates to:
  /// **'Above Average'**
  String get standingAboveAverage;

  /// No description provided for @standingBelowAverage.
  ///
  /// In en, this message translates to:
  /// **'Below Average'**
  String get standingBelowAverage;

  /// No description provided for @standingShort.
  ///
  /// In en, this message translates to:
  /// **'Below Peers'**
  String get standingShort;

  /// No description provided for @yourHeightStanding.
  ///
  /// In en, this message translates to:
  /// **'YOUR HEIGHT STANDING'**
  String get yourHeightStanding;

  /// No description provided for @yourHeight.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get yourHeight;

  /// No description provided for @peerAvg.
  ///
  /// In en, this message translates to:
  /// **'Age {age} avg'**
  String peerAvg(int age);

  /// No description provided for @aboveAvg.
  ///
  /// In en, this message translates to:
  /// **'Above avg'**
  String get aboveAvg;

  /// No description provided for @belowAvg.
  ///
  /// In en, this message translates to:
  /// **'Below avg'**
  String get belowAvg;

  /// No description provided for @whoDataSource.
  ///
  /// In en, this message translates to:
  /// **'WHO 2007 Global Reference'**
  String get whoDataSource;

  /// No description provided for @percentileShort5.
  ///
  /// In en, this message translates to:
  /// **'5th'**
  String get percentileShort5;

  /// No description provided for @percentileShort50.
  ///
  /// In en, this message translates to:
  /// **'50th'**
  String get percentileShort50;

  /// No description provided for @percentileShort95.
  ///
  /// In en, this message translates to:
  /// **'95th'**
  String get percentileShort95;

  /// No description provided for @youLabel.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get youLabel;

  /// No description provided for @avgHeightLabel.
  ///
  /// In en, this message translates to:
  /// **'AVG'**
  String get avgHeightLabel;

  /// No description provided for @percentileLabel.
  ///
  /// In en, this message translates to:
  /// **'PCT'**
  String get percentileLabel;

  /// No description provided for @diffLabel.
  ///
  /// In en, this message translates to:
  /// **'DIFF'**
  String get diffLabel;

  /// No description provided for @whoSourceNote.
  ///
  /// In en, this message translates to:
  /// **'Data source: WHO 2007 Growth Reference & NCD-RisC global pooled estimates. Percentiles are global averages and may vary by country.'**
  String get whoSourceNote;

  /// No description provided for @quickPhotos.
  ///
  /// In en, this message translates to:
  /// **'Photos'**
  String get quickPhotos;

  /// No description provided for @quickPosture.
  ///
  /// In en, this message translates to:
  /// **'Posture'**
  String get quickPosture;

  /// No description provided for @quickWellness.
  ///
  /// In en, this message translates to:
  /// **'Wellness'**
  String get quickWellness;

  /// No description provided for @quickRecipes.
  ///
  /// In en, this message translates to:
  /// **'Recipes'**
  String get quickRecipes;

  /// No description provided for @wellnessTitle.
  ///
  /// In en, this message translates to:
  /// **'Wellness Tracker'**
  String get wellnessTitle;

  /// No description provided for @wellnessHeader.
  ///
  /// In en, this message translates to:
  /// **'WELLNESS'**
  String get wellnessHeader;

  /// No description provided for @wellnessSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track factors that affect your growth'**
  String get wellnessSubtitle;

  /// No description provided for @caffeineToday.
  ///
  /// In en, this message translates to:
  /// **'Caffeine Today'**
  String get caffeineToday;

  /// No description provided for @withinLimits.
  ///
  /// In en, this message translates to:
  /// **'Within healthy limits'**
  String get withinLimits;

  /// No description provided for @approachingLimit.
  ///
  /// In en, this message translates to:
  /// **'Approaching limit'**
  String get approachingLimit;

  /// No description provided for @overLimit.
  ///
  /// In en, this message translates to:
  /// **'Over limit — affects HGH'**
  String get overLimit;

  /// No description provided for @resetToday.
  ///
  /// In en, this message translates to:
  /// **'Reset today'**
  String get resetToday;

  /// No description provided for @stressToday.
  ///
  /// In en, this message translates to:
  /// **'Stress Today'**
  String get stressToday;

  /// No description provided for @stressVeryCalmLabel.
  ///
  /// In en, this message translates to:
  /// **'Very calm — optimal for growth'**
  String get stressVeryCalmLabel;

  /// No description provided for @stressCalmLabel.
  ///
  /// In en, this message translates to:
  /// **'Calm'**
  String get stressCalmLabel;

  /// No description provided for @stressNeutralLabel.
  ///
  /// In en, this message translates to:
  /// **'Neutral'**
  String get stressNeutralLabel;

  /// No description provided for @stressStressedLabel.
  ///
  /// In en, this message translates to:
  /// **'Stressed'**
  String get stressStressedLabel;

  /// No description provided for @stressVeryStressedLabel.
  ///
  /// In en, this message translates to:
  /// **'Very stressed — cortisol blocks HGH'**
  String get stressVeryStressedLabel;

  /// No description provided for @stressTapToLog.
  ///
  /// In en, this message translates to:
  /// **'Tap to log how you feel today'**
  String get stressTapToLog;

  /// No description provided for @todaysJournal.
  ///
  /// In en, this message translates to:
  /// **'Today\'s Journal'**
  String get todaysJournal;

  /// No description provided for @journalNoNote.
  ///
  /// In en, this message translates to:
  /// **'(no note)'**
  String get journalNoNote;

  /// No description provided for @journalEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get journalEdit;

  /// No description provided for @journalHowWasToday.
  ///
  /// In en, this message translates to:
  /// **'How was today?'**
  String get journalHowWasToday;

  /// No description provided for @journalSaved.
  ///
  /// In en, this message translates to:
  /// **'Journal saved · +5 XP'**
  String get journalSaved;

  /// No description provided for @journalSaveEntry.
  ///
  /// In en, this message translates to:
  /// **'Save entry'**
  String get journalSaveEntry;

  /// No description provided for @weeklyInsight.
  ///
  /// In en, this message translates to:
  /// **'Weekly Insight'**
  String get weeklyInsight;

  /// No description provided for @weeklyInsightCaffeine.
  ///
  /// In en, this message translates to:
  /// **'CAFFEINE'**
  String get weeklyInsightCaffeine;

  /// No description provided for @weeklyInsightStress.
  ///
  /// In en, this message translates to:
  /// **'STRESS'**
  String get weeklyInsightStress;

  /// No description provided for @weeklyInsightMood.
  ///
  /// In en, this message translates to:
  /// **'MOOD'**
  String get weeklyInsightMood;

  /// No description provided for @wellnessInfoTitle.
  ///
  /// In en, this message translates to:
  /// **'Why wellness matters'**
  String get wellnessInfoTitle;

  /// No description provided for @wellnessInfoBody.
  ///
  /// In en, this message translates to:
  /// **'Caffeine interferes with deep sleep, which is when most growth hormone (HGH) is released. Chronic stress raises cortisol, which directly suppresses HGH. Journaling helps you stay consistent with habits that support growth.'**
  String get wellnessInfoBody;

  /// No description provided for @wellnessInfoGotIt.
  ///
  /// In en, this message translates to:
  /// **'Got it'**
  String get wellnessInfoGotIt;

  /// No description provided for @insightCaffeineHigh.
  ///
  /// In en, this message translates to:
  /// **'Your caffeine is high this week. Try cutting down for better sleep and HGH.'**
  String get insightCaffeineHigh;

  /// No description provided for @insightStressHigh.
  ///
  /// In en, this message translates to:
  /// **'Stress is elevated this week. Consider breathing exercises — cortisol blocks growth.'**
  String get insightStressHigh;

  /// No description provided for @insightMoodLow.
  ///
  /// In en, this message translates to:
  /// **'Mood has been low lately. Sunlight, sleep, and gentle exercise all help.'**
  String get insightMoodLow;

  /// No description provided for @insightGreat.
  ///
  /// In en, this message translates to:
  /// **'Great balance this week. Your wellness supports optimal growth.'**
  String get insightGreat;

  /// No description provided for @insightDefault.
  ///
  /// In en, this message translates to:
  /// **'Your wellness is on track. Keep logging for deeper insights.'**
  String get insightDefault;

  /// No description provided for @insightNeedMoreData.
  ///
  /// In en, this message translates to:
  /// **'Log for a few more days to see insights.'**
  String get insightNeedMoreData;

  /// No description provided for @progressPhotosTitle.
  ///
  /// In en, this message translates to:
  /// **'Progress Photos'**
  String get progressPhotosTitle;

  /// No description provided for @progressPhotosHeader.
  ///
  /// In en, this message translates to:
  /// **'PROGRESS PHOTOS'**
  String get progressPhotosHeader;

  /// No description provided for @progressPhotosSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Track your visual journey'**
  String get progressPhotosSubtitle;

  /// No description provided for @addProgressPhoto.
  ///
  /// In en, this message translates to:
  /// **'Add Progress Photo'**
  String get addProgressPhoto;

  /// No description provided for @captureJourney.
  ///
  /// In en, this message translates to:
  /// **'Capture your visual journey'**
  String get captureJourney;

  /// No description provided for @takePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Photo'**
  String get takePhoto;

  /// No description provided for @chooseFromLibrary.
  ///
  /// In en, this message translates to:
  /// **'Choose from Library'**
  String get chooseFromLibrary;

  /// No description provided for @deletePhotoTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete Photo?'**
  String get deletePhotoTitle;

  /// No description provided for @deletePhotoBody.
  ///
  /// In en, this message translates to:
  /// **'This photo will be removed from your progress timeline.'**
  String get deletePhotoBody;

  /// No description provided for @timelineTab.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get timelineTab;

  /// No description provided for @photoLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{photo} other{photos}}'**
  String photoLabel(int count);

  /// No description provided for @dayLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{day} other{days}}'**
  String dayLabel(int count);

  /// No description provided for @cmGained.
  ///
  /// In en, this message translates to:
  /// **'cm gained'**
  String get cmGained;

  /// No description provided for @firstPhotoMessage.
  ///
  /// In en, this message translates to:
  /// **'Take your first photo to start tracking your visual progress.'**
  String get firstPhotoMessage;

  /// No description provided for @takeFirstPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take First Photo'**
  String get takeFirstPhoto;

  /// No description provided for @beforeAfter.
  ///
  /// In en, this message translates to:
  /// **'BEFORE / AFTER'**
  String get beforeAfter;

  /// No description provided for @beforeLabel.
  ///
  /// In en, this message translates to:
  /// **'BEFORE'**
  String get beforeLabel;

  /// No description provided for @afterLabel.
  ///
  /// In en, this message translates to:
  /// **'AFTER'**
  String get afterLabel;

  /// No description provided for @yourHeightDialog.
  ///
  /// In en, this message translates to:
  /// **'Your Height'**
  String get yourHeightDialog;

  /// No description provided for @heightDialogMessage.
  ///
  /// In en, this message translates to:
  /// **'Enter your current height in cm for this photo'**
  String get heightDialogMessage;

  /// No description provided for @postureAnalysisTitle.
  ///
  /// In en, this message translates to:
  /// **'Posture Analysis'**
  String get postureAnalysisTitle;

  /// No description provided for @postureCoachHeader.
  ///
  /// In en, this message translates to:
  /// **'POSTURE COACH'**
  String get postureCoachHeader;

  /// No description provided for @postureCoachSubtitle.
  ///
  /// In en, this message translates to:
  /// **'AI-powered posture scoring'**
  String get postureCoachSubtitle;

  /// No description provided for @latestScore.
  ///
  /// In en, this message translates to:
  /// **'LATEST SCORE'**
  String get latestScore;

  /// No description provided for @latestAnalysis.
  ///
  /// In en, this message translates to:
  /// **'LATEST ANALYSIS'**
  String get latestAnalysis;

  /// No description provided for @headPosition.
  ///
  /// In en, this message translates to:
  /// **'Head Position'**
  String get headPosition;

  /// No description provided for @progressLabel.
  ///
  /// In en, this message translates to:
  /// **'PROGRESS'**
  String get progressLabel;

  /// No description provided for @choosePhotoSource.
  ///
  /// In en, this message translates to:
  /// **'Choose Photo Source'**
  String get choosePhotoSource;

  /// No description provided for @sideProfileHint.
  ///
  /// In en, this message translates to:
  /// **'Side-profile, full body in frame'**
  String get sideProfileHint;

  /// No description provided for @howToTakePhoto.
  ///
  /// In en, this message translates to:
  /// **'HOW TO TAKE THE PHOTO'**
  String get howToTakePhoto;

  /// No description provided for @takePosturePhoto.
  ///
  /// In en, this message translates to:
  /// **'Take Posture Photo'**
  String get takePosturePhoto;

  /// No description provided for @postureExcellent.
  ///
  /// In en, this message translates to:
  /// **'Excellent'**
  String get postureExcellent;

  /// No description provided for @postureGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get postureGood;

  /// No description provided for @postureNeedsWork.
  ///
  /// In en, this message translates to:
  /// **'Needs work'**
  String get postureNeedsWork;

  /// No description provided for @posturePoor.
  ///
  /// In en, this message translates to:
  /// **'Poor'**
  String get posturePoor;

  /// No description provided for @recommendedExercises.
  ///
  /// In en, this message translates to:
  /// **'RECOMMENDED EXERCISES'**
  String get recommendedExercises;

  /// No description provided for @postureWallStand.
  ///
  /// In en, this message translates to:
  /// **'Wall Stand'**
  String get postureWallStand;

  /// No description provided for @postureWallStandDesc.
  ///
  /// In en, this message translates to:
  /// **'Stand with back against wall for 2 minutes daily.'**
  String get postureWallStandDesc;

  /// No description provided for @postureChestOpener.
  ///
  /// In en, this message translates to:
  /// **'Chest Opener'**
  String get postureChestOpener;

  /// No description provided for @postureChestOpenerDesc.
  ///
  /// In en, this message translates to:
  /// **'Opens tight pecs that pull shoulders forward.'**
  String get postureChestOpenerDesc;

  /// No description provided for @postureChinTucks.
  ///
  /// In en, this message translates to:
  /// **'Chin Tucks'**
  String get postureChinTucks;

  /// No description provided for @postureChinTucksDesc.
  ///
  /// In en, this message translates to:
  /// **'Reverse forward head posture — 3×10 reps.'**
  String get postureChinTucksDesc;

  /// No description provided for @postureDeadbug.
  ///
  /// In en, this message translates to:
  /// **'Deadbug'**
  String get postureDeadbug;

  /// No description provided for @postureDeadbugDesc.
  ///
  /// In en, this message translates to:
  /// **'Strengthens deep core for lordosis control.'**
  String get postureDeadbugDesc;

  /// No description provided for @recipesTitle.
  ///
  /// In en, this message translates to:
  /// **'Recipes'**
  String get recipesTitle;

  /// No description provided for @recipesHeader.
  ///
  /// In en, this message translates to:
  /// **'RECIPES'**
  String get recipesHeader;

  /// No description provided for @recipesSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Fuel your growth'**
  String get recipesSubtitle;

  /// No description provided for @recipesCategoryAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get recipesCategoryAll;

  /// No description provided for @recipesCategoryBreakfast.
  ///
  /// In en, this message translates to:
  /// **'Breakfast'**
  String get recipesCategoryBreakfast;

  /// No description provided for @recipesCategoryLunch.
  ///
  /// In en, this message translates to:
  /// **'Lunch'**
  String get recipesCategoryLunch;

  /// No description provided for @recipesCategoryDinner.
  ///
  /// In en, this message translates to:
  /// **'Dinner'**
  String get recipesCategoryDinner;

  /// No description provided for @recipesCategorySnack.
  ///
  /// In en, this message translates to:
  /// **'Snack'**
  String get recipesCategorySnack;

  /// No description provided for @recipesGoalAll.
  ///
  /// In en, this message translates to:
  /// **'All'**
  String get recipesGoalAll;

  /// No description provided for @recipesGoalProtein.
  ///
  /// In en, this message translates to:
  /// **'High Protein'**
  String get recipesGoalProtein;

  /// No description provided for @recipesGoalCalcium.
  ///
  /// In en, this message translates to:
  /// **'Calcium'**
  String get recipesGoalCalcium;

  /// No description provided for @recipesGoalOmega3.
  ///
  /// In en, this message translates to:
  /// **'Omega-3'**
  String get recipesGoalOmega3;

  /// No description provided for @recipesGoalIron.
  ///
  /// In en, this message translates to:
  /// **'Iron'**
  String get recipesGoalIron;

  /// No description provided for @recipesNoMatch.
  ///
  /// In en, this message translates to:
  /// **'No recipes match these filters'**
  String get recipesNoMatch;

  /// No description provided for @recipesIngredients.
  ///
  /// In en, this message translates to:
  /// **'Ingredients'**
  String get recipesIngredients;

  /// No description provided for @recipesInstructions.
  ///
  /// In en, this message translates to:
  /// **'Instructions'**
  String get recipesInstructions;

  /// No description provided for @recipesClose.
  ///
  /// In en, this message translates to:
  /// **'CLOSE'**
  String get recipesClose;

  /// No description provided for @recipesAboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Recipes'**
  String get recipesAboutTitle;

  /// No description provided for @recipesAboutBody.
  ///
  /// In en, this message translates to:
  /// **'Curated recipes designed to fuel your growth. Filter by meal type or nutritional goal to find the perfect fit for your plan.'**
  String get recipesAboutBody;

  /// No description provided for @animHintSpinalDecomp.
  ///
  /// In en, this message translates to:
  /// **'Spinal decompression'**
  String get animHintSpinalDecomp;

  /// No description provided for @animHintGravityReversal.
  ///
  /// In en, this message translates to:
  /// **'Gravity reversal'**
  String get animHintGravityReversal;

  /// No description provided for @animHintImpactBones.
  ///
  /// In en, this message translates to:
  /// **'Impact loading for bones'**
  String get animHintImpactBones;

  /// No description provided for @animHintHighImpact.
  ///
  /// In en, this message translates to:
  /// **'High-impact bone loading'**
  String get animHintHighImpact;

  /// No description provided for @animHintMetabolicBurst.
  ///
  /// In en, this message translates to:
  /// **'Metabolic burst training'**
  String get animHintMetabolicBurst;

  /// No description provided for @animHintFullBodyStretch.
  ///
  /// In en, this message translates to:
  /// **'Full-body awakening stretch'**
  String get animHintFullBodyStretch;

  /// No description provided for @animHintSpinalExtension.
  ///
  /// In en, this message translates to:
  /// **'Spinal extension'**
  String get animHintSpinalExtension;

  /// No description provided for @animHintCervicalDecomp.
  ///
  /// In en, this message translates to:
  /// **'Cervical decompression'**
  String get animHintCervicalDecomp;

  /// No description provided for @animHintShoulderMobility.
  ///
  /// In en, this message translates to:
  /// **'Shoulder mobility'**
  String get animHintShoulderMobility;

  /// No description provided for @animHintFullBodyMotion.
  ///
  /// In en, this message translates to:
  /// **'Full-body motion'**
  String get animHintFullBodyMotion;

  /// No description provided for @animHintPosteriorChain.
  ///
  /// In en, this message translates to:
  /// **'Posterior chain stretch'**
  String get animHintPosteriorChain;

  /// No description provided for @animHintMuscleGrowth.
  ///
  /// In en, this message translates to:
  /// **'Muscle growth fuel'**
  String get animHintMuscleGrowth;

  /// No description provided for @animHintBoneDensity.
  ///
  /// In en, this message translates to:
  /// **'Bone density support'**
  String get animHintBoneDensity;

  /// No description provided for @animHintSpinalDisc.
  ///
  /// In en, this message translates to:
  /// **'Spinal disc hydration'**
  String get animHintSpinalDisc;

  /// No description provided for @animHintCleanNutrition.
  ///
  /// In en, this message translates to:
  /// **'Clean nutrition'**
  String get animHintCleanNutrition;

  /// No description provided for @animHintIgf1.
  ///
  /// In en, this message translates to:
  /// **'IGF-1 optimization'**
  String get animHintIgf1;

  /// No description provided for @animHintHghAmino.
  ///
  /// In en, this message translates to:
  /// **'HGH amino precursor'**
  String get animHintHghAmino;

  /// No description provided for @animHintCalciumAbsorption.
  ///
  /// In en, this message translates to:
  /// **'Calcium absorption'**
  String get animHintCalciumAbsorption;

  /// No description provided for @animHintSpinalAlignment.
  ///
  /// In en, this message translates to:
  /// **'Spinal alignment'**
  String get animHintSpinalAlignment;

  /// No description provided for @animHintPostureCorrection.
  ///
  /// In en, this message translates to:
  /// **'Posture correction'**
  String get animHintPostureCorrection;

  /// No description provided for @animHintMindBody.
  ///
  /// In en, this message translates to:
  /// **'Mind-body balance'**
  String get animHintMindBody;

  /// No description provided for @animHintCoreStability.
  ///
  /// In en, this message translates to:
  /// **'Core stability'**
  String get animHintCoreStability;

  /// No description provided for @animHintLegPower.
  ///
  /// In en, this message translates to:
  /// **'Leg power & HGH surge'**
  String get animHintLegPower;

  /// No description provided for @animHintVerticalPower.
  ///
  /// In en, this message translates to:
  /// **'Vertical power'**
  String get animHintVerticalPower;

  /// No description provided for @animHintHghSurge.
  ///
  /// In en, this message translates to:
  /// **'HGH surge training'**
  String get animHintHghSurge;

  /// No description provided for @animHintPeakHgh.
  ///
  /// In en, this message translates to:
  /// **'Peak HGH release window'**
  String get animHintPeakHgh;

  /// No description provided for @animHintMelatonin.
  ///
  /// In en, this message translates to:
  /// **'Melatonin optimization'**
  String get animHintMelatonin;

  /// No description provided for @animHintDeepSleep.
  ///
  /// In en, this message translates to:
  /// **'Deep sleep setup'**
  String get animHintDeepSleep;

  /// No description provided for @animHintSleepOpt.
  ///
  /// In en, this message translates to:
  /// **'Sleep optimization'**
  String get animHintSleepOpt;

  /// No description provided for @animHintExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get animHintExercise;

  /// No description provided for @formMorningStretch.
  ///
  /// In en, this message translates to:
  /// **'Start with neck rolls, then move to full body stretches. Hold each stretch for 20-30 seconds without bouncing.'**
  String get formMorningStretch;

  /// No description provided for @formBarHanging.
  ///
  /// In en, this message translates to:
  /// **'Grip the bar shoulder-width apart, relax your body completely, let gravity stretch your spine. Avoid swinging.'**
  String get formBarHanging;

  /// No description provided for @formCobraStretch.
  ///
  /// In en, this message translates to:
  /// **'Lie face down, place hands under shoulders, slowly push upper body up while keeping hips on the floor. Look upward.'**
  String get formCobraStretch;

  /// No description provided for @formJumping.
  ///
  /// In en, this message translates to:
  /// **'Perform squat jumps or jump rope. Land softly on the balls of your feet. Rest 30 seconds between sets.'**
  String get formJumping;

  /// No description provided for @formSwimmingBasketball.
  ///
  /// In en, this message translates to:
  /// **'Choose swimming (freestyle/backstroke) or basketball. Focus on jumping, reaching, and full range of motion.'**
  String get formSwimmingBasketball;

  /// No description provided for @formEveningYoga.
  ///
  /// In en, this message translates to:
  /// **'Perform gentle poses: cat-cow, child pose, downward dog, forward fold. Breathe deeply and hold each pose 30-60 seconds.'**
  String get formEveningYoga;

  /// No description provided for @formSprintIntervals.
  ///
  /// In en, this message translates to:
  /// **'Warm up for 5 minutes, then sprint at maximum effort for 30 seconds. Walk or jog for 90 seconds to recover. Repeat.'**
  String get formSprintIntervals;

  /// No description provided for @formHiitWorkout.
  ///
  /// In en, this message translates to:
  /// **'Perform exercises like burpees, mountain climbers, and jump squats at maximum intensity for 45 seconds, rest 15 seconds.'**
  String get formHiitWorkout;

  /// No description provided for @formSquats.
  ///
  /// In en, this message translates to:
  /// **'Stand with feet shoulder-width apart. Lower your body until thighs are parallel to ground. Keep back straight and knees behind toes.'**
  String get formSquats;

  /// No description provided for @formDeadliftStretch.
  ///
  /// In en, this message translates to:
  /// **'Stand with feet hip-width apart, hinge at hips keeping back flat. Reach toward toes, feel the stretch in hamstrings and back.'**
  String get formDeadliftStretch;

  /// No description provided for @formOverheadPress.
  ///
  /// In en, this message translates to:
  /// **'Stand tall, press arms overhead fully extending. Use light weights or bodyweight. Keep core tight and avoid arching back.'**
  String get formOverheadPress;

  /// No description provided for @formSkippingRope.
  ///
  /// In en, this message translates to:
  /// **'Jump with both feet, landing softly on the balls of your feet. Keep jumps low and consistent. Rest between sets.'**
  String get formSkippingRope;

  /// No description provided for @formPilatesCore.
  ///
  /// In en, this message translates to:
  /// **'Perform plank, dead bug, bird dog, bridge, and leg raises. Focus on controlled movement and breathing.'**
  String get formPilatesCore;

  /// No description provided for @formInversionHang.
  ///
  /// In en, this message translates to:
  /// **'Use an inversion table or gravity boots. Start with a slight incline and gradually increase. Keep sessions short.'**
  String get formInversionHang;

  /// No description provided for @formProtein.
  ///
  /// In en, this message translates to:
  /// **'Spread protein intake across 3-4 meals. Include eggs, chicken, fish, dairy, and legumes.'**
  String get formProtein;

  /// No description provided for @formCalciumVitaminD.
  ///
  /// In en, this message translates to:
  /// **'Consume 3 servings of dairy daily and get 15 minutes of sunlight for natural Vitamin D synthesis.'**
  String get formCalciumVitaminD;

  /// No description provided for @formWater.
  ///
  /// In en, this message translates to:
  /// **'Drink water consistently throughout the day. Carry a water bottle and set hourly reminders.'**
  String get formWater;

  /// No description provided for @formAvoidJunk.
  ///
  /// In en, this message translates to:
  /// **'Replace fast food with whole foods. Swap sugary drinks for water. Read labels and avoid processed ingredients.'**
  String get formAvoidJunk;

  /// No description provided for @formZincIntake.
  ///
  /// In en, this message translates to:
  /// **'Include red meat, pumpkin seeds, chickpeas, cashews, and oysters in your diet. Aim for 8-11mg daily.'**
  String get formZincIntake;

  /// No description provided for @formVitaminDSunlight.
  ///
  /// In en, this message translates to:
  /// **'Expose arms and face to direct sunlight for 15 minutes, preferably before noon. No sunscreen needed for this duration.'**
  String get formVitaminDSunlight;

  /// No description provided for @formArginineFoods.
  ///
  /// In en, this message translates to:
  /// **'Include nuts, seeds, turkey, chicken, soybeans, and dairy in your meals. Best consumed before sleep.'**
  String get formArginineFoods;

  /// No description provided for @formQualitySleep.
  ///
  /// In en, this message translates to:
  /// **'Go to bed by 10 PM. Keep the room dark and cool. Avoid caffeine after 2 PM.'**
  String get formQualitySleep;

  /// No description provided for @formNoScreen.
  ///
  /// In en, this message translates to:
  /// **'Set an alarm 1 hour before bedtime. Put all screens away. Read a book or do gentle stretching instead.'**
  String get formNoScreen;

  /// No description provided for @formSleepEnvironment.
  ///
  /// In en, this message translates to:
  /// **'Use blackout curtains, keep room at 18-20°C, remove all light sources. Use a comfortable mattress and pillow.'**
  String get formSleepEnvironment;

  /// No description provided for @formPreSleepRoutine.
  ///
  /// In en, this message translates to:
  /// **'Start 30 minutes before bed: dim lights, read a book, do breathing exercises, avoid stimulating activities.'**
  String get formPreSleepRoutine;

  /// No description provided for @formPostureCheck.
  ///
  /// In en, this message translates to:
  /// **'Stand tall with shoulders back and down. Engage core slightly. Imagine a string pulling you up from the crown of your head.'**
  String get formPostureCheck;

  /// No description provided for @formWallStand.
  ///
  /// In en, this message translates to:
  /// **'Stand with heels, buttocks, shoulder blades, and head touching the wall. Hold for 5 minutes. Breathe normally.'**
  String get formWallStand;

  /// No description provided for @formNeckStretches.
  ///
  /// In en, this message translates to:
  /// **'Tilt head slowly to each side, forward, and backward. Hold each direction for 30 seconds. Do not force the stretch.'**
  String get formNeckStretches;

  /// No description provided for @formShoulderRolls.
  ///
  /// In en, this message translates to:
  /// **'Roll shoulders forward 15 times, then backward 15 times. Follow with chest-opening stretches holding for 20 seconds.'**
  String get formShoulderRolls;

  /// No description provided for @sciMorningStretch.
  ///
  /// In en, this message translates to:
  /// **'Morning stretching decompresses spinal discs that were rehydrated overnight, maximizing height retention'**
  String get sciMorningStretch;

  /// No description provided for @sciBarHanging.
  ///
  /// In en, this message translates to:
  /// **'Hanging decompresses vertebral discs by using gravity to stretch the spine, potentially adding temporary height'**
  String get sciBarHanging;

  /// No description provided for @sciCobraStretch.
  ///
  /// In en, this message translates to:
  /// **'Cobra stretch extends the spine and opens the chest, counteracting spinal compression from sitting'**
  String get sciCobraStretch;

  /// No description provided for @sciJumping.
  ///
  /// In en, this message translates to:
  /// **'High-impact jumping stimulates growth plates in the legs and triggers growth hormone release'**
  String get sciJumping;

  /// No description provided for @sciSwimmingBasketball.
  ///
  /// In en, this message translates to:
  /// **'Swimming and basketball involve full-body stretching, jumping, and reaching that stimulate growth plate activity'**
  String get sciSwimmingBasketball;

  /// No description provided for @sciEveningYoga.
  ///
  /// In en, this message translates to:
  /// **'Evening yoga reduces cortisol which inhibits growth hormone, and stretches muscles for overnight recovery'**
  String get sciEveningYoga;

  /// No description provided for @sciSprintIntervals.
  ///
  /// In en, this message translates to:
  /// **'Sprinting triggers significant growth hormone release'**
  String get sciSprintIntervals;

  /// No description provided for @sciHiitWorkout.
  ///
  /// In en, this message translates to:
  /// **'High intensity exercise increases HGH by up to 450%'**
  String get sciHiitWorkout;

  /// No description provided for @sciSquats.
  ///
  /// In en, this message translates to:
  /// **'Squats stimulate growth plates in legs and spine'**
  String get sciSquats;

  /// No description provided for @sciDeadliftStretch.
  ///
  /// In en, this message translates to:
  /// **'Spinal decompression promotes vertebral disc health'**
  String get sciDeadliftStretch;

  /// No description provided for @sciOverheadPress.
  ///
  /// In en, this message translates to:
  /// **'Overhead pressing stretches the spine and strengthens posture muscles'**
  String get sciOverheadPress;

  /// No description provided for @sciSkippingRope.
  ///
  /// In en, this message translates to:
  /// **'Repetitive jumping stimulates growth plates in lower extremities'**
  String get sciSkippingRope;

  /// No description provided for @sciPilatesCore.
  ///
  /// In en, this message translates to:
  /// **'Core strength supports spinal alignment and posture'**
  String get sciPilatesCore;

  /// No description provided for @sciInversionHang.
  ///
  /// In en, this message translates to:
  /// **'Inversion decompresses spinal discs, can temporarily add 1-2cm'**
  String get sciInversionHang;

  /// No description provided for @sciProtein.
  ///
  /// In en, this message translates to:
  /// **'Protein provides amino acids essential for bone and muscle growth, especially during growth spurts'**
  String get sciProtein;

  /// No description provided for @sciCalciumVitaminD.
  ///
  /// In en, this message translates to:
  /// **'Calcium and Vitamin D are the primary building blocks for bone density and linear bone growth'**
  String get sciCalciumVitaminD;

  /// No description provided for @sciWater.
  ///
  /// In en, this message translates to:
  /// **'Hydration is essential for nutrient transport to growth plates and joint cartilage health'**
  String get sciWater;

  /// No description provided for @sciAvoidJunk.
  ///
  /// In en, this message translates to:
  /// **'Processed foods and sugar cause inflammation and insulin spikes that suppress growth hormone secretion'**
  String get sciAvoidJunk;

  /// No description provided for @sciZincIntake.
  ///
  /// In en, this message translates to:
  /// **'Zinc is essential for growth hormone production'**
  String get sciZincIntake;

  /// No description provided for @sciVitaminDSunlight.
  ///
  /// In en, this message translates to:
  /// **'Vitamin D is crucial for calcium absorption and bone growth'**
  String get sciVitaminDSunlight;

  /// No description provided for @sciArginineFoods.
  ///
  /// In en, this message translates to:
  /// **'L-Arginine stimulates growth hormone secretion'**
  String get sciArginineFoods;

  /// No description provided for @sciQualitySleep.
  ///
  /// In en, this message translates to:
  /// **'70-80% of daily growth hormone is released during deep sleep stages, especially between 10 PM and 2 AM'**
  String get sciQualitySleep;

  /// No description provided for @sciNoScreen.
  ///
  /// In en, this message translates to:
  /// **'Blue light from screens suppresses melatonin production, delaying sleep onset and reducing deep sleep quality'**
  String get sciNoScreen;

  /// No description provided for @sciSleepEnvironment.
  ///
  /// In en, this message translates to:
  /// **'Dark, cool environment maximizes melatonin and growth hormone'**
  String get sciSleepEnvironment;

  /// No description provided for @sciPreSleepRoutine.
  ///
  /// In en, this message translates to:
  /// **'Consistent pre-sleep routine improves deep sleep quality by 23%'**
  String get sciPreSleepRoutine;

  /// No description provided for @sciPostureCheck.
  ///
  /// In en, this message translates to:
  /// **'Correct posture alignment can immediately add 2-3 cm to apparent height and prevents spinal compression'**
  String get sciPostureCheck;

  /// No description provided for @sciWallStand.
  ///
  /// In en, this message translates to:
  /// **'Wall stands train postural muscle memory, helping maintain proper spinal alignment throughout the day'**
  String get sciWallStand;

  /// No description provided for @sciNeckStretches.
  ///
  /// In en, this message translates to:
  /// **'Neck stretches relieve compression and improve cervical alignment'**
  String get sciNeckStretches;

  /// No description provided for @sciShoulderRolls.
  ///
  /// In en, this message translates to:
  /// **'Opening shoulders corrects forward posture, can add 1-2cm appearance'**
  String get sciShoulderRolls;

  /// No description provided for @muscleSpine.
  ///
  /// In en, this message translates to:
  /// **'Spine'**
  String get muscleSpine;

  /// No description provided for @muscleLegs.
  ///
  /// In en, this message translates to:
  /// **'Legs'**
  String get muscleLegs;

  /// No description provided for @muscleBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get muscleBack;

  /// No description provided for @muscleShoulders.
  ///
  /// In en, this message translates to:
  /// **'Shoulders'**
  String get muscleShoulders;

  /// No description provided for @muscleArms.
  ///
  /// In en, this message translates to:
  /// **'Arms'**
  String get muscleArms;

  /// No description provided for @muscleCore.
  ///
  /// In en, this message translates to:
  /// **'Core'**
  String get muscleCore;

  /// No description provided for @muscleChest.
  ///
  /// In en, this message translates to:
  /// **'Chest'**
  String get muscleChest;

  /// No description provided for @muscleCalves.
  ///
  /// In en, this message translates to:
  /// **'Calves'**
  String get muscleCalves;

  /// No description provided for @muscleFullBody.
  ///
  /// In en, this message translates to:
  /// **'Full Body'**
  String get muscleFullBody;

  /// No description provided for @muscleHips.
  ///
  /// In en, this message translates to:
  /// **'Hips'**
  String get muscleHips;

  /// No description provided for @muscleBones.
  ///
  /// In en, this message translates to:
  /// **'Bones'**
  String get muscleBones;

  /// No description provided for @muscleMuscles.
  ///
  /// In en, this message translates to:
  /// **'Muscles'**
  String get muscleMuscles;

  /// No description provided for @muscleNeck.
  ///
  /// In en, this message translates to:
  /// **'Neck'**
  String get muscleNeck;

  /// No description provided for @muscleUpperSpine.
  ///
  /// In en, this message translates to:
  /// **'Upper Spine'**
  String get muscleUpperSpine;

  /// No description provided for @muscleUpperBack.
  ///
  /// In en, this message translates to:
  /// **'Upper Back'**
  String get muscleUpperBack;

  /// No description provided for @createRoutine.
  ///
  /// In en, this message translates to:
  /// **'Create Routine'**
  String get createRoutine;

  /// No description provided for @createRoutineTitle.
  ///
  /// In en, this message translates to:
  /// **'Create Custom Routine'**
  String get createRoutineTitle;

  /// No description provided for @createRoutineSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Build your own daily routine'**
  String get createRoutineSubtitle;

  /// No description provided for @routineIcon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get routineIcon;

  /// No description provided for @routineTitleField.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get routineTitleField;

  /// No description provided for @routineDescField.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get routineDescField;

  /// No description provided for @routineDescHint.
  ///
  /// In en, this message translates to:
  /// **'Short summary of the routine'**
  String get routineDescHint;

  /// No description provided for @routineCategoryField.
  ///
  /// In en, this message translates to:
  /// **'Category'**
  String get routineCategoryField;

  /// No description provided for @routineDifficultyField.
  ///
  /// In en, this message translates to:
  /// **'Difficulty'**
  String get routineDifficultyField;

  /// No description provided for @routineDurationField.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get routineDurationField;

  /// No description provided for @routineSetsRepsField.
  ///
  /// In en, this message translates to:
  /// **'Sets x Reps'**
  String get routineSetsRepsField;

  /// No description provided for @routineFormField.
  ///
  /// In en, this message translates to:
  /// **'Form & Instructions'**
  String get routineFormField;

  /// No description provided for @routineFormHint.
  ///
  /// In en, this message translates to:
  /// **'Optional — how to perform this routine'**
  String get routineFormHint;

  /// No description provided for @diffBeginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get diffBeginner;

  /// No description provided for @diffIntermediate.
  ///
  /// In en, this message translates to:
  /// **'Intermediate'**
  String get diffIntermediate;

  /// No description provided for @diffAdvanced.
  ///
  /// In en, this message translates to:
  /// **'Advanced'**
  String get diffAdvanced;

  /// No description provided for @catExercise.
  ///
  /// In en, this message translates to:
  /// **'Exercise'**
  String get catExercise;

  /// No description provided for @catNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get catNutrition;

  /// No description provided for @catSleep.
  ///
  /// In en, this message translates to:
  /// **'Sleep'**
  String get catSleep;

  /// No description provided for @catPosture.
  ///
  /// In en, this message translates to:
  /// **'Posture'**
  String get catPosture;

  /// No description provided for @postureTip1.
  ///
  /// In en, this message translates to:
  /// **'Stand sideways (side profile) to the camera.'**
  String get postureTip1;

  /// No description provided for @postureTip2.
  ///
  /// In en, this message translates to:
  /// **'Keep ~2 meters distance from the lens.'**
  String get postureTip2;

  /// No description provided for @postureTip3.
  ///
  /// In en, this message translates to:
  /// **'Arms relaxed, look straight ahead.'**
  String get postureTip3;

  /// No description provided for @postureTip4.
  ///
  /// In en, this message translates to:
  /// **'Wear fitted clothes for accurate scoring.'**
  String get postureTip4;

  /// No description provided for @postureTip5.
  ///
  /// In en, this message translates to:
  /// **'Use good lighting and a plain background.'**
  String get postureTip5;

  /// No description provided for @kyphosisLabel.
  ///
  /// In en, this message translates to:
  /// **'Kyphosis (upper back)'**
  String get kyphosisLabel;

  /// No description provided for @lordosisLabel.
  ///
  /// In en, this message translates to:
  /// **'Lordosis (lower back)'**
  String get lordosisLabel;

  /// No description provided for @analyzingPosture.
  ///
  /// In en, this message translates to:
  /// **'ANALYZING POSTURE'**
  String get analyzingPosture;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version {ver}'**
  String version(String ver);

  /// No description provided for @rateApp.
  ///
  /// In en, this message translates to:
  /// **'Rate BeTaller'**
  String get rateApp;

  /// No description provided for @rateAppSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Your review helps us grow!'**
  String get rateAppSubtitle;

  /// No description provided for @unitSystem.
  ///
  /// In en, this message translates to:
  /// **'Unit System'**
  String get unitSystem;

  /// No description provided for @unitMetric.
  ///
  /// In en, this message translates to:
  /// **'Metric (cm, kg)'**
  String get unitMetric;

  /// No description provided for @unitImperial.
  ///
  /// In en, this message translates to:
  /// **'Imperial (ft-in, lbs)'**
  String get unitImperial;

  /// No description provided for @healthDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Health Disclaimer'**
  String get healthDisclaimer;

  /// No description provided for @healthDisclaimerBody.
  ///
  /// In en, this message translates to:
  /// **'BeTaller provides general wellness and fitness guidance. Results vary based on age, genetics, and individual factors. This app does not provide medical advice. Exercises focus on posture optimization, spinal health, and growth hormone support through natural habits. Consult a healthcare professional before starting any new exercise or nutrition program. Height changes after growth plate closure (typically 18-25) are primarily from posture improvement.'**
  String get healthDisclaimerBody;

  /// No description provided for @sciSourcePrefix.
  ///
  /// In en, this message translates to:
  /// **'Source: '**
  String get sciSourcePrefix;

  /// No description provided for @program.
  ///
  /// In en, this message translates to:
  /// **'Program'**
  String get program;

  /// No description provided for @todaysExercises.
  ///
  /// In en, this message translates to:
  /// **'TODAY\'S EXERCISES'**
  String get todaysExercises;

  /// No description provided for @dailyNutritionPlan.
  ///
  /// In en, this message translates to:
  /// **'DAILY NUTRITION PLAN'**
  String get dailyNutritionPlan;

  /// No description provided for @testimonial1.
  ///
  /// In en, this message translates to:
  /// **'I had no hope because of my age, but I grew with BeTaller. My confidence has never been this high.'**
  String get testimonial1;

  /// No description provided for @testimonialDuration1.
  ///
  /// In en, this message translates to:
  /// **'4 months'**
  String get testimonialDuration1;

  /// No description provided for @testimonial2.
  ///
  /// In en, this message translates to:
  /// **'Everyone said \"you can\'t grow anymore.\" I used BeTaller and surprised everyone.'**
  String get testimonial2;

  /// No description provided for @testimonialDuration2.
  ///
  /// In en, this message translates to:
  /// **'3 months'**
  String get testimonialDuration2;

  /// No description provided for @testimonial3.
  ///
  /// In en, this message translates to:
  /// **'After starting the routines, I grew taller and my posture improved. Everyone noticed the difference.'**
  String get testimonial3;

  /// No description provided for @testimonialDuration3.
  ///
  /// In en, this message translates to:
  /// **'6 months'**
  String get testimonialDuration3;

  /// No description provided for @testimonial4.
  ///
  /// In en, this message translates to:
  /// **'I\'m still in my growth phase and BeTaller\'s effect is incredible. I feel taller and stronger.'**
  String get testimonial4;

  /// No description provided for @testimonialDuration4.
  ///
  /// In en, this message translates to:
  /// **'3 months'**
  String get testimonialDuration4;

  /// No description provided for @testimonial5.
  ///
  /// In en, this message translates to:
  /// **'If I said I didn\'t try BeTaller, I\'d be lying. I noticed a real difference quickly, highly recommend.'**
  String get testimonial5;

  /// No description provided for @testimonialDuration5.
  ///
  /// In en, this message translates to:
  /// **'4 months'**
  String get testimonialDuration5;

  /// No description provided for @designedForYou.
  ///
  /// In en, this message translates to:
  /// **'Designed for you'**
  String get designedForYou;

  /// No description provided for @designedForYouDesc.
  ///
  /// In en, this message translates to:
  /// **'BeTaller was built specifically for you to reach your genetic limit — and even surpass it. Every feature, for you.'**
  String get designedForYouDesc;

  /// No description provided for @greetingAllDone.
  ///
  /// In en, this message translates to:
  /// **'Great job! 🎯'**
  String get greetingAllDone;

  /// No description provided for @greetingAllDoneSub.
  ///
  /// In en, this message translates to:
  /// **'You\'ve completed today\'s tasks.'**
  String get greetingAllDoneSub;

  /// No description provided for @greetingStreak30.
  ///
  /// In en, this message translates to:
  /// **'{streak} day streak — legendary level.'**
  String greetingStreak30(int streak);

  /// No description provided for @greetingStreak7.
  ///
  /// In en, this message translates to:
  /// **'{streak} day streak — keep it up.'**
  String greetingStreak7(int streak);

  /// No description provided for @greetingStreak3.
  ///
  /// In en, this message translates to:
  /// **'{streak} days in a row. Most people quit. You didn\'t.'**
  String greetingStreak3(int streak);

  /// No description provided for @greetingMorning.
  ///
  /// In en, this message translates to:
  /// **'Good morning. A new day, a new chance.'**
  String get greetingMorning;

  /// No description provided for @greetingAfternoon.
  ///
  /// In en, this message translates to:
  /// **'Today is a great day to start your streak.'**
  String get greetingAfternoon;

  /// No description provided for @greetingEvening.
  ///
  /// In en, this message translates to:
  /// **'Complete your tasks, start your streak.'**
  String get greetingEvening;

  /// No description provided for @todayCompleted.
  ///
  /// In en, this message translates to:
  /// **'Today completed ✓'**
  String get todayCompleted;

  /// No description provided for @todayGoals.
  ///
  /// In en, this message translates to:
  /// **'Today\'s goals'**
  String get todayGoals;

  /// No description provided for @challengesLabel.
  ///
  /// In en, this message translates to:
  /// **'Challenges'**
  String get challengesLabel;

  /// No description provided for @dailyChallengesLabel.
  ///
  /// In en, this message translates to:
  /// **'DAILY CHALLENGES'**
  String get dailyChallengesLabel;

  /// No description provided for @expiresTonight.
  ///
  /// In en, this message translates to:
  /// **'Expires tonight'**
  String get expiresTonight;

  /// No description provided for @allChallengesCompleted.
  ///
  /// In en, this message translates to:
  /// **'All completed ✓'**
  String get allChallengesCompleted;

  /// No description provided for @challengesLoading.
  ///
  /// In en, this message translates to:
  /// **'New challenges loading soon.'**
  String get challengesLoading;

  /// No description provided for @challengesLoadingTitle.
  ///
  /// In en, this message translates to:
  /// **'Daily challenges'**
  String get challengesLoadingTitle;

  /// No description provided for @behindPace.
  ///
  /// In en, this message translates to:
  /// **'Behind pace'**
  String get behindPace;

  /// No description provided for @growthTracking.
  ///
  /// In en, this message translates to:
  /// **'Growth tracking'**
  String get growthTracking;

  /// No description provided for @growthEmptyFirst.
  ///
  /// In en, this message translates to:
  /// **'Log your first height to start tracking.'**
  String get growthEmptyFirst;

  /// No description provided for @growthEmptySecond.
  ///
  /// In en, this message translates to:
  /// **'Log your second measurement to see your chart.'**
  String get growthEmptySecond;

  /// No description provided for @growthSectionLabel.
  ///
  /// In en, this message translates to:
  /// **'GROWTH'**
  String get growthSectionLabel;

  /// No description provided for @generalPerformance.
  ///
  /// In en, this message translates to:
  /// **'OVERALL PERFORMANCE'**
  String get generalPerformance;

  /// No description provided for @exploreLabel.
  ///
  /// In en, this message translates to:
  /// **'EXPLORE'**
  String get exploreLabel;

  /// No description provided for @explorePosture.
  ///
  /// In en, this message translates to:
  /// **'Posture Analysis'**
  String get explorePosture;

  /// No description provided for @explorePostureSub.
  ///
  /// In en, this message translates to:
  /// **'Posture analysis and correction tips'**
  String get explorePostureSub;

  /// No description provided for @explorePhotos.
  ///
  /// In en, this message translates to:
  /// **'Progress Photos'**
  String get explorePhotos;

  /// No description provided for @explorePhotosSub.
  ///
  /// In en, this message translates to:
  /// **'Track your transformation with photos'**
  String get explorePhotosSub;

  /// No description provided for @exploreNutrition.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get exploreNutrition;

  /// No description provided for @exploreNutritionSub.
  ///
  /// In en, this message translates to:
  /// **'Protein, calcium and vitamin guide'**
  String get exploreNutritionSub;

  /// No description provided for @exploreHealth.
  ///
  /// In en, this message translates to:
  /// **'Health Tracking'**
  String get exploreHealth;

  /// No description provided for @exploreHealthSub.
  ///
  /// In en, this message translates to:
  /// **'Stress, caffeine and wellness tracking'**
  String get exploreHealthSub;

  /// No description provided for @exploreRecipes.
  ///
  /// In en, this message translates to:
  /// **'Growth Recipes'**
  String get exploreRecipes;

  /// No description provided for @exploreRecipesSub.
  ///
  /// In en, this message translates to:
  /// **'Recipes that support growth'**
  String get exploreRecipesSub;

  /// No description provided for @educationLabel.
  ///
  /// In en, this message translates to:
  /// **'EDUCATION'**
  String get educationLabel;

  /// No description provided for @educationTitle.
  ///
  /// In en, this message translates to:
  /// **'Height growth\nscience'**
  String get educationTitle;

  /// No description provided for @educationSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Expert content, research and guides'**
  String get educationSubtitle;

  /// No description provided for @aiAnalysisLabel.
  ///
  /// In en, this message translates to:
  /// **'AI ANALYSIS'**
  String get aiAnalysisLabel;

  /// No description provided for @peerCompareLabel.
  ///
  /// In en, this message translates to:
  /// **'COMPARE WITH PEERS'**
  String get peerCompareLabel;

  /// No description provided for @peerCompareText.
  ///
  /// In en, this message translates to:
  /// **'You\'re in the Top {topPct}% of your peers'**
  String peerCompareText(int topPct);

  /// No description provided for @notifWaterTitle.
  ///
  /// In en, this message translates to:
  /// **'💧 Don\'t Forget to Drink Water!'**
  String get notifWaterTitle;

  /// No description provided for @notifWaterBody.
  ///
  /// In en, this message translates to:
  /// **'Have you reached your daily water goal? Drink another glass!'**
  String get notifWaterBody;

  /// No description provided for @notifMorningTitle.
  ///
  /// In en, this message translates to:
  /// **'🌅 Good Morning! Exercise Time'**
  String get notifMorningTitle;

  /// No description provided for @notifMorningBody.
  ///
  /// In en, this message translates to:
  /// **'Do your morning stretching! 10 minutes of spine and leg stretches.'**
  String get notifMorningBody;

  /// No description provided for @notifRoutineTitle.
  ///
  /// In en, this message translates to:
  /// **'🔥 Complete Your Routines!'**
  String get notifRoutineTitle;

  /// No description provided for @notifRoutineBody.
  ///
  /// In en, this message translates to:
  /// **'Check your routines before the day ends. Streak = discipline!'**
  String get notifRoutineBody;

  /// No description provided for @notifProteinTitle.
  ///
  /// In en, this message translates to:
  /// **'🥚 Protein Day!'**
  String get notifProteinTitle;

  /// No description provided for @notifProteinBody.
  ///
  /// In en, this message translates to:
  /// **'Start the week strong! Get protein every meal.'**
  String get notifProteinBody;

  /// No description provided for @notifNewWeekTitle.
  ///
  /// In en, this message translates to:
  /// **'✨ New Week, New Goals!'**
  String get notifNewWeekTitle;

  /// No description provided for @notifNewWeekBody.
  ///
  /// In en, this message translates to:
  /// **'Don\'t skip routines this week. Small steps, big differences!'**
  String get notifNewWeekBody;

  /// No description provided for @notifSleepTitle.
  ///
  /// In en, this message translates to:
  /// **'😴 Sleep Time!'**
  String get notifSleepTitle;

  /// No description provided for @notifSleepBody.
  ///
  /// In en, this message translates to:
  /// **'Growth hormone peaks between 10PM-2AM. Put your phone down!'**
  String get notifSleepBody;

  /// No description provided for @notifPostureTitle.
  ///
  /// In en, this message translates to:
  /// **'🧍 Posture Check!'**
  String get notifPostureTitle;

  /// No description provided for @notifPostureBody.
  ///
  /// In en, this message translates to:
  /// **'Back straight, shoulders back. Good posture = 2-3 cm difference!'**
  String get notifPostureBody;

  /// No description provided for @notifVitaminDTitle.
  ///
  /// In en, this message translates to:
  /// **'☀️ Vitamin D Time!'**
  String get notifVitaminDTitle;

  /// No description provided for @notifVitaminDBody.
  ///
  /// In en, this message translates to:
  /// **'Get 15 minutes of sun! Vitamin D boosts calcium absorption.'**
  String get notifVitaminDBody;

  /// No description provided for @notifMidweekTitle.
  ///
  /// In en, this message translates to:
  /// **'✨ Halfway There!'**
  String get notifMidweekTitle;

  /// No description provided for @notifMidweekBody.
  ///
  /// In en, this message translates to:
  /// **'Midweek check. Growth takes patience but consistency wins!'**
  String get notifMidweekBody;

  /// No description provided for @notifScreenTitle.
  ///
  /// In en, this message translates to:
  /// **'📵 Screens Off!'**
  String get notifScreenTitle;

  /// No description provided for @notifScreenBody.
  ///
  /// In en, this message translates to:
  /// **'No screens 1 hour before bed. Blue light blocks melatonin!'**
  String get notifScreenBody;

  /// No description provided for @notifJumpTitle.
  ///
  /// In en, this message translates to:
  /// **'🦘 Jump Time!'**
  String get notifJumpTitle;

  /// No description provided for @notifJumpBody.
  ///
  /// In en, this message translates to:
  /// **'Jumping exercises stimulate growth plates. Try 3 x 20 reps!'**
  String get notifJumpBody;

  /// No description provided for @notifCalciumTitle.
  ///
  /// In en, this message translates to:
  /// **'🥛 Calcium Time!'**
  String get notifCalciumTitle;

  /// No description provided for @notifCalciumBody.
  ///
  /// In en, this message translates to:
  /// **'A glass of milk or yogurt. Calcium is critical for bones!'**
  String get notifCalciumBody;

  /// No description provided for @notifPostureCheckTitle.
  ///
  /// In en, this message translates to:
  /// **'🧍 Posture Check!'**
  String get notifPostureCheckTitle;

  /// No description provided for @notifPostureCheckBody.
  ///
  /// In en, this message translates to:
  /// **'Don\'t tilt your neck at your phone! Sit and walk tall.'**
  String get notifPostureCheckBody;

  /// No description provided for @notifWeekendTitle.
  ///
  /// In en, this message translates to:
  /// **'✨ Weekend Motivation'**
  String get notifWeekendTitle;

  /// No description provided for @notifWeekendBody.
  ///
  /// In en, this message translates to:
  /// **'Don\'t skip routines on weekends! Discipline applies every day.'**
  String get notifWeekendBody;

  /// No description provided for @notifWeeklyProgressTitle.
  ///
  /// In en, this message translates to:
  /// **'📊 Weekly Progress'**
  String get notifWeeklyProgressTitle;

  /// No description provided for @notifWeeklyProgressBody.
  ///
  /// In en, this message translates to:
  /// **'How was your week? Check your growth chart!'**
  String get notifWeeklyProgressBody;

  /// No description provided for @notifMeasureTitle.
  ///
  /// In en, this message translates to:
  /// **'📏 Weekly Measurement!'**
  String get notifMeasureTitle;

  /// No description provided for @notifMeasureBody.
  ///
  /// In en, this message translates to:
  /// **'Measure and log your height! Morning measurements are most accurate.'**
  String get notifMeasureBody;

  /// No description provided for @notifEarlySleepTitle.
  ///
  /// In en, this message translates to:
  /// **'😴 Early to Bed!'**
  String get notifEarlySleepTitle;

  /// No description provided for @notifEarlySleepBody.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow is Monday! Start the week strong with good sleep.'**
  String get notifEarlySleepBody;

  /// No description provided for @notifStreak3Title.
  ///
  /// In en, this message translates to:
  /// **'🔥 3 Day Streak!'**
  String get notifStreak3Title;

  /// No description provided for @notifStreak3Body.
  ///
  /// In en, this message translates to:
  /// **'Great start! 3 days in a row. Keep going to 7!'**
  String get notifStreak3Body;

  /// No description provided for @notifStreak7Title.
  ///
  /// In en, this message translates to:
  /// **'🏆 1 Week Streak!'**
  String get notifStreak7Title;

  /// No description provided for @notifStreak7Body.
  ///
  /// In en, this message translates to:
  /// **'Incredible! 7 consecutive days of completed routines!'**
  String get notifStreak7Body;

  /// No description provided for @notifStreak14Title.
  ///
  /// In en, this message translates to:
  /// **'⭐ 2 Week Streak!'**
  String get notifStreak14Title;

  /// No description provided for @notifStreak14Body.
  ///
  /// In en, this message translates to:
  /// **'14 days of discipline! Your body is starting to change.'**
  String get notifStreak14Body;

  /// No description provided for @notifStreak30Title.
  ///
  /// In en, this message translates to:
  /// **'👑 1 Month Streak!'**
  String get notifStreak30Title;

  /// No description provided for @notifStreak30Body.
  ///
  /// In en, this message translates to:
  /// **'30 days! You\'re a champion!'**
  String get notifStreak30Body;

  /// No description provided for @notifStreak60Title.
  ///
  /// In en, this message translates to:
  /// **'🌟 60 Day Streak!'**
  String get notifStreak60Title;

  /// No description provided for @notifStreak60Body.
  ///
  /// In en, this message translates to:
  /// **'60 days! An incredible achievement.'**
  String get notifStreak60Body;

  /// No description provided for @notifStreak100Title.
  ///
  /// In en, this message translates to:
  /// **'💎 100 DAYS! LEGENDARY!'**
  String get notifStreak100Title;

  /// No description provided for @notifStreak100Body.
  ///
  /// In en, this message translates to:
  /// **'100 days in a row! You\'ve become a legend.'**
  String get notifStreak100Body;

  /// No description provided for @notifStreakRiskTitle.
  ///
  /// In en, this message translates to:
  /// **'⚠️ Don\'t Lose Your Streak!'**
  String get notifStreakRiskTitle;

  /// No description provided for @notifStreakRiskBody.
  ///
  /// In en, this message translates to:
  /// **'Your {streak} day streak is at risk! Complete your routines.'**
  String notifStreakRiskBody(int streak);

  /// No description provided for @paywallStat1.
  ///
  /// In en, this message translates to:
  /// **'cm — your potential is locked'**
  String get paywallStat1;

  /// No description provided for @paywallTitle1.
  ///
  /// In en, this message translates to:
  /// **'How Many cm\nCan You Grow?'**
  String get paywallTitle1;

  /// No description provided for @paywallBullet1a.
  ///
  /// In en, this message translates to:
  /// **'Your genetic ceiling has been calculated, want to see it?'**
  String get paywallBullet1a;

  /// No description provided for @paywallBullet1b.
  ///
  /// In en, this message translates to:
  /// **'How does your lifestyle affect your growth?'**
  String get paywallBullet1b;

  /// No description provided for @paywallBullet1c.
  ///
  /// In en, this message translates to:
  /// **'Your personalized roadmap awaits'**
  String get paywallBullet1c;

  /// No description provided for @paywallStat2.
  ///
  /// In en, this message translates to:
  /// **'your custom routine is ready'**
  String get paywallStat2;

  /// No description provided for @paywallTitle2.
  ///
  /// In en, this message translates to:
  /// **'Your Plan\nis Ready'**
  String get paywallTitle2;

  /// No description provided for @paywallBullet2a.
  ///
  /// In en, this message translates to:
  /// **'8 minutes every morning — designed for your spine'**
  String get paywallBullet2a;

  /// No description provided for @paywallBullet2b.
  ///
  /// In en, this message translates to:
  /// **'Sleep, nutrition, water — all tracked'**
  String get paywallBullet2b;

  /// No description provided for @paywallBullet2c.
  ///
  /// In en, this message translates to:
  /// **'One step closer every day, don\'t break the streak'**
  String get paywallBullet2c;

  /// No description provided for @paywallStat3.
  ///
  /// In en, this message translates to:
  /// **'real-time progress charts'**
  String get paywallStat3;

  /// No description provided for @paywallTitle3.
  ///
  /// In en, this message translates to:
  /// **'Track Your\nGrowth'**
  String get paywallTitle3;

  /// No description provided for @paywallBullet3a.
  ///
  /// In en, this message translates to:
  /// **'Monthly measurements — see your growth with your own eyes'**
  String get paywallBullet3a;

  /// No description provided for @paywallBullet3b.
  ///
  /// In en, this message translates to:
  /// **'Gain 2 cm right now with posture analysis'**
  String get paywallBullet3b;

  /// No description provided for @paywallBullet3c.
  ///
  /// In en, this message translates to:
  /// **'Progress photos — you\'ll see the difference'**
  String get paywallBullet3c;

  /// No description provided for @paywallStat4.
  ///
  /// In en, this message translates to:
  /// **'daily program — leveling up'**
  String get paywallStat4;

  /// No description provided for @paywallTitle4.
  ///
  /// In en, this message translates to:
  /// **'Stronger\nEvery Day'**
  String get paywallTitle4;

  /// No description provided for @paywallBullet4a.
  ///
  /// In en, this message translates to:
  /// **'Earn XP, unlock levels — habits become a game'**
  String get paywallBullet4a;

  /// No description provided for @paywallBullet4b.
  ///
  /// In en, this message translates to:
  /// **'Those who reached their goal came through here'**
  String get paywallBullet4b;

  /// No description provided for @paywallBullet4c.
  ///
  /// In en, this message translates to:
  /// **'Start now — first week free'**
  String get paywallBullet4c;

  /// No description provided for @paywallRestore.
  ///
  /// In en, this message translates to:
  /// **'No previous purchase found'**
  String get paywallRestore;

  /// No description provided for @paywallRestoreNotFound.
  ///
  /// In en, this message translates to:
  /// **'No previous purchase found'**
  String get paywallRestoreNotFound;

  /// No description provided for @paywallRestoreLabel.
  ///
  /// In en, this message translates to:
  /// **'Restore Purchases'**
  String get paywallRestoreLabel;

  /// No description provided for @paywallYearly.
  ///
  /// In en, this message translates to:
  /// **'Yearly'**
  String get paywallYearly;

  /// No description provided for @paywallBestValue.
  ///
  /// In en, this message translates to:
  /// **'Best value'**
  String get paywallBestValue;

  /// No description provided for @paywallMonthly.
  ///
  /// In en, this message translates to:
  /// **'Monthly'**
  String get paywallMonthly;

  /// No description provided for @paywallFreeTrial.
  ///
  /// In en, this message translates to:
  /// **'3 days free'**
  String get paywallFreeTrial;

  /// No description provided for @paywallLoadError.
  ///
  /// In en, this message translates to:
  /// **'Could not load purchase options, try again'**
  String get paywallLoadError;

  /// No description provided for @paywallCta.
  ///
  /// In en, this message translates to:
  /// **'Try Free'**
  String get paywallCta;

  /// No description provided for @paywallCtaAlt.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get paywallCtaAlt;

  /// No description provided for @paywallTrialDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'3 days free · then auto-renews · cancel anytime'**
  String get paywallTrialDisclaimer;

  /// No description provided for @paywallYearlyDisclaimer.
  ///
  /// In en, this message translates to:
  /// **'Auto-renews yearly · cancel anytime'**
  String get paywallYearlyDisclaimer;

  /// No description provided for @paywallTester.
  ///
  /// In en, this message translates to:
  /// **'Tester'**
  String get paywallTester;

  /// No description provided for @introTag1.
  ///
  /// In en, this message translates to:
  /// **'PREDICTION'**
  String get introTag1;

  /// No description provided for @introTag2.
  ///
  /// In en, this message translates to:
  /// **'GROWTH'**
  String get introTag2;

  /// No description provided for @introTag3.
  ///
  /// In en, this message translates to:
  /// **'TRACKING'**
  String get introTag3;

  /// No description provided for @introTag4.
  ///
  /// In en, this message translates to:
  /// **'GAMIFICATION'**
  String get introTag4;

  /// No description provided for @introTag5.
  ///
  /// In en, this message translates to:
  /// **'COMMUNITY'**
  String get introTag5;

  /// No description provided for @introTitle1.
  ///
  /// In en, this message translates to:
  /// **'Discover your\nheight potential'**
  String get introTitle1;

  /// No description provided for @introSubtitle1.
  ///
  /// In en, this message translates to:
  /// **'Let us calculate your full potential\nbased on genetics, age, and lifestyle.'**
  String get introSubtitle1;

  /// No description provided for @introTitle2.
  ///
  /// In en, this message translates to:
  /// **'One step taller\nevery day'**
  String get introTitle2;

  /// No description provided for @introSubtitle2.
  ///
  /// In en, this message translates to:
  /// **'Push your potential with personalized\nexercise and nutrition plans.'**
  String get introSubtitle2;

  /// No description provided for @introTitle3.
  ///
  /// In en, this message translates to:
  /// **'Track every\ncentimeter'**
  String get introTitle3;

  /// No description provided for @introSubtitle3.
  ///
  /// In en, this message translates to:
  /// **'See how your real progress\ndevelops with monthly measurements.'**
  String get introSubtitle3;

  /// No description provided for @introTitle4.
  ///
  /// In en, this message translates to:
  /// **'Level up,\nearn rewards'**
  String get introTitle4;

  /// No description provided for @introSubtitle4.
  ///
  /// In en, this message translates to:
  /// **'Complete 70-day programs,\nearn XP, and unlock new levels.'**
  String get introSubtitle4;

  /// No description provided for @introTitle5.
  ///
  /// In en, this message translates to:
  /// **'Thousands already\ngrew taller'**
  String get introTitle5;

  /// No description provided for @introSubtitle5.
  ///
  /// In en, this message translates to:
  /// **'Join the community of users\nwho reached their goals.'**
  String get introSubtitle5;

  /// No description provided for @criticalWindow.
  ///
  /// In en, this message translates to:
  /// **'CRITICAL WINDOW'**
  String get criticalWindow;

  /// No description provided for @heightPotentialFading.
  ///
  /// In en, this message translates to:
  /// **'Your height potential'**
  String get heightPotentialFading;

  /// No description provided for @fadingAway.
  ///
  /// In en, this message translates to:
  /// **'is fading away!'**
  String get fadingAway;

  /// No description provided for @painHookDesc.
  ///
  /// In en, this message translates to:
  /// **'Every passing day, centimeters are permanently lost without the right habits. But this can still be reversed.'**
  String get painHookDesc;

  /// No description provided for @painGeneticTitle.
  ///
  /// In en, this message translates to:
  /// **'Genetics isn\'t everything'**
  String get painGeneticTitle;

  /// No description provided for @painGeneticDesc.
  ///
  /// In en, this message translates to:
  /// **'Genetics determines 60% — but what you do determines the other 40%. BeTaller is here for exactly that 40%.'**
  String get painGeneticDesc;

  /// No description provided for @painGeneticTag.
  ///
  /// In en, this message translates to:
  /// **'Analysis'**
  String get painGeneticTag;

  /// No description provided for @painSleepTitle.
  ///
  /// In en, this message translates to:
  /// **'Optimize your sleep routine'**
  String get painSleepTitle;

  /// No description provided for @painSleepDesc.
  ///
  /// In en, this message translates to:
  /// **'Proper sleep every night can boost growth hormone production by 70%. BeTaller automates sleep tracking, you just sleep.'**
  String get painSleepDesc;

  /// No description provided for @painSleepTag.
  ///
  /// In en, this message translates to:
  /// **'Tracking'**
  String get painSleepTag;

  /// No description provided for @painPostureTitle.
  ///
  /// In en, this message translates to:
  /// **'Gain centimeters now with posture'**
  String get painPostureTitle;

  /// No description provided for @painPostureDesc.
  ///
  /// In en, this message translates to:
  /// **'Correct posture can instantly add 1.5–3 cm. BeTaller\'s daily posture routine establishes this in a few weeks.'**
  String get painPostureDesc;

  /// No description provided for @painPostureTag.
  ///
  /// In en, this message translates to:
  /// **'Posture'**
  String get painPostureTag;

  /// No description provided for @painExerciseTitle.
  ///
  /// In en, this message translates to:
  /// **'Your custom exercise plan is ready'**
  String get painExerciseTitle;

  /// No description provided for @painExerciseDesc.
  ///
  /// In en, this message translates to:
  /// **'Morning stretches, hanging, spine routines — BeTaller prepared and scheduled these for you. Just 8–12 minutes a day.'**
  String get painExerciseDesc;

  /// No description provided for @painExerciseTag.
  ///
  /// In en, this message translates to:
  /// **'Routines'**
  String get painExerciseTag;

  /// No description provided for @painNutritionTitle.
  ///
  /// In en, this message translates to:
  /// **'Your nutrition directly affects growth'**
  String get painNutritionTitle;

  /// No description provided for @painNutritionDesc.
  ///
  /// In en, this message translates to:
  /// **'Protein, calcium, vitamin D — BeTaller reminds you every day which nutrients to take and when.'**
  String get painNutritionDesc;

  /// No description provided for @painNutritionTag.
  ///
  /// In en, this message translates to:
  /// **'Nutrition'**
  String get painNutritionTag;

  /// No description provided for @painTrackingTitle.
  ///
  /// In en, this message translates to:
  /// **'Track your growth with your own eyes'**
  String get painTrackingTitle;

  /// No description provided for @painTrackingDesc.
  ///
  /// In en, this message translates to:
  /// **'Monthly measurements, progress photos, growth chart — see every centimeter you gain.'**
  String get painTrackingDesc;

  /// No description provided for @painTrackingTag.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get painTrackingTag;

  /// No description provided for @selectYourGender.
  ///
  /// In en, this message translates to:
  /// **'Select your gender'**
  String get selectYourGender;

  /// No description provided for @onboardingPredictSubtitle.
  ///
  /// In en, this message translates to:
  /// **'This will be used to predict your height potential & create your custom plan.'**
  String get onboardingPredictSubtitle;

  /// No description provided for @other.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get other;

  /// No description provided for @whenWereYouBorn.
  ///
  /// In en, this message translates to:
  /// **'When were you born?'**
  String get whenWereYouBorn;

  /// No description provided for @heightAndWeight.
  ///
  /// In en, this message translates to:
  /// **'Height & weight'**
  String get heightAndWeight;

  /// No description provided for @parentsHeight.
  ///
  /// In en, this message translates to:
  /// **'Parents height'**
  String get parentsHeight;

  /// No description provided for @weeklyWorkout.
  ///
  /// In en, this message translates to:
  /// **'Weekly workout'**
  String get weeklyWorkout;

  /// No description provided for @workoutsPerWeek.
  ///
  /// In en, this message translates to:
  /// **'Workouts per week'**
  String get workoutsPerWeek;

  /// No description provided for @whatsYourEthnicity.
  ///
  /// In en, this message translates to:
  /// **'What\'s your ethnicity?'**
  String get whatsYourEthnicity;

  /// No description provided for @whiteCaucasian.
  ///
  /// In en, this message translates to:
  /// **'White / Caucasian'**
  String get whiteCaucasian;

  /// No description provided for @blackAfricanAmerican.
  ///
  /// In en, this message translates to:
  /// **'Black / African American'**
  String get blackAfricanAmerican;

  /// No description provided for @hispanicLatino.
  ///
  /// In en, this message translates to:
  /// **'Hispanic / Latino'**
  String get hispanicLatino;

  /// No description provided for @asian.
  ///
  /// In en, this message translates to:
  /// **'Asian'**
  String get asian;

  /// No description provided for @middleEasternIndigenous.
  ///
  /// In en, this message translates to:
  /// **'Middle Eastern / Indigenous'**
  String get middleEasternIndigenous;

  /// No description provided for @dontWantToAnswer.
  ///
  /// In en, this message translates to:
  /// **'I don\'t want to answer'**
  String get dontWantToAnswer;

  /// No description provided for @footSizeLabel.
  ///
  /// In en, this message translates to:
  /// **'Foot size'**
  String get footSizeLabel;

  /// No description provided for @selectYourSize.
  ///
  /// In en, this message translates to:
  /// **'Select your size'**
  String get selectYourSize;

  /// No description provided for @whatsYourDreamHeight.
  ///
  /// In en, this message translates to:
  /// **'What\'s your dream height?'**
  String get whatsYourDreamHeight;

  /// No description provided for @dreamHeightCalcSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Based on your input, we\'ll calculate the likelihood of achieving this height.'**
  String get dreamHeightCalcSubtitle;

  /// No description provided for @dreamHeightLabel.
  ///
  /// In en, this message translates to:
  /// **'Dream height'**
  String get dreamHeightLabel;

  /// No description provided for @sleepQuestion.
  ///
  /// In en, this message translates to:
  /// **'How many hours do\nyou sleep each night?'**
  String get sleepQuestion;

  /// No description provided for @thousandsSucceeded.
  ///
  /// In en, this message translates to:
  /// **'Thousands\nSucceeded'**
  String get thousandsSucceeded;

  /// No description provided for @youCanToo.
  ///
  /// In en, this message translates to:
  /// **'You can do it too'**
  String get youCanToo;

  /// No description provided for @yearsOld.
  ///
  /// In en, this message translates to:
  /// **'years old'**
  String get yearsOld;

  /// No description provided for @verifiedLabel.
  ///
  /// In en, this message translates to:
  /// **'Verified'**
  String get verifiedLabel;

  /// No description provided for @scientificData.
  ///
  /// In en, this message translates to:
  /// **'SCIENTIFIC DATA'**
  String get scientificData;

  /// No description provided for @longTermResults.
  ///
  /// In en, this message translates to:
  /// **'BeTaller creates\nlong-term results'**
  String get longTermResults;

  /// No description provided for @longTermResultsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Many people don\'t reach their ultimate height due to bad habits.'**
  String get longTermResultsSubtitle;

  /// No description provided for @yourFinalHeight.
  ///
  /// In en, this message translates to:
  /// **'Your final height'**
  String get yourFinalHeight;

  /// No description provided for @badHabitsLegend.
  ///
  /// In en, this message translates to:
  /// **'Bad habits'**
  String get badHabitsLegend;

  /// No description provided for @optimizedLegend.
  ///
  /// In en, this message translates to:
  /// **'Optimized'**
  String get optimizedLegend;

  /// No description provided for @chartFact1Pct.
  ///
  /// In en, this message translates to:
  /// **'30%'**
  String get chartFact1Pct;

  /// No description provided for @chartFact1Desc.
  ///
  /// In en, this message translates to:
  /// **'Height can be changed\nwith habits'**
  String get chartFact1Desc;

  /// No description provided for @chartFact2Pct.
  ///
  /// In en, this message translates to:
  /// **'9-10h'**
  String get chartFact2Pct;

  /// No description provided for @chartFact2Desc.
  ///
  /// In en, this message translates to:
  /// **'Ideal sleep boosts\ngrowth hormone'**
  String get chartFact2Desc;

  /// No description provided for @chartFact3Pct.
  ///
  /// In en, this message translates to:
  /// **'3 cm'**
  String get chartFact3Pct;

  /// No description provided for @chartFact3Desc.
  ///
  /// In en, this message translates to:
  /// **'Can be gained with\nposture improvement'**
  String get chartFact3Desc;

  /// No description provided for @didYouKnow.
  ///
  /// In en, this message translates to:
  /// **'Did you know?'**
  String get didYouKnow;

  /// No description provided for @didYouKnowFact1.
  ///
  /// In en, this message translates to:
  /// **'Daily habits affect 30% of your height'**
  String get didYouKnowFact1;

  /// No description provided for @didYouKnowFact2.
  ///
  /// In en, this message translates to:
  /// **'Spinal compression steals 1.5-3 cm of height'**
  String get didYouKnowFact2;

  /// No description provided for @didYouKnowFact3.
  ///
  /// In en, this message translates to:
  /// **'Sleep deprivation reduces HGH by 70%'**
  String get didYouKnowFact3;

  /// No description provided for @transformJourneyBegins.
  ///
  /// In en, this message translates to:
  /// **'Your Transformation\nJourney Begins'**
  String get transformJourneyBegins;

  /// No description provided for @transformJourneySubtitle.
  ///
  /// In en, this message translates to:
  /// **'A comprehensive program designed to support\nyour healthy growth, step by step.'**
  String get transformJourneySubtitle;

  /// No description provided for @week1Label.
  ///
  /// In en, this message translates to:
  /// **'1W'**
  String get week1Label;

  /// No description provided for @week1Title.
  ///
  /// In en, this message translates to:
  /// **'Week 1'**
  String get week1Title;

  /// No description provided for @week1Desc.
  ///
  /// In en, this message translates to:
  /// **'Spine alignment improves, posture gets better'**
  String get week1Desc;

  /// No description provided for @month1Label.
  ///
  /// In en, this message translates to:
  /// **'1M'**
  String get month1Label;

  /// No description provided for @month1Title.
  ///
  /// In en, this message translates to:
  /// **'Month 1'**
  String get month1Title;

  /// No description provided for @month1Desc.
  ///
  /// In en, this message translates to:
  /// **'First visible centimeters, sleep quality improves'**
  String get month1Desc;

  /// No description provided for @month3Label.
  ///
  /// In en, this message translates to:
  /// **'3M'**
  String get month3Label;

  /// No description provided for @month3Title.
  ///
  /// In en, this message translates to:
  /// **'Month 3'**
  String get month3Title;

  /// No description provided for @month3Desc.
  ///
  /// In en, this message translates to:
  /// **'Average +1.5–2.5 cm gain, muscle development'**
  String get month3Desc;

  /// No description provided for @month6Label.
  ///
  /// In en, this message translates to:
  /// **'6M'**
  String get month6Label;

  /// No description provided for @month6Title.
  ///
  /// In en, this message translates to:
  /// **'Month 6'**
  String get month6Title;

  /// No description provided for @month6Desc.
  ///
  /// In en, this message translates to:
  /// **'Reach maximum potential, live with your new height'**
  String get month6Desc;

  /// No description provided for @reachYourGoal.
  ///
  /// In en, this message translates to:
  /// **'Reach Your Goal'**
  String get reachYourGoal;

  /// No description provided for @journeyBullet1.
  ///
  /// In en, this message translates to:
  /// **'Unlock your maximum potential'**
  String get journeyBullet1;

  /// No description provided for @journeyBullet2.
  ///
  /// In en, this message translates to:
  /// **'Start living with your new height'**
  String get journeyBullet2;

  /// No description provided for @journeyBullet3.
  ///
  /// In en, this message translates to:
  /// **'Write your success story'**
  String get journeyBullet3;

  /// No description provided for @unlockButton.
  ///
  /// In en, this message translates to:
  /// **'Unlock All'**
  String get unlockButton;

  /// No description provided for @dreamHeightOdds.
  ///
  /// In en, this message translates to:
  /// **'Dream height\nodds'**
  String get dreamHeightOdds;

  /// No description provided for @growthCompleteLabel.
  ///
  /// In en, this message translates to:
  /// **'Growth\ncomplete'**
  String get growthCompleteLabel;

  /// No description provided for @tallerThanPct.
  ///
  /// In en, this message translates to:
  /// **'Taller than 76.7% of your age'**
  String get tallerThanPct;

  /// No description provided for @levelNovice.
  ///
  /// In en, this message translates to:
  /// **'Novice'**
  String get levelNovice;

  /// No description provided for @levelBuilder.
  ///
  /// In en, this message translates to:
  /// **'Builder'**
  String get levelBuilder;

  /// No description provided for @levelGrinder.
  ///
  /// In en, this message translates to:
  /// **'Grinder'**
  String get levelGrinder;

  /// No description provided for @levelWarrior.
  ///
  /// In en, this message translates to:
  /// **'Warrior'**
  String get levelWarrior;

  /// No description provided for @levelGodTier.
  ///
  /// In en, this message translates to:
  /// **'God Tier'**
  String get levelGodTier;

  /// No description provided for @levelDesc0.
  ///
  /// In en, this message translates to:
  /// **'Build your foundation'**
  String get levelDesc0;

  /// No description provided for @levelDesc1.
  ///
  /// In en, this message translates to:
  /// **'Accelerate growth'**
  String get levelDesc1;

  /// No description provided for @levelDesc2.
  ///
  /// In en, this message translates to:
  /// **'Intensify training'**
  String get levelDesc2;

  /// No description provided for @levelDesc3.
  ///
  /// In en, this message translates to:
  /// **'Push your limits'**
  String get levelDesc3;

  /// No description provided for @levelDesc4.
  ///
  /// In en, this message translates to:
  /// **'No pain, no gain'**
  String get levelDesc4;

  /// No description provided for @levelDesc5.
  ///
  /// In en, this message translates to:
  /// **'Champion mindset'**
  String get levelDesc5;

  /// No description provided for @levelDesc6.
  ///
  /// In en, this message translates to:
  /// **'Elite performance'**
  String get levelDesc6;

  /// No description provided for @levelDesc7.
  ///
  /// In en, this message translates to:
  /// **'Master your body'**
  String get levelDesc7;

  /// No description provided for @levelDesc8.
  ///
  /// In en, this message translates to:
  /// **'Legendary discipline'**
  String get levelDesc8;

  /// No description provided for @levelDesc9.
  ///
  /// In en, this message translates to:
  /// **'Maximum potential'**
  String get levelDesc9;

  /// No description provided for @levelLabel.
  ///
  /// In en, this message translates to:
  /// **'LEVEL {level}'**
  String levelLabel(int level);

  /// No description provided for @daysLeftProgram.
  ///
  /// In en, this message translates to:
  /// **'{days} days left in your program'**
  String daysLeftProgram(int days);

  /// No description provided for @tapLabel.
  ///
  /// In en, this message translates to:
  /// **'TAP'**
  String get tapLabel;

  /// No description provided for @kcalPer100g.
  ///
  /// In en, this message translates to:
  /// **'{calories} kcal / 100g'**
  String kcalPer100g(int calories);

  /// No description provided for @dayShort.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get dayShort;

  /// No description provided for @legendShort.
  ///
  /// In en, this message translates to:
  /// **'Short'**
  String get legendShort;

  /// No description provided for @legendBelowAvg.
  ///
  /// In en, this message translates to:
  /// **'Below avg'**
  String get legendBelowAvg;

  /// No description provided for @legendAverage.
  ///
  /// In en, this message translates to:
  /// **'Average'**
  String get legendAverage;

  /// No description provided for @legendTall.
  ///
  /// In en, this message translates to:
  /// **'Tall'**
  String get legendTall;

  /// No description provided for @legendVeryTall.
  ///
  /// In en, this message translates to:
  /// **'Very tall'**
  String get legendVeryTall;

  /// No description provided for @pctBottom5.
  ///
  /// In en, this message translates to:
  /// **'Bottom 5%'**
  String get pctBottom5;

  /// No description provided for @pctBottom25.
  ///
  /// In en, this message translates to:
  /// **'Bottom 25%'**
  String get pctBottom25;

  /// No description provided for @pctMedian.
  ///
  /// In en, this message translates to:
  /// **'Median'**
  String get pctMedian;

  /// No description provided for @pctTop25.
  ///
  /// In en, this message translates to:
  /// **'Top 25%'**
  String get pctTop25;

  /// No description provided for @pctTop5.
  ///
  /// In en, this message translates to:
  /// **'Top 5%'**
  String get pctTop5;

  /// No description provided for @fallingBehind.
  ///
  /// In en, this message translates to:
  /// **'Falling behind'**
  String get fallingBehind;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
    'de',
    'en',
    'es',
    'fr',
    'hi',
    'it',
    'pt',
    'tr',
  ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'pt':
      return AppLocalizationsPt();
    case 'tr':
      return AppLocalizationsTr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
