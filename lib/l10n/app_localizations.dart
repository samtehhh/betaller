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
  /// **'No data'**
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
