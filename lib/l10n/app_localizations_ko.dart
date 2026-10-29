// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get navHome => '홈';

  @override
  String get navAnalysis => '분석';

  @override
  String get navRoutines => '내 플랜';

  @override
  String get disciplineTitle => '꾸준함';

  @override
  String get disciplineProgramTitle => '꾸준함 프로그램';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total일';
  }

  @override
  String get disciplineCompleteDay => '오늘 완료하기';

  @override
  String disciplineDayN(int n) {
    return '$n일차';
  }

  @override
  String get disciplineLevels => '레벨';

  @override
  String get disciplineLevelDone => '완료';

  @override
  String get disciplineLocked => '잠김';

  @override
  String get disciplineTodayIs => '오늘';

  @override
  String get disciplineToday => '오늘';

  @override
  String get disciplineTodayPlan => '오늘의 플랜';

  @override
  String get disciplineWeek => '이번 주';

  @override
  String get disciplineMonth => '이번 달';

  @override
  String get disciplineLevel => '꾸준함 레벨';

  @override
  String disciplineStreakDays(int days) {
    return '$days일 연속';
  }

  @override
  String disciplineToNext(int days) {
    return '다음 레벨까지 $days일';
  }

  @override
  String get disciplineMaxTier => '최고 레벨 달성';

  @override
  String get disciplineTierSpark => '불꽃';

  @override
  String get disciplineTierSteady => '꾸준함';

  @override
  String get disciplineTierSharp => '예리함';

  @override
  String get disciplineTierSolid => '단단함';

  @override
  String get disciplineTierRelentless => '끈기';

  @override
  String get disciplineTierUnbroken => '불굴';

  @override
  String get disciplineTierLegend => '레전드';

  @override
  String get goalPerfectDays => '플랜을 다 끝낸 날';

  @override
  String get goalWorkouts => '운동 횟수';

  @override
  String get goalMeasurement => '키 측정';

  @override
  String get goalPhoto => '변화 사진';

  @override
  String get goalPostureCheck => '자세 체크';

  @override
  String get disciplineAllDone => '오늘 완료!';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total 완료';
  }

  @override
  String get navProgress => '진행 상황';

  @override
  String get trackingSection => '나의 기록 도구';

  @override
  String get photosBenefit => '전후 사진을 나란히 비교해요. 글이 아니라 눈으로 변화를 확인해요.';

  @override
  String get postureBenefit => '머리, 어깨, 허리를 체크해요. 바르게 서면 원래 키가 2-3 cm 더 드러나요.';

  @override
  String get reportBenefit => '한 주를 하루씩 점수 매기고 어디서 흐트러졌는지 확인해요.';

  @override
  String get photosCta => '사진 추가';

  @override
  String get postureCta => '분석하기';

  @override
  String get reportCta => '리포트 열기';

  @override
  String get toolStateReady => '준비됨';

  @override
  String get photosSummaryEmpty => '첫 사진을 추가해 보세요';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진 $count장',
      one: '사진 $count장',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => '아직 분석 없음';

  @override
  String postureSummaryScore(int score) {
    return '자세 $score/100';
  }

  @override
  String get navProfile => '프로필';

  @override
  String greeting(String name) {
    return '안녕하세요, $name님';
  }

  @override
  String get currentHeight => '현재 키';

  @override
  String get target => '목표';

  @override
  String completed(String pct) {
    return '$pct% 달성';
  }

  @override
  String remaining(String cm, String unit) {
    return '+$cm $unit 남음';
  }

  @override
  String get updateAnalysis => '분석 업데이트';

  @override
  String get analysisSubtitle => '예전 키와 습관으로 예측받기';

  @override
  String get dailyRoutines => '오늘의 루틴';

  @override
  String get allRoutinesDone => '루틴을 모두 완료했어요!';

  @override
  String get water => '물';

  @override
  String get sleep => '수면';

  @override
  String get growthSummary => '성장 요약';

  @override
  String get total => '합계';

  @override
  String get last => '최근';

  @override
  String get measurement => '측정';

  @override
  String get dailyTip => '오늘의 팁';

  @override
  String get waterTracking => '물 섭취 기록';

  @override
  String get waterGoalReached => '오늘 목표 달성';

  @override
  String waterRemaining(String amount) {
    return '$amount 남음';
  }

  @override
  String get undo => '되돌리기';

  @override
  String waterToday(String amount) {
    return '오늘: $amount L';
  }

  @override
  String get sleepTracking => '수면 기록';

  @override
  String sleepTarget(String hours) {
    return '목표: $hours시간';
  }

  @override
  String get hours => '시간';

  @override
  String get save => '저장';

  @override
  String get cancel => '취소';

  @override
  String get analysis => '분석';

  @override
  String get betallerScore => 'BeTaller 점수';

  @override
  String get genetic => '유전';

  @override
  String get growth => '성장';

  @override
  String get nutrition => '영양';

  @override
  String get sleepLabel => '수면';

  @override
  String get discipline => '꾸준함';

  @override
  String get improveScore => '점수 올리기';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => '영양 상태 위험!';

  @override
  String get nutritionStrengthen => '영양 보강하기';

  @override
  String get sleepRecordAdd => '수면 기록 추가';

  @override
  String get sleepPoor => '수면 패턴 불규칙';

  @override
  String get sleepImprove => '수면 개선하기';

  @override
  String get startToday => '오늘 시작해요!';

  @override
  String routinesRemaining(int count) {
    return '루틴 $count개 남음';
  }

  @override
  String get keepStreak => '연속 기록 이어가기';

  @override
  String get addFirstMeasurement => '첫 측정 추가';

  @override
  String get addMeasurement => '측정 추가';

  @override
  String waterHalfNotReached(String amount) {
    return '오늘 물 목표의 절반도 못 채웠어요. ${amount}L 더 마셔요.';
  }

  @override
  String waterAlmostDone(String amount) {
    return '물 목표까지 ${amount}L 남았어요. 거의 다 왔어요!';
  }

  @override
  String bmiLow(String bmi) {
    return 'BMI가 $bmi로 조금 낮아요. 단백질과 칼로리를 더 챙겨요.';
  }

  @override
  String get bodyFactsTitle => '내 몸';

  @override
  String get dailyNeedsTitle => '하루 목표량';

  @override
  String bmiHigh(String bmi) {
    return 'BMI가 $bmi로 조금 높아요. 건강한 식사에 집중해요.';
  }

  @override
  String get nutritionDefault => '물 목표를 채우고 균형 잡힌 식사를 유지해요.';

  @override
  String sleepNoRecord(String hours) {
    return '오늘 수면 기록이 없어요. $hours시간을 목표로 자고 기록해요.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return '오늘 $current시간 잤어요. $missing시간 부족해요. 조금 더 일찍 자요!';
  }

  @override
  String sleepAlmost(String hours) {
    return '거의 다 왔어요. $hours시간을 채우면 성장호르몬이 최대로 나와요.';
  }

  @override
  String get sleepGood => '수면 패턴 최고예요! 계속 유지해요.';

  @override
  String noRoutinesDone(int total) {
    return '오늘 완료한 루틴이 없어요. $total개 중 하나부터 시작해요!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '오늘 루틴 $done/$total 완료. $left개만 더!';
  }

  @override
  String streakBuilding(int needed) {
    return '오늘 잘했어요! $needed일 더 하면 연속 기록이 시작돼요.';
  }

  @override
  String streakContinue(int days) {
    return '$days일 연속! 계속할수록 점수가 올라가요.';
  }

  @override
  String get noMeasurements => '아직 키 측정 기록이 없어요. 정확한 예측을 위해 첫 측정을 추가해요.';

  @override
  String fewMeasurements(int count) {
    return '성장 속도를 계산하려면 측정을 $count번 더 추가해요.';
  }

  @override
  String goodMeasurements(int count) {
    return '측정 기록이 $count개예요. 5개가 되면 정확도가 크게 올라가요.';
  }

  @override
  String get keepMeasuring => '계속 측정을 추가해요. 기록이 늘수록 예측이 정확해져요.';

  @override
  String get heightPrediction => '키 예측';

  @override
  String get predictedHeightAt21 => '21세 예상 키';

  @override
  String get predictionMethod => '유전(부모님 키), 성장 속도, BMI, 나이 데이터를 종합해 계산해요.';

  @override
  String get growthStatus => '성장 상태';

  @override
  String get growthRemaining => '앞으로 남은 성장';

  @override
  String get growthBreakdown => '이 센티미터는 어디서 올까요';

  @override
  String get geneticGainLabel => '유전적 성장';

  @override
  String get lifestyleLabel => '생활 습관';

  @override
  String get geneticCeilingLabel => '최대치';

  @override
  String get reachableTargetHeight => '도달 가능한 목표 키';

  @override
  String get geneticCeilingProgress => '유전적 최대치까지 진행도';

  @override
  String get completionLabel => '달성률';

  @override
  String get growthVelocity => '성장 속도';

  @override
  String get noData => '데이터 없음';

  @override
  String growthRate(String rating) {
    return '성장률: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => '칼로리';

  @override
  String get kcalDay => 'kcal/일';

  @override
  String get daily => '하루';

  @override
  String get protein => '단백질';

  @override
  String get minimum => '최소';

  @override
  String get age => '나이';

  @override
  String get male => '남자';

  @override
  String get female => '여자';

  @override
  String get yearlyPrediction => '연도별 예측';

  @override
  String ageYear(int age) {
    return '$age세';
  }

  @override
  String get progressTitle => '진행 기록';

  @override
  String get totalGrowth => '합계';

  @override
  String get lastDiff => '최근 변화';

  @override
  String get measurementCount => '측정';

  @override
  String get heightChart => '키 그래프';

  @override
  String get chartMinData => '그래프를 보려면 측정이 2개 이상 필요해요';

  @override
  String get chartInstruction => '측정을 추가하면 진행 그래프를 볼 수 있어요!';

  @override
  String get addMeasurementButton => '새 측정 추가';

  @override
  String get measurementHistory => '측정 기록';

  @override
  String get deleteTitle => '측정 삭제';

  @override
  String get deleteMessage => '이 측정 기록을 삭제할까요?';

  @override
  String get dismiss => '취소';

  @override
  String get delete => '삭제';

  @override
  String get newMeasurement => '새 키 측정';

  @override
  String get routines => '루틴';

  @override
  String streakDays(int days) {
    return '$days일';
  }

  @override
  String get progressStatus => '진행 상태';

  @override
  String get completedLabel => '완료!';

  @override
  String get all => '전체';

  @override
  String get exercise => '운동';

  @override
  String get posture => '자세';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '$days일',
    );
    return '최고: $_temp0';
  }

  @override
  String get editProfile => '프로필 수정';

  @override
  String get editProfileSubtitle => '키, 몸무게, 나이 정보 수정';

  @override
  String get name => '이름';

  @override
  String birthDate(String date) {
    return '생일: $date';
  }

  @override
  String get heightCm => '키 (cm)';

  @override
  String get weightKg => '몸무게 (kg)';

  @override
  String get fatherHeight => '아빠 키 (cm)';

  @override
  String get motherHeight => '엄마 키 (cm)';

  @override
  String get notifications => '알림';

  @override
  String get reminderNextLabel => '다음 알림';

  @override
  String get reminderManageHint => '알림 관리';

  @override
  String get reminderOffCta => '알림 켜기';

  @override
  String get stateOn => '켜짐';

  @override
  String get stateOff => '꺼짐';

  @override
  String get reminderMasterTitle => '알림';

  @override
  String reminderActiveCount(int count) {
    return '알림 $count개 켜짐';
  }

  @override
  String get reminderBuiltIn => '기본 알림';

  @override
  String get reminderYourOwn => '내가 만든 알림';

  @override
  String get reminderAdd => '알림 추가';

  @override
  String get reminderDays => '요일';

  @override
  String get reminderEveryDay => '매일';

  @override
  String get reminderLabelHint => '무엇을 알려 드릴까요?';

  @override
  String get reminderEmptyHint => '운동, 비타민, 스트레칭 등 필요한 알림을 직접 추가해요.';

  @override
  String get reminderCustom => '알림';

  @override
  String get reminderCustomBody => '설정한 시간이 됐어요.';

  @override
  String get reminderExercise => '운동';

  @override
  String get reminderNutrition => '영양';

  @override
  String get reminderWater => '물';

  @override
  String get reminderPosture => '자세';

  @override
  String get reminderRoutine => '오늘의 루틴';

  @override
  String get reminderSleep => '수면';

  @override
  String get reminderMeasurement => '키 측정';

  @override
  String get notificationsOn => '알림 켜짐';

  @override
  String get notificationsOff => '알림 꺼짐';

  @override
  String get premium => '프리미엄으로 업그레이드';

  @override
  String get premiumSubtitle => '모든 기능 잠금 해제';

  @override
  String get rateUs => '평가하기';

  @override
  String get rateSubtitle => '앱이 마음에 드세요? 별 5개 부탁해요!';

  @override
  String get share => '앱 공유';

  @override
  String get shareSubtitle => '친구들에게 BeTaller를 알려 주세요';

  @override
  String get shareText =>
      'BeTaller로 내 성장 가능성을 알아봤어! 너도 해 봐: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => '의견 보내기';

  @override
  String get feedbackSubtitle => '문의하기';

  @override
  String get resetData => '모든 데이터 초기화';

  @override
  String get resetSubtitle => '모든 데이터가 삭제돼요';

  @override
  String get resetTitle => '데이터 초기화';

  @override
  String get resetMessage => '모든 데이터가 삭제되고 시작 화면으로 돌아가요. 되돌릴 수 없어요!';

  @override
  String get reset => '초기화';

  @override
  String get premiumSoon => '프리미엄 곧 출시!';

  @override
  String get brandingSubtitle => '내 성장 가능성을 알아보세요';

  @override
  String get statistics => '통계';

  @override
  String get profileGroupSupport => '지원';

  @override
  String get profileGroupAccount => '계정';

  @override
  String get profileGroupApp => '앱';

  @override
  String get profileGroupDanger => '위험 구역';

  @override
  String profileMemberSince(String date) {
    return '$date부터';
  }

  @override
  String get profileYourJourney => '나의 여정';

  @override
  String get profileTotalGrowth => '합계';

  @override
  String get currentStreak => '현재 연속 기록';

  @override
  String get bestStreakLabel => '최고 연속 기록';

  @override
  String get achievementLabel => '업적';

  @override
  String get achievements => '업적';

  @override
  String get achievementUnlockedTitle => '🏆 업적 달성!';

  @override
  String get reminderTapHint => '눌러서 시간과 요일을 바꿔요';

  @override
  String get earned => '획득!';

  @override
  String get notEarned => '아직 획득 전';

  @override
  String get ok => '확인';

  @override
  String get language => '언어';

  @override
  String get languageSubtitle => '앱 언어 변경';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => '내 성장 가능성을 알아보세요';

  @override
  String get onboardingMeetYou => '먼저 알아갈게요';

  @override
  String get onboardingInfoNeeded => '분석에 필요한 기본 정보예요.';

  @override
  String get gender => '성별';

  @override
  String get birthDateLabel => '생년월일';

  @override
  String get bodyMeasurements => '신체 치수';

  @override
  String get bodyInfo => '분석에 현재 키와 몸무게가 필요해요.';

  @override
  String get geneticData => '유전 정보';

  @override
  String get geneticInfo => '부모님 키로 유전적 가능성을 알아봐요.';

  @override
  String get pastHeights => '예전 키';

  @override
  String get pastHeightsInfo => '기억나는 나이별 키를 입력해요. 비워 둬도 괜찮아요.';

  @override
  String get heightHint => '키 입력...';

  @override
  String get ageLabel => '세';

  @override
  String get habits => '나의 습관';

  @override
  String get habitsInfo => '생활 습관이 예측에 직접 영향을 줘요.';

  @override
  String get weeklyExercise => '주간 운동';

  @override
  String get dailySleep => '하루 수면';

  @override
  String get nutritionQuality => '식사의 질';

  @override
  String get nutritionDesc => '단백질, 유제품, 채소, 과일 섭취';

  @override
  String get nutritionBad => '나쁨';

  @override
  String get nutritionPoor => '부족';

  @override
  String get nutritionMedium => '보통';

  @override
  String get nutritionGood => '좋음';

  @override
  String get nutritionGreat => '아주 좋음';

  @override
  String get startAnalysis => '분석 시작';

  @override
  String get continueBtn => '계속';

  @override
  String get analyzeBtn => '분석하기';

  @override
  String get analyzing => '분석 중';

  @override
  String get analysisComplete => '완료!';

  @override
  String get analysisDataReceivedTitle => '정보를 받았어요';

  @override
  String get analysisDataReceivedSubtitle => '분석을 시작할게요...';

  @override
  String get yourScore => '나의 BeTaller 점수';

  @override
  String get letsStart => '시작하기';

  @override
  String get splashJourneySubtitle => '여정이 시작돼요. 🚀';

  @override
  String get splashPlanSubtitle => '나만의 플랜이 준비됐어요.\n내 키 가능성을 알아볼까요?';

  @override
  String get doneBtn => '완료';

  @override
  String get analysisStep1 => '유전 정보 분석 중...';

  @override
  String get analysisStep2 => '성장 속도 계산 중...';

  @override
  String get analysisStep3 => '영양·수면 데이터 처리 중...';

  @override
  String get analysisStep4 => '키 예측 생성 중...';

  @override
  String get analysisStep5 => 'BeTaller 점수 계산 중...';

  @override
  String growthPotential(String cm, String unit) {
    return '+$cm $unit 성장 가능성';
  }

  @override
  String get heightAt21 => '21세 기준';

  @override
  String confidenceLevel(String pct) {
    return '신뢰도 $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return '$min - $max $unit 범위';
  }

  @override
  String get currentLabel => '현재';

  @override
  String get predictedLabel => '예측';

  @override
  String get yearlyPredictions => '연도별 예측';

  @override
  String get tipMorningMeasure =>
      '키는 아침에 재요. 낮에는 디스크가 눌려서 키가 조금 줄어들기 때문에 아침 측정이 가장 정확해요.';

  @override
  String get tipProteinSpread => '단백질은 끼니마다 나눠 먹어요. 한 번에 몰아 먹지 말고 매 끼니 챙겨요.';

  @override
  String get tipGrowthHormone =>
      '성장호르몬은 잘 때 가장 많이 나와요. 밤 10시~새벽 2시에는 꼭 자고 있어요!';

  @override
  String get tipVitaminD =>
      '매일 15분 햇볕을 쬐면 비타민 D가 더 만들어져요. 비타민 D는 칼슘 흡수에 꼭 필요해요.';

  @override
  String get tipBarHanging => '철봉 매달리기는 척추의 압박을 풀어 줘요. 매일 30초씩 3번 해 봐요.';

  @override
  String get tipSwimming => '수영은 전신 운동과 키 성장에 도움이 되는 최고의 운동이에요.';

  @override
  String get tipStress => '스트레스는 성장호르몬을 억제해요. 명상과 요가로 스트레스를 줄여요.';

  @override
  String get routineMorningStretch => '아침 스트레칭';

  @override
  String get routineMorningStretchDesc =>
      '일어나자마자 10분 스트레칭해요. 척추와 다리 근육을 늘려 줘요.';

  @override
  String get routineBarHanging => '철봉 매달리기';

  @override
  String get routineBarHangingDesc => '철봉에 매달려 척추를 늘려요. 30초 x 3세트.';

  @override
  String get routineCobraStretch => '코브라 스트레칭';

  @override
  String get routineCobraStretchDesc =>
      '엎드려서 상체를 들어 올려요. 척추를 늘려 줘요. 15초 x 3세트.';

  @override
  String get routineJumping => '점프 운동';

  @override
  String get routineJumpingDesc => '줄넘기나 스쿼트 점프. 성장판을 자극해요. 20회 x 3세트.';

  @override
  String get routineSwimming => '수영 또는 농구';

  @override
  String get routineSwimmingDesc => '키 성장에 도움이 되는 운동을 해요. 최소 30분.';

  @override
  String get routineYoga => '저녁 요가 & 스트레칭';

  @override
  String get routineYogaDesc => '자기 전 요가와 스트레칭. 스트레스를 풀고 근육을 이완해요.';

  @override
  String get routineProtein => '단백질 섭취';

  @override
  String get routineProteinDesc => '달걀, 닭고기, 생선, 유제품. 하루 최소 1.5g/kg 단백질.';

  @override
  String get routineCalcium => '칼슘 & 비타민 D';

  @override
  String get routineCalciumDesc => '우유, 치즈, 요거트를 먹어요. 햇볕 15분. 뼈 발달에 아주 중요해요.';

  @override
  String get routineWater => '물 섭취 목표';

  @override
  String get routineWaterDesc => '하루 최소 2-3리터 물을 마셔요. 신진대사와 성장에 꼭 필요해요.';

  @override
  String get routineAvoidJunk => '정크푸드 피하기';

  @override
  String get routineAvoidJunkDesc => '패스트푸드, 단 음료, 가공식품을 멀리해요.';

  @override
  String get routineSleep => '꿀잠 (8-10시간)';

  @override
  String get routineSleepDesc => '성장호르몬은 잘 때 나와요. 밤 10시~아침 6시가 골든타임이에요.';

  @override
  String get routineNoScreen => '자기 전 화면 끄기';

  @override
  String get routineNoScreenDesc =>
      '자기 1시간 전에 휴대폰과 컴퓨터를 내려놓아요. 멜라토닌 분비를 방해하지 마요.';

  @override
  String get routinePosture => '자세 체크';

  @override
  String get routinePostureDesc =>
      '등은 곧게, 어깨는 뒤로. 한 시간마다 체크해요. 바른 자세 = 2-3 cm 차이.';

  @override
  String get routineWallStand => '벽에 붙어 서기';

  @override
  String get routineWallStandDesc => '벽에 기대서 발뒤꿈치, 엉덩이, 어깨, 머리를 붙여요. 5분 유지.';

  @override
  String get routineSprintIntervals => '스프린트 인터벌';

  @override
  String get routineSprintIntervalsDesc => '짧고 강한 전력 질주가 성장호르몬 분비를 크게 늘려요.';

  @override
  String get routineHiitWorkout => 'HIIT 운동';

  @override
  String get routineHiitWorkoutDesc => '고강도 인터벌 트레이닝으로 성장호르몬 분비를 최대로 높여요.';

  @override
  String get routineSquats => '맨몸 스쿼트';

  @override
  String get routineSquatsDesc => '맨몸 스쿼트는 다리와 척추의 성장판을 자극해요.';

  @override
  String get routineDeadliftStretch => '데드리프트 스트레칭';

  @override
  String get routineDeadliftStretchDesc => '척추 압박을 풀고 디스크 건강을 지키는 스트레칭이에요.';

  @override
  String get routineOverheadPress => '오버헤드 프레스';

  @override
  String get routineOverheadPressDesc =>
      '머리 위로 밀어 올리는 동작이 척추를 늘리고 자세 근육을 강화해요.';

  @override
  String get routineSkippingRope => '줄넘기';

  @override
  String get routineSkippingRopeDesc => '반복적인 줄넘기 점프가 다리 쪽 성장판을 자극해요.';

  @override
  String get routinePilatesCore => '필라테스 코어';

  @override
  String get routinePilatesCoreDesc => '필라테스 코어 운동은 척추 정렬과 자세를 도와요.';

  @override
  String get routineInversionHang => '거꾸로 매달리기';

  @override
  String get routineInversionHangDesc =>
      '거꾸로 매달리면 척추 디스크 압박이 풀려 일시적으로 1-2cm 늘 수 있어요.';

  @override
  String get routineZincIntake => '아연이 많은 음식';

  @override
  String get routineZincIntakeDesc => '성장호르몬 생성을 위해 하루 동안 아연이 많은 음식을 먹어요.';

  @override
  String get routineVitaminDSunlight => '비타민 D & 햇볕';

  @override
  String get routineVitaminDSunlightDesc =>
      '비타민 D 합성과 뼈 성장을 위해 최소 15분 직접 햇볕을 쬐어요.';

  @override
  String get routineArginineFoods => '아르기닌이 많은 음식';

  @override
  String get routineArginineFoodsDesc => '아르기닌이 많은 음식으로 성장호르몬 분비를 자극해요.';

  @override
  String get routineDailyCalories => '하루 칼로리 목표';

  @override
  String get routineDailyCaloriesDesc => '하루 칼로리 목표를 채워요. 너무 적게 먹으면 성장이 느려져요.';

  @override
  String get routineSleepEnvironment => '수면 환경 만들기';

  @override
  String get routineSleepEnvironmentDesc =>
      '어둡고 시원한 방을 만들어 멜라토닌과 성장호르몬 분비를 높여요.';

  @override
  String get routinePreSleepRoutine => '자기 전 긴장 풀기';

  @override
  String get routinePreSleepRoutineDesc => '자기 전 루틴을 꾸준히 하면 깊은 잠의 질이 23% 좋아져요.';

  @override
  String get routineNeckStretches => '목 스트레칭';

  @override
  String get routineNeckStretchesDesc => '목 스트레칭은 압박을 풀고 목뼈 정렬을 개선해요.';

  @override
  String get routineShoulderRolls => '어깨 돌리기 & 열기';

  @override
  String get routineShoulderRollsDesc =>
      '어깨를 열면 굽은 자세가 펴져서 겉보기 키가 1-2cm 커질 수 있어요.';

  @override
  String get achieveCommitment => '다짐';

  @override
  String get achieveCommitmentDesc => '정보를 모두 입력하고 앱을 둘러본 뒤 사용을 시작해요';

  @override
  String get achieveFirstDay => '첫걸음';

  @override
  String get achieveFirstDayDesc => '첫날을 완료해요';

  @override
  String get achieveThreeStreak => '3일 연속';

  @override
  String get achieveThreeStreakDesc => '3일 연속 루틴 완료';

  @override
  String get achieveWeekStreak => '7일 연속';

  @override
  String get achieveWeekStreakDesc => '7일 연속 루틴 완료';

  @override
  String get achieveTwoWeekStreak => '14일 연속';

  @override
  String get achieveTwoWeekStreakDesc => '14일 연속으로 이어가요';

  @override
  String get achieveMonthStreak => '30일 연속';

  @override
  String get achieveMonthStreakDesc => '30일 연속 완료';

  @override
  String get achieveTwoMonthStreak => '60일 연속';

  @override
  String get achieveTwoMonthStreakDesc => '60일 연속 완료';

  @override
  String get achieveHundredStreak => '100일 연속';

  @override
  String get achieveHundredStreakDesc => '100일 연속 완료';

  @override
  String get achieveFirstMeasure => '첫 측정';

  @override
  String get achieveFirstMeasureDesc => '첫 키 측정을 기록해요';

  @override
  String get achieveThreeMeasures => '기록러';

  @override
  String get achieveThreeMeasuresDesc => '키 측정 3번 기록';

  @override
  String get achieveFiveMeasures => '꾸준한 기록';

  @override
  String get achieveFiveMeasuresDesc => '키 측정 5번 기록';

  @override
  String get achieveTenMeasures => '데이터 헌터';

  @override
  String get achieveTenMeasuresDesc => '키 측정 10번 기록';

  @override
  String get achieveFirstCm => '첫 1센티';

  @override
  String get achieveFirstCmDesc => '총 1 cm 성장 기록';

  @override
  String get achieveThreeCm => '3 cm 성장';

  @override
  String get achieveThreeCmDesc => '총 3 cm 성장 기록';

  @override
  String get achieveFiveCm => '5 cm 성장';

  @override
  String get achieveFiveCmDesc => '총 5 cm 성장 기록';

  @override
  String get achieveTenCm => '10 cm 성장';

  @override
  String get achieveTenCmDesc => '총 10 cm 성장 기록';

  @override
  String get quote1 => '매일 어제보다 조금 더 나아지기.';

  @override
  String get quote2 => '성장은 하룻밤에 되지 않지만, 매일 밤 한 걸음씩 가까워져요.';

  @override
  String get quote3 => '성장에는 인내가 필요해요. 계속 가요!';

  @override
  String get quote4 => '오늘 내딛는 한 걸음이 내일의 바탕이 돼요.';

  @override
  String get quote5 => '꾸준함은 의욕이 끝나는 곳에서 시작돼요.';

  @override
  String get quote6 => '몸이 고마워할 거예요. 계속 가요!';

  @override
  String get quote7 => '내 가능성의 한계는 내가 정해요.';

  @override
  String get quote8 => '작은 걸음이 큰 변화를 만들어요.';

  @override
  String get quote9 => '최고의 투자는 나 자신에게 하는 투자예요.';

  @override
  String get quote10 => '매일 목표에 조금씩 가까워지고 있어요.';

  @override
  String get quote11 => '변화는 힘들지만, 후회는 더 힘들어요.';

  @override
  String get quote12 => '내 몸은 소중해요. 잘 돌봐 줘요.';

  @override
  String get quote13 => '라이벌은 어제의 나. 오늘 이겨 봐요!';

  @override
  String get quote14 => 'BeTaller = 인내 + 꾸준함 + 믿음';

  @override
  String get quote15 => '나를 믿어요. 과정이 나를 만들어 줄 거예요.';

  @override
  String get quote16 => '오늘 못 한다고 하지 마요. 내일 후회하지 않게.';

  @override
  String get quote17 => '단 1%라도 매일 성장해요.';

  @override
  String get quote18 => '거울이 변화를 보여 줄 거예요. 조금만 기다려요.';

  @override
  String get bmiNormal => '정상';

  @override
  String get bmiUnderweight => '저체중';

  @override
  String get bmiOverweight => '과체중';

  @override
  String get bmiObese => '비만';

  @override
  String get velocityExcellent => '아주 좋음';

  @override
  String get velocityNormal => '보통';

  @override
  String get velocitySlow => '느림';

  @override
  String get velocityVeryLow => '매우 낮음';

  @override
  String durationMinutes(String min) {
    return '$min분';
  }

  @override
  String get durationAllDay => '하루 종일';

  @override
  String get durationNight => '밤';

  @override
  String durationHours(String hours) {
    return '$hours시간';
  }

  @override
  String get onboardingStep1 => '기본 정보 입력';

  @override
  String get onboardingStep2 => '예전 키 알려 주기';

  @override
  String get onboardingStep3 => '습관 체크하기';

  @override
  String get onboardingStep4 => '예측과 점수 확인';

  @override
  String get hoursShort => '시간';

  @override
  String get selectLanguage => '언어 선택';

  @override
  String get systemLanguage => '시스템 언어';

  @override
  String get emailSubject => 'BeTaller 의견';

  @override
  String get pastHeightsTip => '모르는 나이는 비워 둬도 돼요. 예전 키 1-2개만 입력해도 충분해요.';

  @override
  String get obPastHeightsTitle => '예전 키';

  @override
  String get obPastHeightsSubPart1 => '예전 키를 알려 주면 예측이 더 정확해져요.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return '$age살 때 키가 몇이었어요?';
  }

  @override
  String get obSkip => '건너뛰기';

  @override
  String get obNext => '다음';

  @override
  String get obSkipAll => '모두 건너뛰기';

  @override
  String get currentSuffix => '(현재)';

  @override
  String personalizedProtein(String amount) {
    return '달걀, 닭고기, 생선, 유제품. 하루 최소 ${amount}g 단백질을 먹어요.';
  }

  @override
  String personalizedWater(String amount) {
    return '하루 최소 ${amount}L 물을 마셔요. 신진대사와 성장에 꼭 필요해요.';
  }

  @override
  String personalizedSleep(String hours) {
    return '성장호르몬은 잘 때 나와요. 최소 $hours시간 자요. 밤 10시~아침 6시가 골든타임이에요.';
  }

  @override
  String personalizedCalcium(String calories) {
    return '우유, 치즈, 요거트를 먹어요. 햇볕 15분. 하루 칼로리 목표: $calories kcal.';
  }

  @override
  String get scoreS => '최고예요! 내 가능성의 정점에 다가가고 있어요.';

  @override
  String get scoreA => '아주 잘하고 있어요! 조금만 더 개선하면 최고에 닿을 수 있어요.';

  @override
  String get scoreB => '잘 가고 있어요. 루틴과 영양에 조금 더 신경 써요.';

  @override
  String get scoreC => '더 좋아질 수 있어요. 꾸준한 루틴이 차이를 만들어요.';

  @override
  String get scoreD => '가능성은 높지만 이제 행동할 때예요.';

  @override
  String get scoreF => '지금 시작해요! 매일 작은 한 걸음이 큰 차이를 만들어요.';

  @override
  String get cmPerYear => 'cm/년';

  @override
  String get howToDoIt => '하는 방법';

  @override
  String get musclesTargeted => '자극하는 근육과 뼈';

  @override
  String get scientificBasis => '과학적 근거';

  @override
  String setXofY(String current, String total) {
    return '$total세트 중 $current세트';
  }

  @override
  String restBeforeSet(String set) {
    return '$set세트 전 휴식';
  }

  @override
  String get allSetsComplete => '모든 세트 완료!';

  @override
  String get setTimer => '세트 타이머';

  @override
  String get setTracker => '세트 기록';

  @override
  String get builtInTimer => '내장 타이머';

  @override
  String get markComplete => '완료로 표시';

  @override
  String get markIncomplete => '미완료로 표시';

  @override
  String get done => '완료';

  @override
  String get doneExclamation => '완료!';

  @override
  String get start => '시작';

  @override
  String get pause => '일시정지';

  @override
  String get resetTimer => '초기화';

  @override
  String get skipRest => '휴식 건너뛰기';

  @override
  String get restart => '다시 시작';

  @override
  String get perSet => '세트당';

  @override
  String get rest => '휴식';

  @override
  String get reps => '회';

  @override
  String get difficultyBeginner => '초급';

  @override
  String get difficultyIntermediate => '중급';

  @override
  String get difficultyAdvanced => '고급';

  @override
  String get learnTitle => '알아보기';

  @override
  String get learnSubtitle => '과학으로 알아보는 성장 지식';

  @override
  String get categoryAll => '전체';

  @override
  String get categoryScience => '과학';

  @override
  String get categoryNutrition => '영양';

  @override
  String get categoryExercise => '운동';

  @override
  String get categorySleep => '수면';

  @override
  String get categoryMyths => '오해와 진실';

  @override
  String get scientificReferences => '참고 문헌';

  @override
  String get relatedRoutines => '관련 루틴';

  @override
  String get nutritionTitle => '영양';

  @override
  String get sectionMealPlan => '식단';

  @override
  String get sectionNutrients => '영양소';

  @override
  String get sectionFoods => '음식';

  @override
  String get sectionSupplements => '영양제';

  @override
  String todaysPlan(String day) {
    return '오늘의 식단 — $day';
  }

  @override
  String get breakfast => '아침';

  @override
  String get lunch => '점심';

  @override
  String get dinner => '저녁';

  @override
  String get snacks => '간식';

  @override
  String get searchFoods => '음식 검색...';

  @override
  String nFoods(String count) {
    return '음식 $count개';
  }

  @override
  String dailyLabel(String amount) {
    return '하루: $amount';
  }

  @override
  String get dailyNeedByAge => '나이별 하루 권장량';

  @override
  String agePrefix(String range) {
    return '$range세';
  }

  @override
  String get topFoodSources => '대표 음식';

  @override
  String get categoryDairy => '유제품';

  @override
  String get categoryMeatFish => '고기 & 생선';

  @override
  String get categoryVegetables => '채소';

  @override
  String get categoryFruits => '과일';

  @override
  String get categoryGrains => '곡물 & 콩류';

  @override
  String get categoryNutsSeeds => '견과류 & 씨앗';

  @override
  String get weeklyReportTitle => '주간 리포트';

  @override
  String get weeklyScoreLabel => '이번 주 점수';

  @override
  String get weeklyDailyCompletion => '하루별 기록';

  @override
  String get weeklyHabits => '습관';

  @override
  String get overview => '한눈에 보기';

  @override
  String get routinesLabel => '루틴';

  @override
  String get streakLabel => '연속';

  @override
  String get heightLabel => '키';

  @override
  String get weightLabel => '몸무게';

  @override
  String get dadLabel => '아빠';

  @override
  String get motherLabel => '엄마';

  @override
  String get metricShort => '미터법';

  @override
  String get imperialShort => '야드파운드법';

  @override
  String get dailyScores => '하루 점수';

  @override
  String get waterToday2 => '오늘 마신 물';

  @override
  String get sleepToday => '오늘 수면';

  @override
  String get routineCompletion => '루틴 달성률';

  @override
  String get xpAndLevel => 'XP & 레벨';

  @override
  String xpToNextLevel(String xp) {
    return '다음 레벨까지 $xp XP';
  }

  @override
  String get activeChallenges => '진행 중인 챌린지';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m 완료';
  }

  @override
  String get shareYourProgress => '진행 상황 공유';

  @override
  String get shareComingSoon => '공유 기능 곧 출시!';

  @override
  String get premiumTest => '프리미엄 (테스트)';

  @override
  String get premiumActive => '사용 중';

  @override
  String get premiumFree => '무료';

  @override
  String get weeklyReportMenu => '주간 리포트';

  @override
  String get weeklyReportMenuSubtitle => '나의 진행 요약';

  @override
  String get unlockGrowthPotential => '성장 가능성을 모두 열어 봐요';

  @override
  String get featureGrowthAnalysis => '성장 분석 & 점수';

  @override
  String get featureHeightPrediction => '키 예측 & 전망';

  @override
  String get featureAllRoutines => '14가지 데일리 루틴 전체';

  @override
  String get featureWaterSleep => '물 & 수면 기록';

  @override
  String get featureProgress => '진행 상황 & 측정';

  @override
  String get featureAchievements => '업적 & 연속 기록';

  @override
  String get planMonthly => '월간';

  @override
  String get planYearly => '연간';

  @override
  String get bestValue => '가장 알뜰해요';

  @override
  String get premiumLabel => '프리미엄';

  @override
  String lvl(String level) {
    return 'LV $level';
  }

  @override
  String get levelBeginner => '입문자';

  @override
  String get levelStarter => '스타터';

  @override
  String get levelCommitted => '다짐한';

  @override
  String get levelDedicated => '열정적인';

  @override
  String get levelConsistent => '꾸준한';

  @override
  String get levelFocused => '집중하는';

  @override
  String get levelDetermined => '단호한';

  @override
  String get levelDisciplined => '절제하는';

  @override
  String get levelStrong => '강한';

  @override
  String get levelAdvanced => '숙련자';

  @override
  String get levelExpert => '전문가';

  @override
  String get levelMaster => '마스터';

  @override
  String get levelElite => '엘리트';

  @override
  String get levelChampion => '챔피언';

  @override
  String get levelLegend => '레전드';

  @override
  String get levelTitan => '타이탄';

  @override
  String get levelMythic => '신화';

  @override
  String get levelImmortal => '불멸';

  @override
  String get levelTranscendent => '초월';

  @override
  String get levelUltimate => '얼티밋';

  @override
  String get challengeCompleteAllRoutines => '루틴 모두 완료';

  @override
  String get challengeCompleteAllRoutinesDesc => '오늘 루틴을 전부 끝내요';

  @override
  String get challengeHydrationHero => '수분 히어로';

  @override
  String get challengeHydrationHeroDesc => '오늘 물 목표 달성';

  @override
  String get challengeEarlySleeper => '일찍 자는 사람';

  @override
  String get challengeEarlySleeperDesc => '8시간 이상 수면 기록';

  @override
  String get challengeExerciseTrio => '운동 3종 세트';

  @override
  String get challengeExerciseTrioDesc => '운동 루틴 3개 완료';

  @override
  String get challengeMorningStretch => '아침 스트레칭';

  @override
  String get challengeMorningStretchDesc => '오전 9시 전에 아침 스트레칭하기';

  @override
  String get challenge7DayWarrior => '7일 전사';

  @override
  String get challenge7DayWarriorDesc => '7일 연속 모든 루틴 완료';

  @override
  String get challengeGrowthTracker => '성장 기록러';

  @override
  String get challengeGrowthTrackerDesc => '이번 주에 키 측정 기록하기';

  @override
  String get challengeHydrationWeek => '수분 충전 주간';

  @override
  String get challengeHydrationWeekDesc => '이번 주 5일 물 목표 달성';

  @override
  String get challengeFitnessChampion => '피트니스 챔피언';

  @override
  String get challengeFitnessChampionDesc => '이번 주 운동 루틴 15개 완료';

  @override
  String get challengeSleepMaster => '수면 마스터';

  @override
  String get challengeSleepMasterDesc => '5일 동안 8시간 이상 수면 기록';

  @override
  String get performanceDashboard => '퍼포먼스 대시보드';

  @override
  String get tierA => 'A 티어';

  @override
  String get tierB => 'B 티어';

  @override
  String get tierC => 'C 티어';

  @override
  String get tierD => 'D 티어';

  @override
  String get tierE => 'E 티어';

  @override
  String get maxTierReached => '최고 티어 달성';

  @override
  String nextTierHint(String tier, String pts) {
    return '다음 티어: $tier · +$pts점 필요';
  }

  @override
  String get premiumBadge => '프리미엄';

  @override
  String get manageRoutines => '루틴 관리';

  @override
  String get manageRoutinesSubtitle => '하루 목록에 보일 루틴을 골라요';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$total개 중 $visible개 사용 중';
  }

  @override
  String get showAll => '모두 보기';

  @override
  String get hideAll => '모두 숨기기';

  @override
  String get heightAnalysis => '키 분석';

  @override
  String get heightVsPopulation => 'CDC 성장 곡선에서 나의 위치';

  @override
  String get globalAveragesTable => '나이별 평균 키 (CDC)';

  @override
  String get standingTall => '큰 편';

  @override
  String get standingAboveAverage => '평균 이상';

  @override
  String get standingBelowAverage => '평균 이하';

  @override
  String get standingShort => '또래보다 작은 편';

  @override
  String get yourHeightStanding => '내 키 위치';

  @override
  String get bellCurveCaption => '내 나이의 키 분포';

  @override
  String get bellShorterThanYou => '나보다 작은 비율';

  @override
  String get yourHeight => '나';

  @override
  String peerAvg(int age) {
    return '$age세 평균';
  }

  @override
  String get aboveAvg => '평균 이상';

  @override
  String get belowAvg => '평균 이하';

  @override
  String get whoDataSource => '미국 CDC 성장 곡선';

  @override
  String get percentileShort5 => '5%';

  @override
  String get percentileShort50 => '50%';

  @override
  String get percentileShort95 => '95%';

  @override
  String get youLabel => '나';

  @override
  String get avgHeightLabel => '평균';

  @override
  String get percentileLabel => '백분위';

  @override
  String get diffLabel => '차이';

  @override
  String get whoSourceNote =>
      '데이터 출처: 미국 CDC 2000 성장 곡선(나이별 키, 2~20세). 백분위는 미국 인구와 비교한 값이라 나라마다 다를 수 있어요.';

  @override
  String get quickPhotos => '사진';

  @override
  String get quickPosture => '자세';

  @override
  String get quickWellness => '웰니스';

  @override
  String get quickRecipes => '레시피';

  @override
  String get wellnessTitle => '웰니스 기록';

  @override
  String get wellnessHeader => '웰니스';

  @override
  String get wellnessSubtitle => '성장에 영향을 주는 요소를 기록해요';

  @override
  String get caffeineToday => '오늘 카페인';

  @override
  String get withinLimits => '건강한 범위 안이에요';

  @override
  String get approachingLimit => '한도에 가까워요';

  @override
  String get overLimit => '한도 초과, HGH에 영향을 줘요';

  @override
  String get resetToday => '오늘 기록 초기화';

  @override
  String get stressToday => '오늘 스트레스';

  @override
  String get stressVeryCalmLabel => '아주 편안해요, 성장에 최적';

  @override
  String get stressCalmLabel => '편안해요';

  @override
  String get stressNeutralLabel => '보통';

  @override
  String get stressStressedLabel => '스트레스 받아요';

  @override
  String get stressVeryStressedLabel => '스트레스 많아요, 코르티솔이 HGH를 막아요';

  @override
  String get stressTapToLog => '눌러서 오늘 기분을 기록해요';

  @override
  String get todaysJournal => '오늘의 일기';

  @override
  String get journalNoNote => '(메모 없음)';

  @override
  String get journalEdit => '수정';

  @override
  String get journalHowWasToday => '오늘 어땠어요?';

  @override
  String get journalSaved => '일기 저장 완료 · +5 XP';

  @override
  String get journalSaveEntry => '저장하기';

  @override
  String get weeklyInsight => '주간 인사이트';

  @override
  String get weeklyInsightCaffeine => '카페인';

  @override
  String get weeklyInsightStress => '스트레스';

  @override
  String get weeklyInsightMood => '기분';

  @override
  String get wellnessInfoTitle => '웰니스가 중요한 이유';

  @override
  String get wellnessInfoBody =>
      '카페인은 깊은 잠을 방해하는데, 성장호르몬(HGH)은 대부분 깊은 잠 동안 나와요. 만성 스트레스는 코르티솔을 높여 HGH를 직접 억제해요. 일기를 쓰면 성장에 도움이 되는 습관을 꾸준히 지키기 쉬워져요.';

  @override
  String get wellnessInfoGotIt => '알겠어요';

  @override
  String get insightCaffeineHigh => '이번 주 카페인이 많아요. 더 좋은 잠과 HGH를 위해 조금 줄여 봐요.';

  @override
  String get insightStressHigh => '이번 주 스트레스가 높아요. 호흡 운동을 해 봐요. 코르티솔은 성장을 막아요.';

  @override
  String get insightMoodLow => '요즘 기분이 가라앉아 있어요. 햇볕, 잠, 가벼운 운동이 모두 도움이 돼요.';

  @override
  String get insightGreat => '이번 주 균형이 아주 좋아요. 웰니스가 최적의 성장을 받쳐 주고 있어요.';

  @override
  String get insightDefault => '웰니스가 잘 유지되고 있어요. 계속 기록하면 더 깊은 인사이트를 볼 수 있어요.';

  @override
  String get insightNeedMoreData => '며칠 더 기록하면 인사이트를 볼 수 있어요.';

  @override
  String get progressPhotosTitle => '변화 사진';

  @override
  String get progressPhotosHeader => '변화 사진';

  @override
  String get progressPhotosSubtitle => '눈으로 보는 나의 여정';

  @override
  String get addProgressPhoto => '변화 사진 추가';

  @override
  String get captureJourney => '나의 변화를 사진으로 남겨요';

  @override
  String get takePhoto => '사진 찍기';

  @override
  String get chooseFromLibrary => '앨범에서 선택';

  @override
  String get deletePhotoTitle => '사진을 삭제할까요?';

  @override
  String get deletePhotoBody => '이 사진이 변화 타임라인에서 삭제돼요.';

  @override
  String get timelineTab => '타임라인';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '사진',
      one: '사진',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$days일 동안 $cm $unit';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '일',
      one: '일',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit 성장';
  }

  @override
  String get firstPhotoMessage => '첫 사진을 찍고 눈에 보이는 변화를 기록해 봐요.';

  @override
  String get takeFirstPhoto => '첫 사진 찍기';

  @override
  String get beforeAfter => '전 / 후';

  @override
  String get beforeLabel => '전';

  @override
  String get afterLabel => '후';

  @override
  String get yourHeightDialog => '내 키';

  @override
  String get heightDialogMessage => '이 사진을 찍을 때의 키를 입력해요';

  @override
  String get postureAnalysisTitle => '자세 분석';

  @override
  String get postureCoachHeader => '자세 코치';

  @override
  String get postureCoachSubtitle => '옆모습 사진으로 셀프 체크';

  @override
  String get latestScore => '최근 점수';

  @override
  String get latestAnalysis => '최근 분석';

  @override
  String get headPosition => '머리 위치';

  @override
  String get progressLabel => '진행 상황';

  @override
  String get choosePhotoSource => '사진 가져오기';

  @override
  String get sideProfileHint => '옆모습, 전신이 화면에 나오게';

  @override
  String get howToTakePhoto => '사진 찍는 방법';

  @override
  String get takePosturePhoto => '자세 사진 찍기';

  @override
  String get postureExcellent => '아주 좋음';

  @override
  String get postureGood => '좋음';

  @override
  String get postureNeedsWork => '개선 필요';

  @override
  String get posturePoor => '나쁨';

  @override
  String get recommendedExercises => '추천 운동';

  @override
  String get postureWallStand => '벽에 붙어 서기';

  @override
  String get postureWallStandDesc => '매일 2분 동안 등을 벽에 붙이고 서요.';

  @override
  String get postureChestOpener => '가슴 열기';

  @override
  String get postureChestOpenerDesc => '어깨를 앞으로 당기는 뭉친 가슴 근육을 풀어 줘요.';

  @override
  String get postureChinTucks => '턱 당기기';

  @override
  String get postureChinTucksDesc => '거북목을 바로잡아요 — 10회 x 3세트.';

  @override
  String get postureDeadbug => '데드버그';

  @override
  String get postureDeadbugDesc => '깊은 코어를 강화해 허리 과전만을 잡아 줘요.';

  @override
  String get recipesTitle => '레시피';

  @override
  String get recipesHeader => '레시피';

  @override
  String get recipesSubtitle => '성장을 위한 한 끼';

  @override
  String get recipesCategoryAll => '전체';

  @override
  String get recipesCategoryBreakfast => '아침';

  @override
  String get recipesCategoryLunch => '점심';

  @override
  String get recipesCategoryDinner => '저녁';

  @override
  String get recipesCategorySnack => '간식';

  @override
  String get recipesGoalAll => '전체';

  @override
  String get recipeDiffEasy => '쉬움';

  @override
  String get recipeDiffMedium => '보통';

  @override
  String get recipeDiffHard => '어려움';

  @override
  String get recipesFilterType => '종류';

  @override
  String get recipesFilterNutrient => '풍부한 영양소';

  @override
  String get recipesGoalVitaminD => '비타민 D';

  @override
  String get recipesGoalZinc => '아연';

  @override
  String get recipesGoalMagnesium => '마그네슘';

  @override
  String recipesCountLabel(int count) {
    return '레시피 $count개';
  }

  @override
  String get recipeIngredients => '재료';

  @override
  String get recipeSteps => '만드는 법';

  @override
  String get recipesGoalProtein => '고단백';

  @override
  String get recipesGoalCalcium => '칼슘';

  @override
  String get recipesGoalOmega3 => '오메가-3';

  @override
  String get recipesGoalIron => '철분';

  @override
  String get recipesNoMatch => '조건에 맞는 레시피가 없어요';

  @override
  String get recipesIngredients => '재료';

  @override
  String get recipesInstructions => '만드는 법';

  @override
  String get recipesClose => '닫기';

  @override
  String get recipesAboutTitle => '레시피 안내';

  @override
  String get recipesAboutBody =>
      '성장에 도움이 되도록 고른 레시피예요. 식사 종류나 영양 목표로 걸러서 내 플랜에 딱 맞는 걸 찾아요.';

  @override
  String get animHintSpinalDecomp => '척추 압박 풀기';

  @override
  String get animHintGravityReversal => '중력 거꾸로';

  @override
  String get animHintImpactBones => '뼈에 충격 자극';

  @override
  String get animHintHighImpact => '강한 뼈 자극';

  @override
  String get animHintMetabolicBurst => '대사 폭발 트레이닝';

  @override
  String get animHintFullBodyStretch => '전신 깨우기 스트레칭';

  @override
  String get animHintSpinalExtension => '척추 펴기';

  @override
  String get animHintCervicalDecomp => '목뼈 압박 풀기';

  @override
  String get animHintShoulderMobility => '어깨 가동성';

  @override
  String get animHintFullBodyMotion => '전신 움직임';

  @override
  String get animHintPosteriorChain => '몸 뒤쪽 스트레칭';

  @override
  String get animHintMuscleGrowth => '근육 성장 연료';

  @override
  String get animHintBoneDensity => '뼈 밀도 지원';

  @override
  String get animHintSpinalDisc => '척추 디스크 수분';

  @override
  String get animHintCleanNutrition => '깨끗한 식단';

  @override
  String get animHintIgf1 => 'IGF-1 최적화';

  @override
  String get animHintHghAmino => 'HGH 아미노산 원료';

  @override
  String get animHintCalciumAbsorption => '칼슘 흡수';

  @override
  String get animHintSpinalAlignment => '척추 정렬';

  @override
  String get animHintPostureCorrection => '자세 교정';

  @override
  String get animHintMindBody => '몸과 마음의 균형';

  @override
  String get animHintCoreStability => '코어 안정성';

  @override
  String get animHintLegPower => '하체 파워 & HGH 상승';

  @override
  String get animHintVerticalPower => '점프력';

  @override
  String get animHintHghSurge => 'HGH 상승 트레이닝';

  @override
  String get animHintPeakHgh => 'HGH 최대 분비 시간';

  @override
  String get animHintMelatonin => '멜라토닌 최적화';

  @override
  String get animHintDeepSleep => '깊은 잠 준비';

  @override
  String get animHintSleepOpt => '수면 최적화';

  @override
  String get animHintExercise => '운동';

  @override
  String get formMorningStretch =>
      '목 돌리기로 시작해서 전신 스트레칭으로 넘어가요. 반동 없이 동작마다 20-30초 유지해요.';

  @override
  String get formBarHanging =>
      '철봉을 어깨너비로 잡고 몸에 힘을 완전히 빼요. 중력이 척추를 늘리게 두고, 몸을 흔들지 마요.';

  @override
  String get formCobraStretch =>
      '엎드려서 손을 어깨 아래에 두고, 골반은 바닥에 붙인 채 상체를 천천히 밀어 올려요. 시선은 위로.';

  @override
  String get formJumping => '스쿼트 점프나 줄넘기를 해요. 발 앞쪽으로 부드럽게 착지해요. 세트 사이 30초 휴식.';

  @override
  String get formSwimmingBasketball =>
      '수영(자유형/배영)이나 농구를 골라요. 점프, 뻗기, 큰 동작 범위에 집중해요.';

  @override
  String get formEveningYoga =>
      '고양이-소, 아기 자세, 다운독, 전굴 같은 부드러운 자세를 해요. 깊게 숨 쉬며 자세마다 30-60초 유지해요.';

  @override
  String get formSprintIntervals =>
      '5분 워밍업 후 30초 전력 질주해요. 90초 걷거나 가볍게 뛰며 회복하고 반복해요.';

  @override
  String get formHiitWorkout =>
      '버피, 마운틴 클라이머, 점프 스쿼트 같은 운동을 45초 최대 강도로 하고 15초 쉬어요.';

  @override
  String get formSquats =>
      '발을 어깨너비로 벌리고 서요. 허벅지가 바닥과 평행할 때까지 내려가요. 등은 곧게, 무릎은 발끝보다 뒤로.';

  @override
  String get formDeadliftStretch =>
      '발을 골반 너비로 벌리고 등을 편 채 엉덩이를 접어요. 발끝 쪽으로 손을 뻗어 허벅지 뒤와 등이 늘어나는 걸 느껴요.';

  @override
  String get formOverheadPress =>
      '바르게 서서 팔을 머리 위로 끝까지 뻗어요. 가벼운 무게나 맨몸으로 해요. 코어에 힘을 주고 허리가 꺾이지 않게 해요.';

  @override
  String get formSkippingRope =>
      '두 발로 뛰고 발 앞쪽으로 부드럽게 착지해요. 낮고 일정하게 뛰어요. 세트 사이에 쉬어요.';

  @override
  String get formPilatesCore =>
      '플랭크, 데드버그, 버드독, 브릿지, 다리 들기를 해요. 움직임을 조절하고 호흡에 집중해요.';

  @override
  String get formInversionHang =>
      '거꾸리 기구나 중력 부츠를 써요. 살짝 기울인 각도로 시작해서 조금씩 늘려요. 시간은 짧게 해요.';

  @override
  String get formProtein => '단백질을 3-4끼에 나눠 먹어요. 달걀, 닭고기, 생선, 유제품, 콩류를 챙겨요.';

  @override
  String get formCalciumVitaminD =>
      '유제품을 하루 3번 먹고, 자연스러운 비타민 D 합성을 위해 햇볕을 15분 쬐어요.';

  @override
  String get formWater => '하루 종일 꾸준히 물을 마셔요. 물병을 들고 다니고 한 시간마다 알림을 맞춰요.';

  @override
  String get formAvoidJunk =>
      '패스트푸드 대신 자연식품을 먹어요. 단 음료는 물로 바꿔요. 성분표를 보고 가공 원료를 피해요.';

  @override
  String get formZincIntake =>
      '붉은 고기, 호박씨, 병아리콩, 캐슈너트, 굴을 식단에 넣어요. 하루 8-11mg이 목표예요.';

  @override
  String get formVitaminDSunlight =>
      '가능하면 오전에 팔과 얼굴에 15분 직접 햇볕을 쬐어요. 이 정도 시간이면 선크림은 안 발라도 돼요.';

  @override
  String get formArginineFoods =>
      '견과류, 씨앗, 칠면조, 닭고기, 콩, 유제품을 식사에 넣어요. 자기 전에 먹으면 가장 좋아요.';

  @override
  String get formDailyCalories =>
      '칼로리를 3-5끼에 나눠 먹고 아침은 거르지 마요. 빈 칼로리보다 자연식품을 먼저 챙겨요.';

  @override
  String get formQualitySleep =>
      '밤 10시까지 잠자리에 들어요. 방은 어둡고 시원하게. 오후 2시 이후엔 카페인을 피해요.';

  @override
  String get formNoScreen =>
      '잠들기 1시간 전에 알람을 맞춰요. 화면은 모두 치우고 책을 읽거나 가볍게 스트레칭해요.';

  @override
  String get formSleepEnvironment =>
      '암막 커튼을 쓰고 방 온도는 18-20°C로 맞춰요. 빛이 나오는 건 모두 치우고 편한 매트리스와 베개를 써요.';

  @override
  String get formPreSleepRoutine =>
      '자기 30분 전부터 시작해요. 조명을 낮추고, 책을 읽고, 호흡 운동을 하고, 자극적인 활동은 피해요.';

  @override
  String get formPostureCheck =>
      '어깨를 뒤로 내리고 바르게 서요. 코어에 살짝 힘을 줘요. 정수리를 실로 위로 당긴다고 상상해요.';

  @override
  String get formWallStand =>
      '발뒤꿈치, 엉덩이, 날개뼈, 머리를 벽에 붙이고 서요. 5분 유지해요. 숨은 평소처럼 쉬어요.';

  @override
  String get formNeckStretches =>
      '고개를 천천히 양옆, 앞, 뒤로 기울여요. 방향마다 30초 유지해요. 억지로 당기지 마요.';

  @override
  String get formShoulderRolls =>
      '어깨를 앞으로 15번, 뒤로 15번 돌려요. 이어서 가슴 여는 스트레칭을 20초 유지해요.';

  @override
  String get sciMorningStretch =>
      '아침 스트레칭은 밤새 수분을 머금은 척추 디스크의 압박을 풀어 줘서 키를 최대한 유지하게 도와요';

  @override
  String get sciBarHanging =>
      '매달리기는 중력으로 척추를 늘려 디스크 압박을 풀어 주고, 일시적으로 키가 늘 수 있어요';

  @override
  String get sciCobraStretch => '코브라 스트레칭은 척추를 펴고 가슴을 열어 오래 앉아 생긴 척추 압박을 풀어 줘요';

  @override
  String get sciJumping => '강한 점프는 다리 성장판을 자극하고 성장호르몬 분비를 촉진해요';

  @override
  String get sciSwimmingBasketball =>
      '수영과 농구는 전신을 늘리고 점프하고 뻗는 동작이 많아 성장판 활동을 자극해요';

  @override
  String get sciEveningYoga =>
      '저녁 요가는 성장호르몬을 억제하는 코르티솔을 낮추고, 근육을 늘려 밤사이 회복을 도와요';

  @override
  String get sciSprintIntervals => '전력 질주는 성장호르몬 분비를 크게 늘려요';

  @override
  String get sciHiitWorkout => '고강도 운동은 HGH를 최대 450%까지 높여요';

  @override
  String get sciSquats => '스쿼트는 다리와 척추의 성장판을 자극해요';

  @override
  String get sciDeadliftStretch => '척추 압박을 풀면 디스크 건강에 좋아요';

  @override
  String get sciOverheadPress => '오버헤드 프레스는 척추를 늘리고 자세 근육을 강화해요';

  @override
  String get sciSkippingRope => '반복적인 점프는 다리 쪽 성장판을 자극해요';

  @override
  String get sciPilatesCore => '코어 근력은 척추 정렬과 자세를 받쳐 줘요';

  @override
  String get sciInversionHang => '거꾸로 매달리면 척추 디스크 압박이 풀려 일시적으로 1-2cm 늘 수 있어요';

  @override
  String get sciProtein => '단백질은 뼈와 근육 성장에 꼭 필요한 아미노산을 줘요. 특히 급성장기에 중요해요';

  @override
  String get sciCalciumVitaminD => '칼슘과 비타민 D는 뼈 밀도와 뼈 길이 성장의 기본 재료예요';

  @override
  String get sciWater => '수분은 성장판으로 영양을 나르고 관절 연골을 건강하게 지키는 데 꼭 필요해요';

  @override
  String get sciAvoidJunk => '가공식품과 설탕은 염증과 인슐린 급상승을 일으켜 성장호르몬 분비를 억제해요';

  @override
  String get sciZincIntake => '아연은 성장호르몬 생성에 꼭 필요해요';

  @override
  String get sciVitaminDSunlight => '비타민 D는 칼슘 흡수와 뼈 성장에 아주 중요해요';

  @override
  String get sciArginineFoods => 'L-아르기닌은 성장호르몬 분비를 자극해요';

  @override
  String get sciDailyCalories =>
      '칼로리 부족이 계속되면 IGF-1이 낮아지고 성장호르몬 분비가 약해져서 청소년기 키 성장이 직접 느려져요';

  @override
  String get sciQualitySleep =>
      '하루 성장호르몬의 70-80%는 깊은 잠 단계에서 나와요. 특히 밤 10시~새벽 2시 사이예요';

  @override
  String get sciNoScreen =>
      '화면의 블루라이트는 멜라토닌 분비를 억제해서 잠드는 시간을 늦추고 깊은 잠의 질을 떨어뜨려요';

  @override
  String get sciSleepEnvironment => '어둡고 시원한 환경은 멜라토닌과 성장호르몬 분비를 최대로 높여요';

  @override
  String get sciPreSleepRoutine => '자기 전 루틴을 꾸준히 하면 깊은 잠의 질이 23% 좋아져요';

  @override
  String get sciPostureCheck => '자세를 바로 잡으면 겉보기 키가 바로 2-3 cm 커지고 척추 압박도 막아 줘요';

  @override
  String get sciWallStand =>
      '벽에 붙어 서기는 자세 근육에 바른 자세를 기억시켜 하루 종일 척추 정렬을 유지하게 도와요';

  @override
  String get sciNeckStretches => '목 스트레칭은 압박을 풀고 목뼈 정렬을 개선해요';

  @override
  String get sciShoulderRolls => '어깨를 열면 굽은 자세가 펴져서 겉보기 키가 1-2cm 커질 수 있어요';

  @override
  String get muscleSpine => '척추';

  @override
  String get muscleLegs => '다리';

  @override
  String get muscleBack => '등';

  @override
  String get muscleShoulders => '어깨';

  @override
  String get muscleArms => '팔';

  @override
  String get muscleCore => '코어';

  @override
  String get muscleChest => '가슴';

  @override
  String get muscleCalves => '종아리';

  @override
  String get muscleFullBody => '전신';

  @override
  String get muscleHips => '엉덩이';

  @override
  String get muscleBones => '뼈';

  @override
  String get muscleMuscles => '근육';

  @override
  String get muscleNeck => '목';

  @override
  String get muscleUpperSpine => '윗척추';

  @override
  String get muscleUpperBack => '윗등';

  @override
  String get createRoutine => '루틴 만들기';

  @override
  String get createRoutineTitle => '나만의 루틴 만들기';

  @override
  String get createRoutineSubtitle => '나만의 데일리 루틴을 만들어요';

  @override
  String get routineIcon => '아이콘';

  @override
  String get routineTitleField => '제목';

  @override
  String get routineDescField => '설명';

  @override
  String get routineDescHint => '루틴을 짧게 소개해요';

  @override
  String get routineCategoryField => '카테고리';

  @override
  String get routineDifficultyField => '난이도';

  @override
  String get routineDurationField => '시간';

  @override
  String get routineSetsRepsField => '세트 x 횟수';

  @override
  String get routineFormField => '자세 & 방법';

  @override
  String get routineFormHint => '선택: 이 루틴을 하는 방법';

  @override
  String get diffBeginner => '초급';

  @override
  String get diffIntermediate => '중급';

  @override
  String get diffAdvanced => '고급';

  @override
  String get catExercise => '운동';

  @override
  String get catNutrition => '영양';

  @override
  String get catSleep => '수면';

  @override
  String get catPosture => '자세';

  @override
  String get postureTip1 => '카메라를 향해 옆으로 서요(옆모습).';

  @override
  String get postureTip2 => '렌즈에서 약 2미터 떨어져요.';

  @override
  String get postureTip3 => '팔은 편하게 두고 정면을 봐요.';

  @override
  String get postureTip4 => '정확한 점수를 위해 몸에 붙는 옷을 입어요.';

  @override
  String get postureTip5 => '밝은 조명과 단색 배경에서 찍어요.';

  @override
  String get kyphosisLabel => '척추 후만 (윗등)';

  @override
  String get lordosisLabel => '척추 전만 (허리)';

  @override
  String get analyzingPosture => '자세 분석 중';

  @override
  String get privacyPolicy => '개인정보 처리방침';

  @override
  String get termsOfService => '이용약관';

  @override
  String version(String ver) {
    return '버전 $ver';
  }

  @override
  String get rateApp => 'BeTaller 평가하기';

  @override
  String get rateAppSubtitle => '리뷰가 저희에게 큰 힘이 돼요!';

  @override
  String get unitSystem => '단위';

  @override
  String get unitMetric => '미터법 (cm, kg)';

  @override
  String get unitImperial => '야드파운드법 (ft-in, lbs)';

  @override
  String get healthDisclaimer => '건강 관련 안내';

  @override
  String get healthDisclaimerBody =>
      'BeTaller는 일반적인 건강·운동 가이드를 제공해요. 결과는 나이, 유전, 개인 요인에 따라 달라요. 이 앱은 의학적 조언을 제공하지 않아요. 운동은 자연스러운 습관을 통한 자세 개선, 척추 건강, 성장호르몬 지원에 초점을 맞춰요. 새로운 운동이나 식단을 시작하기 전에 의료 전문가와 상담해요. 성장판이 닫힌 뒤(보통 18-25세)의 키 변화는 주로 자세 개선에서 와요.';

  @override
  String routineProteinAmountDesc(int grams) {
    return '오늘 단백질을 최소 ${grams}g 먹어요 — 몸무게로 계산했어요.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return '오늘 물을 최소 ${liters}L 마셔요 — 몸무게로 계산했어요.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return '성장을 위해 오늘 약 $kcal kcal를 목표로 해요.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return '오늘 비타민 D를 $iu IU 챙겨요 — 햇볕, 음식, 영양제로요.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return '성장호르몬 생성을 위해 오늘 아연을 ${mg}mg 챙겨요.';
  }

  @override
  String get nutritionSupplementsTitle => '영양제';

  @override
  String get nutritionSupplementsDisclaimer =>
      '보조 수단일 뿐 음식을 대신하지 않아요. 영양제를 시작하기 전에 꼭 의사와 상담해요. 특히 18세 미만이라면요.';

  @override
  String get supplementVitaminDName => '비타민 D3';

  @override
  String get supplementVitaminDDose => '3,000 IU';

  @override
  String get supplementVitaminDBenefit => '칼슘 흡수를 높여 뼈 밀도와 성장판 건강을 도와요';

  @override
  String get supplementZincName => '아연';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit => '성장호르몬 생성에 핵심인 미네랄이에요';

  @override
  String get supplementMagnesiumName => '마그네슘';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit => '성장호르몬이 가장 많이 나오는 깊은 잠 단계를 도와요';

  @override
  String get supplementCalciumName => '칼슘';

  @override
  String get supplementCalciumDose => '1,000-1,300mg';

  @override
  String get supplementCalciumBenefit => '뼈 밀도와 성장판의 핵심 재료예요';

  @override
  String get supplementOmega3Name => '오메가-3';

  @override
  String get supplementOmega3Dose => '1,000mg';

  @override
  String get supplementOmega3Benefit => '염증을 줄이고 성장판이 건강하게 일하도록 도와요';

  @override
  String get supplementCollagenName => '콜라겐 + 비타민 C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit => '비타민 C는 몸이 콜라겐으로 연골과 뼈 기질을 만들도록 도와요';

  @override
  String get sciSourcePrefix => '출처: ';

  @override
  String get program => '프로그램';

  @override
  String get todaysExercises => '오늘의 운동';

  @override
  String get dailyNutritionPlan => '하루 영양 플랜';

  @override
  String get nutritionGoalsComplete => '🎉 영양 목표를 모두 달성했어요!';

  @override
  String get nutritionGoalsIncomplete => '최적의 성장을 위해 영양 목표를 채워요';

  @override
  String get postureDetectingAlignment => '척추 정렬 확인 중...';

  @override
  String get testimonial1 =>
      '나이 때문에 포기하고 있었는데 BeTaller로 키가 컸어요. 이렇게 자신감이 생긴 건 처음이에요.';

  @override
  String get testimonialDuration1 => '4개월';

  @override
  String get testimonial2 => '다들 \"이제 더 안 커\"라고 했어요. BeTaller를 쓰고 모두를 놀라게 했어요.';

  @override
  String get testimonialDuration2 => '3개월';

  @override
  String get testimonial3 => '루틴을 시작하고 키도 크고 자세도 좋아졌어요. 다들 차이를 알아봤어요.';

  @override
  String get testimonialDuration3 => '6개월';

  @override
  String get testimonial4 => '아직 성장기인데 BeTaller 효과가 대단해요. 더 크고 튼튼해진 느낌이에요.';

  @override
  String get testimonialDuration4 => '3개월';

  @override
  String get testimonial5 =>
      'BeTaller 안 해 봤다고 하면 거짓말이에요. 금방 진짜 차이를 느꼈어요. 강력 추천해요.';

  @override
  String get testimonialDuration5 => '4개월';

  @override
  String get designedForYou => '나를 위해 만들었어요';

  @override
  String get designedForYouDesc =>
      'BeTaller는 내가 유전적 한계에 닿고, 그 이상까지 갈 수 있도록 만들어졌어요. 모든 기능이 나를 위한 거예요.';

  @override
  String get greetingAllDone => '잘했어요! 🎯';

  @override
  String get greetingAllDoneSub => '오늘 할 일을 모두 끝냈어요.';

  @override
  String greetingStreak30(int streak) {
    return '$streak일 연속. 레전드 레벨이에요.';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak일 연속. 계속 이어가요.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak일 연속. 대부분은 포기하는데, 나는 안 했어요.';
  }

  @override
  String get greetingMorning => '좋은 아침이에요. 새로운 하루, 새로운 기회.';

  @override
  String get greetingAfternoon => '오늘은 연속 기록을 시작하기 딱 좋은 날이에요.';

  @override
  String get greetingEvening => '할 일을 끝내고 연속 기록을 시작해요.';

  @override
  String get todayCompleted => '오늘 완료 ✓';

  @override
  String get todayGoals => '오늘의 목표';

  @override
  String get challengesLabel => '챌린지';

  @override
  String get dailyChallengesLabel => '데일리 챌린지';

  @override
  String get expiresTonight => '오늘 밤 종료';

  @override
  String get allChallengesCompleted => '모두 완료 ✓';

  @override
  String get challengesLoading => '곧 새 챌린지가 열려요.';

  @override
  String get challengesLoadingTitle => '데일리 챌린지';

  @override
  String get behindPace => '목표보다 늦어요';

  @override
  String get growthTracking => '성장 기록';

  @override
  String get growthEmptyFirst => '첫 키를 기록하고 추적을 시작해요.';

  @override
  String get growthEmptySecond => '두 번째 측정을 기록하면 그래프를 볼 수 있어요.';

  @override
  String get growthSectionLabel => '성장';

  @override
  String get generalPerformance => '전체 퍼포먼스';

  @override
  String get analysisBalance => '나의 균형';

  @override
  String get analysisWeakest => '가장 약한 부분';

  @override
  String get analysisPrediction => '키 예측';

  @override
  String get analysisComparison => '비교';

  @override
  String get analysisGrowth => '성장 상태';

  @override
  String get analysisWeakestHint => '점수를 가장 빨리 올릴 수 있는 부분이에요.';

  @override
  String get exploreLabel => '둘러보기';

  @override
  String get explorePosture => '자세 분석';

  @override
  String get explorePostureSub => '자세 분석과 교정 팁';

  @override
  String get explorePhotos => '변화 사진';

  @override
  String get explorePhotosSub => '사진으로 나의 변화를 기록해요';

  @override
  String get exploreNutrition => '영양';

  @override
  String get exploreNutritionSub => '단백질, 칼슘, 비타민 가이드';

  @override
  String get exploreHealth => '건강 기록';

  @override
  String get exploreHealthSub => '스트레스, 카페인, 웰니스 기록';

  @override
  String get exploreRecipes => '성장 레시피';

  @override
  String get exploreRecipesSub => '성장에 도움이 되는 레시피';

  @override
  String get educationLabel => '배우기';

  @override
  String get educationTitle => '키 성장의\n과학';

  @override
  String get educationSubtitle => '전문 콘텐츠, 연구, 가이드';

  @override
  String get aiAnalysisLabel => '성장 분석';

  @override
  String get peerCompareLabel => '또래와 비교';

  @override
  String peerCompareText(int topPct) {
    return '또래 중 상위 $topPct%예요';
  }

  @override
  String get notifWaterTitle => '💧 물 마시는 거 잊지 마요!';

  @override
  String get notifWaterBody => '오늘 물 목표 채웠어요? 한 잔 더 마셔요!';

  @override
  String get notifMorningTitle => '🌅 좋은 아침! 운동할 시간';

  @override
  String get notifMorningBody => '아침 스트레칭해요! 척추와 다리 스트레칭 10분.';

  @override
  String get notifRoutineTitle => '🔥 루틴을 완료해요!';

  @override
  String get notifRoutineBody => '하루가 끝나기 전에 루틴을 체크해요. 연속 기록 = 꾸준함!';

  @override
  String get notifProteinTitle => '🥚 단백질 데이!';

  @override
  String get notifProteinBody => '한 주를 힘차게 시작해요! 끼니마다 단백질 챙기기.';

  @override
  String get notifNewWeekTitle => '✨ 새로운 주, 새로운 목표!';

  @override
  String get notifNewWeekBody => '이번 주는 루틴을 거르지 마요. 작은 걸음, 큰 차이!';

  @override
  String get notifSleepTitle => '😴 잘 시간이에요!';

  @override
  String get notifSleepBody => '성장호르몬은 밤 10시~새벽 2시에 가장 많이 나와요. 휴대폰 내려놓아요!';

  @override
  String get notifPostureTitle => '🧍 자세 체크!';

  @override
  String get notifPostureBody => '등은 곧게, 어깨는 뒤로. 바른 자세 = 2-3 cm 차이!';

  @override
  String get notifVitaminDTitle => '☀️ 비타민 D 시간!';

  @override
  String get notifVitaminDBody => '햇볕을 15분 쬐어요! 비타민 D는 칼슘 흡수를 높여요.';

  @override
  String get notifMidweekTitle => '✨ 벌써 절반!';

  @override
  String get notifMidweekBody => '주중 점검이에요. 성장엔 인내가 필요하지만 꾸준함이 이겨요!';

  @override
  String get notifScreenTitle => '📵 화면 끄기!';

  @override
  String get notifScreenBody => '자기 1시간 전엔 화면 금지. 블루라이트가 멜라토닌을 막아요!';

  @override
  String get notifJumpTitle => '🦘 점프 시간!';

  @override
  String get notifJumpBody => '점프 운동은 성장판을 자극해요. 20회 x 3세트 해 봐요!';

  @override
  String get notifCalciumTitle => '🥛 칼슘 시간!';

  @override
  String get notifCalciumBody => '우유나 요거트 한 잔. 칼슘은 뼈에 아주 중요해요!';

  @override
  String get notifPostureCheckTitle => '🧍 자세 체크!';

  @override
  String get notifPostureCheckBody => '휴대폰 본다고 고개 숙이지 마요! 앉을 때도 걸을 때도 바르게.';

  @override
  String get notifWeekendTitle => '✨ 주말 동기부여';

  @override
  String get notifWeekendBody => '주말에도 루틴을 거르지 마요! 꾸준함은 매일이에요.';

  @override
  String get notifWeeklyProgressTitle => '📊 주간 진행 상황';

  @override
  String get notifWeeklyProgressBody => '이번 주 어땠어요? 성장 그래프를 확인해요!';

  @override
  String get notifMeasureTitle => '📏 주간 측정!';

  @override
  String get notifMeasureBody => '키를 재고 기록해요! 아침에 잰 키가 가장 정확해요.';

  @override
  String get notifEarlySleepTitle => '😴 일찍 자요!';

  @override
  String get notifEarlySleepBody => '내일은 월요일! 푹 자고 한 주를 힘차게 시작해요.';

  @override
  String get notifStreak3Title => '🔥 3일 연속!';

  @override
  String get notifStreak3Body => '좋은 출발! 3일 연속이에요. 7일까지 가 봐요!';

  @override
  String get notifStreak7Title => '🏆 1주 연속!';

  @override
  String get notifStreak7Body => '대단해요! 7일 연속 루틴 완료!';

  @override
  String get notifStreak14Title => '⭐ 2주 연속!';

  @override
  String get notifStreak14Body => '14일의 꾸준함! 몸이 변하기 시작했어요.';

  @override
  String get notifStreak30Title => '👑 1개월 연속!';

  @override
  String get notifStreak30Body => '30일! 진짜 챔피언이에요!';

  @override
  String get notifStreak60Title => '🌟 60일 연속!';

  @override
  String get notifStreak60Body => '60일! 정말 대단한 성과예요.';

  @override
  String get notifStreak100Title => '💎 100일! 레전드!';

  @override
  String get notifStreak100Body => '100일 연속! 레전드가 됐어요.';

  @override
  String get notifStreakRiskTitle => '⚠️ 연속 기록을 지켜요!';

  @override
  String notifStreakRiskBody(int streak) {
    return '$streak일 연속 기록이 끊길 위기예요! 루틴을 완료해요.';
  }

  @override
  String get paywallStat1 => 'cm — 내 가능성이 잠겨 있어요';

  @override
  String get paywallTitle1 => '몇 cm나\n더 클 수 있을까요?';

  @override
  String get paywallBullet1a => '유전적 최대치를 계산했어요. 확인해 볼래요?';

  @override
  String get paywallBullet1b => '생활 습관이 성장에 어떤 영향을 줄까요?';

  @override
  String get paywallBullet1c => '나만의 로드맵이 기다리고 있어요';

  @override
  String get paywallStat2 => '나만의 루틴 준비 완료';

  @override
  String get paywallTitle2 => '내 플랜이\n준비됐어요';

  @override
  String get paywallBullet2a => '매일 아침 8분 — 내 척추에 맞춘 루틴';

  @override
  String get paywallBullet2b => '수면, 영양, 물 — 모두 기록';

  @override
  String get paywallBullet2c => '매일 한 걸음 더 가까이, 연속 기록을 지켜요';

  @override
  String get paywallStat3 => '실시간 진행 그래프';

  @override
  String get paywallTitle3 => '내 성장을\n기록해요';

  @override
  String get paywallBullet3a => '매달 측정 — 성장을 내 눈으로 확인해요';

  @override
  String get paywallBullet3b => '자세 분석으로 지금 바로 2 cm 더';

  @override
  String get paywallBullet3c => '변화 사진 — 차이가 보일 거예요';

  @override
  String get paywallStat4 => '데일리 프로그램 — 레벨 업 중';

  @override
  String get paywallTitle4 => '매일 더\n강해져요';

  @override
  String get paywallBullet4a => 'XP를 모으고 레벨을 열어요 — 습관이 게임이 돼요';

  @override
  String get paywallBullet4b => '목표에 닿은 사람들은 이 길을 거쳤어요';

  @override
  String get paywallBullet4c => '지금 시작해요 — 첫 주 무료';

  @override
  String get paywallRestore => '이전 구매 내역이 없어요';

  @override
  String get paywallRestoreNotFound => '이전 구매 내역이 없어요';

  @override
  String get paywallPromoCode => '프로모션 코드가 있나요?';

  @override
  String get paywallHeightUnit => '목표 키';

  @override
  String get paywallHeightTitle => '얼마나 더 클 수 있을까요?';

  @override
  String get paywallHeightDesc =>
      '유전, 생활 습관, 자세를 함께 분석해서 연도별 예측을 그려요. 정해진 건 없어요. 내가 내딛는 걸음마다 예측이 업데이트돼요.';

  @override
  String get paywallGrowthUnit => '올해';

  @override
  String get paywallGrowthTitle => '내 성장을 함께 기록해요';

  @override
  String get paywallGrowthDesc =>
      '측정할 때마다 바로 그래프에 표시돼요. 한 달, 1센티미터씩 내 진행 상황을 지켜봐요.';

  @override
  String get paywallPostureUnit => '자세 점수';

  @override
  String get paywallPostureTitle => '자세가 루틴의 핵심이에요';

  @override
  String get paywallPostureDesc =>
      '머리, 어깨, 허리를 3가지 질문으로 빠르게 체크하고, 각각 바로잡는 운동을 알려 줘요.';

  @override
  String get paywallReportUnit => '루틴 완료';

  @override
  String get paywallReportTitle => '매주 나를 점검해요';

  @override
  String get paywallReportDesc =>
      '물, 수면, 루틴, 연속 기록을 한 화면에. 매주 강점과 부족한 점을 함께 짚어 봐요.';

  @override
  String get paywallNutritionUnit => '하루 끼니';

  @override
  String get paywallNutritionTitle => '완벽한 영양 플랜이 준비됐어요';

  @override
  String get paywallNutritionDesc =>
      '아침부터 저녁까지, 단백질·칼슘·아연·비타민 D까지 계산된 하루 식단이에요.';

  @override
  String get paywallScoreUnit => 'BeTaller 점수';

  @override
  String get paywallScoreTitle => '나를 계속 앞으로 밀어 주는 시스템';

  @override
  String get paywallScoreDesc =>
      '유전, 성장, 영양, 수면, 꾸준함을 하나의 점수로 합쳐요. 점수가 떨어지면 어디를 개선해야 할지 바로 보여요.';

  @override
  String get paywallPhotosUnit => '눈에 보이는 차이';

  @override
  String get paywallPhotosTitle => '사진으로 변화를 증명해요';

  @override
  String get paywallPhotosDesc => '전후 비교가 자동으로 만들어지고, 매달 찍은 사진이 타임라인에 함께 모여요.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => '세 단계로 시작해요';

  @override
  String get journeyIntroSubtitle => 'BeTaller를 함께 설정해요. 다음 단계가 기다리고 있어요.';

  @override
  String get journeyStep1Title => '정보 모으기';

  @override
  String get journeyStep1Desc => '키, 나이, 생활 습관을 받아서 내 가능성을 계산해요.';

  @override
  String get journeyStep2Title => '앱 둘러보기';

  @override
  String get journeyStep2Desc => '모든 기능을 하나씩 살펴봐요. 무엇을 하고 어떻게 쓰는지요.';

  @override
  String get journeyStep3Title => '직접 써 보기';

  @override
  String get journeyStep3Desc => '내가 데일리 루틴을 하고, 우리는 진행 상황을 기록해요.';

  @override
  String get journeyNow => '지금';

  @override
  String get journeyDone => '완료';

  @override
  String get journeySoon => '곧';

  @override
  String get tourHomeStreakTitle => '연속 기록';

  @override
  String get tourHomeStreakDesc => '꾸준히 하면 계속 늘어나요. 하루라도 빠지면 처음부터 다시 시작해요.';

  @override
  String get tourHomeXpTitle => '나의 레벨';

  @override
  String get tourHomeXpDesc => '꾸준히 해서 모은 XP로 올라가요. 흐름을 놓치지 마요!';

  @override
  String get tourHomeGoalsTitle => '오늘의 목표';

  @override
  String get tourHomeGoalsDesc => '오늘의 루틴, 할 일, 물 목표를 한눈에 보여 줘서 놓치는 게 없어요.';

  @override
  String get tourHomeTrackTitle => '물 & 수면 기록';

  @override
  String get tourHomeTrackDesc => '하루 물과 수면을 여기서 몇 초 만에 기록해요.';

  @override
  String get tourPlanTabsTitle => '세 개의 탭: 오늘, 꾸준함, 영양';

  @override
  String get tourPlanTabsDesc => '데일리 루틴, 주간 프로그램, 영양 플랜이 모두 여기 있어요.';

  @override
  String get tourPlanLevelTitle => '나의 꾸준함 레벨';

  @override
  String get tourPlanLevelDesc => '루틴을 얼마나 꾸준히 했는지 보여 줘요. 레벨을 올리면 결과도 좋아져요.';

  @override
  String get tourPlanTodayTitle => '오늘의 플랜';

  @override
  String get tourPlanTodayDesc => '여기서 데일리 루틴을 체크하고 연속 기록을 늘려요.';

  @override
  String get tourPlanTodayListTitle => '오늘의 루틴';

  @override
  String get tourPlanTodayListDesc => '할 때마다 하나씩 체크해요. 루틴을 누르면 자세한 내용이 열려요.';

  @override
  String get tourPlanWeekGoalsTitle => '이번 주';

  @override
  String get tourPlanWeekGoalsDesc =>
      '이번 주에 필요한 완벽한 날, 운동, 측정이에요. 꼭 해야 하는 것도 포함돼요.';

  @override
  String get tourPlanMonthGoalsTitle => '이번 달';

  @override
  String get tourPlanMonthGoalsDesc =>
      '변화 사진, 자세 체크, 이번 달 측정: 건너뛰면 안 되는 것들이에요.';

  @override
  String get tourProgressHeightTitle => '현재 키';

  @override
  String get tourProgressHeightDesc => '지금 키와 총 성장량을 보여 줘요. 여기서 새 측정을 추가해요.';

  @override
  String get tourProgressPhotosTitle => '변화 사진';

  @override
  String get tourProgressPhotosDesc => '꾸준히 찍은 사진으로 나의 변화를 눈으로 확인해요.';

  @override
  String get tourProgressPostureTitle => '자세 분석';

  @override
  String get tourProgressPostureDesc => '사진으로 자세를 분석하고 무엇을 연습해야 할지 알아봐요.';

  @override
  String get tourAnalysisScoreTitle => '나의 BeTaller 점수';

  @override
  String get tourAnalysisScoreDesc => '유전, 성장 속도, 영양, 수면으로 계산한 전체 퍼포먼스 점수예요.';

  @override
  String get tourAnalysisPredictionTitle => '나의 키 예측';

  @override
  String get tourAnalysisPredictionDesc => '예상 최종 키와 연도별 성장 흐름을 보여 줘요.';

  @override
  String get tourAnalysisPeerTitle => '또래와 비교';

  @override
  String get tourAnalysisPeerDesc => '내 순위를 확인하고 같은 나이 친구들과 비교해요.';

  @override
  String get tourHomeGoalsRoutinesTitle => '나의 루틴';

  @override
  String get tourHomeGoalsRoutinesDesc => '오늘 남은 운동 루틴이 몇 개인지 확인해요.';

  @override
  String get tourHomeGoalsChallengesTitle => '나의 할 일';

  @override
  String get tourHomeGoalsChallengesDesc => '진행 중인 챌린지의 진행 상황을 여기서 확인해요.';

  @override
  String get tourHomeGoalsWaterTitle => '나의 물 목표';

  @override
  String get tourHomeGoalsWaterDesc => '하루 물 목표에 얼마나 가까운지 확인해요.';

  @override
  String get tourHomeReminderTitle => '다음 알림';

  @override
  String get tourHomeReminderDesc => '다음 알림이 언제 오는지 보고, 여기서 바로 수정해요.';

  @override
  String get tourHomeChallengesTitle => '나의 챌린지';

  @override
  String get tourHomeChallengesDesc => '진행 중인 챌린지를 완료하고 추가 XP를 받아요.';

  @override
  String get tourHomeGrowthTitle => '나의 성장 상태';

  @override
  String get tourHomeGrowthDesc => '총 성장량과 최근 측정의 차이, 그리고 몇 번 기록했는지 확인해요.';

  @override
  String get tourHomeExploreTitle => '둘러보기';

  @override
  String get tourHomeExploreDesc => '영양 가이드, 성장 레시피 등이 여기서 기다리고 있어요.';

  @override
  String get tourPlanProgramHeaderTitle => '나의 70일 프로그램';

  @override
  String get tourPlanProgramHeaderDesc => '이 링에서 전체 진행도, 현재 레벨과 일차를 확인해요.';

  @override
  String get tourPlanProgramLevelsTitle => '레벨';

  @override
  String get tourPlanProgramLevelsDesc =>
      '10개 레벨 중 어디에 있는지, 아직 잠긴 레벨은 무엇인지 확인해요.';

  @override
  String get tourPlanNutritionHeaderTitle => '나의 영양 진행도';

  @override
  String get tourPlanNutritionHeaderDesc => '하루 영양 루틴을 몇 개 완료했는지 확인해요.';

  @override
  String get tourPlanNutritionFirstTitle => '영양 루틴';

  @override
  String get tourPlanNutritionFirstDesc => '성장에 도움이 되는 식습관을 체크해요.';

  @override
  String get tourProgressChartTitle => '성장 곡선';

  @override
  String get tourProgressChartDesc => '지난 측정을 그래프로 보고 어디로 향하는지 알아봐요.';

  @override
  String get tourProgressReportTitle => '주간 리포트';

  @override
  String get tourProgressReportDesc => '한 주의 진행 상황을 정리한 리포트를 확인해요.';

  @override
  String get tourProgressHistoryTitle => '나의 측정 기록';

  @override
  String get tourProgressHistoryDesc => '기록한 모든 키 측정을 타임라인으로 확인해요.';

  @override
  String get tourAnalysisRadarTitle => '나의 균형 차트';

  @override
  String get tourAnalysisRadarDesc =>
      '유전, 성장 속도, 영양, 수면, 꾸준함의 균형을 레이더 차트로 보고 가장 약한 부분을 알아봐요.';

  @override
  String get tourAnalysisDailyNeedsTitle => '하루 필요량';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      '내 키와 몸무게에 맞춘 하루 단백질, 칼로리, 수면, 물 필요량을 확인해요.';

  @override
  String get journeyDataDoneTitle => '첫 단계 완료';

  @override
  String get journeyDataDoneSubtitle => '정보와 가능성을 확인했어요. 다음은 앱 둘러보기예요.';

  @override
  String get journeyContinue => '계속';

  @override
  String get journeyEnterApp => '앱 시작하기';

  @override
  String get journeyProgressLabel => '시작하는 중';

  @override
  String get journeyTourDoneTitle => 'BeTaller에 오신 걸 환영해요!';

  @override
  String get journeyTourDoneSubtitle =>
      '세 단계를 모두 마쳤어요. 이제 내 차례예요. 첫 루틴을 완료하며 여정을 시작해요.';

  @override
  String get journeyViewPlansButton => '플랜 보고 시작하기';

  @override
  String get paywallRestoreLabel => '구매 복원';

  @override
  String get paywallYearly => '연간';

  @override
  String get paywallBestValue => '가장 알뜰해요';

  @override
  String paywallSavePercent(String percent) {
    return '$percent% 할인';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/주';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/월';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/년';
  }

  @override
  String get paywallMonthly => '월간';

  @override
  String get paywallWeekly => '주간';

  @override
  String get paywallFreeTrial => '3일 무료';

  @override
  String get paywallLoadError => '구매 옵션을 불러오지 못했어요. 다시 시도해요';

  @override
  String get paywallCtaAlt => '계속';

  @override
  String get paywallTrialDisclaimer => '3일 무료 · 이후 자동 갱신 · 언제든 해지 가능';

  @override
  String get paywallYearlyDisclaimer => '매년 자동 갱신 · 언제든 해지 가능';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days일 무료, 이후 $price/주 · 언제든 해지 가능';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days일 무료, 이후 $price/월 · 언제든 해지 가능';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days일 무료, 이후 $price/년 · 언제든 해지 가능';
  }

  @override
  String get paywallRenewsWeekly => '매주 자동 갱신 · 언제든 해지 가능';

  @override
  String get paywallRenewsMonthly => '매달 자동 갱신 · 언제든 해지 가능';

  @override
  String get resultCardTitle => '예상 성인 키';

  @override
  String resultRange(String min, String max) {
    return '예상 범위: $min ~ $max';
  }

  @override
  String resultPercentile(String percent) {
    return '같은 나이 중 $percent%보다 커요';
  }

  @override
  String resultGrowthLeft(String amount) {
    return '예상 남은 성장: $amount';
  }

  @override
  String get resultFootnote => '부모님 키와 성장 곡선 데이터로 계산한 추정치예요. 의학적 조언이 아니에요.';

  @override
  String get postureCheckTitle => '빠른 자세 체크';

  @override
  String get postureCheckIntro =>
      '발뒤꿈치, 엉덩이, 날개뼈를 벽에 붙이고 서서 세 가지 질문에 답해요. 점수는 답변으로 계산하고, 사진은 전후 비교용으로 저장돼요.';

  @override
  String get postureQHead => '턱을 들지 않고 뒤통수가 벽에 닿나요?';

  @override
  String get postureQHeadA1 => '네, 쉽게 닿아요';

  @override
  String get postureQHeadA2 => '뒤로 밀어야 닿아요';

  @override
  String get postureQHeadA3 => '아니요, 틈이 있어요';

  @override
  String get postureQShoulders => '옆모습 사진에서 어깨가 귀보다 어디에 있나요?';

  @override
  String get postureQShouldersA1 => '귀와 일직선이에요';

  @override
  String get postureQShouldersA2 => '살짝 앞에 있어요';

  @override
  String get postureQShouldersA3 => '확실히 앞으로 말려 있어요';

  @override
  String get postureQLowerBack => '허리 뒤로 손을 넣어 봐요. 공간이 얼마나 있나요?';

  @override
  String get postureQLowerBackA1 => '손바닥이 딱 들어가요';

  @override
  String get postureQLowerBackA2 => '공간이 전혀 없어요';

  @override
  String get postureQLowerBackA3 => '주먹이 들어가요';

  @override
  String get postureCheckSave => '내 점수 보기';

  @override
  String get postureCheckNote => '셀프 체크일 뿐, 의학적 진단이 아니에요.';

  @override
  String get paywallTester => '테스터';

  @override
  String get introTag1 => '예측';

  @override
  String get introTag2 => '성장';

  @override
  String get introTag3 => '기록';

  @override
  String get introTag4 => '게임처럼';

  @override
  String get introTag5 => '커뮤니티';

  @override
  String get introTitle1 => '내 키 가능성을\n알아봐요';

  @override
  String get introSubtitle1 => '유전, 나이, 생활 습관으로\n내 가능성을 계산해 드려요.';

  @override
  String get introTitle2 => '매일 한 걸음씩\n더 크게';

  @override
  String get introSubtitle2 => '나만의 운동·영양 플랜으로\n내 가능성을 끌어올려요.';

  @override
  String get introTitle3 => '1센티미터까지\n모두 기록';

  @override
  String get introSubtitle3 => '매달 측정으로 실제 변화가\n어떻게 쌓이는지 확인해요.';

  @override
  String get introTitle4 => '레벨 업하고\n보상 받기';

  @override
  String get introSubtitle4 => '70일 프로그램을 끝내고\nXP를 모아 새 레벨을 열어요.';

  @override
  String get introTitle5 => '벌써 수천 명이\n더 컸어요';

  @override
  String get introSubtitle5 => '목표를 이룬 사용자\n커뮤니티에 함께해요.';

  @override
  String get criticalWindow => '중요한 시기';

  @override
  String get heightPotentialFading => '내 키 가능성에 대한';

  @override
  String get fadingAway => '사실들..';

  @override
  String get painHookDesc =>
      '올바른 습관이 없으면 하루하루 센티미터가 영영 사라져요. 하지만 아직 되돌릴 수 있어요.';

  @override
  String get painGeneticTitle => '유전이 전부는 아니에요';

  @override
  String get painGeneticDesc =>
      '유전이 60%를 정하지만, 나머지 40%는 내가 하기에 달렸어요. BeTaller는 바로 그 40%를 위해 있어요.';

  @override
  String get painGeneticTag => '분석';

  @override
  String get painSleepTitle => '수면 루틴을 최적화해요';

  @override
  String get painSleepDesc =>
      '매일 밤 제대로 자면 성장호르몬 분비가 70%까지 늘 수 있어요. 수면 기록은 BeTaller가 챙길게요. 나는 자기만 하면 돼요.';

  @override
  String get painSleepTag => '기록';

  @override
  String get painPostureTitle => '자세로 지금 바로 센티미터 얻기';

  @override
  String get painPostureDesc =>
      '바른 자세만으로 바로 1.5-3 cm가 늘어 보일 수 있어요. BeTaller의 데일리 자세 루틴으로 몇 주 만에 몸에 익혀요.';

  @override
  String get painPostureTag => '자세';

  @override
  String get painExerciseTitle => '나만의 운동 플랜이 준비됐어요';

  @override
  String get painExerciseDesc =>
      '아침 스트레칭, 매달리기, 척추 루틴: BeTaller가 준비하고 일정까지 짜 뒀어요. 하루 8-12분이면 돼요.';

  @override
  String get painExerciseTag => '루틴';

  @override
  String get painNutritionTitle => '식사는 성장에 직접 영향을 줘요';

  @override
  String get painNutritionDesc =>
      '단백질, 칼슘, 비타민 D: 어떤 영양소를 언제 챙길지 BeTaller가 매일 알려 줘요.';

  @override
  String get painNutritionTag => '영양';

  @override
  String get painTrackingTitle => '내 성장을 내 눈으로 확인해요';

  @override
  String get painTrackingDesc => '매달 측정, 변화 사진, 성장 그래프: 늘어나는 1센티미터를 모두 확인해요.';

  @override
  String get painTrackingTag => '진행 상황';

  @override
  String get selectYourGender => '성별을 골라요';

  @override
  String get onboardingPredictSubtitle => '키 가능성을 예측하고 나만의 플랜을 만드는 데 사용돼요.';

  @override
  String get other => '기타';

  @override
  String get whenWereYouBorn => '언제 태어났어요?';

  @override
  String get heightAndWeight => '키 & 몸무게';

  @override
  String get parentsHeight => '부모님 키';

  @override
  String get weeklyWorkout => '주간 운동';

  @override
  String get workoutsPerWeek => '일주일 운동 횟수';

  @override
  String get whatsYourEthnicity => '인종이 어떻게 돼요?';

  @override
  String get whiteCaucasian => '백인';

  @override
  String get blackAfricanAmerican => '흑인 / 아프리카계';

  @override
  String get hispanicLatino => '히스패닉 / 라틴계';

  @override
  String get asian => '아시아인';

  @override
  String get middleEasternIndigenous => '중동계 / 원주민';

  @override
  String get dontWantToAnswer => '답하고 싶지 않아요';

  @override
  String get footSizeLabel => '발 사이즈';

  @override
  String get selectYourSize => '사이즈를 골라요';

  @override
  String get whatsYourDreamHeight => '꿈의 키는 몇이에요?';

  @override
  String get dreamHeightCalcSubtitle => '입력한 정보로 이 키에 닿을 가능성을 계산해요.';

  @override
  String get dreamHeightLabel => '꿈의 키';

  @override
  String get sleepQuestion => '매일 밤 몇 시간\n자요?';

  @override
  String get thousandsSucceeded => '수천 명이\n해냈어요';

  @override
  String get youCanToo => '나도 할 수 있어요';

  @override
  String get yearsOld => '세';

  @override
  String get verifiedLabel => '인증됨';

  @override
  String get scientificData => '과학적 데이터';

  @override
  String get longTermResults => 'BeTaller는\n오래가는 결과를 만들어요';

  @override
  String get longTermResultsSubtitle => '많은 사람이 나쁜 습관 때문에 원래 클 수 있는 키에 닿지 못해요.';

  @override
  String get yourFinalHeight => '나의 최종 키';

  @override
  String get badHabitsLegend => '나쁜 습관';

  @override
  String get optimizedLegend => '최적화';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => '습관으로 바꿀 수 있는\n키의 비율';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc => '이상적인 수면이\n성장호르몬을 높여요';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => '자세 개선으로\n얻을 수 있어요';

  @override
  String get didYouKnow => '알고 있었나요?';

  @override
  String get didYouKnowFact1 => '하루 습관이 키의 30%에 영향을 줘요';

  @override
  String get didYouKnowFact2 => '척추 압박이 키를 1.5-3 cm 빼앗아요';

  @override
  String get didYouKnowFact3 => '잠이 부족하면 HGH가 70% 줄어요';

  @override
  String get transformJourneyBegins => '나의 변화 여정이\n시작돼요';

  @override
  String get transformJourneySubtitle => '건강한 성장을 한 걸음씩 돕도록\n만든 종합 프로그램이에요.';

  @override
  String get week1Label => '1주';

  @override
  String get week1Title => '1주 차';

  @override
  String get week1Desc => '척추 정렬이 좋아지고 자세가 나아져요';

  @override
  String get month1Label => '1개월';

  @override
  String get month1Title => '1개월 차';

  @override
  String get month1Desc => '눈에 보이는 첫 센티미터, 수면의 질이 좋아져요';

  @override
  String get month3Label => '3개월';

  @override
  String get month3Title => '3개월 차';

  @override
  String get month3Desc => '평균 +1.5–2.5 cm, 근육 발달';

  @override
  String get month6Label => '6개월';

  @override
  String get month6Title => '6개월 차';

  @override
  String get month6Desc => '최대 가능성에 닿고, 새로운 키로 살아가요';

  @override
  String get reachYourGoal => '목표에 닿아요';

  @override
  String get journeyBullet1 => '최대 가능성을 열어요';

  @override
  String get journeyBullet2 => '새로운 키로 살아가기 시작해요';

  @override
  String get journeyBullet3 => '나만의 성공 스토리를 써요';

  @override
  String get unlockButton => '모두 잠금 해제';

  @override
  String get dreamHeightOdds => '꿈의 키\n가능성';

  @override
  String get growthCompleteLabel => '성장\n진행률';

  @override
  String get tallerThanPct => '같은 나이 중 76.7%보다 커요';

  @override
  String get levelNovice => '초보';

  @override
  String get levelBuilder => '빌더';

  @override
  String get levelGrinder => '노력파';

  @override
  String get levelWarrior => '전사';

  @override
  String get levelGodTier => '신급';

  @override
  String get levelDesc0 => '기초 다지기';

  @override
  String get levelDesc1 => '성장 가속';

  @override
  String get levelDesc2 => '훈련 강화';

  @override
  String get levelDesc3 => '한계 넘기';

  @override
  String get levelDesc4 => '노력 없이 성장 없다';

  @override
  String get levelDesc5 => '챔피언 마인드';

  @override
  String get levelDesc6 => '엘리트 퍼포먼스';

  @override
  String get levelDesc7 => '내 몸의 주인';

  @override
  String get levelDesc8 => '전설의 꾸준함';

  @override
  String get levelDesc9 => '최대 가능성';

  @override
  String levelLabel(int level) {
    return '레벨 $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일 남음',
      one: '$days일 남음',
    );
    return '프로그램 $_temp0';
  }

  @override
  String get tapLabel => '탭';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => '일';

  @override
  String get legendShort => '작음';

  @override
  String get legendBelowAvg => '평균 이하';

  @override
  String get legendAverage => '평균';

  @override
  String get legendTall => '큼';

  @override
  String get legendVeryTall => '아주 큼';

  @override
  String get pctBottom5 => '하위 5%';

  @override
  String get pctBottom25 => '하위 25%';

  @override
  String get pctMedian => '중간';

  @override
  String get pctTop25 => '상위 25%';

  @override
  String get pctTop5 => '상위 5%';

  @override
  String get fallingBehind => '뒤처지고 있어요';

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes분 분량';
  }

  @override
  String get inThisArticle => '이 글의 내용';

  @override
  String get nextArticle => '다음 글';

  @override
  String get purchaseUnavailable => '구매를 완료하지 못했어요. 다시 시도해 주세요.';

  @override
  String get viewPlan => '플랜 보기';

  @override
  String get viewPlanSubtitle => '구독 정보 확인';

  @override
  String predictionConfidenceHint(String percent) {
    return '키 측정을 추가하면 예측 정확도가 $percent%까지 올라가요';
  }

  @override
  String get paywallSlideHomeTitle => '하루를 한 화면에';

  @override
  String get paywallSlideHomeCaption => '루틴, 물, 수면: 채워야 할 링 세 개.';

  @override
  String get paywallSlideProgressTitle => '1센티미터까지 확인';

  @override
  String get paywallSlideProgressCaption => '측정할 때마다 바로 곡선에 표시돼요.';

  @override
  String get paywallSlideAnalysisTitle => '다섯 가지 지표, 한 그림';

  @override
  String get paywallSlideAnalysisCaption => '레이더가 가장 약한 부분을 짚어 줘요.';

  @override
  String get paywallSlidePotentialTitle => '내 가능성 알기';

  @override
  String get paywallSlidePotentialCaption => '또래 중 내 위치를 확인해요.';

  @override
  String get paywallSlideDisciplineTitle => '연속 기록 지키기';

  @override
  String get paywallSlideDisciplineCaption => '하루하루가 레벨을 올려 줘요.';

  @override
  String get paywallSlideRemindersTitle => '딱 맞는 시간에 알림';

  @override
  String get paywallSlideRemindersCaption => '시간만 정하면 나머지는 앱이 챙겨요.';

  @override
  String get paywallSlidePostureTitle => '자세 바로잡기';

  @override
  String get paywallSlidePostureCaption => '옆모습 사진, 빠른 셀프 체크, 확실한 루틴.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days일 무료';
  }

  @override
  String paywallTrialThen(String price) {
    return '이후 $price · 언제든 해지 가능';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / 년 · 언제든 해지 가능';
  }

  @override
  String get obBedtimeTitle => '보통 몇 시에 자요?';

  @override
  String get obBedtimeSubtitle => '이 시간쯤 수면 알림을 맞춰 둘게요.';

  @override
  String get obWorkoutTimeTitle => '몇 시에 운동해요?';

  @override
  String get obWorkoutTimeSubtitle => '운동 알림이 딱 맞춰 오도록요.';

  @override
  String get obMealsTitle => '하루에 몇 끼 먹어요?';

  @override
  String get obMealsSubtitle => '시간을 눌러서 내 생활에 맞게 바꿔요.';

  @override
  String obMealsCount(String count) {
    return '$count끼';
  }

  @override
  String obMealLabel(String n) {
    return '$n번째 끼니';
  }

  @override
  String get obProteinTitle => '하루에 단백질을 몇 g 먹어요?';

  @override
  String get obProteinSubtitle => '대략이면 충분해요. 그걸 바탕으로 플랜을 짜요.';

  @override
  String get obCaloriesTitle => '하루 평균 몇 칼로리 먹어요?';

  @override
  String get obCaloriesSubtitle => '추정치면 돼요. 나중에 함께 더 정확하게 맞춰요.';

  @override
  String get obNotSure => '잘 모르겠어요';

  @override
  String get silNow => '현재';

  @override
  String get silPotential => '가능성';

  @override
  String get chartMeasured => '나의 측정';

  @override
  String chartPotential(String height) {
    return '가능성 $height';
  }

  @override
  String chartDream(String height) {
    return '나의 목표 $height';
  }

  @override
  String get targetsTitle => '오늘, 나를 위한 목표';

  @override
  String get targetsSubtitle => '나이, 몸무게, 운동량으로 계산했어요.';

  @override
  String get targetProtein => '단백질';

  @override
  String get targetCalcium => '칼슘';

  @override
  String get targetVitaminD => '비타민 D';

  @override
  String get targetWater => '물';

  @override
  String get targetSleep => '수면';

  @override
  String get targetMove => '운동';

  @override
  String targetPerMeal(String g) {
    return '끼니당 $g g';
  }

  @override
  String get unitHours => '시간';

  @override
  String get unitMinutes => '분';

  @override
  String get planStrength => '근력';

  @override
  String get planJump => '점프 & 스프린트';

  @override
  String get planMobility => '스트레칭';

  @override
  String get planSport => '스포츠';

  @override
  String get planPosture => '자세';

  @override
  String get planRest => '휴식';

  @override
  String planWeekTitle(int days) {
    return '이번 주: 운동 $days일';
  }

  @override
  String get planPreviewTitle => '플랜이 준비됐어요';

  @override
  String planPreviewTraining(int days) {
    return '성장을 위해 짠 주 $days일 운동';
  }

  @override
  String planPreviewProtein(int grams) {
    return '하루 단백질 $grams g, 끼니마다 나눠서';
  }

  @override
  String planPreviewSleep(String hours) {
    return '수면 $hours시간, 취침 알림까지';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return '오늘: $plan · $minutes분';
  }

  @override
  String get nRestTitle => '오늘은 쉬는 날';

  @override
  String get nRestBody => '10분 스트레칭이면 충분해요. 회복도 플랜의 일부예요.';

  @override
  String nProteinTitle(int grams) {
    return '오늘 단백질 목표: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return '끼니당 약 $grams g: 달걀, 요거트, 닭고기, 렌틸콩.';
  }

  @override
  String nWaterTitle(String liters) {
    return '물 목표: $liters';
  }

  @override
  String get nWaterBody => '지금 한 잔 마시면 오늘 목표대로 가요.';

  @override
  String get nSleepTitle => '이제 쉴 시간이에요';

  @override
  String nSleepBody(String hours) {
    return '목표는 $hours시간. 화면은 끄고 조명은 낮춰요.';
  }

  @override
  String nMeasureBody(String potential) {
    return '나의 가능성: $potential. 아침에 키를 재고 그래프가 움직이는 걸 봐요.';
  }

  @override
  String get nTrialDay1Title => '플랜이 기다리고 있어요';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return '오늘: $plan, $minutes분. 키를 기록하면 그래프가 시작돼요.';
  }

  @override
  String get nTrialEndTitle => '무료 체험이 내일 끝나요';

  @override
  String nTrialEndBody(String price) {
    return '이후 $price로 계속돼요. 어느 쪽이든 플랜과 기록은 저장돼요.';
  }

  @override
  String get trophyContinue => '계속하기';

  @override
  String get guideSteps => '단계별 방법';

  @override
  String get guideMistakes => '자주 하는 실수';

  @override
  String get guideTip => '팁';

  @override
  String get homeHeroTitle => '내 키와 내 가능성';

  @override
  String homeHeroGap(String cm) {
    return '앞으로 $cm 더';
  }

  @override
  String get anSubtitle => '내 점수, 점수를 움직이는 것, 그리고 내가 향하는 곳';

  @override
  String get anScoreLabel => 'BeTaller 점수';

  @override
  String get anTierStarting => '시작';

  @override
  String get anTierBuilding => '성장 중';

  @override
  String get anTierRising => '상승';

  @override
  String get anTierStrong => '강함';

  @override
  String get anTierPeak => '정점';

  @override
  String anTrendUp(int n) {
    return '지난주보다 +$n';
  }

  @override
  String anTrendDown(int n) {
    return '지난주보다 -$n';
  }

  @override
  String get anTrendFlat => '지난주와 같아요';

  @override
  String get anTrendFirst => '다음 주부터 주간 추세가 보여요';

  @override
  String anNextTier(int n, String tier) {
    return '$tier까지 $n점';
  }

  @override
  String get anTopTier => '최고 티어. 계속 지켜요';

  @override
  String anCoverage(int n, int total) {
    return '$total개 중 $n개 지표 기준';
  }

  @override
  String get anNoScoreTitle => '아직 데이터가 부족해요';

  @override
  String get anNoScoreBody => '오늘 수면, 물, 운동 중 하나만 기록해도 첫 점수가 나와요.';

  @override
  String get anFastestWin => '가장 빠른 개선';

  @override
  String get anBreakdownTitle => '내 점수를 만드는 것';

  @override
  String get anBreakdownHint => '각 지표는 내 데이터로 0~100점을 매겨요. 퍼센트는 얼마나 반영되는지예요.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => '아직 데이터 없음';

  @override
  String get anNotCounted => '반영 안 됨';

  @override
  String get anFTraining => '운동';

  @override
  String get anFConsistency => '꾸준함';

  @override
  String get anFSleep => '수면';

  @override
  String get anFHydration => '수분';

  @override
  String get anFNutrition => '영양';

  @override
  String get anFPosture => '자세';

  @override
  String get anFMeasuring => '측정';

  @override
  String get anFGrowth => '성장 속도';

  @override
  String get anFHeadroom => '남은 성장';

  @override
  String anBTraining(int done, int planned) {
    return '최근 7일 동안 계획한 운동일 $planned일 중 $done일';
  }

  @override
  String get anBTrainingNone => '주간 플랜 대비 운동한 날을 세요.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak일',
      one: '$streak일',
    );
    return '연속 $_temp0, $days일 중 $active일 플랜 절반 이상 완료';
  }

  @override
  String get anBConsistencyNone => '연속 기록과 플랜을 절반 이상 끝낸 날을 세요.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '$days일',
    );
    return '하루 평균 $hours시간, 목표 $target시간, $_temp0 기록';
  }

  @override
  String get anBSleepNone => '최근 7일 동안 수면 기록이 없어요.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '$days일',
    );
    return '하루 평균 $litres, 목표 $target, $_temp0 기록';
  }

  @override
  String get anBHydrationNone => '최근 7일 동안 물 기록이 없어요.';

  @override
  String anBNutrition(int done, int planned) {
    return '최근 7일 동안 영양 습관 $planned개 중 $done개 완료';
  }

  @override
  String get anBNutritionNone => '플랜의 단백질, 칼슘, 아연, 비타민 D 습관을 세요.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '$days일',
    );
    return '벽 셀프 체크 $raw/90, $_temp0 전';
  }

  @override
  String anBPostureToday(int raw) {
    return '벽 셀프 체크 $raw/90, 오늘';
  }

  @override
  String get anBPostureNone => '아직 자세 셀프 체크가 없어요.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '$days일',
    );
    return '마지막 측정 $_temp0 전';
  }

  @override
  String get anBMeasuringToday => '오늘 측정함';

  @override
  String get anBMeasuringNone => '아직 측정 기록이 없어요.';

  @override
  String anBGrowth(String v, String e) {
    return '1년에 $v, 내 나이 평균 $e';
  }

  @override
  String get anBGrowthNone => '30일 이상 간격을 둔 측정 2개가 필요해요.';

  @override
  String get anBGrowthAdult => '성장판은 보통 21세쯤 닫혀서 성장 속도는 반영되지 않아요.';

  @override
  String anBHeadroom(String cm) {
    return '오늘과 내 가능성 사이 $cm';
  }

  @override
  String get anATraining => '오늘 운동 시작하기';

  @override
  String get anAConsistency => '오늘 플랜 절반 끝내기';

  @override
  String get anASleepLog => '어젯밤 수면 기록하기';

  @override
  String anASleep(String target) {
    return '오늘 밤 $target시간 자기';
  }

  @override
  String get anAHydrationLog => '물 한 잔 기록하기';

  @override
  String anAHydration(String left) {
    return '오늘 $left 더 마시기';
  }

  @override
  String get anAHydrationDone => '오늘 목표 달성. 내일도 똑같이';

  @override
  String get anANutrition => '오늘의 영양 습관 체크하기';

  @override
  String get anAPostureFirst => '1분 자세 셀프 체크하기';

  @override
  String get anAPostureRedo => '자세 셀프 체크 다시 하기';

  @override
  String get anAPostureKeep => '데일리 자세 루틴 유지하기';

  @override
  String get anAMeasure => '지금 키 재기';

  @override
  String get anAMeasureKeep => '다음 주에 다시 재기';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '$days일',
    );
    return '$_temp0 뒤에 다시 재기';
  }

  @override
  String get anAGrowth => '2주마다 재서 추적하기';

  @override
  String get anAHeadroom => '내 가능성 보기';

  @override
  String get anPotentialTitle => '나의 가능성';

  @override
  String get anPotentialLabel => '예상 성인 키';

  @override
  String anPotentialToGo(String cm) {
    return '+$cm 남음';
  }

  @override
  String get anPotentialReached => '예상 키에 도달했어요';

  @override
  String get anPotentialNote => '앱 어디서나 같은 숫자예요. 올라가기만 해요.';

  @override
  String anDreamLine(String h) {
    return '나의 목표: $h';
  }

  @override
  String get anSourcesTitle => '센티미터는 어디서 올까요';

  @override
  String get anSourcesGenes => '유전과 나이';

  @override
  String get anSourcesHabits => '수면, 식사, 운동';

  @override
  String get anSourcesPosture => '자세';

  @override
  String get anPctTitle => '나이 대비 키';

  @override
  String anPctValue(int p) {
    return '같은 나이 중 $p%보다 커요';
  }

  @override
  String get anPctBasis => '미국 CDC 성장 곡선, 같은 나이·성별 기준';

  @override
  String get anPctMore => '전체 비교';

  @override
  String get anNeedsBasis => '나이, 몸무게, 운동량으로 계산했어요';

  @override
  String get anCalcium => '칼슘';

  @override
  String get anVitaminD => '비타민 D';

  @override
  String get anMovement => '움직임';

  @override
  String get anUnitMin => '분';

  @override
  String get anUnitHours => '시간';

  @override
  String get anPerDay => '하루';

  @override
  String get anPerNight => '하룻밤';

  @override
  String get anUnlockScoreTitle => '나의 전체 BeTaller 점수';

  @override
  String get anUnlockScoreBody => '점수와 그 뒤의 지표 9개, 그리고 다음에 할 일까지.';

  @override
  String get anUnlockSourcesTitle => '내 센티미터가 어디서 오는지 보기';

  @override
  String get anUnlockNeedsTitle => '나에게 맞춰 계산한 하루 필요량';

  @override
  String get anUnlockCta => '잠금 해제';

  @override
  String get anFlowResultTitle => '그래프에 저장했어요';

  @override
  String get anFlowResultBody => '예전 키가 이제 내 측정, 가능성과 같은 곡선 위에 있어요.';

  @override
  String get anFlowOpenAnalysis => '분석 열기';

  @override
  String anTopPct(int p) {
    return '상위 $p%';
  }

  @override
  String get anNeedsTitle => '하루 필요량';

  @override
  String get pgUnlockPro => 'Pro로 잠금 해제';

  @override
  String get pgPhotosLockedTitle => '나의 변화를 확인해요';

  @override
  String get pgPhotosLockedBody => '2주마다 키와 함께 사진을 저장하고, 슬라이더로 아무 두 장이나 비교해요.';

  @override
  String get pgTransformationTitle => '나의 변화';

  @override
  String get pgHeightChange => '키 변화';

  @override
  String get pgDaysApart => '일 간격';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '$days일',
    );
    return '$_temp0 간격으로 찍은 두 사진 사이에 $delta 변했어요.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '$days일',
    );
    return '$_temp0 간격, 키는 같아요. 자세와 체형이 먼저 바뀌고, 키는 몇 달에 걸쳐 따라와요.';
  }

  @override
  String get pgModeSlider => '슬라이더';

  @override
  String get pgModeSideBySide => '나란히';

  @override
  String get pgDragToReveal => '끌어서 비교해요';

  @override
  String get pgOnePhotoTitle => '비포 사진이 저장됐어요';

  @override
  String pgOnePhotoBody(String date) {
    return '$date에 같은 자세로 다음 사진을 찍으면 첫 비교를 볼 수 있어요.';
  }

  @override
  String get pgEmptyTitle => '나의 변화를 시작해요';

  @override
  String get pgEmptyBody =>
      '2주마다 한 장, 같은 자세, 같은 장소에서 키와 함께 찍어요. 몇 달 뒤엔 1일 차와 오늘을 슬라이드로 비교할 수 있어요.';

  @override
  String get pgTakeFirstPhoto => '첫 사진 찍기';

  @override
  String get pgPhotoDueNow => '새 사진 찍을 때예요';

  @override
  String pgNextPhotoOn(String date) {
    return '다음 사진 $date';
  }

  @override
  String pgDayN(int n) {
    return '$n일 차';
  }

  @override
  String get pgNewPhoto => '새 사진';

  @override
  String get pgGuideTitle => '매번 같은 자세로';

  @override
  String get pgGuideSubtitle => '같은 방식으로 찍어야 사진 비교가 정확해요.';

  @override
  String get pgGuideGhost => '지난 사진이 흐리게 보여요. 거기에 몸을 맞춰요.';

  @override
  String get pgGuideStep1 => '2 m 떨어져서, 휴대폰은 가슴 높이로';

  @override
  String get pgGuideStep2 => '카메라를 보고, 발은 모으고, 팔은 편하게';

  @override
  String get pgGuideStep3 => '같은 장소, 같은 조명, 몸에 붙는 옷';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => '가슴 높이';

  @override
  String get pgTakePhoto => '사진 찍기';

  @override
  String get pgFromGallery => '갤러리에서 선택';

  @override
  String get pgChoosePhoto => '사진 선택';

  @override
  String get pgPostureTitle => '자세 체크';

  @override
  String get pgPostureLockedTitle => '약한 부분을 찾아요';

  @override
  String get pgPostureLockedBody =>
      '머리, 어깨, 허리 점수를 매기고, 부위마다 운동 2개를 받고, 주별로 점수를 확인해요.';

  @override
  String get pgAreaHead => '머리';

  @override
  String get pgAreaShoulders => '어깨';

  @override
  String get pgAreaLowerBack => '허리';

  @override
  String get pgHeadMeaning0 => '머리가 어깨 바로 위에 있어요. 매일 짧게 리셋하며 유지해요.';

  @override
  String get pgHeadMeaning1 => '힘을 빼면 머리가 앞으로 나와요. 휴대폰을 오래 보면 흔한 일이고, 금방 좋아져요.';

  @override
  String get pgHeadMeaning2 =>
      '머리가 어깨보다 앞에 있어요. 이것부터 고쳐요. 모든 사진에서 키가 작아 보이게 해요.';

  @override
  String get pgShouldersMeaning0 => '어깨가 귀와 일직선이에요. 윗등이 제 역할을 하고 있어요.';

  @override
  String get pgShouldersMeaning1 =>
      '어깨가 살짝 앞으로 나와 있어요. 뭉친 가슴이 당기는 거라 가슴을 열면 돌아와요.';

  @override
  String get pgShouldersMeaning2 => '어깨가 말려 있어요. 윗등이 앞으로 굽어서 서 있는 키가 줄어 보여요.';

  @override
  String get pgLowerBackMeaning0 =>
      '자연스러운 곡선이에요. 골반과 코어가 척추를 제자리에 잘 잡아 주고 있어요.';

  @override
  String get pgLowerBackMeaning1 =>
      '허리가 일자예요. 부드럽게 젖히는 동작과 가동성 운동으로 자연스러운 곡선을 되찾아요.';

  @override
  String get pgLowerBackMeaning2 =>
      '허리가 많이 휘었어요. 뭉친 고관절 굴곡근이 골반을 앞으로 기울여요. 이 근육을 늘리고 코어를 키우면 균형이 잡혀요.';

  @override
  String get pgLegacyMeaning =>
      '이 질문이 없던 예전 버전에서 저장됐어요. 이 부위에 대한 조언을 받으려면 체크를 다시 해요.';

  @override
  String get pgHowItWorks => '체크 방법';

  @override
  String get pgYourPosture => '나의 자세';

  @override
  String pgCheckedOn(String date) {
    return '$date 체크';
  }

  @override
  String get pgOutOf100 => '/ 100점';

  @override
  String get pgAllAreasGood => '세 부위 모두 좋아요. 계속 이대로 유지해요.';

  @override
  String pgStartWith(String area) {
    return '여기부터: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '지난 체크보다 $delta';
  }

  @override
  String get pgStatusGood => '좋음';

  @override
  String get pgStatusFair => '더 좋아질 수 있어요';

  @override
  String get pgStatusFix => '먼저 고치기';

  @override
  String get pgKeepItWith => '유지하는 방법';

  @override
  String get pgFixItWith => '고치는 방법';

  @override
  String get pgRetakeNow => '주간 체크할 시간이에요';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n일 뒤 다음 체크',
      one: '다음 체크는 내일',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue => '같은 벽, 같은 세 가지 질문. 매주 체크하면 운동 효과가 있는지 알 수 있어요.';

  @override
  String pgRetakeBodyWait(String date) {
    return '$date까지 위 운동을 하고, 다시 체크해서 효과를 확인해요.';
  }

  @override
  String get pgRetakeCheck => '다시 체크하기';

  @override
  String get pgRetakeAnyway => '지금 다시 하기';

  @override
  String get pgHistoryTitle => '나의 점수';

  @override
  String pgSinceFirst(String delta) {
    return '첫 체크보다 $delta';
  }

  @override
  String get pgHistoryOne => '첫 체크예요. 7일 뒤에 다시 하면 여기서부터 추세가 시작돼요.';

  @override
  String get pgPostureIntroTitle => '얼마나 바르게 서 있나요?';

  @override
  String get pgPostureIntroBody =>
      '벽에 서서 질문 세 개, 약 1분이면 돼요. 점수와 함께 약한 부위마다 고치는 운동 두 개를 알려 줘요.';

  @override
  String get pgPostureStep1 => '발뒤꿈치, 엉덩이, 날개뼈를 벽에 붙이고 서요.';

  @override
  String get pgPostureStep2 => '나중에 비교할 수 있게 전신이 나오는 옆모습 사진을 찍어요.';

  @override
  String get pgPostureStep3 => '세 질문에 솔직하게 답해요. 점수는 답변으로 계산돼요.';

  @override
  String get pgPostureStep4 => '일주일에 한 번, 같은 시간대에 다시 해요.';

  @override
  String get pgStartCheck => '자세 체크 시작';

  @override
  String pgWeekRange(String start, String end) {
    return '$start ~ $end';
  }

  @override
  String get pgGradeGreat => '챔피언 주간';

  @override
  String get pgGradeGood => '탄탄한 주간';

  @override
  String get pgGradeOk => '시동 거는 중';

  @override
  String get pgGradeStart => '새로운 시작';

  @override
  String get pgTopWeek => '최고의 주';

  @override
  String pgVsLastWeek(String delta) {
    return '지난주보다 $delta';
  }

  @override
  String get pgDaysCompleted => '플랜을 다 끝낸 날';

  @override
  String get pgDayStreak => '일 연속';

  @override
  String pgBestDay(String day) {
    return '최고의 날: $day';
  }

  @override
  String get pgNextWeekFocus => '다음 주 집중 포인트';

  @override
  String pgFocusPlan(int n, int done) {
    return '$n일은 플랜을 다 끝내요. 이번 주에는 $done일 했어요.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return '운동 $n번을 넣어요. 이번 주에는 $done번 했어요.';
  }

  @override
  String get pgFocusMeasure => '아침에 맨발로, 같은 장소에서 키를 한 번 재요. 그래야 진짜 변화가 보여요.';

  @override
  String pgFocusKeepDay(String day) {
    return '목표를 모두 달성했어요. 이제 $day도 꽉 채워 봐요.';
  }

  @override
  String get pgFocusKeep => '모든 목표 달성, 모든 날 완료. 같은 플랜, 같은 리듬으로 가요.';

  @override
  String get pgHeightThisWeek => '이번 주 키';

  @override
  String pgHeightNow(String height) {
    return '현재 $height';
  }

  @override
  String get pgNoMeasurementWeek => '이번 주는 아직 측정이 없어요';

  @override
  String get pgFirstMeasurement => '첫 측정';

  @override
  String pgStartedAt(String height) {
    return '시작 $height';
  }

  @override
  String pgPotentialAt(String height) {
    return '가능성 $height';
  }

  @override
  String pgToPotential(String cm) {
    return '예상 가능성까지 $cm 남았어요.';
  }

  @override
  String get pgPotentialReached => '예상 가능성에 도달했어요. 자세 운동으로 보이는 키를 더 늘릴 수 있어요.';

  @override
  String get pgHabitsToday => '오늘 기록';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '동작 $moves개 · $minutes분';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total 완료';
  }

  @override
  String get plStartWorkout => '운동 시작';

  @override
  String get plContinueWorkout => '운동 계속하기';

  @override
  String get plWorkoutDoneToday => '오늘 운동 완료';

  @override
  String get plTraining => '운동';

  @override
  String get plHabits => '데일리 습관';

  @override
  String get plRestDayNote => '가벼운 날이에요. 짧은 요가로 몸을 풀어 두면 내일이 편해요.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps회';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds초';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds초씩 양쪽';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes분';
  }

  @override
  String plHabitProtein(int grams) {
    return '끼니마다 나눠서 $grams g';
  }

  @override
  String plHabitWater(String liters) {
    return '하루 동안 $liters';
  }

  @override
  String plHabitSleep(String hours) {
    return '오늘 밤 $hours시간';
  }

  @override
  String get plYourRoutines => '나의 루틴';

  @override
  String get plNewRoutine => '새 루틴';

  @override
  String get plCustomEmpty => '나만의 루틴을 만들고 매일 여기서 체크해요.';

  @override
  String plDeleteRoutineQ(String name) {
    return '\"$name\"을(를) 삭제할까요?';
  }

  @override
  String get plHoldToDelete => '루틴을 길게 누르면 삭제할 수 있어요.';

  @override
  String plSetOf(int current, int total) {
    return '$total세트 중 $current세트';
  }

  @override
  String get plRest => '휴식';

  @override
  String get plStartSet => '세트 시작';

  @override
  String get plSetDone => '세트 완료';

  @override
  String get plSkipRest => '휴식 건너뛰기';

  @override
  String get plNextMove => '다음 동작';

  @override
  String get plSkipMove => '건너뛰기';

  @override
  String plUpNext(String name) {
    return '다음: $name';
  }

  @override
  String get plLastMove => '마지막 동작';

  @override
  String get plWorkoutComplete => '운동 완료';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '약 $minutes분 동안 동작 $moves개. 한 번 한 번이 다 쌓여요.';
  }

  @override
  String get plEachSide => '양쪽 각각';

  @override
  String get plMoveDone => '동작 완료';

  @override
  String plRepsBig(int reps) {
    return '$reps회';
  }

  @override
  String get plSessionHint => '내 속도대로 하고, 끝나면 완료를 눌러요.';

  @override
  String plProgramDayOf(int day, int total) {
    return '$total일 중 $day일 차';
  }

  @override
  String get plTodayStep => '오늘의 단계';

  @override
  String get plTickToComplete => '모든 동작을 체크하면 오늘이 완료돼요';

  @override
  String plNextDayTomorrow(int day) {
    return '$day일 차는 내일 열려요. 휴식도 성장의 일부예요.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days일',
      one: '$days일',
    );
    return '레벨 $level까지 $_temp0';
  }

  @override
  String get plProgramFinished => '70일 모두 완료. 프로그램을 끝냈어요.';

  @override
  String plDayCompleteToast(int day) {
    return '$day일 차 완료';
  }

  @override
  String get plLevelWeek => '이번 레벨의 한 주';

  @override
  String get plProgressionTitle => '이렇게 점점 어려워져요';

  @override
  String get plNow => '지금';

  @override
  String plLevelN(int n) {
    return 'LV $n';
  }

  @override
  String get plUnlockProgram => '70일 프로그램 잠금 해제';

  @override
  String get plProgramPitch =>
      '10개 레벨, 일주일에 하나씩. 레벨마다 버티는 시간과 점프 횟수가 늘고, 준비되면 세트도 늘어요.';

  @override
  String plDayLocked(int day) {
    return '먼저 $day일 차를 끝내요';
  }

  @override
  String plCurrentDay(int day) {
    return '$day일 차';
  }

  @override
  String get plTodaysTargets => '오늘의 목표';

  @override
  String get plTargetsBasis => '나이, 몸무게, 운동량으로 계산했어요';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals끼 x $grams g';
  }

  @override
  String get plZinc => '아연';

  @override
  String get plMagnesium => '마그네슘';

  @override
  String get plEnergy => '에너지';

  @override
  String get plChecklist => '오늘의 체크리스트';

  @override
  String plCheckProtein(int grams) {
    return '단백질 $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return '칼슘 $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return '비타민 D $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return '물 $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '체크한 식사에서 $amount';
  }

  @override
  String get plVitaminDNote => '한낮에 팔과 얼굴에 햇볕 15분, 또는 의사가 괜찮다고 한 영양제';

  @override
  String plWaterLogged(String liters) {
    return '지금까지 $liters 기록';
  }

  @override
  String get plMealPlan => '나의 식단';

  @override
  String get plMealPlanSub => '진짜 음식, 진짜 그램, 내 목표에 맞춘 양';

  @override
  String get plSnack => '간식';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '단백질 $protein g · 칼슘 $calcium mg · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return '목표 $grams g';
  }

  @override
  String get plMarkEaten => '먹음으로 표시';

  @override
  String get plEaten => '먹음';

  @override
  String get plPlanTotal => '하루 합계';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return '이 식사로 $kcal kcal 중 약 $planKcal를 채워요. 나머지는 과일, 채소, 빵이나 밥으로 채워요.';
  }

  @override
  String get plWeeklyMenu => '주간 메뉴';

  @override
  String get plWeeklyMenuSub => '매일 다른 메뉴, 같은 목표';

  @override
  String get plUnlockMenu => '주간 메뉴 전체 잠금 해제';

  @override
  String get plRecipes => '레시피';

  @override
  String get plRecipesSub => '빠르게 만드는 고단백 요리';

  @override
  String get plNutritionGuide => '영양 가이드';

  @override
  String get plNutritionGuideSub => '영양소, 음식, 영양제';

  @override
  String plPieces(int n) {
    return '$n개';
  }

  @override
  String get plFoodOats => '귀리';

  @override
  String get plFoodMilk => '우유';

  @override
  String get plFoodBanana => '바나나';

  @override
  String get plFoodWalnuts => '호두';

  @override
  String get plFoodGreekYogurt => '그릭 요거트';

  @override
  String get plFoodYogurt => '요거트';

  @override
  String get plFoodEggs => '달걀';

  @override
  String get plFoodBread => '통밀빵';

  @override
  String get plFoodWhiteCheese => '페타 치즈';

  @override
  String get plFoodHardCheese => '체다 치즈';

  @override
  String get plFoodSalad => '토마토 오이 샐러드';

  @override
  String get plFoodOrange => '오렌지';

  @override
  String get plFoodPeanutButter => '땅콩버터';

  @override
  String get plFoodSpinach => '시금치';

  @override
  String get plFoodCottageCheese => '코티지 치즈';

  @override
  String get plFoodChicken => '닭가슴살';

  @override
  String get plFoodBulgur => '불구르';

  @override
  String get plFoodAyran => '아이란 (요거트 음료)';

  @override
  String get plFoodTuna => '참치 (통조림)';

  @override
  String get plFoodPasta => '파스타';

  @override
  String get plFoodBeef => '기름기 적은 소고기';

  @override
  String get plFoodRice => '쌀밥';

  @override
  String get plFoodChickpeas => '병아리콩';

  @override
  String get plFoodSalmon => '연어';

  @override
  String get plFoodBroccoli => '브로콜리';

  @override
  String get plFoodPotato => '감자';

  @override
  String get plFoodLentils => '렌틸콩';

  @override
  String get plFoodSardines => '정어리';

  @override
  String get plFoodAlmonds => '아몬드';

  @override
  String get plFoodKefir => '케피어';

  @override
  String get plFoodPumpkinSeeds => '호박씨';

  @override
  String get wtCoffee => '커피';

  @override
  String get wtTea => '차';

  @override
  String get wtCola => '콜라';

  @override
  String get wtEnergyDrink => '에너지 음료';

  @override
  String get crCustomBadge => '직접 만듦';

  @override
  String get crNameHint => '예: 아침 파워 스트레칭';

  @override
  String get crDoseHint => '예: 10회 x 3세트 또는 30초 x 3세트';

  @override
  String get paywallLifetime => '평생';

  @override
  String paywallOnce(String price) {
    return '$price 한 번 결제';
  }

  @override
  String get paywallLifetimeBadge => '구독 없음';

  @override
  String get paywallLifetimeDisclaimer => '한 번 결제 · 구독 없음, 자동 갱신 없음';

  @override
  String get pwSlidePotentialTitle => '내 가능성 확인하기';

  @override
  String get pwSlidePotentialCaption => '나이, 내 키, 부모님 키로 계산해요.';

  @override
  String get pwSlideTodayTitle => '매일을 위한 플랜';

  @override
  String get pwSlideTodayCaption => '영상 가이드가 있는 짧은 데일리 운동.';

  @override
  String get pwSlideProgramTitle => '70일, 10개 레벨';

  @override
  String get pwSlideProgramCaption => '매주 동작이 조금씩 어려워져요.';

  @override
  String get pwSlideNutritionTitle => '성장을 위한 식사';

  @override
  String get pwSlideNutritionCaption => '나에게 맞춘 하루 단백질, 칼슘, 비타민 D 목표.';

  @override
  String get pwSlideChartTitle => '곡선이 올라가는 걸 지켜봐요';

  @override
  String get pwSlideChartCaption => '측정할 때마다 내 가능성으로 가는 길 위에 표시돼요.';

  @override
  String get pwSlideScoreTitle => '습관을 하나의 점수로';

  @override
  String get pwSlideScoreCaption => '어떤 습관부터 고칠지 알려 줘요.';

  @override
  String get pwSlidePostureTitle => '오늘부터 더 바르게';

  @override
  String get pwSlidePostureCaption => '빠른 자세 체크와 고치는 동작까지.';

  @override
  String get pwExample => '예시';

  @override
  String pwYouLine(String now, String potential) {
    return '나: $now → 가능성 $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return '예시: $now → 가능성 $potential';
  }

  @override
  String get tv3NewEyebrow => '새로워진 점';

  @override
  String get tv3NewTitle => 'BeTaller가 크게 업데이트됐어요';

  @override
  String get tv3NewDesc => '새 플랜, 새 프로그램, 새 디자인. 무엇이 바뀌었는지 볼까요.';

  @override
  String get tv3PotentialTitle => '이게 나의 가능성이에요';

  @override
  String get tv3PotentialDesc => '지금 내 키와 닿을 수 있는 키를 나란히. 플랜이 그 차이를 좁혀요.';

  @override
  String get tv3TodayTitle => '오늘의 플랜';

  @override
  String tv3TodayDesc(String button) {
    return '오늘을 위한 짧은 운동이에요. $button을 누르고 따라 해요.';
  }

  @override
  String get tv3ProgramTitle => '70일 꾸준함 프로그램';

  @override
  String get tv3ProgramDesc => '10개 레벨에 걸쳐 하루 한 단계. 매일이 전날 위에 쌓여요.';

  @override
  String get tv3NutritionTitle => '하루 목표량';

  @override
  String get tv3NutritionDesc => '단백질, 칼슘, 비타민 D, 물을 내 몸에 맞춰 계산했어요.';

  @override
  String get tv3ChartTitle => '내 곡선 지켜보기';

  @override
  String get tv3ChartDesc => '1-2주마다 측정하고 선이 내 가능성을 향해 올라가는 걸 봐요.';

  @override
  String get tv3ScoreTitle => '나의 BeTaller 점수';

  @override
  String get tv3ScoreDesc => '내가 얼마나 잘하고 있는지 하나의 숫자로. 가장 약한 부분부터 올려요.';

  @override
  String get tv3Next => '다음';

  @override
  String get tv3ShowMe => '보여 줘요';

  @override
  String get tv3Done => '시작해요';

  @override
  String get obWhyTitle => '왜 키가 더 크고 싶어요?';

  @override
  String get obWhySubtitle => '해당하는 걸 모두 골라요. 플랜은 나의 이유에서 시작해요.';

  @override
  String get obWhyConfidence => '더 자신감 있고 싶어요';

  @override
  String get obWhyImpression => '첫인상을 더 강하게';

  @override
  String get obWhySports => '운동을 더 잘하고 싶어요';

  @override
  String get obWhyClothes => '옷 핏이 더 좋게';

  @override
  String get obWhyPhotos => '사진이 더 잘 나오게';

  @override
  String get obWhyPotential => '내 가능성이 궁금할 뿐이에요';

  @override
  String get obTriedTitle => '다른 키 성장 앱을 써 봤어요?';

  @override
  String get obTriedSubtitle => '정답은 없어요. 여기서 뭐가 다른지 보여 드리는 데 도움이 돼요.';

  @override
  String get obTriedStopped => '네, 근데 그만뒀어요';

  @override
  String get obTriedStill => '네, 지금도 쓰고 있어요';

  @override
  String get obTriedFirst => '아니요, 처음이에요';

  @override
  String get obTriedStoppedTitle => '숫자 하나로는 계속하기 어려워요';

  @override
  String get obTriedStoppedBody =>
      '대부분의 앱은 숫자만 알려 줘요. BeTaller는 그 숫자를 체크할 수 있는 데일리 플랜으로 바꾸고, 내가 정한 시간에 알림도 줘요.';

  @override
  String get obTriedStillTitle => '잘 맞는 건 그대로 써요';

  @override
  String get obTriedStillBody =>
      'BeTaller는 매일의 실천을 더해요. 내 답변으로 만든 플랜을 한 단계씩 체크해요.';

  @override
  String get obTriedFirstTitle => '시작하기 딱 좋은 곳이에요';

  @override
  String get obTriedFirstBody =>
      '여기선 숫자만 받고 끝나지 않아요. BeTaller가 내 답변을 체크할 수 있는 데일리 플랜으로 바꿔 줘요.';

  @override
  String get obTriedCardTitle => '매일 체크하는 것';

  @override
  String get obTriedItem1 => '이번 주에 맞춰 고른 짧은 운동';

  @override
  String get obTriedItem2 => '나의 단백질 목표';

  @override
  String get obTriedItem3 => '제시간에 불 끄기';

  @override
  String get obBlockTitle => '무엇이 방해가 돼요?';

  @override
  String get obBlockSubtitle => '해당하는 걸 모두 골라요. 플랜이 그에 맞춰 움직여요.';

  @override
  String get obBlockForget => '자꾸 잊어요';

  @override
  String get obBlockTime => '시간이 부족해요';

  @override
  String get obBlockExercises => '어떤 운동을 할지 몰라요';

  @override
  String get obBlockMotivation => '의욕이 떨어져요';

  @override
  String get obBlockBedtime => '늦게 자요';

  @override
  String get obBlockMeals => '끼니를 걸러요';

  @override
  String get obFirstTitle => '키가 크면 제일 먼저 뭐 할 거예요?';

  @override
  String get obFirstSubtitle => '상상해 봐요. 그게 내가 향하는 목표예요.';

  @override
  String get obFirstWardrobe => '옷장 새로 채우기';

  @override
  String get obFirstMuscle => '근육 키우기';

  @override
  String get obFirstPhotos => '사진 더 많이 올리기';

  @override
  String get obFirstTeam => '운동부 테스트 보기';

  @override
  String get obFirstFeelGood => '특별한 건 없고, 그냥 기분 좋게';

  @override
  String get obBuiltChip => '나를 위해 만듦';

  @override
  String get obBuiltTitle => '나에게 맞춰 만든 플랜';

  @override
  String get obBuiltReason => '나의 이유';

  @override
  String get obBuiltGoal => '목표';

  @override
  String get obBuiltWhen => '목표에 닿으면';

  @override
  String get obBuiltBlockers => '방해 요소, 이렇게 해결해요';

  @override
  String get obFixForget => '내가 고른 시간에 알림';

  @override
  String get obFixTime => '짧은 운동, 대부분 15분 안팎';

  @override
  String get obFixExercises => '영상으로 한 단계씩 따라 하는 동작';

  @override
  String get obFixMotivation => '계속하게 만드는 연속 기록과 레벨';

  @override
  String get obFixBedtime => '수면 목표와 취침 알림';

  @override
  String get obFixMeals => '단백질 목표와 식단';

  @override
  String get obNotifTitle => '필요한 순간에 BeTaller가 알려 줘요';

  @override
  String get obNotifSubtitle => '알려 준 시간에 맞춰 뒀어요. 언제든 바꿀 수 있어요.';

  @override
  String get obNotifWorkout => '운동';

  @override
  String obNotifWorkoutDetail(String time) {
    return '$time 운동 30분 전';
  }

  @override
  String get obNotifMeal => '식사와 단백질';

  @override
  String obNotifMealDetail(String time) {
    return '$time 식사 때';
  }

  @override
  String get obNotifWater => '물';

  @override
  String get obNotifWaterDetail => '오후에 물 한 잔 쉬는 시간';

  @override
  String get obNotifSleep => '잠들 준비';

  @override
  String obNotifSleepDetail(String time) {
    return '$time 취침 1시간 전';
  }

  @override
  String get obNotifAllow => '알림 켜기';

  @override
  String get obNotifNotNow => '나중에';

  @override
  String get obNotifNow => '지금';

  @override
  String get ftOneFree => '1회 무료';

  @override
  String get ftFreeToday => '오늘 무료';

  @override
  String get ftContinuePro => 'Pro로 계속하기';

  @override
  String get ftNotNow => '나중에';

  @override
  String get ftOutWorkoutTitle => '무료 운동을 사용했어요';

  @override
  String get ftOutWorkoutBody => 'Pro로 연속 기록을 이어가요. 매일 가이드 운동, 동작마다 시간도 맞춰 줘요.';

  @override
  String get ftOutDayTitle => '무료 첫날이 끝났어요';

  @override
  String get ftOutDayBody =>
      '플랜, 목표, 진행 상황은 여기서 계속 볼 수 있어요. Pro로 연속 기록을 이어가요. 매일 플랜을 체크하고 물과 수면을 기록해요.';

  @override
  String get ftOutPostureTitle => '무료 자세 체크를 사용했어요';

  @override
  String get ftOutPostureBody =>
      '결과는 여기 남아 있어요. Pro로 매주 다시 체크하고 자세가 좋아지는 걸 지켜봐요.';

  @override
  String get ftOutPhotosTitle => '무료 사진 비교를 사용했어요';

  @override
  String get ftOutPhotosBody =>
      '그 비교는 계속 볼 수 있어요. Pro로 사진을 더 추가하고 아무 두 장이나 비교해요.';

  @override
  String get ftOutReportTitle => '무료 주간 리포트를 사용했어요';

  @override
  String get ftOutReportBody =>
      'Pro로 매주 전체 리포트를 받아요. 하루별 점수, 목표, 그리고 개선할 한 가지.';

  @override
  String get ftOutScoreTitle => '무료 점수 분석을 봤어요';

  @override
  String get ftOutScoreBody =>
      '점수는 화면에 남아 있어요. Pro로 매일 점수를 만드는 요소와 다음에 할 일을 확인해요.';

  @override
  String get ftOutArticleTitle => '무료 글을 읽었어요';

  @override
  String get ftOutArticleBody => '그 글은 계속 열어 볼 수 있어요. Pro로 전체 라이브러리를 읽어요.';

  @override
  String get ftWhyWorkout => '가이드 운동은 Pro 기능이에요';

  @override
  String get ftWhyPlan => '플랜 체크는 Pro 기능이에요';

  @override
  String get ftWhyProgram => '70일 프로그램은 Pro 기능이에요';

  @override
  String get ftWhyWater => '매일 물 기록은 Pro 기능이에요';

  @override
  String get ftWhySleep => '매일 수면 기록은 Pro 기능이에요';

  @override
  String get ftWhyNutrition => '하루 영양 플랜은 Pro 기능이에요';

  @override
  String get ftWhyPosture => '주간 자세 체크는 Pro 기능이에요';

  @override
  String get ftWhyPhotos => '사진 비교는 Pro 기능이에요';

  @override
  String get ftWhyReport => '주간 리포트는 Pro 기능이에요';

  @override
  String get ftWhyScore => '점수 분석은 Pro 기능이에요';

  @override
  String get ftWhyArticle => '전체 라이브러리는 Pro 기능이에요';

  @override
  String get ftPlanLocked => '플랜은 여기서 볼 수 있어요. 체크하는 건 Pro 기능이에요.';

  @override
  String get ftNutritionLocked => '목표와 식사는 여기서 볼 수 있어요. 체크하는 건 Pro 기능이에요.';

  @override
  String get ftPreviewTag => '미리 보기';

  @override
  String get ftPreviewTitle => '미리 보기가 끝났어요';

  @override
  String get ftPreviewBody => '이 운동의 나머지는 Pro 기능이에요. 다음에 이어지는 동작:';

  @override
  String get ftFreeWorkoutUsed => '무료 가이드 운동이었어요. Pro로 매일 계속 받아요.';

  @override
  String get ftScoreLockedTitle => '내 점수를 만드는 것';

  @override
  String get ftScoreLockedBody => '점수의 모든 항목, 무엇을 기준으로 하는지, 그리고 다음에 할 한 가지.';

  @override
  String get ftReportLockedTitle => '나의 한 주 전체';

  @override
  String get ftReportLockedBody => '플랜 대비 하루별 점수, 목표, 키, 그리고 다음 주 집중 포인트 하나.';

  @override
  String get ftPhotosLockedTitle => '이 두 장 비교하기';

  @override
  String get ftPhotosLockedBody =>
      '무료 비교를 사용했어요. Pro로 아무 두 장이나 슬라이드로 비교할 수 있어요.';

  @override
  String get ftArticleFreeLine => '첫 글은 무료예요. 읽고 싶은 걸 골라요.';

  @override
  String get plFinishWorkout => '끝내기';

  @override
  String get obTriedMostApps => '대부분의 앱';

  @override
  String get obTriedThatsIt => '숫자 하나, 그게 끝.';

  @override
  String get obTriedPlanLabel => 'BeTaller에서의 하루';

  @override
  String get obTriedProteinSub => '끼니마다 나눠서';

  @override
  String get obTriedSleepSub => '자기 전 알림';

  @override
  String get obTriedFeatVideo => '영상 가이드 동작';

  @override
  String get obTriedFeatReminders => '내가 정한 시간에 알림';

  @override
  String get obTriedFeatStreaks => '연속 기록과 레벨';

  @override
  String get obBedtimeUnknown => '잘 모르겠어요, 그때그때 달라요';

  @override
  String obBedtimeUnknownHint(String time) {
    return '내 나이에 필요한 수면 시간을 바탕으로 $time을 추천해요. 언제든 바꿀 수 있어요.';
  }

  @override
  String get obWorkoutTimeUnknown => '잘 모르겠어요, 정해진 시간이 없어요';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return '일단 $time로 해 둘게요. 언제든 바꿀 수 있어요.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return '추천: $time쯤 취침. 언제든 바꿀 수 있어요.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return '추천: $time쯤 운동. 언제든 바꿀 수 있어요.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      '알려 준 시간에 맞추고, 잘 모르는 부분은 추천으로 채웠어요. 언제든 바꿀 수 있어요.';

  @override
  String get plFoodBrownRice => '현미밥';

  @override
  String get unitHeightTitle => '키 단위';

  @override
  String get unitWeightTitle => '몸무게 단위';

  @override
  String get unitWaterTitle => '물 단위';

  @override
  String get unitOptCm => '센티미터';

  @override
  String get unitOptFtIn => '피트와 인치';

  @override
  String get unitOptKg => '킬로그램';

  @override
  String get unitOptLb => '파운드';

  @override
  String get unitOptStLb => '스톤과 파운드';

  @override
  String get unitOptLiters => '리터';

  @override
  String get unitOptFlOz => '액량 온스';

  @override
  String achieveGrowthImp(String amount) {
    return '$amount 성장';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return '총 $amount 성장 기록';
  }

  @override
  String get postureBenefitIn =>
      '머리, 어깨, 허리를 체크해요. 바르게 서면 원래 키가 약 1 in 더 드러나요.';

  @override
  String get notifPostureBodyIn => '등은 곧게, 어깨는 뒤로. 바른 자세 = 약 1 in 차이!';

  @override
  String get painPostureDescIn =>
      '바른 자세만으로 바로 약 1 in까지 늘어 보일 수 있어요. BeTaller의 데일리 자세 루틴으로 몇 주 만에 몸에 익혀요.';

  @override
  String get routinePostureDescIn =>
      '등은 곧게, 어깨는 뒤로. 한 시간마다 체크해요. 바른 자세 = 약 1 in 차이.';

  @override
  String get sciPostureCheckIn =>
      '자세를 바로 잡으면 겉보기 키가 바로 약 1 in 커지고 척추 압박도 막아 줘요';

  @override
  String get routineProteinDescLb =>
      '달걀, 닭고기, 생선, 유제품. 매일 몸무게 1 lb당 최소 0.7 g 단백질.';

  @override
  String pwPersonalTitle(String height) {
    return '$height에 닿기 위한 플랜이 준비됐어요';
  }

  @override
  String get pwPersonalEstimate => '답변으로 추정한 가능성이에요. 보장은 아니에요';

  @override
  String pwPersonalReason(String reason) {
    return '나의 이유: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return '$time 취침 전 긴장 풀기 알림';
  }

  @override
  String get obParentUnknown => '모르겠어요';

  @override
  String get obParentUnknownHint =>
      '대신 성인 평균 키를 사용할게요. 정확도는 떨어지고, 프로필에서 언제든 추가할 수 있어요.';

  @override
  String get obEthnicityWhy => '모르는 부모님 키를 추정할 때만 사용해요.';

  @override
  String get resultNoParentNote =>
      '부모님 한 분의 키 없이 추정해서 정확도가 떨어져요. 프로필에서 언제든 추가해요.';

  @override
  String get resultNoParentsNote => '부모님 키 없이 추정해서 정확도가 떨어져요. 프로필에서 언제든 추가해요.';

  @override
  String get resultFootnoteEstimated =>
      '성장 곡선 데이터와 성인 평균 키로 계산한 추정치예요. 의학적 조언이 아니에요.';

  @override
  String get obBudgetChip => '합리적인 가격';

  @override
  String get obBudgetTitle => 'BeTaller는 크고 싶은 모든 10대를 위한 가격이에요';

  @override
  String get obBudgetDesc => '키가 돈이 얼마나 있느냐에 달려선 안 되니까요. 그래서 가격을 나라마다 따로 정했어요.';

  @override
  String obBudgetWeek(String price) {
    return '이곳의 Pro 일주일: $price';
  }

  @override
  String get obBudgetLocalTitle => '우리나라에 맞춘 가격';

  @override
  String get obBudgetLocalDesc => '미국 달러를 환산한 게 아니라, 내가 사는 곳의 생활비에 맞춰 정했어요.';

  @override
  String get obBudgetWeekTitle => '딱 일주일부터 시작';

  @override
  String get obBudgetWeekDesc => '처음부터 큰돈 낼 필요 없어요. Apple ID 설정에서 언제든 해지해요.';

  @override
  String get obBudgetAllTitle => '하나의 플랜에 모두';

  @override
  String get obBudgetAllDesc => '운동, 수면, 영양, 자세, 진행 리포트까지.';

  @override
  String get obRateTitle => 'BeTaller는 진짜 도움이 되려고 만들었어요';

  @override
  String get obRateDesc => '세심한 관심과 솔직함이 마음에 들었다면, 평가를 남겨 주면 정말 기쁠 거예요.';

  @override
  String get obRateCta => 'BeTaller 평가하기';

  @override
  String get obRateLater => '나중에';
}
