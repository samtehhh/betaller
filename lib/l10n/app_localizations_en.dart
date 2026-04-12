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
  String get navRoutines => 'Routines';

  @override
  String get navProgress => 'Progress';

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
  String remaining(String cm) {
    return '+$cm cm left';
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
      'I discovered my growth potential with BeTaller! Try it too: https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';

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
  String get currentStreak => 'Current Streak';

  @override
  String get bestStreakLabel => 'Best Streak';

  @override
  String get achievementLabel => 'Achievement';

  @override
  String get achievements => 'Achievements';

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
  String get yourScore => 'Your BeTaller Score';

  @override
  String get letsStart => 'Let\'s Start';

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
  String growthPotential(String cm) {
    return '+$cm cm growth potential';
  }

  @override
  String get heightAt21 => 'at age 21';

  @override
  String confidenceLevel(String pct) {
    return '$pct% confidence level';
  }

  @override
  String heightRange(String min, String max) {
    return '$min - $max cm range';
  }

  @override
  String get currentLabel => 'CURRENT';

  @override
  String get predictedLabel => 'PREDICTED';

  @override
  String get yearlyPredictions => 'Yearly Predictions';

  @override
  String get tipMorningMeasure =>
      'Measure height in the morning - disc pressure causes height loss during the day. Most accurate measurement is in the morning.';

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
  String get overview => 'Overview';

  @override
  String get routinesLabel => 'Routines';

  @override
  String get streakLabel => 'Streak';

  @override
  String get heightLabel => 'Height';

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
  String get overLimit => 'Over limit — affects HGH';

  @override
  String get resetToday => 'Reset today';

  @override
  String get stressToday => 'Stress Today';

  @override
  String get stressVeryCalmLabel => 'Very calm — optimal for growth';

  @override
  String get stressCalmLabel => 'Calm';

  @override
  String get stressNeutralLabel => 'Neutral';

  @override
  String get stressStressedLabel => 'Stressed';

  @override
  String get stressVeryStressedLabel => 'Very stressed — cortisol blocks HGH';

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
      'Stress is elevated this week. Consider breathing exercises — cortisol blocks growth.';

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
  String get cmGained => 'cm gained';

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
  String get postureCoachSubtitle => 'AI-powered posture scoring';

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
  String get routineFormHint => 'Optional — how to perform this routine';

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
  String get sciSourcePrefix => 'Source: ';

  @override
  String get program => 'Program';

  @override
  String get todaysExercises => 'TODAY\'S EXERCISES';

  @override
  String get dailyNutritionPlan => 'DAILY NUTRITION PLAN';

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
      'BeTaller was built specifically for you to reach your genetic limit — and even surpass it. Every feature, for you.';

  @override
  String get greetingAllDone => 'Great job! 🎯';

  @override
  String get greetingAllDoneSub => 'You\'ve completed today\'s tasks.';

  @override
  String greetingStreak30(int streak) {
    return '$streak day streak — legendary level.';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak day streak — keep it up.';
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
  String get aiAnalysisLabel => 'AI ANALYSIS';

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
  String get paywallRestoreLabel => 'Restore Purchases';

  @override
  String get paywallYearly => 'Yearly';

  @override
  String get paywallBestValue => 'Best value';

  @override
  String get paywallMonthly => 'Monthly';

  @override
  String get paywallFreeTrial => '3 days free';

  @override
  String get paywallLoadError => 'Could not load purchase options, try again';

  @override
  String get paywallCta => 'Try Free';

  @override
  String get paywallCtaAlt => 'Continue';

  @override
  String get paywallTrialDisclaimer =>
      '3 days free · then auto-renews · cancel anytime';

  @override
  String get paywallYearlyDisclaimer => 'Auto-renews yearly · cancel anytime';

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
  String get heightPotentialFading => 'Your height potential';

  @override
  String get fadingAway => 'is fading away!';

  @override
  String get painHookDesc =>
      'Every passing day, centimeters are permanently lost without the right habits. But this can still be reversed.';

  @override
  String get painGeneticTitle => 'Genetics isn\'t everything';

  @override
  String get painGeneticDesc =>
      'Genetics determines 60% — but what you do determines the other 40%. BeTaller is here for exactly that 40%.';

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
      'Correct posture can instantly add 1.5–3 cm. BeTaller\'s daily posture routine establishes this in a few weeks.';

  @override
  String get painPostureTag => 'Posture';

  @override
  String get painExerciseTitle => 'Your custom exercise plan is ready';

  @override
  String get painExerciseDesc =>
      'Morning stretches, hanging, spine routines — BeTaller prepared and scheduled these for you. Just 8–12 minutes a day.';

  @override
  String get painExerciseTag => 'Routines';

  @override
  String get painNutritionTitle => 'Your nutrition directly affects growth';

  @override
  String get painNutritionDesc =>
      'Protein, calcium, vitamin D — BeTaller reminds you every day which nutrients to take and when.';

  @override
  String get painNutritionTag => 'Nutrition';

  @override
  String get painTrackingTitle => 'Track your growth with your own eyes';

  @override
  String get painTrackingDesc =>
      'Monthly measurements, progress photos, growth chart — see every centimeter you gain.';

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
      'A scientifically proven program will\ntake you to your goal step by step.';

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
}
