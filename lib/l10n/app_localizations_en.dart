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
  String get noData => 'No data';

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
}
