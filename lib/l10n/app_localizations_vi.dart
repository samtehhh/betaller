// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get navHome => 'Trang chủ';

  @override
  String get navAnalysis => 'Phân tích';

  @override
  String get navRoutines => 'Kế hoạch';

  @override
  String get disciplineTitle => 'Kỷ luật';

  @override
  String get disciplineProgramTitle => 'Chương trình kỷ luật';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total ngày';
  }

  @override
  String get disciplineCompleteDay => 'Hoàn thành ngày';

  @override
  String disciplineDayN(int n) {
    return 'Ngày $n';
  }

  @override
  String get disciplineLevels => 'Cấp độ';

  @override
  String get disciplineLevelDone => 'Xong';

  @override
  String get disciplineLocked => 'Đã khóa';

  @override
  String get disciplineTodayIs => 'Hôm nay';

  @override
  String get disciplineToday => 'Hôm nay';

  @override
  String get disciplineTodayPlan => 'Kế hoạch hôm nay';

  @override
  String get disciplineWeek => 'Tuần này';

  @override
  String get disciplineMonth => 'Tháng này';

  @override
  String get disciplineLevel => 'Cấp độ kỷ luật';

  @override
  String disciplineStreakDays(int days) {
    return 'Chuỗi $days ngày';
  }

  @override
  String disciplineToNext(int days) {
    return 'Còn $days ngày lên cấp';
  }

  @override
  String get disciplineMaxTier => 'Đã đạt cấp cao nhất';

  @override
  String get disciplineTierSpark => 'Tia lửa';

  @override
  String get disciplineTierSteady => 'Vững vàng';

  @override
  String get disciplineTierSharp => 'Sắc bén';

  @override
  String get disciplineTierSolid => 'Kiên cố';

  @override
  String get disciplineTierRelentless => 'Bền bỉ';

  @override
  String get disciplineTierUnbroken => 'Bất bại';

  @override
  String get disciplineTierLegend => 'Huyền thoại';

  @override
  String get goalPerfectDays => 'Ngày hoàn thành kế hoạch';

  @override
  String get goalWorkouts => 'Buổi tập';

  @override
  String get goalMeasurement => 'Đo chiều cao';

  @override
  String get goalPhoto => 'Ảnh tiến độ';

  @override
  String get goalPostureCheck => 'Kiểm tra tư thế';

  @override
  String get disciplineAllDone => 'Xong hôm nay rồi';

  @override
  String disciplineDayProgress(int done, int total) {
    return 'Xong $done/$total';
  }

  @override
  String get navProgress => 'Tiến độ';

  @override
  String get trackingSection => 'Công cụ theo dõi';

  @override
  String get photosBenefit =>
      'Trước và sau, đặt cạnh nhau. Nhìn thấy thay đổi thay vì chỉ đọc số.';

  @override
  String get postureBenefit =>
      'Đầu, vai và lưng dưới. Đứng thẳng giúp lộ thêm tới 2-3 cm chiều cao thật của bạn.';

  @override
  String get reportBenefit =>
      'Chấm điểm tuần của bạn từng ngày và xem chỗ nào bị hụt.';

  @override
  String get photosCta => 'Thêm ảnh';

  @override
  String get postureCta => 'Phân tích';

  @override
  String get reportCta => 'Mở báo cáo';

  @override
  String get toolStateReady => 'Sẵn sàng';

  @override
  String get photosSummaryEmpty => 'Thêm ảnh đầu tiên';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count ảnh',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'Chưa có phân tích';

  @override
  String postureSummaryScore(int score) {
    return 'Tư thế $score/100';
  }

  @override
  String get navProfile => 'Hồ sơ';

  @override
  String greeting(String name) {
    return 'Chào $name';
  }

  @override
  String get currentHeight => 'Chiều cao hiện tại';

  @override
  String get target => 'Mục tiêu';

  @override
  String completed(String pct) {
    return 'Đã hoàn thành $pct%';
  }

  @override
  String remaining(String cm, String unit) {
    return 'Còn +$cm $unit';
  }

  @override
  String get updateAnalysis => 'Cập nhật phân tích';

  @override
  String get analysisSubtitle => 'Dự đoán từ chiều cao trước đây + thói quen';

  @override
  String get dailyRoutines => 'Thói quen hằng ngày';

  @override
  String get allRoutinesDone => 'Đã xong tất cả thói quen!';

  @override
  String get water => 'Nước';

  @override
  String get sleep => 'Ngủ';

  @override
  String get growthSummary => 'Tóm tắt tăng trưởng';

  @override
  String get total => 'TỔNG';

  @override
  String get last => 'GẦN NHẤT';

  @override
  String get measurement => 'LẦN ĐO';

  @override
  String get dailyTip => 'Mẹo hôm nay';

  @override
  String get waterTracking => 'Theo dõi nước';

  @override
  String get waterGoalReached => 'Đã đạt mục tiêu hôm nay';

  @override
  String waterRemaining(String amount) {
    return 'Còn $amount';
  }

  @override
  String get undo => 'Hoàn tác';

  @override
  String waterToday(String amount) {
    return 'Hôm nay: $amount L';
  }

  @override
  String get sleepTracking => 'Theo dõi giấc ngủ';

  @override
  String sleepTarget(String hours) {
    return 'Mục tiêu: $hours giờ';
  }

  @override
  String get hours => 'giờ';

  @override
  String get save => 'Lưu';

  @override
  String get cancel => 'Hủy';

  @override
  String get analysis => 'Phân tích';

  @override
  String get betallerScore => 'Điểm BeTaller';

  @override
  String get genetic => 'Di truyền';

  @override
  String get growth => 'Tăng trưởng';

  @override
  String get nutrition => 'Dinh dưỡng';

  @override
  String get sleepLabel => 'Ngủ';

  @override
  String get discipline => 'Kỷ luật';

  @override
  String get improveScore => 'Tăng điểm của bạn';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Dinh dưỡng đáng báo động!';

  @override
  String get nutritionStrengthen => 'Cải thiện dinh dưỡng';

  @override
  String get sleepRecordAdd => 'Ghi giấc ngủ';

  @override
  String get sleepPoor => 'Lịch ngủ chưa tốt';

  @override
  String get sleepImprove => 'Cải thiện giấc ngủ';

  @override
  String get startToday => 'Bắt đầu hôm nay!';

  @override
  String routinesRemaining(int count) {
    return 'Còn $count thói quen';
  }

  @override
  String get keepStreak => 'Giữ chuỗi nhé';

  @override
  String get addFirstMeasurement => 'Thêm lần đo đầu tiên';

  @override
  String get addMeasurement => 'Thêm lần đo';

  @override
  String waterHalfNotReached(String amount) {
    return 'Hôm nay bạn chưa uống được nửa mục tiêu. Uống thêm ${amount}L nhé.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'Còn ${amount}L nữa là đạt mục tiêu nước. Sắp xong rồi!';
  }

  @override
  String bmiLow(String bmi) {
    return 'BMI của bạn là $bmi — hơi thấp. Hãy ăn thêm protein và calo.';
  }

  @override
  String get bodyFactsTitle => 'Cơ thể bạn';

  @override
  String get dailyNeedsTitle => 'Mục tiêu hằng ngày';

  @override
  String bmiHigh(String bmi) {
    return 'BMI của bạn là $bmi — hơi cao. Tập trung ăn uống lành mạnh nhé.';
  }

  @override
  String get nutritionDefault =>
      'Hoàn thành mục tiêu nước và giữ chế độ ăn cân bằng.';

  @override
  String sleepNoRecord(String hours) {
    return 'Hôm nay chưa ghi giấc ngủ. Cố ngủ đủ $hours giờ và ghi lại nhé.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Hôm nay bạn ngủ $current giờ — thiếu $missing giờ. Đi ngủ sớm hơn nhé!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Sắp đạt rồi. Ngủ đủ $hours giờ sẽ tối đa hormone tăng trưởng.';
  }

  @override
  String get sleepGood => 'Lịch ngủ rất tốt! Cứ thế phát huy nhé.';

  @override
  String noRoutinesDone(int total) {
    return 'Hôm nay chưa xong thói quen nào. Bắt đầu với 1 trong $total nhé!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return 'Hôm nay đã xong $done/$total thói quen. Còn $left nữa thôi!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Hôm nay làm tốt lắm! Thêm $needed ngày nữa để bắt đầu chuỗi.';
  }

  @override
  String streakContinue(int days) {
    return 'Chuỗi $days ngày! Càng duy trì, điểm càng tăng.';
  }

  @override
  String get noMeasurements =>
      'Chưa có lần đo nào. Thêm lần đầu để dự đoán chính xác hơn.';

  @override
  String fewMeasurements(int count) {
    return 'Thêm $count lần đo nữa để tính tốc độ tăng trưởng.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Bạn có $count lần đo. Đạt 5 lần sẽ chính xác hơn nhiều.';
  }

  @override
  String get keepMeasuring =>
      'Cứ tiếp tục đo nhé. Mỗi số liệu mới đều giúp dự đoán tốt hơn.';

  @override
  String get heightPrediction => 'Dự đoán chiều cao';

  @override
  String get predictedHeightAt21 => 'Chiều cao dự đoán lúc 21 tuổi';

  @override
  String get predictionMethod =>
      'Tính bằng cách kết hợp di truyền (bố mẹ), tốc độ tăng trưởng, BMI và tuổi.';

  @override
  String get growthStatus => 'Tình trạng tăng trưởng';

  @override
  String get growthRemaining => 'Vẫn còn phía trước';

  @override
  String get growthBreakdown => 'Số cm đó đến từ đâu';

  @override
  String get geneticGainLabel => 'Từ di truyền';

  @override
  String get lifestyleLabel => 'Lối sống';

  @override
  String get geneticCeilingLabel => 'Giới hạn';

  @override
  String get reachableTargetHeight => 'Chiều cao mục tiêu có thể đạt';

  @override
  String get geneticCeilingProgress => 'Tiến độ tới giới hạn di truyền';

  @override
  String get completionLabel => 'HOÀN THÀNH';

  @override
  String get growthVelocity => 'TỐC ĐỘ TĂNG TRƯỞNG';

  @override
  String get noData => 'CHƯA CÓ DỮ LIỆU';

  @override
  String growthRate(String rating) {
    return 'Tốc độ tăng trưởng: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'Calo';

  @override
  String get kcalDay => 'kcal/ngày';

  @override
  String get daily => 'mỗi ngày';

  @override
  String get protein => 'Protein';

  @override
  String get minimum => 'tối thiểu';

  @override
  String get age => 'Tuổi';

  @override
  String get male => 'Nam';

  @override
  String get female => 'Nữ';

  @override
  String get yearlyPrediction => 'DỰ ĐOÁN THEO NĂM';

  @override
  String ageYear(int age) {
    return '$age tuổi';
  }

  @override
  String get progressTitle => 'Theo dõi tiến độ';

  @override
  String get totalGrowth => 'Tổng';

  @override
  String get lastDiff => 'Chênh lệch';

  @override
  String get measurementCount => 'Lần đo';

  @override
  String get heightChart => 'Biểu đồ chiều cao';

  @override
  String get chartMinData => 'Cần ít nhất 2 lần đo để vẽ biểu đồ';

  @override
  String get chartInstruction => 'Thêm lần đo để xem biểu đồ tiến độ!';

  @override
  String get addMeasurementButton => 'THÊM LẦN ĐO MỚI';

  @override
  String get measurementHistory => 'LỊCH SỬ ĐO';

  @override
  String get deleteTitle => 'Xóa lần đo';

  @override
  String get deleteMessage => 'Bạn chắc chắn muốn xóa lần đo này?';

  @override
  String get dismiss => 'Hủy';

  @override
  String get delete => 'Xóa';

  @override
  String get newMeasurement => 'Lần đo chiều cao mới';

  @override
  String get routines => 'Thói quen';

  @override
  String streakDays(int days) {
    return '$days ngày';
  }

  @override
  String get progressStatus => 'Tình trạng tiến độ';

  @override
  String get completedLabel => 'Hoàn thành!';

  @override
  String get all => 'Tất cả';

  @override
  String get exercise => 'Tập luyện';

  @override
  String get posture => 'Tư thế';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return 'Tốt nhất: $_temp0';
  }

  @override
  String get editProfile => 'Sửa hồ sơ';

  @override
  String get editProfileSubtitle => 'Cập nhật chiều cao, cân nặng, tuổi';

  @override
  String get name => 'Tên';

  @override
  String birthDate(String date) {
    return 'Ngày sinh: $date';
  }

  @override
  String get heightCm => 'Chiều cao (cm)';

  @override
  String get weightKg => 'Cân nặng (kg)';

  @override
  String get fatherHeight => 'Chiều cao của bố (cm)';

  @override
  String get motherHeight => 'Chiều cao của mẹ (cm)';

  @override
  String get notifications => 'Thông báo';

  @override
  String get reminderNextLabel => 'Nhắc tiếp theo';

  @override
  String get reminderManageHint => 'Quản lý lời nhắc';

  @override
  String get reminderOffCta => 'Bật thông báo';

  @override
  String get stateOn => 'Bật';

  @override
  String get stateOff => 'Tắt';

  @override
  String get reminderMasterTitle => 'Thông báo';

  @override
  String reminderActiveCount(int count) {
    return 'Đang bật $count lời nhắc';
  }

  @override
  String get reminderBuiltIn => 'Lời nhắc có sẵn';

  @override
  String get reminderYourOwn => 'Lời nhắc của bạn';

  @override
  String get reminderAdd => 'Thêm lời nhắc';

  @override
  String get reminderDays => 'Ngày';

  @override
  String get reminderEveryDay => 'Mỗi ngày';

  @override
  String get reminderLabelHint => 'Bạn muốn được nhắc gì?';

  @override
  String get reminderEmptyHint =>
      'Tự thêm nhé: tập luyện, vitamin, giãn cơ, bất cứ thứ gì bạn cần.';

  @override
  String get reminderCustom => 'Lời nhắc';

  @override
  String get reminderCustomBody => 'Đến giờ bạn đã đặt rồi.';

  @override
  String get reminderExercise => 'Tập luyện';

  @override
  String get reminderNutrition => 'Dinh dưỡng';

  @override
  String get reminderWater => 'Nước';

  @override
  String get reminderPosture => 'Tư thế';

  @override
  String get reminderRoutine => 'Thói quen hằng ngày';

  @override
  String get reminderSleep => 'Ngủ';

  @override
  String get reminderMeasurement => 'Đo chiều cao';

  @override
  String get notificationsOn => 'Lời nhắc đang bật';

  @override
  String get notificationsOff => 'Lời nhắc đang tắt';

  @override
  String get premium => 'Nâng cấp Premium';

  @override
  String get premiumSubtitle => 'Mở khóa mọi tính năng';

  @override
  String get rateUs => 'Đánh giá app';

  @override
  String get rateSubtitle => 'Thích app không? Cho tụi mình 5 sao nhé!';

  @override
  String get share => 'Chia sẻ app';

  @override
  String get shareSubtitle => 'Kể bạn bè nghe về BeTaller';

  @override
  String get shareText =>
      'Mình đã khám phá tiềm năng chiều cao với BeTaller! Bạn thử luôn đi: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Góp ý';

  @override
  String get feedbackSubtitle => 'Liên hệ tụi mình';

  @override
  String get resetData => 'Đặt lại toàn bộ dữ liệu';

  @override
  String get resetSubtitle => 'Mọi dữ liệu sẽ bị xóa';

  @override
  String get resetTitle => 'Đặt lại dữ liệu';

  @override
  String get resetMessage =>
      'Mọi dữ liệu sẽ bị xóa và bạn sẽ quay lại màn hình giới thiệu. Không thể hoàn tác!';

  @override
  String get reset => 'Đặt lại';

  @override
  String get premiumSoon => 'Premium sắp ra mắt!';

  @override
  String get brandingSubtitle => 'Khám phá tiềm năng chiều cao của bạn';

  @override
  String get statistics => 'Thống kê';

  @override
  String get profileGroupSupport => 'Hỗ trợ';

  @override
  String get profileGroupAccount => 'Tài khoản';

  @override
  String get profileGroupApp => 'Ứng dụng';

  @override
  String get profileGroupDanger => 'Vùng nguy hiểm';

  @override
  String profileMemberSince(String date) {
    return 'Từ $date';
  }

  @override
  String get profileYourJourney => 'Hành trình của bạn';

  @override
  String get profileTotalGrowth => 'Tổng';

  @override
  String get currentStreak => 'Chuỗi hiện tại';

  @override
  String get bestStreakLabel => 'Chuỗi tốt nhất';

  @override
  String get achievementLabel => 'Thành tích';

  @override
  String get achievements => 'Thành tích';

  @override
  String get achievementUnlockedTitle => '🏆 Mở khóa thành tích!';

  @override
  String get reminderTapHint => 'Chạm vào để đổi giờ và ngày';

  @override
  String get earned => 'Đã đạt!';

  @override
  String get notEarned => 'Chưa đạt';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Ngôn ngữ';

  @override
  String get languageSubtitle => 'Đổi ngôn ngữ ứng dụng';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Khám phá tiềm năng chiều cao của bạn';

  @override
  String get onboardingMeetYou => 'Làm quen nhé';

  @override
  String get onboardingInfoNeeded => 'Cần vài thông tin cơ bản để phân tích.';

  @override
  String get gender => 'GIỚI TÍNH';

  @override
  String get birthDateLabel => 'NGÀY SINH';

  @override
  String get bodyMeasurements => 'Số đo cơ thể';

  @override
  String get bodyInfo =>
      'Cần chiều cao và cân nặng hiện tại của bạn để phân tích.';

  @override
  String get geneticData => 'Dữ liệu di truyền';

  @override
  String get geneticInfo =>
      'Chiều cao của bố mẹ quyết định tiềm năng di truyền của bạn.';

  @override
  String get pastHeights => 'Chiều cao trước đây';

  @override
  String get pastHeightsInfo =>
      'Nhập chiều cao bạn nhớ ở các độ tuổi khác nhau. Có thể bỏ trống.';

  @override
  String get heightHint => 'Nhập chiều cao...';

  @override
  String get ageLabel => 'tuổi';

  @override
  String get habits => 'Thói quen của bạn';

  @override
  String get habitsInfo => 'Lối sống ảnh hưởng trực tiếp đến dự đoán.';

  @override
  String get weeklyExercise => 'Tập luyện mỗi tuần';

  @override
  String get dailySleep => 'Giấc ngủ mỗi ngày';

  @override
  String get nutritionQuality => 'CHẤT LƯỢNG DINH DƯỠNG';

  @override
  String get nutritionDesc => 'Protein, sữa, rau, trái cây';

  @override
  String get nutritionBad => 'Tệ';

  @override
  String get nutritionPoor => 'Kém';

  @override
  String get nutritionMedium => 'Trung bình';

  @override
  String get nutritionGood => 'Tốt';

  @override
  String get nutritionGreat => 'Rất tốt';

  @override
  String get startAnalysis => 'Bắt đầu phân tích';

  @override
  String get continueBtn => 'Tiếp tục';

  @override
  String get analyzeBtn => 'Phân tích';

  @override
  String get analyzing => 'Đang phân tích';

  @override
  String get analysisComplete => 'Hoàn thành!';

  @override
  String get analysisDataReceivedTitle => 'Đã nhận dữ liệu';

  @override
  String get analysisDataReceivedSubtitle => 'Đang bắt đầu phân tích...';

  @override
  String get yourScore => 'Điểm BeTaller của bạn';

  @override
  String get letsStart => 'Bắt đầu thôi';

  @override
  String get splashJourneySubtitle => 'Hành trình bắt đầu. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Kế hoạch riêng của bạn đã sẵn sàng.\nSẵn sàng khám phá tiềm năng chiều cao chưa?';

  @override
  String get doneBtn => 'Xong';

  @override
  String get analysisStep1 => 'Đang phân tích dữ liệu di truyền...';

  @override
  String get analysisStep2 => 'Đang tính tốc độ tăng trưởng...';

  @override
  String get analysisStep3 => 'Đang xử lý dữ liệu dinh dưỡng và giấc ngủ...';

  @override
  String get analysisStep4 => 'Đang tạo dự đoán chiều cao...';

  @override
  String get analysisStep5 => 'Đang tính điểm BeTaller...';

  @override
  String growthPotential(String cm, String unit) {
    return 'Tiềm năng tăng +$cm $unit';
  }

  @override
  String get heightAt21 => 'lúc 21 tuổi';

  @override
  String confidenceLevel(String pct) {
    return 'Độ tin cậy $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'Khoảng $min - $max $unit';
  }

  @override
  String get currentLabel => 'HIỆN TẠI';

  @override
  String get predictedLabel => 'DỰ ĐOÁN';

  @override
  String get yearlyPredictions => 'Dự đoán theo năm';

  @override
  String get tipMorningMeasure =>
      'Đo chiều cao vào buổi sáng. Áp lực lên đĩa đệm làm bạn thấp đi một chút trong ngày, nên số đo buổi sáng là chính xác nhất.';

  @override
  String get tipProteinSpread =>
      'Chia protein ra các bữa. Đừng ăn dồn một lần, bữa nào cũng nên có protein.';

  @override
  String get tipGrowthHormone =>
      'Hormone tăng trưởng đạt đỉnh khi ngủ. Hãy ngủ trong khoảng 22h-2h nhé!';

  @override
  String get tipVitaminD =>
      '15 phút nắng mỗi ngày giúp tăng tạo vitamin D. Vitamin D rất cần để hấp thu canxi.';

  @override
  String get tipBarHanging =>
      'Treo xà giúp giảm áp lực cột sống. Thử 3x30 giây mỗi ngày.';

  @override
  String get tipSwimming =>
      'Bơi là môn thể thao tốt nhất để tập toàn thân và hỗ trợ phát triển chiều cao.';

  @override
  String get tipStress =>
      'Căng thẳng ức chế hormone tăng trưởng. Giảm stress bằng thiền và yoga.';

  @override
  String get routineMorningStretch => 'Giãn cơ buổi sáng';

  @override
  String get routineMorningStretchDesc =>
      'Giãn cơ 10 phút ngay khi thức dậy. Kéo giãn cột sống và cơ chân.';

  @override
  String get routineBarHanging => 'Treo xà';

  @override
  String get routineBarHangingDesc =>
      'Treo người trên xà để kéo giãn cột sống. 3 hiệp x 30 giây.';

  @override
  String get routineCobraStretch => 'Tư thế rắn hổ mang';

  @override
  String get routineCobraStretchDesc =>
      'Nằm sấp và nâng phần thân trên. Kéo giãn cột sống. 3 hiệp x 15 giây.';

  @override
  String get routineJumping => 'Bài tập bật nhảy';

  @override
  String get routineJumpingDesc =>
      'Nhảy dây hoặc squat nhảy. Kích thích sụn tăng trưởng. 3 hiệp x 20 lần.';

  @override
  String get routineSwimming => 'Bơi hoặc bóng rổ';

  @override
  String get routineSwimmingDesc =>
      'Chơi một môn hỗ trợ phát triển chiều cao. Ít nhất 30 phút.';

  @override
  String get routineYoga => 'Yoga & giãn cơ buổi tối';

  @override
  String get routineYogaDesc =>
      'Yoga và giãn cơ trước khi ngủ. Xả stress, thả lỏng cơ.';

  @override
  String get routineProtein => 'Nạp protein';

  @override
  String get routineProteinDesc =>
      'Trứng, gà, cá, sữa. Ít nhất 1,5g/kg protein mỗi ngày.';

  @override
  String get routineCalcium => 'Canxi & vitamin D';

  @override
  String get routineCalciumDesc =>
      'Uống sữa, ăn phô mai, sữa chua. Tắm nắng 15 phút. Rất quan trọng cho xương.';

  @override
  String get routineWater => 'Mục tiêu uống nước';

  @override
  String get routineWaterDesc =>
      'Uống ít nhất 2-3 lít nước mỗi ngày. Cần thiết cho trao đổi chất và tăng trưởng.';

  @override
  String get routineAvoidJunk => 'Tránh đồ ăn vặt';

  @override
  String get routineAvoidJunkDesc =>
      'Tránh xa đồ ăn nhanh, nước ngọt và thực phẩm chế biến sẵn.';

  @override
  String get routineSleep => 'Ngủ ngon (8-10 tiếng)';

  @override
  String get routineSleepDesc =>
      'Hormone tăng trưởng được tiết ra khi ngủ. 22h-6h là khung giờ vàng.';

  @override
  String get routineNoScreen => 'Tạm rời màn hình trước khi ngủ';

  @override
  String get routineNoScreenDesc =>
      'Cất điện thoại và máy tính 1 tiếng trước khi ngủ. Đừng cản trở melatonin.';

  @override
  String get routinePosture => 'Kiểm tra tư thế';

  @override
  String get routinePostureDesc =>
      'Giữ lưng thẳng, vai mở ra sau. Kiểm tra mỗi giờ. Tư thế tốt = chênh 2-3 cm.';

  @override
  String get routineWallStand => 'Đứng áp tường';

  @override
  String get routineWallStandDesc =>
      'Đứng dựa lưng vào tường: gót, hông, vai, đầu chạm tường. Giữ 5 phút.';

  @override
  String get routineSprintIntervals => 'Chạy nước rút ngắt quãng';

  @override
  String get routineSprintIntervalsDesc =>
      'Chạy nước rút ngắt quãng kích thích tiết nhiều hormone tăng trưởng nhờ các đợt cường độ cao.';

  @override
  String get routineHiitWorkout => 'Bài tập HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'Tập ngắt quãng cường độ cao để tối đa hóa hormone tăng trưởng.';

  @override
  String get routineSquats => 'Squat không tạ';

  @override
  String get routineSquatsDesc =>
      'Squat bằng trọng lượng cơ thể kích thích sụn tăng trưởng ở chân và cột sống.';

  @override
  String get routineDeadliftStretch => 'Giãn cơ kiểu deadlift';

  @override
  String get routineDeadliftStretchDesc =>
      'Giãn cơ kiểu deadlift giúp giảm áp lực cột sống và tốt cho đĩa đệm.';

  @override
  String get routineOverheadPress => 'Đẩy tay qua đầu';

  @override
  String get routineOverheadPressDesc =>
      'Đẩy tay qua đầu kéo giãn cột sống và làm khỏe cơ giữ tư thế.';

  @override
  String get routineSkippingRope => 'Nhảy dây';

  @override
  String get routineSkippingRopeDesc =>
      'Nhảy dây liên tục kích thích sụn tăng trưởng ở chân.';

  @override
  String get routinePilatesCore => 'Pilates cơ lõi';

  @override
  String get routinePilatesCoreDesc =>
      'Bài tập pilates cơ lõi hỗ trợ cột sống thẳng và tư thế đẹp.';

  @override
  String get routineInversionHang => 'Treo ngược';

  @override
  String get routineInversionHangDesc =>
      'Treo ngược giảm áp lực đĩa đệm, có thể tạm thời thêm 1-2cm.';

  @override
  String get routineZincIntake => 'Thực phẩm giàu kẽm';

  @override
  String get routineZincIntakeDesc =>
      'Ăn thực phẩm giàu kẽm trong ngày để hỗ trợ tạo hormone tăng trưởng.';

  @override
  String get routineVitaminDSunlight => 'Vitamin D & ánh nắng';

  @override
  String get routineVitaminDSunlightDesc =>
      'Phơi nắng trực tiếp ít nhất 15 phút để tạo vitamin D và giúp xương phát triển.';

  @override
  String get routineArginineFoods => 'Thực phẩm giàu arginine';

  @override
  String get routineArginineFoodsDesc =>
      'Ăn thực phẩm giàu arginine để kích thích tiết hormone tăng trưởng.';

  @override
  String get routineDailyCalories => 'Mục tiêu calo hằng ngày';

  @override
  String get routineDailyCaloriesDesc =>
      'Ăn đủ calo mỗi ngày. Ăn quá ít làm chậm tăng trưởng.';

  @override
  String get routineSleepEnvironment => 'Tối ưu chỗ ngủ';

  @override
  String get routineSleepEnvironmentDesc =>
      'Ngủ ở nơi tối và mát để tối đa melatonin và hormone tăng trưởng.';

  @override
  String get routinePreSleepRoutine => 'Thư giãn trước khi ngủ';

  @override
  String get routinePreSleepRoutineDesc =>
      'Thói quen trước khi ngủ đều đặn giúp giấc ngủ sâu tốt hơn 23%.';

  @override
  String get routineNeckStretches => 'Giãn cơ cổ';

  @override
  String get routineNeckStretchesDesc =>
      'Giãn cơ cổ giúp giảm chèn ép và cải thiện độ thẳng cột sống cổ.';

  @override
  String get routineShoulderRolls => 'Xoay & mở vai';

  @override
  String get routineShoulderRollsDesc =>
      'Mở vai sửa dáng gù về trước, trông có thể cao hơn 1-2cm.';

  @override
  String get achieveCommitment => 'Cam kết';

  @override
  String get achieveCommitmentDesc =>
      'Nhập đủ dữ liệu, khám phá hết app và bắt đầu dùng';

  @override
  String get achieveFirstDay => 'Bước đầu tiên';

  @override
  String get achieveFirstDayDesc => 'Hoàn thành ngày đầu tiên';

  @override
  String get achieveThreeStreak => 'Chuỗi 3 ngày';

  @override
  String get achieveThreeStreakDesc => 'Hoàn thành thói quen 3 ngày liên tiếp';

  @override
  String get achieveWeekStreak => 'Chuỗi 7 ngày';

  @override
  String get achieveWeekStreakDesc => 'Hoàn thành thói quen 7 ngày liên tiếp';

  @override
  String get achieveTwoWeekStreak => 'Chuỗi 14 ngày';

  @override
  String get achieveTwoWeekStreakDesc => 'Duy trì 14 ngày liên tục';

  @override
  String get achieveMonthStreak => 'Chuỗi 30 ngày';

  @override
  String get achieveMonthStreakDesc => 'Hoàn thành 30 ngày liên tiếp';

  @override
  String get achieveTwoMonthStreak => 'Chuỗi 60 ngày';

  @override
  String get achieveTwoMonthStreakDesc => 'Hoàn thành 60 ngày liên tiếp';

  @override
  String get achieveHundredStreak => 'Chuỗi 100 ngày';

  @override
  String get achieveHundredStreakDesc => 'Hoàn thành 100 ngày liên tiếp';

  @override
  String get achieveFirstMeasure => 'Lần đo đầu tiên';

  @override
  String get achieveFirstMeasureDesc => 'Ghi lần đo chiều cao đầu tiên';

  @override
  String get achieveThreeMeasures => 'Người theo dõi';

  @override
  String get achieveThreeMeasuresDesc => 'Ghi 3 lần đo chiều cao';

  @override
  String get achieveFiveMeasures => 'Theo dõi đều đặn';

  @override
  String get achieveFiveMeasuresDesc => 'Ghi 5 lần đo chiều cao';

  @override
  String get achieveTenMeasures => 'Thợ săn dữ liệu';

  @override
  String get achieveTenMeasuresDesc => 'Ghi 10 lần đo chiều cao';

  @override
  String get achieveFirstCm => 'Centimet đầu tiên';

  @override
  String get achieveFirstCmDesc => 'Ghi nhận tổng cộng tăng 1 cm';

  @override
  String get achieveThreeCm => 'Tăng 3 cm';

  @override
  String get achieveThreeCmDesc => 'Ghi nhận tổng cộng tăng 3 cm';

  @override
  String get achieveFiveCm => 'Tăng 5 cm';

  @override
  String get achieveFiveCmDesc => 'Ghi nhận tổng cộng tăng 5 cm';

  @override
  String get achieveTenCm => 'Tăng 10 cm';

  @override
  String get achieveTenCmDesc => 'Ghi nhận tổng cộng tăng 10 cm';

  @override
  String get quote1 => 'Mỗi ngày, hãy tốt hơn hôm qua.';

  @override
  String get quote2 =>
      'Cao lên không xảy ra sau một đêm, nhưng mỗi đêm đều đưa bạn đến gần hơn.';

  @override
  String get quote3 => 'Phát triển cần kiên nhẫn, cứ tiếp tục nhé!';

  @override
  String get quote4 => 'Bước bạn đi hôm nay xây nền cho ngày mai.';

  @override
  String get quote5 => 'Kỷ luật bắt đầu ở nơi động lực kết thúc.';

  @override
  String get quote6 => 'Cơ thể sẽ cảm ơn bạn, cứ tiếp tục nhé!';

  @override
  String get quote7 => 'Giới hạn tiềm năng là do bạn đặt ra.';

  @override
  String get quote8 => 'Bước nhỏ tạo nên thay đổi lớn.';

  @override
  String get quote9 => 'Khoản đầu tư tốt nhất là đầu tư vào bản thân.';

  @override
  String get quote10 => 'Mỗi ngày bạn lại gần mục tiêu hơn.';

  @override
  String get quote11 => 'Thay đổi thì khó, nhưng hối tiếc còn khó hơn.';

  @override
  String get quote12 => 'Cơ thể là ngôi đền, hãy chăm sóc nó.';

  @override
  String get quote13 =>
      'Đối thủ của bạn là chính bạn hôm qua. Vượt qua nó hôm nay!';

  @override
  String get quote14 => 'BeTaller = Kiên nhẫn + Kỷ luật + Niềm tin';

  @override
  String get quote15 => 'Tin vào bản thân, quá trình sẽ rèn nên bạn.';

  @override
  String get quote16 => 'Hôm nay đừng nói không thể, ngày mai đừng hối tiếc.';

  @override
  String get quote17 => 'Mỗi ngày tiến bộ, dù chỉ 1%.';

  @override
  String get quote18 => 'Gương sẽ cho thấy tiến bộ của bạn, kiên nhẫn nhé.';

  @override
  String get bmiNormal => 'Bình thường';

  @override
  String get bmiUnderweight => 'Thiếu cân';

  @override
  String get bmiOverweight => 'Thừa cân';

  @override
  String get bmiObese => 'Béo phì';

  @override
  String get velocityExcellent => 'Xuất sắc';

  @override
  String get velocityNormal => 'Bình thường';

  @override
  String get velocitySlow => 'Chậm';

  @override
  String get velocityVeryLow => 'Rất thấp';

  @override
  String durationMinutes(String min) {
    return '$min phút';
  }

  @override
  String get durationAllDay => 'Cả ngày';

  @override
  String get durationNight => 'Ban đêm';

  @override
  String durationHours(String hours) {
    return '$hours giờ';
  }

  @override
  String get onboardingStep1 => 'Nhập thông tin cá nhân';

  @override
  String get onboardingStep2 => 'Chia sẻ chiều cao trước đây';

  @override
  String get onboardingStep3 => 'Đánh giá thói quen';

  @override
  String get onboardingStep4 => 'Xem dự đoán và điểm số';

  @override
  String get hoursShort => 'giờ';

  @override
  String get selectLanguage => 'Chọn ngôn ngữ';

  @override
  String get systemLanguage => 'Ngôn ngữ hệ thống';

  @override
  String get emailSubject => 'Góp ý BeTaller';

  @override
  String get pastHeightsTip =>
      'Tuổi nào không nhớ thì bỏ trống. Nhập 1-2 chiều cao trước đây là đủ.';

  @override
  String get obPastHeightsTitle => 'Chiều cao trước đây';

  @override
  String get obPastHeightsSubPart1 =>
      'Chiều cao trước đây giúp dự đoán chính xác hơn.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'Lúc $age tuổi bạn cao bao nhiêu?';
  }

  @override
  String get obSkip => 'Bỏ qua';

  @override
  String get obNext => 'Tiếp';

  @override
  String get obSkipAll => 'Bỏ qua hết';

  @override
  String get currentSuffix => '(hiện tại)';

  @override
  String personalizedProtein(String amount) {
    return 'Trứng, gà, cá, sữa. Ăn ít nhất ${amount}g protein mỗi ngày.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Uống ít nhất ${amount}L nước mỗi ngày. Cần thiết cho trao đổi chất và tăng trưởng.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Hormone tăng trưởng tiết ra khi ngủ. Ngủ ít nhất $hours giờ. 22h-6h là giờ vàng.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Uống sữa, ăn phô mai, sữa chua. Tắm nắng 15 phút. Mục tiêu calo/ngày: $calories kcal.';
  }

  @override
  String get scoreS => 'Xuất sắc! Bạn đang chạm tới đỉnh tiềm năng.';

  @override
  String get scoreA => 'Rất tốt! Cải thiện thêm chút nữa là lên đỉnh.';

  @override
  String get scoreB =>
      'Đúng hướng rồi. Tập trung hơn vào thói quen và dinh dưỡng nhé.';

  @override
  String get scoreC =>
      'Còn cải thiện được. Thói quen đều đặn sẽ tạo khác biệt.';

  @override
  String get scoreD => 'Tiềm năng cao nhưng bạn cần bắt tay vào làm.';

  @override
  String get scoreF => 'Bắt đầu ngay! Mỗi ngày một bước nhỏ tạo khác biệt lớn.';

  @override
  String get cmPerYear => 'cm/năm';

  @override
  String get howToDoIt => 'Cách thực hiện';

  @override
  String get musclesTargeted => 'Cơ & xương tác động';

  @override
  String get scientificBasis => 'Cơ sở khoa học';

  @override
  String setXofY(String current, String total) {
    return 'Hiệp $current/$total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Nghỉ trước hiệp $set';
  }

  @override
  String get allSetsComplete => 'Xong tất cả các hiệp!';

  @override
  String get setTimer => 'Hẹn giờ hiệp';

  @override
  String get setTracker => 'Theo dõi hiệp';

  @override
  String get builtInTimer => 'Đồng hồ tích hợp';

  @override
  String get markComplete => 'Đánh dấu xong';

  @override
  String get markIncomplete => 'Đánh dấu chưa xong';

  @override
  String get done => 'Xong';

  @override
  String get doneExclamation => 'Xong!';

  @override
  String get start => 'Bắt đầu';

  @override
  String get pause => 'Tạm dừng';

  @override
  String get resetTimer => 'Đặt lại';

  @override
  String get skipRest => 'Bỏ qua nghỉ';

  @override
  String get restart => 'Làm lại';

  @override
  String get perSet => 'mỗi hiệp';

  @override
  String get rest => 'NGHỈ';

  @override
  String get reps => 'lần';

  @override
  String get difficultyBeginner => 'Cơ bản';

  @override
  String get difficultyIntermediate => 'Trung bình';

  @override
  String get difficultyAdvanced => 'Nâng cao';

  @override
  String get learnTitle => 'Tìm hiểu';

  @override
  String get learnSubtitle => 'Kiến thức khoa học về tăng trưởng';

  @override
  String get categoryAll => 'Tất cả';

  @override
  String get categoryScience => 'Khoa học';

  @override
  String get categoryNutrition => 'Dinh dưỡng';

  @override
  String get categoryExercise => 'Tập luyện';

  @override
  String get categorySleep => 'Giấc ngủ';

  @override
  String get categoryMyths => 'Lầm tưởng';

  @override
  String get scientificReferences => 'Tài liệu khoa học';

  @override
  String get relatedRoutines => 'Thói quen liên quan';

  @override
  String get nutritionTitle => 'Dinh dưỡng';

  @override
  String get sectionMealPlan => 'Thực đơn';

  @override
  String get sectionNutrients => 'Dưỡng chất';

  @override
  String get sectionFoods => 'Thực phẩm';

  @override
  String get sectionSupplements => 'Thực phẩm bổ sung';

  @override
  String todaysPlan(String day) {
    return 'Kế hoạch hôm nay — $day';
  }

  @override
  String get breakfast => 'Bữa sáng';

  @override
  String get lunch => 'Bữa trưa';

  @override
  String get dinner => 'Bữa tối';

  @override
  String get snacks => 'Bữa phụ';

  @override
  String get searchFoods => 'Tìm thực phẩm...';

  @override
  String nFoods(String count) {
    return '$count thực phẩm';
  }

  @override
  String dailyLabel(String amount) {
    return 'Mỗi ngày: $amount';
  }

  @override
  String get dailyNeedByAge => 'NHU CẦU MỖI NGÀY THEO TUỔI';

  @override
  String agePrefix(String range) {
    return 'Tuổi $range';
  }

  @override
  String get topFoodSources => 'NGUỒN THỰC PHẨM HÀNG ĐẦU';

  @override
  String get categoryDairy => 'Sữa & chế phẩm';

  @override
  String get categoryMeatFish => 'Thịt & cá';

  @override
  String get categoryVegetables => 'Rau củ';

  @override
  String get categoryFruits => 'Trái cây';

  @override
  String get categoryGrains => 'Ngũ cốc & đậu';

  @override
  String get categoryNutsSeeds => 'Các loại hạt';

  @override
  String get weeklyReportTitle => 'Báo cáo tuần';

  @override
  String get weeklyScoreLabel => 'Điểm tuần';

  @override
  String get weeklyDailyCompletion => 'Từng ngày';

  @override
  String get weeklyHabits => 'Thói quen';

  @override
  String get overview => 'Tổng quan';

  @override
  String get routinesLabel => 'Thói quen';

  @override
  String get streakLabel => 'Chuỗi';

  @override
  String get heightLabel => 'Chiều cao';

  @override
  String get weightLabel => 'Cân nặng';

  @override
  String get dadLabel => 'Bố';

  @override
  String get motherLabel => 'Mẹ';

  @override
  String get metricShort => 'Hệ mét';

  @override
  String get imperialShort => 'Hệ Anh';

  @override
  String get dailyScores => 'Điểm mỗi ngày';

  @override
  String get waterToday2 => 'Nước hôm nay';

  @override
  String get sleepToday => 'Giấc ngủ hôm nay';

  @override
  String get routineCompletion => 'Hoàn thành thói quen';

  @override
  String get xpAndLevel => 'XP & cấp độ';

  @override
  String xpToNextLevel(String xp) {
    return 'Còn $xp XP lên cấp';
  }

  @override
  String get activeChallenges => 'Thử thách đang diễn ra';

  @override
  String nOfMCompleted(String n, String m) {
    return 'Xong $n/$m';
  }

  @override
  String get shareYourProgress => 'Chia sẻ tiến độ';

  @override
  String get shareComingSoon => 'Tính năng chia sẻ sắp ra mắt!';

  @override
  String get premiumTest => 'Premium (Thử nghiệm)';

  @override
  String get premiumActive => 'Đang hoạt động';

  @override
  String get premiumFree => 'Miễn phí';

  @override
  String get weeklyReportMenu => 'Báo cáo tuần';

  @override
  String get weeklyReportMenuSubtitle => 'Tóm tắt tiến độ của bạn';

  @override
  String get unlockGrowthPotential => 'Mở khóa toàn bộ tiềm năng chiều cao';

  @override
  String get featureGrowthAnalysis => 'Phân tích tăng trưởng & điểm số';

  @override
  String get featureHeightPrediction => 'Dự đoán chiều cao';

  @override
  String get featureAllRoutines => 'Đủ 14 thói quen hằng ngày';

  @override
  String get featureWaterSleep => 'Theo dõi nước & giấc ngủ';

  @override
  String get featureProgress => 'Tiến độ & số đo';

  @override
  String get featureAchievements => 'Thành tích & chuỗi ngày';

  @override
  String get planMonthly => 'Hằng tháng';

  @override
  String get planYearly => 'Hằng năm';

  @override
  String get bestValue => 'LỜI NHẤT';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'CẤP $level';
  }

  @override
  String get levelBeginner => 'Người mới';

  @override
  String get levelStarter => 'Khởi động';

  @override
  String get levelCommitted => 'Cam kết';

  @override
  String get levelDedicated => 'Tận tâm';

  @override
  String get levelConsistent => 'Đều đặn';

  @override
  String get levelFocused => 'Tập trung';

  @override
  String get levelDetermined => 'Quyết tâm';

  @override
  String get levelDisciplined => 'Kỷ luật';

  @override
  String get levelStrong => 'Mạnh mẽ';

  @override
  String get levelAdvanced => 'Nâng cao';

  @override
  String get levelExpert => 'Chuyên gia';

  @override
  String get levelMaster => 'Bậc thầy';

  @override
  String get levelElite => 'Tinh anh';

  @override
  String get levelChampion => 'Nhà vô địch';

  @override
  String get levelLegend => 'Huyền thoại';

  @override
  String get levelTitan => 'Người khổng lồ';

  @override
  String get levelMythic => 'Thần thoại';

  @override
  String get levelImmortal => 'Bất tử';

  @override
  String get levelTranscendent => 'Siêu việt';

  @override
  String get levelUltimate => 'Tối thượng';

  @override
  String get challengeCompleteAllRoutines => 'Xong mọi thói quen';

  @override
  String get challengeCompleteAllRoutinesDesc =>
      'Hoàn thành tất cả thói quen hôm nay';

  @override
  String get challengeHydrationHero => 'Anh hùng uống nước';

  @override
  String get challengeHydrationHeroDesc => 'Đạt mục tiêu nước hôm nay';

  @override
  String get challengeEarlySleeper => 'Ngủ sớm';

  @override
  String get challengeEarlySleeperDesc => 'Ghi giấc ngủ từ 8 tiếng trở lên';

  @override
  String get challengeExerciseTrio => 'Bộ ba tập luyện';

  @override
  String get challengeExerciseTrioDesc => 'Hoàn thành 3 bài tập';

  @override
  String get challengeMorningStretch => 'Giãn cơ buổi sáng';

  @override
  String get challengeMorningStretchDesc => 'Giãn cơ buổi sáng trước 9h';

  @override
  String get challenge7DayWarrior => 'Chiến binh 7 ngày';

  @override
  String get challenge7DayWarriorDesc =>
      'Hoàn thành mọi thói quen 7 ngày liên tiếp';

  @override
  String get challengeGrowthTracker => 'Theo dõi tăng trưởng';

  @override
  String get challengeGrowthTrackerDesc =>
      'Ghi một lần đo chiều cao trong tuần này';

  @override
  String get challengeHydrationWeek => 'Tuần đủ nước';

  @override
  String get challengeHydrationWeekDesc =>
      'Đạt mục tiêu nước 5 ngày trong tuần';

  @override
  String get challengeFitnessChampion => 'Vua tập luyện';

  @override
  String get challengeFitnessChampionDesc =>
      'Hoàn thành 15 bài tập trong tuần này';

  @override
  String get challengeSleepMaster => 'Bậc thầy giấc ngủ';

  @override
  String get challengeSleepMasterDesc => 'Ngủ từ 8 tiếng trở lên trong 5 ngày';

  @override
  String get performanceDashboard => 'BẢNG HIỆU SUẤT';

  @override
  String get tierA => 'HẠNG A';

  @override
  String get tierB => 'HẠNG B';

  @override
  String get tierC => 'HẠNG C';

  @override
  String get tierD => 'HẠNG D';

  @override
  String get tierE => 'HẠNG E';

  @override
  String get maxTierReached => 'ĐÃ ĐẠT HẠNG CAO NHẤT';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Hạng tiếp: $tier · cần +$pts điểm';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Quản lý thói quen';

  @override
  String get manageRoutinesSubtitle =>
      'Hiện hoặc ẩn thói quen trong danh sách hằng ngày';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return 'Đang bật $visible/$total';
  }

  @override
  String get showAll => 'Hiện tất cả';

  @override
  String get hideAll => 'Ẩn tất cả';

  @override
  String get heightAnalysis => 'Phân tích chiều cao';

  @override
  String get heightVsPopulation => 'Vị trí của bạn trên biểu đồ CDC';

  @override
  String get globalAveragesTable => 'Chiều cao trung bình theo tuổi (CDC)';

  @override
  String get standingTall => 'Cao vượt trội';

  @override
  String get standingAboveAverage => 'Trên trung bình';

  @override
  String get standingBelowAverage => 'Dưới trung bình';

  @override
  String get standingShort => 'Thấp hơn bạn bè';

  @override
  String get yourHeightStanding => 'VỊ TRÍ CHIỀU CAO CỦA BẠN';

  @override
  String get bellCurveCaption => 'Phân bố chiều cao ở độ tuổi của bạn';

  @override
  String get bellShorterThanYou => 'thấp hơn bạn';

  @override
  String get yourHeight => 'Bạn';

  @override
  String peerAvg(int age) {
    return 'TB tuổi $age';
  }

  @override
  String get aboveAvg => 'Trên TB';

  @override
  String get belowAvg => 'Dưới TB';

  @override
  String get whoDataSource => 'Biểu đồ tăng trưởng CDC Hoa Kỳ';

  @override
  String get percentileShort5 => 'Thứ 5';

  @override
  String get percentileShort50 => 'Thứ 50';

  @override
  String get percentileShort95 => 'Thứ 95';

  @override
  String get youLabel => 'Bạn';

  @override
  String get avgHeightLabel => 'TB';

  @override
  String get percentileLabel => 'BÁCH PHÂN VỊ';

  @override
  String get diffLabel => 'CHÊNH';

  @override
  String get whoSourceNote =>
      'Nguồn dữ liệu: biểu đồ tăng trưởng CDC 2000 của Hoa Kỳ (chiều cao theo tuổi, 2 đến 20 tuổi). Bách phân vị so sánh bạn với dân số Mỹ và có thể khác ở mỗi quốc gia.';

  @override
  String get quickPhotos => 'Ảnh';

  @override
  String get quickPosture => 'Tư thế';

  @override
  String get quickWellness => 'Sức khỏe';

  @override
  String get quickRecipes => 'Công thức';

  @override
  String get wellnessTitle => 'Theo dõi sức khỏe';

  @override
  String get wellnessHeader => 'SỨC KHỎE';

  @override
  String get wellnessSubtitle =>
      'Theo dõi các yếu tố ảnh hưởng đến tăng trưởng';

  @override
  String get caffeineToday => 'Caffeine hôm nay';

  @override
  String get withinLimits => 'Trong mức an toàn';

  @override
  String get approachingLimit => 'Gần chạm giới hạn';

  @override
  String get overLimit => 'Quá giới hạn, ảnh hưởng HGH';

  @override
  String get resetToday => 'Đặt lại hôm nay';

  @override
  String get stressToday => 'Căng thẳng hôm nay';

  @override
  String get stressVeryCalmLabel => 'Rất bình tĩnh, tốt nhất cho tăng trưởng';

  @override
  String get stressCalmLabel => 'Bình tĩnh';

  @override
  String get stressNeutralLabel => 'Bình thường';

  @override
  String get stressStressedLabel => 'Căng thẳng';

  @override
  String get stressVeryStressedLabel => 'Rất căng thẳng, cortisol chặn HGH';

  @override
  String get stressTapToLog => 'Chạm để ghi cảm nhận hôm nay';

  @override
  String get todaysJournal => 'Nhật ký hôm nay';

  @override
  String get journalNoNote => '(không có ghi chú)';

  @override
  String get journalEdit => 'Sửa';

  @override
  String get journalHowWasToday => 'Hôm nay thế nào?';

  @override
  String get journalSaved => 'Đã lưu nhật ký · +5 XP';

  @override
  String get journalSaveEntry => 'Lưu nhật ký';

  @override
  String get weeklyInsight => 'Nhận xét tuần';

  @override
  String get weeklyInsightCaffeine => 'CAFFEINE';

  @override
  String get weeklyInsightStress => 'CĂNG THẲNG';

  @override
  String get weeklyInsightMood => 'TÂM TRẠNG';

  @override
  String get wellnessInfoTitle => 'Vì sao sức khỏe tinh thần quan trọng';

  @override
  String get wellnessInfoBody =>
      'Caffeine cản trở giấc ngủ sâu, lúc phần lớn hormone tăng trưởng (HGH) được tiết ra. Căng thẳng kéo dài làm tăng cortisol, chất ức chế trực tiếp HGH. Viết nhật ký giúp bạn duy trì các thói quen hỗ trợ tăng trưởng.';

  @override
  String get wellnessInfoGotIt => 'Đã hiểu';

  @override
  String get insightCaffeineHigh =>
      'Tuần này bạn nạp nhiều caffeine. Thử giảm bớt để ngủ ngon hơn và tốt cho HGH.';

  @override
  String get insightStressHigh =>
      'Tuần này căng thẳng hơi cao. Thử vài bài tập thở nhé: cortisol cản trở tăng trưởng.';

  @override
  String get insightMoodLow =>
      'Gần đây tâm trạng hơi xuống. Ánh nắng, giấc ngủ và vận động nhẹ đều có ích.';

  @override
  String get insightGreat =>
      'Tuần này cân bằng rất tốt. Sức khỏe của bạn đang hỗ trợ tăng trưởng tối ưu.';

  @override
  String get insightDefault =>
      'Sức khỏe của bạn đang ổn. Cứ ghi tiếp để có nhận xét sâu hơn.';

  @override
  String get insightNeedMoreData => 'Ghi thêm vài ngày nữa để xem nhận xét.';

  @override
  String get progressPhotosTitle => 'Ảnh tiến độ';

  @override
  String get progressPhotosHeader => 'ẢNH TIẾN ĐỘ';

  @override
  String get progressPhotosSubtitle => 'Theo dõi hành trình bằng hình ảnh';

  @override
  String get addProgressPhoto => 'Thêm ảnh tiến độ';

  @override
  String get captureJourney => 'Ghi lại hành trình bằng hình ảnh';

  @override
  String get takePhoto => 'Chụp ảnh';

  @override
  String get chooseFromLibrary => 'Chọn từ thư viện';

  @override
  String get deletePhotoTitle => 'Xóa ảnh?';

  @override
  String get deletePhotoBody =>
      'Ảnh này sẽ bị xóa khỏi dòng thời gian tiến độ.';

  @override
  String get timelineTab => 'Dòng thời gian';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ảnh',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit trong $days ngày';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'ngày',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit đã tăng';
  }

  @override
  String get firstPhotoMessage =>
      'Chụp ảnh đầu tiên để bắt đầu theo dõi tiến độ bằng hình ảnh.';

  @override
  String get takeFirstPhoto => 'Chụp ảnh đầu tiên';

  @override
  String get beforeAfter => 'TRƯỚC / SAU';

  @override
  String get beforeLabel => 'TRƯỚC';

  @override
  String get afterLabel => 'SAU';

  @override
  String get yourHeightDialog => 'Chiều cao của bạn';

  @override
  String get heightDialogMessage => 'Nhập chiều cao hiện tại cho ảnh này';

  @override
  String get postureAnalysisTitle => 'Phân tích tư thế';

  @override
  String get postureCoachHeader => 'HUẤN LUYỆN TƯ THẾ';

  @override
  String get postureCoachSubtitle => 'Tự kiểm tra bằng ảnh chụp nghiêng';

  @override
  String get latestScore => 'ĐIỂM GẦN NHẤT';

  @override
  String get latestAnalysis => 'PHÂN TÍCH GẦN NHẤT';

  @override
  String get headPosition => 'Vị trí đầu';

  @override
  String get progressLabel => 'TIẾN ĐỘ';

  @override
  String get choosePhotoSource => 'Chọn nguồn ảnh';

  @override
  String get sideProfileHint => 'Chụp nghiêng, thấy toàn thân';

  @override
  String get howToTakePhoto => 'CÁCH CHỤP ẢNH';

  @override
  String get takePosturePhoto => 'Chụp ảnh tư thế';

  @override
  String get postureExcellent => 'Xuất sắc';

  @override
  String get postureGood => 'Tốt';

  @override
  String get postureNeedsWork => 'Cần cải thiện';

  @override
  String get posturePoor => 'Kém';

  @override
  String get recommendedExercises => 'BÀI TẬP GỢI Ý';

  @override
  String get postureWallStand => 'Đứng áp tường';

  @override
  String get postureWallStandDesc => 'Đứng dựa lưng vào tường 2 phút mỗi ngày.';

  @override
  String get postureChestOpener => 'Mở ngực';

  @override
  String get postureChestOpenerDesc =>
      'Giãn cơ ngực bị căng, thứ kéo vai về phía trước.';

  @override
  String get postureChinTucks => 'Thu cằm';

  @override
  String get postureChinTucksDesc => 'Sửa tư thế đầu đưa ra trước — 3×10 lần.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Tăng sức mạnh cơ lõi sâu để kiểm soát cong lưng dưới.';

  @override
  String get recipesTitle => 'Công thức';

  @override
  String get recipesHeader => 'CÔNG THỨC';

  @override
  String get recipesSubtitle => 'Tiếp năng lượng cho tăng trưởng';

  @override
  String get recipesCategoryAll => 'Tất cả';

  @override
  String get recipesCategoryBreakfast => 'Bữa sáng';

  @override
  String get recipesCategoryLunch => 'Bữa trưa';

  @override
  String get recipesCategoryDinner => 'Bữa tối';

  @override
  String get recipesCategorySnack => 'Bữa phụ';

  @override
  String get recipesGoalAll => 'Tất cả';

  @override
  String get recipeDiffEasy => 'Dễ';

  @override
  String get recipeDiffMedium => 'Vừa';

  @override
  String get recipeDiffHard => 'Khó';

  @override
  String get recipesFilterType => 'LOẠI';

  @override
  String get recipesFilterNutrient => 'GIÀU';

  @override
  String get recipesGoalVitaminD => 'Vitamin D';

  @override
  String get recipesGoalZinc => 'Kẽm';

  @override
  String get recipesGoalMagnesium => 'Magie';

  @override
  String recipesCountLabel(int count) {
    return '$count công thức';
  }

  @override
  String get recipeIngredients => 'Nguyên liệu';

  @override
  String get recipeSteps => 'Cách làm';

  @override
  String get recipesGoalProtein => 'Giàu protein';

  @override
  String get recipesGoalCalcium => 'Canxi';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'Sắt';

  @override
  String get recipesNoMatch => 'Không có công thức nào khớp bộ lọc';

  @override
  String get recipesIngredients => 'Nguyên liệu';

  @override
  String get recipesInstructions => 'Hướng dẫn';

  @override
  String get recipesClose => 'ĐÓNG';

  @override
  String get recipesAboutTitle => 'Về công thức';

  @override
  String get recipesAboutBody =>
      'Các công thức được chọn lọc để tiếp năng lượng cho tăng trưởng. Lọc theo bữa ăn hoặc mục tiêu dinh dưỡng để tìm món hợp kế hoạch của bạn.';

  @override
  String get animHintSpinalDecomp => 'Giảm áp cột sống';

  @override
  String get animHintGravityReversal => 'Đảo chiều trọng lực';

  @override
  String get animHintImpactBones => 'Tác động lực lên xương';

  @override
  String get animHintHighImpact => 'Tác động mạnh lên xương';

  @override
  String get animHintMetabolicBurst => 'Tập bùng nổ trao đổi chất';

  @override
  String get animHintFullBodyStretch => 'Giãn cơ toàn thân buổi sáng';

  @override
  String get animHintSpinalExtension => 'Duỗi cột sống';

  @override
  String get animHintCervicalDecomp => 'Giảm áp cột sống cổ';

  @override
  String get animHintShoulderMobility => 'Linh hoạt vai';

  @override
  String get animHintFullBodyMotion => 'Vận động toàn thân';

  @override
  String get animHintPosteriorChain => 'Giãn chuỗi cơ sau';

  @override
  String get animHintMuscleGrowth => 'Nhiên liệu cho cơ';

  @override
  String get animHintBoneDensity => 'Hỗ trợ mật độ xương';

  @override
  String get animHintSpinalDisc => 'Cấp nước cho đĩa đệm';

  @override
  String get animHintCleanNutrition => 'Ăn uống sạch';

  @override
  String get animHintIgf1 => 'Tối ưu IGF-1';

  @override
  String get animHintHghAmino => 'Axit amin tiền chất HGH';

  @override
  String get animHintCalciumAbsorption => 'Hấp thu canxi';

  @override
  String get animHintSpinalAlignment => 'Cột sống thẳng hàng';

  @override
  String get animHintPostureCorrection => 'Chỉnh tư thế';

  @override
  String get animHintMindBody => 'Cân bằng thân - tâm';

  @override
  String get animHintCoreStability => 'Ổn định cơ lõi';

  @override
  String get animHintLegPower => 'Sức mạnh chân & tăng HGH';

  @override
  String get animHintVerticalPower => 'Sức bật';

  @override
  String get animHintHghSurge => 'Tập tăng vọt HGH';

  @override
  String get animHintPeakHgh => 'Khung giờ HGH đạt đỉnh';

  @override
  String get animHintMelatonin => 'Tối ưu melatonin';

  @override
  String get animHintDeepSleep => 'Chuẩn bị ngủ sâu';

  @override
  String get animHintSleepOpt => 'Tối ưu giấc ngủ';

  @override
  String get animHintExercise => 'Tập luyện';

  @override
  String get formMorningStretch =>
      'Bắt đầu bằng xoay cổ, rồi chuyển sang giãn toàn thân. Giữ mỗi động tác 20-30 giây, không nhún.';

  @override
  String get formBarHanging =>
      'Nắm xà rộng bằng vai, thả lỏng toàn thân, để trọng lực kéo giãn cột sống. Tránh đung đưa.';

  @override
  String get formCobraStretch =>
      'Nằm sấp, đặt tay dưới vai, từ từ đẩy thân trên lên, giữ hông sát sàn. Nhìn lên trên.';

  @override
  String get formJumping =>
      'Squat nhảy hoặc nhảy dây. Tiếp đất nhẹ bằng mũi chân. Nghỉ 30 giây giữa các hiệp.';

  @override
  String get formSwimmingBasketball =>
      'Chọn bơi (sải/ngửa) hoặc bóng rổ. Tập trung vào bật nhảy, vươn người và biên độ vận động đầy đủ.';

  @override
  String get formEveningYoga =>
      'Tập các tư thế nhẹ: mèo-bò, em bé, chó úp mặt, gập người. Thở sâu và giữ mỗi tư thế 30-60 giây.';

  @override
  String get formSprintIntervals =>
      'Khởi động 5 phút, rồi chạy nước rút hết sức 30 giây. Đi bộ hoặc chạy chậm 90 giây để hồi sức. Lặp lại.';

  @override
  String get formHiitWorkout =>
      'Tập burpee, leo núi, squat nhảy với cường độ tối đa trong 45 giây, nghỉ 15 giây.';

  @override
  String get formSquats =>
      'Đứng chân rộng bằng vai. Hạ người đến khi đùi song song mặt đất. Giữ lưng thẳng, gối không vượt mũi chân.';

  @override
  String get formDeadliftStretch =>
      'Đứng chân rộng bằng hông, gập từ hông và giữ lưng phẳng. Vươn tay về mũi chân, cảm nhận độ căng ở đùi sau và lưng.';

  @override
  String get formOverheadPress =>
      'Đứng thẳng, đẩy tay qua đầu duỗi hết cỡ. Dùng tạ nhẹ hoặc tay không. Siết cơ bụng, tránh ưỡn lưng.';

  @override
  String get formSkippingRope =>
      'Nhảy bằng hai chân, tiếp đất nhẹ bằng mũi chân. Nhảy thấp và đều. Nghỉ giữa các hiệp.';

  @override
  String get formPilatesCore =>
      'Tập plank, dead bug, bird dog, cầu mông và nâng chân. Tập trung vào kiểm soát động tác và hơi thở.';

  @override
  String get formInversionHang =>
      'Dùng bàn treo ngược hoặc giày treo ngược. Bắt đầu với độ nghiêng nhẹ rồi tăng dần. Giữ mỗi buổi thật ngắn.';

  @override
  String get formProtein =>
      'Chia protein ra 3-4 bữa. Ăn trứng, gà, cá, sữa và các loại đậu.';

  @override
  String get formCalciumVitaminD =>
      'Dùng 3 phần sữa và chế phẩm mỗi ngày, phơi nắng 15 phút để cơ thể tự tạo vitamin D.';

  @override
  String get formWater =>
      'Uống nước đều suốt cả ngày. Mang theo bình nước và đặt nhắc mỗi giờ.';

  @override
  String get formAvoidJunk =>
      'Thay đồ ăn nhanh bằng thực phẩm tươi. Đổi nước ngọt thành nước lọc. Đọc nhãn và tránh thành phần chế biến sẵn.';

  @override
  String get formZincIntake =>
      'Thêm thịt đỏ, hạt bí, đậu gà, hạt điều và hàu vào bữa ăn. Hướng tới 8-11mg mỗi ngày.';

  @override
  String get formVitaminDSunlight =>
      'Để tay và mặt tiếp xúc ánh nắng trực tiếp 15 phút, tốt nhất trước buổi trưa. Thời gian này không cần kem chống nắng.';

  @override
  String get formArginineFoods =>
      'Thêm các loại hạt, gà tây, gà, đậu nành và sữa vào bữa ăn. Tốt nhất là ăn trước khi ngủ.';

  @override
  String get formDailyCalories =>
      'Chia calo ra 3-5 bữa và đừng bỏ bữa sáng. Ưu tiên thực phẩm nguyên chất thay vì calo rỗng.';

  @override
  String get formQualitySleep =>
      'Đi ngủ trước 22h. Giữ phòng tối và mát. Tránh caffeine sau 14h.';

  @override
  String get formNoScreen =>
      'Đặt báo thức 1 tiếng trước giờ ngủ. Cất hết màn hình đi. Thay vào đó hãy đọc sách hoặc giãn cơ nhẹ.';

  @override
  String get formSleepEnvironment =>
      'Dùng rèm chắn sáng, giữ phòng ở 18-20°C, tắt mọi nguồn sáng. Dùng nệm và gối thoải mái.';

  @override
  String get formPreSleepRoutine =>
      'Bắt đầu 30 phút trước khi ngủ: giảm đèn, đọc sách, tập thở, tránh hoạt động gây hưng phấn.';

  @override
  String get formPostureCheck =>
      'Đứng thẳng, vai mở ra sau và hạ xuống. Siết nhẹ cơ bụng. Tưởng tượng có sợi dây kéo bạn lên từ đỉnh đầu.';

  @override
  String get formWallStand =>
      'Đứng sao cho gót, mông, xương bả vai và đầu chạm tường. Giữ 5 phút. Thở bình thường.';

  @override
  String get formNeckStretches =>
      'Nghiêng đầu chậm sang từng bên, ra trước và ra sau. Giữ mỗi hướng 30 giây. Đừng cố quá sức.';

  @override
  String get formShoulderRolls =>
      'Xoay vai ra trước 15 lần, rồi ra sau 15 lần. Sau đó giãn mở ngực, giữ 20 giây.';

  @override
  String get sciMorningStretch =>
      'Giãn cơ buổi sáng giảm áp cho đĩa đệm vừa được bù nước qua đêm, giúp giữ chiều cao tối đa';

  @override
  String get sciBarHanging =>
      'Treo xà dùng trọng lực kéo giãn cột sống, giảm áp đĩa đệm và có thể tạm thời tăng chiều cao';

  @override
  String get sciCobraStretch =>
      'Tư thế rắn hổ mang duỗi cột sống và mở ngực, chống lại sự chèn ép do ngồi nhiều';

  @override
  String get sciJumping =>
      'Bật nhảy cường độ cao kích thích sụn tăng trưởng ở chân và thúc đẩy tiết hormone tăng trưởng';

  @override
  String get sciSwimmingBasketball =>
      'Bơi và bóng rổ có nhiều động tác giãn toàn thân, bật nhảy và vươn người, kích thích sụn tăng trưởng';

  @override
  String get sciEveningYoga =>
      'Yoga buổi tối giảm cortisol, chất ức chế hormone tăng trưởng, và giãn cơ để phục hồi qua đêm';

  @override
  String get sciSprintIntervals =>
      'Chạy nước rút thúc đẩy tiết nhiều hormone tăng trưởng';

  @override
  String get sciHiitWorkout => 'Tập cường độ cao làm tăng HGH tới 450%';

  @override
  String get sciSquats => 'Squat kích thích sụn tăng trưởng ở chân và cột sống';

  @override
  String get sciDeadliftStretch => 'Giảm áp cột sống giúp đĩa đệm khỏe mạnh';

  @override
  String get sciOverheadPress =>
      'Đẩy tay qua đầu kéo giãn cột sống và làm khỏe cơ giữ tư thế';

  @override
  String get sciSkippingRope =>
      'Nhảy lặp lại kích thích sụn tăng trưởng ở chân';

  @override
  String get sciPilatesCore => 'Cơ lõi khỏe giúp cột sống thẳng và tư thế đẹp';

  @override
  String get sciInversionHang =>
      'Treo ngược giảm áp đĩa đệm, có thể tạm thời thêm 1-2cm';

  @override
  String get sciProtein =>
      'Protein cung cấp axit amin cần cho xương và cơ phát triển, nhất là trong giai đoạn dậy thì';

  @override
  String get sciCalciumVitaminD =>
      'Canxi và vitamin D là nền tảng chính cho mật độ xương và sự dài ra của xương';

  @override
  String get sciWater =>
      'Đủ nước giúp vận chuyển dưỡng chất tới sụn tăng trưởng và giữ sụn khớp khỏe mạnh';

  @override
  String get sciAvoidJunk =>
      'Đồ chế biến sẵn và đường gây viêm, tăng vọt insulin, làm giảm tiết hormone tăng trưởng';

  @override
  String get sciZincIntake => 'Kẽm cần thiết để tạo hormone tăng trưởng';

  @override
  String get sciVitaminDSunlight =>
      'Vitamin D rất quan trọng để hấp thu canxi và phát triển xương';

  @override
  String get sciArginineFoods =>
      'L-Arginine kích thích tiết hormone tăng trưởng';

  @override
  String get sciDailyCalories =>
      'Thiếu calo kéo dài làm giảm IGF-1 và yếu các đợt tiết hormone tăng trưởng, trực tiếp làm chậm phát triển chiều cao ở tuổi dậy thì';

  @override
  String get sciQualitySleep =>
      '70-80% hormone tăng trưởng mỗi ngày được tiết ra trong giấc ngủ sâu, nhất là từ 22h đến 2h';

  @override
  String get sciNoScreen =>
      'Ánh sáng xanh từ màn hình ức chế melatonin, làm bạn khó ngủ hơn và giảm chất lượng giấc ngủ sâu';

  @override
  String get sciSleepEnvironment =>
      'Chỗ ngủ tối và mát giúp tối đa melatonin và hormone tăng trưởng';

  @override
  String get sciPreSleepRoutine =>
      'Thói quen trước khi ngủ đều đặn giúp giấc ngủ sâu tốt hơn 23%';

  @override
  String get sciPostureCheck =>
      'Tư thế đúng có thể ngay lập tức giúp trông cao hơn 2-3 cm và ngăn chèn ép cột sống';

  @override
  String get sciWallStand =>
      'Đứng áp tường rèn trí nhớ cơ cho tư thế, giúp giữ cột sống thẳng suốt cả ngày';

  @override
  String get sciNeckStretches =>
      'Giãn cơ cổ giúp giảm chèn ép và cải thiện độ thẳng cột sống cổ';

  @override
  String get sciShoulderRolls =>
      'Mở vai sửa dáng gù về trước, trông có thể cao hơn 1-2cm';

  @override
  String get muscleSpine => 'Cột sống';

  @override
  String get muscleLegs => 'Chân';

  @override
  String get muscleBack => 'Lưng';

  @override
  String get muscleShoulders => 'Vai';

  @override
  String get muscleArms => 'Tay';

  @override
  String get muscleCore => 'Cơ lõi';

  @override
  String get muscleChest => 'Ngực';

  @override
  String get muscleCalves => 'Bắp chân';

  @override
  String get muscleFullBody => 'Toàn thân';

  @override
  String get muscleHips => 'Hông';

  @override
  String get muscleBones => 'Xương';

  @override
  String get muscleMuscles => 'Cơ';

  @override
  String get muscleNeck => 'Cổ';

  @override
  String get muscleUpperSpine => 'Cột sống trên';

  @override
  String get muscleUpperBack => 'Lưng trên';

  @override
  String get createRoutine => 'Tạo thói quen';

  @override
  String get createRoutineTitle => 'Tạo thói quen riêng';

  @override
  String get createRoutineSubtitle => 'Tự xây thói quen hằng ngày của bạn';

  @override
  String get routineIcon => 'Biểu tượng';

  @override
  String get routineTitleField => 'Tiêu đề';

  @override
  String get routineDescField => 'Mô tả';

  @override
  String get routineDescHint => 'Tóm tắt ngắn về thói quen';

  @override
  String get routineCategoryField => 'Danh mục';

  @override
  String get routineDifficultyField => 'Độ khó';

  @override
  String get routineDurationField => 'Thời lượng';

  @override
  String get routineSetsRepsField => 'Hiệp x Lần';

  @override
  String get routineFormField => 'Kỹ thuật & hướng dẫn';

  @override
  String get routineFormHint => 'Tùy chọn: cách thực hiện thói quen này';

  @override
  String get diffBeginner => 'Cơ bản';

  @override
  String get diffIntermediate => 'Trung bình';

  @override
  String get diffAdvanced => 'Nâng cao';

  @override
  String get catExercise => 'Tập luyện';

  @override
  String get catNutrition => 'Dinh dưỡng';

  @override
  String get catSleep => 'Giấc ngủ';

  @override
  String get catPosture => 'Tư thế';

  @override
  String get postureTip1 => 'Đứng nghiêng (góc nghiêng) với camera.';

  @override
  String get postureTip2 => 'Đứng cách ống kính khoảng 2 mét.';

  @override
  String get postureTip3 => 'Thả lỏng tay, nhìn thẳng phía trước.';

  @override
  String get postureTip4 => 'Mặc đồ ôm sát để chấm điểm chính xác.';

  @override
  String get postureTip5 => 'Chụp nơi đủ sáng, phông nền trơn.';

  @override
  String get kyphosisLabel => 'Gù (lưng trên)';

  @override
  String get lordosisLabel => 'Ưỡn (lưng dưới)';

  @override
  String get analyzingPosture => 'ĐANG PHÂN TÍCH TƯ THẾ';

  @override
  String get privacyPolicy => 'Chính sách bảo mật';

  @override
  String get termsOfService => 'Điều khoản dịch vụ';

  @override
  String version(String ver) {
    return 'Phiên bản $ver';
  }

  @override
  String get rateApp => 'Đánh giá BeTaller';

  @override
  String get rateAppSubtitle => 'Đánh giá của bạn giúp tụi mình phát triển!';

  @override
  String get unitSystem => 'Hệ đơn vị';

  @override
  String get unitMetric => 'Hệ mét (cm, kg)';

  @override
  String get unitImperial => 'Hệ Anh (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Lưu ý sức khỏe';

  @override
  String get healthDisclaimerBody =>
      'BeTaller cung cấp hướng dẫn chung về sức khỏe và thể chất. Kết quả khác nhau tùy tuổi, di truyền và yếu tố cá nhân. Ứng dụng này không đưa ra lời khuyên y tế. Các bài tập tập trung vào cải thiện tư thế, sức khỏe cột sống và hỗ trợ hormone tăng trưởng qua thói quen tự nhiên. Hãy hỏi ý kiến chuyên gia y tế trước khi bắt đầu chương trình tập luyện hay dinh dưỡng mới. Sau khi sụn tăng trưởng đóng lại (thường ở tuổi 18-25), thay đổi chiều cao chủ yếu đến từ cải thiện tư thế.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Hôm nay nạp ít nhất ${grams}g protein — tính theo cân nặng của bạn.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Hôm nay uống ít nhất ${liters}L nước — tính theo cân nặng của bạn.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Hôm nay hướng tới khoảng $kcal kcal để tiếp năng lượng cho tăng trưởng.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Hôm nay nạp $iu IU vitamin D — từ ánh nắng, thức ăn hoặc thực phẩm bổ sung.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Hôm nay nạp ${mg}mg kẽm để hỗ trợ tạo hormone tăng trưởng.';
  }

  @override
  String get nutritionSupplementsTitle => 'THỰC PHẨM BỔ SUNG';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Chỉ là hỗ trợ thêm, không thay thế bữa ăn. Hãy hỏi bác sĩ trước khi dùng bất kỳ loại nào, nhất là khi dưới 18 tuổi.';

  @override
  String get supplementVitaminDName => 'Vitamin D3';

  @override
  String get supplementVitaminDDose => '3.000 IU';

  @override
  String get supplementVitaminDBenefit =>
      'Tăng hấp thu canxi cho mật độ xương và sụn tăng trưởng khỏe mạnh';

  @override
  String get supplementZincName => 'Kẽm';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit =>
      'Khoáng chất then chốt để tạo hormone tăng trưởng';

  @override
  String get supplementMagnesiumName => 'Magie';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Hỗ trợ giấc ngủ sâu, lúc phần lớn hormone tăng trưởng được tiết ra';

  @override
  String get supplementCalciumName => 'Canxi';

  @override
  String get supplementCalciumDose => '1.000-1.300mg';

  @override
  String get supplementCalciumBenefit =>
      'Nền tảng chính của mật độ xương và sụn tăng trưởng';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1.000mg';

  @override
  String get supplementOmega3Benefit =>
      'Giảm viêm và hỗ trợ sụn tăng trưởng hoạt động tốt';

  @override
  String get supplementCollagenName => 'Collagen + Vitamin C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit =>
      'Vitamin C giúp cơ thể dùng collagen để xây sụn và khung xương';

  @override
  String get sciSourcePrefix => 'Nguồn: ';

  @override
  String get program => 'Chương trình';

  @override
  String get todaysExercises => 'BÀI TẬP HÔM NAY';

  @override
  String get dailyNutritionPlan => 'KẾ HOẠCH DINH DƯỠNG HÔM NAY';

  @override
  String get nutritionGoalsComplete => '🎉 Đã xong mọi mục tiêu dinh dưỡng!';

  @override
  String get nutritionGoalsIncomplete =>
      'Hoàn thành mục tiêu dinh dưỡng để tăng trưởng tối ưu';

  @override
  String get postureDetectingAlignment => 'Đang nhận diện độ thẳng cột sống...';

  @override
  String get testimonial1 =>
      'Mình từng hết hy vọng vì tuổi tác, nhưng mình đã cao lên nhờ BeTaller. Chưa bao giờ mình tự tin như bây giờ.';

  @override
  String get testimonialDuration1 => '4 tháng';

  @override
  String get testimonial2 =>
      'Ai cũng bảo \"không cao thêm được nữa đâu\". Mình dùng BeTaller và làm mọi người bất ngờ.';

  @override
  String get testimonialDuration2 => '3 tháng';

  @override
  String get testimonial3 =>
      'Từ khi bắt đầu các thói quen, mình cao hơn và dáng đứng đẹp hơn. Ai cũng nhận ra sự khác biệt.';

  @override
  String get testimonialDuration3 => '6 tháng';

  @override
  String get testimonial4 =>
      'Mình vẫn đang tuổi phát triển và hiệu quả của BeTaller thật khó tin. Mình thấy cao hơn và khỏe hơn.';

  @override
  String get testimonialDuration4 => '3 tháng';

  @override
  String get testimonial5 =>
      'Nói không thử BeTaller là nói dối. Mình thấy khác biệt thật rất nhanh, rất nên dùng.';

  @override
  String get testimonialDuration5 => '4 tháng';

  @override
  String get designedForYou => 'Thiết kế cho bạn';

  @override
  String get designedForYouDesc =>
      'BeTaller được tạo ra để giúp bạn chạm tới giới hạn di truyền, thậm chí vượt qua nó. Mọi tính năng, đều vì bạn.';

  @override
  String get greetingAllDone => 'Làm tốt lắm! 🎯';

  @override
  String get greetingAllDoneSub => 'Bạn đã xong nhiệm vụ hôm nay.';

  @override
  String greetingStreak30(int streak) {
    return 'Chuỗi $streak ngày. Đẳng cấp huyền thoại.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'Chuỗi $streak ngày. Cứ thế nhé.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak ngày liên tiếp. Nhiều người bỏ cuộc. Bạn thì không.';
  }

  @override
  String get greetingMorning => 'Chào buổi sáng. Ngày mới, cơ hội mới.';

  @override
  String get greetingAfternoon => 'Hôm nay là ngày tuyệt vời để bắt đầu chuỗi.';

  @override
  String get greetingEvening => 'Hoàn thành nhiệm vụ, bắt đầu chuỗi nào.';

  @override
  String get todayCompleted => 'Đã xong hôm nay ✓';

  @override
  String get todayGoals => 'Mục tiêu hôm nay';

  @override
  String get challengesLabel => 'Thử thách';

  @override
  String get dailyChallengesLabel => 'THỬ THÁCH HẰNG NGÀY';

  @override
  String get expiresTonight => 'Hết hạn tối nay';

  @override
  String get allChallengesCompleted => 'Đã xong hết ✓';

  @override
  String get challengesLoading => 'Thử thách mới sắp xuất hiện.';

  @override
  String get challengesLoadingTitle => 'Thử thách hằng ngày';

  @override
  String get behindPace => 'Đang chậm tiến độ';

  @override
  String get growthTracking => 'Theo dõi tăng trưởng';

  @override
  String get growthEmptyFirst => 'Ghi chiều cao đầu tiên để bắt đầu theo dõi.';

  @override
  String get growthEmptySecond => 'Ghi lần đo thứ hai để xem biểu đồ.';

  @override
  String get growthSectionLabel => 'TĂNG TRƯỞNG';

  @override
  String get generalPerformance => 'HIỆU SUẤT TỔNG THỂ';

  @override
  String get analysisBalance => 'Độ cân bằng';

  @override
  String get analysisWeakest => 'Điểm yếu nhất';

  @override
  String get analysisPrediction => 'Dự đoán chiều cao';

  @override
  String get analysisComparison => 'So sánh';

  @override
  String get analysisGrowth => 'Tình trạng tăng trưởng';

  @override
  String get analysisWeakestHint => 'Đây là chỗ nhanh nhất để tăng điểm.';

  @override
  String get exploreLabel => 'KHÁM PHÁ';

  @override
  String get explorePosture => 'Phân tích tư thế';

  @override
  String get explorePostureSub => 'Phân tích tư thế và mẹo chỉnh sửa';

  @override
  String get explorePhotos => 'Ảnh tiến độ';

  @override
  String get explorePhotosSub => 'Theo dõi sự thay đổi qua ảnh';

  @override
  String get exploreNutrition => 'Dinh dưỡng';

  @override
  String get exploreNutritionSub => 'Hướng dẫn protein, canxi và vitamin';

  @override
  String get exploreHealth => 'Theo dõi sức khỏe';

  @override
  String get exploreHealthSub => 'Theo dõi căng thẳng, caffeine và sức khỏe';

  @override
  String get exploreRecipes => 'Công thức tăng trưởng';

  @override
  String get exploreRecipesSub => 'Món ăn hỗ trợ tăng trưởng';

  @override
  String get educationLabel => 'KIẾN THỨC';

  @override
  String get educationTitle => 'Khoa học về\nchiều cao';

  @override
  String get educationSubtitle =>
      'Nội dung chuyên gia, nghiên cứu và hướng dẫn';

  @override
  String get aiAnalysisLabel => 'PHÂN TÍCH TĂNG TRƯỞNG';

  @override
  String get peerCompareLabel => 'SO VỚI BẠN BÈ';

  @override
  String peerCompareText(int topPct) {
    return 'Bạn thuộc Top $topPct% so với bạn cùng tuổi';
  }

  @override
  String get notifWaterTitle => '💧 Đừng quên uống nước!';

  @override
  String get notifWaterBody =>
      'Bạn đạt mục tiêu nước hôm nay chưa? Uống thêm một ly nhé!';

  @override
  String get notifMorningTitle => '🌅 Chào buổi sáng! Đến giờ tập';

  @override
  String get notifMorningBody =>
      'Giãn cơ buổi sáng nào! 10 phút kéo giãn cột sống và chân.';

  @override
  String get notifRoutineTitle => '🔥 Hoàn thành thói quen nhé!';

  @override
  String get notifRoutineBody =>
      'Kiểm tra thói quen trước khi hết ngày. Chuỗi = kỷ luật!';

  @override
  String get notifProteinTitle => '🥚 Ngày protein!';

  @override
  String get notifProteinBody =>
      'Khởi đầu tuần thật mạnh! Bữa nào cũng có protein nhé.';

  @override
  String get notifNewWeekTitle => '✨ Tuần mới, mục tiêu mới!';

  @override
  String get notifNewWeekBody =>
      'Tuần này đừng bỏ thói quen nào. Bước nhỏ, khác biệt lớn!';

  @override
  String get notifSleepTitle => '😴 Đến giờ ngủ!';

  @override
  String get notifSleepBody =>
      'Hormone tăng trưởng đạt đỉnh từ 22h-2h. Bỏ điện thoại xuống nào!';

  @override
  String get notifPostureTitle => '🧍 Kiểm tra tư thế!';

  @override
  String get notifPostureBody =>
      'Lưng thẳng, vai ra sau. Tư thế tốt = chênh 2-3 cm!';

  @override
  String get notifVitaminDTitle => '☀️ Giờ vitamin D!';

  @override
  String get notifVitaminDBody =>
      'Phơi nắng 15 phút nhé! Vitamin D giúp hấp thu canxi tốt hơn.';

  @override
  String get notifMidweekTitle => '✨ Được nửa tuần rồi!';

  @override
  String get notifMidweekBody =>
      'Kiểm tra giữa tuần. Tăng trưởng cần kiên nhẫn, nhưng đều đặn sẽ thắng!';

  @override
  String get notifScreenTitle => '📵 Tắt màn hình!';

  @override
  String get notifScreenBody =>
      'Không dùng màn hình 1 tiếng trước khi ngủ. Ánh sáng xanh chặn melatonin!';

  @override
  String get notifJumpTitle => '🦘 Giờ bật nhảy!';

  @override
  String get notifJumpBody =>
      'Bật nhảy kích thích sụn tăng trưởng. Thử 3 x 20 lần nhé!';

  @override
  String get notifCalciumTitle => '🥛 Giờ canxi!';

  @override
  String get notifCalciumBody =>
      'Một ly sữa hoặc hũ sữa chua. Canxi cực quan trọng cho xương!';

  @override
  String get notifPostureCheckTitle => '🧍 Kiểm tra tư thế!';

  @override
  String get notifPostureCheckBody =>
      'Đừng cúi cổ nhìn điện thoại! Ngồi và đi thẳng lưng.';

  @override
  String get notifWeekendTitle => '✨ Động lực cuối tuần';

  @override
  String get notifWeekendBody =>
      'Cuối tuần đừng bỏ thói quen! Kỷ luật là mỗi ngày.';

  @override
  String get notifWeeklyProgressTitle => '📊 Tiến độ tuần';

  @override
  String get notifWeeklyProgressBody =>
      'Tuần này thế nào? Xem biểu đồ tăng trưởng nhé!';

  @override
  String get notifMeasureTitle => '📏 Đo hằng tuần!';

  @override
  String get notifMeasureBody =>
      'Đo và ghi chiều cao nhé! Đo buổi sáng là chính xác nhất.';

  @override
  String get notifEarlySleepTitle => '😴 Ngủ sớm thôi!';

  @override
  String get notifEarlySleepBody =>
      'Mai là thứ Hai! Ngủ ngon để khởi đầu tuần thật mạnh.';

  @override
  String get notifStreak3Title => '🔥 Chuỗi 3 ngày!';

  @override
  String get notifStreak3Body =>
      'Khởi đầu tuyệt vời! 3 ngày liên tiếp. Tiếp tục tới 7 nhé!';

  @override
  String get notifStreak7Title => '🏆 Chuỗi 1 tuần!';

  @override
  String get notifStreak7Body =>
      'Quá đỉnh! 7 ngày liên tiếp hoàn thành thói quen!';

  @override
  String get notifStreak14Title => '⭐ Chuỗi 2 tuần!';

  @override
  String get notifStreak14Body =>
      '14 ngày kỷ luật! Cơ thể bạn bắt đầu thay đổi rồi.';

  @override
  String get notifStreak30Title => '👑 Chuỗi 1 tháng!';

  @override
  String get notifStreak30Body => '30 ngày! Bạn là nhà vô địch!';

  @override
  String get notifStreak60Title => '🌟 Chuỗi 60 ngày!';

  @override
  String get notifStreak60Body => '60 ngày! Một thành tích đáng nể.';

  @override
  String get notifStreak100Title => '💎 100 NGÀY! HUYỀN THOẠI!';

  @override
  String get notifStreak100Body =>
      '100 ngày liên tiếp! Bạn đã thành huyền thoại.';

  @override
  String get notifStreakRiskTitle => '⚠️ Đừng để mất chuỗi!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Chuỗi $streak ngày của bạn sắp mất! Hoàn thành thói quen nhé.';
  }

  @override
  String get paywallStat1 => 'cm — tiềm năng của bạn đang bị khóa';

  @override
  String get paywallTitle1 => 'Bạn có thể cao\nthêm bao nhiêu cm?';

  @override
  String get paywallBullet1a =>
      'Giới hạn di truyền của bạn đã được tính, muốn xem không?';

  @override
  String get paywallBullet1b =>
      'Lối sống ảnh hưởng thế nào đến chiều cao của bạn?';

  @override
  String get paywallBullet1c => 'Lộ trình riêng của bạn đang chờ';

  @override
  String get paywallStat2 => 'thói quen riêng của bạn đã sẵn sàng';

  @override
  String get paywallTitle2 => 'Kế hoạch của bạn\nđã sẵn sàng';

  @override
  String get paywallBullet2a =>
      '8 phút mỗi sáng — thiết kế cho cột sống của bạn';

  @override
  String get paywallBullet2b => 'Ngủ, dinh dưỡng, nước — theo dõi tất cả';

  @override
  String get paywallBullet2c => 'Mỗi ngày gần thêm một bước, đừng đứt chuỗi';

  @override
  String get paywallStat3 => 'biểu đồ tiến độ theo thời gian thực';

  @override
  String get paywallTitle3 => 'Theo dõi\nchiều cao';

  @override
  String get paywallBullet3a => 'Đo hằng tháng — tận mắt thấy mình cao lên';

  @override
  String get paywallBullet3b => 'Lấy lại 2 cm ngay với phân tích tư thế';

  @override
  String get paywallBullet3c => 'Ảnh tiến độ — bạn sẽ thấy sự khác biệt';

  @override
  String get paywallStat4 => 'chương trình hằng ngày — lên cấp liên tục';

  @override
  String get paywallTitle4 => 'Mạnh hơn\nmỗi ngày';

  @override
  String get paywallBullet4a =>
      'Kiếm XP, mở khóa cấp độ — thói quen thành trò chơi';

  @override
  String get paywallBullet4b => 'Ai đạt được mục tiêu cũng từng đi qua đây';

  @override
  String get paywallBullet4c => 'Bắt đầu ngay — tuần đầu miễn phí';

  @override
  String get paywallRestore => 'Không tìm thấy giao dịch trước đó';

  @override
  String get paywallRestoreNotFound => 'Không tìm thấy giao dịch trước đó';

  @override
  String get paywallPromoCode => 'Có mã khuyến mãi?';

  @override
  String get paywallHeightUnit => 'chiều cao mục tiêu';

  @override
  String get paywallHeightTitle => 'Bạn có thể cao thêm bao nhiêu?';

  @override
  String get paywallHeightDesc =>
      'Tụi mình phân tích cùng lúc di truyền, lối sống và tư thế của bạn, rồi vẽ dự đoán theo từng năm. Không gì là cố định: mỗi bước bạn đi đều cập nhật nó.';

  @override
  String get paywallGrowthUnit => 'năm nay';

  @override
  String get paywallGrowthTitle => 'Tụi mình theo dõi chiều cao cùng bạn';

  @override
  String get paywallGrowthDesc =>
      'Mỗi lần đo đều hiện ngay trên biểu đồ. Bạn thấy tiến độ từng tháng, từng centimet.';

  @override
  String get paywallPostureUnit => 'điểm tư thế';

  @override
  String get paywallPostureTitle => 'Tư thế là chìa khóa cho các thói quen';

  @override
  String get paywallPostureDesc =>
      'Kiểm tra nhanh 3 câu về đầu, vai và lưng dưới, kèm đúng bài tập để sửa từng chỗ.';

  @override
  String get paywallReportUnit => 'thói quen đã xong';

  @override
  String get paywallReportTitle => 'Mỗi tuần tụi mình cùng bạn nhìn lại';

  @override
  String get paywallReportDesc =>
      'Nước, giấc ngủ, thói quen và chuỗi ngày trên một màn hình. Mỗi tuần cùng chỉ ra điểm mạnh và chỗ còn thiếu.';

  @override
  String get paywallNutritionUnit => 'bữa mỗi ngày';

  @override
  String get paywallNutritionTitle => 'Kế hoạch dinh dưỡng đầy đủ đã sẵn sàng';

  @override
  String get paywallNutritionDesc =>
      'Từ bữa sáng đến bữa tối, một kế hoạch trọn ngày đã tính sẵn protein, canxi, kẽm và vitamin D.';

  @override
  String get paywallScoreUnit => 'Điểm BeTaller';

  @override
  String get paywallScoreTitle => 'Hệ thống luôn thúc bạn tiến lên';

  @override
  String get paywallScoreDesc =>
      'Di truyền, tăng trưởng, dinh dưỡng, giấc ngủ và kỷ luật gộp thành một điểm. Điểm vừa giảm là bạn thấy ngay cần cải thiện chỗ nào.';

  @override
  String get paywallPhotosUnit => 'khác biệt rõ rệt';

  @override
  String get paywallPhotosTitle => 'Chứng minh thay đổi bằng ảnh';

  @override
  String get paywallPhotosDesc =>
      'Ảnh so sánh trước và sau tự động tạo, ảnh của mỗi tháng nằm cạnh nhau trên dòng thời gian.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'Bắt đầu trong ba bước';

  @override
  String get journeyIntroSubtitle =>
      'Mình cùng thiết lập BeTaller nhé. Bước tiếp theo đang chờ bạn.';

  @override
  String get journeyStep1Title => 'Thu thập dữ liệu';

  @override
  String get journeyStep1Desc =>
      'Tụi mình lấy chiều cao, tuổi và lối sống của bạn, rồi tính tiềm năng.';

  @override
  String get journeyStep2Title => 'Tham quan ứng dụng';

  @override
  String get journeyStep2Desc =>
      'Cùng xem qua từng tính năng: nó làm gì và bạn dùng thế nào.';

  @override
  String get journeyStep3Title => 'Tự mình sử dụng';

  @override
  String get journeyStep3Desc =>
      'Bạn thực hiện thói quen hằng ngày, tụi mình theo dõi tiến độ.';

  @override
  String get journeyNow => 'BÂY GIỜ';

  @override
  String get journeyDone => 'XONG';

  @override
  String get journeySoon => 'SẮP TỚI';

  @override
  String get tourHomeStreakTitle => 'Chuỗi ngày của bạn';

  @override
  String get tourHomeStreakDesc =>
      'Còn kỷ luật là chuỗi còn tăng. Bỏ một ngày là về lại từ đầu.';

  @override
  String get tourHomeXpTitle => 'Cấp độ của bạn';

  @override
  String get tourHomeXpDesc =>
      'Tăng theo XP bạn kiếm được khi giữ kỷ luật. Đừng để tuột nhé!';

  @override
  String get tourHomeGoalsTitle => 'Mục tiêu hôm nay';

  @override
  String get tourHomeGoalsDesc =>
      'Hiện thói quen, nhiệm vụ và mục tiêu nước trong ngày chỉ trong một cái nhìn, không bỏ sót gì.';

  @override
  String get tourHomeTrackTitle => 'Theo dõi nước & giấc ngủ';

  @override
  String get tourHomeTrackDesc =>
      'Ghi nước và giấc ngủ mỗi ngày ngay tại đây, chỉ vài giây.';

  @override
  String get tourPlanTabsTitle => 'Ba tab: Hôm nay, Kỷ luật, Dinh dưỡng';

  @override
  String get tourPlanTabsDesc =>
      'Thói quen hằng ngày, chương trình hằng tuần và kế hoạch dinh dưỡng đều ở đây.';

  @override
  String get tourPlanLevelTitle => 'Cấp độ kỷ luật';

  @override
  String get tourPlanLevelDesc =>
      'Cho thấy bạn hoàn thành thói quen đều đặn tới đâu. Lên cấp để có kết quả tốt hơn.';

  @override
  String get tourPlanTodayTitle => 'Kế hoạch hôm nay';

  @override
  String get tourPlanTodayDesc =>
      'Đánh dấu thói quen hằng ngày ở đây để kéo dài chuỗi.';

  @override
  String get tourPlanTodayListTitle => 'Thói quen hôm nay';

  @override
  String get tourPlanTodayListDesc =>
      'Làm xong cái nào thì đánh dấu cái đó. Chạm vào thói quen để xem chi tiết.';

  @override
  String get tourPlanWeekGoalsTitle => 'Tuần này';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Ngày hoàn hảo, buổi tập và lần đo tuần này cần làm, kể cả lần đo bắt buộc.';

  @override
  String get tourPlanMonthGoalsTitle => 'Tháng này';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Ảnh tiến độ, kiểm tra tư thế và các lần đo tháng này: những thứ không nên bỏ qua.';

  @override
  String get tourProgressHeightTitle => 'Chiều cao hiện tại';

  @override
  String get tourProgressHeightDesc =>
      'Hiện chiều cao lúc này và tổng mức tăng. Thêm lần đo mới từ đây.';

  @override
  String get tourProgressPhotosTitle => 'Ảnh tiến độ';

  @override
  String get tourProgressPhotosDesc =>
      'Theo dõi sự thay đổi bằng hình ảnh qua các ảnh chụp đều đặn.';

  @override
  String get tourProgressPostureTitle => 'Phân tích tư thế';

  @override
  String get tourProgressPostureDesc =>
      'Phân tích tư thế từ ảnh và biết mình cần tập gì.';

  @override
  String get tourAnalysisScoreTitle => 'Điểm BeTaller của bạn';

  @override
  String get tourAnalysisScoreDesc =>
      'Điểm hiệu suất tổng thể, tính từ di truyền, tốc độ tăng trưởng, dinh dưỡng và giấc ngủ.';

  @override
  String get tourAnalysisPredictionTitle => 'Dự đoán chiều cao';

  @override
  String get tourAnalysisPredictionDesc =>
      'Hiện chiều cao cuối cùng dự đoán và hướng phát triển qua từng năm.';

  @override
  String get tourAnalysisPeerTitle => 'So với bạn bè';

  @override
  String get tourAnalysisPeerDesc =>
      'Xem bạn đứng ở đâu và so sánh với bạn cùng tuổi.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Thói quen của bạn';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Xem hôm nay còn bao nhiêu bài tập cần hoàn thành.';

  @override
  String get tourHomeGoalsChallengesTitle => 'Nhiệm vụ của bạn';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Theo dõi tiến độ các thử thách đang diễn ra ngay tại đây.';

  @override
  String get tourHomeGoalsWaterTitle => 'Mục tiêu nước';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Xem bạn còn cách mục tiêu nước hôm nay bao xa.';

  @override
  String get tourHomeReminderTitle => 'Lời nhắc tiếp theo';

  @override
  String get tourHomeReminderDesc =>
      'Xem khi nào có lời nhắc tiếp theo và chỉnh sửa ngay tại đây.';

  @override
  String get tourHomeChallengesTitle => 'Thử thách của bạn';

  @override
  String get tourHomeChallengesDesc => 'Hoàn thành thử thách để kiếm thêm XP.';

  @override
  String get tourHomeGrowthTitle => 'Tình trạng tăng trưởng';

  @override
  String get tourHomeGrowthDesc =>
      'Xem tổng mức tăng, lần đo gần nhất và số lần bạn đã ghi.';

  @override
  String get tourHomeExploreTitle => 'Khám phá';

  @override
  String get tourHomeExploreDesc =>
      'Hướng dẫn dinh dưỡng, công thức tăng trưởng và nhiều thứ khác đang chờ bạn.';

  @override
  String get tourPlanProgramHeaderTitle => 'Chương trình 70 ngày';

  @override
  String get tourPlanProgramHeaderDesc =>
      'Xem tiến độ tổng thể, cấp độ và ngày hiện tại trong vòng tròn này.';

  @override
  String get tourPlanProgramLevelsTitle => 'Cấp độ';

  @override
  String get tourPlanProgramLevelsDesc =>
      'Xem bạn đang ở cấp nào trong 10 cấp và cấp nào còn khóa.';

  @override
  String get tourPlanNutritionHeaderTitle => 'Tiến độ dinh dưỡng';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Theo dõi bạn đã xong bao nhiêu thói quen dinh dưỡng hôm nay.';

  @override
  String get tourPlanNutritionFirstTitle => 'Thói quen dinh dưỡng';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Đánh dấu các thói quen ăn uống hỗ trợ tăng trưởng.';

  @override
  String get tourProgressChartTitle => 'Đường tăng trưởng';

  @override
  String get tourProgressChartDesc =>
      'Xem các lần đo trước trên biểu đồ và hiểu bạn đang đi về đâu.';

  @override
  String get tourProgressReportTitle => 'Báo cáo tuần';

  @override
  String get tourProgressReportDesc =>
      'Xem báo cáo tóm tắt tiến độ trong tuần.';

  @override
  String get tourProgressHistoryTitle => 'Lịch sử đo';

  @override
  String get tourProgressHistoryDesc =>
      'Xem mọi lần đo chiều cao bạn đã ghi trên dòng thời gian.';

  @override
  String get tourAnalysisRadarTitle => 'Biểu đồ cân bằng';

  @override
  String get tourAnalysisRadarDesc =>
      'Xem độ cân bằng giữa di truyền, tốc độ tăng trưởng, dinh dưỡng, giấc ngủ và kỷ luật trên biểu đồ radar, và biết điểm yếu nhất.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'Nhu cầu hằng ngày';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Xem nhu cầu protein, calo, giấc ngủ và nước mỗi ngày, tính theo chiều cao và cân nặng của bạn.';

  @override
  String get journeyDataDoneTitle => 'Xong bước đầu tiên';

  @override
  String get journeyDataDoneSubtitle =>
      'Đã có dữ liệu và tiềm năng của bạn. Tiếp theo là tham quan ứng dụng.';

  @override
  String get journeyContinue => 'Tiếp tục';

  @override
  String get journeyEnterApp => 'Vào ứng dụng';

  @override
  String get journeyProgressLabel => 'Bắt đầu';

  @override
  String get journeyTourDoneTitle => 'Chào mừng đến với BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'Bạn đã xong cả ba bước. Giờ đến lượt bạn: bắt đầu hành trình bằng thói quen đầu tiên.';

  @override
  String get journeyViewPlansButton => 'Xem các gói để bắt đầu';

  @override
  String get paywallRestoreLabel => 'Khôi phục giao dịch';

  @override
  String get paywallYearly => 'Hằng năm';

  @override
  String get paywallBestValue => 'Lời nhất';

  @override
  String paywallSavePercent(String percent) {
    return 'TIẾT KIỆM $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/tuần';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/tháng';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/năm';
  }

  @override
  String get paywallMonthly => 'Hằng tháng';

  @override
  String get paywallWeekly => 'Hằng tuần';

  @override
  String get paywallFreeTrial => 'Miễn phí 3 ngày';

  @override
  String get paywallLoadError => 'Không tải được các gói, thử lại nhé';

  @override
  String get paywallCtaAlt => 'Tiếp tục';

  @override
  String get paywallTrialDisclaimer =>
      'Miễn phí 3 ngày · sau đó tự gia hạn · hủy bất cứ lúc nào';

  @override
  String get paywallYearlyDisclaimer =>
      'Tự gia hạn hằng năm · hủy bất cứ lúc nào';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return 'Miễn phí $days ngày, sau đó $price/tuần · hủy bất cứ lúc nào';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return 'Miễn phí $days ngày, sau đó $price/tháng · hủy bất cứ lúc nào';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return 'Miễn phí $days ngày, sau đó $price/năm · hủy bất cứ lúc nào';
  }

  @override
  String get paywallRenewsWeekly => 'Tự gia hạn hằng tuần · hủy bất cứ lúc nào';

  @override
  String get paywallRenewsMonthly =>
      'Tự gia hạn hằng tháng · hủy bất cứ lúc nào';

  @override
  String get resultCardTitle => 'Chiều cao trưởng thành dự đoán';

  @override
  String resultRange(String min, String max) {
    return 'Khoảng có thể: $min đến $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Cao hơn $percent% người cùng tuổi';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Ước tính còn tăng: $amount';
  }

  @override
  String get resultFootnote =>
      'Ước tính dựa trên chiều cao của bố mẹ và dữ liệu biểu đồ tăng trưởng. Không phải lời khuyên y tế.';

  @override
  String get postureCheckTitle => 'Kiểm tra tư thế nhanh';

  @override
  String get postureCheckIntro =>
      'Đứng sao cho gót, hông và bả vai áp vào tường, rồi trả lời ba câu hỏi. Điểm được tính từ câu trả lời của bạn; ảnh chỉ được lưu để so sánh trước và sau.';

  @override
  String get postureQHead =>
      'Gáy của bạn có chạm tường mà không cần ngẩng cằm không?';

  @override
  String get postureQHeadA1 => 'Có, dễ dàng';

  @override
  String get postureQHeadA2 => 'Chỉ khi mình đẩy ra sau';

  @override
  String get postureQHeadA3 => 'Không, còn khoảng hở';

  @override
  String get postureQShoulders =>
      'Trong ảnh chụp nghiêng, vai bạn nằm ở đâu so với tai?';

  @override
  String get postureQShouldersA1 => 'Thẳng hàng với tai';

  @override
  String get postureQShouldersA2 => 'Hơi lệch ra trước';

  @override
  String get postureQShouldersA3 => 'Gù hẳn ra trước';

  @override
  String get postureQLowerBack =>
      'Luồn tay ra sau lưng dưới. Khoảng trống cỡ nào?';

  @override
  String get postureQLowerBackA1 => 'Vừa lọt bàn tay phẳng';

  @override
  String get postureQLowerBackA2 => 'Không có khoảng trống';

  @override
  String get postureQLowerBackA3 => 'Lọt cả nắm tay';

  @override
  String get postureCheckSave => 'Xem điểm của mình';

  @override
  String get postureCheckNote =>
      'Đây là tự kiểm tra, không phải đánh giá y tế.';

  @override
  String get paywallTester => 'Người thử nghiệm';

  @override
  String get introTag1 => 'DỰ ĐOÁN';

  @override
  String get introTag2 => 'TĂNG TRƯỞNG';

  @override
  String get introTag3 => 'THEO DÕI';

  @override
  String get introTag4 => 'TRÒ CHƠI HÓA';

  @override
  String get introTag5 => 'CỘNG ĐỒNG';

  @override
  String get introTitle1 => 'Khám phá tiềm năng\nchiều cao của bạn';

  @override
  String get introSubtitle1 =>
      'Để tụi mình tính toàn bộ tiềm năng của bạn\ndựa trên di truyền, tuổi và lối sống.';

  @override
  String get introTitle2 => 'Mỗi ngày\ncao thêm một bước';

  @override
  String get introSubtitle2 =>
      'Phát huy tiềm năng với kế hoạch\ntập luyện và dinh dưỡng riêng.';

  @override
  String get introTitle3 => 'Theo dõi\ntừng centimet';

  @override
  String get introSubtitle3 =>
      'Xem tiến bộ thật của bạn\nqua các lần đo hằng tháng.';

  @override
  String get introTitle4 => 'Lên cấp,\nnhận thưởng';

  @override
  String get introSubtitle4 =>
      'Hoàn thành chương trình 70 ngày,\nkiếm XP và mở khóa cấp mới.';

  @override
  String get introTitle5 => 'Hàng nghìn người\nđã cao hơn';

  @override
  String get introSubtitle5 =>
      'Tham gia cộng đồng những người\nđã đạt được mục tiêu.';

  @override
  String get criticalWindow => 'GIAI ĐOẠN QUAN TRỌNG';

  @override
  String get heightPotentialFading => 'Sự thật về';

  @override
  String get fadingAway => 'tiềm năng chiều cao..';

  @override
  String get painHookDesc =>
      'Mỗi ngày trôi qua mà thiếu thói quen đúng, bạn mất đi những centimet không lấy lại được. Nhưng vẫn còn kịp thay đổi.';

  @override
  String get painGeneticTitle => 'Di truyền không phải tất cả';

  @override
  String get painGeneticDesc =>
      'Di truyền quyết định 60%, nhưng 40% còn lại là do bạn. BeTaller ở đây cho đúng 40% đó.';

  @override
  String get painGeneticTag => 'Phân tích';

  @override
  String get painSleepTitle => 'Tối ưu giấc ngủ';

  @override
  String get painSleepDesc =>
      'Ngủ đúng cách mỗi đêm có thể tăng tạo hormone tăng trưởng tới 70%. BeTaller tự động theo dõi giấc ngủ, bạn chỉ việc ngủ.';

  @override
  String get painSleepTag => 'Theo dõi';

  @override
  String get painPostureTitle => 'Thêm centimet ngay nhờ tư thế';

  @override
  String get painPostureDesc =>
      'Tư thế đúng có thể ngay lập tức thêm 1,5-3 cm. Thói quen tư thế hằng ngày của BeTaller giúp bạn giữ được điều đó sau vài tuần.';

  @override
  String get painPostureTag => 'Tư thế';

  @override
  String get painExerciseTitle => 'Kế hoạch tập riêng đã sẵn sàng';

  @override
  String get painExerciseDesc =>
      'Giãn cơ buổi sáng, treo xà, bài tập cột sống: BeTaller đã chuẩn bị và xếp lịch cho bạn. Chỉ 8-12 phút mỗi ngày.';

  @override
  String get painExerciseTag => 'Thói quen';

  @override
  String get painNutritionTitle =>
      'Dinh dưỡng ảnh hưởng trực tiếp đến chiều cao';

  @override
  String get painNutritionDesc =>
      'Protein, canxi, vitamin D: BeTaller nhắc bạn mỗi ngày cần nạp chất gì và khi nào.';

  @override
  String get painNutritionTag => 'Dinh dưỡng';

  @override
  String get painTrackingTitle => 'Tận mắt theo dõi chiều cao';

  @override
  String get painTrackingDesc =>
      'Đo hằng tháng, ảnh tiến độ, biểu đồ tăng trưởng: thấy rõ từng centimet bạn tăng.';

  @override
  String get painTrackingTag => 'Tiến độ';

  @override
  String get selectYourGender => 'Chọn giới tính';

  @override
  String get onboardingPredictSubtitle =>
      'Dùng để dự đoán tiềm năng chiều cao & tạo kế hoạch riêng cho bạn.';

  @override
  String get other => 'Khác';

  @override
  String get whenWereYouBorn => 'Bạn sinh ngày nào?';

  @override
  String get heightAndWeight => 'Chiều cao & cân nặng';

  @override
  String get parentsHeight => 'Chiều cao bố mẹ';

  @override
  String get weeklyWorkout => 'Tập luyện mỗi tuần';

  @override
  String get workoutsPerWeek => 'Số buổi tập mỗi tuần';

  @override
  String get whatsYourEthnicity => 'Bạn thuộc nhóm sắc tộc nào?';

  @override
  String get whiteCaucasian => 'Da trắng / Châu Âu';

  @override
  String get blackAfricanAmerican => 'Da đen / Mỹ gốc Phi';

  @override
  String get hispanicLatino => 'Tây Ban Nha / Mỹ Latinh';

  @override
  String get asian => 'Châu Á';

  @override
  String get middleEasternIndigenous => 'Trung Đông / Bản địa';

  @override
  String get dontWantToAnswer => 'Mình không muốn trả lời';

  @override
  String get footSizeLabel => 'Cỡ chân';

  @override
  String get selectYourSize => 'Chọn cỡ của bạn';

  @override
  String get whatsYourDreamHeight => 'Chiều cao mơ ước của bạn?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Dựa trên thông tin bạn nhập, tụi mình sẽ tính khả năng đạt được chiều cao này.';

  @override
  String get dreamHeightLabel => 'Chiều cao mơ ước';

  @override
  String get sleepQuestion => 'Mỗi đêm bạn\nngủ bao nhiêu tiếng?';

  @override
  String get thousandsSucceeded => 'Hàng nghìn người\nđã thành công';

  @override
  String get youCanToo => 'Bạn cũng làm được';

  @override
  String get yearsOld => 'tuổi';

  @override
  String get verifiedLabel => 'Đã xác minh';

  @override
  String get scientificData => 'DỮ LIỆU KHOA HỌC';

  @override
  String get longTermResults => 'BeTaller tạo ra\nkết quả lâu dài';

  @override
  String get longTermResultsSubtitle =>
      'Nhiều người không đạt chiều cao tối đa vì thói quen xấu.';

  @override
  String get yourFinalHeight => 'Chiều cao cuối cùng';

  @override
  String get badHabitsLegend => 'Thói quen xấu';

  @override
  String get optimizedLegend => 'Đã tối ưu';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'Chiều cao có thể thay đổi\nnhờ thói quen';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc => 'Ngủ đủ giúp tăng\nhormone tăng trưởng';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Có thể có được\nnhờ cải thiện tư thế';

  @override
  String get didYouKnow => 'Bạn có biết?';

  @override
  String get didYouKnowFact1 => 'Thói quen hằng ngày ảnh hưởng 30% chiều cao';

  @override
  String get didYouKnowFact2 => 'Chèn ép cột sống lấy đi 1,5-3 cm chiều cao';

  @override
  String get didYouKnowFact3 => 'Thiếu ngủ làm giảm HGH tới 70%';

  @override
  String get transformJourneyBegins => 'Hành trình thay đổi\ncủa bạn bắt đầu';

  @override
  String get transformJourneySubtitle =>
      'Chương trình toàn diện giúp bạn\nphát triển khỏe mạnh, từng bước một.';

  @override
  String get week1Label => '1T';

  @override
  String get week1Title => 'Tuần 1';

  @override
  String get week1Desc => 'Cột sống thẳng hơn, tư thế tốt lên';

  @override
  String get month1Label => '1Th';

  @override
  String get month1Title => 'Tháng 1';

  @override
  String get month1Desc => 'Những centimet đầu tiên thấy được, ngủ ngon hơn';

  @override
  String get month3Label => '3Th';

  @override
  String get month3Title => 'Tháng 3';

  @override
  String get month3Desc => 'Trung bình tăng +1,5–2,5 cm, cơ phát triển';

  @override
  String get month6Label => '6Th';

  @override
  String get month6Title => 'Tháng 6';

  @override
  String get month6Desc => 'Đạt tiềm năng tối đa, sống với chiều cao mới';

  @override
  String get reachYourGoal => 'Đạt mục tiêu';

  @override
  String get journeyBullet1 => 'Mở khóa tiềm năng tối đa';

  @override
  String get journeyBullet2 => 'Bắt đầu sống với chiều cao mới';

  @override
  String get journeyBullet3 => 'Viết nên câu chuyện thành công của bạn';

  @override
  String get unlockButton => 'Mở khóa tất cả';

  @override
  String get dreamHeightOdds => 'Khả năng đạt\nchiều cao mơ ước';

  @override
  String get growthCompleteLabel => 'Đã hoàn thành\ntăng trưởng';

  @override
  String get tallerThanPct => 'Cao hơn 76,7% người cùng tuổi';

  @override
  String get levelNovice => 'Tập sự';

  @override
  String get levelBuilder => 'Xây nền';

  @override
  String get levelGrinder => 'Chăm chỉ';

  @override
  String get levelWarrior => 'Chiến binh';

  @override
  String get levelGodTier => 'Cấp thần';

  @override
  String get levelDesc0 => 'Xây nền tảng';

  @override
  String get levelDesc1 => 'Tăng tốc phát triển';

  @override
  String get levelDesc2 => 'Tập nặng hơn';

  @override
  String get levelDesc3 => 'Vượt giới hạn';

  @override
  String get levelDesc4 => 'Không đau, không tiến';

  @override
  String get levelDesc5 => 'Tư duy nhà vô địch';

  @override
  String get levelDesc6 => 'Hiệu suất tinh anh';

  @override
  String get levelDesc7 => 'Làm chủ cơ thể';

  @override
  String get levelDesc8 => 'Kỷ luật huyền thoại';

  @override
  String get levelDesc9 => 'Tiềm năng tối đa';

  @override
  String levelLabel(int level) {
    return 'CẤP $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return 'Chương trình còn $_temp0';
  }

  @override
  String get tapLabel => 'CHẠM';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'Ngày';

  @override
  String get legendShort => 'Thấp';

  @override
  String get legendBelowAvg => 'Dưới TB';

  @override
  String get legendAverage => 'Trung bình';

  @override
  String get legendTall => 'Cao';

  @override
  String get legendVeryTall => 'Rất cao';

  @override
  String get pctBottom5 => '5% thấp nhất';

  @override
  String get pctBottom25 => '25% thấp nhất';

  @override
  String get pctMedian => 'Trung vị';

  @override
  String get pctTop25 => 'Top 25%';

  @override
  String get pctTop5 => 'Top 5%';

  @override
  String get fallingBehind => 'Đang tụt lại';

  @override
  String readTimeMinutes(int minutes) {
    return 'Đọc $minutes phút';
  }

  @override
  String get inThisArticle => 'Trong bài này';

  @override
  String get nextArticle => 'Bài tiếp theo';

  @override
  String get purchaseUnavailable =>
      'Không thể hoàn tất giao dịch. Vui lòng thử lại.';

  @override
  String get viewPlan => 'Xem gói';

  @override
  String get viewPlanSubtitle => 'Xem chi tiết gói đăng ký';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Thêm số đo chiều cao giúp độ tin cậy dự đoán lên $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'Cả ngày, trên một màn hình';

  @override
  String get paywallSlideHomeCaption =>
      'Thói quen, nước, giấc ngủ: ba vòng cần khép lại.';

  @override
  String get paywallSlideProgressTitle => 'Thấy từng centimet';

  @override
  String get paywallSlideProgressCaption =>
      'Mỗi lần đo hiện ngay trên đường cong.';

  @override
  String get paywallSlideAnalysisTitle => 'Năm chỉ số, một hình';

  @override
  String get paywallSlideAnalysisCaption =>
      'Biểu đồ radar chỉ ra điểm yếu nhất của bạn.';

  @override
  String get paywallSlidePotentialTitle => 'Biết tiềm năng của bạn';

  @override
  String get paywallSlidePotentialCaption =>
      'Xem bạn đứng ở đâu so với bạn cùng tuổi.';

  @override
  String get paywallSlideDisciplineTitle => 'Giữ chuỗi ngày';

  @override
  String get paywallSlideDisciplineCaption =>
      'Mỗi ngày đều đẩy cấp độ của bạn lên.';

  @override
  String get paywallSlideRemindersTitle => 'Nhắc đúng lúc';

  @override
  String get paywallSlideRemindersCaption =>
      'Bạn đặt giờ, app lo phần còn lại.';

  @override
  String get paywallSlidePostureTitle => 'Sửa tư thế';

  @override
  String get paywallSlidePostureCaption =>
      'Một ảnh nghiêng, tự kiểm tra nhanh, bài tập rõ ràng.';

  @override
  String paywallTrialHeadline(String days) {
    return 'MIỄN PHÍ $days NGÀY';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Sau đó $price · hủy bất cứ lúc nào';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / năm · hủy bất cứ lúc nào';
  }

  @override
  String get obBedtimeTitle => 'Bạn thường ngủ lúc mấy giờ?';

  @override
  String get obBedtimeSubtitle => 'Lời nhắc ngủ sẽ được đặt quanh giờ này.';

  @override
  String get obWorkoutTimeTitle => 'Bạn tập lúc mấy giờ?';

  @override
  String get obWorkoutTimeSubtitle => 'Để lời nhắc tập đến đúng giờ.';

  @override
  String get obMealsTitle => 'Mỗi ngày bạn ăn mấy bữa?';

  @override
  String get obMealsSubtitle => 'Chạm vào giờ để chỉnh theo lịch của bạn.';

  @override
  String obMealsCount(String count) {
    return '$count bữa';
  }

  @override
  String obMealLabel(String n) {
    return 'Bữa $n';
  }

  @override
  String get obProteinTitle => 'Mỗi ngày bạn nạp bao nhiêu gam protein?';

  @override
  String get obProteinSubtitle =>
      'Con số ước chừng là đủ. Tụi mình sẽ lên kế hoạch dựa vào đó.';

  @override
  String get obCaloriesTitle => 'Trung bình mỗi ngày bạn nạp bao nhiêu calo?';

  @override
  String get obCaloriesSubtitle =>
      'Ước tính là được; sau này mình cùng chỉnh cho chuẩn.';

  @override
  String get obNotSure => 'Mình không chắc';

  @override
  String get silNow => 'HIỆN TẠI';

  @override
  String get silPotential => 'TIỀM NĂNG';

  @override
  String get chartMeasured => 'Số đo của bạn';

  @override
  String chartPotential(String height) {
    return 'Tiềm năng $height';
  }

  @override
  String chartDream(String height) {
    return 'Mục tiêu $height';
  }

  @override
  String get targetsTitle => 'Hôm nay, dành cho bạn';

  @override
  String get targetsSubtitle => 'Tính từ tuổi, cân nặng và lịch tập của bạn.';

  @override
  String get targetProtein => 'Protein';

  @override
  String get targetCalcium => 'Canxi';

  @override
  String get targetVitaminD => 'Vitamin D';

  @override
  String get targetWater => 'Nước';

  @override
  String get targetSleep => 'Ngủ';

  @override
  String get targetMove => 'Tập luyện';

  @override
  String targetPerMeal(String g) {
    return '$g g mỗi bữa';
  }

  @override
  String get unitHours => 'giờ';

  @override
  String get unitMinutes => 'phút';

  @override
  String get planStrength => 'Sức mạnh';

  @override
  String get planJump => 'Bật nhảy & chạy nước rút';

  @override
  String get planMobility => 'Giãn cơ';

  @override
  String get planSport => 'Thể thao';

  @override
  String get planPosture => 'Tư thế';

  @override
  String get planRest => 'Nghỉ';

  @override
  String planWeekTitle(int days) {
    return 'Tuần của bạn: $days ngày tập';
  }

  @override
  String get planPreviewTitle => 'Kế hoạch của bạn đã sẵn sàng';

  @override
  String planPreviewTraining(int days) {
    return '$days ngày tập mỗi tuần, thiết kế cho tăng trưởng';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g protein mỗi ngày, chia đều các bữa';
  }

  @override
  String planPreviewSleep(String hours) {
    return 'Ngủ $hours giờ, có nhắc giờ đi ngủ';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Hôm nay: $plan · $minutes phút';
  }

  @override
  String get nRestTitle => 'Hôm nay là ngày nghỉ';

  @override
  String get nRestBody =>
      'Mười phút giãn cơ là đủ. Phục hồi cũng là một phần của kế hoạch.';

  @override
  String nProteinTitle(int grams) {
    return 'Mục tiêu protein hôm nay: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'Khoảng $grams g mỗi bữa: trứng, sữa chua, gà, đậu lăng.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Mục tiêu nước: $liters';
  }

  @override
  String get nWaterBody =>
      'Uống một ly ngay bây giờ để giữ đúng tiến độ hôm nay.';

  @override
  String get nSleepTitle => 'Đến lúc thư giãn rồi';

  @override
  String nSleepBody(String hours) {
    return 'Mục tiêu của bạn là $hours giờ. Tắt màn hình, giảm đèn nhé.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Tiềm năng của bạn: $potential. Đo vào buổi sáng và xem biểu đồ thay đổi.';
  }

  @override
  String get nTrialDay1Title => 'Kế hoạch đang chờ bạn';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Hôm nay: $plan, $minutes phút. Ghi chiều cao để biểu đồ bắt đầu.';
  }

  @override
  String get nTrialEndTitle => 'Ngày mai hết dùng thử miễn phí';

  @override
  String nTrialEndBody(String price) {
    return 'Sau đó gói sẽ tiếp tục với giá $price. Dù thế nào, kế hoạch và tiến độ của bạn vẫn được lưu.';
  }

  @override
  String get trophyContinue => 'Tiếp tục nào';

  @override
  String get guideSteps => 'Từng bước';

  @override
  String get guideMistakes => 'Lỗi thường gặp';

  @override
  String get guideTip => 'Mẹo';

  @override
  String get homeHeroTitle => 'Chiều cao và tiềm năng của bạn';

  @override
  String homeHeroGap(String cm) {
    return 'Vẫn còn $cm phía trước';
  }

  @override
  String get anSubtitle =>
      'Điểm của bạn, điều gì làm nó thay đổi và bạn đang đi về đâu';

  @override
  String get anScoreLabel => 'Điểm BeTaller';

  @override
  String get anTierStarting => 'Khởi đầu';

  @override
  String get anTierBuilding => 'Đang xây';

  @override
  String get anTierRising => 'Đang lên';

  @override
  String get anTierStrong => 'Mạnh';

  @override
  String get anTierPeak => 'Đỉnh cao';

  @override
  String anTrendUp(int n) {
    return '+$n so với tuần trước';
  }

  @override
  String anTrendDown(int n) {
    return '-$n so với tuần trước';
  }

  @override
  String get anTrendFlat => 'Bằng tuần trước';

  @override
  String get anTrendFirst => 'Xu hướng tuần bắt đầu từ tuần sau';

  @override
  String anNextTier(int n, String tier) {
    return 'Còn $n điểm lên $tier';
  }

  @override
  String get anTopTier => 'Hạng cao nhất. Giữ vững nhé';

  @override
  String anCoverage(int n, int total) {
    return 'Dựa trên $n/$total chỉ số';
  }

  @override
  String get anNoScoreTitle => 'Chưa đủ dữ liệu';

  @override
  String get anNoScoreBody =>
      'Hôm nay ghi giấc ngủ, chút nước hoặc một buổi tập là điểm đầu tiên sẽ hiện ra.';

  @override
  String get anFastestWin => 'Cách tăng nhanh nhất';

  @override
  String get anBreakdownTitle => 'Điều gì tạo nên điểm của bạn';

  @override
  String get anBreakdownHint =>
      'Mỗi chỉ số được chấm 0 đến 100 từ dữ liệu của bạn. Phần trăm là mức độ nó được tính.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'Chưa có dữ liệu';

  @override
  String get anNotCounted => 'Không tính';

  @override
  String get anFTraining => 'Tập luyện';

  @override
  String get anFConsistency => 'Đều đặn';

  @override
  String get anFSleep => 'Giấc ngủ';

  @override
  String get anFHydration => 'Uống nước';

  @override
  String get anFNutrition => 'Dinh dưỡng';

  @override
  String get anFPosture => 'Tư thế';

  @override
  String get anFMeasuring => 'Đo đạc';

  @override
  String get anFGrowth => 'Tốc độ tăng trưởng';

  @override
  String get anFHeadroom => 'Khoảng còn tăng';

  @override
  String anBTraining(int done, int planned) {
    return '$done/$planned ngày tập theo kế hoạch trong 7 ngày qua';
  }

  @override
  String get anBTrainingNone => 'Đếm số ngày bạn tập so với kế hoạch tuần.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak ngày',
    );
    return 'Chuỗi $_temp0, $active/$days ngày xong nửa kế hoạch';
  }

  @override
  String get anBConsistencyNone =>
      'Tính chuỗi ngày và số ngày bạn xong ít nhất nửa kế hoạch.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days đêm',
    );
    return 'Trung bình $hours giờ mỗi đêm, mục tiêu $target giờ, đã ghi $_temp0';
  }

  @override
  String get anBSleepNone => 'Chưa ghi giấc ngủ trong 7 ngày qua.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return 'Trung bình $litres mỗi ngày, mục tiêu $target, đã ghi $_temp0';
  }

  @override
  String get anBHydrationNone => 'Chưa ghi nước trong 7 ngày qua.';

  @override
  String anBNutrition(int done, int planned) {
    return 'Đã xong $done/$planned thói quen dinh dưỡng trong 7 ngày qua';
  }

  @override
  String get anBNutritionNone =>
      'Tính các thói quen protein, canxi, kẽm và vitamin D trong kế hoạch.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return 'Tự kiểm tra áp tường $raw/90, $_temp0 trước';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Tự kiểm tra áp tường $raw/90, hôm nay';
  }

  @override
  String get anBPostureNone => 'Chưa tự kiểm tra tư thế.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return 'Đo lần cuối $_temp0 trước';
  }

  @override
  String get anBMeasuringToday => 'Đã đo hôm nay';

  @override
  String get anBMeasuringNone => 'Chưa có lần đo nào.';

  @override
  String anBGrowth(String v, String e) {
    return '$v mỗi năm, mức thường gặp ở tuổi bạn $e';
  }

  @override
  String get anBGrowthNone => 'Cần hai lần đo cách nhau ít nhất 30 ngày.';

  @override
  String get anBGrowthAdult =>
      'Sụn tăng trưởng thường đóng trước 21 tuổi, nên tốc độ tăng trưởng không được tính cho bạn.';

  @override
  String anBHeadroom(String cm) {
    return 'Còn $cm từ hôm nay đến tiềm năng';
  }

  @override
  String get anATraining => 'Bắt đầu buổi tập hôm nay';

  @override
  String get anAConsistency => 'Xong nửa kế hoạch hôm nay';

  @override
  String get anASleepLog => 'Ghi giấc ngủ đêm qua';

  @override
  String anASleep(String target) {
    return 'Tối nay ngủ $target giờ';
  }

  @override
  String get anAHydrationLog => 'Ghi một ly nước';

  @override
  String anAHydration(String left) {
    return 'Uống thêm $left hôm nay';
  }

  @override
  String get anAHydrationDone => 'Đã đạt mục tiêu hôm nay. Mai làm tiếp nhé';

  @override
  String get anANutrition => 'Đánh dấu thói quen dinh dưỡng hôm nay';

  @override
  String get anAPostureFirst => 'Tự kiểm tra tư thế 1 phút';

  @override
  String get anAPostureRedo => 'Tự kiểm tra tư thế lại';

  @override
  String get anAPostureKeep => 'Giữ thói quen tư thế hằng ngày';

  @override
  String get anAMeasure => 'Đo chiều cao ngay';

  @override
  String get anAMeasureKeep => 'Đo lại vào tuần sau';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return 'Đo lại sau $_temp0';
  }

  @override
  String get anAGrowth => 'Đo mỗi 2 tuần để theo dõi';

  @override
  String get anAHeadroom => 'Xem tiềm năng';

  @override
  String get anPotentialTitle => 'Tiềm năng của bạn';

  @override
  String get anPotentialLabel => 'Chiều cao trưởng thành dự đoán';

  @override
  String anPotentialToGo(String cm) {
    return 'Còn +$cm';
  }

  @override
  String get anPotentialReached => 'Bạn đã đạt chiều cao dự đoán';

  @override
  String get anPotentialNote =>
      'Con số này giống nhau ở mọi nơi trong app. Nó chỉ có thể tăng lên.';

  @override
  String anDreamLine(String h) {
    return 'Mục tiêu: $h';
  }

  @override
  String get anSourcesTitle => 'Số centimet đến từ đâu';

  @override
  String get anSourcesGenes => 'Di truyền và tuổi';

  @override
  String get anSourcesHabits => 'Ngủ, ăn, tập';

  @override
  String get anSourcesPosture => 'Tư thế';

  @override
  String get anPctTitle => 'Chiều cao theo tuổi';

  @override
  String anPctValue(int p) {
    return 'Cao hơn $p% người cùng tuổi';
  }

  @override
  String get anPctBasis =>
      'Biểu đồ tăng trưởng CDC Hoa Kỳ, cùng tuổi và giới tính';

  @override
  String get anPctMore => 'So sánh đầy đủ';

  @override
  String get anNeedsBasis => 'Tính từ tuổi, cân nặng và lịch tập của bạn';

  @override
  String get anCalcium => 'Canxi';

  @override
  String get anVitaminD => 'Vitamin D';

  @override
  String get anMovement => 'Vận động';

  @override
  String get anUnitMin => 'phút';

  @override
  String get anUnitHours => 'giờ';

  @override
  String get anPerDay => 'mỗi ngày';

  @override
  String get anPerNight => 'mỗi đêm';

  @override
  String get anUnlockScoreTitle => 'Điểm BeTaller đầy đủ';

  @override
  String get anUnlockScoreBody =>
      'Điểm số, cả chín chỉ số đằng sau và việc cần làm tiếp theo.';

  @override
  String get anUnlockSourcesTitle => 'Xem số centimet đến từ đâu';

  @override
  String get anUnlockNeedsTitle => 'Nhu cầu hằng ngày, tính riêng cho bạn';

  @override
  String get anUnlockCta => 'Mở khóa';

  @override
  String get anFlowResultTitle => 'Đã lưu vào biểu đồ';

  @override
  String get anFlowResultBody =>
      'Chiều cao trước đây của bạn giờ nằm chung đường cong với số đo và tiềm năng.';

  @override
  String get anFlowOpenAnalysis => 'Mở phân tích';

  @override
  String anTopPct(int p) {
    return 'TOP $p%';
  }

  @override
  String get anNeedsTitle => 'Nhu cầu hằng ngày';

  @override
  String get pgUnlockPro => 'Mở khóa với Pro';

  @override
  String get pgPhotosLockedTitle => 'Xem sự thay đổi của bạn';

  @override
  String get pgPhotosLockedBody =>
      'Hai tuần lưu một ảnh kèm chiều cao và so sánh hai ảnh bất kỳ bằng thanh trượt.';

  @override
  String get pgTransformationTitle => 'Sự thay đổi của bạn';

  @override
  String get pgHeightChange => 'thay đổi chiều cao';

  @override
  String get pgDaysApart => 'ngày cách nhau';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return 'Chênh $delta giữa hai ảnh này, chụp cách nhau $_temp0.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return 'Chiều cao như cũ, cách nhau $_temp0. Tư thế và vóc dáng thay đổi trước, chiều cao theo sau trong vài tháng.';
  }

  @override
  String get pgModeSlider => 'Thanh trượt';

  @override
  String get pgModeSideBySide => 'Cạnh nhau';

  @override
  String get pgDragToReveal => 'Kéo để so sánh';

  @override
  String get pgOnePhotoTitle => 'Đã lưu ảnh \"trước\"';

  @override
  String pgOnePhotoBody(String date) {
    return 'Chụp ảnh tiếp theo vào $date với cùng tư thế để xem so sánh đầu tiên.';
  }

  @override
  String get pgEmptyTitle => 'Bắt đầu hành trình thay đổi';

  @override
  String get pgEmptyBody =>
      'Hai tuần một ảnh, cùng tư thế, cùng chỗ, kèm chiều cao. Vài tháng nữa bạn có thể trượt giữa ngày 1 và hôm nay.';

  @override
  String get pgTakeFirstPhoto => 'Chụp ảnh đầu tiên';

  @override
  String get pgPhotoDueNow => 'Đến lúc chụp ảnh mới';

  @override
  String pgNextPhotoOn(String date) {
    return 'Ảnh tiếp theo $date';
  }

  @override
  String pgDayN(int n) {
    return 'Ngày $n';
  }

  @override
  String get pgNewPhoto => 'Ảnh mới';

  @override
  String get pgGuideTitle => 'Lần nào cũng cùng tư thế';

  @override
  String get pgGuideSubtitle =>
      'Ảnh chỉ so sánh tốt khi được chụp cùng một cách.';

  @override
  String get pgGuideGhost =>
      'Ảnh lần trước hiện mờ phía sau. Hãy căn mình khớp với nó.';

  @override
  String get pgGuideStep1 => 'Đứng cách 2 m, điện thoại ngang ngực';

  @override
  String get pgGuideStep2 => 'Nhìn thẳng camera, chụm chân, thả lỏng tay';

  @override
  String get pgGuideStep3 => 'Cùng chỗ, cùng ánh sáng, đồ ôm sát';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'ngang ngực';

  @override
  String get pgTakePhoto => 'Chụp ảnh';

  @override
  String get pgFromGallery => 'Chọn từ thư viện';

  @override
  String get pgChoosePhoto => 'Chọn ảnh';

  @override
  String get pgPostureTitle => 'Kiểm tra tư thế';

  @override
  String get pgPostureLockedTitle => 'Tìm điểm yếu của bạn';

  @override
  String get pgPostureLockedBody =>
      'Chấm điểm đầu, vai và lưng dưới, nhận hai bài tập cho mỗi phần và xem điểm qua từng tuần.';

  @override
  String get pgAreaHead => 'Đầu';

  @override
  String get pgAreaShoulders => 'Vai';

  @override
  String get pgAreaLowerBack => 'Lưng dưới';

  @override
  String get pgHeadMeaning0 =>
      'Đầu bạn nằm ngay trên vai. Giữ vậy nhé với vài phút chỉnh lại mỗi ngày.';

  @override
  String get pgHeadMeaning1 =>
      'Đầu bạn đưa ra trước khi thả lỏng. Rất hay gặp khi dùng điện thoại nhiều, và sửa nhanh thôi.';

  @override
  String get pgHeadMeaning2 =>
      'Đầu bạn nằm trước vai. Sửa cái này trước: nó làm bạn trông thấp hơn trong mọi bức ảnh.';

  @override
  String get pgShouldersMeaning0 =>
      'Vai thẳng hàng với tai. Lưng trên của bạn đang làm tốt.';

  @override
  String get pgShouldersMeaning1 =>
      'Vai hơi đưa ra trước. Cơ ngực căng kéo vai vào; mở ngực sẽ đưa vai về lại.';

  @override
  String get pgShouldersMeaning2 =>
      'Vai gù. Lưng trên cong ra trước, khiến dáng đứng bị mất chiều cao.';

  @override
  String get pgLowerBackMeaning0 =>
      'Độ cong tự nhiên. Hông và cơ lõi giữ cột sống đúng vị trí.';

  @override
  String get pgLowerBackMeaning1 =>
      'Lưng dưới phẳng. Bài duỗi nhẹ và tập linh hoạt sẽ đưa độ cong tự nhiên trở lại.';

  @override
  String get pgLowerBackMeaning2 =>
      'Ưỡn lưng nhiều. Cơ gập hông căng kéo xương chậu đổ ra trước; giãn chúng và tăng sức cơ lõi sẽ cân lại.';

  @override
  String get pgLegacyMeaning =>
      'Lưu từ phiên bản cũ chưa có các câu hỏi này. Kiểm tra lại để nhận lời khuyên cho phần này.';

  @override
  String get pgHowItWorks => 'Cách kiểm tra hoạt động';

  @override
  String get pgYourPosture => 'Tư thế của bạn';

  @override
  String pgCheckedOn(String date) {
    return 'Kiểm tra ngày $date';
  }

  @override
  String get pgOutOf100 => 'trên 100';

  @override
  String get pgAllAreasGood => 'Cả ba phần đều tốt. Giữ vững nhé.';

  @override
  String pgStartWith(String area) {
    return 'Bắt đầu từ: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta so với lần trước';
  }

  @override
  String get pgStatusGood => 'Tốt';

  @override
  String get pgStatusFair => 'Có thể tốt hơn';

  @override
  String get pgStatusFix => 'Sửa trước';

  @override
  String get pgKeepItWith => 'Giữ vững với';

  @override
  String get pgFixItWith => 'Sửa bằng';

  @override
  String get pgRetakeNow => 'Đến lúc kiểm tra hằng tuần';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Kiểm tra tiếp sau $n ngày',
      one: 'Kiểm tra tiếp vào ngày mai',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Cùng bức tường, cùng ba câu hỏi. Kiểm tra hằng tuần cho thấy bài tập có hiệu quả không.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Tập các bài ở trên đến $date, rồi kiểm tra lại xem có hiệu quả không.';
  }

  @override
  String get pgRetakeCheck => 'Kiểm tra lại';

  @override
  String get pgRetakeAnyway => 'Kiểm tra lại ngay';

  @override
  String get pgHistoryTitle => 'Điểm của bạn';

  @override
  String pgSinceFirst(String delta) {
    return '$delta so với lần đầu';
  }

  @override
  String get pgHistoryOne =>
      'Đây là lần kiểm tra đầu tiên. Làm lại sau 7 ngày, xu hướng của bạn bắt đầu từ đây.';

  @override
  String get pgPostureIntroTitle => 'Bạn đứng thẳng tới đâu?';

  @override
  String get pgPostureIntroBody =>
      'Ba câu hỏi khi đứng áp tường, khoảng một phút. Bạn nhận điểm và hai bài tập sửa mỗi điểm yếu.';

  @override
  String get pgPostureStep1 => 'Đứng sao cho gót, hông và bả vai áp vào tường.';

  @override
  String get pgPostureStep2 =>
      'Chụp một ảnh nghiêng, thấy toàn thân, để sau này xem lại.';

  @override
  String get pgPostureStep3 =>
      'Trả lời thật lòng ba câu hỏi. Điểm được tính từ câu trả lời của bạn.';

  @override
  String get pgPostureStep4 =>
      'Làm lại mỗi tuần một lần, vào cùng thời điểm trong ngày.';

  @override
  String get pgStartCheck => 'Bắt đầu kiểm tra tư thế';

  @override
  String pgWeekRange(String start, String end) {
    return '$start đến $end';
  }

  @override
  String get pgGradeGreat => 'Tuần vô địch';

  @override
  String get pgGradeGood => 'Tuần vững vàng';

  @override
  String get pgGradeOk => 'Đang vào guồng';

  @override
  String get pgGradeStart => 'Khởi đầu mới';

  @override
  String get pgTopWeek => 'Tuần đỉnh nhất';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta so với tuần trước';
  }

  @override
  String get pgDaysCompleted => 'ngày xong cả kế hoạch';

  @override
  String get pgDayStreak => 'ngày liên tiếp';

  @override
  String pgBestDay(String day) {
    return 'Tốt nhất: $day';
  }

  @override
  String get pgNextWeekFocus => 'Trọng tâm tuần sau';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Hoàn thành cả kế hoạch trong $n ngày. Tuần này bạn làm được $done.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Sắp xếp $n buổi tập. Tuần này bạn tập $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Đo chiều cao một lần, vào buổi sáng, chân trần, cùng một chỗ. Đó là cách thấy thay đổi thật.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Đạt mọi mục tiêu. Giờ hãy làm trọn cả $day nữa.';
  }

  @override
  String get pgFocusKeep =>
      'Đạt mọi mục tiêu, ngày nào cũng trọn vẹn. Giữ nguyên kế hoạch, giữ nhịp nhé.';

  @override
  String get pgHeightThisWeek => 'Chiều cao tuần này';

  @override
  String pgHeightNow(String height) {
    return 'Hiện tại $height';
  }

  @override
  String get pgNoMeasurementWeek => 'Tuần này chưa đo';

  @override
  String get pgFirstMeasurement => 'Lần đo đầu tiên';

  @override
  String pgStartedAt(String height) {
    return 'Ban đầu $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Tiềm năng $height';
  }

  @override
  String pgToPotential(String cm) {
    return 'Còn $cm đến tiềm năng dự đoán.';
  }

  @override
  String get pgPotentialReached =>
      'Bạn đã đạt tiềm năng dự đoán. Tập tư thế vẫn giúp bạn trông cao hơn.';

  @override
  String get pgHabitsToday => 'Đã ghi hôm nay';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves động tác · $minutes phút';
  }

  @override
  String plDoneCount(int done, int total) {
    return 'Xong $done/$total';
  }

  @override
  String get plStartWorkout => 'Bắt đầu tập';

  @override
  String get plContinueWorkout => 'Tập tiếp';

  @override
  String get plWorkoutDoneToday => 'Đã xong buổi tập hôm nay';

  @override
  String get plTraining => 'Tập luyện';

  @override
  String get plHabits => 'Thói quen hằng ngày';

  @override
  String get plRestDayNote =>
      'Ngày nhẹ nhàng: một bài yoga ngắn giúp cơ thể dẻo dai cho ngày mai.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps lần';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds giây';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds giây mỗi bên';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes phút';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g chia các bữa';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters trong ngày';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours giờ tối nay';
  }

  @override
  String get plYourRoutines => 'Thói quen của bạn';

  @override
  String get plNewRoutine => 'Thói quen mới';

  @override
  String get plCustomEmpty =>
      'Tự tạo thói quen riêng và đánh dấu ở đây mỗi ngày.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'Xóa \"$name\"?';
  }

  @override
  String get plHoldToDelete => 'Nhấn giữ một thói quen để xóa.';

  @override
  String plSetOf(int current, int total) {
    return 'Hiệp $current/$total';
  }

  @override
  String get plRest => 'Nghỉ';

  @override
  String get plStartSet => 'Bắt đầu hiệp';

  @override
  String get plSetDone => 'Xong hiệp';

  @override
  String get plSkipRest => 'Bỏ qua nghỉ';

  @override
  String get plNextMove => 'Động tác tiếp';

  @override
  String get plSkipMove => 'Bỏ qua';

  @override
  String plUpNext(String name) {
    return 'Tiếp theo: $name';
  }

  @override
  String get plLastMove => 'Động tác cuối';

  @override
  String get plWorkoutComplete => 'Hoàn thành buổi tập';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves động tác trong khoảng $minutes phút. Buổi nào cũng đáng giá.';
  }

  @override
  String get plEachSide => 'Mỗi bên';

  @override
  String get plMoveDone => 'Xong động tác';

  @override
  String plRepsBig(int reps) {
    return '$reps lần';
  }

  @override
  String get plSessionHint =>
      'Tập theo nhịp của bạn và chạm xong khi hoàn thành.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'Ngày $day/$total';
  }

  @override
  String get plTodayStep => 'Bước hôm nay';

  @override
  String get plTickToComplete => 'Đánh dấu mọi động tác để hoàn thành ngày';

  @override
  String plNextDayTomorrow(int day) {
    return 'Ngày $day mở vào ngày mai. Nghỉ ngơi cũng là một phần của tăng trưởng.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ngày',
    );
    return 'Còn $_temp0 lên cấp $level';
  }

  @override
  String get plProgramFinished =>
      'Đã xong cả 70 ngày. Bạn đã hoàn thành chương trình.';

  @override
  String plDayCompleteToast(int day) {
    return 'Xong ngày $day';
  }

  @override
  String get plLevelWeek => 'Tuần của cấp này';

  @override
  String get plProgressionTitle => 'Độ khó tăng thế nào';

  @override
  String get plNow => 'Hiện tại';

  @override
  String plLevelN(int n) {
    return 'Cấp $n';
  }

  @override
  String get plUnlockProgram => 'Mở khóa chương trình 70 ngày';

  @override
  String get plProgramPitch =>
      '10 cấp, mỗi tuần một cấp. Mỗi cấp thêm vài giây giữ, thêm lần bật nhảy, và thêm hiệp khi bạn sẵn sàng.';

  @override
  String plDayLocked(int day) {
    return 'Hãy xong ngày $day trước';
  }

  @override
  String plCurrentDay(int day) {
    return 'Ngày $day';
  }

  @override
  String get plTodaysTargets => 'Mục tiêu hôm nay';

  @override
  String get plTargetsBasis => 'Tính từ tuổi, cân nặng và lịch tập của bạn';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals bữa x $grams g';
  }

  @override
  String get plZinc => 'Kẽm';

  @override
  String get plMagnesium => 'Magie';

  @override
  String get plEnergy => 'Năng lượng';

  @override
  String get plChecklist => 'Danh sách hôm nay';

  @override
  String plCheckProtein(int grams) {
    return 'Protein $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'Canxi $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'Vitamin D $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return 'Nước $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount từ các bữa đã đánh dấu';
  }

  @override
  String get plVitaminDNote =>
      '15 phút nắng trưa lên tay và mặt, hoặc thực phẩm bổ sung bác sĩ đồng ý';

  @override
  String plWaterLogged(String liters) {
    return 'Đã ghi $liters';
  }

  @override
  String get plMealPlan => 'Thực đơn của bạn';

  @override
  String get plMealPlanSub =>
      'Thực phẩm thật, gam thật, vừa với mục tiêu của bạn';

  @override
  String get plSnack => 'Bữa phụ';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g protein · $calcium mg canxi · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'mục tiêu $grams g';
  }

  @override
  String get plMarkEaten => 'Đánh dấu đã ăn';

  @override
  String get plEaten => 'Đã ăn';

  @override
  String get plPlanTotal => 'Tổng cả ngày';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'Các bữa này cho khoảng $planKcal trong $kcal kcal của bạn. Bù phần còn lại bằng trái cây, rau, bánh mì hoặc cơm.';
  }

  @override
  String get plWeeklyMenu => 'Thực đơn tuần';

  @override
  String get plWeeklyMenuSub => 'Mỗi ngày một món khác, mục tiêu vẫn vậy';

  @override
  String get plUnlockMenu => 'Mở khóa trọn thực đơn tuần';

  @override
  String get plRecipes => 'Công thức';

  @override
  String get plRecipesSub => 'Món nhanh giàu protein';

  @override
  String get plNutritionGuide => 'Hướng dẫn dinh dưỡng';

  @override
  String get plNutritionGuideSub =>
      'Dưỡng chất, thực phẩm và thực phẩm bổ sung';

  @override
  String plPieces(int n) {
    return '$n cái';
  }

  @override
  String get plFoodOats => 'Yến mạch';

  @override
  String get plFoodMilk => 'Sữa';

  @override
  String get plFoodBanana => 'Chuối';

  @override
  String get plFoodWalnuts => 'Óc chó';

  @override
  String get plFoodGreekYogurt => 'Sữa chua Hy Lạp';

  @override
  String get plFoodYogurt => 'Sữa chua';

  @override
  String get plFoodEggs => 'Trứng';

  @override
  String get plFoodBread => 'Bánh mì nguyên cám';

  @override
  String get plFoodWhiteCheese => 'Phô mai feta';

  @override
  String get plFoodHardCheese => 'Phô mai cheddar';

  @override
  String get plFoodSalad => 'Salad cà chua dưa leo';

  @override
  String get plFoodOrange => 'Cam';

  @override
  String get plFoodPeanutButter => 'Bơ đậu phộng';

  @override
  String get plFoodSpinach => 'Rau chân vịt';

  @override
  String get plFoodCottageCheese => 'Phô mai cottage';

  @override
  String get plFoodChicken => 'Ức gà';

  @override
  String get plFoodBulgur => 'Lúa mì bulgur';

  @override
  String get plFoodAyran => 'Ayran (sữa chua uống)';

  @override
  String get plFoodTuna => 'Cá ngừ (đóng hộp)';

  @override
  String get plFoodPasta => 'Mì Ý';

  @override
  String get plFoodBeef => 'Thịt bò nạc';

  @override
  String get plFoodRice => 'Cơm';

  @override
  String get plFoodChickpeas => 'Đậu gà';

  @override
  String get plFoodSalmon => 'Cá hồi';

  @override
  String get plFoodBroccoli => 'Bông cải xanh';

  @override
  String get plFoodPotato => 'Khoai tây';

  @override
  String get plFoodLentils => 'Đậu lăng';

  @override
  String get plFoodSardines => 'Cá mòi';

  @override
  String get plFoodAlmonds => 'Hạnh nhân';

  @override
  String get plFoodKefir => 'Kefir';

  @override
  String get plFoodPumpkinSeeds => 'Hạt bí';

  @override
  String get wtCoffee => 'Cà phê';

  @override
  String get wtTea => 'Trà';

  @override
  String get wtCola => 'Cola';

  @override
  String get wtEnergyDrink => 'Nước tăng lực';

  @override
  String get crCustomBadge => 'Tự tạo';

  @override
  String get crNameHint => 'VD: Giãn cơ buổi sáng';

  @override
  String get crDoseHint => 'VD: 3x10 lần hoặc 3x30 giây';

  @override
  String get paywallLifetime => 'Trọn đời';

  @override
  String paywallOnce(String price) {
    return '$price một lần';
  }

  @override
  String get paywallLifetimeBadge => 'Không đăng ký định kỳ';

  @override
  String get paywallLifetimeDisclaimer =>
      'Thanh toán một lần · không đăng ký, không gia hạn';

  @override
  String get pwSlidePotentialTitle => 'Xem tiềm năng của bạn';

  @override
  String get pwSlidePotentialCaption =>
      'Tính từ tuổi, chiều cao của bạn và chiều cao của bố mẹ.';

  @override
  String get pwSlideTodayTitle => 'Kế hoạch cho mỗi ngày';

  @override
  String get pwSlideTodayCaption => 'Bài tập ngắn mỗi ngày có video hướng dẫn.';

  @override
  String get pwSlideProgramTitle => '70 ngày, 10 cấp';

  @override
  String get pwSlideProgramCaption => 'Mỗi tuần động tác khó hơn một chút.';

  @override
  String get pwSlideNutritionTitle => 'Ăn để cao lớn';

  @override
  String get pwSlideNutritionCaption =>
      'Mục tiêu protein, canxi và vitamin D hằng ngày dành riêng cho bạn.';

  @override
  String get pwSlideChartTitle => 'Ngắm đường cong đi lên';

  @override
  String get pwSlideChartCaption =>
      'Mỗi lần đo đều nằm trên con đường đến tiềm năng của bạn.';

  @override
  String get pwSlideScoreTitle => 'Một điểm số cho thói quen';

  @override
  String get pwSlideScoreCaption => 'Biết thói quen nào cần sửa trước.';

  @override
  String get pwSlidePostureTitle => 'Đứng thẳng hơn ngay hôm nay';

  @override
  String get pwSlidePostureCaption =>
      'Kiểm tra tư thế nhanh, kèm động tác để sửa.';

  @override
  String get pwExample => 'Ví dụ';

  @override
  String pwYouLine(String now, String potential) {
    return 'Bạn: $now → tiềm năng $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'Ví dụ: $now → tiềm năng $potential';
  }

  @override
  String get tv3NewEyebrow => 'Có gì mới';

  @override
  String get tv3NewTitle => 'BeTaller vừa cập nhật lớn';

  @override
  String get tv3NewDesc =>
      'Kế hoạch mới, chương trình mới, giao diện mới. Đây là những điểm mới.';

  @override
  String get tv3PotentialTitle => 'Đây là tiềm năng của bạn';

  @override
  String get tv3PotentialDesc =>
      'Chiều cao hôm nay bên cạnh mức bạn có thể đạt. Kế hoạch sẽ thu hẹp khoảng cách.';

  @override
  String get tv3TodayTitle => 'Kế hoạch hôm nay';

  @override
  String tv3TodayDesc(String button) {
    return 'Bài tập ngắn dành cho hôm nay. Chạm $button và tập theo.';
  }

  @override
  String get tv3ProgramTitle => '70 ngày Kỷ luật';

  @override
  String get tv3ProgramDesc =>
      'Mỗi ngày một bước qua 10 cấp. Ngày sau xây trên ngày trước.';

  @override
  String get tv3NutritionTitle => 'Mục tiêu hằng ngày';

  @override
  String get tv3NutritionDesc =>
      'Protein, canxi, vitamin D và nước, tính riêng cho cơ thể bạn.';

  @override
  String get tv3ChartTitle => 'Theo dõi đường cong';

  @override
  String get tv3ChartDesc =>
      'Đo mỗi một hai tuần và xem đường của bạn leo dần về phía tiềm năng.';

  @override
  String get tv3ScoreTitle => 'Điểm BeTaller của bạn';

  @override
  String get tv3ScoreDesc =>
      'Một con số cho thấy bạn đang thế nào. Nâng phần yếu nhất trước.';

  @override
  String get tv3Next => 'Tiếp';

  @override
  String get tv3ShowMe => 'Cho mình xem';

  @override
  String get tv3Done => 'Bắt đầu thôi';

  @override
  String get obWhyTitle => 'Vì sao bạn muốn cao hơn?';

  @override
  String get obWhySubtitle =>
      'Chọn tất cả lý do đúng. Kế hoạch bắt đầu từ lý do của bạn.';

  @override
  String get obWhyConfidence => 'Tự tin hơn';

  @override
  String get obWhyImpression => 'Gây ấn tượng ban đầu tốt hơn';

  @override
  String get obWhySports => 'Chơi thể thao tốt hơn';

  @override
  String get obWhyClothes => 'Mặc đồ vừa đẹp hơn';

  @override
  String get obWhyPhotos => 'Lên ảnh đẹp hơn';

  @override
  String get obWhyPotential => 'Chỉ muốn biết tiềm năng của mình';

  @override
  String get obTriedTitle => 'Bạn đã thử app tăng chiều cao khác chưa?';

  @override
  String get obTriedSubtitle =>
      'Không có câu sai. Nó giúp tụi mình cho bạn thấy điểm khác biệt ở đây.';

  @override
  String get obTriedStopped => 'Rồi, nhưng mình đã bỏ';

  @override
  String get obTriedStill => 'Rồi, mình vẫn đang dùng';

  @override
  String get obTriedFirst => 'Chưa, đây là lần đầu';

  @override
  String get obTriedStoppedTitle => 'Chỉ một con số thì khó giữ động lực';

  @override
  String get obTriedStoppedBody =>
      'Hầu hết các app chỉ cho bạn một con số. BeTaller biến nó thành kế hoạch hằng ngày để bạn đánh dấu, có nhắc đúng giờ của bạn.';

  @override
  String get obTriedStillTitle => 'Giữ lại những gì hiệu quả với bạn';

  @override
  String get obTriedStillBody =>
      'BeTaller thêm phần hằng ngày: kế hoạch dựa trên câu trả lời của bạn để đánh dấu, từng bước một.';

  @override
  String get obTriedFirstTitle => 'Chỗ tốt để bắt đầu';

  @override
  String get obTriedFirstBody =>
      'Ở đây bạn không chỉ nhận một con số. BeTaller biến câu trả lời của bạn thành kế hoạch hằng ngày để đánh dấu.';

  @override
  String get obTriedCardTitle => 'Những gì bạn đánh dấu mỗi ngày';

  @override
  String get obTriedItem1 => 'Bài tập ngắn chọn cho tuần của bạn';

  @override
  String get obTriedItem2 => 'Mục tiêu protein';

  @override
  String get obTriedItem3 => 'Tắt đèn đi ngủ đúng giờ';

  @override
  String get obBlockTitle => 'Điều gì cản trở bạn?';

  @override
  String get obBlockSubtitle =>
      'Chọn tất cả điều đúng. Kế hoạch sẽ xoay quanh chúng.';

  @override
  String get obBlockForget => 'Mình hay quên';

  @override
  String get obBlockTime => 'Không đủ thời gian';

  @override
  String get obBlockExercises => 'Không biết tập bài nào';

  @override
  String get obBlockMotivation => 'Mình mất động lực';

  @override
  String get obBlockBedtime => 'Mình ngủ muộn';

  @override
  String get obBlockMeals => 'Mình bỏ bữa';

  @override
  String get obFirstTitle => 'Khi cao hơn, việc đầu tiên bạn sẽ làm?';

  @override
  String get obFirstSubtitle => 'Hình dung đi. Đó là điều bạn đang hướng tới.';

  @override
  String get obFirstWardrobe => 'Làm mới tủ đồ';

  @override
  String get obFirstMuscle => 'Tập cơ bắp';

  @override
  String get obFirstPhotos => 'Đăng ảnh nhiều hơn';

  @override
  String get obFirstTeam => 'Thử vào một đội thể thao';

  @override
  String get obFirstFeelGood => 'Không gì đặc biệt, chỉ thấy vui';

  @override
  String get obBuiltChip => 'Dành riêng cho bạn';

  @override
  String get obBuiltTitle => 'Kế hoạch xây quanh bạn';

  @override
  String get obBuiltReason => 'Lý do của bạn';

  @override
  String get obBuiltGoal => 'Mục tiêu';

  @override
  String get obBuiltWhen => 'Khi bạn đạt được';

  @override
  String get obBuiltBlockers => 'Những điều cản trở, đã có cách';

  @override
  String get obFixForget => 'Nhắc vào giờ bạn chọn';

  @override
  String get obFixTime => 'Buổi tập ngắn, phần lớn khoảng 15 phút';

  @override
  String get obFixExercises => 'Động tác có video hướng dẫn, từng bước';

  @override
  String get obFixMotivation => 'Chuỗi ngày và cấp độ giữ động lực';

  @override
  String get obFixBedtime => 'Mục tiêu ngủ và nhắc giờ đi ngủ';

  @override
  String get obFixMeals => 'Mục tiêu protein và thực đơn';

  @override
  String get obNotifTitle => 'BeTaller nhắc bạn đúng lúc cần';

  @override
  String get obNotifSubtitle =>
      'Đặt theo giờ bạn đã chọn. Đổi lúc nào cũng được.';

  @override
  String get obNotifWorkout => 'Tập luyện';

  @override
  String obNotifWorkoutDetail(String time) {
    return '30 phút trước buổi tập lúc $time';
  }

  @override
  String get obNotifMeal => 'Bữa ăn và protein';

  @override
  String obNotifMealDetail(String time) {
    return 'Vào bữa lúc $time';
  }

  @override
  String get obNotifWater => 'Nước';

  @override
  String get obNotifWaterDetail => 'Nghỉ uống nước vào buổi chiều';

  @override
  String get obNotifSleep => 'Thư giãn';

  @override
  String obNotifSleepDetail(String time) {
    return 'Một tiếng trước giờ ngủ lúc $time';
  }

  @override
  String get obNotifAllow => 'Bật lời nhắc';

  @override
  String get obNotifNotNow => 'Để sau';

  @override
  String get obNotifNow => 'bây giờ';

  @override
  String get ftOneFree => '1 lần miễn phí';

  @override
  String get ftFreeToday => 'Miễn phí hôm nay';

  @override
  String get ftContinuePro => 'Tiếp tục với Pro';

  @override
  String get ftNotNow => 'Để sau';

  @override
  String get ftOutWorkoutTitle => 'Bạn đã dùng buổi tập miễn phí';

  @override
  String get ftOutWorkoutBody =>
      'Giữ chuỗi với Pro: mỗi ngày một buổi tập có hướng dẫn, mỗi động tác đều được bấm giờ cho bạn.';

  @override
  String get ftOutDayTitle => 'Ngày đầu miễn phí đã xong';

  @override
  String get ftOutDayBody =>
      'Kế hoạch, mục tiêu và tiến độ vẫn ở đây để bạn xem. Giữ chuỗi với Pro: đánh dấu kế hoạch và ghi nước, giấc ngủ mỗi ngày.';

  @override
  String get ftOutPostureTitle => 'Bạn đã dùng lần kiểm tra tư thế miễn phí';

  @override
  String get ftOutPostureBody =>
      'Kết quả vẫn ở đây. Kiểm tra mỗi tuần với Pro và xem tư thế tiến bộ.';

  @override
  String get ftOutPhotosTitle => 'Bạn đã dùng lần so sánh ảnh miễn phí';

  @override
  String get ftOutPhotosBody =>
      'Cặp ảnh đó vẫn là của bạn để xem. Thêm ảnh và so sánh hai ảnh bất kỳ với Pro.';

  @override
  String get ftOutReportTitle => 'Bạn đã dùng báo cáo tuần miễn phí';

  @override
  String get ftOutReportBody =>
      'Nhận tổng kết đầy đủ mỗi tuần với Pro: chấm điểm từng ngày, mục tiêu và một điều cần làm tốt hơn.';

  @override
  String get ftOutScoreTitle => 'Bạn đã xem phân tích điểm miễn phí';

  @override
  String get ftOutScoreBody =>
      'Điểm vẫn hiện trên màn hình. Xem điều gì tạo nên nó và cần làm gì tiếp, mỗi ngày với Pro.';

  @override
  String get ftOutArticleTitle => 'Bạn đã đọc bài miễn phí';

  @override
  String get ftOutArticleBody =>
      'Bài đó vẫn mở cho bạn. Đọc cả thư viện với Pro.';

  @override
  String get ftWhyWorkout => 'Buổi tập có hướng dẫn thuộc gói Pro';

  @override
  String get ftWhyPlan => 'Đánh dấu kế hoạch thuộc gói Pro';

  @override
  String get ftWhyProgram => 'Chương trình 70 ngày thuộc gói Pro';

  @override
  String get ftWhyWater => 'Ghi nước mỗi ngày thuộc gói Pro';

  @override
  String get ftWhySleep => 'Ghi giấc ngủ mỗi ngày thuộc gói Pro';

  @override
  String get ftWhyNutrition => 'Kế hoạch dinh dưỡng hằng ngày thuộc gói Pro';

  @override
  String get ftWhyPosture => 'Kiểm tra tư thế hằng tuần thuộc gói Pro';

  @override
  String get ftWhyPhotos => 'So sánh ảnh thuộc gói Pro';

  @override
  String get ftWhyReport => 'Báo cáo tuần thuộc gói Pro';

  @override
  String get ftWhyScore => 'Phân tích điểm thuộc gói Pro';

  @override
  String get ftWhyArticle => 'Cả thư viện thuộc gói Pro';

  @override
  String get ftPlanLocked =>
      'Kế hoạch vẫn ở đây để xem. Đánh dấu thì thuộc gói Pro.';

  @override
  String get ftNutritionLocked =>
      'Mục tiêu và bữa ăn vẫn ở đây để xem. Đánh dấu thì thuộc gói Pro.';

  @override
  String get ftPreviewTag => 'Xem trước';

  @override
  String get ftPreviewTitle => 'Đó là phần xem trước';

  @override
  String get ftPreviewBody =>
      'Phần còn lại của buổi tập thuộc gói Pro. Tiếp theo sẽ là:';

  @override
  String get ftFreeWorkoutUsed =>
      'Đó là buổi tập có hướng dẫn miễn phí. Với Pro, ngày nào cũng có.';

  @override
  String get ftScoreLockedTitle => 'Điều gì tạo nên điểm của bạn';

  @override
  String get ftScoreLockedBody =>
      'Từng phần trong điểm số, dựa trên gì và một việc cần làm tiếp.';

  @override
  String get ftReportLockedTitle => 'Trọn tuần của bạn';

  @override
  String get ftReportLockedBody =>
      'Chấm điểm từng ngày theo kế hoạch, mục tiêu, chiều cao và một trọng tâm cho tuần sau.';

  @override
  String get ftPhotosLockedTitle => 'So sánh hai ảnh này';

  @override
  String get ftPhotosLockedBody =>
      'Bạn đã dùng lần so sánh miễn phí. Với Pro, bạn có thể trượt giữa hai ảnh bất kỳ.';

  @override
  String get ftArticleFreeLine =>
      'Bài đầu tiên miễn phí. Chọn bài bạn muốn nhé.';

  @override
  String get plFinishWorkout => 'Kết thúc';

  @override
  String get obTriedMostApps => 'Hầu hết các app';

  @override
  String get obTriedThatsIt => 'Một con số, vậy thôi.';

  @override
  String get obTriedPlanLabel => 'Một ngày của bạn trên BeTaller';

  @override
  String get obTriedProteinSub => 'Chia đều các bữa';

  @override
  String get obTriedSleepSub => 'Nhắc trước khi ngủ';

  @override
  String get obTriedFeatVideo => 'Động tác có video hướng dẫn';

  @override
  String get obTriedFeatReminders => 'Nhắc đúng giờ của bạn';

  @override
  String get obTriedFeatStreaks => 'Chuỗi ngày và cấp độ';

  @override
  String get obBedtimeUnknown => 'Mình không biết, giờ không cố định';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'Tụi mình gợi ý $time, dựa trên lượng ngủ cần ở tuổi bạn. Đổi lúc nào cũng được.';
  }

  @override
  String get obWorkoutTimeUnknown => 'Mình không biết, không có giờ cố định';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'Tạm thời dùng $time. Đổi lúc nào cũng được.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'Gợi ý: đi ngủ khoảng $time. Đổi lúc nào cũng được.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'Gợi ý: tập khoảng $time. Đổi lúc nào cũng được.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'Đặt theo giờ bạn đã chọn, kèm gợi ý cho chỗ bạn chưa chắc. Đổi lúc nào cũng được.';

  @override
  String get plFoodBrownRice => 'Gạo lứt';

  @override
  String get unitHeightTitle => 'Đơn vị chiều cao';

  @override
  String get unitWeightTitle => 'Đơn vị cân nặng';

  @override
  String get unitWaterTitle => 'Đơn vị nước';

  @override
  String get unitOptCm => 'Centimet';

  @override
  String get unitOptFtIn => 'Feet và inch';

  @override
  String get unitOptKg => 'Kilôgam';

  @override
  String get unitOptLb => 'Pound';

  @override
  String get unitOptStLb => 'Stone và pound';

  @override
  String get unitOptLiters => 'Lít';

  @override
  String get unitOptFlOz => 'Ounce chất lỏng';

  @override
  String achieveGrowthImp(String amount) {
    return 'Tăng $amount';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'Ghi nhận tổng cộng tăng $amount';
  }

  @override
  String get postureBenefitIn =>
      'Đầu, vai và lưng dưới. Đứng thẳng giúp lộ thêm khoảng 1 inch chiều cao thật của bạn.';

  @override
  String get notifPostureBodyIn =>
      'Lưng thẳng, vai ra sau. Tư thế tốt = chênh khoảng 1 inch!';

  @override
  String get painPostureDescIn =>
      'Tư thế đúng có thể ngay lập tức thêm tới khoảng 1 inch. Thói quen tư thế hằng ngày của BeTaller giúp bạn giữ được điều đó sau vài tuần.';

  @override
  String get routinePostureDescIn =>
      'Giữ lưng thẳng, vai mở ra sau. Kiểm tra mỗi giờ. Tư thế tốt = chênh khoảng 1 inch.';

  @override
  String get sciPostureCheckIn =>
      'Tư thế đúng có thể ngay lập tức giúp trông cao hơn khoảng 1 inch và ngăn chèn ép cột sống';

  @override
  String get routineProteinDescLb =>
      'Trứng, gà, cá, sữa. Ít nhất 0,7 g protein cho mỗi lb cân nặng mỗi ngày.';

  @override
  String pwPersonalTitle(String height) {
    return 'Kế hoạch để đạt $height đã sẵn sàng';
  }

  @override
  String get pwPersonalEstimate =>
      'Tiềm năng ước tính từ câu trả lời của bạn, không phải lời đảm bảo';

  @override
  String pwPersonalReason(String reason) {
    return 'Lý do của bạn: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'Nhắc thư giãn trước giờ ngủ lúc $time';
  }

  @override
  String get obParentUnknown => 'Mình không biết';

  @override
  String get obParentUnknownHint =>
      'Tụi mình sẽ dùng chiều cao trung bình của người trưởng thành. Kém chính xác hơn, bạn có thể thêm trong hồ sơ bất cứ lúc nào.';

  @override
  String get obEthnicityWhy =>
      'Chỉ dùng để ước tính chiều cao của bố hoặc mẹ mà bạn không biết.';

  @override
  String get resultNoParentNote =>
      'Ước tính khi thiếu chiều cao của bố hoặc mẹ, nên kém chính xác hơn. Thêm trong hồ sơ bất cứ lúc nào.';

  @override
  String get resultNoParentsNote =>
      'Ước tính khi thiếu chiều cao của bố mẹ, nên kém chính xác hơn. Thêm trong hồ sơ bất cứ lúc nào.';

  @override
  String get resultFootnoteEstimated =>
      'Ước tính dựa trên dữ liệu biểu đồ tăng trưởng và chiều cao trung bình của người trưởng thành. Không phải lời khuyên y tế.';

  @override
  String get obBudgetChip => 'GIÁ HỢP LÝ';

  @override
  String get obBudgetTitle =>
      'BeTaller có giá hợp lý cho mọi bạn teen muốn cao lên';

  @override
  String get obBudgetDesc =>
      'Chiều cao của bạn không nên phụ thuộc vào việc bạn có bao nhiêu tiền. Vì vậy giá được đặt riêng cho từng quốc gia.';

  @override
  String obBudgetWeek(String price) {
    return 'Một tuần Pro ở đây: $price';
  }

  @override
  String get obBudgetLocalTitle => 'Giá theo quốc gia của bạn';

  @override
  String get obBudgetLocalDesc =>
      'Không quy đổi từ đô la Mỹ: đặt theo túi tiền nơi bạn sống.';

  @override
  String get obBudgetWeekTitle => 'Bắt đầu chỉ với một tuần';

  @override
  String get obBudgetWeekDesc =>
      'Không phải trả một khoản lớn trước. Hủy bất cứ lúc nào trong cài đặt Apple ID.';

  @override
  String get obBudgetAllTitle => 'Mọi thứ trong một gói';

  @override
  String get obBudgetAllDesc =>
      'Bài tập, giấc ngủ, dinh dưỡng, tư thế và báo cáo tiến độ.';

  @override
  String get obRateTitle => 'BeTaller được tạo ra để thật sự giúp bạn';

  @override
  String get obRateDesc =>
      'Nếu bạn thích sự quan tâm riêng và sự thẳng thắn của tụi mình, tụi mình sẽ rất vui nếu bạn đánh giá app.';

  @override
  String get obRateCta => 'Đánh giá BeTaller';

  @override
  String get obRateLater => 'Để sau';
}
