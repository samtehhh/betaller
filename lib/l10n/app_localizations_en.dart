// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get navHome => 'Home';

  @override
  String get navAnalysis => 'Analysis';

  @override
  String get navRoutines => 'My Plan';

  @override
  String get disciplineTitle => 'Discipline';

  @override
  String get disciplineProgramTitle => 'Discipline programme';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total days';
  }

  @override
  String get disciplineCompleteDay => 'Complete the day';

  @override
  String disciplineDayN(int n) {
    return 'Day $n';
  }

  @override
  String get disciplineLevels => 'Levels';

  @override
  String get disciplineLevelDone => 'Done';

  @override
  String get disciplineLocked => 'Locked';

  @override
  String get disciplineTodayIs => 'Today';

  @override
  String get disciplineToday => 'Today';

  @override
  String get disciplineTodayPlan => 'Today\'s plan';

  @override
  String get disciplineWeek => 'This week';

  @override
  String get disciplineMonth => 'This month';

  @override
  String get disciplineLevel => 'Discipline level';

  @override
  String disciplineStreakDays(int days) {
    return '$days day streak';
  }

  @override
  String disciplineToNext(int days) {
    return '$days days to the next level';
  }

  @override
  String get disciplineMaxTier => 'Top level reached';

  @override
  String get disciplineTierSpark => 'Spark';

  @override
  String get disciplineTierSteady => 'Steady';

  @override
  String get disciplineTierSharp => 'Sharp';

  @override
  String get disciplineTierSolid => 'Solid';

  @override
  String get disciplineTierRelentless => 'Relentless';

  @override
  String get disciplineTierUnbroken => 'Unbroken';

  @override
  String get disciplineTierLegend => 'Legend';

  @override
  String get goalPerfectDays => 'Days you finished the plan';

  @override
  String get goalWorkouts => 'Training sessions';

  @override
  String get goalMeasurement => 'Height measurement';

  @override
  String get goalPhoto => 'Progress photo';

  @override
  String get goalPostureCheck => 'Posture check';

  @override
  String get disciplineAllDone => 'Today\'s done';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total done';
  }

  @override
  String get navProgress => 'Progress';

  @override
  String get trackingSection => 'Your tracking tools';

  @override
  String get photosBenefit =>
      'Before and after, side by side. See the change instead of reading it.';

  @override
  String get postureBenefit =>
      'Kyphosis, lordosis and head position. Good posture alone is worth 2-3 cm.';

  @override
  String get reportBenefit =>
      'Score your week day by day and see where it slipped.';

  @override
  String get photosCta => 'Add a photo';

  @override
  String get postureCta => 'Analyse';

  @override
  String get reportCta => 'Open the report';

  @override
  String get toolStateReady => 'Ready';

  @override
  String get photosSummaryEmpty => 'Add your first photo';

  @override
  String photosSummaryCount(int count) {
    return '$count photos';
  }

  @override
  String get postureSummaryEmpty => 'No analysis yet';

  @override
  String postureSummaryScore(int score) {
    return '$score/100 posture';
  }

  @override
  String get navProfile => 'Profile';

  @override
  String greeting(String name) {
    return 'Hello, $name';
  }

  @override
  String get currentHeight => 'Current Height';

  @override
  String get target => 'Target';

  @override
  String completed(String pct) {
    return '$pct% completed';
  }

  @override
  String remaining(String cm, String unit) {
    return '+$cm $unit left';
  }

  @override
  String get updateAnalysis => 'Update Analysis';

  @override
  String get analysisSubtitle => 'Get predictions from past heights + habits';

  @override
  String get dailyRoutines => 'Daily Routines';

  @override
  String get allRoutinesDone => 'All routines completed!';

  @override
  String get water => 'Water';

  @override
  String get sleep => 'Sleep';

  @override
  String get growthSummary => 'Growth Summary';

  @override
  String get total => 'TOTAL';

  @override
  String get last => 'LAST';

  @override
  String get measurement => 'MEAS.';

  @override
  String get dailyTip => 'Tip of the Day';

  @override
  String get waterTracking => 'Water Tracking';

  @override
  String get waterGoalReached => 'Daily goal reached';

  @override
  String waterRemaining(String amount) {
    return '$amount L to go';
  }

  @override
  String get undo => 'Undo';

  @override
  String waterToday(String amount) {
    return 'Today: $amount L';
  }

  @override
  String get sleepTracking => 'Sleep Tracking';

  @override
  String sleepTarget(String hours) {
    return 'Target: $hours hours';
  }

  @override
  String get hours => 'hours';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get analysis => 'Analysis';

  @override
  String get betallerScore => 'BeTaller Score';

  @override
  String get genetic => 'Genetic';

  @override
  String get growth => 'Growth';

  @override
  String get nutrition => 'Nutrition';

  @override
  String get sleepLabel => 'Sleep';

  @override
  String get discipline => 'Discipline';

  @override
  String get improveScore => 'Boost Your Score';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Nutrition Critical!';

  @override
  String get nutritionStrengthen => 'Strengthen Nutrition';

  @override
  String get sleepRecordAdd => 'Add Sleep Record';

  @override
  String get sleepPoor => 'Poor Sleep Schedule';

  @override
  String get sleepImprove => 'Improve Sleep';

  @override
  String get startToday => 'Start Today!';

  @override
  String routinesRemaining(int count) {
    return '$count Routines Left';
  }

  @override
  String get keepStreak => 'Keep the Streak';

  @override
  String get addFirstMeasurement => 'Add First Measurement';

  @override
  String get addMeasurement => 'Add Measurement';

  @override
  String waterHalfNotReached(String amount) {
    return 'You haven\'t reached half your water goal today. Drink ${amount}L more.';
  }

  @override
  String waterAlmostDone(String amount) {
    return '${amount}L left to reach water goal. Almost there!';
  }

  @override
  String bmiLow(String bmi) {
    return 'Your BMI is $bmi — a bit low. Increase protein and calorie intake.';
  }

  @override
  String get bodyFactsTitle => 'Your body';

  @override
  String get dailyNeedsTitle => 'Your daily targets';

  @override
  String bmiHigh(String bmi) {
    return 'Your BMI is $bmi — a bit high. Focus on healthy eating.';
  }

  @override
  String get nutritionDefault =>
      'Complete your water goal and maintain balanced nutrition.';

  @override
  String sleepNoRecord(String hours) {
    return 'No sleep record today. Aim for $hours hours and log it.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'You slept $current hours today — $missing hours short. Go to bed earlier!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Almost there. Reaching $hours hours will maximize growth hormone.';
  }

  @override
  String get sleepGood => 'Great sleep schedule! Keep it up.';

  @override
  String noRoutinesDone(int total) {
    return 'No routines completed today. Start with one of $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total routines done today. $left more to go!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Great job today! $needed more days to start a streak.';
  }

  @override
  String streakContinue(int days) {
    return '$days day streak! Your score rises as you continue.';
  }

  @override
  String get noMeasurements =>
      'No height measurements yet. Add your first for accurate predictions.';

  @override
  String fewMeasurements(int count) {
    return 'Add $count more measurements to calculate growth velocity.';
  }

  @override
  String goodMeasurements(int count) {
    return 'You have $count measurements. Reaching 5 will greatly improve accuracy.';
  }

  @override
  String get keepMeasuring =>
      'Keep adding measurements. Every new data point improves predictions.';

  @override
  String get heightPrediction => 'Height Prediction';

  @override
  String get predictedHeightAt21 => 'Predicted height at 21';

  @override
  String get predictionMethod =>
      'Calculated by combining genetic (parents), growth velocity, BMI and age data.';

  @override
  String get growthStatus => 'Growth Status';

  @override
  String get growthRemaining => 'Still ahead of you';

  @override
  String get growthBreakdown => 'Where those centimetres come from';

  @override
  String get geneticGainLabel => 'Genetic Gain';

  @override
  String get lifestyleLabel => 'Lifestyle';

  @override
  String get geneticCeilingLabel => 'Ceiling';

  @override
  String get reachableTargetHeight => 'Your reachable target height';

  @override
  String get geneticCeilingProgress => 'Progress toward genetic ceiling';

  @override
  String get completionLabel => 'COMPLETION';

  @override
  String get growthVelocity => 'GROWTH VELOCITY';

  @override
  String get noData => 'NO DATA';

  @override
  String growthRate(String rating) {
    return 'Growth rate: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'Calories';

  @override
  String get kcalDay => 'kcal/day';

  @override
  String get daily => 'daily';

  @override
  String get protein => 'Protein';

  @override
  String get minimum => 'minimum';

  @override
  String get age => 'Age';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get yearlyPrediction => 'YEARLY PREDICTION';

  @override
  String ageYear(int age) {
    return '$age yrs';
  }

  @override
  String get progressTitle => 'Progress Tracking';

  @override
  String get totalGrowth => 'Total';

  @override
  String get lastDiff => 'Last Diff';

  @override
  String get measurementCount => 'Meas.';

  @override
  String get heightChart => 'Height Chart';

  @override
  String get chartMinData => 'At least 2 measurements needed for chart';

  @override
  String get chartInstruction => 'Add measurements to see your progress chart!';

  @override
  String get addMeasurementButton => 'ADD NEW MEASUREMENT';

  @override
  String get measurementHistory => 'MEASUREMENT HISTORY';

  @override
  String get deleteTitle => 'Delete Measurement';

  @override
  String get deleteMessage =>
      'Are you sure you want to delete this measurement?';

  @override
  String get dismiss => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get newMeasurement => 'New Height Measurement';

  @override
  String get routines => 'Routines';

  @override
  String streakDays(int days) {
    return '$days Days';
  }

  @override
  String get progressStatus => 'Progress Status';

  @override
  String get completedLabel => 'Completed!';

  @override
  String get all => 'All';

  @override
  String get exercise => 'Exercise';

  @override
  String get posture => 'Posture';

  @override
  String bestStreak(int days) {
    return 'Best: $days days';
  }

  @override
  String get editProfile => 'Edit Profile';

  @override
  String get editProfileSubtitle => 'Update height, weight, age info';

  @override
  String get name => 'Name';

  @override
  String birthDate(String date) {
    return 'Birth: $date';
  }

  @override
  String get heightCm => 'Height (cm)';

  @override
  String get weightKg => 'Weight (kg)';

  @override
  String get fatherHeight => 'Father\'s Height (cm)';

  @override
  String get motherHeight => 'Mother\'s Height (cm)';

  @override
  String get notifications => 'Notifications';

  @override
  String get reminderNextLabel => 'Next reminder';

  @override
  String get reminderManageHint => 'Manage your reminders';

  @override
  String get reminderOffCta => 'Turn notifications on';

  @override
  String get stateOn => 'On';

  @override
  String get stateOff => 'Off';

  @override
  String get reminderMasterTitle => 'Notifications';

  @override
  String reminderActiveCount(int count) {
    return '$count reminders on';
  }

  @override
  String get reminderBuiltIn => 'Built-in reminders';

  @override
  String get reminderYourOwn => 'Your own reminders';

  @override
  String get reminderAdd => 'Add a reminder';

  @override
  String get reminderDays => 'Days';

  @override
  String get reminderEveryDay => 'Every day';

  @override
  String get reminderLabelHint => 'What should we remind you of?';

  @override
  String get reminderEmptyHint =>
      'Add your own: training, vitamins, stretching, whatever you need.';

  @override
  String get reminderCustom => 'Reminder';

  @override
  String get reminderCustomBody => 'The time you set has come.';

  @override
  String get reminderExercise => 'Exercise';

  @override
  String get reminderNutrition => 'Nutrition';

  @override
  String get reminderWater => 'Water';

  @override
  String get reminderPosture => 'Posture';

  @override
  String get reminderRoutine => 'Daily routine';

  @override
  String get reminderSleep => 'Sleep';

  @override
  String get reminderMeasurement => 'Height measurement';

  @override
  String get notificationsOn => 'Reminders active';

  @override
  String get notificationsOff => 'Reminders off';

  @override
  String get premium => 'Upgrade to Premium';

  @override
  String get premiumSubtitle => 'Unlock all features';

  @override
  String get rateUs => 'Rate Us';

  @override
  String get rateSubtitle => 'Enjoying the app? Give us 5 stars!';

  @override
  String get share => 'Share App';

  @override
  String get shareSubtitle => 'Tell your friends about BeTaller';

  @override
  String get shareText =>
      'I discovered my growth potential with BeTaller! Try it too: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Give Feedback';

  @override
  String get feedbackSubtitle => 'Contact us';

  @override
  String get resetData => 'Reset All Data';

  @override
  String get resetSubtitle => 'All data will be deleted';

  @override
  String get resetTitle => 'Reset Data';

  @override
  String get resetMessage =>
      'All data will be deleted and you\'ll return to the onboarding screen. This cannot be undone!';

  @override
  String get reset => 'Reset';

  @override
  String get premiumSoon => 'Premium coming soon!';

  @override
  String get brandingSubtitle => 'Discover your growth potential';

  @override
  String get statistics => 'Statistics';

  @override
  String get profileGroupSupport => 'Support';

  @override
  String get profileGroupAccount => 'Account';

  @override
  String get profileGroupApp => 'App';

  @override
  String get profileGroupDanger => 'Danger zone';

  @override
  String profileMemberSince(String date) {
    return 'Since $date';
  }

  @override
  String get profileYourJourney => 'Your journey';

  @override
  String get profileTotalGrowth => 'Total';

  @override
  String get currentStreak => 'Current Streak';

  @override
  String get bestStreakLabel => 'Best Streak';

  @override
  String get achievementLabel => 'Achievement';

  @override
  String get achievements => 'Achievements';

  @override
  String get achievementUnlockedTitle => '🏆 Achievement unlocked!';

  @override
  String get reminderTapHint => 'Tap one to change its time and days';

  @override
  String get earned => 'Earned!';

  @override
  String get notEarned => 'Not yet earned';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Language';

  @override
  String get languageSubtitle => 'Change app language';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Discover your growth potential';

  @override
  String get onboardingMeetYou => 'Let\'s Get to Know You';

  @override
  String get onboardingInfoNeeded => 'Basic info needed for analysis.';

  @override
  String get gender => 'GENDER';

  @override
  String get birthDateLabel => 'BIRTH DATE';

  @override
  String get bodyMeasurements => 'Body Measurements';

  @override
  String get bodyInfo =>
      'Your current height and weight are needed for analysis.';

  @override
  String get geneticData => 'Genetic Data';

  @override
  String get geneticInfo => 'Parent heights determine your genetic potential.';

  @override
  String get pastHeights => 'Past Heights';

  @override
  String get pastHeightsInfo =>
      'Enter heights you remember at different ages. You can leave blanks.';

  @override
  String get heightHint => 'Enter height...';

  @override
  String get ageLabel => 'age';

  @override
  String get habits => 'Your Habits';

  @override
  String get habitsInfo => 'Your lifestyle directly affects predictions.';

  @override
  String get weeklyExercise => 'Weekly Exercise';

  @override
  String get dailySleep => 'Daily Sleep';

  @override
  String get nutritionQuality => 'NUTRITION QUALITY';

  @override
  String get nutritionDesc => 'Protein, dairy, vegetables, fruit intake';

  @override
  String get nutritionBad => 'Bad';

  @override
  String get nutritionPoor => 'Poor';

  @override
  String get nutritionMedium => 'Average';

  @override
  String get nutritionGood => 'Good';

  @override
  String get nutritionGreat => 'Great';

  @override
  String get startAnalysis => 'Start Analysis';

  @override
  String get continueBtn => 'Continue';

  @override
  String get analyzeBtn => 'Analyze';

  @override
  String get analyzing => 'Analyzing';

  @override
  String get analysisComplete => 'Completed!';

  @override
  String get analysisDataReceivedTitle => 'Data Received';

  @override
  String get analysisDataReceivedSubtitle => 'Starting your analysis...';

  @override
  String get yourScore => 'Your BeTaller Score';

  @override
  String get letsStart => 'Let\'s Start';

  @override
  String get splashJourneySubtitle => 'Your journey begins. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Your personalized plan is ready.\nReady to discover your height potential?';

  @override
  String get doneBtn => 'Done';

  @override
  String get analysisStep1 => 'Analyzing genetic data...';

  @override
  String get analysisStep2 => 'Calculating growth velocity...';

  @override
  String get analysisStep3 => 'Processing nutrition and sleep data...';

  @override
  String get analysisStep4 => 'Generating height prediction...';

  @override
  String get analysisStep5 => 'Calculating BeTaller score...';

  @override
  String growthPotential(String cm, String unit) {
    return '+$cm $unit growth potential';
  }

  @override
  String get heightAt21 => 'at age 21';

  @override
  String confidenceLevel(String pct) {
    return '$pct% confidence level';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return '$min - $max $unit range';
  }

  @override
  String get currentLabel => 'CURRENT';

  @override
  String get predictedLabel => 'PREDICTED';

  @override
  String get yearlyPredictions => 'Yearly Predictions';

  @override
  String get tipMorningMeasure =>
      'Measure your height in the morning. Pressure on your discs makes you a little shorter during the day, so the morning reading is the most accurate.';

  @override
  String get tipProteinSpread =>
      'Spread protein intake across meals. Don\'t eat all at once, have protein with every meal.';

  @override
  String get tipGrowthHormone =>
      'Growth hormone peaks during sleep. Be asleep between 10 PM-2 AM!';

  @override
  String get tipVitaminD =>
      '15 minutes of daily sun exposure increases vitamin D production. Vitamin D is essential for calcium absorption.';

  @override
  String get tipBarHanging =>
      'Bar hanging decompresses the spine. Try 3x30 seconds daily.';

  @override
  String get tipSwimming =>
      'Swimming is the best sport for full-body workout and height growth support.';

  @override
  String get tipStress =>
      'Stress suppresses growth hormone. Reduce stress with meditation and yoga.';

  @override
  String get routineMorningStretch => 'Morning Stretching';

  @override
  String get routineMorningStretchDesc =>
      'Do 10 minutes of stretching right after waking up. Stretch spine and leg muscles.';

  @override
  String get routineBarHanging => 'Bar Hanging';

  @override
  String get routineBarHangingDesc =>
      'Hang from a pull-up bar to extend the spine. 3 sets x 30 seconds.';

  @override
  String get routineCobraStretch => 'Cobra Stretch';

  @override
  String get routineCobraStretchDesc =>
      'Lie face down and lift upper body. Stretch the spine. 3 sets x 15 seconds.';

  @override
  String get routineJumping => 'Jumping Exercises';

  @override
  String get routineJumpingDesc =>
      'Jump rope or squat jumps. Stimulates growth plates. 3 sets x 20 reps.';

  @override
  String get routineSwimming => 'Swimming or Basketball';

  @override
  String get routineSwimmingDesc =>
      'Do a sport that supports height growth. At least 30 minutes.';

  @override
  String get routineYoga => 'Evening Yoga & Stretching';

  @override
  String get routineYogaDesc =>
      'Yoga and stretching routine before bed. Release stress, relax muscles.';

  @override
  String get routineProtein => 'Protein Intake';

  @override
  String get routineProteinDesc =>
      'Eggs, chicken, fish, dairy. At least 1.5g/kg protein daily.';

  @override
  String get routineCalcium => 'Calcium & Vitamin D';

  @override
  String get routineCalciumDesc =>
      'Consume milk, cheese, yogurt. Sunbathe 15 min. Critical for bone development.';

  @override
  String get routineWater => 'Water Intake Goal';

  @override
  String get routineWaterDesc =>
      'Drink at least 2-3 liters of water daily. Essential for metabolism and growth.';

  @override
  String get routineAvoidJunk => 'Avoid Junk Food';

  @override
  String get routineAvoidJunkDesc =>
      'Stay away from fast food, sugary drinks and processed foods.';

  @override
  String get routineSleep => 'Quality Sleep (8-10 hrs)';

  @override
  String get routineSleepDesc =>
      'Growth hormone is released during sleep. 10 PM-6 AM are golden hours.';

  @override
  String get routineNoScreen => 'Screen Break Before Bed';

  @override
  String get routineNoScreenDesc =>
      'Put away phone and computer 1 hour before bed. Don\'t block melatonin production.';

  @override
  String get routinePosture => 'Posture Check';

  @override
  String get routinePostureDesc =>
      'Keep back straight, shoulders back. Check every hour. Good posture = 2-3 cm difference.';

  @override
  String get routineWallStand => 'Wall Stand Exercise';

  @override
  String get routineWallStandDesc =>
      'Lean back against wall: heels, hips, shoulders, head touching wall. Hold 5 min.';

  @override
  String get routineSprintIntervals => 'Sprint Interval Training';

  @override
  String get routineSprintIntervalsDesc =>
      'Sprint interval training triggers significant growth hormone release through high-intensity bursts.';

  @override
  String get routineHiitWorkout => 'HIIT Workout';

  @override
  String get routineHiitWorkoutDesc =>
      'High intensity interval training to maximize growth hormone release.';

  @override
  String get routineSquats => 'Bodyweight Squats';

  @override
  String get routineSquatsDesc =>
      'Bodyweight squats stimulate growth plates in legs and spine.';

  @override
  String get routineDeadliftStretch => 'Deadlift Stretch';

  @override
  String get routineDeadliftStretchDesc =>
      'Deadlift stretch for spinal decompression and vertebral disc health.';

  @override
  String get routineOverheadPress => 'Overhead Press';

  @override
  String get routineOverheadPressDesc =>
      'Overhead pressing stretches the spine and strengthens posture muscles.';

  @override
  String get routineSkippingRope => 'Skipping Rope';

  @override
  String get routineSkippingRopeDesc =>
      'Repetitive jumping with a skipping rope stimulates growth plates in lower extremities.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Pilates core exercises support spinal alignment and posture.';

  @override
  String get routineInversionHang => 'Inversion Hanging';

  @override
  String get routineInversionHangDesc =>
      'Inversion decompresses spinal discs, can temporarily add 1-2cm.';

  @override
  String get routineZincIntake => 'Zinc Rich Foods';

  @override
  String get routineZincIntakeDesc =>
      'Consume zinc-rich foods throughout the day for growth hormone production.';

  @override
  String get routineVitaminDSunlight => 'Vitamin D & Sunlight';

  @override
  String get routineVitaminDSunlightDesc =>
      'Get at least 15 minutes of direct sunlight for Vitamin D synthesis and bone growth.';

  @override
  String get routineArginineFoods => 'Arginine Rich Foods';

  @override
  String get routineArginineFoodsDesc =>
      'Eat arginine-rich foods to stimulate growth hormone secretion.';

  @override
  String get routineDailyCalories => 'Daily Calorie Target';

  @override
  String get routineDailyCaloriesDesc =>
      'Hit your daily calorie target. Undereating slows growth.';

  @override
  String get routineSleepEnvironment => 'Optimize Sleep Environment';

  @override
  String get routineSleepEnvironmentDesc =>
      'Create a dark, cool sleeping environment to maximize melatonin and growth hormone release.';

  @override
  String get routinePreSleepRoutine => 'Pre-Sleep Wind Down';

  @override
  String get routinePreSleepRoutineDesc =>
      'A consistent pre-sleep routine improves deep sleep quality by 23%.';

  @override
  String get routineNeckStretches => 'Neck Stretches';

  @override
  String get routineNeckStretchesDesc =>
      'Neck stretches relieve compression and improve cervical alignment.';

  @override
  String get routineShoulderRolls => 'Shoulder Rolls & Opens';

  @override
  String get routineShoulderRollsDesc =>
      'Opening shoulders corrects forward posture, can add 1-2cm in appearance.';

  @override
  String get achieveCommitment => 'Commitment';

  @override
  String get achieveCommitmentDesc =>
      'Enter all your data, fully explore the app, and start using it';

  @override
  String get achieveFirstDay => 'First Step';

  @override
  String get achieveFirstDayDesc => 'Complete your first day';

  @override
  String get achieveThreeStreak => '3 Day Streak';

  @override
  String get achieveThreeStreakDesc => 'Complete routines 3 days in a row';

  @override
  String get achieveWeekStreak => '7 Day Streak';

  @override
  String get achieveWeekStreakDesc => 'Complete routines 7 days in a row';

  @override
  String get achieveTwoWeekStreak => '14 Day Streak';

  @override
  String get achieveTwoWeekStreakDesc => 'Keep going for 14 days straight';

  @override
  String get achieveMonthStreak => '30 Day Streak';

  @override
  String get achieveMonthStreakDesc => 'Complete 30 days in a row';

  @override
  String get achieveTwoMonthStreak => '60 Day Streak';

  @override
  String get achieveTwoMonthStreakDesc => 'Complete 60 days in a row';

  @override
  String get achieveHundredStreak => '100 Day Streak';

  @override
  String get achieveHundredStreakDesc => 'Complete 100 days in a row';

  @override
  String get achieveFirstMeasure => 'First Measurement';

  @override
  String get achieveFirstMeasureDesc => 'Record your first height measurement';

  @override
  String get achieveThreeMeasures => 'Tracker';

  @override
  String get achieveThreeMeasuresDesc => 'Record 3 height measurements';

  @override
  String get achieveFiveMeasures => 'Regular Tracking';

  @override
  String get achieveFiveMeasuresDesc => 'Record 5 height measurements';

  @override
  String get achieveTenMeasures => 'Data Hunter';

  @override
  String get achieveTenMeasuresDesc => 'Record 10 height measurements';

  @override
  String get achieveFirstCm => 'First Centimeter';

  @override
  String get achieveFirstCmDesc => 'Record 1 cm total growth';

  @override
  String get achieveThreeCm => '3 cm Growth';

  @override
  String get achieveThreeCmDesc => 'Record 3 cm total growth';

  @override
  String get achieveFiveCm => '5 cm Growth';

  @override
  String get achieveFiveCmDesc => 'Record 5 cm total growth';

  @override
  String get achieveTenCm => '10 cm Growth';

  @override
  String get achieveTenCmDesc => 'Record 10 cm total growth';

  @override
  String get quote1 => 'Be better than yesterday, every day.';

  @override
  String get quote2 =>
      'Growth doesn\'t happen overnight, but every night brings you closer.';

  @override
  String get quote3 => 'Growth takes patience, keep going!';

  @override
  String get quote4 => 'The step you take today builds tomorrow\'s foundation.';

  @override
  String get quote5 => 'Discipline starts where motivation ends.';

  @override
  String get quote6 => 'Your body will thank you, keep going!';

  @override
  String get quote7 => 'You set the limits of your potential.';

  @override
  String get quote8 => 'Small steps create big changes.';

  @override
  String get quote9 => 'The best investment is in yourself.';

  @override
  String get quote10 => 'You\'re getting closer to your goal every day.';

  @override
  String get quote11 => 'Change is hard, but regret is harder.';

  @override
  String get quote12 => 'Your body is a temple, take care of it.';

  @override
  String get quote13 => 'Your rival is yesterday\'s you. Beat it today!';

  @override
  String get quote14 => 'BeTaller = Patience + Discipline + Belief';

  @override
  String get quote15 => 'Believe in yourself, the process will shape you.';

  @override
  String get quote16 => 'Don\'t say I can\'t today, don\'t regret tomorrow.';

  @override
  String get quote17 => 'Show progress every day, even if it\'s just 1%.';

  @override
  String get quote18 => 'The mirror will show your progress, be patient.';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiUnderweight => 'Underweight';

  @override
  String get bmiOverweight => 'Overweight';

  @override
  String get bmiObese => 'Obese';

  @override
  String get velocityExcellent => 'Excellent';

  @override
  String get velocityNormal => 'Normal';

  @override
  String get velocitySlow => 'Slow';

  @override
  String get velocityVeryLow => 'Very Low';

  @override
  String durationMinutes(String min) {
    return '$min min';
  }

  @override
  String get durationAllDay => 'All day';

  @override
  String get durationNight => 'Night';

  @override
  String durationHours(String hours) {
    return '$hours hours';
  }

  @override
  String get onboardingStep1 => 'Enter your personal info';

  @override
  String get onboardingStep2 => 'Share your past heights';

  @override
  String get onboardingStep3 => 'Evaluate your habits';

  @override
  String get onboardingStep4 => 'See your prediction and score';

  @override
  String get hoursShort => 'hr';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get systemLanguage => 'System Language';

  @override
  String get emailSubject => 'BeTaller Feedback';

  @override
  String get pastHeightsTip =>
      'You can leave unknown ages blank. Entering 1-2 past heights is enough.';

  @override
  String get obPastHeightsTitle => 'Past Heights';

  @override
  String get obPastHeightsSubPart1 =>
      'Enter your past heights to boost your prediction confidence to ';

  @override
  String get obPastHeightsSubPart2 => ' higher.';

  @override
  String obHowTallAtAge(String age) {
    return 'How tall were you at age $age?';
  }

  @override
  String get obSkip => 'Skip';

  @override
  String get obNext => 'Next';

  @override
  String get obSkipAll => 'Skip All';

  @override
  String get currentSuffix => '(current)';

  @override
  String personalizedProtein(String amount) {
    return 'Eggs, chicken, fish, dairy. Eat at least ${amount}g protein daily.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Drink at least ${amount}L water daily. Essential for metabolism and growth.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Growth hormone releases during sleep. Sleep at least $hours hours. 10PM-6AM golden hours.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Consume milk, cheese, yogurt. Sun 15 min. Daily calorie goal: $calories kcal.';
  }

  @override
  String get scoreS =>
      'Excellent! You\'re reaching the peak of your potential.';

  @override
  String get scoreA =>
      'Going great! Small improvements can take you to the top.';

  @override
  String get scoreB =>
      'On the right track. Focus a bit more on routines and nutrition.';

  @override
  String get scoreC =>
      'Room for improvement. Regular routines will make a difference.';

  @override
  String get scoreD => 'High potential but you need to take action.';

  @override
  String get scoreF =>
      'Start now! A small step every day makes a big difference.';

  @override
  String get cmPerYear => 'cm/year';

  @override
  String get howToDoIt => 'How to Do It';

  @override
  String get musclesTargeted => 'Muscles & Bones Targeted';

  @override
  String get scientificBasis => 'Scientific Basis';

  @override
  String setXofY(String current, String total) {
    return 'Set $current of $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Rest before Set $set';
  }

  @override
  String get allSetsComplete => 'All Sets Complete!';

  @override
  String get setTimer => 'Set Timer';

  @override
  String get setTracker => 'Set Tracker';

  @override
  String get builtInTimer => 'Built-in Timer';

  @override
  String get markComplete => 'Mark Complete';

  @override
  String get markIncomplete => 'Mark Incomplete';

  @override
  String get done => 'Done';

  @override
  String get doneExclamation => 'Done!';

  @override
  String get start => 'Start';

  @override
  String get pause => 'Pause';

  @override
  String get resetTimer => 'Reset';

  @override
  String get skipRest => 'Skip Rest';

  @override
  String get restart => 'Restart';

  @override
  String get perSet => 'per set';

  @override
  String get rest => 'REST';

  @override
  String get reps => 'reps';

  @override
  String get difficultyBeginner => 'Beginner';

  @override
  String get difficultyIntermediate => 'Intermediate';

  @override
  String get difficultyAdvanced => 'Advanced';

  @override
  String get learnTitle => 'Learn';

  @override
  String get learnSubtitle => 'Science-backed knowledge for growth';

  @override
  String get categoryAll => 'All';

  @override
  String get categoryScience => 'Science';

  @override
  String get categoryNutrition => 'Nutrition';

  @override
  String get categoryExercise => 'Exercise';

  @override
  String get categorySleep => 'Sleep';

  @override
  String get categoryMyths => 'Myths';

  @override
  String get scientificReferences => 'Scientific References';

  @override
  String get relatedRoutines => 'Related Routines';

  @override
  String get nutritionTitle => 'Nutrition';

  @override
  String get sectionMealPlan => 'Meal Plan';

  @override
  String get sectionNutrients => 'Nutrients';

  @override
  String get sectionFoods => 'Foods';

  @override
  String get sectionSupplements => 'Supplements';

  @override
  String todaysPlan(String day) {
    return 'Today\'s Plan — $day';
  }

  @override
  String get breakfast => 'Breakfast';

  @override
  String get lunch => 'Lunch';

  @override
  String get dinner => 'Dinner';

  @override
  String get snacks => 'Snacks';

  @override
  String get searchFoods => 'Search foods...';

  @override
  String nFoods(String count) {
    return '$count foods';
  }

  @override
  String dailyLabel(String amount) {
    return 'Daily: $amount';
  }

  @override
  String get dailyNeedByAge => 'DAILY NEED BY AGE';

  @override
  String agePrefix(String range) {
    return 'Age $range';
  }

  @override
  String get topFoodSources => 'TOP FOOD SOURCES';

  @override
  String get categoryDairy => 'Dairy';

  @override
  String get categoryMeatFish => 'Meat & Fish';

  @override
  String get categoryVegetables => 'Vegetables';

  @override
  String get categoryFruits => 'Fruits';

  @override
  String get categoryGrains => 'Grains & Legumes';

  @override
  String get categoryNutsSeeds => 'Nuts & Seeds';

  @override
  String get weeklyReportTitle => 'Weekly Report';

  @override
  String get weeklyScoreLabel => 'Week score';

  @override
  String get weeklyDailyCompletion => 'Day by day';

  @override
  String get weeklyHabits => 'Habits';

  @override
  String get overview => 'Overview';

  @override
  String get routinesLabel => 'Routines';

  @override
  String get streakLabel => 'Streak';

  @override
  String get heightLabel => 'Height';

  @override
  String get weightLabel => 'Weight';

  @override
  String get dadLabel => 'Dad';

  @override
  String get motherLabel => 'Mother';

  @override
  String get metricShort => 'Metric';

  @override
  String get imperialShort => 'Imperial';

  @override
  String get dailyScores => 'Daily Scores';

  @override
  String get waterToday2 => 'Water Today';

  @override
  String get sleepToday => 'Sleep Today';

  @override
  String get routineCompletion => 'Routine Completion';

  @override
  String get xpAndLevel => 'XP & Level';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP to next level';
  }

  @override
  String get activeChallenges => 'Active Challenges';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m completed';
  }

  @override
  String get shareYourProgress => 'Share Your Progress';

  @override
  String get shareComingSoon => 'Share feature coming soon!';

  @override
  String get premiumTest => 'Premium (Test)';

  @override
  String get premiumActive => 'Active';

  @override
  String get premiumFree => 'Free';

  @override
  String get weeklyReportMenu => 'Weekly Report';

  @override
  String get weeklyReportMenuSubtitle => 'Your progress summary';

  @override
  String get unlockGrowthPotential => 'Unlock your full growth potential';

  @override
  String get featureGrowthAnalysis => 'Growth analysis & score';

  @override
  String get featureHeightPrediction => 'Height prediction & forecast';

  @override
  String get featureAllRoutines => 'All 14 daily routines';

  @override
  String get featureWaterSleep => 'Water & sleep tracking';

  @override
  String get featureProgress => 'Progress & measurements';

  @override
  String get featureAchievements => 'Achievements & streaks';

  @override
  String get planMonthly => 'Monthly';

  @override
  String get planYearly => 'Yearly';

  @override
  String get bestValue => 'BEST VALUE';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'LVL $level';
  }

  @override
  String get levelBeginner => 'Beginner';

  @override
  String get levelStarter => 'Starter';

  @override
  String get levelCommitted => 'Committed';

  @override
  String get levelDedicated => 'Dedicated';

  @override
  String get levelConsistent => 'Consistent';

  @override
  String get levelFocused => 'Focused';

  @override
  String get levelDetermined => 'Determined';

  @override
  String get levelDisciplined => 'Disciplined';

  @override
  String get levelStrong => 'Strong';

  @override
  String get levelAdvanced => 'Advanced';

  @override
  String get levelExpert => 'Expert';

  @override
  String get levelMaster => 'Master';

  @override
  String get levelElite => 'Elite';

  @override
  String get levelChampion => 'Champion';

  @override
  String get levelLegend => 'Legend';

  @override
  String get levelTitan => 'Titan';

  @override
  String get levelMythic => 'Mythic';

  @override
  String get levelImmortal => 'Immortal';

  @override
  String get levelTranscendent => 'Transcendent';

  @override
  String get levelUltimate => 'Ultimate';

  @override
  String get challengeCompleteAllRoutines => 'Complete All Routines';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Finish every routine today';

  @override
  String get challengeHydrationHero => 'Hydration Hero';

  @override
  String get challengeHydrationHeroDesc => 'Reach your daily water goal';

  @override
  String get challengeEarlySleeper => 'Early Sleeper';

  @override
  String get challengeEarlySleeperDesc => 'Log 8+ hours of sleep';

  @override
  String get challengeExerciseTrio => 'Exercise Trio';

  @override
  String get challengeExerciseTrioDesc => 'Complete 3 exercise routines';

  @override
  String get challengeMorningStretch => 'Morning Stretch';

  @override
  String get challengeMorningStretchDesc => 'Do morning stretching before 9 AM';

  @override
  String get challenge7DayWarrior => '7-Day Warrior';

  @override
  String get challenge7DayWarriorDesc =>
      'Complete all routines for 7 consecutive days';

  @override
  String get challengeGrowthTracker => 'Growth Tracker';

  @override
  String get challengeGrowthTrackerDesc => 'Log a height measurement this week';

  @override
  String get challengeHydrationWeek => 'Hydration Week';

  @override
  String get challengeHydrationWeekDesc => 'Hit water goal 5 days this week';

  @override
  String get challengeFitnessChampion => 'Fitness Champion';

  @override
  String get challengeFitnessChampionDesc =>
      'Complete 15 exercise routines this week';

  @override
  String get challengeSleepMaster => 'Sleep Master';

  @override
  String get challengeSleepMasterDesc => 'Log 8+ hours of sleep for 5 days';

  @override
  String get performanceDashboard => 'PERFORMANCE DASHBOARD';

  @override
  String get tierA => 'TIER A';

  @override
  String get tierB => 'TIER B';

  @override
  String get tierC => 'TIER C';

  @override
  String get tierD => 'TIER D';

  @override
  String get tierE => 'TIER E';

  @override
  String get maxTierReached => 'MAX TIER REACHED';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Next Tier: $tier · +$pts pts needed';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Manage Routines';

  @override
  String get manageRoutinesSubtitle =>
      'Show or hide routines from your daily list';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible of $total active';
  }

  @override
  String get showAll => 'Show all';

  @override
  String get hideAll => 'Hide all';

  @override
  String get heightAnalysis => 'Height Analysis';

  @override
  String get heightVsPopulation => 'Your Position in Global Population';

  @override
  String get globalAveragesTable => 'Global Averages by Age';

  @override
  String get standingTall => 'Standing Tall';

  @override
  String get standingAboveAverage => 'Above Average';

  @override
  String get standingBelowAverage => 'Below Average';

  @override
  String get standingShort => 'Below Peers';

  @override
  String get yourHeightStanding => 'YOUR HEIGHT STANDING';

  @override
  String get bellCurveCaption => 'How height is spread at your age';

  @override
  String get bellShorterThanYou => 'shorter than you';

  @override
  String get yourHeight => 'You';

  @override
  String peerAvg(int age) {
    return 'Age $age avg';
  }

  @override
  String get aboveAvg => 'Above avg';

  @override
  String get belowAvg => 'Below avg';

  @override
  String get whoDataSource => 'WHO 2007 Global Reference';

  @override
  String get percentileShort5 => '5th';

  @override
  String get percentileShort50 => '50th';

  @override
  String get percentileShort95 => '95th';

  @override
  String get youLabel => 'You';

  @override
  String get avgHeightLabel => 'AVG';

  @override
  String get percentileLabel => 'PCT';

  @override
  String get diffLabel => 'DIFF';

  @override
  String get whoSourceNote =>
      'Data source: WHO 2007 Growth Reference & NCD-RisC global pooled estimates. Percentiles are global averages and may vary by country.';

  @override
  String get quickPhotos => 'Photos';

  @override
  String get quickPosture => 'Posture';

  @override
  String get quickWellness => 'Wellness';

  @override
  String get quickRecipes => 'Recipes';

  @override
  String get wellnessTitle => 'Wellness Tracker';

  @override
  String get wellnessHeader => 'WELLNESS';

  @override
  String get wellnessSubtitle => 'Track factors that affect your growth';

  @override
  String get caffeineToday => 'Caffeine Today';

  @override
  String get withinLimits => 'Within healthy limits';

  @override
  String get approachingLimit => 'Approaching limit';

  @override
  String get overLimit => 'Over limit, affects HGH';

  @override
  String get resetToday => 'Reset today';

  @override
  String get stressToday => 'Stress Today';

  @override
  String get stressVeryCalmLabel => 'Very calm, optimal for growth';

  @override
  String get stressCalmLabel => 'Calm';

  @override
  String get stressNeutralLabel => 'Neutral';

  @override
  String get stressStressedLabel => 'Stressed';

  @override
  String get stressVeryStressedLabel => 'Very stressed, cortisol blocks HGH';

  @override
  String get stressTapToLog => 'Tap to log how you feel today';

  @override
  String get todaysJournal => 'Today\'s Journal';

  @override
  String get journalNoNote => '(no note)';

  @override
  String get journalEdit => 'Edit';

  @override
  String get journalHowWasToday => 'How was today?';

  @override
  String get journalSaved => 'Journal saved · +5 XP';

  @override
  String get journalSaveEntry => 'Save entry';

  @override
  String get weeklyInsight => 'Weekly Insight';

  @override
  String get weeklyInsightCaffeine => 'CAFFEINE';

  @override
  String get weeklyInsightStress => 'STRESS';

  @override
  String get weeklyInsightMood => 'MOOD';

  @override
  String get wellnessInfoTitle => 'Why wellness matters';

  @override
  String get wellnessInfoBody =>
      'Caffeine interferes with deep sleep, which is when most growth hormone (HGH) is released. Chronic stress raises cortisol, which directly suppresses HGH. Journaling helps you stay consistent with habits that support growth.';

  @override
  String get wellnessInfoGotIt => 'Got it';

  @override
  String get insightCaffeineHigh =>
      'Your caffeine is high this week. Try cutting down for better sleep and HGH.';

  @override
  String get insightStressHigh =>
      'Stress is elevated this week. Try some breathing exercises: cortisol blocks growth.';

  @override
  String get insightMoodLow =>
      'Mood has been low lately. Sunlight, sleep, and gentle exercise all help.';

  @override
  String get insightGreat =>
      'Great balance this week. Your wellness supports optimal growth.';

  @override
  String get insightDefault =>
      'Your wellness is on track. Keep logging for deeper insights.';

  @override
  String get insightNeedMoreData => 'Log for a few more days to see insights.';

  @override
  String get progressPhotosTitle => 'Progress Photos';

  @override
  String get progressPhotosHeader => 'PROGRESS PHOTOS';

  @override
  String get progressPhotosSubtitle => 'Track your visual journey';

  @override
  String get addProgressPhoto => 'Add Progress Photo';

  @override
  String get captureJourney => 'Capture your visual journey';

  @override
  String get takePhoto => 'Take Photo';

  @override
  String get chooseFromLibrary => 'Choose from Library';

  @override
  String get deletePhotoTitle => 'Delete Photo?';

  @override
  String get deletePhotoBody =>
      'This photo will be removed from your progress timeline.';

  @override
  String get timelineTab => 'Timeline';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'photos',
      one: 'photo',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit in $days days';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'days',
      one: 'day',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit gained';
  }

  @override
  String get firstPhotoMessage =>
      'Take your first photo to start tracking your visual progress.';

  @override
  String get takeFirstPhoto => 'Take First Photo';

  @override
  String get beforeAfter => 'BEFORE / AFTER';

  @override
  String get beforeLabel => 'BEFORE';

  @override
  String get afterLabel => 'AFTER';

  @override
  String get yourHeightDialog => 'Your Height';

  @override
  String get heightDialogMessage =>
      'Enter your current height in cm for this photo';

  @override
  String get postureAnalysisTitle => 'Posture Analysis';

  @override
  String get postureCoachHeader => 'POSTURE COACH';

  @override
  String get postureCoachSubtitle => 'Self-check with your side photo';

  @override
  String get latestScore => 'LATEST SCORE';

  @override
  String get latestAnalysis => 'LATEST ANALYSIS';

  @override
  String get headPosition => 'Head Position';

  @override
  String get progressLabel => 'PROGRESS';

  @override
  String get choosePhotoSource => 'Choose Photo Source';

  @override
  String get sideProfileHint => 'Side-profile, full body in frame';

  @override
  String get howToTakePhoto => 'HOW TO TAKE THE PHOTO';

  @override
  String get takePosturePhoto => 'Take Posture Photo';

  @override
  String get postureExcellent => 'Excellent';

  @override
  String get postureGood => 'Good';

  @override
  String get postureNeedsWork => 'Needs work';

  @override
  String get posturePoor => 'Poor';

  @override
  String get recommendedExercises => 'RECOMMENDED EXERCISES';

  @override
  String get postureWallStand => 'Wall Stand';

  @override
  String get postureWallStandDesc =>
      'Stand with back against wall for 2 minutes daily.';

  @override
  String get postureChestOpener => 'Chest Opener';

  @override
  String get postureChestOpenerDesc =>
      'Opens tight pecs that pull shoulders forward.';

  @override
  String get postureChinTucks => 'Chin Tucks';

  @override
  String get postureChinTucksDesc =>
      'Reverse forward head posture — 3×10 reps.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Strengthens deep core for lordosis control.';

  @override
  String get recipesTitle => 'Recipes';

  @override
  String get recipesHeader => 'RECIPES';

  @override
  String get recipesSubtitle => 'Fuel your growth';

  @override
  String get recipesCategoryAll => 'All';

  @override
  String get recipesCategoryBreakfast => 'Breakfast';

  @override
  String get recipesCategoryLunch => 'Lunch';

  @override
  String get recipesCategoryDinner => 'Dinner';

  @override
  String get recipesCategorySnack => 'Snack';

  @override
  String get recipesGoalAll => 'All';

  @override
  String get recipeDiffEasy => 'Easy';

  @override
  String get recipeDiffMedium => 'Medium';

  @override
  String get recipeDiffHard => 'Hard';

  @override
  String get recipesFilterType => 'TYPE';

  @override
  String get recipesFilterNutrient => 'RICH IN';

  @override
  String get recipesGoalVitaminD => 'Vitamin D';

  @override
  String get recipesGoalZinc => 'Zinc';

  @override
  String get recipesGoalMagnesium => 'Magnesium';

  @override
  String recipesCountLabel(int count) {
    return '$count recipes';
  }

  @override
  String get recipeIngredients => 'Ingredients';

  @override
  String get recipeSteps => 'Method';

  @override
  String get recipesGoalProtein => 'High Protein';

  @override
  String get recipesGoalCalcium => 'Calcium';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'Iron';

  @override
  String get recipesNoMatch => 'No recipes match these filters';

  @override
  String get recipesIngredients => 'Ingredients';

  @override
  String get recipesInstructions => 'Instructions';

  @override
  String get recipesClose => 'CLOSE';

  @override
  String get recipesAboutTitle => 'About Recipes';

  @override
  String get recipesAboutBody =>
      'Curated recipes designed to fuel your growth. Filter by meal type or nutritional goal to find the perfect fit for your plan.';

  @override
  String get animHintSpinalDecomp => 'Spinal decompression';

  @override
  String get animHintGravityReversal => 'Gravity reversal';

  @override
  String get animHintImpactBones => 'Impact loading for bones';

  @override
  String get animHintHighImpact => 'High-impact bone loading';

  @override
  String get animHintMetabolicBurst => 'Metabolic burst training';

  @override
  String get animHintFullBodyStretch => 'Full-body awakening stretch';

  @override
  String get animHintSpinalExtension => 'Spinal extension';

  @override
  String get animHintCervicalDecomp => 'Cervical decompression';

  @override
  String get animHintShoulderMobility => 'Shoulder mobility';

  @override
  String get animHintFullBodyMotion => 'Full-body motion';

  @override
  String get animHintPosteriorChain => 'Posterior chain stretch';

  @override
  String get animHintMuscleGrowth => 'Muscle growth fuel';

  @override
  String get animHintBoneDensity => 'Bone density support';

  @override
  String get animHintSpinalDisc => 'Spinal disc hydration';

  @override
  String get animHintCleanNutrition => 'Clean nutrition';

  @override
  String get animHintIgf1 => 'IGF-1 optimization';

  @override
  String get animHintHghAmino => 'HGH amino precursor';

  @override
  String get animHintCalciumAbsorption => 'Calcium absorption';

  @override
  String get animHintSpinalAlignment => 'Spinal alignment';

  @override
  String get animHintPostureCorrection => 'Posture correction';

  @override
  String get animHintMindBody => 'Mind-body balance';

  @override
  String get animHintCoreStability => 'Core stability';

  @override
  String get animHintLegPower => 'Leg power & HGH surge';

  @override
  String get animHintVerticalPower => 'Vertical power';

  @override
  String get animHintHghSurge => 'HGH surge training';

  @override
  String get animHintPeakHgh => 'Peak HGH release window';

  @override
  String get animHintMelatonin => 'Melatonin optimization';

  @override
  String get animHintDeepSleep => 'Deep sleep setup';

  @override
  String get animHintSleepOpt => 'Sleep optimization';

  @override
  String get animHintExercise => 'Exercise';

  @override
  String get formMorningStretch =>
      'Start with neck rolls, then move to full body stretches. Hold each stretch for 20-30 seconds without bouncing.';

  @override
  String get formBarHanging =>
      'Grip the bar shoulder-width apart, relax your body completely, let gravity stretch your spine. Avoid swinging.';

  @override
  String get formCobraStretch =>
      'Lie face down, place hands under shoulders, slowly push upper body up while keeping hips on the floor. Look upward.';

  @override
  String get formJumping =>
      'Perform squat jumps or jump rope. Land softly on the balls of your feet. Rest 30 seconds between sets.';

  @override
  String get formSwimmingBasketball =>
      'Choose swimming (freestyle/backstroke) or basketball. Focus on jumping, reaching, and full range of motion.';

  @override
  String get formEveningYoga =>
      'Perform gentle poses: cat-cow, child pose, downward dog, forward fold. Breathe deeply and hold each pose 30-60 seconds.';

  @override
  String get formSprintIntervals =>
      'Warm up for 5 minutes, then sprint at maximum effort for 30 seconds. Walk or jog for 90 seconds to recover. Repeat.';

  @override
  String get formHiitWorkout =>
      'Perform exercises like burpees, mountain climbers, and jump squats at maximum intensity for 45 seconds, rest 15 seconds.';

  @override
  String get formSquats =>
      'Stand with feet shoulder-width apart. Lower your body until thighs are parallel to ground. Keep back straight and knees behind toes.';

  @override
  String get formDeadliftStretch =>
      'Stand with feet hip-width apart, hinge at hips keeping back flat. Reach toward toes, feel the stretch in hamstrings and back.';

  @override
  String get formOverheadPress =>
      'Stand tall, press arms overhead fully extending. Use light weights or bodyweight. Keep core tight and avoid arching back.';

  @override
  String get formSkippingRope =>
      'Jump with both feet, landing softly on the balls of your feet. Keep jumps low and consistent. Rest between sets.';

  @override
  String get formPilatesCore =>
      'Perform plank, dead bug, bird dog, bridge, and leg raises. Focus on controlled movement and breathing.';

  @override
  String get formInversionHang =>
      'Use an inversion table or gravity boots. Start with a slight incline and gradually increase. Keep sessions short.';

  @override
  String get formProtein =>
      'Spread protein intake across 3-4 meals. Include eggs, chicken, fish, dairy, and legumes.';

  @override
  String get formCalciumVitaminD =>
      'Consume 3 servings of dairy daily and get 15 minutes of sunlight for natural Vitamin D synthesis.';

  @override
  String get formWater =>
      'Drink water consistently throughout the day. Carry a water bottle and set hourly reminders.';

  @override
  String get formAvoidJunk =>
      'Replace fast food with whole foods. Swap sugary drinks for water. Read labels and avoid processed ingredients.';

  @override
  String get formZincIntake =>
      'Include red meat, pumpkin seeds, chickpeas, cashews, and oysters in your diet. Aim for 8-11mg daily.';

  @override
  String get formVitaminDSunlight =>
      'Expose arms and face to direct sunlight for 15 minutes, preferably before noon. No sunscreen needed for this duration.';

  @override
  String get formArginineFoods =>
      'Include nuts, seeds, turkey, chicken, soybeans, and dairy in your meals. Best consumed before sleep.';

  @override
  String get formDailyCalories =>
      'Spread your calories across 3-5 meals and don\'t skip breakfast. Prioritize whole foods over empty calories.';

  @override
  String get formQualitySleep =>
      'Go to bed by 10 PM. Keep the room dark and cool. Avoid caffeine after 2 PM.';

  @override
  String get formNoScreen =>
      'Set an alarm 1 hour before bedtime. Put all screens away. Read a book or do gentle stretching instead.';

  @override
  String get formSleepEnvironment =>
      'Use blackout curtains, keep room at 18-20°C, remove all light sources. Use a comfortable mattress and pillow.';

  @override
  String get formPreSleepRoutine =>
      'Start 30 minutes before bed: dim lights, read a book, do breathing exercises, avoid stimulating activities.';

  @override
  String get formPostureCheck =>
      'Stand tall with shoulders back and down. Engage core slightly. Imagine a string pulling you up from the crown of your head.';

  @override
  String get formWallStand =>
      'Stand with heels, buttocks, shoulder blades, and head touching the wall. Hold for 5 minutes. Breathe normally.';

  @override
  String get formNeckStretches =>
      'Tilt head slowly to each side, forward, and backward. Hold each direction for 30 seconds. Do not force the stretch.';

  @override
  String get formShoulderRolls =>
      'Roll shoulders forward 15 times, then backward 15 times. Follow with chest-opening stretches holding for 20 seconds.';

  @override
  String get sciMorningStretch =>
      'Morning stretching decompresses spinal discs that were rehydrated overnight, maximizing height retention';

  @override
  String get sciBarHanging =>
      'Hanging decompresses vertebral discs by using gravity to stretch the spine, potentially adding temporary height';

  @override
  String get sciCobraStretch =>
      'Cobra stretch extends the spine and opens the chest, counteracting spinal compression from sitting';

  @override
  String get sciJumping =>
      'High-impact jumping stimulates growth plates in the legs and triggers growth hormone release';

  @override
  String get sciSwimmingBasketball =>
      'Swimming and basketball involve full-body stretching, jumping, and reaching that stimulate growth plate activity';

  @override
  String get sciEveningYoga =>
      'Evening yoga reduces cortisol which inhibits growth hormone, and stretches muscles for overnight recovery';

  @override
  String get sciSprintIntervals =>
      'Sprinting triggers significant growth hormone release';

  @override
  String get sciHiitWorkout =>
      'High intensity exercise increases HGH by up to 450%';

  @override
  String get sciSquats => 'Squats stimulate growth plates in legs and spine';

  @override
  String get sciDeadliftStretch =>
      'Spinal decompression promotes vertebral disc health';

  @override
  String get sciOverheadPress =>
      'Overhead pressing stretches the spine and strengthens posture muscles';

  @override
  String get sciSkippingRope =>
      'Repetitive jumping stimulates growth plates in lower extremities';

  @override
  String get sciPilatesCore =>
      'Core strength supports spinal alignment and posture';

  @override
  String get sciInversionHang =>
      'Inversion decompresses spinal discs, can temporarily add 1-2cm';

  @override
  String get sciProtein =>
      'Protein provides amino acids essential for bone and muscle growth, especially during growth spurts';

  @override
  String get sciCalciumVitaminD =>
      'Calcium and Vitamin D are the primary building blocks for bone density and linear bone growth';

  @override
  String get sciWater =>
      'Hydration is essential for nutrient transport to growth plates and joint cartilage health';

  @override
  String get sciAvoidJunk =>
      'Processed foods and sugar cause inflammation and insulin spikes that suppress growth hormone secretion';

  @override
  String get sciZincIntake => 'Zinc is essential for growth hormone production';

  @override
  String get sciVitaminDSunlight =>
      'Vitamin D is crucial for calcium absorption and bone growth';

  @override
  String get sciArginineFoods =>
      'L-Arginine stimulates growth hormone secretion';

  @override
  String get sciDailyCalories =>
      'A sustained calorie deficit lowers IGF-1 and blunts growth hormone pulses, directly slowing linear growth during adolescence';

  @override
  String get sciQualitySleep =>
      '70-80% of daily growth hormone is released during deep sleep stages, especially between 10 PM and 2 AM';

  @override
  String get sciNoScreen =>
      'Blue light from screens suppresses melatonin production, delaying sleep onset and reducing deep sleep quality';

  @override
  String get sciSleepEnvironment =>
      'Dark, cool environment maximizes melatonin and growth hormone';

  @override
  String get sciPreSleepRoutine =>
      'Consistent pre-sleep routine improves deep sleep quality by 23%';

  @override
  String get sciPostureCheck =>
      'Correct posture alignment can immediately add 2-3 cm to apparent height and prevents spinal compression';

  @override
  String get sciWallStand =>
      'Wall stands train postural muscle memory, helping maintain proper spinal alignment throughout the day';

  @override
  String get sciNeckStretches =>
      'Neck stretches relieve compression and improve cervical alignment';

  @override
  String get sciShoulderRolls =>
      'Opening shoulders corrects forward posture, can add 1-2cm appearance';

  @override
  String get muscleSpine => 'Spine';

  @override
  String get muscleLegs => 'Legs';

  @override
  String get muscleBack => 'Back';

  @override
  String get muscleShoulders => 'Shoulders';

  @override
  String get muscleArms => 'Arms';

  @override
  String get muscleCore => 'Core';

  @override
  String get muscleChest => 'Chest';

  @override
  String get muscleCalves => 'Calves';

  @override
  String get muscleFullBody => 'Full Body';

  @override
  String get muscleHips => 'Hips';

  @override
  String get muscleBones => 'Bones';

  @override
  String get muscleMuscles => 'Muscles';

  @override
  String get muscleNeck => 'Neck';

  @override
  String get muscleUpperSpine => 'Upper Spine';

  @override
  String get muscleUpperBack => 'Upper Back';

  @override
  String get createRoutine => 'Create Routine';

  @override
  String get createRoutineTitle => 'Create Custom Routine';

  @override
  String get createRoutineSubtitle => 'Build your own daily routine';

  @override
  String get routineIcon => 'Icon';

  @override
  String get routineTitleField => 'Title';

  @override
  String get routineDescField => 'Description';

  @override
  String get routineDescHint => 'Short summary of the routine';

  @override
  String get routineCategoryField => 'Category';

  @override
  String get routineDifficultyField => 'Difficulty';

  @override
  String get routineDurationField => 'Duration';

  @override
  String get routineSetsRepsField => 'Sets x Reps';

  @override
  String get routineFormField => 'Form & Instructions';

  @override
  String get routineFormHint => 'Optional: how to perform this routine';

  @override
  String get diffBeginner => 'Beginner';

  @override
  String get diffIntermediate => 'Intermediate';

  @override
  String get diffAdvanced => 'Advanced';

  @override
  String get catExercise => 'Exercise';

  @override
  String get catNutrition => 'Nutrition';

  @override
  String get catSleep => 'Sleep';

  @override
  String get catPosture => 'Posture';

  @override
  String get postureTip1 => 'Stand sideways (side profile) to the camera.';

  @override
  String get postureTip2 => 'Keep ~2 meters distance from the lens.';

  @override
  String get postureTip3 => 'Arms relaxed, look straight ahead.';

  @override
  String get postureTip4 => 'Wear fitted clothes for accurate scoring.';

  @override
  String get postureTip5 => 'Use good lighting and a plain background.';

  @override
  String get kyphosisLabel => 'Kyphosis (upper back)';

  @override
  String get lordosisLabel => 'Lordosis (lower back)';

  @override
  String get analyzingPosture => 'ANALYZING POSTURE';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String version(String ver) {
    return 'Version $ver';
  }

  @override
  String get rateApp => 'Rate BeTaller';

  @override
  String get rateAppSubtitle => 'Your review helps us grow!';

  @override
  String get unitSystem => 'Unit System';

  @override
  String get unitMetric => 'Metric (cm, kg)';

  @override
  String get unitImperial => 'Imperial (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Health Disclaimer';

  @override
  String get healthDisclaimerBody =>
      'BeTaller provides general wellness and fitness guidance. Results vary based on age, genetics, and individual factors. This app does not provide medical advice. Exercises focus on posture optimization, spinal health, and growth hormone support through natural habits. Consult a healthcare professional before starting any new exercise or nutrition program. Height changes after growth plate closure (typically 18-25) are primarily from posture improvement.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Get at least ${grams}g of protein today — calculated from your weight.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Drink at least ${liters}L of water today — calculated from your weight.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Aim for about $kcal kcal today to fuel growth.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Get $iu IU of Vitamin D today — from sunlight, food, or a supplement.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Get ${mg}mg of Zinc today to support growth hormone production.';
  }

  @override
  String get nutritionSupplementsTitle => 'SUPPLEMENTS';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Optional support, not a substitute for food. Talk to a doctor before starting any supplement, especially under 18.';

  @override
  String get supplementVitaminDName => 'Vitamin D3';

  @override
  String get supplementVitaminDDose => '3,000 IU';

  @override
  String get supplementVitaminDBenefit =>
      'Boosts calcium absorption for bone density and growth plate health';

  @override
  String get supplementZincName => 'Zinc';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit =>
      'A key mineral for growth hormone production';

  @override
  String get supplementMagnesiumName => 'Magnesium';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Supports the deep sleep stage where most growth hormone is released';

  @override
  String get supplementCalciumName => 'Calcium';

  @override
  String get supplementCalciumDose => '1,000-1,300mg';

  @override
  String get supplementCalciumBenefit =>
      'The core building block of bone density and growth plates';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1,000mg';

  @override
  String get supplementOmega3Benefit =>
      'Reduces inflammation and supports healthy growth plate function';

  @override
  String get supplementCollagenName => 'Collagen + Vitamin C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit =>
      'Vitamin C helps your body use collagen to build cartilage and bone matrix';

  @override
  String get sciSourcePrefix => 'Source: ';

  @override
  String get program => 'Program';

  @override
  String get todaysExercises => 'TODAY\'S EXERCISES';

  @override
  String get dailyNutritionPlan => 'DAILY NUTRITION PLAN';

  @override
  String get nutritionGoalsComplete => '🎉 All nutrition goals complete!';

  @override
  String get nutritionGoalsIncomplete =>
      'Complete your nutrition goals for optimal growth';

  @override
  String get postureDetectingAlignment => 'Detecting spinal alignment...';

  @override
  String get testimonial1 =>
      'I had no hope because of my age, but I grew with BeTaller. My confidence has never been this high.';

  @override
  String get testimonialDuration1 => '4 months';

  @override
  String get testimonial2 =>
      'Everyone said \"you can\'t grow anymore.\" I used BeTaller and surprised everyone.';

  @override
  String get testimonialDuration2 => '3 months';

  @override
  String get testimonial3 =>
      'After starting the routines, I grew taller and my posture improved. Everyone noticed the difference.';

  @override
  String get testimonialDuration3 => '6 months';

  @override
  String get testimonial4 =>
      'I\'m still in my growth phase and BeTaller\'s effect is incredible. I feel taller and stronger.';

  @override
  String get testimonialDuration4 => '3 months';

  @override
  String get testimonial5 =>
      'If I said I didn\'t try BeTaller, I\'d be lying. I noticed a real difference quickly, highly recommend.';

  @override
  String get testimonialDuration5 => '4 months';

  @override
  String get designedForYou => 'Designed for you';

  @override
  String get designedForYouDesc =>
      'BeTaller was built specifically for you to reach your genetic limit, and even surpass it. Every feature, for you.';

  @override
  String get greetingAllDone => 'Great job! 🎯';

  @override
  String get greetingAllDoneSub => 'You\'ve completed today\'s tasks.';

  @override
  String greetingStreak30(int streak) {
    return '$streak day streak. Legendary level.';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak day streak. Keep it up.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak days in a row. Most people quit. You didn\'t.';
  }

  @override
  String get greetingMorning => 'Good morning. A new day, a new chance.';

  @override
  String get greetingAfternoon => 'Today is a great day to start your streak.';

  @override
  String get greetingEvening => 'Complete your tasks, start your streak.';

  @override
  String get todayCompleted => 'Today completed ✓';

  @override
  String get todayGoals => 'Today\'s goals';

  @override
  String get challengesLabel => 'Challenges';

  @override
  String get dailyChallengesLabel => 'DAILY CHALLENGES';

  @override
  String get expiresTonight => 'Expires tonight';

  @override
  String get allChallengesCompleted => 'All completed ✓';

  @override
  String get challengesLoading => 'New challenges loading soon.';

  @override
  String get challengesLoadingTitle => 'Daily challenges';

  @override
  String get behindPace => 'Behind pace';

  @override
  String get growthTracking => 'Growth tracking';

  @override
  String get growthEmptyFirst => 'Log your first height to start tracking.';

  @override
  String get growthEmptySecond =>
      'Log your second measurement to see your chart.';

  @override
  String get growthSectionLabel => 'GROWTH';

  @override
  String get generalPerformance => 'OVERALL PERFORMANCE';

  @override
  String get analysisBalance => 'Your balance';

  @override
  String get analysisWeakest => 'Your weakest link';

  @override
  String get analysisPrediction => 'Height prediction';

  @override
  String get analysisComparison => 'Comparison';

  @override
  String get analysisGrowth => 'Growth status';

  @override
  String get analysisWeakestHint =>
      'This is the fastest place to raise your score.';

  @override
  String get exploreLabel => 'EXPLORE';

  @override
  String get explorePosture => 'Posture Analysis';

  @override
  String get explorePostureSub => 'Posture analysis and correction tips';

  @override
  String get explorePhotos => 'Progress Photos';

  @override
  String get explorePhotosSub => 'Track your transformation with photos';

  @override
  String get exploreNutrition => 'Nutrition';

  @override
  String get exploreNutritionSub => 'Protein, calcium and vitamin guide';

  @override
  String get exploreHealth => 'Health Tracking';

  @override
  String get exploreHealthSub => 'Stress, caffeine and wellness tracking';

  @override
  String get exploreRecipes => 'Growth Recipes';

  @override
  String get exploreRecipesSub => 'Recipes that support growth';

  @override
  String get educationLabel => 'EDUCATION';

  @override
  String get educationTitle => 'Height growth\nscience';

  @override
  String get educationSubtitle => 'Expert content, research and guides';

  @override
  String get aiAnalysisLabel => 'GROWTH ANALYSIS';

  @override
  String get peerCompareLabel => 'COMPARE WITH PEERS';

  @override
  String peerCompareText(int topPct) {
    return 'You\'re in the Top $topPct% of your peers';
  }

  @override
  String get notifWaterTitle => '💧 Don\'t Forget to Drink Water!';

  @override
  String get notifWaterBody =>
      'Have you reached your daily water goal? Drink another glass!';

  @override
  String get notifMorningTitle => '🌅 Good Morning! Exercise Time';

  @override
  String get notifMorningBody =>
      'Do your morning stretching! 10 minutes of spine and leg stretches.';

  @override
  String get notifRoutineTitle => '🔥 Complete Your Routines!';

  @override
  String get notifRoutineBody =>
      'Check your routines before the day ends. Streak = discipline!';

  @override
  String get notifProteinTitle => '🥚 Protein Day!';

  @override
  String get notifProteinBody =>
      'Start the week strong! Get protein every meal.';

  @override
  String get notifNewWeekTitle => '✨ New Week, New Goals!';

  @override
  String get notifNewWeekBody =>
      'Don\'t skip routines this week. Small steps, big differences!';

  @override
  String get notifSleepTitle => '😴 Sleep Time!';

  @override
  String get notifSleepBody =>
      'Growth hormone peaks between 10PM-2AM. Put your phone down!';

  @override
  String get notifPostureTitle => '🧍 Posture Check!';

  @override
  String get notifPostureBody =>
      'Back straight, shoulders back. Good posture = 2-3 cm difference!';

  @override
  String get notifVitaminDTitle => '☀️ Vitamin D Time!';

  @override
  String get notifVitaminDBody =>
      'Get 15 minutes of sun! Vitamin D boosts calcium absorption.';

  @override
  String get notifMidweekTitle => '✨ Halfway There!';

  @override
  String get notifMidweekBody =>
      'Midweek check. Growth takes patience but consistency wins!';

  @override
  String get notifScreenTitle => '📵 Screens Off!';

  @override
  String get notifScreenBody =>
      'No screens 1 hour before bed. Blue light blocks melatonin!';

  @override
  String get notifJumpTitle => '🦘 Jump Time!';

  @override
  String get notifJumpBody =>
      'Jumping exercises stimulate growth plates. Try 3 x 20 reps!';

  @override
  String get notifCalciumTitle => '🥛 Calcium Time!';

  @override
  String get notifCalciumBody =>
      'A glass of milk or yogurt. Calcium is critical for bones!';

  @override
  String get notifPostureCheckTitle => '🧍 Posture Check!';

  @override
  String get notifPostureCheckBody =>
      'Don\'t tilt your neck at your phone! Sit and walk tall.';

  @override
  String get notifWeekendTitle => '✨ Weekend Motivation';

  @override
  String get notifWeekendBody =>
      'Don\'t skip routines on weekends! Discipline applies every day.';

  @override
  String get notifWeeklyProgressTitle => '📊 Weekly Progress';

  @override
  String get notifWeeklyProgressBody =>
      'How was your week? Check your growth chart!';

  @override
  String get notifMeasureTitle => '📏 Weekly Measurement!';

  @override
  String get notifMeasureBody =>
      'Measure and log your height! Morning measurements are most accurate.';

  @override
  String get notifEarlySleepTitle => '😴 Early to Bed!';

  @override
  String get notifEarlySleepBody =>
      'Tomorrow is Monday! Start the week strong with good sleep.';

  @override
  String get notifStreak3Title => '🔥 3 Day Streak!';

  @override
  String get notifStreak3Body =>
      'Great start! 3 days in a row. Keep going to 7!';

  @override
  String get notifStreak7Title => '🏆 1 Week Streak!';

  @override
  String get notifStreak7Body =>
      'Incredible! 7 consecutive days of completed routines!';

  @override
  String get notifStreak14Title => '⭐ 2 Week Streak!';

  @override
  String get notifStreak14Body =>
      '14 days of discipline! Your body is starting to change.';

  @override
  String get notifStreak30Title => '👑 1 Month Streak!';

  @override
  String get notifStreak30Body => '30 days! You\'re a champion!';

  @override
  String get notifStreak60Title => '🌟 60 Day Streak!';

  @override
  String get notifStreak60Body => '60 days! An incredible achievement.';

  @override
  String get notifStreak100Title => '💎 100 DAYS! LEGENDARY!';

  @override
  String get notifStreak100Body =>
      '100 days in a row! You\'ve become a legend.';

  @override
  String get notifStreakRiskTitle => '⚠️ Don\'t Lose Your Streak!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Your $streak day streak is at risk! Complete your routines.';
  }

  @override
  String get paywallStat1 => 'cm — your potential is locked';

  @override
  String get paywallTitle1 => 'How Many cm\nCan You Grow?';

  @override
  String get paywallBullet1a =>
      'Your genetic ceiling has been calculated, want to see it?';

  @override
  String get paywallBullet1b => 'How does your lifestyle affect your growth?';

  @override
  String get paywallBullet1c => 'Your personalized roadmap awaits';

  @override
  String get paywallStat2 => 'your custom routine is ready';

  @override
  String get paywallTitle2 => 'Your Plan\nis Ready';

  @override
  String get paywallBullet2a =>
      '8 minutes every morning — designed for your spine';

  @override
  String get paywallBullet2b => 'Sleep, nutrition, water — all tracked';

  @override
  String get paywallBullet2c =>
      'One step closer every day, don\'t break the streak';

  @override
  String get paywallStat3 => 'real-time progress charts';

  @override
  String get paywallTitle3 => 'Track Your\nGrowth';

  @override
  String get paywallBullet3a =>
      'Monthly measurements — see your growth with your own eyes';

  @override
  String get paywallBullet3b => 'Gain 2 cm right now with posture analysis';

  @override
  String get paywallBullet3c => 'Progress photos — you\'ll see the difference';

  @override
  String get paywallStat4 => 'daily program — leveling up';

  @override
  String get paywallTitle4 => 'Stronger\nEvery Day';

  @override
  String get paywallBullet4a => 'Earn XP, unlock levels — habits become a game';

  @override
  String get paywallBullet4b =>
      'Those who reached their goal came through here';

  @override
  String get paywallBullet4c => 'Start now — first week free';

  @override
  String get paywallRestore => 'No previous purchase found';

  @override
  String get paywallRestoreNotFound => 'No previous purchase found';

  @override
  String get paywallPromoCode => 'Have a promo code?';

  @override
  String get paywallHeightUnit => 'target height';

  @override
  String get paywallHeightTitle => 'How much taller can you get?';

  @override
  String get paywallHeightDesc =>
      'We analyse your genetics, lifestyle and posture together and map the prediction year by year. Nothing is fixed: every step you take updates it.';

  @override
  String get paywallGrowthUnit => 'this year';

  @override
  String get paywallGrowthTitle => 'We track your growth with you';

  @override
  String get paywallGrowthDesc =>
      'Every measurement lands on the chart instantly. You watch your progress month by month, centimetre by centimetre.';

  @override
  String get paywallPostureUnit => 'posture score';

  @override
  String get paywallPostureTitle => 'Your posture is the key to your routines';

  @override
  String get paywallPostureDesc =>
      'One photo measures kyphosis, lordosis and head position, and you get correction routines built for you. Good posture alone can be worth 2-3 cm.';

  @override
  String get paywallReportUnit => 'routines completed';

  @override
  String get paywallReportTitle => 'We review you every week';

  @override
  String get paywallReportDesc =>
      'Water, sleep, routines and streak on one screen. Every week we pinpoint your strengths and your gaps together.';

  @override
  String get paywallNutritionUnit => 'meals a day';

  @override
  String get paywallNutritionTitle => 'Your complete nutrition plan is ready';

  @override
  String get paywallNutritionDesc =>
      'From breakfast to dinner, a full daily plan with protein, calcium, zinc and vitamin D already worked out.';

  @override
  String get paywallScoreUnit => 'BeTaller Score';

  @override
  String get paywallScoreTitle => 'The system that keeps pushing you forward';

  @override
  String get paywallScoreDesc =>
      'Genetics, growth, nutrition, sleep and discipline merge into a single score. The moment it drops, you see exactly where to improve.';

  @override
  String get paywallPhotosUnit => 'visible difference';

  @override
  String get paywallPhotosTitle => 'Prove your change with photos';

  @override
  String get paywallPhotosDesc =>
      'Before and after comparisons build themselves, and every month’s photo sits together on your timeline.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'Let’s start in three steps';

  @override
  String get journeyIntroSubtitle =>
      'We set BeTaller up together. Your next step is waiting.';

  @override
  String get journeyStep1Title => 'Collecting your data';

  @override
  String get journeyStep1Desc =>
      'We take your height, age and lifestyle, then work out your potential.';

  @override
  String get journeyStep2Title => 'A tour of the app';

  @override
  String get journeyStep2Desc =>
      'We walk through every feature: what it does and how you use it.';

  @override
  String get journeyStep3Title => 'Using it yourself';

  @override
  String get journeyStep3Desc =>
      'You run your daily routine and we keep track of your progress.';

  @override
  String get journeyNow => 'NOW';

  @override
  String get journeyDone => 'DONE';

  @override
  String get journeySoon => 'SOON';

  @override
  String get tourHomeStreakTitle => 'Your Streak';

  @override
  String get tourHomeStreakDesc =>
      'Keeps growing as long as you keep your discipline. Miss a day and it resets.';

  @override
  String get tourHomeXpTitle => 'Your Level';

  @override
  String get tourHomeXpDesc =>
      'Rises with the XP you earn by staying disciplined. Don\'t fall off track!';

  @override
  String get tourHomeGoalsTitle => 'Today\'s Goals';

  @override
  String get tourHomeGoalsDesc =>
      'Shows your day\'s routines, tasks and water goal at a glance, so nothing slips by.';

  @override
  String get tourHomeTrackTitle => 'Water & Sleep Tracking';

  @override
  String get tourHomeTrackDesc =>
      'Log your daily water and sleep right here, in seconds.';

  @override
  String get tourPlanTabsTitle => 'Three Tabs: Today, Discipline, Nutrition';

  @override
  String get tourPlanTabsDesc =>
      'Your daily routine, your weekly program and your nutrition plan all live here.';

  @override
  String get tourPlanLevelTitle => 'Your Discipline Level';

  @override
  String get tourPlanLevelDesc =>
      'Shows how consistently you complete your routines. Level up for better results.';

  @override
  String get tourPlanTodayTitle => 'Today\'s Plan';

  @override
  String get tourPlanTodayDesc =>
      'Check off your daily routines here to grow your streak.';

  @override
  String get tourPlanTodayListTitle => 'Your Routines for Today';

  @override
  String get tourPlanTodayListDesc =>
      'Check each one off as you do it. Tap a routine to open its details.';

  @override
  String get tourPlanWeekGoalsTitle => 'This Week';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Perfect days, workouts and the measurement this week asks of you, including the mandatory one.';

  @override
  String get tourPlanMonthGoalsTitle => 'This Month';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Progress photos, a posture check and this month\'s measurements: the ones you shouldn\'t skip.';

  @override
  String get tourProgressHeightTitle => 'Your Current Height';

  @override
  String get tourProgressHeightDesc =>
      'Shows your height right now and your total gain. Add a new measurement from here.';

  @override
  String get tourProgressPhotosTitle => 'Progress Photos';

  @override
  String get tourProgressPhotosDesc =>
      'Track your transformation visually with photos you take regularly.';

  @override
  String get tourProgressPostureTitle => 'Posture Analysis';

  @override
  String get tourProgressPostureDesc =>
      'Have your posture analyzed from a photo and learn what to work on.';

  @override
  String get tourAnalysisScoreTitle => 'Your BeTaller Score';

  @override
  String get tourAnalysisScoreDesc =>
      'Your overall performance score, calculated from your genetics, velocity, nutrition and sleep.';

  @override
  String get tourAnalysisPredictionTitle => 'Your Height Prediction';

  @override
  String get tourAnalysisPredictionDesc =>
      'Shows your predicted final height and your year-by-year trajectory.';

  @override
  String get tourAnalysisPeerTitle => 'Compare with Peers';

  @override
  String get tourAnalysisPeerDesc =>
      'See where you rank and compare yourself with others your age.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Your Routines';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'See how many exercise routines you still need to complete today.';

  @override
  String get tourHomeGoalsChallengesTitle => 'Your Tasks';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Track the progress of your active challenges right here.';

  @override
  String get tourHomeGoalsWaterTitle => 'Your Water Goal';

  @override
  String get tourHomeGoalsWaterDesc =>
      'See how close you are to your daily water goal.';

  @override
  String get tourHomeReminderTitle => 'Your Next Reminder';

  @override
  String get tourHomeReminderDesc =>
      'See when your next reminder is coming, and edit it from here.';

  @override
  String get tourHomeChallengesTitle => 'Your Challenges';

  @override
  String get tourHomeChallengesDesc =>
      'Complete active challenges to earn extra XP.';

  @override
  String get tourHomeGrowthTitle => 'Your Growth Status';

  @override
  String get tourHomeGrowthDesc =>
      'See the gap between your total and latest measurement, and how many you\'ve logged.';

  @override
  String get tourHomeExploreTitle => 'Explore';

  @override
  String get tourHomeExploreDesc =>
      'Nutrition guides, growth recipes and more are waiting for you here.';

  @override
  String get tourPlanProgramHeaderTitle => 'Your 70-Day Program';

  @override
  String get tourPlanProgramHeaderDesc =>
      'See your overall progress, your current level and day in this ring.';

  @override
  String get tourPlanProgramLevelsTitle => 'Levels';

  @override
  String get tourPlanProgramLevelsDesc =>
      'See which of the 10 levels you\'re on, and which ones are still locked.';

  @override
  String get tourPlanNutritionHeaderTitle => 'Your Nutrition Progress';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Track how many of your daily nutrition routines you\'ve completed.';

  @override
  String get tourPlanNutritionFirstTitle => 'Nutrition Routines';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Check off the nutrition habits that support your growth.';

  @override
  String get tourProgressChartTitle => 'Growth Curve';

  @override
  String get tourProgressChartDesc =>
      'See your past measurements on a chart and understand where you\'re headed.';

  @override
  String get tourProgressReportTitle => 'Weekly Report';

  @override
  String get tourProgressReportDesc =>
      'Review the report that summarizes your week\'s progress.';

  @override
  String get tourProgressHistoryTitle => 'Your Measurement History';

  @override
  String get tourProgressHistoryDesc =>
      'See every height measurement you\'ve logged on a timeline.';

  @override
  String get tourAnalysisRadarTitle => 'Your Balance Chart';

  @override
  String get tourAnalysisRadarDesc =>
      'See your genetics, growth speed, nutrition, sleep and discipline balance on a radar chart, and learn your weakest link.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'Your Daily Needs';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'See your daily protein, calorie, sleep and water needs, tailored to your height and weight.';

  @override
  String get journeyDataDoneTitle => 'First step done';

  @override
  String get journeyDataDoneSubtitle =>
      'We have your data and your potential. Next comes the tour of the app.';

  @override
  String get journeyContinue => 'Continue';

  @override
  String get journeyEnterApp => 'Enter the app';

  @override
  String get journeyProgressLabel => 'Getting started';

  @override
  String get journeyTourDoneTitle => 'Welcome to BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'You\'ve completed all three steps. Now it\'s your turn: start your journey by completing your first routine.';

  @override
  String get journeyViewPlansButton => 'See your plans to get started';

  @override
  String get paywallRestoreLabel => 'Restore Purchases';

  @override
  String get paywallYearly => 'Yearly';

  @override
  String get paywallBestValue => 'Best value';

  @override
  String paywallSavePercent(String percent) {
    return 'SAVE $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/week';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/month';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/year';
  }

  @override
  String get paywallMonthly => 'Monthly';

  @override
  String get paywallWeekly => 'Weekly';

  @override
  String get paywallFreeTrial => '3 days free';

  @override
  String get paywallLoadError => 'Could not load purchase options, try again';

  @override
  String get paywallCtaAlt => 'Continue';

  @override
  String get paywallTrialDisclaimer =>
      '3 days free · then auto-renews · cancel anytime';

  @override
  String get paywallYearlyDisclaimer => 'Auto-renews yearly · cancel anytime';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days days free, then $price/week · cancel anytime';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days days free, then $price/month · cancel anytime';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days days free, then $price/year · cancel anytime';
  }

  @override
  String get paywallRenewsWeekly => 'Auto-renews weekly · cancel anytime';

  @override
  String get paywallRenewsMonthly => 'Auto-renews monthly · cancel anytime';

  @override
  String get resultCardTitle => 'Your predicted adult height';

  @override
  String resultRange(String min, String max) {
    return 'Likely range: $min to $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Taller than $percent% of people your age';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Estimated growth left: $amount';
  }

  @override
  String get resultFootnote =>
      'Estimate based on your parents\' heights and growth-chart data. Not medical advice.';

  @override
  String get postureCheckTitle => 'Quick posture check';

  @override
  String get postureCheckIntro =>
      'Stand with your heels, hips and shoulder blades against a wall, then answer three questions. Your score comes from your answers; the photo is kept for before-and-after comparison.';

  @override
  String get postureQHead =>
      'Does the back of your head touch the wall without lifting your chin?';

  @override
  String get postureQHeadA1 => 'Yes, easily';

  @override
  String get postureQHeadA2 => 'Only if I push it back';

  @override
  String get postureQHeadA3 => 'No, there\'s a gap';

  @override
  String get postureQShoulders =>
      'In your side photo, where are your shoulders compared with your ears?';

  @override
  String get postureQShouldersA1 => 'In line with my ears';

  @override
  String get postureQShouldersA2 => 'A little in front';

  @override
  String get postureQShouldersA3 => 'Clearly rounded forward';

  @override
  String get postureQLowerBack =>
      'Slide a hand behind your lower back. How much space is there?';

  @override
  String get postureQLowerBackA1 => 'A flat hand just fits';

  @override
  String get postureQLowerBackA2 => 'No space at all';

  @override
  String get postureQLowerBackA3 => 'A fist fits';

  @override
  String get postureCheckSave => 'See my score';

  @override
  String get postureCheckNote => 'A self-check, not a medical assessment.';

  @override
  String get paywallTester => 'Tester';

  @override
  String get introTag1 => 'PREDICTION';

  @override
  String get introTag2 => 'GROWTH';

  @override
  String get introTag3 => 'TRACKING';

  @override
  String get introTag4 => 'GAMIFICATION';

  @override
  String get introTag5 => 'COMMUNITY';

  @override
  String get introTitle1 => 'Discover your\nheight potential';

  @override
  String get introSubtitle1 =>
      'Let us calculate your full potential\nbased on genetics, age, and lifestyle.';

  @override
  String get introTitle2 => 'One step taller\nevery day';

  @override
  String get introSubtitle2 =>
      'Push your potential with personalized\nexercise and nutrition plans.';

  @override
  String get introTitle3 => 'Track every\ncentimeter';

  @override
  String get introSubtitle3 =>
      'See how your real progress\ndevelops with monthly measurements.';

  @override
  String get introTitle4 => 'Level up,\nearn rewards';

  @override
  String get introSubtitle4 =>
      'Complete 70-day programs,\nearn XP, and unlock new levels.';

  @override
  String get introTitle5 => 'Thousands already\ngrew taller';

  @override
  String get introSubtitle5 =>
      'Join the community of users\nwho reached their goals.';

  @override
  String get criticalWindow => 'CRITICAL WINDOW';

  @override
  String get heightPotentialFading => 'The facts about your';

  @override
  String get fadingAway => 'height potential..';

  @override
  String get painHookDesc =>
      'Every passing day, centimeters are permanently lost without the right habits. But this can still be reversed.';

  @override
  String get painGeneticTitle => 'Genetics isn\'t everything';

  @override
  String get painGeneticDesc =>
      'Genetics determines 60%, but what you do determines the other 40%. BeTaller is here for exactly that 40%.';

  @override
  String get painGeneticTag => 'Analysis';

  @override
  String get painSleepTitle => 'Optimize your sleep routine';

  @override
  String get painSleepDesc =>
      'Proper sleep every night can boost growth hormone production by 70%. BeTaller automates sleep tracking, you just sleep.';

  @override
  String get painSleepTag => 'Tracking';

  @override
  String get painPostureTitle => 'Gain centimeters now with posture';

  @override
  String get painPostureDesc =>
      'Correct posture can instantly add 1.5-3 cm. BeTaller\'s daily posture routine establishes this in a few weeks.';

  @override
  String get painPostureTag => 'Posture';

  @override
  String get painExerciseTitle => 'Your custom exercise plan is ready';

  @override
  String get painExerciseDesc =>
      'Morning stretches, hanging, spine routines: BeTaller prepared and scheduled these for you. Just 8-12 minutes a day.';

  @override
  String get painExerciseTag => 'Routines';

  @override
  String get painNutritionTitle => 'Your nutrition directly affects growth';

  @override
  String get painNutritionDesc =>
      'Protein, calcium, vitamin D: BeTaller reminds you every day which nutrients to take and when.';

  @override
  String get painNutritionTag => 'Nutrition';

  @override
  String get painTrackingTitle => 'Track your growth with your own eyes';

  @override
  String get painTrackingDesc =>
      'Monthly measurements, progress photos, growth chart: see every centimeter you gain.';

  @override
  String get painTrackingTag => 'Progress';

  @override
  String get selectYourGender => 'Select your gender';

  @override
  String get onboardingPredictSubtitle =>
      'This will be used to predict your height potential & create your custom plan.';

  @override
  String get other => 'Other';

  @override
  String get whenWereYouBorn => 'When were you born?';

  @override
  String get heightAndWeight => 'Height & weight';

  @override
  String get parentsHeight => 'Parents height';

  @override
  String get weeklyWorkout => 'Weekly workout';

  @override
  String get workoutsPerWeek => 'Workouts per week';

  @override
  String get whatsYourEthnicity => 'What\'s your ethnicity?';

  @override
  String get whiteCaucasian => 'White / Caucasian';

  @override
  String get blackAfricanAmerican => 'Black / African American';

  @override
  String get hispanicLatino => 'Hispanic / Latino';

  @override
  String get asian => 'Asian';

  @override
  String get middleEasternIndigenous => 'Middle Eastern / Indigenous';

  @override
  String get dontWantToAnswer => 'I don\'t want to answer';

  @override
  String get footSizeLabel => 'Foot size';

  @override
  String get selectYourSize => 'Select your size';

  @override
  String get whatsYourDreamHeight => 'What\'s your dream height?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Based on your input, we\'ll calculate the likelihood of achieving this height.';

  @override
  String get dreamHeightLabel => 'Dream height';

  @override
  String get sleepQuestion => 'How many hours do\nyou sleep each night?';

  @override
  String get thousandsSucceeded => 'Thousands\nSucceeded';

  @override
  String get youCanToo => 'You can do it too';

  @override
  String get yearsOld => 'years old';

  @override
  String get verifiedLabel => 'Verified';

  @override
  String get scientificData => 'SCIENTIFIC DATA';

  @override
  String get longTermResults => 'BeTaller creates\nlong-term results';

  @override
  String get longTermResultsSubtitle =>
      'Many people don\'t reach their ultimate height due to bad habits.';

  @override
  String get yourFinalHeight => 'Your final height';

  @override
  String get badHabitsLegend => 'Bad habits';

  @override
  String get optimizedLegend => 'Optimized';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'Height can be changed\nwith habits';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc => 'Ideal sleep boosts\ngrowth hormone';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Can be gained with\nposture improvement';

  @override
  String get didYouKnow => 'Did you know?';

  @override
  String get didYouKnowFact1 => 'Daily habits affect 30% of your height';

  @override
  String get didYouKnowFact2 => 'Spinal compression steals 1.5-3 cm of height';

  @override
  String get didYouKnowFact3 => 'Sleep deprivation reduces HGH by 70%';

  @override
  String get transformJourneyBegins => 'Your Transformation\nJourney Begins';

  @override
  String get transformJourneySubtitle =>
      'A comprehensive program designed to support\nyour healthy growth, step by step.';

  @override
  String get week1Label => '1W';

  @override
  String get week1Title => 'Week 1';

  @override
  String get week1Desc => 'Spine alignment improves, posture gets better';

  @override
  String get month1Label => '1M';

  @override
  String get month1Title => 'Month 1';

  @override
  String get month1Desc => 'First visible centimeters, sleep quality improves';

  @override
  String get month3Label => '3M';

  @override
  String get month3Title => 'Month 3';

  @override
  String get month3Desc => 'Average +1.5–2.5 cm gain, muscle development';

  @override
  String get month6Label => '6M';

  @override
  String get month6Title => 'Month 6';

  @override
  String get month6Desc => 'Reach maximum potential, live with your new height';

  @override
  String get reachYourGoal => 'Reach Your Goal';

  @override
  String get journeyBullet1 => 'Unlock your maximum potential';

  @override
  String get journeyBullet2 => 'Start living with your new height';

  @override
  String get journeyBullet3 => 'Write your success story';

  @override
  String get unlockButton => 'Unlock All';

  @override
  String get dreamHeightOdds => 'Dream height\nodds';

  @override
  String get growthCompleteLabel => 'Growth\ncomplete';

  @override
  String get tallerThanPct => 'Taller than 76.7% of your age';

  @override
  String get levelNovice => 'Novice';

  @override
  String get levelBuilder => 'Builder';

  @override
  String get levelGrinder => 'Grinder';

  @override
  String get levelWarrior => 'Warrior';

  @override
  String get levelGodTier => 'God Tier';

  @override
  String get levelDesc0 => 'Build your foundation';

  @override
  String get levelDesc1 => 'Accelerate growth';

  @override
  String get levelDesc2 => 'Intensify training';

  @override
  String get levelDesc3 => 'Push your limits';

  @override
  String get levelDesc4 => 'No pain, no gain';

  @override
  String get levelDesc5 => 'Champion mindset';

  @override
  String get levelDesc6 => 'Elite performance';

  @override
  String get levelDesc7 => 'Master your body';

  @override
  String get levelDesc8 => 'Legendary discipline';

  @override
  String get levelDesc9 => 'Maximum potential';

  @override
  String levelLabel(int level) {
    return 'LEVEL $level';
  }

  @override
  String daysLeftProgram(int days) {
    return '$days days left in your program';
  }

  @override
  String get tapLabel => 'TAP';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'Day';

  @override
  String get legendShort => 'Short';

  @override
  String get legendBelowAvg => 'Below avg';

  @override
  String get legendAverage => 'Average';

  @override
  String get legendTall => 'Tall';

  @override
  String get legendVeryTall => 'Very tall';

  @override
  String get pctBottom5 => 'Bottom 5%';

  @override
  String get pctBottom25 => 'Bottom 25%';

  @override
  String get pctMedian => 'Median';

  @override
  String get pctTop25 => 'Top 25%';

  @override
  String get pctTop5 => 'Top 5%';

  @override
  String get fallingBehind => 'Falling behind';

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes min read';
  }

  @override
  String get inThisArticle => 'In this article';

  @override
  String get nextArticle => 'Next article';

  @override
  String get purchaseUnavailable =>
      'Purchase could not be completed. Please try again.';

  @override
  String get viewPlan => 'View Plan';

  @override
  String get viewPlanSubtitle => 'See your subscription details';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Adding height measurements takes the prediction to $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'Your day, one screen';

  @override
  String get paywallSlideHomeCaption =>
      'Routines, water, sleep: three rings to close.';

  @override
  String get paywallSlideProgressTitle => 'See every centimetre';

  @override
  String get paywallSlideProgressCaption =>
      'Each measurement lands on the curve instantly.';

  @override
  String get paywallSlideAnalysisTitle => 'Five metrics, one shape';

  @override
  String get paywallSlideAnalysisCaption =>
      'The radar names your weakest link.';

  @override
  String get paywallSlidePotentialTitle => 'Know your potential';

  @override
  String get paywallSlidePotentialCaption =>
      'See where you stand among your peers.';

  @override
  String get paywallSlideDisciplineTitle => 'Keep the streak';

  @override
  String get paywallSlideDisciplineCaption => 'Every day pushes your level up.';

  @override
  String get paywallSlideRemindersTitle => 'Nudged at the right time';

  @override
  String get paywallSlideRemindersCaption =>
      'Set your hours, the app handles the rest.';

  @override
  String get paywallSlidePostureTitle => 'Fix your posture';

  @override
  String get paywallSlidePostureCaption =>
      'A side photo, a quick self-check, a clear routine.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days DAYS FREE';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Then $price · cancel anytime';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / year · cancel anytime';
  }

  @override
  String get obBedtimeTitle => 'What time do you usually sleep?';

  @override
  String get obBedtimeSubtitle =>
      'Your sleep reminder will be set around this time.';

  @override
  String get obWorkoutTimeTitle => 'What time do you work out?';

  @override
  String get obWorkoutTimeSubtitle =>
      'So your training reminder lands right on time.';

  @override
  String get obMealsTitle => 'How many meals a day?';

  @override
  String get obMealsSubtitle => 'Tap a time to adjust it to your own routine.';

  @override
  String obMealsCount(String count) {
    return '$count meals';
  }

  @override
  String obMealLabel(String n) {
    return 'Meal $n';
  }

  @override
  String get obProteinTitle => 'How many grams of protein a day?';

  @override
  String get obProteinSubtitle =>
      'A rough figure is enough. We build your plan around it.';

  @override
  String get obCaloriesTitle => 'How many calories a day, on average?';

  @override
  String get obCaloriesSubtitle =>
      'An estimate will do; we can sharpen it together later.';

  @override
  String get obNotSure => 'I\'m not sure';

  @override
  String get silNow => 'NOW';

  @override
  String get silPotential => 'POTENTIAL';

  @override
  String get chartMeasured => 'Your measurements';

  @override
  String chartPotential(String height) {
    return 'Potential $height';
  }

  @override
  String chartDream(String height) {
    return 'Your goal $height';
  }

  @override
  String get targetsTitle => 'Today, for you';

  @override
  String get targetsSubtitle =>
      'Worked out from your age, weight and training.';

  @override
  String get targetProtein => 'Protein';

  @override
  String get targetCalcium => 'Calcium';

  @override
  String get targetVitaminD => 'Vitamin D';

  @override
  String get targetWater => 'Water';

  @override
  String get targetSleep => 'Sleep';

  @override
  String get targetMove => 'Training';

  @override
  String targetPerMeal(String g) {
    return '$g g per meal';
  }

  @override
  String get unitHours => 'h';

  @override
  String get unitMinutes => 'min';

  @override
  String get planStrength => 'Strength';

  @override
  String get planJump => 'Jumps & sprints';

  @override
  String get planMobility => 'Stretching';

  @override
  String get planSport => 'Sport';

  @override
  String get planPosture => 'Posture';

  @override
  String get planRest => 'Rest';

  @override
  String planWeekTitle(int days) {
    return 'Your week: $days training days';
  }

  @override
  String get planPreviewTitle => 'Your plan is ready';

  @override
  String planPreviewTraining(int days) {
    return '$days training days a week, built for growth';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g protein a day, split across your meals';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours hours of sleep, with a bedtime reminder';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Today: $plan · $minutes min';
  }

  @override
  String get nRestTitle => 'Rest day today';

  @override
  String get nRestBody =>
      'Ten minutes of stretching is enough. Recovery is part of the plan.';

  @override
  String nProteinTitle(int grams) {
    return 'Today\'s protein goal: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'About $grams g per meal: eggs, yogurt, chicken, lentils.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Water goal: $liters L';
  }

  @override
  String get nWaterBody => 'One glass now keeps you on track for today.';

  @override
  String get nSleepTitle => 'Time to wind down';

  @override
  String nSleepBody(String hours) {
    return 'Your goal is $hours hours. Screens off, lights low.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Your potential: $potential. Measure in the morning and watch your chart move.';
  }

  @override
  String get nTrialDay1Title => 'Your plan is waiting';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Today: $plan, $minutes min. Log your height so your chart starts.';
  }

  @override
  String get nTrialEndTitle => 'Your free trial ends tomorrow';

  @override
  String nTrialEndBody(String price) {
    return 'Then it continues at $price. Your plan and progress stay saved either way.';
  }

  @override
  String get trophyContinue => 'Keep going';

  @override
  String get guideSteps => 'Step by step';

  @override
  String get guideMistakes => 'Common mistakes';

  @override
  String get guideTip => 'Tip';

  @override
  String get homeHeroTitle => 'Your height and your potential';

  @override
  String homeHeroGap(String cm) {
    return '$cm still ahead of you';
  }

  @override
  String get anSubtitle =>
      'Your score, what moves it, and where you\'re headed';

  @override
  String get anScoreLabel => 'BeTaller Score';

  @override
  String get anTierStarting => 'Starting';

  @override
  String get anTierBuilding => 'Building';

  @override
  String get anTierRising => 'Rising';

  @override
  String get anTierStrong => 'Strong';

  @override
  String get anTierPeak => 'Peak';

  @override
  String anTrendUp(int n) {
    return '+$n vs last week';
  }

  @override
  String anTrendDown(int n) {
    return '-$n vs last week';
  }

  @override
  String get anTrendFlat => 'Same as last week';

  @override
  String get anTrendFirst => 'Your weekly trend starts next week';

  @override
  String anNextTier(int n, String tier) {
    return '$n points to $tier';
  }

  @override
  String get anTopTier => 'Top tier. Keep it there';

  @override
  String anCoverage(int n, int total) {
    return 'Based on $n of $total signals';
  }

  @override
  String get anNoScoreTitle => 'Not enough data yet';

  @override
  String get anNoScoreBody =>
      'Log your sleep, some water or one workout today and your first score appears.';

  @override
  String get anFastestWin => 'Fastest win';

  @override
  String get anBreakdownTitle => 'What builds your score';

  @override
  String get anBreakdownHint =>
      'Each signal is scored 0 to 100 from your own data. The percentage is how much it counts.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'No data yet';

  @override
  String get anNotCounted => 'Not counted';

  @override
  String get anFTraining => 'Training';

  @override
  String get anFConsistency => 'Consistency';

  @override
  String get anFSleep => 'Sleep';

  @override
  String get anFHydration => 'Hydration';

  @override
  String get anFNutrition => 'Nutrition';

  @override
  String get anFPosture => 'Posture';

  @override
  String get anFMeasuring => 'Measuring';

  @override
  String get anFGrowth => 'Growth speed';

  @override
  String get anFHeadroom => 'Room to grow';

  @override
  String anBTraining(int done, int planned) {
    return '$done of $planned planned training days in the last 7 days';
  }

  @override
  String get anBTrainingNone =>
      'Counts the days you train against your weekly plan.';

  @override
  String anBConsistency(int streak, int active, int days) {
    return 'Streak $streak days, $active of $days days with half the plan done';
  }

  @override
  String get anBConsistencyNone =>
      'Counts your streak and the days you finish at least half of your plan.';

  @override
  String anBSleep(String hours, String target, int days) {
    return '$hours h a night on average, target $target h, $days nights logged';
  }

  @override
  String get anBSleepNone => 'No sleep logged in the last 7 days.';

  @override
  String anBHydration(String litres, String target, int days) {
    return '$litres L a day on average, target $target L, $days days logged';
  }

  @override
  String get anBHydrationNone => 'No water logged in the last 7 days.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done of $planned nutrition habits done in the last 7 days';
  }

  @override
  String get anBNutritionNone =>
      'Counts the protein, calcium, zinc and vitamin D habits in your plan.';

  @override
  String anBPosture(int raw, int days) {
    return 'Wall self-check $raw/90, $days days ago';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Wall self-check $raw/90, today';
  }

  @override
  String get anBPostureNone => 'No posture self-check yet.';

  @override
  String anBMeasuring(int days) {
    return 'Last measured $days days ago';
  }

  @override
  String get anBMeasuringToday => 'Measured today';

  @override
  String get anBMeasuringNone => 'No measurement yet.';

  @override
  String anBGrowth(String v, String e) {
    return '$v cm a year, typical at your age $e cm';
  }

  @override
  String get anBGrowthNone => 'Needs two measurements at least 30 days apart.';

  @override
  String get anBGrowthAdult =>
      'Growth plates usually close by 21, so growth speed does not count for you.';

  @override
  String anBHeadroom(String cm) {
    return '$cm between today and your potential';
  }

  @override
  String get anATraining => 'Start today\'s training';

  @override
  String get anAConsistency => 'Finish half of today\'s plan';

  @override
  String get anASleepLog => 'Log last night\'s sleep';

  @override
  String anASleep(String target) {
    return 'Sleep $target h tonight';
  }

  @override
  String get anAHydrationLog => 'Log a glass of water';

  @override
  String anAHydration(String left) {
    return 'Drink $left L more today';
  }

  @override
  String get anAHydrationDone => 'Target hit today. Same again tomorrow';

  @override
  String get anANutrition => 'Tick off today\'s nutrition habits';

  @override
  String get anAPostureFirst => 'Do a 1 minute posture self-check';

  @override
  String get anAPostureRedo => 'Redo your posture self-check';

  @override
  String get anAPostureKeep => 'Keep the daily posture routine';

  @override
  String get anAMeasure => 'Measure your height now';

  @override
  String get anAMeasureKeep => 'Measure again next week';

  @override
  String anAGrowthWait(int days) {
    return 'Measure again in $days days';
  }

  @override
  String get anAGrowth => 'Measure every 2 weeks to track it';

  @override
  String get anAHeadroom => 'See your potential';

  @override
  String get anPotentialTitle => 'Your potential';

  @override
  String get anPotentialLabel => 'Predicted adult height';

  @override
  String anPotentialToGo(String cm) {
    return '+$cm to go';
  }

  @override
  String get anPotentialReached => 'You\'re at your predicted height';

  @override
  String get anPotentialNote =>
      'The same number everywhere in the app. It only ever moves up.';

  @override
  String anDreamLine(String h) {
    return 'Your goal: $h';
  }

  @override
  String get anSourcesTitle => 'Where the centimetres come from';

  @override
  String get anSourcesGenes => 'Genes and age';

  @override
  String get anSourcesHabits => 'Sleep, food, training';

  @override
  String get anSourcesPosture => 'Posture';

  @override
  String get anPctTitle => 'Height for your age';

  @override
  String anPctValue(int p) {
    return 'Taller than $p% of people your age';
  }

  @override
  String get anPctBasis => 'WHO 2007 growth reference, same age and sex';

  @override
  String get anPctMore => 'Full comparison';

  @override
  String get anNeedsBasis => 'Worked out from your age, weight and training';

  @override
  String get anCalcium => 'Calcium';

  @override
  String get anVitaminD => 'Vitamin D';

  @override
  String get anMovement => 'Movement';

  @override
  String get anUnitMin => 'min';

  @override
  String get anUnitHours => 'h';

  @override
  String get anPerDay => 'a day';

  @override
  String get anPerNight => 'a night';

  @override
  String get anUnlockScoreTitle => 'Your full BeTaller Score';

  @override
  String get anUnlockScoreBody =>
      'The score, all nine signals behind it and what to do next.';

  @override
  String get anUnlockSourcesTitle => 'See where your centimetres come from';

  @override
  String get anUnlockNeedsTitle => 'Your daily needs, worked out for you';

  @override
  String get anUnlockCta => 'Unlock';

  @override
  String get anFlowResultTitle => 'Saved to your chart';

  @override
  String get anFlowResultBody =>
      'Your past heights now sit on the same curve as your measurements and your potential.';

  @override
  String get anFlowOpenAnalysis => 'Open your analysis';

  @override
  String anTopPct(int p) {
    return 'TOP $p%';
  }

  @override
  String get anNeedsTitle => 'Your daily needs';

  @override
  String get pgUnlockPro => 'Unlock with Pro';

  @override
  String get pgPhotosLockedTitle => 'See your transformation';

  @override
  String get pgPhotosLockedBody =>
      'Save a photo with your height every two weeks and compare any two with a slider.';

  @override
  String get pgTransformationTitle => 'Your transformation';

  @override
  String get pgHeightChange => 'height change';

  @override
  String get pgDaysApart => 'days apart';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '1 day',
    );
    return '$delta between these two photos, taken $_temp0 apart.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days days',
      one: '1 day',
    );
    return 'Same height, $_temp0 apart. Posture and shape change first, height follows over months.';
  }

  @override
  String get pgModeSlider => 'Slider';

  @override
  String get pgModeSideBySide => 'Side by side';

  @override
  String get pgDragToReveal => 'Drag to compare';

  @override
  String get pgOnePhotoTitle => 'Your before photo is saved';

  @override
  String pgOnePhotoBody(String date) {
    return 'Take the next one on $date in the same pose to see your first comparison.';
  }

  @override
  String get pgEmptyTitle => 'Start your transformation';

  @override
  String get pgEmptyBody =>
      'One photo every two weeks, same pose, same spot, with your height on it. In a few months you can slide between day 1 and today.';

  @override
  String get pgTakeFirstPhoto => 'Take your first photo';

  @override
  String get pgPhotoDueNow => 'New photo due';

  @override
  String pgNextPhotoOn(String date) {
    return 'Next photo $date';
  }

  @override
  String pgDayN(int n) {
    return 'Day $n';
  }

  @override
  String get pgNewPhoto => 'New photo';

  @override
  String get pgGuideTitle => 'Same pose, every time';

  @override
  String get pgGuideSubtitle =>
      'Photos only compare well when they are taken the same way.';

  @override
  String get pgGuideGhost =>
      'Your last photo is shown faintly. Line yourself up with it.';

  @override
  String get pgGuideStep1 => 'Stand 2 m away, phone at chest height';

  @override
  String get pgGuideStep2 => 'Face the camera, feet together, arms relaxed';

  @override
  String get pgGuideStep3 => 'Same spot, same light, fitted clothes';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'chest height';

  @override
  String get pgTakePhoto => 'Take photo';

  @override
  String get pgFromGallery => 'Choose from gallery';

  @override
  String get pgChoosePhoto => 'Choose a photo';

  @override
  String get pgPostureTitle => 'Posture check';

  @override
  String get pgPostureLockedTitle => 'Find your weak spots';

  @override
  String get pgPostureLockedBody =>
      'Score your head, shoulders and lower back, get two exercises for each, and see your score week by week.';

  @override
  String get pgAreaHead => 'Head';

  @override
  String get pgAreaShoulders => 'Shoulders';

  @override
  String get pgAreaLowerBack => 'Lower back';

  @override
  String get pgHeadMeaning0 =>
      'Your head sits right over your shoulders. Keep it there with a short daily reset.';

  @override
  String get pgHeadMeaning1 =>
      'Your head drifts forward when you relax. Very common with long phone time, and quick to improve.';

  @override
  String get pgHeadMeaning2 =>
      'Your head sits in front of your shoulders. Fix this first: it makes you look shorter in every photo.';

  @override
  String get pgShouldersMeaning0 =>
      'Shoulders in line with your ears. Your upper back is doing its job.';

  @override
  String get pgShouldersMeaning1 =>
      'Shoulders slightly forward. A tight chest pulls them in; opening it up brings them back.';

  @override
  String get pgShouldersMeaning2 =>
      'Rounded shoulders. Your upper back curves forward, which takes height off how you stand.';

  @override
  String get pgLowerBackMeaning0 =>
      'A neutral curve. Your hips and core hold your spine where it should be.';

  @override
  String get pgLowerBackMeaning1 =>
      'A flat lower back. Gentle extension and mobility bring the natural curve back.';

  @override
  String get pgLowerBackMeaning2 =>
      'A strong arch. Tight hip flexors tip your pelvis forward; stretching them and a stronger core level it out.';

  @override
  String get pgLegacyMeaning =>
      'Saved by an older version without these questions. Retake the check for advice on this area.';

  @override
  String get pgHowItWorks => 'How the check works';

  @override
  String get pgYourPosture => 'Your posture';

  @override
  String pgCheckedOn(String date) {
    return 'Checked $date';
  }

  @override
  String get pgOutOf100 => 'out of 100';

  @override
  String get pgAllAreasGood => 'All three areas look good. Keep them that way.';

  @override
  String pgStartWith(String area) {
    return 'Start here: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta vs last check';
  }

  @override
  String get pgStatusGood => 'Good';

  @override
  String get pgStatusFair => 'Could be better';

  @override
  String get pgStatusFix => 'Fix first';

  @override
  String get pgKeepItWith => 'Keep it with';

  @override
  String get pgFixItWith => 'Fix it with';

  @override
  String get pgRetakeNow => 'Time for your weekly check';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Next check in $n days',
      one: 'Next check tomorrow',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Same wall, same three questions. Weekly checks show whether the exercises are working.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Do the exercises above until $date, then retake the check to see if they worked.';
  }

  @override
  String get pgRetakeCheck => 'Retake check';

  @override
  String get pgRetakeAnyway => 'Retake now';

  @override
  String get pgHistoryTitle => 'Your scores';

  @override
  String pgSinceFirst(String delta) {
    return '$delta since first';
  }

  @override
  String get pgHistoryOne =>
      'This is your first check. Retake it in 7 days and your trend starts here.';

  @override
  String get pgPostureIntroTitle => 'How straight do you stand?';

  @override
  String get pgPostureIntroBody =>
      'Three questions against a wall, about one minute. You get a score and the two exercises that fix each weak spot.';

  @override
  String get pgPostureStep1 =>
      'Stand with heels, hips and shoulder blades against a wall.';

  @override
  String get pgPostureStep2 =>
      'Take a side photo, full body in frame, so you can look back later.';

  @override
  String get pgPostureStep3 =>
      'Answer three questions honestly. Your score comes from your answers.';

  @override
  String get pgPostureStep4 =>
      'Retake it once a week, at the same time of day.';

  @override
  String get pgStartCheck => 'Start posture check';

  @override
  String pgWeekRange(String start, String end) {
    return '$start to $end';
  }

  @override
  String get pgGradeGreat => 'Champion week';

  @override
  String get pgGradeGood => 'Solid week';

  @override
  String get pgGradeOk => 'Getting going';

  @override
  String get pgGradeStart => 'A fresh start';

  @override
  String get pgTopWeek => 'Top week';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta vs last week';
  }

  @override
  String get pgDaysCompleted => 'days with the full plan';

  @override
  String get pgDayStreak => 'day streak';

  @override
  String pgBestDay(String day) {
    return 'Best: $day';
  }

  @override
  String get pgNextWeekFocus => 'Next week focus';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Finish your whole plan on $n days. This week you did it on $done.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Fit in $n training sessions. This week you did $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Measure your height once, in the morning, barefoot, same spot. That is how you see real change.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Every goal met. Now make $day a full day too.';
  }

  @override
  String get pgFocusKeep =>
      'Every goal met and every day full. Same plan, same rhythm.';

  @override
  String get pgHeightThisWeek => 'Height this week';

  @override
  String pgHeightNow(String height) {
    return 'Now $height';
  }

  @override
  String get pgNoMeasurementWeek => 'No measurement this week yet';

  @override
  String get pgFirstMeasurement => 'Your first measurement';

  @override
  String pgStartedAt(String height) {
    return 'Start $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Potential $height';
  }

  @override
  String pgToPotential(String cm) {
    return '$cm left to your predicted potential.';
  }

  @override
  String get pgPotentialReached =>
      'You are at your predicted potential. Posture work can still add what you show.';

  @override
  String get pgHabitsToday => 'Logged today';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves moves · $minutes min';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total done';
  }

  @override
  String get plStartWorkout => 'Start workout';

  @override
  String get plContinueWorkout => 'Continue workout';

  @override
  String get plWorkoutDoneToday => 'Today\'s workout is done';

  @override
  String get plTraining => 'Training';

  @override
  String get plHabits => 'Daily habits';

  @override
  String get plRestDayNote =>
      'An easy day: a short yoga flow keeps you loose for tomorrow.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps reps';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds s';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds s each side';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g across your meals';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters L through the day';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours h tonight';
  }

  @override
  String get plYourRoutines => 'Your routines';

  @override
  String get plNewRoutine => 'New routine';

  @override
  String get plCustomEmpty =>
      'Build a routine of your own and tick it off here every day.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'Delete \"$name\"?';
  }

  @override
  String get plHoldToDelete => 'Press and hold a routine to delete it.';

  @override
  String plSetOf(int current, int total) {
    return 'Set $current of $total';
  }

  @override
  String get plRest => 'Rest';

  @override
  String get plStartSet => 'Start set';

  @override
  String get plSetDone => 'Set done';

  @override
  String get plSkipRest => 'Skip rest';

  @override
  String get plNextMove => 'Next move';

  @override
  String get plSkipMove => 'Skip';

  @override
  String plUpNext(String name) {
    return 'Up next: $name';
  }

  @override
  String get plLastMove => 'Last move';

  @override
  String get plWorkoutComplete => 'Workout complete';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves moves in about $minutes min. Every session counts.';
  }

  @override
  String get plEachSide => 'Each side';

  @override
  String get plMoveDone => 'Move done';

  @override
  String plRepsBig(int reps) {
    return '$reps reps';
  }

  @override
  String get plSessionHint =>
      'Go at your own pace and tap done when you finish.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'Day $day of $total';
  }

  @override
  String get plTodayStep => 'Today\'s step';

  @override
  String get plTickToComplete => 'Tick every move to complete the day';

  @override
  String plNextDayTomorrow(int day) {
    return 'Day $day opens tomorrow. Rest is part of growing.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    return '$days days to level $level';
  }

  @override
  String get plProgramFinished => 'All 70 days done. You finished the program.';

  @override
  String plDayCompleteToast(int day) {
    return 'Day $day complete';
  }

  @override
  String get plLevelWeek => 'This level\'s week';

  @override
  String get plProgressionTitle => 'How it gets harder';

  @override
  String get plNow => 'Now';

  @override
  String plLevelN(int n) {
    return 'Lv $n';
  }

  @override
  String get plUnlockProgram => 'Unlock the 70-day program';

  @override
  String get plProgramPitch =>
      '10 levels, one a week. Each one adds seconds to your holds, reps to your jumps and a set when you are ready.';

  @override
  String plDayLocked(int day) {
    return 'Finish day $day first';
  }

  @override
  String plCurrentDay(int day) {
    return 'Day $day';
  }

  @override
  String get plTodaysTargets => 'Today\'s targets';

  @override
  String get plTargetsBasis => 'Worked out from your age, weight and training';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals meals x $grams g';
  }

  @override
  String get plZinc => 'Zinc';

  @override
  String get plMagnesium => 'Magnesium';

  @override
  String get plEnergy => 'Energy';

  @override
  String get plChecklist => 'Today\'s checklist';

  @override
  String plCheckProtein(int grams) {
    return 'Protein $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'Calcium $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'Vitamin D $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return 'Water $liters L';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount from ticked meals';
  }

  @override
  String get plVitaminDNote =>
      '15 min of midday sun on arms and face, or a supplement your doctor okays';

  @override
  String plWaterLogged(String liters) {
    return '$liters L logged so far';
  }

  @override
  String get plMealPlan => 'Your meal plan';

  @override
  String get plMealPlanSub => 'Real foods, real grams, sized to your targets';

  @override
  String get plSnack => 'Snack';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g protein · $calcium mg calcium · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'goal $grams g';
  }

  @override
  String get plMarkEaten => 'Mark as eaten';

  @override
  String get plEaten => 'Eaten';

  @override
  String get plPlanTotal => 'Day total';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'These meals give about $planKcal of your $kcal kcal. Fill the rest with fruit, vegetables, bread or rice.';
  }

  @override
  String get plWeeklyMenu => 'Weekly menu';

  @override
  String get plWeeklyMenuSub => 'A different plate every day, the same targets';

  @override
  String get plUnlockMenu => 'Unlock the full weekly menu';

  @override
  String get plRecipes => 'Recipes';

  @override
  String get plRecipesSub => 'Quick high-protein dishes';

  @override
  String get plNutritionGuide => 'Nutrition guide';

  @override
  String get plNutritionGuideSub => 'Nutrients, foods and supplements';

  @override
  String plPieces(int n) {
    return '$n pcs';
  }

  @override
  String get plFoodOats => 'Oats';

  @override
  String get plFoodMilk => 'Milk';

  @override
  String get plFoodBanana => 'Banana';

  @override
  String get plFoodWalnuts => 'Walnuts';

  @override
  String get plFoodGreekYogurt => 'Greek yogurt';

  @override
  String get plFoodYogurt => 'Yogurt';

  @override
  String get plFoodEggs => 'Eggs';

  @override
  String get plFoodBread => 'Wholegrain bread';

  @override
  String get plFoodWhiteCheese => 'Feta cheese';

  @override
  String get plFoodHardCheese => 'Cheddar';

  @override
  String get plFoodSalad => 'Tomato and cucumber salad';

  @override
  String get plFoodOrange => 'Orange';

  @override
  String get plFoodPeanutButter => 'Peanut butter';

  @override
  String get plFoodSpinach => 'Spinach';

  @override
  String get plFoodCottageCheese => 'Cottage cheese';

  @override
  String get plFoodChicken => 'Chicken breast';

  @override
  String get plFoodBulgur => 'Bulgur';

  @override
  String get plFoodAyran => 'Ayran (yogurt drink)';

  @override
  String get plFoodTuna => 'Tuna (canned)';

  @override
  String get plFoodPasta => 'Pasta';

  @override
  String get plFoodBeef => 'Lean beef';

  @override
  String get plFoodRice => 'Rice';

  @override
  String get plFoodChickpeas => 'Chickpeas';

  @override
  String get plFoodSalmon => 'Salmon';

  @override
  String get plFoodBroccoli => 'Broccoli';

  @override
  String get plFoodPotato => 'Potatoes';

  @override
  String get plFoodLentils => 'Lentils';

  @override
  String get plFoodSardines => 'Sardines';

  @override
  String get plFoodAlmonds => 'Almonds';

  @override
  String get plFoodKefir => 'Kefir';

  @override
  String get plFoodPumpkinSeeds => 'Pumpkin seeds';
}
