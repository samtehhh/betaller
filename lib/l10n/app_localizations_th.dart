// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Thai (`th`).
class AppLocalizationsTh extends AppLocalizations {
  AppLocalizationsTh([String locale = 'th']) : super(locale);

  @override
  String get navHome => 'หน้าหลัก';

  @override
  String get navAnalysis => 'วิเคราะห์';

  @override
  String get navRoutines => 'แผนของฉัน';

  @override
  String get disciplineTitle => 'วินัย';

  @override
  String get disciplineProgramTitle => 'โปรแกรมวินัย';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total วัน';
  }

  @override
  String get disciplineCompleteDay => 'ทำวันนี้ให้จบ';

  @override
  String disciplineDayN(int n) {
    return 'วันที่ $n';
  }

  @override
  String get disciplineLevels => 'เลเวล';

  @override
  String get disciplineLevelDone => 'สำเร็จ';

  @override
  String get disciplineLocked => 'ล็อกอยู่';

  @override
  String get disciplineTodayIs => 'วันนี้';

  @override
  String get disciplineToday => 'วันนี้';

  @override
  String get disciplineTodayPlan => 'แผนวันนี้';

  @override
  String get disciplineWeek => 'สัปดาห์นี้';

  @override
  String get disciplineMonth => 'เดือนนี้';

  @override
  String get disciplineLevel => 'เลเวลวินัย';

  @override
  String disciplineStreakDays(int days) {
    return 'ต่อเนื่อง $days วัน';
  }

  @override
  String disciplineToNext(int days) {
    return 'อีก $days วันถึงเลเวลถัดไป';
  }

  @override
  String get disciplineMaxTier => 'ถึงเลเวลสูงสุดแล้ว';

  @override
  String get disciplineTierSpark => 'จุดประกาย';

  @override
  String get disciplineTierSteady => 'มั่นคง';

  @override
  String get disciplineTierSharp => 'เฉียบคม';

  @override
  String get disciplineTierSolid => 'แข็งแกร่ง';

  @override
  String get disciplineTierRelentless => 'ไม่หยุดยั้ง';

  @override
  String get disciplineTierUnbroken => 'ไม่มีสะดุด';

  @override
  String get disciplineTierLegend => 'ตำนาน';

  @override
  String get goalPerfectDays => 'วันที่ทำแผนครบ';

  @override
  String get goalWorkouts => 'ครั้งที่ฝึก';

  @override
  String get goalMeasurement => 'วัดส่วนสูง';

  @override
  String get goalPhoto => 'รูปความคืบหน้า';

  @override
  String get goalPostureCheck => 'เช็กท่าทาง';

  @override
  String get disciplineAllDone => 'วันนี้ครบแล้ว';

  @override
  String disciplineDayProgress(int done, int total) {
    return 'เสร็จ $done/$total';
  }

  @override
  String get navProgress => 'ความคืบหน้า';

  @override
  String get trackingSection => 'เครื่องมือติดตามของคุณ';

  @override
  String get photosBenefit =>
      'ก่อนและหลัง วางเทียบกัน เห็นความเปลี่ยนแปลงด้วยตาแทนการอ่าน';

  @override
  String get postureBenefit =>
      'ศีรษะ ไหล่ และหลังส่วนล่าง ยืนตัวตรงช่วยให้เห็นส่วนสูงจริงเพิ่มขึ้นได้ถึง 2-3 cm';

  @override
  String get reportBenefit =>
      'ให้คะแนนสัปดาห์ของคุณทีละวัน แล้วดูว่าพลาดตรงไหน';

  @override
  String get photosCta => 'เพิ่มรูป';

  @override
  String get postureCta => 'วิเคราะห์';

  @override
  String get reportCta => 'เปิดรายงาน';

  @override
  String get toolStateReady => 'พร้อม';

  @override
  String get photosSummaryEmpty => 'เพิ่มรูปแรกของคุณ';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count รูป',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'ยังไม่มีการวิเคราะห์';

  @override
  String postureSummaryScore(int score) {
    return 'ท่าทาง $score/100';
  }

  @override
  String get navProfile => 'โปรไฟล์';

  @override
  String greeting(String name) {
    return 'สวัสดี $name';
  }

  @override
  String get currentHeight => 'ส่วนสูงปัจจุบัน';

  @override
  String get target => 'เป้าหมาย';

  @override
  String completed(String pct) {
    return 'สำเร็จ $pct%';
  }

  @override
  String remaining(String cm, String unit) {
    return 'เหลืออีก +$cm $unit';
  }

  @override
  String get updateAnalysis => 'อัปเดตการวิเคราะห์';

  @override
  String get analysisSubtitle => 'รับการคาดการณ์จากส่วนสูงในอดีต + นิสัย';

  @override
  String get dailyRoutines => 'กิจวัตรประจำวัน';

  @override
  String get allRoutinesDone => 'ทำกิจวัตรครบทุกอย่างแล้ว!';

  @override
  String get water => 'น้ำ';

  @override
  String get sleep => 'การนอน';

  @override
  String get growthSummary => 'สรุปการเติบโต';

  @override
  String get total => 'รวม';

  @override
  String get last => 'ล่าสุด';

  @override
  String get measurement => 'การวัด';

  @override
  String get dailyTip => 'เคล็ดลับประจำวัน';

  @override
  String get waterTracking => 'ติดตามการดื่มน้ำ';

  @override
  String get waterGoalReached => 'ถึงเป้าหมายวันนี้แล้ว';

  @override
  String waterRemaining(String amount) {
    return 'อีก $amount';
  }

  @override
  String get undo => 'เลิกทำ';

  @override
  String waterToday(String amount) {
    return 'วันนี้: $amount L';
  }

  @override
  String get sleepTracking => 'ติดตามการนอน';

  @override
  String sleepTarget(String hours) {
    return 'เป้าหมาย: $hours ชั่วโมง';
  }

  @override
  String get hours => 'ชั่วโมง';

  @override
  String get save => 'บันทึก';

  @override
  String get cancel => 'ยกเลิก';

  @override
  String get analysis => 'วิเคราะห์';

  @override
  String get betallerScore => 'คะแนน BeTaller';

  @override
  String get genetic => 'พันธุกรรม';

  @override
  String get growth => 'การเติบโต';

  @override
  String get nutrition => 'โภชนาการ';

  @override
  String get sleepLabel => 'การนอน';

  @override
  String get discipline => 'วินัย';

  @override
  String get improveScore => 'เพิ่มคะแนนของคุณ';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'โภชนาการน่าเป็นห่วง!';

  @override
  String get nutritionStrengthen => 'เสริมโภชนาการ';

  @override
  String get sleepRecordAdd => 'เพิ่มบันทึกการนอน';

  @override
  String get sleepPoor => 'เวลานอนยังไม่ดี';

  @override
  String get sleepImprove => 'ปรับการนอนให้ดีขึ้น';

  @override
  String get startToday => 'เริ่มวันนี้เลย!';

  @override
  String routinesRemaining(int count) {
    return 'เหลือ $count กิจวัตร';
  }

  @override
  String get keepStreak => 'รักษาความต่อเนื่อง';

  @override
  String get addFirstMeasurement => 'เพิ่มการวัดครั้งแรก';

  @override
  String get addMeasurement => 'เพิ่มการวัด';

  @override
  String waterHalfNotReached(String amount) {
    return 'วันนี้คุณยังดื่มน้ำไม่ถึงครึ่งเป้าหมาย ดื่มเพิ่มอีก ${amount}L นะ';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'อีก ${amount}L ก็ถึงเป้าหมายน้ำแล้ว ใกล้แล้ว!';
  }

  @override
  String bmiLow(String bmi) {
    return 'BMI ของคุณคือ $bmi ค่อนข้างต่ำ ลองเพิ่มโปรตีนและแคลอรี่';
  }

  @override
  String get bodyFactsTitle => 'ร่างกายของคุณ';

  @override
  String get dailyNeedsTitle => 'เป้าหมายประจำวันของคุณ';

  @override
  String bmiHigh(String bmi) {
    return 'BMI ของคุณคือ $bmi ค่อนข้างสูง เน้นกินอาหารที่ดีต่อสุขภาพ';
  }

  @override
  String get nutritionDefault => 'ดื่มน้ำให้ถึงเป้า และกินอาหารให้สมดุล';

  @override
  String sleepNoRecord(String hours) {
    return 'วันนี้ยังไม่มีบันทึกการนอน ตั้งเป้า $hours ชั่วโมงแล้วบันทึกไว้';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'วันนี้คุณนอน $current ชั่วโมง ขาดไป $missing ชั่วโมง เข้านอนให้เร็วขึ้นนะ!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'ใกล้แล้ว นอนให้ถึง $hours ชั่วโมงจะช่วยให้โกรทฮอร์โมนหลั่งได้เต็มที่';
  }

  @override
  String get sleepGood => 'นอนได้ดีมาก! ทำต่อไปนะ';

  @override
  String noRoutinesDone(int total) {
    return 'วันนี้ยังไม่ได้ทำกิจวัตรเลย เริ่มสักอย่างจาก $total อย่างกัน!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return 'วันนี้ทำแล้ว $done/$total กิจวัตร อีก $left อย่าง!';
  }

  @override
  String streakBuilding(int needed) {
    return 'วันนี้เยี่ยมมาก! อีก $needed วันจะเริ่มนับความต่อเนื่อง';
  }

  @override
  String streakContinue(int days) {
    return 'ต่อเนื่อง $days วัน! ยิ่งทำต่อ คะแนนยิ่งเพิ่ม';
  }

  @override
  String get noMeasurements =>
      'ยังไม่มีการวัดส่วนสูง เพิ่มครั้งแรกเพื่อให้คาดการณ์ได้แม่นขึ้น';

  @override
  String fewMeasurements(int count) {
    return 'เพิ่มการวัดอีก $count ครั้ง เพื่อคำนวณความเร็วการเติบโต';
  }

  @override
  String goodMeasurements(int count) {
    return 'คุณมีการวัด $count ครั้ง ถ้าครบ 5 ครั้งจะแม่นยำขึ้นมาก';
  }

  @override
  String get keepMeasuring =>
      'วัดต่อไปเรื่อยๆ ทุกข้อมูลใหม่ช่วยให้คาดการณ์ดีขึ้น';

  @override
  String get heightPrediction => 'คาดการณ์ส่วนสูง';

  @override
  String get predictedHeightAt21 => 'ส่วนสูงที่คาดการณ์ตอนอายุ 21';

  @override
  String get predictionMethod =>
      'คำนวณจากข้อมูลพันธุกรรม (พ่อแม่) ความเร็วการเติบโต BMI และอายุรวมกัน';

  @override
  String get growthStatus => 'สถานะการเติบโต';

  @override
  String get growthRemaining => 'ยังรอคุณอยู่ข้างหน้า';

  @override
  String get growthBreakdown => 'เซนติเมตรเหล่านี้มาจากไหน';

  @override
  String get geneticGainLabel => 'จากพันธุกรรม';

  @override
  String get lifestyleLabel => 'ไลฟ์สไตล์';

  @override
  String get geneticCeilingLabel => 'เพดาน';

  @override
  String get reachableTargetHeight => 'ส่วนสูงเป้าหมายที่เป็นไปได้';

  @override
  String get geneticCeilingProgress => 'ความคืบหน้าสู่เพดานพันธุกรรม';

  @override
  String get completionLabel => 'ความสำเร็จ';

  @override
  String get growthVelocity => 'ความเร็วการเติบโต';

  @override
  String get noData => 'ไม่มีข้อมูล';

  @override
  String growthRate(String rating) {
    return 'อัตราการเติบโต: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'แคลอรี่';

  @override
  String get kcalDay => 'kcal/วัน';

  @override
  String get daily => 'ต่อวัน';

  @override
  String get protein => 'โปรตีน';

  @override
  String get minimum => 'ขั้นต่ำ';

  @override
  String get age => 'อายุ';

  @override
  String get male => 'ชาย';

  @override
  String get female => 'หญิง';

  @override
  String get yearlyPrediction => 'คาดการณ์รายปี';

  @override
  String ageYear(int age) {
    return '$age ปี';
  }

  @override
  String get progressTitle => 'ติดตามความคืบหน้า';

  @override
  String get totalGrowth => 'รวม';

  @override
  String get lastDiff => 'ต่างล่าสุด';

  @override
  String get measurementCount => 'การวัด';

  @override
  String get heightChart => 'กราฟส่วนสูง';

  @override
  String get chartMinData => 'ต้องมีการวัดอย่างน้อย 2 ครั้งจึงจะแสดงกราฟ';

  @override
  String get chartInstruction => 'เพิ่มการวัดเพื่อดูกราฟความคืบหน้าของคุณ!';

  @override
  String get addMeasurementButton => 'เพิ่มการวัดใหม่';

  @override
  String get measurementHistory => 'ประวัติการวัด';

  @override
  String get deleteTitle => 'ลบการวัด';

  @override
  String get deleteMessage => 'แน่ใจไหมว่าต้องการลบการวัดนี้?';

  @override
  String get dismiss => 'ยกเลิก';

  @override
  String get delete => 'ลบ';

  @override
  String get newMeasurement => 'วัดส่วนสูงใหม่';

  @override
  String get routines => 'กิจวัตร';

  @override
  String streakDays(int days) {
    return '$days วัน';
  }

  @override
  String get progressStatus => 'สถานะความคืบหน้า';

  @override
  String get completedLabel => 'สำเร็จแล้ว!';

  @override
  String get all => 'ทั้งหมด';

  @override
  String get exercise => 'ออกกำลังกาย';

  @override
  String get posture => 'ท่าทาง';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return 'ดีที่สุด: $_temp0';
  }

  @override
  String get editProfile => 'แก้ไขโปรไฟล์';

  @override
  String get editProfileSubtitle => 'อัปเดตส่วนสูง น้ำหนัก อายุ';

  @override
  String get name => 'ชื่อ';

  @override
  String birthDate(String date) {
    return 'วันเกิด: $date';
  }

  @override
  String get heightCm => 'ส่วนสูง (cm)';

  @override
  String get weightKg => 'น้ำหนัก (kg)';

  @override
  String get fatherHeight => 'ส่วนสูงพ่อ (cm)';

  @override
  String get motherHeight => 'ส่วนสูงแม่ (cm)';

  @override
  String get notifications => 'การแจ้งเตือน';

  @override
  String get reminderNextLabel => 'การเตือนถัดไป';

  @override
  String get reminderManageHint => 'จัดการการเตือนของคุณ';

  @override
  String get reminderOffCta => 'เปิดการแจ้งเตือน';

  @override
  String get stateOn => 'เปิด';

  @override
  String get stateOff => 'ปิด';

  @override
  String get reminderMasterTitle => 'การแจ้งเตือน';

  @override
  String reminderActiveCount(int count) {
    return 'เปิดอยู่ $count รายการ';
  }

  @override
  String get reminderBuiltIn => 'การเตือนในตัว';

  @override
  String get reminderYourOwn => 'การเตือนของคุณเอง';

  @override
  String get reminderAdd => 'เพิ่มการเตือน';

  @override
  String get reminderDays => 'วัน';

  @override
  String get reminderEveryDay => 'ทุกวัน';

  @override
  String get reminderLabelHint => 'ให้เราเตือนเรื่องอะไรดี?';

  @override
  String get reminderEmptyHint =>
      'เพิ่มของคุณเอง: ฝึกซ้อม วิตามิน ยืดเหยียด อะไรก็ได้ที่ต้องการ';

  @override
  String get reminderCustom => 'การเตือน';

  @override
  String get reminderCustomBody => 'ถึงเวลาที่คุณตั้งไว้แล้ว';

  @override
  String get reminderExercise => 'ออกกำลังกาย';

  @override
  String get reminderNutrition => 'โภชนาการ';

  @override
  String get reminderWater => 'น้ำ';

  @override
  String get reminderPosture => 'ท่าทาง';

  @override
  String get reminderRoutine => 'กิจวัตรประจำวัน';

  @override
  String get reminderSleep => 'การนอน';

  @override
  String get reminderMeasurement => 'วัดส่วนสูง';

  @override
  String get notificationsOn => 'เปิดการเตือนอยู่';

  @override
  String get notificationsOff => 'ปิดการเตือนอยู่';

  @override
  String get premium => 'อัปเกรดเป็นพรีเมียม';

  @override
  String get premiumSubtitle => 'ปลดล็อกทุกฟีเจอร์';

  @override
  String get rateUs => 'ให้คะแนนเรา';

  @override
  String get rateSubtitle => 'ชอบแอปนี้ไหม? ให้เรา 5 ดาวนะ!';

  @override
  String get share => 'แชร์แอป';

  @override
  String get shareSubtitle => 'บอกเพื่อนๆ เกี่ยวกับ BeTaller';

  @override
  String get shareText =>
      'ฉันค้นพบศักยภาพการเติบโตของตัวเองด้วย BeTaller! ลองดูสิ: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'ส่งความคิดเห็น';

  @override
  String get feedbackSubtitle => 'ติดต่อเรา';

  @override
  String get resetData => 'รีเซ็ตข้อมูลทั้งหมด';

  @override
  String get resetSubtitle => 'ข้อมูลทั้งหมดจะถูกลบ';

  @override
  String get resetTitle => 'รีเซ็ตข้อมูล';

  @override
  String get resetMessage =>
      'ข้อมูลทั้งหมดจะถูกลบ และคุณจะกลับไปที่หน้าเริ่มต้นใช้งาน ย้อนกลับไม่ได้!';

  @override
  String get reset => 'รีเซ็ต';

  @override
  String get premiumSoon => 'พรีเมียมกำลังจะมาเร็วๆ นี้!';

  @override
  String get brandingSubtitle => 'ค้นพบศักยภาพการเติบโตของคุณ';

  @override
  String get statistics => 'สถิติ';

  @override
  String get profileGroupSupport => 'ช่วยเหลือ';

  @override
  String get profileGroupAccount => 'บัญชี';

  @override
  String get profileGroupApp => 'แอป';

  @override
  String get profileGroupDanger => 'โซนอันตราย';

  @override
  String profileMemberSince(String date) {
    return 'ตั้งแต่ $date';
  }

  @override
  String get profileYourJourney => 'เส้นทางของคุณ';

  @override
  String get profileTotalGrowth => 'รวม';

  @override
  String get currentStreak => 'ต่อเนื่องตอนนี้';

  @override
  String get bestStreakLabel => 'ต่อเนื่องสูงสุด';

  @override
  String get achievementLabel => 'ความสำเร็จ';

  @override
  String get achievements => 'ความสำเร็จ';

  @override
  String get achievementUnlockedTitle => '🏆 ปลดล็อกความสำเร็จแล้ว!';

  @override
  String get reminderTapHint => 'แตะเพื่อเปลี่ยนเวลาและวัน';

  @override
  String get earned => 'ได้รับแล้ว!';

  @override
  String get notEarned => 'ยังไม่ได้รับ';

  @override
  String get ok => 'ตกลง';

  @override
  String get language => 'ภาษา';

  @override
  String get languageSubtitle => 'เปลี่ยนภาษาของแอป';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'ค้นพบศักยภาพการเติบโตของคุณ';

  @override
  String get onboardingMeetYou => 'มาทำความรู้จักกัน';

  @override
  String get onboardingInfoNeeded => 'ข้อมูลพื้นฐานที่ใช้ในการวิเคราะห์';

  @override
  String get gender => 'เพศ';

  @override
  String get birthDateLabel => 'วันเกิด';

  @override
  String get bodyMeasurements => 'สัดส่วนร่างกาย';

  @override
  String get bodyInfo => 'ต้องใช้ส่วนสูงและน้ำหนักปัจจุบันของคุณในการวิเคราะห์';

  @override
  String get geneticData => 'ข้อมูลพันธุกรรม';

  @override
  String get geneticInfo => 'ส่วนสูงของพ่อแม่บอกศักยภาพทางพันธุกรรมของคุณ';

  @override
  String get pastHeights => 'ส่วนสูงในอดีต';

  @override
  String get pastHeightsInfo =>
      'ใส่ส่วนสูงที่คุณจำได้ในแต่ละช่วงอายุ เว้นว่างได้';

  @override
  String get heightHint => 'ใส่ส่วนสูง...';

  @override
  String get ageLabel => 'อายุ';

  @override
  String get habits => 'นิสัยของคุณ';

  @override
  String get habitsInfo => 'ไลฟ์สไตล์ของคุณมีผลโดยตรงต่อการคาดการณ์';

  @override
  String get weeklyExercise => 'ออกกำลังกายต่อสัปดาห์';

  @override
  String get dailySleep => 'การนอนต่อวัน';

  @override
  String get nutritionQuality => 'คุณภาพโภชนาการ';

  @override
  String get nutritionDesc => 'การกินโปรตีน นม ผัก ผลไม้';

  @override
  String get nutritionBad => 'แย่';

  @override
  String get nutritionPoor => 'ไม่ค่อยดี';

  @override
  String get nutritionMedium => 'ปานกลาง';

  @override
  String get nutritionGood => 'ดี';

  @override
  String get nutritionGreat => 'ดีมาก';

  @override
  String get startAnalysis => 'เริ่มวิเคราะห์';

  @override
  String get continueBtn => 'ต่อไป';

  @override
  String get analyzeBtn => 'วิเคราะห์';

  @override
  String get analyzing => 'กำลังวิเคราะห์';

  @override
  String get analysisComplete => 'เสร็จแล้ว!';

  @override
  String get analysisDataReceivedTitle => 'ได้รับข้อมูลแล้ว';

  @override
  String get analysisDataReceivedSubtitle => 'กำลังเริ่มวิเคราะห์...';

  @override
  String get yourScore => 'คะแนน BeTaller ของคุณ';

  @override
  String get letsStart => 'เริ่มกันเลย';

  @override
  String get splashJourneySubtitle => 'เส้นทางของคุณเริ่มแล้ว 🚀';

  @override
  String get splashPlanSubtitle =>
      'แผนเฉพาะสำหรับคุณพร้อมแล้ว\nพร้อมค้นพบศักยภาพส่วนสูงของคุณหรือยัง?';

  @override
  String get doneBtn => 'เสร็จ';

  @override
  String get analysisStep1 => 'กำลังวิเคราะห์ข้อมูลพันธุกรรม...';

  @override
  String get analysisStep2 => 'กำลังคำนวณความเร็วการเติบโต...';

  @override
  String get analysisStep3 => 'กำลังประมวลผลข้อมูลโภชนาการและการนอน...';

  @override
  String get analysisStep4 => 'กำลังสร้างการคาดการณ์ส่วนสูง...';

  @override
  String get analysisStep5 => 'กำลังคำนวณคะแนน BeTaller...';

  @override
  String growthPotential(String cm, String unit) {
    return 'ศักยภาพการเติบโต +$cm $unit';
  }

  @override
  String get heightAt21 => 'ตอนอายุ 21';

  @override
  String confidenceLevel(String pct) {
    return 'ความเชื่อมั่น $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'ช่วง $min - $max $unit';
  }

  @override
  String get currentLabel => 'ปัจจุบัน';

  @override
  String get predictedLabel => 'คาดการณ์';

  @override
  String get yearlyPredictions => 'คาดการณ์รายปี';

  @override
  String get tipMorningMeasure =>
      'วัดส่วนสูงตอนเช้า แรงกดบนหมอนรองกระดูกทำให้ตัวเตี้ยลงเล็กน้อยระหว่างวัน ค่าตอนเช้าจึงแม่นที่สุด';

  @override
  String get tipProteinSpread =>
      'กระจายโปรตีนให้ทั่วทุกมื้อ อย่ากินทีเดียวหมด ให้มีโปรตีนในทุกมื้อ';

  @override
  String get tipGrowthHormone =>
      'โกรทฮอร์โมนหลั่งสูงสุดตอนนอน ควรหลับอยู่ในช่วง 4 ทุ่ม-ตี 2!';

  @override
  String get tipVitaminD =>
      'รับแดดวันละ 15 นาทีช่วยเพิ่มการสร้างวิตามินดี ซึ่งจำเป็นต่อการดูดซึมแคลเซียม';

  @override
  String get tipBarHanging =>
      'การโหนบาร์ช่วยคลายแรงกดที่กระดูกสันหลัง ลองวันละ 3x30 วินาที';

  @override
  String get tipSwimming =>
      'ว่ายน้ำเป็นกีฬาที่ดีที่สุดสำหรับออกกำลังทั้งตัวและช่วยสนับสนุนการเพิ่มส่วนสูง';

  @override
  String get tipStress =>
      'ความเครียดกดการหลั่งโกรทฮอร์โมน ลดความเครียดด้วยการทำสมาธิและโยคะ';

  @override
  String get routineMorningStretch => 'ยืดเหยียดตอนเช้า';

  @override
  String get routineMorningStretchDesc =>
      'ยืดเหยียด 10 นาทีทันทีหลังตื่นนอน ยืดกระดูกสันหลังและกล้ามเนื้อขา';

  @override
  String get routineBarHanging => 'โหนบาร์';

  @override
  String get routineBarHangingDesc =>
      'โหนบาร์ดึงข้อเพื่อยืดกระดูกสันหลัง 3 เซ็ต x 30 วินาที';

  @override
  String get routineCobraStretch => 'ท่างูเห่า';

  @override
  String get routineCobraStretchDesc =>
      'นอนคว่ำแล้วยกลำตัวช่วงบนขึ้น ยืดกระดูกสันหลัง 3 เซ็ต x 15 วินาที';

  @override
  String get routineJumping => 'ท่ากระโดด';

  @override
  String get routineJumpingDesc =>
      'กระโดดเชือกหรือสควอตจัมป์ กระตุ้นแผ่นการเจริญเติบโต 3 เซ็ต x 20 ครั้ง';

  @override
  String get routineSwimming => 'ว่ายน้ำหรือบาสเกตบอล';

  @override
  String get routineSwimmingDesc =>
      'เล่นกีฬาที่ช่วยสนับสนุนการเพิ่มส่วนสูง อย่างน้อย 30 นาที';

  @override
  String get routineYoga => 'โยคะและยืดเหยียดตอนเย็น';

  @override
  String get routineYogaDesc =>
      'โยคะและยืดเหยียดก่อนนอน คลายเครียด ผ่อนคลายกล้ามเนื้อ';

  @override
  String get routineProtein => 'กินโปรตีน';

  @override
  String get routineProteinDesc =>
      'ไข่ ไก่ ปลา นม โปรตีนอย่างน้อย 1.5g/kg ต่อวัน';

  @override
  String get routineCalcium => 'แคลเซียมและวิตามินดี';

  @override
  String get routineCalciumDesc =>
      'กินนม ชีส โยเกิร์ต รับแดด 15 นาที สำคัญมากต่อการพัฒนากระดูก';

  @override
  String get routineWater => 'เป้าหมายการดื่มน้ำ';

  @override
  String get routineWaterDesc =>
      'ดื่มน้ำอย่างน้อยวันละ 2-3 ลิตร จำเป็นต่อการเผาผลาญและการเติบโต';

  @override
  String get routineAvoidJunk => 'เลี่ยงอาหารขยะ';

  @override
  String get routineAvoidJunkDesc =>
      'หลีกเลี่ยงฟาสต์ฟู้ด เครื่องดื่มหวาน และอาหารแปรรูป';

  @override
  String get routineSleep => 'นอนหลับให้ดี (8-10 ชม.)';

  @override
  String get routineSleepDesc =>
      'โกรทฮอร์โมนหลั่งระหว่างนอน ช่วง 4 ทุ่ม-6 โมงเช้าคือเวลาทอง';

  @override
  String get routineNoScreen => 'พักจอก่อนนอน';

  @override
  String get routineNoScreenDesc =>
      'วางมือถือและคอมพิวเตอร์ 1 ชั่วโมงก่อนนอน อย่าขัดขวางการสร้างเมลาโทนิน';

  @override
  String get routinePosture => 'เช็กท่าทาง';

  @override
  String get routinePostureDesc =>
      'หลังตรง ไหล่ผาย เช็กทุกชั่วโมง ท่าทางดี = ต่างกัน 2-3 cm';

  @override
  String get routineWallStand => 'ท่ายืนพิงผนัง';

  @override
  String get routineWallStandDesc =>
      'ยืนพิงผนังให้ส้นเท้า สะโพก ไหล่ และศีรษะแตะผนัง ค้างไว้ 5 นาที';

  @override
  String get routineSprintIntervals => 'วิ่งสปรินต์แบบอินเทอร์วัล';

  @override
  String get routineSprintIntervalsDesc =>
      'วิ่งสปรินต์สลับพัก กระตุ้นการหลั่งโกรทฮอร์โมนได้มากด้วยการออกแรงหนักเป็นช่วงๆ';

  @override
  String get routineHiitWorkout => 'เวิร์กเอาต์ HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'ฝึกแบบหนักสลับเบาเพื่อให้โกรทฮอร์โมนหลั่งได้มากที่สุด';

  @override
  String get routineSquats => 'สควอตน้ำหนักตัว';

  @override
  String get routineSquatsDesc =>
      'สควอตด้วยน้ำหนักตัวช่วยกระตุ้นแผ่นการเจริญเติบโตที่ขาและกระดูกสันหลัง';

  @override
  String get routineDeadliftStretch => 'ยืดท่าเดดลิฟต์';

  @override
  String get routineDeadliftStretchDesc =>
      'ยืดท่าเดดลิฟต์เพื่อคลายแรงกดกระดูกสันหลังและดูแลหมอนรองกระดูก';

  @override
  String get routineOverheadPress => 'ดันเหนือศีรษะ';

  @override
  String get routineOverheadPressDesc =>
      'การดันเหนือศีรษะช่วยยืดกระดูกสันหลังและเสริมกล้ามเนื้อที่ใช้ทรงตัว';

  @override
  String get routineSkippingRope => 'กระโดดเชือก';

  @override
  String get routineSkippingRopeDesc =>
      'การกระโดดเชือกซ้ำๆ ช่วยกระตุ้นแผ่นการเจริญเติบโตในช่วงขา';

  @override
  String get routinePilatesCore => 'พิลาทิสแกนกลางลำตัว';

  @override
  String get routinePilatesCoreDesc =>
      'พิลาทิสแกนกลางลำตัวช่วยจัดแนวกระดูกสันหลังและท่าทาง';

  @override
  String get routineInversionHang => 'ห้อยหัวกลับ';

  @override
  String get routineInversionHangDesc =>
      'การห้อยหัวกลับช่วยคลายแรงกดหมอนรองกระดูก อาจเพิ่มได้ 1-2cm ชั่วคราว';

  @override
  String get routineZincIntake => 'อาหารที่มีสังกะสีสูง';

  @override
  String get routineZincIntakeDesc =>
      'กินอาหารที่มีสังกะสีสูงตลอดวัน เพื่อช่วยการสร้างโกรทฮอร์โมน';

  @override
  String get routineVitaminDSunlight => 'วิตามินดีและแสงแดด';

  @override
  String get routineVitaminDSunlightDesc =>
      'รับแดดโดยตรงอย่างน้อย 15 นาที เพื่อสร้างวิตามินดีและช่วยการเติบโตของกระดูก';

  @override
  String get routineArginineFoods => 'อาหารที่มีอาร์จินีนสูง';

  @override
  String get routineArginineFoodsDesc =>
      'กินอาหารที่มีอาร์จินีนสูงเพื่อกระตุ้นการหลั่งโกรทฮอร์โมน';

  @override
  String get routineDailyCalories => 'เป้าหมายแคลอรี่ต่อวัน';

  @override
  String get routineDailyCaloriesDesc =>
      'กินให้ถึงเป้าแคลอรี่ต่อวัน กินน้อยเกินไปทำให้โตช้าลง';

  @override
  String get routineSleepEnvironment => 'จัดห้องนอนให้เหมาะ';

  @override
  String get routineSleepEnvironmentDesc =>
      'ทำห้องนอนให้มืดและเย็น เพื่อให้เมลาโทนินและโกรทฮอร์โมนหลั่งได้เต็มที่';

  @override
  String get routinePreSleepRoutine => 'ผ่อนคลายก่อนนอน';

  @override
  String get routinePreSleepRoutineDesc =>
      'กิจวัตรก่อนนอนที่สม่ำเสมอช่วยให้หลับลึกดีขึ้น 23%';

  @override
  String get routineNeckStretches => 'ยืดคอ';

  @override
  String get routineNeckStretchesDesc =>
      'การยืดคอช่วยคลายแรงกดและจัดแนวกระดูกคอให้ดีขึ้น';

  @override
  String get routineShoulderRolls => 'หมุนไหล่และเปิดไหล่';

  @override
  String get routineShoulderRollsDesc =>
      'การเปิดไหล่ช่วยแก้ท่าห่อไหล่ ทำให้ดูสูงขึ้นได้ 1-2cm';

  @override
  String get achieveCommitment => 'ความตั้งใจ';

  @override
  String get achieveCommitmentDesc =>
      'ใส่ข้อมูลให้ครบ สำรวจแอปให้ทั่ว แล้วเริ่มใช้งาน';

  @override
  String get achieveFirstDay => 'ก้าวแรก';

  @override
  String get achieveFirstDayDesc => 'ทำวันแรกให้สำเร็จ';

  @override
  String get achieveThreeStreak => 'ต่อเนื่อง 3 วัน';

  @override
  String get achieveThreeStreakDesc => 'ทำกิจวัตรติดกัน 3 วัน';

  @override
  String get achieveWeekStreak => 'ต่อเนื่อง 7 วัน';

  @override
  String get achieveWeekStreakDesc => 'ทำกิจวัตรติดกัน 7 วัน';

  @override
  String get achieveTwoWeekStreak => 'ต่อเนื่อง 14 วัน';

  @override
  String get achieveTwoWeekStreakDesc => 'ทำต่อเนื่อง 14 วันไม่มีหยุด';

  @override
  String get achieveMonthStreak => 'ต่อเนื่อง 30 วัน';

  @override
  String get achieveMonthStreakDesc => 'ทำครบติดกัน 30 วัน';

  @override
  String get achieveTwoMonthStreak => 'ต่อเนื่อง 60 วัน';

  @override
  String get achieveTwoMonthStreakDesc => 'ทำครบติดกัน 60 วัน';

  @override
  String get achieveHundredStreak => 'ต่อเนื่อง 100 วัน';

  @override
  String get achieveHundredStreakDesc => 'ทำครบติดกัน 100 วัน';

  @override
  String get achieveFirstMeasure => 'การวัดครั้งแรก';

  @override
  String get achieveFirstMeasureDesc => 'บันทึกการวัดส่วนสูงครั้งแรก';

  @override
  String get achieveThreeMeasures => 'นักติดตาม';

  @override
  String get achieveThreeMeasuresDesc => 'บันทึกการวัดส่วนสูง 3 ครั้ง';

  @override
  String get achieveFiveMeasures => 'ติดตามสม่ำเสมอ';

  @override
  String get achieveFiveMeasuresDesc => 'บันทึกการวัดส่วนสูง 5 ครั้ง';

  @override
  String get achieveTenMeasures => 'นักล่าข้อมูล';

  @override
  String get achieveTenMeasuresDesc => 'บันทึกการวัดส่วนสูง 10 ครั้ง';

  @override
  String get achieveFirstCm => 'เซนติเมตรแรก';

  @override
  String get achieveFirstCmDesc => 'บันทึกการเติบโตรวม 1 cm';

  @override
  String get achieveThreeCm => 'โตขึ้น 3 cm';

  @override
  String get achieveThreeCmDesc => 'บันทึกการเติบโตรวม 3 cm';

  @override
  String get achieveFiveCm => 'โตขึ้น 5 cm';

  @override
  String get achieveFiveCmDesc => 'บันทึกการเติบโตรวม 5 cm';

  @override
  String get achieveTenCm => 'โตขึ้น 10 cm';

  @override
  String get achieveTenCmDesc => 'บันทึกการเติบโตรวม 10 cm';

  @override
  String get quote1 => 'ทำให้ดีกว่าเมื่อวาน ทุกๆ วัน';

  @override
  String get quote2 => 'การเติบโตไม่ได้เกิดข้ามคืน แต่ทุกคืนพาคุณเข้าใกล้ขึ้น';

  @override
  String get quote3 => 'การเติบโตต้องใช้ความอดทน ทำต่อไปนะ!';

  @override
  String get quote4 => 'ก้าวที่คุณเดินวันนี้ คือรากฐานของวันพรุ่งนี้';

  @override
  String get quote5 => 'วินัยเริ่มต้นตรงที่แรงจูงใจหมดลง';

  @override
  String get quote6 => 'ร่างกายจะขอบคุณคุณ ทำต่อไปนะ!';

  @override
  String get quote7 => 'ขีดจำกัดของศักยภาพ คุณเป็นคนกำหนดเอง';

  @override
  String get quote8 => 'ก้าวเล็กๆ สร้างการเปลี่ยนแปลงที่ยิ่งใหญ่';

  @override
  String get quote9 => 'การลงทุนที่ดีที่สุดคือการลงทุนกับตัวเอง';

  @override
  String get quote10 => 'คุณเข้าใกล้เป้าหมายมากขึ้นทุกวัน';

  @override
  String get quote11 => 'การเปลี่ยนแปลงว่ายากแล้ว แต่ความเสียใจยากกว่า';

  @override
  String get quote12 => 'ร่างกายคือสิ่งล้ำค่า ดูแลมันให้ดี';

  @override
  String get quote13 => 'คู่แข่งของคุณคือตัวคุณเมื่อวาน เอาชนะให้ได้วันนี้!';

  @override
  String get quote14 => 'BeTaller = ความอดทน + วินัย + ความเชื่อมั่น';

  @override
  String get quote15 => 'เชื่อในตัวเอง แล้วกระบวนการจะหล่อหลอมคุณเอง';

  @override
  String get quote16 => 'วันนี้อย่าพูดว่าทำไม่ได้ พรุ่งนี้จะได้ไม่เสียใจ';

  @override
  String get quote17 => 'พัฒนาให้ได้ทุกวัน แม้แค่ 1% ก็ตาม';

  @override
  String get quote18 => 'กระจกจะบอกความคืบหน้าของคุณเอง อดทนไว้';

  @override
  String get bmiNormal => 'ปกติ';

  @override
  String get bmiUnderweight => 'น้ำหนักน้อย';

  @override
  String get bmiOverweight => 'น้ำหนักเกิน';

  @override
  String get bmiObese => 'อ้วน';

  @override
  String get velocityExcellent => 'ยอดเยี่ยม';

  @override
  String get velocityNormal => 'ปกติ';

  @override
  String get velocitySlow => 'ช้า';

  @override
  String get velocityVeryLow => 'ต่ำมาก';

  @override
  String durationMinutes(String min) {
    return '$min นาที';
  }

  @override
  String get durationAllDay => 'ทั้งวัน';

  @override
  String get durationNight => 'กลางคืน';

  @override
  String durationHours(String hours) {
    return '$hours ชั่วโมง';
  }

  @override
  String get onboardingStep1 => 'ใส่ข้อมูลส่วนตัวของคุณ';

  @override
  String get onboardingStep2 => 'บอกส่วนสูงในอดีตของคุณ';

  @override
  String get onboardingStep3 => 'ประเมินนิสัยของคุณ';

  @override
  String get onboardingStep4 => 'ดูการคาดการณ์และคะแนนของคุณ';

  @override
  String get hoursShort => 'ชม.';

  @override
  String get selectLanguage => 'เลือกภาษา';

  @override
  String get systemLanguage => 'ภาษาของระบบ';

  @override
  String get emailSubject => 'ความคิดเห็นเกี่ยวกับ BeTaller';

  @override
  String get pastHeightsTip =>
      'อายุที่ไม่รู้ส่วนสูงเว้นว่างได้ ใส่ส่วนสูงในอดีตแค่ 1-2 ค่าก็พอ';

  @override
  String get obPastHeightsTitle => 'ส่วนสูงในอดีต';

  @override
  String get obPastHeightsSubPart1 =>
      'ส่วนสูงในอดีตช่วยให้การคาดการณ์แม่นยำขึ้น';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'ตอนอายุ $age คุณสูงเท่าไร?';
  }

  @override
  String get obSkip => 'ข้าม';

  @override
  String get obNext => 'ถัดไป';

  @override
  String get obSkipAll => 'ข้ามทั้งหมด';

  @override
  String get currentSuffix => '(ปัจจุบัน)';

  @override
  String personalizedProtein(String amount) {
    return 'ไข่ ไก่ ปลา นม กินโปรตีนอย่างน้อย ${amount}g ต่อวัน';
  }

  @override
  String personalizedWater(String amount) {
    return 'ดื่มน้ำอย่างน้อย ${amount}L ต่อวัน จำเป็นต่อการเผาผลาญและการเติบโต';
  }

  @override
  String personalizedSleep(String hours) {
    return 'โกรทฮอร์โมนหลั่งระหว่างนอน นอนอย่างน้อย $hours ชั่วโมง ช่วง 4 ทุ่ม-6 โมงเช้าคือเวลาทอง';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'กินนม ชีส โยเกิร์ต รับแดด 15 นาที เป้าแคลอรี่ต่อวัน: $calories kcal';
  }

  @override
  String get scoreS => 'ยอดเยี่ยม! คุณกำลังไปถึงจุดสูงสุดของศักยภาพ';

  @override
  String get scoreA => 'ไปได้สวย! ปรับอีกนิดก็ขึ้นไปอยู่บนสุดได้';

  @override
  String get scoreB => 'มาถูกทางแล้ว ใส่ใจกิจวัตรและโภชนาการเพิ่มอีกหน่อย';

  @override
  String get scoreC => 'ยังพัฒนาได้อีก กิจวัตรที่สม่ำเสมอจะสร้างความแตกต่าง';

  @override
  String get scoreD => 'ศักยภาพสูง แต่คุณต้องลงมือทำ';

  @override
  String get scoreF => 'เริ่มเลยตอนนี้! ก้าวเล็กๆ ทุกวันสร้างความแตกต่างได้มาก';

  @override
  String get cmPerYear => 'cm/ปี';

  @override
  String get howToDoIt => 'วิธีทำ';

  @override
  String get musclesTargeted => 'กล้ามเนื้อและกระดูกที่ได้ผล';

  @override
  String get scientificBasis => 'หลักฐานทางวิทยาศาสตร์';

  @override
  String setXofY(String current, String total) {
    return 'เซ็ต $current จาก $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'พักก่อนเซ็ต $set';
  }

  @override
  String get allSetsComplete => 'ครบทุกเซ็ตแล้ว!';

  @override
  String get setTimer => 'จับเวลาเซ็ต';

  @override
  String get setTracker => 'นับเซ็ต';

  @override
  String get builtInTimer => 'ตัวจับเวลาในตัว';

  @override
  String get markComplete => 'ทำเครื่องหมายว่าเสร็จ';

  @override
  String get markIncomplete => 'ทำเครื่องหมายว่ายังไม่เสร็จ';

  @override
  String get done => 'เสร็จ';

  @override
  String get doneExclamation => 'เสร็จแล้ว!';

  @override
  String get start => 'เริ่ม';

  @override
  String get pause => 'หยุดชั่วคราว';

  @override
  String get resetTimer => 'รีเซ็ต';

  @override
  String get skipRest => 'ข้ามการพัก';

  @override
  String get restart => 'เริ่มใหม่';

  @override
  String get perSet => 'ต่อเซ็ต';

  @override
  String get rest => 'พัก';

  @override
  String get reps => 'ครั้ง';

  @override
  String get difficultyBeginner => 'มือใหม่';

  @override
  String get difficultyIntermediate => 'ระดับกลาง';

  @override
  String get difficultyAdvanced => 'ระดับสูง';

  @override
  String get learnTitle => 'เรียนรู้';

  @override
  String get learnSubtitle => 'ความรู้เรื่องการเติบโตที่มีงานวิจัยรองรับ';

  @override
  String get categoryAll => 'ทั้งหมด';

  @override
  String get categoryScience => 'วิทยาศาสตร์';

  @override
  String get categoryNutrition => 'โภชนาการ';

  @override
  String get categoryExercise => 'ออกกำลังกาย';

  @override
  String get categorySleep => 'การนอน';

  @override
  String get categoryMyths => 'ความเชื่อผิดๆ';

  @override
  String get scientificReferences => 'แหล่งอ้างอิงทางวิทยาศาสตร์';

  @override
  String get relatedRoutines => 'กิจวัตรที่เกี่ยวข้อง';

  @override
  String get nutritionTitle => 'โภชนาการ';

  @override
  String get sectionMealPlan => 'แผนมื้ออาหาร';

  @override
  String get sectionNutrients => 'สารอาหาร';

  @override
  String get sectionFoods => 'อาหาร';

  @override
  String get sectionSupplements => 'อาหารเสริม';

  @override
  String todaysPlan(String day) {
    return 'แผนวันนี้ — $day';
  }

  @override
  String get breakfast => 'มื้อเช้า';

  @override
  String get lunch => 'มื้อกลางวัน';

  @override
  String get dinner => 'มื้อเย็น';

  @override
  String get snacks => 'ของว่าง';

  @override
  String get searchFoods => 'ค้นหาอาหาร...';

  @override
  String nFoods(String count) {
    return '$count รายการ';
  }

  @override
  String dailyLabel(String amount) {
    return 'ต่อวัน: $amount';
  }

  @override
  String get dailyNeedByAge => 'ความต้องการต่อวันตามอายุ';

  @override
  String agePrefix(String range) {
    return 'อายุ $range';
  }

  @override
  String get topFoodSources => 'แหล่งอาหารที่ดีที่สุด';

  @override
  String get categoryDairy => 'นมและผลิตภัณฑ์นม';

  @override
  String get categoryMeatFish => 'เนื้อสัตว์และปลา';

  @override
  String get categoryVegetables => 'ผัก';

  @override
  String get categoryFruits => 'ผลไม้';

  @override
  String get categoryGrains => 'ธัญพืชและถั่ว';

  @override
  String get categoryNutsSeeds => 'ถั่วเปลือกแข็งและเมล็ดพืช';

  @override
  String get weeklyReportTitle => 'รายงานประจำสัปดาห์';

  @override
  String get weeklyScoreLabel => 'คะแนนสัปดาห์';

  @override
  String get weeklyDailyCompletion => 'รายวัน';

  @override
  String get weeklyHabits => 'นิสัย';

  @override
  String get overview => 'ภาพรวม';

  @override
  String get routinesLabel => 'กิจวัตร';

  @override
  String get streakLabel => 'ความต่อเนื่อง';

  @override
  String get heightLabel => 'ส่วนสูง';

  @override
  String get weightLabel => 'น้ำหนัก';

  @override
  String get dadLabel => 'พ่อ';

  @override
  String get motherLabel => 'แม่';

  @override
  String get metricShort => 'เมตริก';

  @override
  String get imperialShort => 'อิมพีเรียล';

  @override
  String get dailyScores => 'คะแนนรายวัน';

  @override
  String get waterToday2 => 'น้ำวันนี้';

  @override
  String get sleepToday => 'การนอนวันนี้';

  @override
  String get routineCompletion => 'ทำกิจวัตรสำเร็จ';

  @override
  String get xpAndLevel => 'XP และเลเวล';

  @override
  String xpToNextLevel(String xp) {
    return 'อีก $xp XP ถึงเลเวลถัดไป';
  }

  @override
  String get activeChallenges => 'ชาเลนจ์ที่กำลังทำ';

  @override
  String nOfMCompleted(String n, String m) {
    return 'สำเร็จ $n/$m';
  }

  @override
  String get shareYourProgress => 'แชร์ความคืบหน้าของคุณ';

  @override
  String get shareComingSoon => 'ฟีเจอร์แชร์กำลังจะมาเร็วๆ นี้!';

  @override
  String get premiumTest => 'พรีเมียม (ทดสอบ)';

  @override
  String get premiumActive => 'ใช้งานอยู่';

  @override
  String get premiumFree => 'ฟรี';

  @override
  String get weeklyReportMenu => 'รายงานประจำสัปดาห์';

  @override
  String get weeklyReportMenuSubtitle => 'สรุปความคืบหน้าของคุณ';

  @override
  String get unlockGrowthPotential => 'ปลดล็อกศักยภาพการเติบโตเต็มที่ของคุณ';

  @override
  String get featureGrowthAnalysis => 'วิเคราะห์การเติบโตและคะแนน';

  @override
  String get featureHeightPrediction => 'คาดการณ์ส่วนสูงล่วงหน้า';

  @override
  String get featureAllRoutines => 'กิจวัตรประจำวันครบทั้ง 14 อย่าง';

  @override
  String get featureWaterSleep => 'ติดตามการดื่มน้ำและการนอน';

  @override
  String get featureProgress => 'ความคืบหน้าและการวัด';

  @override
  String get featureAchievements => 'ความสำเร็จและความต่อเนื่อง';

  @override
  String get planMonthly => 'รายเดือน';

  @override
  String get planYearly => 'รายปี';

  @override
  String get bestValue => 'คุ้มที่สุด';

  @override
  String get premiumLabel => 'พรีเมียม';

  @override
  String lvl(String level) {
    return 'LV $level';
  }

  @override
  String get levelBeginner => 'มือใหม่';

  @override
  String get levelStarter => 'เริ่มต้น';

  @override
  String get levelCommitted => 'ตั้งใจ';

  @override
  String get levelDedicated => 'ทุ่มเท';

  @override
  String get levelConsistent => 'สม่ำเสมอ';

  @override
  String get levelFocused => 'มีโฟกัส';

  @override
  String get levelDetermined => 'มุ่งมั่น';

  @override
  String get levelDisciplined => 'มีวินัย';

  @override
  String get levelStrong => 'แข็งแกร่ง';

  @override
  String get levelAdvanced => 'ขั้นสูง';

  @override
  String get levelExpert => 'ผู้เชี่ยวชาญ';

  @override
  String get levelMaster => 'มาสเตอร์';

  @override
  String get levelElite => 'ระดับหัวกะทิ';

  @override
  String get levelChampion => 'แชมป์';

  @override
  String get levelLegend => 'ตำนาน';

  @override
  String get levelTitan => 'ไททัน';

  @override
  String get levelMythic => 'เหนือตำนาน';

  @override
  String get levelImmortal => 'อมตะ';

  @override
  String get levelTranscendent => 'เหนือขีดจำกัด';

  @override
  String get levelUltimate => 'สุดยอด';

  @override
  String get challengeCompleteAllRoutines => 'ทำกิจวัตรให้ครบ';

  @override
  String get challengeCompleteAllRoutinesDesc => 'ทำทุกกิจวัตรให้เสร็จวันนี้';

  @override
  String get challengeHydrationHero => 'ฮีโร่ดื่มน้ำ';

  @override
  String get challengeHydrationHeroDesc => 'ดื่มน้ำให้ถึงเป้าวันนี้';

  @override
  String get challengeEarlySleeper => 'นอนเร็ว';

  @override
  String get challengeEarlySleeperDesc => 'บันทึกการนอน 8 ชั่วโมงขึ้นไป';

  @override
  String get challengeExerciseTrio => 'ออกกำลังสามอย่าง';

  @override
  String get challengeExerciseTrioDesc => 'ทำกิจวัตรออกกำลังกาย 3 อย่าง';

  @override
  String get challengeMorningStretch => 'ยืดเหยียดตอนเช้า';

  @override
  String get challengeMorningStretchDesc => 'ยืดเหยียดตอนเช้าก่อน 9 โมง';

  @override
  String get challenge7DayWarrior => 'นักสู้ 7 วัน';

  @override
  String get challenge7DayWarriorDesc => 'ทำกิจวัตรครบทุกอย่างติดกัน 7 วัน';

  @override
  String get challengeGrowthTracker => 'นักติดตามการเติบโต';

  @override
  String get challengeGrowthTrackerDesc => 'บันทึกการวัดส่วนสูงในสัปดาห์นี้';

  @override
  String get challengeHydrationWeek => 'สัปดาห์ดื่มน้ำ';

  @override
  String get challengeHydrationWeekDesc => 'ดื่มน้ำถึงเป้า 5 วันในสัปดาห์นี้';

  @override
  String get challengeFitnessChampion => 'แชมป์ฟิตเนส';

  @override
  String get challengeFitnessChampionDesc =>
      'ทำกิจวัตรออกกำลังกาย 15 ครั้งในสัปดาห์นี้';

  @override
  String get challengeSleepMaster => 'มาสเตอร์การนอน';

  @override
  String get challengeSleepMasterDesc => 'บันทึกการนอน 8 ชั่วโมงขึ้นไป 5 วัน';

  @override
  String get performanceDashboard => 'แดชบอร์ดผลงาน';

  @override
  String get tierA => 'ระดับ A';

  @override
  String get tierB => 'ระดับ B';

  @override
  String get tierC => 'ระดับ C';

  @override
  String get tierD => 'ระดับ D';

  @override
  String get tierE => 'ระดับ E';

  @override
  String get maxTierReached => 'ถึงระดับสูงสุดแล้ว';

  @override
  String nextTierHint(String tier, String pts) {
    return 'ระดับถัดไป: $tier · ต้องการอีก +$pts คะแนน';
  }

  @override
  String get premiumBadge => 'พรีเมียม';

  @override
  String get manageRoutines => 'จัดการกิจวัตร';

  @override
  String get manageRoutinesSubtitle => 'แสดงหรือซ่อนกิจวัตรในรายการประจำวัน';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return 'เปิดใช้ $visible จาก $total';
  }

  @override
  String get showAll => 'แสดงทั้งหมด';

  @override
  String get hideAll => 'ซ่อนทั้งหมด';

  @override
  String get heightAnalysis => 'วิเคราะห์ส่วนสูง';

  @override
  String get heightVsPopulation => 'ตำแหน่งของคุณบนกราฟการเติบโต CDC';

  @override
  String get globalAveragesTable => 'ส่วนสูงเฉลี่ยตามอายุ (CDC)';

  @override
  String get standingTall => 'สูงโดดเด่น';

  @override
  String get standingAboveAverage => 'สูงกว่าค่าเฉลี่ย';

  @override
  String get standingBelowAverage => 'ต่ำกว่าค่าเฉลี่ย';

  @override
  String get standingShort => 'เตี้ยกว่าเพื่อนวัยเดียวกัน';

  @override
  String get yourHeightStanding => 'ตำแหน่งส่วนสูงของคุณ';

  @override
  String get bellCurveCaption => 'ส่วนสูงของคนวัยเดียวกับคุณกระจายตัวอย่างไร';

  @override
  String get bellShorterThanYou => 'เตี้ยกว่าคุณ';

  @override
  String get yourHeight => 'คุณ';

  @override
  String peerAvg(int age) {
    return 'เฉลี่ยอายุ $age';
  }

  @override
  String get aboveAvg => 'สูงกว่าเฉลี่ย';

  @override
  String get belowAvg => 'ต่ำกว่าเฉลี่ย';

  @override
  String get whoDataSource => 'กราฟการเติบโต CDC สหรัฐฯ';

  @override
  String get percentileShort5 => 'ที่ 5';

  @override
  String get percentileShort50 => 'ที่ 50';

  @override
  String get percentileShort95 => 'ที่ 95';

  @override
  String get youLabel => 'คุณ';

  @override
  String get avgHeightLabel => 'เฉลี่ย';

  @override
  String get percentileLabel => 'เปอร์เซ็นไทล์';

  @override
  String get diffLabel => 'ต่าง';

  @override
  String get whoSourceNote =>
      'แหล่งข้อมูล: กราฟการเติบโต CDC ปี 2000 ของสหรัฐฯ (ส่วนสูงตามอายุ 2 ถึง 20 ปี) เปอร์เซ็นไทล์เทียบคุณกับประชากรสหรัฐฯ และอาจต่างกันในแต่ละประเทศ';

  @override
  String get quickPhotos => 'รูปภาพ';

  @override
  String get quickPosture => 'ท่าทาง';

  @override
  String get quickWellness => 'สุขภาวะ';

  @override
  String get quickRecipes => 'สูตรอาหาร';

  @override
  String get wellnessTitle => 'ติดตามสุขภาวะ';

  @override
  String get wellnessHeader => 'สุขภาวะ';

  @override
  String get wellnessSubtitle => 'ติดตามปัจจัยที่มีผลต่อการเติบโตของคุณ';

  @override
  String get caffeineToday => 'คาเฟอีนวันนี้';

  @override
  String get withinLimits => 'อยู่ในเกณฑ์ที่ดีต่อสุขภาพ';

  @override
  String get approachingLimit => 'ใกล้ถึงขีดจำกัด';

  @override
  String get overLimit => 'เกินขีดจำกัด มีผลต่อ HGH';

  @override
  String get resetToday => 'รีเซ็ตวันนี้';

  @override
  String get stressToday => 'ความเครียดวันนี้';

  @override
  String get stressVeryCalmLabel => 'สงบมาก เหมาะกับการเติบโตที่สุด';

  @override
  String get stressCalmLabel => 'สงบ';

  @override
  String get stressNeutralLabel => 'เฉยๆ';

  @override
  String get stressStressedLabel => 'เครียด';

  @override
  String get stressVeryStressedLabel => 'เครียดมาก คอร์ติซอลขัดขวาง HGH';

  @override
  String get stressTapToLog => 'แตะเพื่อบันทึกความรู้สึกวันนี้';

  @override
  String get todaysJournal => 'บันทึกวันนี้';

  @override
  String get journalNoNote => '(ไม่มีโน้ต)';

  @override
  String get journalEdit => 'แก้ไข';

  @override
  String get journalHowWasToday => 'วันนี้เป็นยังไงบ้าง?';

  @override
  String get journalSaved => 'บันทึกแล้ว · +5 XP';

  @override
  String get journalSaveEntry => 'บันทึก';

  @override
  String get weeklyInsight => 'ข้อสังเกตประจำสัปดาห์';

  @override
  String get weeklyInsightCaffeine => 'คาเฟอีน';

  @override
  String get weeklyInsightStress => 'ความเครียด';

  @override
  String get weeklyInsightMood => 'อารมณ์';

  @override
  String get wellnessInfoTitle => 'ทำไมสุขภาวะถึงสำคัญ';

  @override
  String get wellnessInfoBody =>
      'คาเฟอีนรบกวนการหลับลึก ซึ่งเป็นช่วงที่โกรทฮอร์โมน (HGH) หลั่งออกมามากที่สุด ความเครียดเรื้อรังทำให้คอร์ติซอลสูงขึ้น ซึ่งกด HGH โดยตรง การเขียนบันทึกช่วยให้คุณทำนิสัยที่ดีต่อการเติบโตได้สม่ำเสมอ';

  @override
  String get wellnessInfoGotIt => 'เข้าใจแล้ว';

  @override
  String get insightCaffeineHigh =>
      'สัปดาห์นี้คุณได้คาเฟอีนเยอะ ลองลดลงเพื่อการนอนและ HGH ที่ดีขึ้น';

  @override
  String get insightStressHigh =>
      'สัปดาห์นี้ความเครียดสูง ลองฝึกหายใจดู: คอร์ติซอลขัดขวางการเติบโต';

  @override
  String get insightMoodLow =>
      'ช่วงนี้อารมณ์ไม่ค่อยดี แสงแดด การนอน และการออกกำลังเบาๆ ช่วยได้ทั้งหมด';

  @override
  String get insightGreat =>
      'สัปดาห์นี้สมดุลดีมาก สุขภาวะของคุณช่วยให้เติบโตได้เต็มที่';

  @override
  String get insightDefault =>
      'สุขภาวะของคุณอยู่ในเกณฑ์ดี บันทึกต่อไปเพื่อดูข้อมูลเชิงลึกเพิ่ม';

  @override
  String get insightNeedMoreData => 'บันทึกอีกสักสองสามวันเพื่อดูข้อสังเกต';

  @override
  String get progressPhotosTitle => 'รูปความคืบหน้า';

  @override
  String get progressPhotosHeader => 'รูปความคืบหน้า';

  @override
  String get progressPhotosSubtitle => 'ติดตามความเปลี่ยนแปลงด้วยภาพ';

  @override
  String get addProgressPhoto => 'เพิ่มรูปความคืบหน้า';

  @override
  String get captureJourney => 'เก็บภาพเส้นทางของคุณ';

  @override
  String get takePhoto => 'ถ่ายรูป';

  @override
  String get chooseFromLibrary => 'เลือกจากคลังภาพ';

  @override
  String get deletePhotoTitle => 'ลบรูปนี้?';

  @override
  String get deletePhotoBody => 'รูปนี้จะถูกลบออกจากไทม์ไลน์ความคืบหน้าของคุณ';

  @override
  String get timelineTab => 'ไทม์ไลน์';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'รูป',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit ใน $days วัน';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'วัน',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit ที่เพิ่มขึ้น';
  }

  @override
  String get firstPhotoMessage =>
      'ถ่ายรูปแรกเพื่อเริ่มติดตามความคืบหน้าด้วยภาพ';

  @override
  String get takeFirstPhoto => 'ถ่ายรูปแรก';

  @override
  String get beforeAfter => 'ก่อน / หลัง';

  @override
  String get beforeLabel => 'ก่อน';

  @override
  String get afterLabel => 'หลัง';

  @override
  String get yourHeightDialog => 'ส่วนสูงของคุณ';

  @override
  String get heightDialogMessage => 'ใส่ส่วนสูงปัจจุบันของคุณสำหรับรูปนี้';

  @override
  String get postureAnalysisTitle => 'วิเคราะห์ท่าทาง';

  @override
  String get postureCoachHeader => 'โค้ชท่าทาง';

  @override
  String get postureCoachSubtitle => 'เช็กด้วยตัวเองจากรูปด้านข้าง';

  @override
  String get latestScore => 'คะแนนล่าสุด';

  @override
  String get latestAnalysis => 'การวิเคราะห์ล่าสุด';

  @override
  String get headPosition => 'ตำแหน่งศีรษะ';

  @override
  String get progressLabel => 'ความคืบหน้า';

  @override
  String get choosePhotoSource => 'เลือกแหล่งรูปภาพ';

  @override
  String get sideProfileHint => 'ถ่ายด้านข้าง ให้เห็นเต็มตัวในเฟรม';

  @override
  String get howToTakePhoto => 'วิธีถ่ายรูป';

  @override
  String get takePosturePhoto => 'ถ่ายรูปท่าทาง';

  @override
  String get postureExcellent => 'ยอดเยี่ยม';

  @override
  String get postureGood => 'ดี';

  @override
  String get postureNeedsWork => 'ต้องปรับปรุง';

  @override
  String get posturePoor => 'แย่';

  @override
  String get recommendedExercises => 'ท่าออกกำลังที่แนะนำ';

  @override
  String get postureWallStand => 'ยืนพิงผนัง';

  @override
  String get postureWallStandDesc => 'ยืนให้หลังแนบผนังวันละ 2 นาที';

  @override
  String get postureChestOpener => 'เปิดอก';

  @override
  String get postureChestOpenerDesc => 'คลายกล้ามอกที่ตึงซึ่งดึงไหล่ไปข้างหน้า';

  @override
  String get postureChinTucks => 'เก็บคาง';

  @override
  String get postureChinTucksDesc => 'แก้ท่าคอยื่น — 3×10 ครั้ง';

  @override
  String get postureDeadbug => 'เดดบัก';

  @override
  String get postureDeadbugDesc =>
      'เสริมแกนกลางลำตัวชั้นลึกเพื่อควบคุมหลังแอ่น';

  @override
  String get recipesTitle => 'สูตรอาหาร';

  @override
  String get recipesHeader => 'สูตรอาหาร';

  @override
  String get recipesSubtitle => 'เติมพลังให้การเติบโต';

  @override
  String get recipesCategoryAll => 'ทั้งหมด';

  @override
  String get recipesCategoryBreakfast => 'มื้อเช้า';

  @override
  String get recipesCategoryLunch => 'มื้อกลางวัน';

  @override
  String get recipesCategoryDinner => 'มื้อเย็น';

  @override
  String get recipesCategorySnack => 'ของว่าง';

  @override
  String get recipesGoalAll => 'ทั้งหมด';

  @override
  String get recipeDiffEasy => 'ง่าย';

  @override
  String get recipeDiffMedium => 'ปานกลาง';

  @override
  String get recipeDiffHard => 'ยาก';

  @override
  String get recipesFilterType => 'ประเภท';

  @override
  String get recipesFilterNutrient => 'อุดมด้วย';

  @override
  String get recipesGoalVitaminD => 'วิตามินดี';

  @override
  String get recipesGoalZinc => 'สังกะสี';

  @override
  String get recipesGoalMagnesium => 'แมกนีเซียม';

  @override
  String recipesCountLabel(int count) {
    return '$count สูตร';
  }

  @override
  String get recipeIngredients => 'วัตถุดิบ';

  @override
  String get recipeSteps => 'วิธีทำ';

  @override
  String get recipesGoalProtein => 'โปรตีนสูง';

  @override
  String get recipesGoalCalcium => 'แคลเซียม';

  @override
  String get recipesGoalOmega3 => 'โอเมก้า-3';

  @override
  String get recipesGoalIron => 'ธาตุเหล็ก';

  @override
  String get recipesNoMatch => 'ไม่มีสูตรที่ตรงกับตัวกรองนี้';

  @override
  String get recipesIngredients => 'วัตถุดิบ';

  @override
  String get recipesInstructions => 'วิธีทำ';

  @override
  String get recipesClose => 'ปิด';

  @override
  String get recipesAboutTitle => 'เกี่ยวกับสูตรอาหาร';

  @override
  String get recipesAboutBody =>
      'สูตรอาหารคัดสรรที่ออกแบบมาเพื่อเติมพลังให้การเติบโต กรองตามมื้อหรือเป้าหมายด้านโภชนาการเพื่อหาสูตรที่เข้ากับแผนของคุณ';

  @override
  String get animHintSpinalDecomp => 'คลายแรงกดกระดูกสันหลัง';

  @override
  String get animHintGravityReversal => 'กลับทิศแรงโน้มถ่วง';

  @override
  String get animHintImpactBones => 'แรงกระแทกเสริมกระดูก';

  @override
  String get animHintHighImpact => 'แรงกระแทกสูงเสริมกระดูก';

  @override
  String get animHintMetabolicBurst => 'ฝึกเร่งการเผาผลาญ';

  @override
  String get animHintFullBodyStretch => 'ยืดปลุกร่างกายทั้งตัว';

  @override
  String get animHintSpinalExtension => 'เหยียดกระดูกสันหลัง';

  @override
  String get animHintCervicalDecomp => 'คลายแรงกดกระดูกคอ';

  @override
  String get animHintShoulderMobility => 'เพิ่มความคล่องตัวของไหล่';

  @override
  String get animHintFullBodyMotion => 'เคลื่อนไหวทั้งตัว';

  @override
  String get animHintPosteriorChain => 'ยืดกล้ามเนื้อด้านหลัง';

  @override
  String get animHintMuscleGrowth => 'เชื้อเพลิงสร้างกล้ามเนื้อ';

  @override
  String get animHintBoneDensity => 'ช่วยความหนาแน่นกระดูก';

  @override
  String get animHintSpinalDisc => 'ให้น้ำหมอนรองกระดูก';

  @override
  String get animHintCleanNutrition => 'กินคลีน';

  @override
  String get animHintIgf1 => 'เพิ่มประสิทธิภาพ IGF-1';

  @override
  String get animHintHghAmino => 'กรดอะมิโนตั้งต้นของ HGH';

  @override
  String get animHintCalciumAbsorption => 'การดูดซึมแคลเซียม';

  @override
  String get animHintSpinalAlignment => 'จัดแนวกระดูกสันหลัง';

  @override
  String get animHintPostureCorrection => 'แก้ท่าทาง';

  @override
  String get animHintMindBody => 'สมดุลกายและใจ';

  @override
  String get animHintCoreStability => 'ความมั่นคงของแกนกลางลำตัว';

  @override
  String get animHintLegPower => 'พลังขาและกระตุ้น HGH';

  @override
  String get animHintVerticalPower => 'พลังกระโดดแนวดิ่ง';

  @override
  String get animHintHghSurge => 'ฝึกกระตุ้น HGH';

  @override
  String get animHintPeakHgh => 'ช่วงที่ HGH หลั่งสูงสุด';

  @override
  String get animHintMelatonin => 'เพิ่มประสิทธิภาพเมลาโทนิน';

  @override
  String get animHintDeepSleep => 'เตรียมพร้อมหลับลึก';

  @override
  String get animHintSleepOpt => 'ปรับการนอนให้ดีที่สุด';

  @override
  String get animHintExercise => 'ออกกำลังกาย';

  @override
  String get formMorningStretch =>
      'เริ่มจากหมุนคอ แล้วต่อด้วยยืดเหยียดทั้งตัว ค้างแต่ละท่า 20-30 วินาทีโดยไม่เด้ง';

  @override
  String get formBarHanging =>
      'จับบาร์กว้างเท่าไหล่ ผ่อนคลายร่างกายทั้งหมด ปล่อยให้แรงโน้มถ่วงยืดกระดูกสันหลัง อย่าแกว่งตัว';

  @override
  String get formCobraStretch =>
      'นอนคว่ำ วางมือใต้ไหล่ ค่อยๆ ดันลำตัวช่วงบนขึ้นโดยให้สะโพกติดพื้น มองขึ้นด้านบน';

  @override
  String get formJumping =>
      'ทำสควอตจัมป์หรือกระโดดเชือก ลงพื้นเบาๆ ด้วยปลายเท้า พัก 30 วินาทีระหว่างเซ็ต';

  @override
  String get formSwimmingBasketball =>
      'เลือกว่ายน้ำ (ฟรีสไตล์/กรรเชียง) หรือบาสเกตบอล เน้นการกระโดด การเอื้อม และการเคลื่อนไหวเต็มช่วง';

  @override
  String get formEveningYoga =>
      'ทำท่าเบาๆ: ท่าแมว-วัว ท่าเด็ก ท่าสุนัขก้มหน้า ท่าก้มตัวไปข้างหน้า หายใจลึกๆ และค้างแต่ละท่า 30-60 วินาที';

  @override
  String get formSprintIntervals =>
      'วอร์มอัป 5 นาที แล้ววิ่งสปรินต์สุดแรง 30 วินาที เดินหรือวิ่งเหยาะ 90 วินาทีเพื่อพัก ทำซ้ำ';

  @override
  String get formHiitWorkout =>
      'ทำท่าอย่างเบอร์พี เมาน์เทนไคลม์เบอร์ และจัมป์สควอตเต็มแรง 45 วินาที พัก 15 วินาที';

  @override
  String get formSquats =>
      'ยืนแยกเท้ากว้างเท่าไหล่ ย่อตัวลงจนต้นขาขนานพื้น หลังตรง และเข่าไม่เลยปลายเท้า';

  @override
  String get formDeadliftStretch =>
      'ยืนแยกเท้ากว้างเท่าสะโพก พับตัวที่สะโพกโดยหลังตรง เอื้อมไปทางปลายเท้า รู้สึกถึงการยืดที่ต้นขาด้านหลังและหลัง';

  @override
  String get formOverheadPress =>
      'ยืนตัวตรง ดันแขนขึ้นเหนือศีรษะจนสุด ใช้น้ำหนักเบาหรือน้ำหนักตัว เกร็งแกนกลางลำตัวและอย่าแอ่นหลัง';

  @override
  String get formSkippingRope =>
      'กระโดดด้วยสองเท้า ลงพื้นเบาๆ ด้วยปลายเท้า กระโดดต่ำและสม่ำเสมอ พักระหว่างเซ็ต';

  @override
  String get formPilatesCore =>
      'ทำท่าแพลงก์ เดดบัก เบิร์ดด็อก บริดจ์ และยกขา เน้นการเคลื่อนไหวที่ควบคุมได้และการหายใจ';

  @override
  String get formInversionHang =>
      'ใช้เตียงห้อยหัวหรือรองเท้าห้อยหัว เริ่มจากมุมเอียงเล็กน้อยแล้วค่อยๆ เพิ่ม ทำแต่ละครั้งให้สั้น';

  @override
  String get formProtein =>
      'กระจายโปรตีนให้ทั่ว 3-4 มื้อ มีทั้งไข่ ไก่ ปลา นม และถั่ว';

  @override
  String get formCalciumVitaminD =>
      'กินผลิตภัณฑ์นมวันละ 3 ส่วน และรับแดด 15 นาทีเพื่อให้ร่างกายสร้างวิตามินดีเอง';

  @override
  String get formWater =>
      'ดื่มน้ำสม่ำเสมอตลอดวัน พกขวดน้ำติดตัวและตั้งเตือนทุกชั่วโมง';

  @override
  String get formAvoidJunk =>
      'เปลี่ยนฟาสต์ฟู้ดเป็นอาหารที่ไม่ผ่านการแปรรูป เปลี่ยนน้ำหวานเป็นน้ำเปล่า อ่านฉลากและเลี่ยงส่วนผสมแปรรูป';

  @override
  String get formZincIntake =>
      'กินเนื้อแดง เมล็ดฟักทอง ถั่วลูกไก่ เม็ดมะม่วงหิมพานต์ และหอยนางรม ตั้งเป้า 8-11mg ต่อวัน';

  @override
  String get formVitaminDSunlight =>
      'ให้แขนและใบหน้าโดนแดดโดยตรง 15 นาที ควรเป็นช่วงก่อนเที่ยง ระยะเวลาแค่นี้ไม่ต้องทากันแดด';

  @override
  String get formArginineFoods =>
      'ใส่ถั่ว เมล็ดพืช ไก่งวง ไก่ ถั่วเหลือง และนมลงในมื้ออาหาร กินก่อนนอนจะดีที่สุด';

  @override
  String get formDailyCalories =>
      'กระจายแคลอรี่ให้ทั่ว 3-5 มื้อ และอย่าข้ามมื้อเช้า เลือกอาหารจริงก่อนแคลอรี่ว่างเปล่า';

  @override
  String get formQualitySleep =>
      'เข้านอนภายใน 4 ทุ่ม ทำห้องให้มืดและเย็น เลี่ยงคาเฟอีนหลังบ่าย 2';

  @override
  String get formNoScreen =>
      'ตั้งปลุก 1 ชั่วโมงก่อนนอน เก็บหน้าจอทุกอย่าง อ่านหนังสือหรือยืดเหยียดเบาๆ แทน';

  @override
  String get formSleepEnvironment =>
      'ใช้ม่านทึบแสง รักษาอุณหภูมิห้องที่ 18-20°C ปิดแหล่งแสงทั้งหมด ใช้ที่นอนและหมอนที่สบาย';

  @override
  String get formPreSleepRoutine =>
      'เริ่ม 30 นาทีก่อนนอน: หรี่ไฟ อ่านหนังสือ ฝึกหายใจ เลี่ยงกิจกรรมที่กระตุ้น';

  @override
  String get formPostureCheck =>
      'ยืนตัวตรง ไหล่ผายและลดลง เกร็งแกนกลางลำตัวเล็กน้อย นึกภาพว่ามีเชือกดึงคุณขึ้นจากกลางศีรษะ';

  @override
  String get formWallStand =>
      'ยืนให้ส้นเท้า ก้น สะบัก และศีรษะแตะผนัง ค้างไว้ 5 นาที หายใจตามปกติ';

  @override
  String get formNeckStretches =>
      'ค่อยๆ เอียงศีรษะไปแต่ละข้าง ไปข้างหน้า และไปข้างหลัง ค้างแต่ละทิศ 30 วินาที อย่าฝืน';

  @override
  String get formShoulderRolls =>
      'หมุนไหล่ไปข้างหน้า 15 ครั้ง แล้วไปข้างหลัง 15 ครั้ง ต่อด้วยท่ายืดเปิดอกค้าง 20 วินาที';

  @override
  String get sciMorningStretch =>
      'การยืดเหยียดตอนเช้าช่วยคลายแรงกดหมอนรองกระดูกที่ได้รับน้ำกลับมาระหว่างคืน ช่วยรักษาส่วนสูงไว้ได้มากที่สุด';

  @override
  String get sciBarHanging =>
      'การโหนบาร์ใช้แรงโน้มถ่วงยืดกระดูกสันหลังและคลายแรงกดหมอนรองกระดูก อาจเพิ่มส่วนสูงได้ชั่วคราว';

  @override
  String get sciCobraStretch =>
      'ท่างูเห่ายืดกระดูกสันหลังและเปิดอก ช่วยลดแรงกดกระดูกสันหลังจากการนั่ง';

  @override
  String get sciJumping =>
      'การกระโดดแรงกระแทกสูงกระตุ้นแผ่นการเจริญเติบโตที่ขาและกระตุ้นการหลั่งโกรทฮอร์โมน';

  @override
  String get sciSwimmingBasketball =>
      'ว่ายน้ำและบาสเกตบอลมีการยืด กระโดด และเอื้อมทั้งตัว ซึ่งกระตุ้นการทำงานของแผ่นการเจริญเติบโต';

  @override
  String get sciEveningYoga =>
      'โยคะตอนเย็นช่วยลดคอร์ติซอลที่ยับยั้งโกรทฮอร์โมน และยืดกล้ามเนื้อเพื่อการฟื้นตัวระหว่างคืน';

  @override
  String get sciSprintIntervals =>
      'การวิ่งสปรินต์กระตุ้นการหลั่งโกรทฮอร์โมนได้มาก';

  @override
  String get sciHiitWorkout => 'การออกกำลังกายหนักเพิ่ม HGH ได้สูงสุดถึง 450%';

  @override
  String get sciSquats => 'สควอตกระตุ้นแผ่นการเจริญเติบโตที่ขาและกระดูกสันหลัง';

  @override
  String get sciDeadliftStretch =>
      'การคลายแรงกดกระดูกสันหลังช่วยให้หมอนรองกระดูกแข็งแรง';

  @override
  String get sciOverheadPress =>
      'การดันเหนือศีรษะช่วยยืดกระดูกสันหลังและเสริมกล้ามเนื้อที่ใช้ทรงตัว';

  @override
  String get sciSkippingRope =>
      'การกระโดดซ้ำๆ กระตุ้นแผ่นการเจริญเติบโตในช่วงขา';

  @override
  String get sciPilatesCore =>
      'แกนกลางลำตัวที่แข็งแรงช่วยจัดแนวกระดูกสันหลังและท่าทาง';

  @override
  String get sciInversionHang =>
      'การห้อยหัวกลับช่วยคลายแรงกดหมอนรองกระดูก อาจเพิ่มได้ 1-2cm ชั่วคราว';

  @override
  String get sciProtein =>
      'โปรตีนให้กรดอะมิโนที่จำเป็นต่อการเติบโตของกระดูกและกล้ามเนื้อ โดยเฉพาะช่วงโตเร็ว';

  @override
  String get sciCalciumVitaminD =>
      'แคลเซียมและวิตามินดีเป็นวัตถุดิบหลักของความหนาแน่นกระดูกและการยืดยาวของกระดูก';

  @override
  String get sciWater =>
      'การดื่มน้ำเพียงพอจำเป็นต่อการลำเลียงสารอาหารไปยังแผ่นการเจริญเติบโตและสุขภาพกระดูกอ่อนข้อต่อ';

  @override
  String get sciAvoidJunk =>
      'อาหารแปรรูปและน้ำตาลทำให้เกิดการอักเสบและอินซูลินพุ่ง ซึ่งกดการหลั่งโกรทฮอร์โมน';

  @override
  String get sciZincIntake => 'สังกะสีจำเป็นต่อการสร้างโกรทฮอร์โมน';

  @override
  String get sciVitaminDSunlight =>
      'วิตามินดีสำคัญมากต่อการดูดซึมแคลเซียมและการเติบโตของกระดูก';

  @override
  String get sciArginineFoods => 'แอล-อาร์จินีนกระตุ้นการหลั่งโกรทฮอร์โมน';

  @override
  String get sciDailyCalories =>
      'การขาดแคลอรี่ต่อเนื่องทำให้ IGF-1 ลดลงและการหลั่งโกรทฮอร์โมนอ่อนลง ส่งผลให้วัยรุ่นสูงช้าลงโดยตรง';

  @override
  String get sciQualitySleep =>
      'โกรทฮอร์โมน 70-80% ของทั้งวันหลั่งระหว่างหลับลึก โดยเฉพาะช่วง 4 ทุ่มถึงตี 2';

  @override
  String get sciNoScreen =>
      'แสงสีฟ้าจากหน้าจอกดการสร้างเมลาโทนิน ทำให้หลับช้าลงและหลับลึกได้น้อยลง';

  @override
  String get sciSleepEnvironment =>
      'ห้องที่มืดและเย็นช่วยให้เมลาโทนินและโกรทฮอร์โมนหลั่งได้มากที่สุด';

  @override
  String get sciPreSleepRoutine =>
      'กิจวัตรก่อนนอนที่สม่ำเสมอช่วยให้หลับลึกดีขึ้น 23%';

  @override
  String get sciPostureCheck =>
      'การจัดท่าทางให้ถูกช่วยให้ดูสูงขึ้นทันที 2-3 cm และป้องกันแรงกดที่กระดูกสันหลัง';

  @override
  String get sciWallStand =>
      'การยืนพิงผนังฝึกความจำของกล้ามเนื้อทรงตัว ช่วยรักษาแนวกระดูกสันหลังให้ถูกต้องตลอดวัน';

  @override
  String get sciNeckStretches =>
      'การยืดคอช่วยคลายแรงกดและจัดแนวกระดูกคอให้ดีขึ้น';

  @override
  String get sciShoulderRolls =>
      'การเปิดไหล่ช่วยแก้ท่าห่อไหล่ ทำให้ดูสูงขึ้นได้ 1-2cm';

  @override
  String get muscleSpine => 'กระดูกสันหลัง';

  @override
  String get muscleLegs => 'ขา';

  @override
  String get muscleBack => 'หลัง';

  @override
  String get muscleShoulders => 'ไหล่';

  @override
  String get muscleArms => 'แขน';

  @override
  String get muscleCore => 'แกนกลางลำตัว';

  @override
  String get muscleChest => 'อก';

  @override
  String get muscleCalves => 'น่อง';

  @override
  String get muscleFullBody => 'ทั้งตัว';

  @override
  String get muscleHips => 'สะโพก';

  @override
  String get muscleBones => 'กระดูก';

  @override
  String get muscleMuscles => 'กล้ามเนื้อ';

  @override
  String get muscleNeck => 'คอ';

  @override
  String get muscleUpperSpine => 'กระดูกสันหลังส่วนบน';

  @override
  String get muscleUpperBack => 'หลังส่วนบน';

  @override
  String get createRoutine => 'สร้างกิจวัตร';

  @override
  String get createRoutineTitle => 'สร้างกิจวัตรของคุณเอง';

  @override
  String get createRoutineSubtitle => 'สร้างกิจวัตรประจำวันในแบบของคุณ';

  @override
  String get routineIcon => 'ไอคอน';

  @override
  String get routineTitleField => 'ชื่อ';

  @override
  String get routineDescField => 'คำอธิบาย';

  @override
  String get routineDescHint => 'สรุปสั้นๆ ของกิจวัตรนี้';

  @override
  String get routineCategoryField => 'หมวดหมู่';

  @override
  String get routineDifficultyField => 'ความยาก';

  @override
  String get routineDurationField => 'ระยะเวลา';

  @override
  String get routineSetsRepsField => 'เซ็ต x ครั้ง';

  @override
  String get routineFormField => 'ท่าทางและวิธีทำ';

  @override
  String get routineFormHint => 'ไม่บังคับ: วิธีทำกิจวัตรนี้';

  @override
  String get diffBeginner => 'มือใหม่';

  @override
  String get diffIntermediate => 'ระดับกลาง';

  @override
  String get diffAdvanced => 'ระดับสูง';

  @override
  String get catExercise => 'ออกกำลังกาย';

  @override
  String get catNutrition => 'โภชนาการ';

  @override
  String get catSleep => 'การนอน';

  @override
  String get catPosture => 'ท่าทาง';

  @override
  String get postureTip1 => 'ยืนหันข้าง (ด้านข้าง) ให้กล้อง';

  @override
  String get postureTip2 => 'ยืนห่างจากกล้องประมาณ 2 เมตร';

  @override
  String get postureTip3 => 'ปล่อยแขนสบายๆ มองตรงไปข้างหน้า';

  @override
  String get postureTip4 => 'ใส่เสื้อผ้าพอดีตัวเพื่อให้คะแนนแม่นยำ';

  @override
  String get postureTip5 => 'ใช้แสงสว่างที่ดีและพื้นหลังเรียบๆ';

  @override
  String get kyphosisLabel => 'หลังค่อม (หลังส่วนบน)';

  @override
  String get lordosisLabel => 'หลังแอ่น (หลังส่วนล่าง)';

  @override
  String get analyzingPosture => 'กำลังวิเคราะห์ท่าทาง';

  @override
  String get privacyPolicy => 'นโยบายความเป็นส่วนตัว';

  @override
  String get termsOfService => 'ข้อกำหนดการให้บริการ';

  @override
  String version(String ver) {
    return 'เวอร์ชัน $ver';
  }

  @override
  String get rateApp => 'ให้คะแนน BeTaller';

  @override
  String get rateAppSubtitle => 'รีวิวของคุณช่วยให้เราเติบโต!';

  @override
  String get unitSystem => 'ระบบหน่วย';

  @override
  String get unitMetric => 'เมตริก (cm, kg)';

  @override
  String get unitImperial => 'อิมพีเรียล (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'ข้อจำกัดความรับผิดชอบด้านสุขภาพ';

  @override
  String get healthDisclaimerBody =>
      'BeTaller ให้คำแนะนำทั่วไปด้านสุขภาวะและการออกกำลังกาย ผลลัพธ์แตกต่างกันไปตามอายุ พันธุกรรม และปัจจัยเฉพาะของแต่ละคน แอปนี้ไม่ได้ให้คำแนะนำทางการแพทย์ ท่าออกกำลังเน้นการปรับท่าทาง สุขภาพกระดูกสันหลัง และการสนับสนุนโกรทฮอร์โมนผ่านนิสัยตามธรรมชาติ ปรึกษาบุคลากรทางการแพทย์ก่อนเริ่มโปรแกรมออกกำลังกายหรือโภชนาการใหม่ ส่วนสูงที่เปลี่ยนหลังแผ่นการเจริญเติบโตปิดแล้ว (โดยทั่วไปอายุ 18-25) ส่วนใหญ่มาจากท่าทางที่ดีขึ้น';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'วันนี้กินโปรตีนอย่างน้อย ${grams}g — คำนวณจากน้ำหนักของคุณ';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'วันนี้ดื่มน้ำอย่างน้อย ${liters}L — คำนวณจากน้ำหนักของคุณ';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'วันนี้ตั้งเป้าประมาณ $kcal kcal เพื่อเติมพลังให้การเติบโต';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'วันนี้รับวิตามินดี $iu IU — จากแสงแดด อาหาร หรืออาหารเสริม';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'วันนี้รับสังกะสี ${mg}mg เพื่อช่วยการสร้างโกรทฮอร์โมน';
  }

  @override
  String get nutritionSupplementsTitle => 'อาหารเสริม';

  @override
  String get nutritionSupplementsDisclaimer =>
      'เป็นตัวช่วยเสริมเท่านั้น ไม่ได้ใช้แทนอาหาร ปรึกษาแพทย์ก่อนเริ่มอาหารเสริมใดๆ โดยเฉพาะถ้าอายุต่ำกว่า 18';

  @override
  String get supplementVitaminDName => 'วิตามินดี3';

  @override
  String get supplementVitaminDDose => '3,000 IU';

  @override
  String get supplementVitaminDBenefit =>
      'ช่วยเพิ่มการดูดซึมแคลเซียม เพื่อความหนาแน่นกระดูกและสุขภาพแผ่นการเจริญเติบโต';

  @override
  String get supplementZincName => 'สังกะสี';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit => 'แร่ธาตุสำคัญต่อการสร้างโกรทฮอร์โมน';

  @override
  String get supplementMagnesiumName => 'แมกนีเซียม';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit =>
      'ช่วยการหลับลึก ซึ่งเป็นช่วงที่โกรทฮอร์โมนหลั่งมากที่สุด';

  @override
  String get supplementCalciumName => 'แคลเซียม';

  @override
  String get supplementCalciumDose => '1,000-1,300mg';

  @override
  String get supplementCalciumBenefit =>
      'วัตถุดิบหลักของความหนาแน่นกระดูกและแผ่นการเจริญเติบโต';

  @override
  String get supplementOmega3Name => 'โอเมก้า-3';

  @override
  String get supplementOmega3Dose => '1,000mg';

  @override
  String get supplementOmega3Benefit =>
      'ลดการอักเสบและช่วยให้แผ่นการเจริญเติบโตทำงานได้ดี';

  @override
  String get supplementCollagenName => 'คอลลาเจน + วิตามินซี';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit =>
      'วิตามินซีช่วยให้ร่างกายใช้คอลลาเจนสร้างกระดูกอ่อนและโครงสร้างกระดูก';

  @override
  String get sciSourcePrefix => 'แหล่งที่มา: ';

  @override
  String get program => 'โปรแกรม';

  @override
  String get todaysExercises => 'ท่าออกกำลังวันนี้';

  @override
  String get dailyNutritionPlan => 'แผนโภชนาการประจำวัน';

  @override
  String get nutritionGoalsComplete => '🎉 ครบทุกเป้าหมายโภชนาการแล้ว!';

  @override
  String get nutritionGoalsIncomplete =>
      'ทำเป้าหมายโภชนาการให้ครบเพื่อการเติบโตที่ดีที่สุด';

  @override
  String get postureDetectingAlignment => 'กำลังตรวจแนวกระดูกสันหลัง...';

  @override
  String get testimonial1 =>
      'ฉันเคยหมดหวังเพราะอายุ แต่ก็สูงขึ้นได้ด้วย BeTaller ไม่เคยมั่นใจขนาดนี้มาก่อน';

  @override
  String get testimonialDuration1 => '4 เดือน';

  @override
  String get testimonial2 =>
      'ทุกคนบอกว่า \"สูงไม่ได้แล้ว\" ฉันใช้ BeTaller แล้วทำให้ทุกคนแปลกใจ';

  @override
  String get testimonialDuration2 => '3 เดือน';

  @override
  String get testimonial3 =>
      'หลังเริ่มทำกิจวัตร ฉันสูงขึ้นและท่าทางดีขึ้น ทุกคนสังเกตเห็นความต่าง';

  @override
  String get testimonialDuration3 => '6 เดือน';

  @override
  String get testimonial4 =>
      'ฉันยังอยู่ในช่วงกำลังโต และผลของ BeTaller ดีเกินคาด รู้สึกสูงขึ้นและแข็งแรงขึ้น';

  @override
  String get testimonialDuration4 => '3 เดือน';

  @override
  String get testimonial5 =>
      'ถ้าบอกว่าไม่ได้ลอง BeTaller ก็คงโกหก เห็นความต่างจริงได้เร็ว แนะนำเลย';

  @override
  String get testimonialDuration5 => '4 เดือน';

  @override
  String get designedForYou => 'ออกแบบมาเพื่อคุณ';

  @override
  String get designedForYouDesc =>
      'BeTaller สร้างขึ้นมาเพื่อให้คุณไปถึงขีดจำกัดทางพันธุกรรม หรือแม้แต่ก้าวข้ามมัน ทุกฟีเจอร์เพื่อคุณ';

  @override
  String get greetingAllDone => 'เยี่ยมมาก! 🎯';

  @override
  String get greetingAllDoneSub => 'คุณทำภารกิจวันนี้ครบแล้ว';

  @override
  String greetingStreak30(int streak) {
    return 'ต่อเนื่อง $streak วัน ระดับตำนาน';
  }

  @override
  String greetingStreak7(int streak) {
    return 'ต่อเนื่อง $streak วัน ทำต่อไปนะ';
  }

  @override
  String greetingStreak3(int streak) {
    return 'ติดกัน $streak วัน คนส่วนใหญ่เลิกไปแล้ว แต่คุณไม่';
  }

  @override
  String get greetingMorning => 'อรุณสวัสดิ์ วันใหม่ โอกาสใหม่';

  @override
  String get greetingAfternoon =>
      'วันนี้เป็นวันที่ดีที่จะเริ่มนับความต่อเนื่อง';

  @override
  String get greetingEvening => 'ทำภารกิจให้ครบ แล้วเริ่มนับความต่อเนื่อง';

  @override
  String get todayCompleted => 'วันนี้สำเร็จแล้ว ✓';

  @override
  String get todayGoals => 'เป้าหมายวันนี้';

  @override
  String get challengesLabel => 'ชาเลนจ์';

  @override
  String get dailyChallengesLabel => 'ชาเลนจ์ประจำวัน';

  @override
  String get expiresTonight => 'หมดเขตคืนนี้';

  @override
  String get allChallengesCompleted => 'สำเร็จทั้งหมด ✓';

  @override
  String get challengesLoading => 'ชาเลนจ์ใหม่กำลังจะมาเร็วๆ นี้';

  @override
  String get challengesLoadingTitle => 'ชาเลนจ์ประจำวัน';

  @override
  String get behindPace => 'ช้ากว่าแผน';

  @override
  String get growthTracking => 'ติดตามการเติบโต';

  @override
  String get growthEmptyFirst => 'บันทึกส่วนสูงครั้งแรกเพื่อเริ่มติดตาม';

  @override
  String get growthEmptySecond => 'บันทึกการวัดครั้งที่สองเพื่อดูกราฟ';

  @override
  String get growthSectionLabel => 'การเติบโต';

  @override
  String get generalPerformance => 'ผลงานโดยรวม';

  @override
  String get analysisBalance => 'ความสมดุลของคุณ';

  @override
  String get analysisWeakest => 'จุดอ่อนที่สุดของคุณ';

  @override
  String get analysisPrediction => 'คาดการณ์ส่วนสูง';

  @override
  String get analysisComparison => 'การเปรียบเทียบ';

  @override
  String get analysisGrowth => 'สถานะการเติบโต';

  @override
  String get analysisWeakestHint => 'ตรงนี้คือจุดที่เพิ่มคะแนนได้เร็วที่สุด';

  @override
  String get exploreLabel => 'สำรวจ';

  @override
  String get explorePosture => 'วิเคราะห์ท่าทาง';

  @override
  String get explorePostureSub => 'วิเคราะห์ท่าทางและเคล็ดลับการแก้ไข';

  @override
  String get explorePhotos => 'รูปความคืบหน้า';

  @override
  String get explorePhotosSub => 'ติดตามการเปลี่ยนแปลงด้วยรูปภาพ';

  @override
  String get exploreNutrition => 'โภชนาการ';

  @override
  String get exploreNutritionSub => 'คู่มือโปรตีน แคลเซียม และวิตามิน';

  @override
  String get exploreHealth => 'ติดตามสุขภาพ';

  @override
  String get exploreHealthSub => 'ติดตามความเครียด คาเฟอีน และสุขภาวะ';

  @override
  String get exploreRecipes => 'สูตรอาหารเพื่อการเติบโต';

  @override
  String get exploreRecipesSub => 'สูตรอาหารที่ช่วยการเติบโต';

  @override
  String get educationLabel => 'ความรู้';

  @override
  String get educationTitle => 'วิทยาศาสตร์\nการเพิ่มส่วนสูง';

  @override
  String get educationSubtitle => 'เนื้อหาจากผู้เชี่ยวชาญ งานวิจัย และคู่มือ';

  @override
  String get aiAnalysisLabel => 'วิเคราะห์การเติบโต';

  @override
  String get peerCompareLabel => 'เทียบกับเพื่อนวัยเดียวกัน';

  @override
  String peerCompareText(int topPct) {
    return 'คุณอยู่ใน Top $topPct% ของเพื่อนวัยเดียวกัน';
  }

  @override
  String get notifWaterTitle => '💧 อย่าลืมดื่มน้ำนะ!';

  @override
  String get notifWaterBody => 'ดื่มน้ำถึงเป้าวันนี้หรือยัง? ดื่มอีกแก้วเลย!';

  @override
  String get notifMorningTitle => '🌅 อรุณสวัสดิ์! ได้เวลาออกกำลังแล้ว';

  @override
  String get notifMorningBody =>
      'ยืดเหยียดตอนเช้ากัน! ยืดกระดูกสันหลังและขา 10 นาที';

  @override
  String get notifRoutineTitle => '🔥 ทำกิจวัตรให้ครบนะ!';

  @override
  String get notifRoutineBody => 'เช็กกิจวัตรก่อนหมดวัน ความต่อเนื่อง = วินัย!';

  @override
  String get notifProteinTitle => '🥚 วันโปรตีน!';

  @override
  String get notifProteinBody => 'เริ่มสัปดาห์ให้แข็งแรง! กินโปรตีนทุกมื้อ';

  @override
  String get notifNewWeekTitle => '✨ สัปดาห์ใหม่ เป้าหมายใหม่!';

  @override
  String get notifNewWeekBody =>
      'สัปดาห์นี้อย่าข้ามกิจวัตร ก้าวเล็กๆ สร้างความต่างที่ยิ่งใหญ่!';

  @override
  String get notifSleepTitle => '😴 ได้เวลานอนแล้ว!';

  @override
  String get notifSleepBody =>
      'โกรทฮอร์โมนหลั่งสูงสุดช่วง 4 ทุ่ม-ตี 2 วางมือถือได้แล้ว!';

  @override
  String get notifPostureTitle => '🧍 เช็กท่าทาง!';

  @override
  String get notifPostureBody => 'หลังตรง ไหล่ผาย ท่าทางดี = ต่างกัน 2-3 cm!';

  @override
  String get notifVitaminDTitle => '☀️ ได้เวลาวิตามินดี!';

  @override
  String get notifVitaminDBody =>
      'ออกไปรับแดด 15 นาที! วิตามินดีช่วยเพิ่มการดูดซึมแคลเซียม';

  @override
  String get notifMidweekTitle => '✨ มาได้ครึ่งทางแล้ว!';

  @override
  String get notifMidweekBody =>
      'เช็กกลางสัปดาห์ การเติบโตต้องใช้ความอดทน แต่ความสม่ำเสมอชนะเสมอ!';

  @override
  String get notifScreenTitle => '📵 ปิดจอได้แล้ว!';

  @override
  String get notifScreenBody =>
      'งดหน้าจอ 1 ชั่วโมงก่อนนอน แสงสีฟ้าขัดขวางเมลาโทนิน!';

  @override
  String get notifJumpTitle => '🦘 ได้เวลากระโดด!';

  @override
  String get notifJumpBody =>
      'ท่ากระโดดกระตุ้นแผ่นการเจริญเติบโต ลอง 3 x 20 ครั้ง!';

  @override
  String get notifCalciumTitle => '🥛 ได้เวลาแคลเซียม!';

  @override
  String get notifCalciumBody =>
      'นมหรือโยเกิร์ตสักแก้ว แคลเซียมสำคัญมากต่อกระดูก!';

  @override
  String get notifPostureCheckTitle => '🧍 เช็กท่าทาง!';

  @override
  String get notifPostureCheckBody => 'อย่าก้มคอดูมือถือ! นั่งและเดินตัวตรง';

  @override
  String get notifWeekendTitle => '✨ แรงบันดาลใจวันหยุด';

  @override
  String get notifWeekendBody => 'วันหยุดก็อย่าข้ามกิจวัตร! วินัยใช้ได้ทุกวัน';

  @override
  String get notifWeeklyProgressTitle => '📊 ความคืบหน้าประจำสัปดาห์';

  @override
  String get notifWeeklyProgressBody =>
      'สัปดาห์นี้เป็นยังไงบ้าง? ดูกราฟการเติบโตของคุณเลย!';

  @override
  String get notifMeasureTitle => '📏 วัดประจำสัปดาห์!';

  @override
  String get notifMeasureBody => 'วัดและบันทึกส่วนสูง! วัดตอนเช้าแม่นที่สุด';

  @override
  String get notifEarlySleepTitle => '😴 เข้านอนเร็วหน่อย!';

  @override
  String get notifEarlySleepBody =>
      'พรุ่งนี้วันจันทร์แล้ว! เริ่มสัปดาห์ให้แข็งแรงด้วยการนอนที่ดี';

  @override
  String get notifStreak3Title => '🔥 ต่อเนื่อง 3 วัน!';

  @override
  String get notifStreak3Body =>
      'เริ่มได้ดีมาก! ติดกัน 3 วันแล้ว ไปต่อให้ถึง 7!';

  @override
  String get notifStreak7Title => '🏆 ต่อเนื่อง 1 สัปดาห์!';

  @override
  String get notifStreak7Body => 'สุดยอด! ทำกิจวัตรครบติดกัน 7 วัน!';

  @override
  String get notifStreak14Title => '⭐ ต่อเนื่อง 2 สัปดาห์!';

  @override
  String get notifStreak14Body => 'วินัย 14 วัน! ร่างกายของคุณเริ่มเปลี่ยนแล้ว';

  @override
  String get notifStreak30Title => '👑 ต่อเนื่อง 1 เดือน!';

  @override
  String get notifStreak30Body => '30 วัน! คุณคือแชมป์!';

  @override
  String get notifStreak60Title => '🌟 ต่อเนื่อง 60 วัน!';

  @override
  String get notifStreak60Body => '60 วัน! ความสำเร็จที่น่าทึ่ง';

  @override
  String get notifStreak100Title => '💎 100 วัน! ระดับตำนาน!';

  @override
  String get notifStreak100Body => 'ติดกัน 100 วัน! คุณกลายเป็นตำนานแล้ว';

  @override
  String get notifStreakRiskTitle => '⚠️ อย่าให้ความต่อเนื่องขาดนะ!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'ความต่อเนื่อง $streak วันของคุณกำลังจะขาด! ทำกิจวัตรให้ครบ';
  }

  @override
  String get paywallStat1 => 'cm — ศักยภาพของคุณถูกล็อกอยู่';

  @override
  String get paywallTitle1 => 'คุณจะสูงขึ้น\nได้อีกกี่ cm?';

  @override
  String get paywallBullet1a => 'คำนวณเพดานพันธุกรรมของคุณแล้ว อยากเห็นไหม?';

  @override
  String get paywallBullet1b => 'ไลฟ์สไตล์มีผลต่อการเติบโตของคุณอย่างไร?';

  @override
  String get paywallBullet1c => 'แผนเส้นทางเฉพาะของคุณรออยู่';

  @override
  String get paywallStat2 => 'กิจวัตรเฉพาะของคุณพร้อมแล้ว';

  @override
  String get paywallTitle2 => 'แผนของคุณ\nพร้อมแล้ว';

  @override
  String get paywallBullet2a =>
      'ทุกเช้า 8 นาที — ออกแบบมาเพื่อกระดูกสันหลังของคุณ';

  @override
  String get paywallBullet2b => 'การนอน โภชนาการ น้ำ — ติดตามครบทุกอย่าง';

  @override
  String get paywallBullet2c =>
      'ใกล้ขึ้นทีละก้าวทุกวัน อย่าให้ความต่อเนื่องขาด';

  @override
  String get paywallStat3 => 'กราฟความคืบหน้าแบบเรียลไทม์';

  @override
  String get paywallTitle3 => 'ติดตาม\nการเติบโตของคุณ';

  @override
  String get paywallBullet3a => 'วัดทุกเดือน — เห็นการเติบโตด้วยตาตัวเอง';

  @override
  String get paywallBullet3b => 'ได้เพิ่ม 2 cm ทันทีด้วยการวิเคราะห์ท่าทาง';

  @override
  String get paywallBullet3c => 'รูปความคืบหน้า — คุณจะเห็นความต่าง';

  @override
  String get paywallStat4 => 'โปรแกรมรายวัน — เลเวลอัป';

  @override
  String get paywallTitle4 => 'แข็งแกร่งขึ้น\nทุกวัน';

  @override
  String get paywallBullet4a => 'สะสม XP ปลดล็อกเลเวล — นิสัยกลายเป็นเกม';

  @override
  String get paywallBullet4b => 'คนที่ถึงเป้าหมายแล้วก็ผ่านเส้นทางนี้มา';

  @override
  String get paywallBullet4c => 'เริ่มเลยตอนนี้ — สัปดาห์แรกฟรี';

  @override
  String get paywallRestore => 'ไม่พบการซื้อก่อนหน้า';

  @override
  String get paywallRestoreNotFound => 'ไม่พบการซื้อก่อนหน้า';

  @override
  String get paywallPromoCode => 'มีโค้ดโปรโมชันไหม?';

  @override
  String get paywallHeightUnit => 'ส่วนสูงเป้าหมาย';

  @override
  String get paywallHeightTitle => 'คุณจะสูงขึ้นได้อีกเท่าไร?';

  @override
  String get paywallHeightDesc =>
      'เราวิเคราะห์พันธุกรรม ไลฟ์สไตล์ และท่าทางของคุณรวมกัน แล้ววางการคาดการณ์ทีละปี ไม่มีอะไรตายตัว ทุกก้าวที่คุณทำจะอัปเดตมัน';

  @override
  String get paywallGrowthUnit => 'ปีนี้';

  @override
  String get paywallGrowthTitle => 'เราติดตามการเติบโตไปพร้อมกับคุณ';

  @override
  String get paywallGrowthDesc =>
      'ทุกการวัดขึ้นกราฟทันที คุณได้เห็นความคืบหน้าทีละเดือน ทีละเซนติเมตร';

  @override
  String get paywallPostureUnit => 'คะแนนท่าทาง';

  @override
  String get paywallPostureTitle => 'ท่าทางคือกุญแจของกิจวัตรคุณ';

  @override
  String get paywallPostureDesc =>
      'เช็กศีรษะ ไหล่ และหลังส่วนล่างด้วย 3 คำถามสั้นๆ พร้อมท่าออกกำลังที่ตรงจุดสำหรับแต่ละส่วน';

  @override
  String get paywallReportUnit => 'กิจวัตรที่ทำสำเร็จ';

  @override
  String get paywallReportTitle => 'เราทบทวนผลของคุณทุกสัปดาห์';

  @override
  String get paywallReportDesc =>
      'น้ำ การนอน กิจวัตร และความต่อเนื่องในหน้าเดียว ทุกสัปดาห์เราจะชี้จุดแข็งและจุดที่ขาดไปด้วยกัน';

  @override
  String get paywallNutritionUnit => 'มื้อต่อวัน';

  @override
  String get paywallNutritionTitle => 'แผนโภชนาการครบถ้วนของคุณพร้อมแล้ว';

  @override
  String get paywallNutritionDesc =>
      'ตั้งแต่มื้อเช้าถึงมื้อเย็น แผนเต็มวันที่คำนวณโปรตีน แคลเซียม สังกะสี และวิตามินดีไว้ให้แล้ว';

  @override
  String get paywallScoreUnit => 'คะแนน BeTaller';

  @override
  String get paywallScoreTitle => 'ระบบที่ผลักดันคุณไปข้างหน้าเสมอ';

  @override
  String get paywallScoreDesc =>
      'พันธุกรรม การเติบโต โภชนาการ การนอน และวินัย รวมเป็นคะแนนเดียว พอคะแนนลด คุณจะเห็นทันทีว่าต้องปรับตรงไหน';

  @override
  String get paywallPhotosUnit => 'ความต่างที่เห็นได้';

  @override
  String get paywallPhotosTitle => 'พิสูจน์การเปลี่ยนแปลงด้วยรูปภาพ';

  @override
  String get paywallPhotosDesc =>
      'ภาพเปรียบเทียบก่อนและหลังสร้างขึ้นเอง และรูปของทุกเดือนเรียงอยู่บนไทม์ไลน์ของคุณ';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'มาเริ่มกันใน 3 ขั้นตอน';

  @override
  String get journeyIntroSubtitle =>
      'เราจะตั้งค่า BeTaller ไปด้วยกัน ขั้นตอนถัดไปรอคุณอยู่';

  @override
  String get journeyStep1Title => 'เก็บข้อมูลของคุณ';

  @override
  String get journeyStep1Desc =>
      'เราใช้ส่วนสูง อายุ และไลฟ์สไตล์ของคุณ แล้วคำนวณศักยภาพ';

  @override
  String get journeyStep2Title => 'ทัวร์แอป';

  @override
  String get journeyStep2Desc => 'เราจะพาดูทุกฟีเจอร์: ทำอะไรได้และใช้อย่างไร';

  @override
  String get journeyStep3Title => 'ลองใช้เอง';

  @override
  String get journeyStep3Desc =>
      'คุณทำกิจวัตรประจำวัน และเราคอยติดตามความคืบหน้าให้';

  @override
  String get journeyNow => 'ตอนนี้';

  @override
  String get journeyDone => 'เสร็จแล้ว';

  @override
  String get journeySoon => 'เร็วๆ นี้';

  @override
  String get tourHomeStreakTitle => 'ความต่อเนื่องของคุณ';

  @override
  String get tourHomeStreakDesc =>
      'จะเพิ่มขึ้นเรื่อยๆ ตราบใดที่คุณรักษาวินัย ถ้าพลาดหนึ่งวันจะเริ่มนับใหม่';

  @override
  String get tourHomeXpTitle => 'เลเวลของคุณ';

  @override
  String get tourHomeXpDesc =>
      'เพิ่มขึ้นตาม XP ที่ได้จากการมีวินัย อย่าหลุดนะ!';

  @override
  String get tourHomeGoalsTitle => 'เป้าหมายวันนี้';

  @override
  String get tourHomeGoalsDesc =>
      'แสดงกิจวัตร ภารกิจ และเป้าหมายน้ำของวันในพริบตา ไม่มีอะไรหลุด';

  @override
  String get tourHomeTrackTitle => 'ติดตามน้ำและการนอน';

  @override
  String get tourHomeTrackDesc =>
      'บันทึกน้ำและการนอนประจำวันได้ที่นี่ในไม่กี่วินาที';

  @override
  String get tourPlanTabsTitle => '3 แท็บ: วันนี้ วินัย โภชนาการ';

  @override
  String get tourPlanTabsDesc =>
      'กิจวัตรประจำวัน โปรแกรมรายสัปดาห์ และแผนโภชนาการอยู่ที่นี่ทั้งหมด';

  @override
  String get tourPlanLevelTitle => 'เลเวลวินัยของคุณ';

  @override
  String get tourPlanLevelDesc =>
      'แสดงว่าคุณทำกิจวัตรได้สม่ำเสมอแค่ไหน เลเวลอัปเพื่อผลลัพธ์ที่ดีขึ้น';

  @override
  String get tourPlanTodayTitle => 'แผนวันนี้';

  @override
  String get tourPlanTodayDesc =>
      'ติ๊กกิจวัตรประจำวันที่นี่เพื่อเพิ่มความต่อเนื่อง';

  @override
  String get tourPlanTodayListTitle => 'กิจวัตรของคุณวันนี้';

  @override
  String get tourPlanTodayListDesc =>
      'ติ๊กทีละอย่างเมื่อทำเสร็จ แตะที่กิจวัตรเพื่อดูรายละเอียด';

  @override
  String get tourPlanWeekGoalsTitle => 'สัปดาห์นี้';

  @override
  String get tourPlanWeekGoalsDesc =>
      'วันที่ทำครบ การฝึก และการวัดที่สัปดาห์นี้ต้องทำ รวมถึงอันที่บังคับ';

  @override
  String get tourPlanMonthGoalsTitle => 'เดือนนี้';

  @override
  String get tourPlanMonthGoalsDesc =>
      'รูปความคืบหน้า การเช็กท่าทาง และการวัดของเดือนนี้: สิ่งที่ไม่ควรข้าม';

  @override
  String get tourProgressHeightTitle => 'ส่วนสูงปัจจุบันของคุณ';

  @override
  String get tourProgressHeightDesc =>
      'แสดงส่วนสูงตอนนี้และส่วนที่เพิ่มขึ้นทั้งหมด เพิ่มการวัดใหม่ได้จากตรงนี้';

  @override
  String get tourProgressPhotosTitle => 'รูปความคืบหน้า';

  @override
  String get tourProgressPhotosDesc =>
      'ติดตามการเปลี่ยนแปลงด้วยภาพจากรูปที่คุณถ่ายเป็นประจำ';

  @override
  String get tourProgressPostureTitle => 'วิเคราะห์ท่าทาง';

  @override
  String get tourProgressPostureDesc =>
      'ให้วิเคราะห์ท่าทางจากรูป แล้วรู้ว่าต้องฝึกตรงไหน';

  @override
  String get tourAnalysisScoreTitle => 'คะแนน BeTaller ของคุณ';

  @override
  String get tourAnalysisScoreDesc =>
      'คะแนนผลงานโดยรวม คำนวณจากพันธุกรรม ความเร็วการเติบโต โภชนาการ และการนอน';

  @override
  String get tourAnalysisPredictionTitle => 'การคาดการณ์ส่วนสูงของคุณ';

  @override
  String get tourAnalysisPredictionDesc =>
      'แสดงส่วนสูงสุดท้ายที่คาดการณ์และเส้นทางทีละปี';

  @override
  String get tourAnalysisPeerTitle => 'เทียบกับเพื่อนวัยเดียวกัน';

  @override
  String get tourAnalysisPeerDesc =>
      'ดูว่าคุณอยู่อันดับไหน และเทียบกับคนวัยเดียวกัน';

  @override
  String get tourHomeGoalsRoutinesTitle => 'กิจวัตรของคุณ';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'ดูว่าวันนี้ยังเหลือกิจวัตรออกกำลังกายอีกกี่อย่าง';

  @override
  String get tourHomeGoalsChallengesTitle => 'ภารกิจของคุณ';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'ติดตามความคืบหน้าของชาเลนจ์ที่กำลังทำได้ที่นี่';

  @override
  String get tourHomeGoalsWaterTitle => 'เป้าหมายน้ำของคุณ';

  @override
  String get tourHomeGoalsWaterDesc =>
      'ดูว่าคุณใกล้ถึงเป้าหมายน้ำประจำวันแค่ไหน';

  @override
  String get tourHomeReminderTitle => 'การเตือนถัดไปของคุณ';

  @override
  String get tourHomeReminderDesc =>
      'ดูว่าการเตือนถัดไปจะมาเมื่อไร และแก้ไขได้จากตรงนี้';

  @override
  String get tourHomeChallengesTitle => 'ชาเลนจ์ของคุณ';

  @override
  String get tourHomeChallengesDesc =>
      'ทำชาเลนจ์ที่กำลังเปิดอยู่ให้สำเร็จเพื่อรับ XP เพิ่ม';

  @override
  String get tourHomeGrowthTitle => 'สถานะการเติบโตของคุณ';

  @override
  String get tourHomeGrowthDesc =>
      'ดูส่วนต่างรวมและการวัดล่าสุด และจำนวนครั้งที่บันทึกไว้';

  @override
  String get tourHomeExploreTitle => 'สำรวจ';

  @override
  String get tourHomeExploreDesc =>
      'คู่มือโภชนาการ สูตรอาหารเพื่อการเติบโต และอื่นๆ รอคุณอยู่ที่นี่';

  @override
  String get tourPlanProgramHeaderTitle => 'โปรแกรม 70 วันของคุณ';

  @override
  String get tourPlanProgramHeaderDesc =>
      'ดูความคืบหน้าโดยรวม เลเวลปัจจุบัน และวันที่ของคุณในวงแหวนนี้';

  @override
  String get tourPlanProgramLevelsTitle => 'เลเวล';

  @override
  String get tourPlanProgramLevelsDesc =>
      'ดูว่าคุณอยู่เลเวลไหนจาก 10 เลเวล และเลเวลไหนยังล็อกอยู่';

  @override
  String get tourPlanNutritionHeaderTitle => 'ความคืบหน้าด้านโภชนาการ';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'ติดตามว่าคุณทำกิจวัตรโภชนาการประจำวันไปแล้วกี่อย่าง';

  @override
  String get tourPlanNutritionFirstTitle => 'กิจวัตรโภชนาการ';

  @override
  String get tourPlanNutritionFirstDesc =>
      'ติ๊กนิสัยการกินที่ช่วยการเติบโตของคุณ';

  @override
  String get tourProgressChartTitle => 'กราฟการเติบโต';

  @override
  String get tourProgressChartDesc =>
      'ดูการวัดที่ผ่านมาบนกราฟ และเข้าใจว่าคุณกำลังไปทางไหน';

  @override
  String get tourProgressReportTitle => 'รายงานประจำสัปดาห์';

  @override
  String get tourProgressReportDesc => 'ดูรายงานสรุปความคืบหน้าของสัปดาห์';

  @override
  String get tourProgressHistoryTitle => 'ประวัติการวัดของคุณ';

  @override
  String get tourProgressHistoryDesc =>
      'ดูทุกการวัดส่วนสูงที่คุณบันทึกไว้บนไทม์ไลน์';

  @override
  String get tourAnalysisRadarTitle => 'กราฟความสมดุลของคุณ';

  @override
  String get tourAnalysisRadarDesc =>
      'ดูความสมดุลของพันธุกรรม ความเร็วการเติบโต โภชนาการ การนอน และวินัยบนกราฟเรดาร์ แล้วรู้จุดอ่อนที่สุดของคุณ';

  @override
  String get tourAnalysisDailyNeedsTitle => 'ความต้องการต่อวันของคุณ';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'ดูความต้องการโปรตีน แคลอรี่ การนอน และน้ำต่อวัน ที่ปรับตามส่วนสูงและน้ำหนักของคุณ';

  @override
  String get journeyDataDoneTitle => 'ขั้นแรกเสร็จแล้ว';

  @override
  String get journeyDataDoneSubtitle =>
      'เราได้ข้อมูลและศักยภาพของคุณแล้ว ต่อไปคือทัวร์แอป';

  @override
  String get journeyContinue => 'ต่อไป';

  @override
  String get journeyEnterApp => 'เข้าสู่แอป';

  @override
  String get journeyProgressLabel => 'เริ่มต้นใช้งาน';

  @override
  String get journeyTourDoneTitle => 'ยินดีต้อนรับสู่ BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'คุณทำครบทั้ง 3 ขั้นตอนแล้ว ตาคุณแล้ว: เริ่มเส้นทางด้วยการทำกิจวัตรแรกให้สำเร็จ';

  @override
  String get journeyViewPlansButton => 'ดูแผนเพื่อเริ่มต้น';

  @override
  String get paywallRestoreLabel => 'กู้คืนการซื้อ';

  @override
  String get paywallYearly => 'รายปี';

  @override
  String get paywallBestValue => 'คุ้มที่สุด';

  @override
  String paywallSavePercent(String percent) {
    return 'ประหยัด $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/สัปดาห์';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/เดือน';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/ปี';
  }

  @override
  String get paywallMonthly => 'รายเดือน';

  @override
  String get paywallWeekly => 'รายสัปดาห์';

  @override
  String get paywallFreeTrial => 'ฟรี 3 วัน';

  @override
  String get paywallLoadError => 'โหลดตัวเลือกการซื้อไม่ได้ ลองใหม่อีกครั้ง';

  @override
  String get paywallCtaAlt => 'ต่อไป';

  @override
  String get paywallTrialDisclaimer =>
      'ฟรี 3 วัน · จากนั้นต่ออายุอัตโนมัติ · ยกเลิกได้ทุกเมื่อ';

  @override
  String get paywallYearlyDisclaimer =>
      'ต่ออายุอัตโนมัติรายปี · ยกเลิกได้ทุกเมื่อ';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return 'ฟรี $days วัน จากนั้น $price/สัปดาห์ · ยกเลิกได้ทุกเมื่อ';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return 'ฟรี $days วัน จากนั้น $price/เดือน · ยกเลิกได้ทุกเมื่อ';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return 'ฟรี $days วัน จากนั้น $price/ปี · ยกเลิกได้ทุกเมื่อ';
  }

  @override
  String get paywallRenewsWeekly =>
      'ต่ออายุอัตโนมัติรายสัปดาห์ · ยกเลิกได้ทุกเมื่อ';

  @override
  String get paywallRenewsMonthly =>
      'ต่ออายุอัตโนมัติรายเดือน · ยกเลิกได้ทุกเมื่อ';

  @override
  String get resultCardTitle => 'ส่วนสูงตอนโตเต็มที่ที่คาดการณ์';

  @override
  String resultRange(String min, String max) {
    return 'ช่วงที่เป็นไปได้: $min ถึง $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'สูงกว่า $percent% ของคนวัยเดียวกัน';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'คาดว่าจะโตได้อีก: $amount';
  }

  @override
  String get resultFootnote =>
      'เป็นการประมาณจากส่วนสูงของพ่อแม่และข้อมูลกราฟการเติบโต ไม่ใช่คำแนะนำทางการแพทย์';

  @override
  String get postureCheckTitle => 'เช็กท่าทางแบบด่วน';

  @override
  String get postureCheckIntro =>
      'ยืนให้ส้นเท้า สะโพก และสะบักแนบผนัง แล้วตอบ 3 คำถาม คะแนนมาจากคำตอบของคุณ ส่วนรูปจะเก็บไว้เทียบก่อนและหลัง';

  @override
  String get postureQHead => 'ด้านหลังศีรษะแตะผนังได้โดยไม่ต้องเงยคางไหม?';

  @override
  String get postureQHeadA1 => 'ได้ แตะง่ายๆ';

  @override
  String get postureQHeadA2 => 'ได้ถ้าดันหัวไปข้างหลัง';

  @override
  String get postureQHeadA3 => 'ไม่ได้ มีช่องว่าง';

  @override
  String get postureQShoulders =>
      'ในรูปด้านข้าง ไหล่ของคุณอยู่ตรงไหนเมื่อเทียบกับหู?';

  @override
  String get postureQShouldersA1 => 'อยู่แนวเดียวกับหู';

  @override
  String get postureQShouldersA2 => 'อยู่หน้าหูนิดหน่อย';

  @override
  String get postureQShouldersA3 => 'ห่อไปข้างหน้าชัดเจน';

  @override
  String get postureQLowerBack => 'สอดมือไปหลังหลังส่วนล่าง มีช่องว่างแค่ไหน?';

  @override
  String get postureQLowerBackA1 => 'สอดมือแบนได้พอดี';

  @override
  String get postureQLowerBackA2 => 'ไม่มีช่องว่างเลย';

  @override
  String get postureQLowerBackA3 => 'สอดกำปั้นได้';

  @override
  String get postureCheckSave => 'ดูคะแนนของฉัน';

  @override
  String get postureCheckNote =>
      'เป็นการเช็กด้วยตัวเอง ไม่ใช่การประเมินทางการแพทย์';

  @override
  String get paywallTester => 'ผู้ทดสอบ';

  @override
  String get introTag1 => 'คาดการณ์';

  @override
  String get introTag2 => 'การเติบโต';

  @override
  String get introTag3 => 'ติดตามผล';

  @override
  String get introTag4 => 'เกมมิฟิเคชัน';

  @override
  String get introTag5 => 'คอมมูนิตี้';

  @override
  String get introTitle1 => 'ค้นพบศักยภาพ\nส่วนสูงของคุณ';

  @override
  String get introSubtitle1 =>
      'ให้เราคำนวณศักยภาพเต็มที่ของคุณ\nจากพันธุกรรม อายุ และไลฟ์สไตล์';

  @override
  String get introTitle2 => 'สูงขึ้นทีละก้าว\nทุกวัน';

  @override
  String get introSubtitle2 =>
      'ดึงศักยภาพของคุณออกมาด้วย\nแผนออกกำลังกายและโภชนาการเฉพาะตัว';

  @override
  String get introTitle3 => 'ติดตามทุก\nเซนติเมตร';

  @override
  String get introSubtitle3 => 'ดูความคืบหน้าจริงของคุณ\nผ่านการวัดทุกเดือน';

  @override
  String get introTitle4 => 'เลเวลอัป\nรับรางวัล';

  @override
  String get introSubtitle4 =>
      'ทำโปรแกรม 70 วันให้สำเร็จ\nสะสม XP และปลดล็อกเลเวลใหม่';

  @override
  String get introTitle5 => 'หลายพันคน\nสูงขึ้นแล้ว';

  @override
  String get introSubtitle5 =>
      'มาร่วมคอมมูนิตี้ของผู้ใช้\nที่ไปถึงเป้าหมายแล้ว';

  @override
  String get criticalWindow => 'ช่วงเวลาสำคัญ';

  @override
  String get heightPotentialFading => 'ความจริงเกี่ยวกับ';

  @override
  String get fadingAway => 'ศักยภาพส่วนสูงของคุณ..';

  @override
  String get painHookDesc =>
      'ทุกวันที่ผ่านไปโดยไม่มีนิสัยที่ถูกต้อง เซนติเมตรจะหายไปอย่างถาวร แต่ตอนนี้ยังพลิกกลับได้';

  @override
  String get painGeneticTitle => 'พันธุกรรมไม่ใช่ทุกอย่าง';

  @override
  String get painGeneticDesc =>
      'พันธุกรรมกำหนด 60% แต่สิ่งที่คุณทำกำหนดอีก 40% BeTaller มีไว้เพื่อ 40% นั้นแหละ';

  @override
  String get painGeneticTag => 'วิเคราะห์';

  @override
  String get painSleepTitle => 'ปรับกิจวัตรการนอนให้ดีที่สุด';

  @override
  String get painSleepDesc =>
      'การนอนที่ดีทุกคืนช่วยเพิ่มการสร้างโกรทฮอร์โมนได้ 70% BeTaller ติดตามการนอนให้อัตโนมัติ คุณแค่นอน';

  @override
  String get painSleepTag => 'ติดตามผล';

  @override
  String get painPostureTitle => 'ได้เซนติเมตรเพิ่มทันทีจากท่าทาง';

  @override
  String get painPostureDesc =>
      'ท่าทางที่ถูกต้องช่วยให้ดูสูงขึ้นทันที 1.5-3 cm กิจวัตรท่าทางประจำวันของ BeTaller ช่วยให้ทำได้จนติดตัวในไม่กี่สัปดาห์';

  @override
  String get painPostureTag => 'ท่าทาง';

  @override
  String get painExerciseTitle => 'แผนออกกำลังกายเฉพาะของคุณพร้อมแล้ว';

  @override
  String get painExerciseDesc =>
      'ยืดเหยียดตอนเช้า โหนบาร์ กิจวัตรกระดูกสันหลัง: BeTaller เตรียมและจัดตารางไว้ให้แล้ว แค่วันละ 8-12 นาที';

  @override
  String get painExerciseTag => 'กิจวัตร';

  @override
  String get painNutritionTitle => 'โภชนาการมีผลโดยตรงต่อการเติบโต';

  @override
  String get painNutritionDesc =>
      'โปรตีน แคลเซียม วิตามินดี: BeTaller เตือนคุณทุกวันว่าควรได้สารอาหารอะไรและเมื่อไร';

  @override
  String get painNutritionTag => 'โภชนาการ';

  @override
  String get painTrackingTitle => 'ติดตามการเติบโตด้วยตาตัวเอง';

  @override
  String get painTrackingDesc =>
      'การวัดทุกเดือน รูปความคืบหน้า กราฟการเติบโต: เห็นทุกเซนติเมตรที่เพิ่มขึ้น';

  @override
  String get painTrackingTag => 'ความคืบหน้า';

  @override
  String get selectYourGender => 'เลือกเพศของคุณ';

  @override
  String get onboardingPredictSubtitle =>
      'ข้อมูลนี้ใช้คาดการณ์ศักยภาพส่วนสูงและสร้างแผนเฉพาะของคุณ';

  @override
  String get other => 'อื่นๆ';

  @override
  String get whenWereYouBorn => 'คุณเกิดเมื่อไร?';

  @override
  String get heightAndWeight => 'ส่วนสูงและน้ำหนัก';

  @override
  String get parentsHeight => 'ส่วนสูงพ่อแม่';

  @override
  String get weeklyWorkout => 'ออกกำลังกายต่อสัปดาห์';

  @override
  String get workoutsPerWeek => 'ครั้งต่อสัปดาห์';

  @override
  String get whatsYourEthnicity => 'คุณมีเชื้อชาติอะไร?';

  @override
  String get whiteCaucasian => 'คนผิวขาว / คอเคเชียน';

  @override
  String get blackAfricanAmerican => 'คนผิวดำ / แอฟริกันอเมริกัน';

  @override
  String get hispanicLatino => 'ฮิสแปนิก / ลาติน';

  @override
  String get asian => 'เอเชีย';

  @override
  String get middleEasternIndigenous => 'ตะวันออกกลาง / ชนพื้นเมือง';

  @override
  String get dontWantToAnswer => 'ไม่ขอตอบ';

  @override
  String get footSizeLabel => 'ขนาดเท้า';

  @override
  String get selectYourSize => 'เลือกขนาดของคุณ';

  @override
  String get whatsYourDreamHeight => 'ส่วนสูงในฝันของคุณคือเท่าไร?';

  @override
  String get dreamHeightCalcSubtitle =>
      'จากข้อมูลของคุณ เราจะคำนวณโอกาสที่จะไปถึงส่วนสูงนี้';

  @override
  String get dreamHeightLabel => 'ส่วนสูงในฝัน';

  @override
  String get sleepQuestion => 'ปกติคุณนอน\nคืนละกี่ชั่วโมง?';

  @override
  String get thousandsSucceeded => 'หลายพันคน\nทำได้แล้ว';

  @override
  String get youCanToo => 'คุณก็ทำได้';

  @override
  String get yearsOld => 'ปี';

  @override
  String get verifiedLabel => 'ยืนยันแล้ว';

  @override
  String get scientificData => 'ข้อมูลทางวิทยาศาสตร์';

  @override
  String get longTermResults => 'BeTaller สร้าง\nผลลัพธ์ระยะยาว';

  @override
  String get longTermResultsSubtitle =>
      'หลายคนไปไม่ถึงส่วนสูงสูงสุดของตัวเองเพราะนิสัยที่ไม่ดี';

  @override
  String get yourFinalHeight => 'ส่วนสูงสุดท้ายของคุณ';

  @override
  String get badHabitsLegend => 'นิสัยไม่ดี';

  @override
  String get optimizedLegend => 'ปรับให้ดีแล้ว';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'ส่วนสูงเปลี่ยนได้\nด้วยนิสัย';

  @override
  String get chartFact2Pct => '9-10 ชม.';

  @override
  String get chartFact2Desc => 'การนอนที่ดีช่วยเพิ่ม\nโกรทฮอร์โมน';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'ได้เพิ่มจาก\nการปรับท่าทาง';

  @override
  String get didYouKnow => 'รู้หรือไม่?';

  @override
  String get didYouKnowFact1 => 'นิสัยประจำวันมีผลต่อส่วนสูง 30%';

  @override
  String get didYouKnowFact2 => 'แรงกดที่กระดูกสันหลังทำให้เตี้ยลง 1.5-3 cm';

  @override
  String get didYouKnowFact3 => 'การนอนไม่พอทำให้ HGH ลดลง 70%';

  @override
  String get transformJourneyBegins => 'เส้นทางการเปลี่ยนแปลง\nของคุณเริ่มแล้ว';

  @override
  String get transformJourneySubtitle =>
      'โปรแกรมครบวงจรที่ออกแบบมาเพื่อช่วย\nให้คุณเติบโตอย่างแข็งแรง ทีละขั้น';

  @override
  String get week1Label => '1 ส.';

  @override
  String get week1Title => 'สัปดาห์ที่ 1';

  @override
  String get week1Desc => 'แนวกระดูกสันหลังดีขึ้น ท่าทางดีขึ้น';

  @override
  String get month1Label => '1 ด.';

  @override
  String get month1Title => 'เดือนที่ 1';

  @override
  String get month1Desc => 'เห็นเซนติเมตรแรก คุณภาพการนอนดีขึ้น';

  @override
  String get month3Label => '3 ด.';

  @override
  String get month3Title => 'เดือนที่ 3';

  @override
  String get month3Desc => 'เพิ่มเฉลี่ย +1.5–2.5 cm กล้ามเนื้อพัฒนาขึ้น';

  @override
  String get month6Label => '6 ด.';

  @override
  String get month6Title => 'เดือนที่ 6';

  @override
  String get month6Desc => 'ไปถึงศักยภาพสูงสุด ใช้ชีวิตกับส่วนสูงใหม่';

  @override
  String get reachYourGoal => 'ไปให้ถึงเป้าหมาย';

  @override
  String get journeyBullet1 => 'ปลดล็อกศักยภาพสูงสุดของคุณ';

  @override
  String get journeyBullet2 => 'เริ่มใช้ชีวิตกับส่วนสูงใหม่';

  @override
  String get journeyBullet3 => 'เขียนเรื่องราวความสำเร็จของคุณ';

  @override
  String get unlockButton => 'ปลดล็อกทั้งหมด';

  @override
  String get dreamHeightOdds => 'โอกาสถึง\nส่วนสูงในฝัน';

  @override
  String get growthCompleteLabel => 'การเติบโต\nสำเร็จแล้ว';

  @override
  String get tallerThanPct => 'สูงกว่า 76.7% ของคนวัยเดียวกัน';

  @override
  String get levelNovice => 'มือใหม่';

  @override
  String get levelBuilder => 'นักสร้าง';

  @override
  String get levelGrinder => 'สายขยัน';

  @override
  String get levelWarrior => 'นักรบ';

  @override
  String get levelGodTier => 'ระดับเทพ';

  @override
  String get levelDesc0 => 'สร้างรากฐาน';

  @override
  String get levelDesc1 => 'เร่งการเติบโต';

  @override
  String get levelDesc2 => 'ฝึกให้หนักขึ้น';

  @override
  String get levelDesc3 => 'ก้าวข้ามขีดจำกัด';

  @override
  String get levelDesc4 => 'ไม่เหนื่อย ไม่ได้ผล';

  @override
  String get levelDesc5 => 'ใจแบบแชมป์';

  @override
  String get levelDesc6 => 'ผลงานระดับหัวกะทิ';

  @override
  String get levelDesc7 => 'ควบคุมร่างกายได้เต็มที่';

  @override
  String get levelDesc8 => 'วินัยระดับตำนาน';

  @override
  String get levelDesc9 => 'ศักยภาพสูงสุด';

  @override
  String levelLabel(int level) {
    return 'เลเวล $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return 'เหลืออีก $_temp0 ในโปรแกรมของคุณ';
  }

  @override
  String get tapLabel => 'แตะ';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'วัน';

  @override
  String get legendShort => 'เตี้ย';

  @override
  String get legendBelowAvg => 'ต่ำกว่าเฉลี่ย';

  @override
  String get legendAverage => 'เฉลี่ย';

  @override
  String get legendTall => 'สูง';

  @override
  String get legendVeryTall => 'สูงมาก';

  @override
  String get pctBottom5 => 'ต่ำสุด 5%';

  @override
  String get pctBottom25 => 'ต่ำสุด 25%';

  @override
  String get pctMedian => 'ค่ากลาง';

  @override
  String get pctTop25 => 'สูงสุด 25%';

  @override
  String get pctTop5 => 'สูงสุด 5%';

  @override
  String get fallingBehind => 'กำลังตามหลัง';

  @override
  String readTimeMinutes(int minutes) {
    return 'อ่าน $minutes นาที';
  }

  @override
  String get inThisArticle => 'ในบทความนี้';

  @override
  String get nextArticle => 'บทความถัดไป';

  @override
  String get purchaseUnavailable =>
      'ทำรายการซื้อไม่สำเร็จ กรุณาลองใหม่อีกครั้ง';

  @override
  String get viewPlan => 'ดูแพ็กเกจ';

  @override
  String get viewPlanSubtitle => 'ดูรายละเอียดการสมัครสมาชิกของคุณ';

  @override
  String predictionConfidenceHint(String percent) {
    return 'เพิ่มการวัดส่วนสูงเพื่อให้การคาดการณ์แม่นถึง $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'ทั้งวันของคุณ ในหน้าเดียว';

  @override
  String get paywallSlideHomeCaption => 'กิจวัตร น้ำ การนอน: ปิดให้ครบ 3 วง';

  @override
  String get paywallSlideProgressTitle => 'เห็นทุกเซนติเมตร';

  @override
  String get paywallSlideProgressCaption => 'ทุกการวัดขึ้นกราฟทันที';

  @override
  String get paywallSlideAnalysisTitle => '5 ตัวชี้วัด ในภาพเดียว';

  @override
  String get paywallSlideAnalysisCaption => 'กราฟเรดาร์บอกจุดอ่อนที่สุดของคุณ';

  @override
  String get paywallSlidePotentialTitle => 'รู้ศักยภาพของคุณ';

  @override
  String get paywallSlidePotentialCaption =>
      'ดูว่าคุณอยู่ตรงไหนเมื่อเทียบกับเพื่อนวัยเดียวกัน';

  @override
  String get paywallSlideDisciplineTitle => 'รักษาความต่อเนื่อง';

  @override
  String get paywallSlideDisciplineCaption => 'ทุกวันช่วยดันเลเวลของคุณขึ้น';

  @override
  String get paywallSlideRemindersTitle => 'เตือนในเวลาที่ใช่';

  @override
  String get paywallSlideRemindersCaption => 'ตั้งเวลาเอง ที่เหลือแอปจัดการให้';

  @override
  String get paywallSlidePostureTitle => 'แก้ท่าทางของคุณ';

  @override
  String get paywallSlidePostureCaption =>
      'รูปด้านข้าง เช็กด้วยตัวเองแบบด่วน และกิจวัตรที่ชัดเจน';

  @override
  String paywallTrialHeadline(String days) {
    return 'ฟรี $days วัน';
  }

  @override
  String paywallTrialThen(String price) {
    return 'จากนั้น $price · ยกเลิกได้ทุกเมื่อ';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / ปี · ยกเลิกได้ทุกเมื่อ';
  }

  @override
  String get obBedtimeTitle => 'ปกติคุณเข้านอนกี่โมง?';

  @override
  String get obBedtimeSubtitle => 'เราจะตั้งการเตือนเข้านอนไว้ใกล้ๆ เวลานี้';

  @override
  String get obWorkoutTimeTitle => 'คุณออกกำลังกายกี่โมง?';

  @override
  String get obWorkoutTimeSubtitle => 'เพื่อให้การเตือนฝึกซ้อมมาตรงเวลาพอดี';

  @override
  String get obMealsTitle => 'วันละกี่มื้อ?';

  @override
  String get obMealsSubtitle => 'แตะที่เวลาเพื่อปรับให้เข้ากับกิจวัตรของคุณ';

  @override
  String obMealsCount(String count) {
    return '$count มื้อ';
  }

  @override
  String obMealLabel(String n) {
    return 'มื้อที่ $n';
  }

  @override
  String get obProteinTitle => 'วันละกี่กรัมโปรตีน?';

  @override
  String get obProteinSubtitle => 'ตัวเลขคร่าวๆ ก็พอ เราจะสร้างแผนจากตรงนั้น';

  @override
  String get obCaloriesTitle => 'เฉลี่ยวันละกี่แคลอรี่?';

  @override
  String get obCaloriesSubtitle =>
      'ประมาณเอาก็ได้ เราค่อยปรับให้แม่นขึ้นด้วยกันทีหลัง';

  @override
  String get obNotSure => 'ไม่แน่ใจ';

  @override
  String get silNow => 'ตอนนี้';

  @override
  String get silPotential => 'ศักยภาพ';

  @override
  String get chartMeasured => 'การวัดของคุณ';

  @override
  String chartPotential(String height) {
    return 'ศักยภาพ $height';
  }

  @override
  String chartDream(String height) {
    return 'เป้าหมายของคุณ $height';
  }

  @override
  String get targetsTitle => 'วันนี้ สำหรับคุณ';

  @override
  String get targetsSubtitle => 'คำนวณจากอายุ น้ำหนัก และการฝึกของคุณ';

  @override
  String get targetProtein => 'โปรตีน';

  @override
  String get targetCalcium => 'แคลเซียม';

  @override
  String get targetVitaminD => 'วิตามินดี';

  @override
  String get targetWater => 'น้ำ';

  @override
  String get targetSleep => 'การนอน';

  @override
  String get targetMove => 'การฝึก';

  @override
  String targetPerMeal(String g) {
    return '$g g ต่อมื้อ';
  }

  @override
  String get unitHours => 'ชม.';

  @override
  String get unitMinutes => 'นาที';

  @override
  String get planStrength => 'เวทเทรนนิ่ง';

  @override
  String get planJump => 'กระโดดและสปรินต์';

  @override
  String get planMobility => 'ยืดเหยียด';

  @override
  String get planSport => 'กีฬา';

  @override
  String get planPosture => 'ท่าทาง';

  @override
  String get planRest => 'พัก';

  @override
  String planWeekTitle(int days) {
    return 'สัปดาห์ของคุณ: ฝึก $days วัน';
  }

  @override
  String get planPreviewTitle => 'แผนของคุณพร้อมแล้ว';

  @override
  String planPreviewTraining(int days) {
    return 'ฝึกสัปดาห์ละ $days วัน ออกแบบเพื่อการเติบโต';
  }

  @override
  String planPreviewProtein(int grams) {
    return 'โปรตีนวันละ $grams g แบ่งไปในแต่ละมื้อ';
  }

  @override
  String planPreviewSleep(String hours) {
    return 'นอน $hours ชั่วโมง พร้อมการเตือนเข้านอน';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'วันนี้: $plan · $minutes นาที';
  }

  @override
  String get nRestTitle => 'วันนี้เป็นวันพัก';

  @override
  String get nRestBody =>
      'ยืดเหยียดสิบนาทีก็พอ การฟื้นตัวก็เป็นส่วนหนึ่งของแผน';

  @override
  String nProteinTitle(int grams) {
    return 'เป้าโปรตีนวันนี้: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'ประมาณ $grams g ต่อมื้อ: ไข่ โยเกิร์ต ไก่ ถั่วเลนทิล';
  }

  @override
  String nWaterTitle(String liters) {
    return 'เป้าหมายน้ำ: $liters';
  }

  @override
  String get nWaterBody => 'ดื่มสักแก้วตอนนี้ วันนี้ก็ยังอยู่ในเส้นทาง';

  @override
  String get nSleepTitle => 'ได้เวลาผ่อนคลายแล้ว';

  @override
  String nSleepBody(String hours) {
    return 'เป้าหมายของคุณคือ $hours ชั่วโมง ปิดจอ หรี่ไฟ';
  }

  @override
  String nMeasureBody(String potential) {
    return 'ศักยภาพของคุณ: $potential วัดตอนเช้าแล้วดูกราฟขยับ';
  }

  @override
  String get nTrialDay1Title => 'แผนของคุณรออยู่';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'วันนี้: $plan $minutes นาที บันทึกส่วนสูงเพื่อเริ่มกราฟของคุณ';
  }

  @override
  String get nTrialEndTitle => 'ช่วงทดลองใช้ฟรีจะหมดพรุ่งนี้';

  @override
  String nTrialEndBody(String price) {
    return 'จากนั้นจะต่อที่ $price แผนและความคืบหน้าของคุณยังถูกบันทึกไว้ไม่ว่าจะเลือกอะไร';
  }

  @override
  String get trophyContinue => 'ไปต่อ';

  @override
  String get guideSteps => 'ทีละขั้นตอน';

  @override
  String get guideMistakes => 'ข้อผิดพลาดที่พบบ่อย';

  @override
  String get guideTip => 'เคล็ดลับ';

  @override
  String get homeHeroTitle => 'ส่วนสูงและศักยภาพของคุณ';

  @override
  String homeHeroGap(String cm) {
    return 'ยังมีอีก $cm รออยู่ข้างหน้า';
  }

  @override
  String get anSubtitle => 'คะแนนของคุณ อะไรทำให้มันขยับ และคุณกำลังไปทางไหน';

  @override
  String get anScoreLabel => 'คะแนน BeTaller';

  @override
  String get anTierStarting => 'เริ่มต้น';

  @override
  String get anTierBuilding => 'กำลังสร้าง';

  @override
  String get anTierRising => 'กำลังขึ้น';

  @override
  String get anTierStrong => 'แข็งแกร่ง';

  @override
  String get anTierPeak => 'สูงสุด';

  @override
  String anTrendUp(int n) {
    return '+$n เทียบสัปดาห์ก่อน';
  }

  @override
  String anTrendDown(int n) {
    return '-$n เทียบสัปดาห์ก่อน';
  }

  @override
  String get anTrendFlat => 'เท่ากับสัปดาห์ก่อน';

  @override
  String get anTrendFirst => 'แนวโน้มรายสัปดาห์จะเริ่มสัปดาห์หน้า';

  @override
  String anNextTier(int n, String tier) {
    return 'อีก $n คะแนนถึง $tier';
  }

  @override
  String get anTopTier => 'ระดับสูงสุดแล้ว รักษาไว้นะ';

  @override
  String anCoverage(int n, int total) {
    return 'อิงจาก $n จาก $total ตัวชี้วัด';
  }

  @override
  String get anNoScoreTitle => 'ข้อมูลยังไม่พอ';

  @override
  String get anNoScoreBody =>
      'บันทึกการนอน น้ำ หรือการฝึกสักครั้งวันนี้ แล้วคะแนนแรกจะปรากฏ';

  @override
  String get anFastestWin => 'ทางลัดที่เร็วที่สุด';

  @override
  String get anBreakdownTitle => 'อะไรสร้างคะแนนของคุณ';

  @override
  String get anBreakdownHint =>
      'แต่ละตัวชี้วัดได้คะแนน 0 ถึง 100 จากข้อมูลของคุณเอง เปอร์เซ็นต์คือน้ำหนักที่นับ';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'ยังไม่มีข้อมูล';

  @override
  String get anNotCounted => 'ไม่นับ';

  @override
  String get anFTraining => 'การฝึก';

  @override
  String get anFConsistency => 'ความสม่ำเสมอ';

  @override
  String get anFSleep => 'การนอน';

  @override
  String get anFHydration => 'การดื่มน้ำ';

  @override
  String get anFNutrition => 'โภชนาการ';

  @override
  String get anFPosture => 'ท่าทาง';

  @override
  String get anFMeasuring => 'การวัด';

  @override
  String get anFGrowth => 'ความเร็วการเติบโต';

  @override
  String get anFHeadroom => 'พื้นที่ให้โต';

  @override
  String anBTraining(int done, int planned) {
    return 'ฝึก $done จาก $planned วันที่วางแผนไว้ใน 7 วันที่ผ่านมา';
  }

  @override
  String get anBTrainingNone => 'นับวันที่คุณฝึกเทียบกับแผนรายสัปดาห์';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak วัน',
    );
    return 'ต่อเนื่อง $_temp0 ทำแผนได้ครึ่งหนึ่ง $active จาก $days วัน';
  }

  @override
  String get anBConsistencyNone =>
      'นับความต่อเนื่องและวันที่คุณทำแผนได้อย่างน้อยครึ่งหนึ่ง';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days คืน',
    );
    return 'เฉลี่ยคืนละ $hours ชม. เป้าหมาย $target ชม. บันทึกแล้ว $_temp0';
  }

  @override
  String get anBSleepNone => 'ไม่มีบันทึกการนอนใน 7 วันที่ผ่านมา';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return 'เฉลี่ยวันละ $litres เป้าหมาย $target บันทึกแล้ว $_temp0';
  }

  @override
  String get anBHydrationNone => 'ไม่มีบันทึกการดื่มน้ำใน 7 วันที่ผ่านมา';

  @override
  String anBNutrition(int done, int planned) {
    return 'ทำนิสัยโภชนาการ $done จาก $planned ใน 7 วันที่ผ่านมา';
  }

  @override
  String get anBNutritionNone =>
      'นับนิสัยด้านโปรตีน แคลเซียม สังกะสี และวิตามินดีในแผนของคุณ';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return 'เช็กด้วยตัวเองที่ผนัง $raw/90 เมื่อ $_temp0ก่อน';
  }

  @override
  String anBPostureToday(int raw) {
    return 'เช็กด้วยตัวเองที่ผนัง $raw/90 วันนี้';
  }

  @override
  String get anBPostureNone => 'ยังไม่ได้เช็กท่าทางด้วยตัวเอง';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return 'วัดล่าสุดเมื่อ $_temp0ก่อน';
  }

  @override
  String get anBMeasuringToday => 'วัดแล้ววันนี้';

  @override
  String get anBMeasuringNone => 'ยังไม่มีการวัด';

  @override
  String anBGrowth(String v, String e) {
    return 'ปีละ $v ปกติในวัยคุณคือ $e';
  }

  @override
  String get anBGrowthNone => 'ต้องมีการวัด 2 ครั้งที่ห่างกันอย่างน้อย 30 วัน';

  @override
  String get anBGrowthAdult =>
      'แผ่นการเจริญเติบโตมักปิดภายในอายุ 21 ความเร็วการเติบโตจึงไม่นับสำหรับคุณ';

  @override
  String anBHeadroom(String cm) {
    return 'อีก $cm จากวันนี้ถึงศักยภาพของคุณ';
  }

  @override
  String get anATraining => 'เริ่มการฝึกวันนี้';

  @override
  String get anAConsistency => 'ทำแผนวันนี้ให้ได้ครึ่งหนึ่ง';

  @override
  String get anASleepLog => 'บันทึกการนอนเมื่อคืน';

  @override
  String anASleep(String target) {
    return 'คืนนี้นอน $target ชม.';
  }

  @override
  String get anAHydrationLog => 'บันทึกน้ำหนึ่งแก้ว';

  @override
  String anAHydration(String left) {
    return 'วันนี้ดื่มเพิ่มอีก $left';
  }

  @override
  String get anAHydrationDone => 'วันนี้ถึงเป้าแล้ว พรุ่งนี้ทำอีกนะ';

  @override
  String get anANutrition => 'ติ๊กนิสัยโภชนาการวันนี้';

  @override
  String get anAPostureFirst => 'เช็กท่าทางด้วยตัวเอง 1 นาที';

  @override
  String get anAPostureRedo => 'เช็กท่าทางด้วยตัวเองอีกครั้ง';

  @override
  String get anAPostureKeep => 'ทำกิจวัตรท่าทางประจำวันต่อไป';

  @override
  String get anAMeasure => 'วัดส่วนสูงตอนนี้เลย';

  @override
  String get anAMeasureKeep => 'วัดอีกครั้งสัปดาห์หน้า';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return 'วัดอีกครั้งใน $_temp0';
  }

  @override
  String get anAGrowth => 'วัดทุก 2 สัปดาห์เพื่อติดตาม';

  @override
  String get anAHeadroom => 'ดูศักยภาพของคุณ';

  @override
  String get anPotentialTitle => 'ศักยภาพของคุณ';

  @override
  String get anPotentialLabel => 'ส่วนสูงตอนโตเต็มที่ที่คาดการณ์';

  @override
  String anPotentialToGo(String cm) {
    return 'อีก +$cm';
  }

  @override
  String get anPotentialReached => 'คุณถึงส่วนสูงที่คาดการณ์แล้ว';

  @override
  String get anPotentialNote =>
      'ตัวเลขเดียวกันทุกที่ในแอป และจะขยับขึ้นเท่านั้น';

  @override
  String anDreamLine(String h) {
    return 'เป้าหมายของคุณ: $h';
  }

  @override
  String get anSourcesTitle => 'เซนติเมตรมาจากไหน';

  @override
  String get anSourcesGenes => 'พันธุกรรมและอายุ';

  @override
  String get anSourcesHabits => 'การนอน อาหาร การฝึก';

  @override
  String get anSourcesPosture => 'ท่าทาง';

  @override
  String get anPctTitle => 'ส่วนสูงตามวัยของคุณ';

  @override
  String anPctValue(int p) {
    return 'สูงกว่า $p% ของคนวัยเดียวกัน';
  }

  @override
  String get anPctBasis => 'กราฟการเติบโต CDC สหรัฐฯ อายุและเพศเดียวกัน';

  @override
  String get anPctMore => 'ดูการเปรียบเทียบทั้งหมด';

  @override
  String get anNeedsBasis => 'คำนวณจากอายุ น้ำหนัก และการฝึกของคุณ';

  @override
  String get anCalcium => 'แคลเซียม';

  @override
  String get anVitaminD => 'วิตามินดี';

  @override
  String get anMovement => 'การเคลื่อนไหว';

  @override
  String get anUnitMin => 'นาที';

  @override
  String get anUnitHours => 'ชม.';

  @override
  String get anPerDay => 'ต่อวัน';

  @override
  String get anPerNight => 'ต่อคืน';

  @override
  String get anUnlockScoreTitle => 'คะแนน BeTaller แบบเต็มของคุณ';

  @override
  String get anUnlockScoreBody =>
      'คะแนน ตัวชี้วัดทั้ง 9 เบื้องหลัง และสิ่งที่ควรทำต่อ';

  @override
  String get anUnlockSourcesTitle => 'ดูว่าเซนติเมตรของคุณมาจากไหน';

  @override
  String get anUnlockNeedsTitle => 'ความต้องการต่อวันที่คำนวณไว้ให้คุณ';

  @override
  String get anUnlockCta => 'ปลดล็อก';

  @override
  String get anFlowResultTitle => 'บันทึกลงกราฟแล้ว';

  @override
  String get anFlowResultBody =>
      'ส่วนสูงในอดีตของคุณอยู่บนเส้นกราฟเดียวกับการวัดและศักยภาพแล้ว';

  @override
  String get anFlowOpenAnalysis => 'เปิดการวิเคราะห์ของคุณ';

  @override
  String anTopPct(int p) {
    return 'TOP $p%';
  }

  @override
  String get anNeedsTitle => 'ความต้องการต่อวันของคุณ';

  @override
  String get pgUnlockPro => 'ปลดล็อกด้วย Pro';

  @override
  String get pgPhotosLockedTitle => 'ดูการเปลี่ยนแปลงของคุณ';

  @override
  String get pgPhotosLockedBody =>
      'บันทึกรูปพร้อมส่วนสูงทุกสองสัปดาห์ แล้วเทียบสองรูปใดก็ได้ด้วยแถบเลื่อน';

  @override
  String get pgTransformationTitle => 'การเปลี่ยนแปลงของคุณ';

  @override
  String get pgHeightChange => 'ส่วนสูงที่เปลี่ยน';

  @override
  String get pgDaysApart => 'วันที่ห่างกัน';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return 'ต่างกัน $delta ระหว่างสองรูปนี้ ที่ถ่ายห่างกัน $_temp0';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return 'ส่วนสูงเท่าเดิม ห่างกัน $_temp0 ท่าทางและรูปร่างจะเปลี่ยนก่อน ส่วนสูงตามมาในหลายเดือน';
  }

  @override
  String get pgModeSlider => 'แถบเลื่อน';

  @override
  String get pgModeSideBySide => 'วางคู่กัน';

  @override
  String get pgDragToReveal => 'ลากเพื่อเปรียบเทียบ';

  @override
  String get pgOnePhotoTitle => 'บันทึกรูปก่อนแล้ว';

  @override
  String pgOnePhotoBody(String date) {
    return 'ถ่ายรูปถัดไปวันที่ $date ในท่าเดิม เพื่อดูการเปรียบเทียบครั้งแรก';
  }

  @override
  String get pgEmptyTitle => 'เริ่มการเปลี่ยนแปลงของคุณ';

  @override
  String get pgEmptyBody =>
      'ถ่ายรูปทุกสองสัปดาห์ ท่าเดิม ที่เดิม พร้อมส่วนสูงของคุณ ผ่านไปไม่กี่เดือนคุณจะเลื่อนดูได้ตั้งแต่วันแรกจนถึงวันนี้';

  @override
  String get pgTakeFirstPhoto => 'ถ่ายรูปแรกของคุณ';

  @override
  String get pgPhotoDueNow => 'ถึงเวลาถ่ายรูปใหม่';

  @override
  String pgNextPhotoOn(String date) {
    return 'รูปถัดไป $date';
  }

  @override
  String pgDayN(int n) {
    return 'วันที่ $n';
  }

  @override
  String get pgNewPhoto => 'รูปใหม่';

  @override
  String get pgGuideTitle => 'ท่าเดิมทุกครั้ง';

  @override
  String get pgGuideSubtitle => 'รูปจะเทียบกันได้ดีก็ต่อเมื่อถ่ายแบบเดียวกัน';

  @override
  String get pgGuideGhost => 'รูปล่าสุดจะแสดงจางๆ จัดตัวให้ตรงกับรูปนั้น';

  @override
  String get pgGuideStep1 => 'ยืนห่าง 2 m ถือมือถือระดับอก';

  @override
  String get pgGuideStep2 => 'หันหน้าเข้ากล้อง เท้าชิด ปล่อยแขนสบายๆ';

  @override
  String get pgGuideStep3 => 'ที่เดิม แสงเดิม เสื้อผ้าพอดีตัว';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'ระดับอก';

  @override
  String get pgTakePhoto => 'ถ่ายรูป';

  @override
  String get pgFromGallery => 'เลือกจากแกลเลอรี';

  @override
  String get pgChoosePhoto => 'เลือกรูป';

  @override
  String get pgPostureTitle => 'เช็กท่าทาง';

  @override
  String get pgPostureLockedTitle => 'หาจุดอ่อนของคุณ';

  @override
  String get pgPostureLockedBody =>
      'ให้คะแนนศีรษะ ไหล่ และหลังส่วนล่าง รับท่าออกกำลัง 2 ท่าสำหรับแต่ละส่วน และดูคะแนนทีละสัปดาห์';

  @override
  String get pgAreaHead => 'ศีรษะ';

  @override
  String get pgAreaShoulders => 'ไหล่';

  @override
  String get pgAreaLowerBack => 'หลังส่วนล่าง';

  @override
  String get pgHeadMeaning0 =>
      'ศีรษะอยู่ตรงเหนือไหล่พอดี รักษาไว้ด้วยการรีเซ็ตสั้นๆ ทุกวัน';

  @override
  String get pgHeadMeaning1 =>
      'ศีรษะยื่นไปข้างหน้าเวลาผ่อนคลาย พบบ่อยมากในคนที่ใช้มือถือนาน และแก้ได้เร็ว';

  @override
  String get pgHeadMeaning2 =>
      'ศีรษะอยู่หน้าไหล่ แก้ตรงนี้ก่อน: มันทำให้คุณดูเตี้ยลงในทุกรูป';

  @override
  String get pgShouldersMeaning0 =>
      'ไหล่อยู่แนวเดียวกับหู หลังส่วนบนทำงานได้ดี';

  @override
  String get pgShouldersMeaning1 =>
      'ไหล่ยื่นไปข้างหน้าเล็กน้อย กล้ามอกที่ตึงดึงไหล่เข้ามา การเปิดอกจะช่วยดึงกลับ';

  @override
  String get pgShouldersMeaning2 =>
      'ไหล่ห่อ หลังส่วนบนโค้งไปข้างหน้า ทำให้คุณยืนดูเตี้ยลง';

  @override
  String get pgLowerBackMeaning0 =>
      'แนวโค้งปกติ สะโพกและแกนกลางลำตัวประคองกระดูกสันหลังไว้ในตำแหน่งที่ควรเป็น';

  @override
  String get pgLowerBackMeaning1 =>
      'หลังส่วนล่างแบนราบ การแอ่นหลังเบาๆ และการเพิ่มความคล่องตัวจะช่วยคืนแนวโค้งตามธรรมชาติ';

  @override
  String get pgLowerBackMeaning2 =>
      'หลังแอ่นมาก กล้ามเนื้องอสะโพกที่ตึงดึงเชิงกรานให้เอียงไปข้างหน้า การยืดกล้ามเนื้อนี้และแกนกลางลำตัวที่แข็งแรงขึ้นจะช่วยปรับให้สมดุล';

  @override
  String get pgLegacyMeaning =>
      'บันทึกจากเวอร์ชันเก่าที่ยังไม่มีคำถามเหล่านี้ เช็กใหม่อีกครั้งเพื่อรับคำแนะนำสำหรับส่วนนี้';

  @override
  String get pgHowItWorks => 'การเช็กทำงานอย่างไร';

  @override
  String get pgYourPosture => 'ท่าทางของคุณ';

  @override
  String pgCheckedOn(String date) {
    return 'เช็กเมื่อ $date';
  }

  @override
  String get pgOutOf100 => 'จาก 100';

  @override
  String get pgAllAreasGood => 'ทั้ง 3 ส่วนดูดี รักษาไว้แบบนี้นะ';

  @override
  String pgStartWith(String area) {
    return 'เริ่มตรงนี้: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta เทียบครั้งก่อน';
  }

  @override
  String get pgStatusGood => 'ดี';

  @override
  String get pgStatusFair => 'ดีขึ้นได้อีก';

  @override
  String get pgStatusFix => 'แก้ก่อน';

  @override
  String get pgKeepItWith => 'รักษาไว้ด้วย';

  @override
  String get pgFixItWith => 'แก้ด้วย';

  @override
  String get pgRetakeNow => 'ถึงเวลาเช็กประจำสัปดาห์แล้ว';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'เช็กครั้งถัดไปในอีก $n วัน',
      one: 'เช็กครั้งถัดไปพรุ่งนี้',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'ผนังเดิม 3 คำถามเดิม การเช็กทุกสัปดาห์จะบอกว่าท่าออกกำลังได้ผลไหม';

  @override
  String pgRetakeBodyWait(String date) {
    return 'ทำท่าออกกำลังด้านบนไปจนถึง $date แล้วเช็กใหม่เพื่อดูว่าได้ผลไหม';
  }

  @override
  String get pgRetakeCheck => 'เช็กใหม่';

  @override
  String get pgRetakeAnyway => 'เช็กใหม่ตอนนี้';

  @override
  String get pgHistoryTitle => 'คะแนนของคุณ';

  @override
  String pgSinceFirst(String delta) {
    return '$delta จากครั้งแรก';
  }

  @override
  String get pgHistoryOne =>
      'นี่คือการเช็กครั้งแรกของคุณ เช็กใหม่ในอีก 7 วัน แล้วแนวโน้มจะเริ่มจากตรงนี้';

  @override
  String get pgPostureIntroTitle => 'คุณยืนตรงแค่ไหน?';

  @override
  String get pgPostureIntroBody =>
      '3 คำถามกับผนัง ใช้เวลาประมาณ 1 นาที คุณจะได้คะแนนและท่าออกกำลัง 2 ท่าที่แก้จุดอ่อนแต่ละจุด';

  @override
  String get pgPostureStep1 => 'ยืนให้ส้นเท้า สะโพก และสะบักแนบผนัง';

  @override
  String get pgPostureStep2 =>
      'ถ่ายรูปด้านข้างให้เห็นเต็มตัว เพื่อย้อนกลับมาดูทีหลัง';

  @override
  String get pgPostureStep3 => 'ตอบ 3 คำถามตามจริง คะแนนมาจากคำตอบของคุณ';

  @override
  String get pgPostureStep4 => 'เช็กใหม่สัปดาห์ละครั้ง ในช่วงเวลาเดิมของวัน';

  @override
  String get pgStartCheck => 'เริ่มเช็กท่าทาง';

  @override
  String pgWeekRange(String start, String end) {
    return '$start ถึง $end';
  }

  @override
  String get pgGradeGreat => 'สัปดาห์ระดับแชมป์';

  @override
  String get pgGradeGood => 'สัปดาห์ที่มั่นคง';

  @override
  String get pgGradeOk => 'กำลังเข้าที่';

  @override
  String get pgGradeStart => 'เริ่มต้นใหม่';

  @override
  String get pgTopWeek => 'สัปดาห์ที่ดีที่สุด';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta เทียบสัปดาห์ก่อน';
  }

  @override
  String get pgDaysCompleted => 'วันที่ทำแผนครบ';

  @override
  String get pgDayStreak => 'วันต่อเนื่อง';

  @override
  String pgBestDay(String day) {
    return 'ดีที่สุด: $day';
  }

  @override
  String get pgNextWeekFocus => 'โฟกัสสัปดาห์หน้า';

  @override
  String pgFocusPlan(int n, int done) {
    return 'ทำแผนให้ครบ $n วัน สัปดาห์นี้คุณทำได้ $done วัน';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'ฝึกให้ได้ $n ครั้ง สัปดาห์นี้คุณทำได้ $done ครั้ง';
  }

  @override
  String get pgFocusMeasure =>
      'วัดส่วนสูงหนึ่งครั้ง ตอนเช้า เท้าเปล่า ที่เดิม แบบนี้จะเห็นการเปลี่ยนแปลงจริง';

  @override
  String pgFocusKeepDay(String day) {
    return 'ทำได้ทุกเป้าหมายแล้ว ทีนี้ทำให้ $day ครบทั้งวันด้วย';
  }

  @override
  String get pgFocusKeep => 'ทำได้ทุกเป้าหมายและครบทุกวัน แผนเดิม จังหวะเดิม';

  @override
  String get pgHeightThisWeek => 'ส่วนสูงสัปดาห์นี้';

  @override
  String pgHeightNow(String height) {
    return 'ตอนนี้ $height';
  }

  @override
  String get pgNoMeasurementWeek => 'สัปดาห์นี้ยังไม่มีการวัด';

  @override
  String get pgFirstMeasurement => 'การวัดครั้งแรกของคุณ';

  @override
  String pgStartedAt(String height) {
    return 'เริ่มต้น $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'ศักยภาพ $height';
  }

  @override
  String pgToPotential(String cm) {
    return 'อีก $cm ถึงศักยภาพที่คาดการณ์';
  }

  @override
  String get pgPotentialReached =>
      'คุณถึงศักยภาพที่คาดการณ์แล้ว การฝึกท่าทางยังช่วยให้ดูสูงขึ้นได้อีก';

  @override
  String get pgHabitsToday => 'บันทึกวันนี้';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves ท่า · $minutes นาที';
  }

  @override
  String plDoneCount(int done, int total) {
    return 'เสร็จ $done/$total';
  }

  @override
  String get plStartWorkout => 'เริ่มฝึก';

  @override
  String get plContinueWorkout => 'ฝึกต่อ';

  @override
  String get plWorkoutDoneToday => 'ฝึกวันนี้เสร็จแล้ว';

  @override
  String get plTraining => 'การฝึก';

  @override
  String get plHabits => 'นิสัยประจำวัน';

  @override
  String get plRestDayNote =>
      'วันสบายๆ: โยคะสั้นๆ ช่วยให้ร่างกายไม่ตึงสำหรับพรุ่งนี้';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps ครั้ง';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds วิ';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds วิ ข้างละ';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes นาที';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g แบ่งในแต่ละมื้อ';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters ตลอดวัน';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours ชม. คืนนี้';
  }

  @override
  String get plYourRoutines => 'กิจวัตรของคุณ';

  @override
  String get plNewRoutine => 'กิจวัตรใหม่';

  @override
  String get plCustomEmpty => 'สร้างกิจวัตรของคุณเอง แล้วติ๊กที่นี่ทุกวัน';

  @override
  String plDeleteRoutineQ(String name) {
    return 'ลบ \"$name\"?';
  }

  @override
  String get plHoldToDelete => 'กดค้างที่กิจวัตรเพื่อลบ';

  @override
  String plSetOf(int current, int total) {
    return 'เซ็ต $current จาก $total';
  }

  @override
  String get plRest => 'พัก';

  @override
  String get plStartSet => 'เริ่มเซ็ต';

  @override
  String get plSetDone => 'เซ็ตเสร็จ';

  @override
  String get plSkipRest => 'ข้ามการพัก';

  @override
  String get plNextMove => 'ท่าถัดไป';

  @override
  String get plSkipMove => 'ข้าม';

  @override
  String plUpNext(String name) {
    return 'ถัดไป: $name';
  }

  @override
  String get plLastMove => 'ท่าสุดท้าย';

  @override
  String get plWorkoutComplete => 'ฝึกเสร็จแล้ว';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves ท่าในประมาณ $minutes นาที ทุกครั้งมีความหมาย';
  }

  @override
  String get plEachSide => 'ข้างละ';

  @override
  String get plMoveDone => 'ท่านี้เสร็จ';

  @override
  String plRepsBig(int reps) {
    return '$reps ครั้ง';
  }

  @override
  String get plSessionHint => 'ทำตามจังหวะของคุณเอง แล้วแตะเสร็จเมื่อทำจบ';

  @override
  String plProgramDayOf(int day, int total) {
    return 'วันที่ $day จาก $total';
  }

  @override
  String get plTodayStep => 'ก้าวของวันนี้';

  @override
  String get plTickToComplete => 'ติ๊กทุกท่าเพื่อทำวันนี้ให้สำเร็จ';

  @override
  String plNextDayTomorrow(int day) {
    return 'วันที่ $day จะเปิดพรุ่งนี้ การพักก็เป็นส่วนหนึ่งของการเติบโต';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days วัน',
    );
    return 'อีก $_temp0 ถึงเลเวล $level';
  }

  @override
  String get plProgramFinished => 'ครบทั้ง 70 วันแล้ว คุณทำโปรแกรมสำเร็จ';

  @override
  String plDayCompleteToast(int day) {
    return 'วันที่ $day สำเร็จ';
  }

  @override
  String get plLevelWeek => 'สัปดาห์ของเลเวลนี้';

  @override
  String get plProgressionTitle => 'ความยากเพิ่มขึ้นอย่างไร';

  @override
  String get plNow => 'ตอนนี้';

  @override
  String plLevelN(int n) {
    return 'Lv $n';
  }

  @override
  String get plUnlockProgram => 'ปลดล็อกโปรแกรม 70 วัน';

  @override
  String get plProgramPitch =>
      '10 เลเวล สัปดาห์ละเลเวล แต่ละเลเวลเพิ่มวินาทีให้ท่าค้าง เพิ่มจำนวนครั้งให้ท่ากระโดด และเพิ่มเซ็ตเมื่อคุณพร้อม';

  @override
  String plDayLocked(int day) {
    return 'ทำวันที่ $day ให้เสร็จก่อน';
  }

  @override
  String plCurrentDay(int day) {
    return 'วันที่ $day';
  }

  @override
  String get plTodaysTargets => 'เป้าหมายวันนี้';

  @override
  String get plTargetsBasis => 'คำนวณจากอายุ น้ำหนัก และการฝึกของคุณ';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals มื้อ x $grams g';
  }

  @override
  String get plZinc => 'สังกะสี';

  @override
  String get plMagnesium => 'แมกนีเซียม';

  @override
  String get plEnergy => 'พลังงาน';

  @override
  String get plChecklist => 'เช็กลิสต์วันนี้';

  @override
  String plCheckProtein(int grams) {
    return 'โปรตีน $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'แคลเซียม $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'วิตามินดี $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return 'น้ำ $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount จากมื้อที่ติ๊กแล้ว';
  }

  @override
  String get plVitaminDNote =>
      'รับแดดเที่ยงที่แขนและใบหน้า 15 นาที หรือใช้อาหารเสริมที่แพทย์อนุญาต';

  @override
  String plWaterLogged(String liters) {
    return 'บันทึกแล้ว $liters';
  }

  @override
  String get plMealPlan => 'แผนมื้ออาหารของคุณ';

  @override
  String get plMealPlanSub => 'อาหารจริง กรัมจริง ปรับตามเป้าหมายของคุณ';

  @override
  String get plSnack => 'ของว่าง';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return 'โปรตีน $protein g · แคลเซียม $calcium mg · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'เป้า $grams g';
  }

  @override
  String get plMarkEaten => 'ทำเครื่องหมายว่ากินแล้ว';

  @override
  String get plEaten => 'กินแล้ว';

  @override
  String get plPlanTotal => 'รวมทั้งวัน';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'มื้อเหล่านี้ให้ประมาณ $planKcal จาก $kcal kcal ของคุณ เติมส่วนที่เหลือด้วยผลไม้ ผัก ขนมปัง หรือข้าว';
  }

  @override
  String get plWeeklyMenu => 'เมนูรายสัปดาห์';

  @override
  String get plWeeklyMenuSub => 'จานใหม่ทุกวัน เป้าหมายเดิม';

  @override
  String get plUnlockMenu => 'ปลดล็อกเมนูรายสัปดาห์ทั้งหมด';

  @override
  String get plRecipes => 'สูตรอาหาร';

  @override
  String get plRecipesSub => 'เมนูโปรตีนสูงทำง่าย';

  @override
  String get plNutritionGuide => 'คู่มือโภชนาการ';

  @override
  String get plNutritionGuideSub => 'สารอาหาร อาหาร และอาหารเสริม';

  @override
  String plPieces(int n) {
    return '$n ชิ้น';
  }

  @override
  String get plFoodOats => 'ข้าวโอ๊ต';

  @override
  String get plFoodMilk => 'นม';

  @override
  String get plFoodBanana => 'กล้วย';

  @override
  String get plFoodWalnuts => 'วอลนัท';

  @override
  String get plFoodGreekYogurt => 'กรีกโยเกิร์ต';

  @override
  String get plFoodYogurt => 'โยเกิร์ต';

  @override
  String get plFoodEggs => 'ไข่';

  @override
  String get plFoodBread => 'ขนมปังโฮลวีต';

  @override
  String get plFoodWhiteCheese => 'ชีสเฟต้า';

  @override
  String get plFoodHardCheese => 'ชีสเชดดาร์';

  @override
  String get plFoodSalad => 'สลัดมะเขือเทศและแตงกวา';

  @override
  String get plFoodOrange => 'ส้ม';

  @override
  String get plFoodPeanutButter => 'เนยถั่ว';

  @override
  String get plFoodSpinach => 'ผักโขม';

  @override
  String get plFoodCottageCheese => 'คอทเทจชีส';

  @override
  String get plFoodChicken => 'อกไก่';

  @override
  String get plFoodBulgur => 'บัลกูร์';

  @override
  String get plFoodAyran => 'อายราน (เครื่องดื่มโยเกิร์ต)';

  @override
  String get plFoodTuna => 'ทูน่า (กระป๋อง)';

  @override
  String get plFoodPasta => 'พาสต้า';

  @override
  String get plFoodBeef => 'เนื้อวัวไม่ติดมัน';

  @override
  String get plFoodRice => 'ข้าว';

  @override
  String get plFoodChickpeas => 'ถั่วลูกไก่';

  @override
  String get plFoodSalmon => 'แซลมอน';

  @override
  String get plFoodBroccoli => 'บรอกโคลี';

  @override
  String get plFoodPotato => 'มันฝรั่ง';

  @override
  String get plFoodLentils => 'ถั่วเลนทิล';

  @override
  String get plFoodSardines => 'ปลาซาร์ดีน';

  @override
  String get plFoodAlmonds => 'อัลมอนด์';

  @override
  String get plFoodKefir => 'คีเฟอร์';

  @override
  String get plFoodPumpkinSeeds => 'เมล็ดฟักทอง';

  @override
  String get wtCoffee => 'กาแฟ';

  @override
  String get wtTea => 'ชา';

  @override
  String get wtCola => 'โคล่า';

  @override
  String get wtEnergyDrink => 'เครื่องดื่มชูกำลัง';

  @override
  String get crCustomBadge => 'สร้างเอง';

  @override
  String get crNameHint => 'เช่น ยืดเหยียดเพิ่มพลังตอนเช้า';

  @override
  String get crDoseHint => 'เช่น 3x10 ครั้ง หรือ 3x30 วินาที';

  @override
  String get paywallLifetime => 'ตลอดชีพ';

  @override
  String paywallOnce(String price) {
    return '$price ครั้งเดียว';
  }

  @override
  String get paywallLifetimeBadge => 'ไม่ต้องสมัครสมาชิก';

  @override
  String get paywallLifetimeDisclaimer =>
      'จ่ายครั้งเดียว · ไม่ใช่การสมัครสมาชิก ไม่มีการต่ออายุ';

  @override
  String get pwSlidePotentialTitle => 'ดูศักยภาพของคุณ';

  @override
  String get pwSlidePotentialCaption =>
      'คำนวณจากอายุ ส่วนสูงของคุณ และส่วนสูงของพ่อแม่';

  @override
  String get pwSlideTodayTitle => 'แผนสำหรับทุกวัน';

  @override
  String get pwSlideTodayCaption => 'เวิร์กเอาต์สั้นๆ ทุกวัน พร้อมวิดีโอสอน';

  @override
  String get pwSlideProgramTitle => '70 วัน 10 เลเวล';

  @override
  String get pwSlideProgramCaption => 'ทุกสัปดาห์ท่าจะยากขึ้นอีกนิด';

  @override
  String get pwSlideNutritionTitle => 'กินเพื่อการเติบโต';

  @override
  String get pwSlideNutritionCaption =>
      'เป้าโปรตีน แคลเซียม และวิตามินดีต่อวันที่ทำมาเพื่อคุณ';

  @override
  String get pwSlideChartTitle => 'ดูกราฟของคุณไต่ขึ้น';

  @override
  String get pwSlideChartCaption => 'ทุกการวัดอยู่บนเส้นทางสู่ศักยภาพของคุณ';

  @override
  String get pwSlideScoreTitle => 'คะแนนเดียวสำหรับนิสัยของคุณ';

  @override
  String get pwSlideScoreCaption => 'ดูว่าควรแก้นิสัยไหนก่อน';

  @override
  String get pwSlidePostureTitle => 'ยืนให้สูงขึ้นตั้งแต่วันนี้';

  @override
  String get pwSlidePostureCaption => 'เช็กท่าทางแบบด่วน พร้อมท่าที่ช่วยแก้';

  @override
  String get pwExample => 'ตัวอย่าง';

  @override
  String pwYouLine(String now, String potential) {
    return 'คุณ: $now → ศักยภาพ $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'ตัวอย่าง: $now → ศักยภาพ $potential';
  }

  @override
  String get tv3NewEyebrow => 'มีอะไรใหม่';

  @override
  String get tv3NewTitle => 'BeTaller อัปเดตครั้งใหญ่';

  @override
  String get tv3NewDesc =>
      'แผนใหม่ โปรแกรมใหม่ หน้าตาใหม่ มาดูกันว่ามีอะไรใหม่';

  @override
  String get tv3PotentialTitle => 'นี่คือศักยภาพของคุณ';

  @override
  String get tv3PotentialDesc =>
      'ส่วนสูงวันนี้ของคุณเทียบกับจุดที่ไปถึงได้ แผนจะช่วยปิดช่องว่างนั้น';

  @override
  String get tv3TodayTitle => 'แผนวันนี้';

  @override
  String tv3TodayDesc(String button) {
    return 'เวิร์กเอาต์สั้นๆ ที่ทำมาสำหรับวันนี้ แตะ $button แล้วทำตามได้เลย';
  }

  @override
  String get tv3ProgramTitle => 'วินัย 70 วัน';

  @override
  String get tv3ProgramDesc =>
      'วันละหนึ่งก้าว ผ่าน 10 เลเวล แต่ละวันต่อยอดจากวันก่อน';

  @override
  String get tv3NutritionTitle => 'เป้าหมายประจำวันของคุณ';

  @override
  String get tv3NutritionDesc =>
      'โปรตีน แคลเซียม วิตามินดี และน้ำ คำนวณมาเพื่อร่างกายของคุณ';

  @override
  String get tv3ChartTitle => 'ดูกราฟของคุณ';

  @override
  String get tv3ChartDesc =>
      'วัดทุกหนึ่งหรือสองสัปดาห์ แล้วดูเส้นไต่ขึ้นสู่ศักยภาพของคุณ';

  @override
  String get tv3ScoreTitle => 'คะแนน BeTaller ของคุณ';

  @override
  String get tv3ScoreDesc =>
      'ตัวเลขเดียวที่บอกว่าคุณทำได้ดีแค่ไหน ยกระดับส่วนที่อ่อนที่สุดก่อน';

  @override
  String get tv3Next => 'ถัดไป';

  @override
  String get tv3ShowMe => 'พาไปดู';

  @override
  String get tv3Done => 'ไปกันเลย';

  @override
  String get obWhyTitle => 'ทำไมคุณถึงอยากสูงขึ้น?';

  @override
  String get obWhySubtitle => 'เลือกได้หลายข้อ แผนของคุณเริ่มจากเหตุผลของคุณ';

  @override
  String get obWhyConfidence => 'รู้สึกมั่นใจขึ้น';

  @override
  String get obWhyImpression => 'สร้างความประทับใจแรกที่ดีขึ้น';

  @override
  String get obWhySports => 'เล่นกีฬาได้ดีขึ้น';

  @override
  String get obWhyClothes => 'ใส่เสื้อผ้าได้พอดีขึ้น';

  @override
  String get obWhyPhotos => 'ดูดีขึ้นในรูป';

  @override
  String get obWhyPotential => 'แค่อยากรู้ศักยภาพของตัวเอง';

  @override
  String get obTriedTitle => 'เคยลองแอปเพิ่มส่วนสูงอื่นไหม?';

  @override
  String get obTriedSubtitle =>
      'ไม่มีคำตอบที่ผิด แค่ช่วยให้เราบอกได้ว่าที่นี่ต่างอย่างไร';

  @override
  String get obTriedStopped => 'เคย แต่เลิกใช้แล้ว';

  @override
  String get obTriedStill => 'เคย ยังใช้อยู่';

  @override
  String get obTriedFirst => 'ไม่เคย นี่เป็นแอปแรก';

  @override
  String get obTriedStoppedTitle => 'แค่ตัวเลขอย่างเดียวไม่ช่วยให้ไปต่อได้';

  @override
  String get obTriedStoppedBody =>
      'แอปส่วนใหญ่ให้แค่ตัวเลข BeTaller เปลี่ยนมันเป็นแผนประจำวันที่ติ๊กได้ พร้อมการเตือนในเวลาที่คุณเลือก';

  @override
  String get obTriedStillTitle => 'เก็บสิ่งที่ได้ผลกับคุณไว้';

  @override
  String get obTriedStillBody =>
      'BeTaller เพิ่มส่วนที่เป็นรายวัน: แผนที่สร้างจากคำตอบของคุณเองที่ติ๊กได้ ทีละขั้น';

  @override
  String get obTriedFirstTitle => 'เริ่มที่นี่ดีแล้ว';

  @override
  String get obTriedFirstBody =>
      'ที่นี่คุณจะไม่ได้แค่ตัวเลข BeTaller เปลี่ยนคำตอบของคุณเป็นแผนประจำวันที่ติ๊กได้';

  @override
  String get obTriedCardTitle => 'สิ่งที่คุณติ๊กในแต่ละวัน';

  @override
  String get obTriedItem1 => 'เวิร์กเอาต์สั้นๆ ที่เลือกมาสำหรับสัปดาห์ของคุณ';

  @override
  String get obTriedItem2 => 'เป้าโปรตีนของคุณ';

  @override
  String get obTriedItem3 => 'ปิดไฟนอนตรงเวลา';

  @override
  String get obBlockTitle => 'อะไรเป็นอุปสรรค?';

  @override
  String get obBlockSubtitle => 'เลือกได้หลายข้อ แผนของคุณจะปรับให้รับมือได้';

  @override
  String get obBlockForget => 'ฉันลืม';

  @override
  String get obBlockTime => 'เวลาไม่พอ';

  @override
  String get obBlockExercises => 'ไม่รู้ว่าควรทำท่าไหน';

  @override
  String get obBlockMotivation => 'หมดแรงจูงใจ';

  @override
  String get obBlockBedtime => 'นอนดึก';

  @override
  String get obBlockMeals => 'ข้ามมื้ออาหาร';

  @override
  String get obFirstTitle => 'ถ้าสูงขึ้นแล้ว สิ่งแรกที่จะทำคืออะไร?';

  @override
  String get obFirstSubtitle => 'นึกภาพไว้ นั่นคือสิ่งที่คุณกำลังมุ่งไป';

  @override
  String get obFirstWardrobe => 'เปลี่ยนเสื้อผ้าใหม่ทั้งตู้';

  @override
  String get obFirstMuscle => 'สร้างกล้ามเนื้อ';

  @override
  String get obFirstPhotos => 'โพสต์รูปเยอะขึ้น';

  @override
  String get obFirstTeam => 'คัดตัวเข้าทีมกีฬา';

  @override
  String get obFirstFeelGood => 'ไม่มีอะไรพิเศษ แค่รู้สึกดี';

  @override
  String get obBuiltChip => 'สร้างมาเพื่อคุณ';

  @override
  String get obBuiltTitle => 'แผนของคุณ สร้างรอบตัวคุณ';

  @override
  String get obBuiltReason => 'เหตุผลของคุณ';

  @override
  String get obBuiltGoal => 'เป้าหมาย';

  @override
  String get obBuiltWhen => 'เมื่อคุณไปถึง';

  @override
  String get obBuiltBlockers => 'อุปสรรคของคุณ จัดการให้แล้ว';

  @override
  String get obFixForget => 'เตือนในเวลาที่คุณเลือก';

  @override
  String get obFixTime => 'ฝึกสั้นๆ ส่วนใหญ่ประมาณ 15 นาที';

  @override
  String get obFixExercises => 'ท่าพร้อมวิดีโอสอน ทีละขั้น';

  @override
  String get obFixMotivation => 'ความต่อเนื่องและเลเวลที่ช่วยให้ไปต่อ';

  @override
  String get obFixBedtime => 'เป้าหมายการนอนและการเตือนเข้านอน';

  @override
  String get obFixMeals => 'เป้าโปรตีนและแผนมื้ออาหาร';

  @override
  String get obNotifTitle => 'BeTaller เตือนคุณในเวลาที่สำคัญ';

  @override
  String get obNotifSubtitle => 'ตั้งตามเวลาที่คุณบอกเรา เปลี่ยนได้ทุกเมื่อ';

  @override
  String get obNotifWorkout => 'ฝึกซ้อม';

  @override
  String obNotifWorkoutDetail(String time) {
    return '30 นาทีก่อนเวลาฝึก $time';
  }

  @override
  String get obNotifMeal => 'มื้ออาหารและโปรตีน';

  @override
  String obNotifMealDetail(String time) {
    return 'ตอนมื้อ $time';
  }

  @override
  String get obNotifWater => 'น้ำ';

  @override
  String get obNotifWaterDetail => 'พักดื่มน้ำช่วงบ่าย';

  @override
  String get obNotifSleep => 'ผ่อนคลายก่อนนอน';

  @override
  String obNotifSleepDetail(String time) {
    return '1 ชั่วโมงก่อนเข้านอนตอน $time';
  }

  @override
  String get obNotifAllow => 'เปิดการเตือน';

  @override
  String get obNotifNotNow => 'ไว้ทีหลัง';

  @override
  String get obNotifNow => 'ตอนนี้';

  @override
  String get ftOneFree => 'ฟรี 1 ครั้ง';

  @override
  String get ftFreeToday => 'ฟรีวันนี้';

  @override
  String get ftContinuePro => 'ไปต่อกับ Pro';

  @override
  String get ftNotNow => 'ไว้ทีหลัง';

  @override
  String get ftOutWorkoutTitle => 'คุณใช้เวิร์กเอาต์ฟรีไปแล้ว';

  @override
  String get ftOutWorkoutBody =>
      'รักษาความต่อเนื่องด้วย Pro: เวิร์กเอาต์พร้อมคำแนะนำทุกวัน จับเวลาทุกท่าให้คุณ';

  @override
  String get ftOutDayTitle => 'วันแรกฟรีของคุณจบแล้ว';

  @override
  String get ftOutDayBody =>
      'แผน เป้าหมาย และความคืบหน้ายังอยู่ให้อ่าน รักษาความต่อเนื่องด้วย Pro: ติ๊กแผน และบันทึกน้ำและการนอนทุกวัน';

  @override
  String get ftOutPostureTitle => 'คุณใช้การเช็กท่าทางฟรีไปแล้ว';

  @override
  String get ftOutPostureBody =>
      'ผลของคุณยังอยู่ที่นี่ เช็กใหม่ทุกสัปดาห์ด้วย Pro แล้วดูท่าทางดีขึ้น';

  @override
  String get ftOutPhotosTitle => 'คุณใช้การเทียบรูปฟรีไปแล้ว';

  @override
  String get ftOutPhotosBody =>
      'รูปคู่นั้นยังเปิดดูได้ เพิ่มรูปและเทียบสองรูปใดก็ได้ด้วย Pro';

  @override
  String get ftOutReportTitle => 'คุณใช้รายงานประจำสัปดาห์ฟรีไปแล้ว';

  @override
  String get ftOutReportBody =>
      'รับสรุปเต็มทุกสัปดาห์ด้วย Pro: คะแนนทุกวัน เป้าหมาย และหนึ่งสิ่งที่ควรทำให้ดีขึ้น';

  @override
  String get ftOutScoreTitle => 'คุณดูรายละเอียดคะแนนฟรีไปแล้ว';

  @override
  String get ftOutScoreBody =>
      'คะแนนของคุณยังอยู่บนจอ ดูว่าอะไรสร้างคะแนนและควรทำอะไรต่อ ได้ทุกวันด้วย Pro';

  @override
  String get ftOutArticleTitle => 'คุณอ่านบทความฟรีไปแล้ว';

  @override
  String get ftOutArticleBody =>
      'บทความนั้นยังเปิดอ่านได้ อ่านทั้งคลังได้ด้วย Pro';

  @override
  String get ftWhyWorkout => 'เวิร์กเอาต์พร้อมคำแนะนำเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhyPlan => 'การติ๊กแผนเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhyProgram => 'โปรแกรม 70 วันเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhyWater => 'การบันทึกน้ำทุกวันเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhySleep => 'การบันทึกการนอนทุกวันเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhyNutrition => 'แผนโภชนาการประจำวันเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhyPosture => 'การเช็กท่าทางทุกสัปดาห์เป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhyPhotos => 'การเทียบรูปเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhyReport => 'รายงานประจำสัปดาห์เป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhyScore => 'รายละเอียดคะแนนเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftWhyArticle => 'คลังบทความทั้งหมดเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftPlanLocked =>
      'แผนของคุณยังอยู่ให้อ่าน การติ๊กแผนเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftNutritionLocked =>
      'เป้าหมายและมื้ออาหารยังอยู่ให้อ่าน การติ๊กเป็นส่วนหนึ่งของ Pro';

  @override
  String get ftPreviewTag => 'ตัวอย่าง';

  @override
  String get ftPreviewTitle => 'นั่นคือตัวอย่างของคุณ';

  @override
  String get ftPreviewBody =>
      'ส่วนที่เหลือของเวิร์กเอาต์นี้เป็นส่วนหนึ่งของ Pro ต่อไปจะเป็นแบบนี้:';

  @override
  String get ftFreeWorkoutUsed => 'นั่นคือเวิร์กเอาต์ฟรีของคุณ Pro มีให้ทุกวัน';

  @override
  String get ftScoreLockedTitle => 'อะไรสร้างคะแนนของคุณ';

  @override
  String get ftScoreLockedBody =>
      'ทุกส่วนของคะแนน อิงจากอะไร และหนึ่งสิ่งที่ควรทำต่อ';

  @override
  String get ftReportLockedTitle => 'สัปดาห์เต็มของคุณ';

  @override
  String get ftReportLockedBody =>
      'คะแนนทุกวันเทียบกับแผน เป้าหมาย ส่วนสูง และหนึ่งโฟกัสสำหรับสัปดาห์หน้า';

  @override
  String get ftPhotosLockedTitle => 'เทียบสองรูปนี้';

  @override
  String get ftPhotosLockedBody =>
      'คุณใช้การเทียบฟรีไปแล้ว ด้วย Pro คุณเลื่อนเทียบสองรูปใดก็ได้';

  @override
  String get ftArticleFreeLine => 'บทความแรกฟรี เลือกเรื่องที่อยากอ่านได้เลย';

  @override
  String get plFinishWorkout => 'เสร็จสิ้น';

  @override
  String get obTriedMostApps => 'แอปส่วนใหญ่';

  @override
  String get obTriedThatsIt => 'ตัวเลขหนึ่งตัว แค่นั้น';

  @override
  String get obTriedPlanLabel => 'วันของคุณบน BeTaller';

  @override
  String get obTriedProteinSub => 'แบ่งไปในแต่ละมื้อ';

  @override
  String get obTriedSleepSub => 'เตือนก่อนนอน';

  @override
  String get obTriedFeatVideo => 'ท่าพร้อมวิดีโอสอน';

  @override
  String get obTriedFeatReminders => 'เตือนในเวลาของคุณ';

  @override
  String get obTriedFeatStreaks => 'ความต่อเนื่องและเลเวล';

  @override
  String get obBedtimeUnknown => 'ไม่รู้ ไม่แน่นอน';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'เราจะแนะนำ $time ตามชั่วโมงนอนที่วัยคุณต้องการ เปลี่ยนได้ทุกเมื่อ';
  }

  @override
  String get obWorkoutTimeUnknown => 'ไม่รู้ ไม่มีเวลาแน่นอน';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'ตอนนี้เราจะใช้ $time ไปก่อน เปลี่ยนได้ทุกเมื่อ';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'แนะนำ: เข้านอนประมาณ $time เปลี่ยนได้ทุกเมื่อ';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'แนะนำ: ฝึกประมาณ $time เปลี่ยนได้ทุกเมื่อ';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'ตั้งตามเวลาที่คุณบอกเรา และแนะนำให้ในส่วนที่คุณไม่แน่ใจ เปลี่ยนได้ทุกเมื่อ';

  @override
  String get plFoodBrownRice => 'ข้าวกล้อง';

  @override
  String get unitHeightTitle => 'หน่วยส่วนสูง';

  @override
  String get unitWeightTitle => 'หน่วยน้ำหนัก';

  @override
  String get unitWaterTitle => 'หน่วยน้ำ';

  @override
  String get unitOptCm => 'เซนติเมตร';

  @override
  String get unitOptFtIn => 'ฟุตและนิ้ว';

  @override
  String get unitOptKg => 'กิโลกรัม';

  @override
  String get unitOptLb => 'ปอนด์';

  @override
  String get unitOptStLb => 'สโตนและปอนด์';

  @override
  String get unitOptLiters => 'ลิตร';

  @override
  String get unitOptFlOz => 'ออนซ์ของเหลว';

  @override
  String achieveGrowthImp(String amount) {
    return 'โตขึ้น $amount';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'บันทึกการเติบโตรวม $amount';
  }

  @override
  String get postureBenefitIn =>
      'ศีรษะ ไหล่ และหลังส่วนล่าง ยืนตัวตรงช่วยให้เห็นส่วนสูงจริงเพิ่มขึ้นได้ถึงประมาณ 1 in';

  @override
  String get notifPostureBodyIn =>
      'หลังตรง ไหล่ผาย ท่าทางดี = ต่างกันประมาณ 1 in!';

  @override
  String get painPostureDescIn =>
      'ท่าทางที่ถูกต้องช่วยให้ดูสูงขึ้นทันทีได้ถึงประมาณ 1 in กิจวัตรท่าทางประจำวันของ BeTaller ช่วยให้ทำได้จนติดตัวในไม่กี่สัปดาห์';

  @override
  String get routinePostureDescIn =>
      'หลังตรง ไหล่ผาย เช็กทุกชั่วโมง ท่าทางดี = ต่างกันประมาณ 1 in';

  @override
  String get sciPostureCheckIn =>
      'การจัดท่าทางให้ถูกช่วยให้ดูสูงขึ้นทันทีประมาณ 1 in และป้องกันแรงกดที่กระดูกสันหลัง';

  @override
  String get routineProteinDescLb =>
      'ไข่ ไก่ ปลา นม โปรตีนอย่างน้อย 0.7 g ต่อน้ำหนักตัว 1 lb ต่อวัน';

  @override
  String pwPersonalTitle(String height) {
    return 'แผนสู่ $height ของคุณพร้อมแล้ว';
  }

  @override
  String get pwPersonalEstimate =>
      'ศักยภาพโดยประมาณจากคำตอบของคุณ ไม่ใช่การรับประกัน';

  @override
  String pwPersonalReason(String reason) {
    return 'เหตุผลของคุณ: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'เตือนให้ผ่อนคลายก่อนเข้านอนตอน $time';
  }

  @override
  String get obParentUnknown => 'ไม่รู้';

  @override
  String get obParentUnknownHint =>
      'เราจะใช้ส่วนสูงเฉลี่ยของผู้ใหญ่แทน ความแม่นยำจะน้อยลง และคุณเพิ่มข้อมูลได้ในโปรไฟล์ทุกเมื่อ';

  @override
  String get obEthnicityWhy =>
      'ใช้เพื่อประมาณส่วนสูงของพ่อหรือแม่ที่คุณไม่รู้เท่านั้น';

  @override
  String get resultNoParentNote =>
      'ประมาณโดยไม่มีส่วนสูงของพ่อหรือแม่หนึ่งคน จึงแม่นยำน้อยลง เพิ่มได้ในโปรไฟล์ทุกเมื่อ';

  @override
  String get resultNoParentsNote =>
      'ประมาณโดยไม่มีส่วนสูงของพ่อแม่ จึงแม่นยำน้อยลง เพิ่มได้ในโปรไฟล์ทุกเมื่อ';

  @override
  String get resultFootnoteEstimated =>
      'เป็นการประมาณจากข้อมูลกราฟการเติบโตและส่วนสูงเฉลี่ยของผู้ใหญ่ ไม่ใช่คำแนะนำทางการแพทย์';

  @override
  String get obBudgetChip => 'ราคายุติธรรม';

  @override
  String get obBudgetTitle => 'BeTaller ตั้งราคาให้วัยรุ่นทุกคนที่อยากสูงขึ้น';

  @override
  String get obBudgetDesc =>
      'ส่วนสูงของคุณไม่ควรขึ้นอยู่กับว่ามีเงินแค่ไหน เราจึงตั้งราคาแยกสำหรับแต่ละประเทศ';

  @override
  String obBudgetWeek(String price) {
    return 'Pro หนึ่งสัปดาห์ที่นี่: $price';
  }

  @override
  String get obBudgetLocalTitle => 'ราคาสำหรับประเทศของคุณ';

  @override
  String get obBudgetLocalDesc =>
      'ไม่ได้แปลงจากดอลลาร์สหรัฐฯ แต่ตั้งตามงบประมาณของคนในประเทศคุณ';

  @override
  String get obBudgetWeekTitle => 'เริ่มแค่สัปดาห์เดียว';

  @override
  String get obBudgetWeekDesc =>
      'ไม่ต้องจ่ายก้อนใหญ่ล่วงหน้า ยกเลิกได้ทุกเมื่อในการตั้งค่า Apple ID';

  @override
  String get obBudgetAllTitle => 'ทุกอย่างในแผนเดียว';

  @override
  String get obBudgetAllDesc =>
      'เวิร์กเอาต์ การนอน โภชนาการ ท่าทาง และรายงานความคืบหน้า';

  @override
  String get obRateTitle => 'BeTaller สร้างมาเพื่อช่วยคุณจริงๆ';

  @override
  String get obRateDesc =>
      'ถ้าคุณชอบความใส่ใจและความจริงใจของเรา เราจะดีใจมากถ้าคุณให้คะแนนเรา';

  @override
  String get obRateCta => 'ให้คะแนน BeTaller';

  @override
  String get obRateLater => 'ไว้ทีหลัง';
}
