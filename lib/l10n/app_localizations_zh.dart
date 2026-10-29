// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get navHome => '首页';

  @override
  String get navAnalysis => '分析';

  @override
  String get navRoutines => '我的计划';

  @override
  String get disciplineTitle => '自律';

  @override
  String get disciplineProgramTitle => '自律计划';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total 天';
  }

  @override
  String get disciplineCompleteDay => '完成今天';

  @override
  String disciplineDayN(int n) {
    return '第 $n 天';
  }

  @override
  String get disciplineLevels => '等级';

  @override
  String get disciplineLevelDone => '已完成';

  @override
  String get disciplineLocked => '未解锁';

  @override
  String get disciplineTodayIs => '今天';

  @override
  String get disciplineToday => '今天';

  @override
  String get disciplineTodayPlan => '今日计划';

  @override
  String get disciplineWeek => '本周';

  @override
  String get disciplineMonth => '本月';

  @override
  String get disciplineLevel => '自律等级';

  @override
  String disciplineStreakDays(int days) {
    return '连续 $days 天';
  }

  @override
  String disciplineToNext(int days) {
    return '再坚持 $days 天升级';
  }

  @override
  String get disciplineMaxTier => '已达最高等级';

  @override
  String get disciplineTierSpark => '火花';

  @override
  String get disciplineTierSteady => '稳定';

  @override
  String get disciplineTierSharp => '敏锐';

  @override
  String get disciplineTierSolid => '坚实';

  @override
  String get disciplineTierRelentless => '不懈';

  @override
  String get disciplineTierUnbroken => '不断';

  @override
  String get disciplineTierLegend => '传奇';

  @override
  String get goalPerfectDays => '完成计划的天数';

  @override
  String get goalWorkouts => '训练次数';

  @override
  String get goalMeasurement => '身高测量';

  @override
  String get goalPhoto => '进度照片';

  @override
  String get goalPostureCheck => '体态检查';

  @override
  String get disciplineAllDone => '今天已完成';

  @override
  String disciplineDayProgress(int done, int total) {
    return '已完成 $done/$total';
  }

  @override
  String get navProgress => '进度';

  @override
  String get trackingSection => '你的追踪工具';

  @override
  String get photosBenefit => '前后对比照并排放，变化一眼就能看到。';

  @override
  String get postureBenefit => '头部、肩膀和下背部。站直能多展现 2-3 cm 你的真实身高。';

  @override
  String get reportBenefit => '逐天给你的一周打分，看看哪天松懈了。';

  @override
  String get photosCta => '添加照片';

  @override
  String get postureCta => '分析';

  @override
  String get reportCta => '查看报告';

  @override
  String get toolStateReady => '就绪';

  @override
  String get photosSummaryEmpty => '添加第一张照片';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 张照片',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => '还没有分析';

  @override
  String postureSummaryScore(int score) {
    return '体态 $score/100';
  }

  @override
  String get navProfile => '我的';

  @override
  String greeting(String name) {
    return '你好，$name';
  }

  @override
  String get currentHeight => '当前身高';

  @override
  String get target => '目标';

  @override
  String completed(String pct) {
    return '已完成 $pct%';
  }

  @override
  String remaining(String cm, String unit) {
    return '还差 +$cm $unit';
  }

  @override
  String get updateAnalysis => '更新分析';

  @override
  String get analysisSubtitle => '根据过往身高和习惯获取预测';

  @override
  String get dailyRoutines => '每日任务';

  @override
  String get allRoutinesDone => '所有任务已完成！';

  @override
  String get water => '喝水';

  @override
  String get sleep => '睡眠';

  @override
  String get growthSummary => '成长概览';

  @override
  String get total => '总计';

  @override
  String get last => '最近';

  @override
  String get measurement => '测量';

  @override
  String get dailyTip => '今日小贴士';

  @override
  String get waterTracking => '喝水记录';

  @override
  String get waterGoalReached => '已达成今日目标';

  @override
  String waterRemaining(String amount) {
    return '还差 $amount';
  }

  @override
  String get undo => '撤销';

  @override
  String waterToday(String amount) {
    return '今天：$amount L';
  }

  @override
  String get sleepTracking => '睡眠记录';

  @override
  String sleepTarget(String hours) {
    return '目标：$hours 小时';
  }

  @override
  String get hours => '小时';

  @override
  String get save => '保存';

  @override
  String get cancel => '取消';

  @override
  String get analysis => '分析';

  @override
  String get betallerScore => 'BeTaller 分数';

  @override
  String get genetic => '遗传';

  @override
  String get growth => '成长';

  @override
  String get nutrition => '营养';

  @override
  String get sleepLabel => '睡眠';

  @override
  String get discipline => '自律';

  @override
  String get improveScore => '提升你的分数';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => '营养严重不足！';

  @override
  String get nutritionStrengthen => '加强营养';

  @override
  String get sleepRecordAdd => '添加睡眠记录';

  @override
  String get sleepPoor => '作息不规律';

  @override
  String get sleepImprove => '改善睡眠';

  @override
  String get startToday => '今天就开始！';

  @override
  String routinesRemaining(int count) {
    return '还剩 $count 项任务';
  }

  @override
  String get keepStreak => '保持连续打卡';

  @override
  String get addFirstMeasurement => '添加第一次测量';

  @override
  String get addMeasurement => '添加测量';

  @override
  String waterHalfNotReached(String amount) {
    return '今天喝水还没到目标的一半，再喝 ${amount}L 吧。';
  }

  @override
  String waterAlmostDone(String amount) {
    return '离喝水目标还差 ${amount}L，快达成了！';
  }

  @override
  String bmiLow(String bmi) {
    return '你的 BMI 是 $bmi，有点偏低。多吃点蛋白质，增加热量摄入。';
  }

  @override
  String get bodyFactsTitle => '你的身体';

  @override
  String get dailyNeedsTitle => '你的每日目标';

  @override
  String bmiHigh(String bmi) {
    return '你的 BMI 是 $bmi，有点偏高。注意健康饮食。';
  }

  @override
  String get nutritionDefault => '完成喝水目标，保持均衡饮食。';

  @override
  String sleepNoRecord(String hours) {
    return '今天还没有睡眠记录。目标睡 $hours 小时，记得记录。';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return '你今天睡了 $current 小时，还差 $missing 小时。早点睡吧！';
  }

  @override
  String sleepAlmost(String hours) {
    return '快达标了。睡够 $hours 小时，生长激素分泌最充分。';
  }

  @override
  String get sleepGood => '作息很棒！继续保持。';

  @override
  String noRoutinesDone(int total) {
    return '今天还没完成任务。从 $total 项中挑一项开始吧！';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '今天已完成 $done/$total 项任务，还剩 $left 项！';
  }

  @override
  String streakBuilding(int needed) {
    return '今天表现很棒！再坚持 $needed 天就能开启连续打卡。';
  }

  @override
  String streakContinue(int days) {
    return '已连续 $days 天！坚持下去，分数会继续上涨。';
  }

  @override
  String get noMeasurements => '还没有身高记录。添加第一次测量，预测会更准确。';

  @override
  String fewMeasurements(int count) {
    return '再添加 $count 次测量，就能计算成长速度。';
  }

  @override
  String goodMeasurements(int count) {
    return '你已有 $count 次测量。达到 5 次，准确度会大幅提升。';
  }

  @override
  String get keepMeasuring => '继续添加测量。每一个新数据都会让预测更准。';

  @override
  String get heightPrediction => '身高预测';

  @override
  String get predictedHeightAt21 => '21 岁时预测身高';

  @override
  String get predictionMethod => '结合遗传（父母身高）、成长速度、BMI 和年龄数据计算得出。';

  @override
  String get growthStatus => '成长状态';

  @override
  String get growthRemaining => '未来还能长';

  @override
  String get growthBreakdown => '这些厘米从哪里来';

  @override
  String get geneticGainLabel => '遗传增长';

  @override
  String get lifestyleLabel => '生活方式';

  @override
  String get geneticCeilingLabel => '上限';

  @override
  String get reachableTargetHeight => '你可达到的目标身高';

  @override
  String get geneticCeilingProgress => '距遗传上限的进度';

  @override
  String get completionLabel => '完成度';

  @override
  String get growthVelocity => '成长速度';

  @override
  String get noData => '暂无数据';

  @override
  String growthRate(String rating) {
    return '成长速度：$rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => '热量';

  @override
  String get kcalDay => 'kcal/天';

  @override
  String get daily => '每天';

  @override
  String get protein => '蛋白质';

  @override
  String get minimum => '最少';

  @override
  String get age => '年龄';

  @override
  String get male => '男';

  @override
  String get female => '女';

  @override
  String get yearlyPrediction => '逐年预测';

  @override
  String ageYear(int age) {
    return '$age 岁';
  }

  @override
  String get progressTitle => '进度追踪';

  @override
  String get totalGrowth => '总计';

  @override
  String get lastDiff => '上次变化';

  @override
  String get measurementCount => '测量';

  @override
  String get heightChart => '身高曲线';

  @override
  String get chartMinData => '至少需要 2 次测量才能生成曲线';

  @override
  String get chartInstruction => '添加测量，查看你的进度曲线！';

  @override
  String get addMeasurementButton => '添加新测量';

  @override
  String get measurementHistory => '测量记录';

  @override
  String get deleteTitle => '删除测量';

  @override
  String get deleteMessage => '确定要删除这条测量记录吗？';

  @override
  String get dismiss => '取消';

  @override
  String get delete => '删除';

  @override
  String get newMeasurement => '新的身高测量';

  @override
  String get routines => '任务';

  @override
  String streakDays(int days) {
    return '$days 天';
  }

  @override
  String get progressStatus => '进度状态';

  @override
  String get completedLabel => '已完成！';

  @override
  String get all => '全部';

  @override
  String get exercise => '运动';

  @override
  String get posture => '体态';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '最佳：$_temp0';
  }

  @override
  String get editProfile => '编辑资料';

  @override
  String get editProfileSubtitle => '更新身高、体重、年龄信息';

  @override
  String get name => '名字';

  @override
  String birthDate(String date) {
    return '生日：$date';
  }

  @override
  String get heightCm => '身高 (cm)';

  @override
  String get weightKg => '体重 (kg)';

  @override
  String get fatherHeight => '爸爸的身高 (cm)';

  @override
  String get motherHeight => '妈妈的身高 (cm)';

  @override
  String get notifications => '通知';

  @override
  String get reminderNextLabel => '下次提醒';

  @override
  String get reminderManageHint => '管理你的提醒';

  @override
  String get reminderOffCta => '开启通知';

  @override
  String get stateOn => '开';

  @override
  String get stateOff => '关';

  @override
  String get reminderMasterTitle => '通知';

  @override
  String reminderActiveCount(int count) {
    return '已开启 $count 个提醒';
  }

  @override
  String get reminderBuiltIn => '内置提醒';

  @override
  String get reminderYourOwn => '自定义提醒';

  @override
  String get reminderAdd => '添加提醒';

  @override
  String get reminderDays => '日期';

  @override
  String get reminderEveryDay => '每天';

  @override
  String get reminderLabelHint => '要提醒你做什么？';

  @override
  String get reminderEmptyHint => '添加你自己的提醒：训练、维生素、拉伸，想加什么都行。';

  @override
  String get reminderCustom => '提醒';

  @override
  String get reminderCustomBody => '你设定的时间到了。';

  @override
  String get reminderExercise => '运动';

  @override
  String get reminderNutrition => '营养';

  @override
  String get reminderWater => '喝水';

  @override
  String get reminderPosture => '体态';

  @override
  String get reminderRoutine => '每日任务';

  @override
  String get reminderSleep => '睡眠';

  @override
  String get reminderMeasurement => '身高测量';

  @override
  String get notificationsOn => '提醒已开启';

  @override
  String get notificationsOff => '提醒已关闭';

  @override
  String get premium => '升级高级版';

  @override
  String get premiumSubtitle => '解锁全部功能';

  @override
  String get rateUs => '给我们评分';

  @override
  String get rateSubtitle => '喜欢这个 App 吗？给我们 5 星吧！';

  @override
  String get share => '分享 App';

  @override
  String get shareSubtitle => '把 BeTaller 推荐给朋友';

  @override
  String get shareText =>
      '我用 BeTaller 发现了自己的长高潜力！你也来试试：https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => '意见反馈';

  @override
  String get feedbackSubtitle => '联系我们';

  @override
  String get resetData => '重置所有数据';

  @override
  String get resetSubtitle => '所有数据都将被删除';

  @override
  String get resetTitle => '重置数据';

  @override
  String get resetMessage => '所有数据都将被删除，并返回引导页面。此操作无法撤销！';

  @override
  String get reset => '重置';

  @override
  String get premiumSoon => '高级版即将推出！';

  @override
  String get brandingSubtitle => '发现你的长高潜力';

  @override
  String get statistics => '统计';

  @override
  String get profileGroupSupport => '支持';

  @override
  String get profileGroupAccount => '账户';

  @override
  String get profileGroupApp => 'App';

  @override
  String get profileGroupDanger => '危险操作';

  @override
  String profileMemberSince(String date) {
    return '自 $date 起';
  }

  @override
  String get profileYourJourney => '你的旅程';

  @override
  String get profileTotalGrowth => '总计';

  @override
  String get currentStreak => '当前连续';

  @override
  String get bestStreakLabel => '最佳连续';

  @override
  String get achievementLabel => '成就';

  @override
  String get achievements => '成就';

  @override
  String get achievementUnlockedTitle => '🏆 成就已解锁！';

  @override
  String get reminderTapHint => '点一下即可修改时间和日期';

  @override
  String get earned => '已获得！';

  @override
  String get notEarned => '尚未获得';

  @override
  String get ok => '好的';

  @override
  String get language => '语言';

  @override
  String get languageSubtitle => '更改 App 语言';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => '发现你的长高潜力';

  @override
  String get onboardingMeetYou => '先来认识一下你';

  @override
  String get onboardingInfoNeeded => '分析需要一些基本信息。';

  @override
  String get gender => '性别';

  @override
  String get birthDateLabel => '出生日期';

  @override
  String get bodyMeasurements => '身体数据';

  @override
  String get bodyInfo => '分析需要你当前的身高和体重。';

  @override
  String get geneticData => '遗传数据';

  @override
  String get geneticInfo => '父母的身高决定你的遗传潜力。';

  @override
  String get pastHeights => '过往身高';

  @override
  String get pastHeightsInfo => '填写你记得的不同年龄时的身高，可以留空。';

  @override
  String get heightHint => '输入身高...';

  @override
  String get ageLabel => '岁';

  @override
  String get habits => '你的习惯';

  @override
  String get habitsInfo => '你的生活方式会直接影响预测结果。';

  @override
  String get weeklyExercise => '每周运动';

  @override
  String get dailySleep => '每日睡眠';

  @override
  String get nutritionQuality => '饮食质量';

  @override
  String get nutritionDesc => '蛋白质、奶制品、蔬菜、水果摄入';

  @override
  String get nutritionBad => '很差';

  @override
  String get nutritionPoor => '较差';

  @override
  String get nutritionMedium => '一般';

  @override
  String get nutritionGood => '良好';

  @override
  String get nutritionGreat => '很好';

  @override
  String get startAnalysis => '开始分析';

  @override
  String get continueBtn => '继续';

  @override
  String get analyzeBtn => '分析';

  @override
  String get analyzing => '分析中';

  @override
  String get analysisComplete => '已完成！';

  @override
  String get analysisDataReceivedTitle => '数据已收到';

  @override
  String get analysisDataReceivedSubtitle => '正在开始分析...';

  @override
  String get yourScore => '你的 BeTaller 分数';

  @override
  String get letsStart => '开始吧';

  @override
  String get splashJourneySubtitle => '你的旅程开始了。🚀';

  @override
  String get splashPlanSubtitle => '你的专属计划已就绪。\n准备好发现你的身高潜力了吗？';

  @override
  String get doneBtn => '完成';

  @override
  String get analysisStep1 => '正在分析遗传数据...';

  @override
  String get analysisStep2 => '正在计算成长速度...';

  @override
  String get analysisStep3 => '正在处理营养和睡眠数据...';

  @override
  String get analysisStep4 => '正在生成身高预测...';

  @override
  String get analysisStep5 => '正在计算 BeTaller 分数...';

  @override
  String growthPotential(String cm, String unit) {
    return '+$cm $unit 成长潜力';
  }

  @override
  String get heightAt21 => '21 岁时';

  @override
  String confidenceLevel(String pct) {
    return '置信度 $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return '范围 $min - $max $unit';
  }

  @override
  String get currentLabel => '当前';

  @override
  String get predictedLabel => '预测';

  @override
  String get yearlyPredictions => '逐年预测';

  @override
  String get tipMorningMeasure => '早上量身高。白天椎间盘受压，人会稍微变矮，所以早上的数据最准确。';

  @override
  String get tipProteinSpread => '把蛋白质分配到各餐。不要一次吃完，每餐都吃点蛋白质。';

  @override
  String get tipGrowthHormone => '生长激素在睡眠中分泌最旺盛。晚上 10 点到凌晨 2 点要睡着！';

  @override
  String get tipVitaminD => '每天晒 15 分钟太阳，能促进维生素 D 合成。维生素 D 对钙的吸收必不可少。';

  @override
  String get tipBarHanging => '单杠悬挂能给脊柱减压。每天试试 3x30 秒。';

  @override
  String get tipSwimming => '游泳是锻炼全身、助力长高的最佳运动。';

  @override
  String get tipStress => '压力会抑制生长激素。用冥想和瑜伽来减压吧。';

  @override
  String get routineMorningStretch => '晨间拉伸';

  @override
  String get routineMorningStretchDesc => '起床后马上拉伸 10 分钟，舒展脊柱和腿部肌肉。';

  @override
  String get routineBarHanging => '单杠悬挂';

  @override
  String get routineBarHangingDesc => '挂在单杠上伸展脊柱。3 组 x 30 秒。';

  @override
  String get routineCobraStretch => '眼镜蛇式拉伸';

  @override
  String get routineCobraStretchDesc => '俯卧，抬起上半身，伸展脊柱。3 组 x 15 秒。';

  @override
  String get routineJumping => '跳跃训练';

  @override
  String get routineJumpingDesc => '跳绳或深蹲跳，刺激生长板。3 组 x 20 次。';

  @override
  String get routineSwimming => '游泳或篮球';

  @override
  String get routineSwimmingDesc => '做一项有助长高的运动，至少 30 分钟。';

  @override
  String get routineYoga => '晚间瑜伽和拉伸';

  @override
  String get routineYogaDesc => '睡前做瑜伽和拉伸，释放压力，放松肌肉。';

  @override
  String get routineProtein => '蛋白质摄入';

  @override
  String get routineProteinDesc => '鸡蛋、鸡肉、鱼、奶制品。每天至少 1.5g/kg 蛋白质。';

  @override
  String get routineCalcium => '钙和维生素 D';

  @override
  String get routineCalciumDesc => '多喝牛奶，吃奶酪和酸奶。晒太阳 15 分钟。对骨骼发育至关重要。';

  @override
  String get routineWater => '喝水目标';

  @override
  String get routineWaterDesc => '每天至少喝 2-3 升水，对新陈代谢和成长必不可少。';

  @override
  String get routineAvoidJunk => '远离垃圾食品';

  @override
  String get routineAvoidJunkDesc => '少吃快餐、含糖饮料和加工食品。';

  @override
  String get routineSleep => '优质睡眠（8-10 小时）';

  @override
  String get routineSleepDesc => '生长激素在睡眠中分泌。晚上 10 点到早上 6 点是黄金时段。';

  @override
  String get routineNoScreen => '睡前远离屏幕';

  @override
  String get routineNoScreenDesc => '睡前 1 小时放下手机和电脑，别影响褪黑素分泌。';

  @override
  String get routinePosture => '体态检查';

  @override
  String get routinePostureDesc => '背挺直，肩膀向后。每小时检查一次。好体态 = 2-3 cm 差距。';

  @override
  String get routineWallStand => '靠墙站立';

  @override
  String get routineWallStandDesc => '背靠墙站：脚跟、臀部、肩膀、头部都贴墙。保持 5 分钟。';

  @override
  String get routineSprintIntervals => '冲刺间歇训练';

  @override
  String get routineSprintIntervalsDesc => '冲刺间歇训练通过高强度爆发，促进大量生长激素释放。';

  @override
  String get routineHiitWorkout => 'HIIT 训练';

  @override
  String get routineHiitWorkoutDesc => '高强度间歇训练，最大化生长激素释放。';

  @override
  String get routineSquats => '徒手深蹲';

  @override
  String get routineSquatsDesc => '徒手深蹲能刺激腿部和脊柱的生长板。';

  @override
  String get routineDeadliftStretch => '硬拉式拉伸';

  @override
  String get routineDeadliftStretchDesc => '硬拉式拉伸，给脊柱减压，保护椎间盘健康。';

  @override
  String get routineOverheadPress => '过头推举';

  @override
  String get routineOverheadPressDesc => '过头推举能伸展脊柱，强化体态肌群。';

  @override
  String get routineSkippingRope => '跳绳';

  @override
  String get routineSkippingRopeDesc => '反复跳绳能刺激下肢的生长板。';

  @override
  String get routinePilatesCore => '普拉提核心';

  @override
  String get routinePilatesCoreDesc => '普拉提核心训练有助于脊柱排列和体态。';

  @override
  String get routineInversionHang => '倒立悬挂';

  @override
  String get routineInversionHangDesc => '倒立能给椎间盘减压，可暂时增加 1-2cm。';

  @override
  String get routineZincIntake => '富锌食物';

  @override
  String get routineZincIntakeDesc => '全天摄入富锌食物，帮助生长激素分泌。';

  @override
  String get routineVitaminDSunlight => '维生素 D 和阳光';

  @override
  String get routineVitaminDSunlightDesc => '每天至少晒 15 分钟太阳，促进维生素 D 合成和骨骼生长。';

  @override
  String get routineArginineFoods => '富含精氨酸的食物';

  @override
  String get routineArginineFoodsDesc => '吃富含精氨酸的食物，促进生长激素分泌。';

  @override
  String get routineDailyCalories => '每日热量目标';

  @override
  String get routineDailyCaloriesDesc => '达到每日热量目标。吃得太少会拖慢成长。';

  @override
  String get routineSleepEnvironment => '优化睡眠环境';

  @override
  String get routineSleepEnvironmentDesc => '营造黑暗、凉爽的睡眠环境，最大化褪黑素和生长激素分泌。';

  @override
  String get routinePreSleepRoutine => '睡前放松';

  @override
  String get routinePreSleepRoutineDesc => '固定的睡前习惯能让深度睡眠质量提升 23%。';

  @override
  String get routineNeckStretches => '颈部拉伸';

  @override
  String get routineNeckStretchesDesc => '颈部拉伸能缓解压迫，改善颈椎排列。';

  @override
  String get routineShoulderRolls => '绕肩和开肩';

  @override
  String get routineShoulderRollsDesc => '打开肩膀能纠正含胸驼背，看起来可高 1-2cm。';

  @override
  String get achieveCommitment => '全情投入';

  @override
  String get achieveCommitmentDesc => '填写所有数据，完整探索 App，并开始使用';

  @override
  String get achieveFirstDay => '第一步';

  @override
  String get achieveFirstDayDesc => '完成你的第一天';

  @override
  String get achieveThreeStreak => '连续 3 天';

  @override
  String get achieveThreeStreakDesc => '连续 3 天完成任务';

  @override
  String get achieveWeekStreak => '连续 7 天';

  @override
  String get achieveWeekStreakDesc => '连续 7 天完成任务';

  @override
  String get achieveTwoWeekStreak => '连续 14 天';

  @override
  String get achieveTwoWeekStreakDesc => '连续坚持 14 天';

  @override
  String get achieveMonthStreak => '连续 30 天';

  @override
  String get achieveMonthStreakDesc => '连续完成 30 天';

  @override
  String get achieveTwoMonthStreak => '连续 60 天';

  @override
  String get achieveTwoMonthStreakDesc => '连续完成 60 天';

  @override
  String get achieveHundredStreak => '连续 100 天';

  @override
  String get achieveHundredStreakDesc => '连续完成 100 天';

  @override
  String get achieveFirstMeasure => '首次测量';

  @override
  String get achieveFirstMeasureDesc => '记录你的第一次身高测量';

  @override
  String get achieveThreeMeasures => '追踪者';

  @override
  String get achieveThreeMeasuresDesc => '记录 3 次身高测量';

  @override
  String get achieveFiveMeasures => '定期追踪';

  @override
  String get achieveFiveMeasuresDesc => '记录 5 次身高测量';

  @override
  String get achieveTenMeasures => '数据猎人';

  @override
  String get achieveTenMeasuresDesc => '记录 10 次身高测量';

  @override
  String get achieveFirstCm => '第一厘米';

  @override
  String get achieveFirstCmDesc => '累计长高 1 cm';

  @override
  String get achieveThreeCm => '长高 3 cm';

  @override
  String get achieveThreeCmDesc => '累计长高 3 cm';

  @override
  String get achieveFiveCm => '长高 5 cm';

  @override
  String get achieveFiveCmDesc => '累计长高 5 cm';

  @override
  String get achieveTenCm => '长高 10 cm';

  @override
  String get achieveTenCmDesc => '累计长高 10 cm';

  @override
  String get quote1 => '每天都比昨天更好一点。';

  @override
  String get quote2 => '长高不是一夜之间的事，但每一晚都让你更近一步。';

  @override
  String get quote3 => '成长需要耐心，坚持下去！';

  @override
  String get quote4 => '今天迈出的每一步，都在为明天打基础。';

  @override
  String get quote5 => '动力结束的地方，就是自律开始的地方。';

  @override
  String get quote6 => '你的身体会感谢你，继续加油！';

  @override
  String get quote7 => '你的潜力有多大，由你自己决定。';

  @override
  String get quote8 => '小步积累，带来大改变。';

  @override
  String get quote9 => '最好的投资是投资自己。';

  @override
  String get quote10 => '你每天都离目标更近一步。';

  @override
  String get quote11 => '改变很难，但后悔更难。';

  @override
  String get quote12 => '好好照顾你的身体。';

  @override
  String get quote13 => '你的对手是昨天的自己。今天就超越它！';

  @override
  String get quote14 => 'BeTaller = 耐心 + 自律 + 信念';

  @override
  String get quote15 => '相信自己，过程会塑造你。';

  @override
  String get quote16 => '今天别说做不到，明天就不会后悔。';

  @override
  String get quote17 => '每天都进步一点，哪怕只有 1%。';

  @override
  String get quote18 => '镜子会见证你的进步，耐心点。';

  @override
  String get bmiNormal => '正常';

  @override
  String get bmiUnderweight => '偏瘦';

  @override
  String get bmiOverweight => '超重';

  @override
  String get bmiObese => '肥胖';

  @override
  String get velocityExcellent => '非常好';

  @override
  String get velocityNormal => '正常';

  @override
  String get velocitySlow => '偏慢';

  @override
  String get velocityVeryLow => '很慢';

  @override
  String durationMinutes(String min) {
    return '$min 分钟';
  }

  @override
  String get durationAllDay => '全天';

  @override
  String get durationNight => '夜间';

  @override
  String durationHours(String hours) {
    return '$hours 小时';
  }

  @override
  String get onboardingStep1 => '填写个人信息';

  @override
  String get onboardingStep2 => '告诉我们你过去的身高';

  @override
  String get onboardingStep3 => '评估你的习惯';

  @override
  String get onboardingStep4 => '查看你的预测和分数';

  @override
  String get hoursShort => '小时';

  @override
  String get selectLanguage => '选择语言';

  @override
  String get systemLanguage => '跟随系统';

  @override
  String get emailSubject => 'BeTaller 意见反馈';

  @override
  String get pastHeightsTip => '不记得的年龄可以留空。填 1-2 个过去的身高就够了。';

  @override
  String get obPastHeightsTitle => '过往身高';

  @override
  String get obPastHeightsSubPart1 => '过去的身高数据能让预测更准确。';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return '你 $age 岁时有多高？';
  }

  @override
  String get obSkip => '跳过';

  @override
  String get obNext => '下一步';

  @override
  String get obSkipAll => '全部跳过';

  @override
  String get currentSuffix => '（当前）';

  @override
  String personalizedProtein(String amount) {
    return '鸡蛋、鸡肉、鱼、奶制品。每天至少吃 ${amount}g 蛋白质。';
  }

  @override
  String personalizedWater(String amount) {
    return '每天至少喝 ${amount}L 水，对新陈代谢和成长必不可少。';
  }

  @override
  String personalizedSleep(String hours) {
    return '生长激素在睡眠中分泌。至少睡 $hours 小时。晚上 10 点到早上 6 点是黄金时段。';
  }

  @override
  String personalizedCalcium(String calories) {
    return '多喝牛奶，吃奶酪和酸奶。晒太阳 15 分钟。每日热量目标：$calories kcal。';
  }

  @override
  String get scoreS => '太棒了！你正在发挥出最大潜力。';

  @override
  String get scoreA => '进展很好！再改进一点就能登顶。';

  @override
  String get scoreB => '方向对了。多关注一下任务和营养。';

  @override
  String get scoreC => '还有提升空间。坚持规律的任务会带来改变。';

  @override
  String get scoreD => '潜力很大，但你需要行动起来。';

  @override
  String get scoreF => '现在就开始！每天一小步，会带来大不同。';

  @override
  String get cmPerYear => 'cm/年';

  @override
  String get howToDoIt => '动作要领';

  @override
  String get musclesTargeted => '锻炼的肌肉和骨骼';

  @override
  String get scientificBasis => '科学依据';

  @override
  String setXofY(String current, String total) {
    return '第 $current/$total 组';
  }

  @override
  String restBeforeSet(String set) {
    return '第 $set 组前休息';
  }

  @override
  String get allSetsComplete => '全部组数已完成！';

  @override
  String get setTimer => '组计时器';

  @override
  String get setTracker => '组数记录';

  @override
  String get builtInTimer => '内置计时器';

  @override
  String get markComplete => '标记为完成';

  @override
  String get markIncomplete => '标记为未完成';

  @override
  String get done => '完成';

  @override
  String get doneExclamation => '完成！';

  @override
  String get start => '开始';

  @override
  String get pause => '暂停';

  @override
  String get resetTimer => '重置';

  @override
  String get skipRest => '跳过休息';

  @override
  String get restart => '重新开始';

  @override
  String get perSet => '每组';

  @override
  String get rest => '休息';

  @override
  String get reps => '次';

  @override
  String get difficultyBeginner => '入门';

  @override
  String get difficultyIntermediate => '中级';

  @override
  String get difficultyAdvanced => '高级';

  @override
  String get learnTitle => '学习';

  @override
  String get learnSubtitle => '有科学依据的长高知识';

  @override
  String get categoryAll => '全部';

  @override
  String get categoryScience => '科学';

  @override
  String get categoryNutrition => '营养';

  @override
  String get categoryExercise => '运动';

  @override
  String get categorySleep => '睡眠';

  @override
  String get categoryMyths => '误区';

  @override
  String get scientificReferences => '科学参考文献';

  @override
  String get relatedRoutines => '相关任务';

  @override
  String get nutritionTitle => '营养';

  @override
  String get sectionMealPlan => '饮食计划';

  @override
  String get sectionNutrients => '营养素';

  @override
  String get sectionFoods => '食物';

  @override
  String get sectionSupplements => '补充剂';

  @override
  String todaysPlan(String day) {
    return '今日计划 · $day';
  }

  @override
  String get breakfast => '早餐';

  @override
  String get lunch => '午餐';

  @override
  String get dinner => '晚餐';

  @override
  String get snacks => '加餐';

  @override
  String get searchFoods => '搜索食物...';

  @override
  String nFoods(String count) {
    return '$count 种食物';
  }

  @override
  String dailyLabel(String amount) {
    return '每日：$amount';
  }

  @override
  String get dailyNeedByAge => '各年龄每日需求';

  @override
  String agePrefix(String range) {
    return '$range 岁';
  }

  @override
  String get topFoodSources => '主要食物来源';

  @override
  String get categoryDairy => '奶制品';

  @override
  String get categoryMeatFish => '肉和鱼';

  @override
  String get categoryVegetables => '蔬菜';

  @override
  String get categoryFruits => '水果';

  @override
  String get categoryGrains => '谷物和豆类';

  @override
  String get categoryNutsSeeds => '坚果和种子';

  @override
  String get weeklyReportTitle => '周报';

  @override
  String get weeklyScoreLabel => '本周分数';

  @override
  String get weeklyDailyCompletion => '逐日情况';

  @override
  String get weeklyHabits => '习惯';

  @override
  String get overview => '概览';

  @override
  String get routinesLabel => '任务';

  @override
  String get streakLabel => '连续';

  @override
  String get heightLabel => '身高';

  @override
  String get weightLabel => '体重';

  @override
  String get dadLabel => '爸爸';

  @override
  String get motherLabel => '妈妈';

  @override
  String get metricShort => '公制';

  @override
  String get imperialShort => '英制';

  @override
  String get dailyScores => '每日分数';

  @override
  String get waterToday2 => '今日喝水';

  @override
  String get sleepToday => '今日睡眠';

  @override
  String get routineCompletion => '任务完成度';

  @override
  String get xpAndLevel => 'XP 和等级';

  @override
  String xpToNextLevel(String xp) {
    return '距下一级还差 $xp XP';
  }

  @override
  String get activeChallenges => '进行中的挑战';

  @override
  String nOfMCompleted(String n, String m) {
    return '已完成 $n/$m';
  }

  @override
  String get shareYourProgress => '分享你的进度';

  @override
  String get shareComingSoon => '分享功能即将推出！';

  @override
  String get premiumTest => '高级版（测试）';

  @override
  String get premiumActive => '已开通';

  @override
  String get premiumFree => '免费';

  @override
  String get weeklyReportMenu => '周报';

  @override
  String get weeklyReportMenuSubtitle => '你的进度总结';

  @override
  String get unlockGrowthPotential => '释放你全部的长高潜力';

  @override
  String get featureGrowthAnalysis => '成长分析和分数';

  @override
  String get featureHeightPrediction => '身高预测';

  @override
  String get featureAllRoutines => '全部 14 项每日任务';

  @override
  String get featureWaterSleep => '喝水和睡眠记录';

  @override
  String get featureProgress => '进度和测量';

  @override
  String get featureAchievements => '成就和连续打卡';

  @override
  String get planMonthly => '月度';

  @override
  String get planYearly => '年度';

  @override
  String get bestValue => '最划算';

  @override
  String get premiumLabel => '高级版';

  @override
  String lvl(String level) {
    return 'LV $level';
  }

  @override
  String get levelBeginner => '新手';

  @override
  String get levelStarter => '起步';

  @override
  String get levelCommitted => '投入';

  @override
  String get levelDedicated => '专注';

  @override
  String get levelConsistent => '稳定';

  @override
  String get levelFocused => '专心';

  @override
  String get levelDetermined => '坚定';

  @override
  String get levelDisciplined => '自律';

  @override
  String get levelStrong => '强大';

  @override
  String get levelAdvanced => '进阶';

  @override
  String get levelExpert => '专家';

  @override
  String get levelMaster => '大师';

  @override
  String get levelElite => '精英';

  @override
  String get levelChampion => '冠军';

  @override
  String get levelLegend => '传奇';

  @override
  String get levelTitan => '泰坦';

  @override
  String get levelMythic => '神话';

  @override
  String get levelImmortal => '不朽';

  @override
  String get levelTranscendent => '超凡';

  @override
  String get levelUltimate => '终极';

  @override
  String get challengeCompleteAllRoutines => '完成所有任务';

  @override
  String get challengeCompleteAllRoutinesDesc => '今天完成每一项任务';

  @override
  String get challengeHydrationHero => '喝水达人';

  @override
  String get challengeHydrationHeroDesc => '达成每日喝水目标';

  @override
  String get challengeEarlySleeper => '早睡达人';

  @override
  String get challengeEarlySleeperDesc => '记录 8 小时以上睡眠';

  @override
  String get challengeExerciseTrio => '运动三连';

  @override
  String get challengeExerciseTrioDesc => '完成 3 项运动任务';

  @override
  String get challengeMorningStretch => '晨间拉伸';

  @override
  String get challengeMorningStretchDesc => '上午 9 点前完成晨间拉伸';

  @override
  String get challenge7DayWarrior => '7 天勇士';

  @override
  String get challenge7DayWarriorDesc => '连续 7 天完成所有任务';

  @override
  String get challengeGrowthTracker => '成长追踪者';

  @override
  String get challengeGrowthTrackerDesc => '本周记录一次身高测量';

  @override
  String get challengeHydrationWeek => '喝水周';

  @override
  String get challengeHydrationWeekDesc => '本周有 5 天达成喝水目标';

  @override
  String get challengeFitnessChampion => '健身冠军';

  @override
  String get challengeFitnessChampionDesc => '本周完成 15 项运动任务';

  @override
  String get challengeSleepMaster => '睡眠大师';

  @override
  String get challengeSleepMasterDesc => '5 天记录 8 小时以上睡眠';

  @override
  String get performanceDashboard => '表现面板';

  @override
  String get tierA => 'A 级';

  @override
  String get tierB => 'B 级';

  @override
  String get tierC => 'C 级';

  @override
  String get tierD => 'D 级';

  @override
  String get tierE => 'E 级';

  @override
  String get maxTierReached => '已达最高级';

  @override
  String nextTierHint(String tier, String pts) {
    return '下一级：$tier · 还需 +$pts 分';
  }

  @override
  String get premiumBadge => '高级版';

  @override
  String get manageRoutines => '管理任务';

  @override
  String get manageRoutinesSubtitle => '在每日列表中显示或隐藏任务';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '已启用 $visible/$total';
  }

  @override
  String get showAll => '全部显示';

  @override
  String get hideAll => '全部隐藏';

  @override
  String get heightAnalysis => '身高分析';

  @override
  String get heightVsPopulation => '你在 CDC 生长曲线上的位置';

  @override
  String get globalAveragesTable => '各年龄平均身高（CDC）';

  @override
  String get standingTall => '高个子';

  @override
  String get standingAboveAverage => '高于平均';

  @override
  String get standingBelowAverage => '低于平均';

  @override
  String get standingShort => '低于同龄人';

  @override
  String get yourHeightStanding => '你的身高排名';

  @override
  String get bellCurveCaption => '你这个年龄的身高分布';

  @override
  String get bellShorterThanYou => '比你矮';

  @override
  String get yourHeight => '你';

  @override
  String peerAvg(int age) {
    return '$age 岁平均';
  }

  @override
  String get aboveAvg => '高于平均';

  @override
  String get belowAvg => '低于平均';

  @override
  String get whoDataSource => '美国 CDC 生长曲线';

  @override
  String get percentileShort5 => '第 5';

  @override
  String get percentileShort50 => '第 50';

  @override
  String get percentileShort95 => '第 95';

  @override
  String get youLabel => '你';

  @override
  String get avgHeightLabel => '平均';

  @override
  String get percentileLabel => '百分位';

  @override
  String get diffLabel => '差值';

  @override
  String get whoSourceNote =>
      '数据来源：美国 CDC 2000 年生长曲线（2 至 20 岁年龄别身高）。百分位是和美国人群比较的结果，不同国家可能有差异。';

  @override
  String get quickPhotos => '照片';

  @override
  String get quickPosture => '体态';

  @override
  String get quickWellness => '健康';

  @override
  String get quickRecipes => '食谱';

  @override
  String get wellnessTitle => '健康追踪';

  @override
  String get wellnessHeader => '健康';

  @override
  String get wellnessSubtitle => '追踪影响你成长的因素';

  @override
  String get caffeineToday => '今日咖啡因';

  @override
  String get withinLimits => '在健康范围内';

  @override
  String get approachingLimit => '接近上限';

  @override
  String get overLimit => '超出上限，影响生长激素';

  @override
  String get resetToday => '重置今天';

  @override
  String get stressToday => '今日压力';

  @override
  String get stressVeryCalmLabel => '非常平静，最有利于成长';

  @override
  String get stressCalmLabel => '平静';

  @override
  String get stressNeutralLabel => '一般';

  @override
  String get stressStressedLabel => '有压力';

  @override
  String get stressVeryStressedLabel => '压力很大，皮质醇会抑制生长激素';

  @override
  String get stressTapToLog => '点一下，记录你今天的感受';

  @override
  String get todaysJournal => '今日日记';

  @override
  String get journalNoNote => '（无备注）';

  @override
  String get journalEdit => '编辑';

  @override
  String get journalHowWasToday => '今天过得怎么样？';

  @override
  String get journalSaved => '日记已保存 · +5 XP';

  @override
  String get journalSaveEntry => '保存';

  @override
  String get weeklyInsight => '本周洞察';

  @override
  String get weeklyInsightCaffeine => '咖啡因';

  @override
  String get weeklyInsightStress => '压力';

  @override
  String get weeklyInsightMood => '心情';

  @override
  String get wellnessInfoTitle => '为什么健康很重要';

  @override
  String get wellnessInfoBody =>
      '咖啡因会干扰深度睡眠，而大部分生长激素（HGH）正是在深度睡眠时分泌的。长期压力会让皮质醇升高，直接抑制生长激素。写日记能帮你坚持有助成长的习惯。';

  @override
  String get wellnessInfoGotIt => '知道了';

  @override
  String get insightCaffeineHigh => '你本周咖啡因摄入偏高。试着减少一些，睡得更好，生长激素也更多。';

  @override
  String get insightStressHigh => '本周压力偏大。试试呼吸练习：皮质醇会阻碍成长。';

  @override
  String get insightMoodLow => '最近心情有点低落。晒太阳、睡好觉、做些轻松的运动都有帮助。';

  @override
  String get insightGreat => '本周状态很平衡。你的健康状况有利于成长。';

  @override
  String get insightDefault => '你的健康状况良好。继续记录，获得更深入的洞察。';

  @override
  String get insightNeedMoreData => '再记录几天就能看到洞察。';

  @override
  String get progressPhotosTitle => '进度照片';

  @override
  String get progressPhotosHeader => '进度照片';

  @override
  String get progressPhotosSubtitle => '用照片记录你的变化';

  @override
  String get addProgressPhoto => '添加进度照片';

  @override
  String get captureJourney => '用照片记录你的旅程';

  @override
  String get takePhoto => '拍照';

  @override
  String get chooseFromLibrary => '从相册选择';

  @override
  String get deletePhotoTitle => '删除照片？';

  @override
  String get deletePhotoBody => '这张照片将从你的进度时间线中移除。';

  @override
  String get timelineTab => '时间线';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '张照片',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$days 天 $cm $unit';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '天',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '已长高（$unit）';
  }

  @override
  String get firstPhotoMessage => '拍下第一张照片，开始记录你的外在变化。';

  @override
  String get takeFirstPhoto => '拍第一张照片';

  @override
  String get beforeAfter => '前 / 后';

  @override
  String get beforeLabel => '之前';

  @override
  String get afterLabel => '之后';

  @override
  String get yourHeightDialog => '你的身高';

  @override
  String get heightDialogMessage => '输入拍这张照片时的身高';

  @override
  String get postureAnalysisTitle => '体态分析';

  @override
  String get postureCoachHeader => '体态教练';

  @override
  String get postureCoachSubtitle => '用侧面照片自我检查';

  @override
  String get latestScore => '最新分数';

  @override
  String get latestAnalysis => '最新分析';

  @override
  String get headPosition => '头部位置';

  @override
  String get progressLabel => '进度';

  @override
  String get choosePhotoSource => '选择照片来源';

  @override
  String get sideProfileHint => '侧面，全身入镜';

  @override
  String get howToTakePhoto => '如何拍照';

  @override
  String get takePosturePhoto => '拍体态照片';

  @override
  String get postureExcellent => '非常好';

  @override
  String get postureGood => '良好';

  @override
  String get postureNeedsWork => '需改善';

  @override
  String get posturePoor => '较差';

  @override
  String get recommendedExercises => '推荐练习';

  @override
  String get postureWallStand => '靠墙站立';

  @override
  String get postureWallStandDesc => '每天背靠墙站 2 分钟。';

  @override
  String get postureChestOpener => '开胸练习';

  @override
  String get postureChestOpenerDesc => '放松紧绷的胸肌，避免肩膀前扣。';

  @override
  String get postureChinTucks => '收下巴';

  @override
  String get postureChinTucksDesc => '改善头前伸，3×10 次。';

  @override
  String get postureDeadbug => '死虫式';

  @override
  String get postureDeadbugDesc => '强化深层核心，控制腰椎前凸。';

  @override
  String get recipesTitle => '食谱';

  @override
  String get recipesHeader => '食谱';

  @override
  String get recipesSubtitle => '为成长补充能量';

  @override
  String get recipesCategoryAll => '全部';

  @override
  String get recipesCategoryBreakfast => '早餐';

  @override
  String get recipesCategoryLunch => '午餐';

  @override
  String get recipesCategoryDinner => '晚餐';

  @override
  String get recipesCategorySnack => '加餐';

  @override
  String get recipesGoalAll => '全部';

  @override
  String get recipeDiffEasy => '简单';

  @override
  String get recipeDiffMedium => '中等';

  @override
  String get recipeDiffHard => '较难';

  @override
  String get recipesFilterType => '类型';

  @override
  String get recipesFilterNutrient => '富含';

  @override
  String get recipesGoalVitaminD => '维生素 D';

  @override
  String get recipesGoalZinc => '锌';

  @override
  String get recipesGoalMagnesium => '镁';

  @override
  String recipesCountLabel(int count) {
    return '$count 个食谱';
  }

  @override
  String get recipeIngredients => '食材';

  @override
  String get recipeSteps => '做法';

  @override
  String get recipesGoalProtein => '高蛋白';

  @override
  String get recipesGoalCalcium => '钙';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => '铁';

  @override
  String get recipesNoMatch => '没有符合筛选条件的食谱';

  @override
  String get recipesIngredients => '食材';

  @override
  String get recipesInstructions => '步骤';

  @override
  String get recipesClose => '关闭';

  @override
  String get recipesAboutTitle => '关于食谱';

  @override
  String get recipesAboutBody => '精选食谱，为你的成长补充能量。按餐次或营养目标筛选，找到最适合你计划的那一款。';

  @override
  String get animHintSpinalDecomp => '脊柱减压';

  @override
  String get animHintGravityReversal => '反重力';

  @override
  String get animHintImpactBones => '冲击刺激骨骼';

  @override
  String get animHintHighImpact => '高冲击骨骼刺激';

  @override
  String get animHintMetabolicBurst => '代谢爆发训练';

  @override
  String get animHintFullBodyStretch => '全身唤醒拉伸';

  @override
  String get animHintSpinalExtension => '脊柱伸展';

  @override
  String get animHintCervicalDecomp => '颈椎减压';

  @override
  String get animHintShoulderMobility => '肩部灵活性';

  @override
  String get animHintFullBodyMotion => '全身运动';

  @override
  String get animHintPosteriorChain => '后链拉伸';

  @override
  String get animHintMuscleGrowth => '肌肉生长燃料';

  @override
  String get animHintBoneDensity => '支持骨密度';

  @override
  String get animHintSpinalDisc => '椎间盘补水';

  @override
  String get animHintCleanNutrition => '健康饮食';

  @override
  String get animHintIgf1 => '优化 IGF-1';

  @override
  String get animHintHghAmino => '生长激素氨基酸前体';

  @override
  String get animHintCalciumAbsorption => '钙吸收';

  @override
  String get animHintSpinalAlignment => '脊柱排列';

  @override
  String get animHintPostureCorrection => '体态矫正';

  @override
  String get animHintMindBody => '身心平衡';

  @override
  String get animHintCoreStability => '核心稳定';

  @override
  String get animHintLegPower => '腿部力量和生长激素激增';

  @override
  String get animHintVerticalPower => '弹跳力';

  @override
  String get animHintHghSurge => '生长激素激增训练';

  @override
  String get animHintPeakHgh => '生长激素分泌高峰期';

  @override
  String get animHintMelatonin => '优化褪黑素';

  @override
  String get animHintDeepSleep => '为深度睡眠做准备';

  @override
  String get animHintSleepOpt => '睡眠优化';

  @override
  String get animHintExercise => '运动';

  @override
  String get formMorningStretch => '先做绕颈，再做全身拉伸。每个动作保持 20-30 秒，不要弹振。';

  @override
  String get formBarHanging => '双手与肩同宽握杠，全身放松，让重力拉伸脊柱。避免摇晃。';

  @override
  String get formCobraStretch => '俯卧，双手放在肩膀下方，慢慢撑起上半身，臀部贴地。目视上方。';

  @override
  String get formJumping => '做深蹲跳或跳绳。用前脚掌轻轻落地。组间休息 30 秒。';

  @override
  String get formSwimmingBasketball => '选择游泳（自由泳/仰泳）或篮球。注重跳跃、伸展和全幅度动作。';

  @override
  String get formEveningYoga => '做些温和的体式：猫牛式、婴儿式、下犬式、站立前屈。深呼吸，每个体式保持 30-60 秒。';

  @override
  String get formSprintIntervals => '热身 5 分钟，然后全力冲刺 30 秒。走路或慢跑 90 秒恢复。重复。';

  @override
  String get formHiitWorkout => '以最大强度做波比跳、登山跑、深蹲跳等动作 45 秒，休息 15 秒。';

  @override
  String get formSquats => '双脚与肩同宽站立。下蹲至大腿与地面平行。背部挺直，膝盖不超过脚尖。';

  @override
  String get formDeadliftStretch =>
      '双脚与髋同宽站立，以髋为轴前屈，保持背部平直。双手伸向脚尖，感受腘绳肌和背部的拉伸。';

  @override
  String get formOverheadPress => '站直，双臂向上推举至完全伸直。用轻重量或徒手。收紧核心，避免塌腰。';

  @override
  String get formSkippingRope => '双脚起跳，用前脚掌轻轻落地。跳得低一点、节奏稳定。组间休息。';

  @override
  String get formPilatesCore => '做平板支撑、死虫式、鸟狗式、臀桥和抬腿。注重动作控制和呼吸。';

  @override
  String get formInversionHang => '使用倒立床或倒挂靴。先从小角度开始，再逐渐增加。每次时间不要太长。';

  @override
  String get formProtein => '把蛋白质分配到 3-4 餐。吃鸡蛋、鸡肉、鱼、奶制品和豆类。';

  @override
  String get formCalciumVitaminD => '每天吃 3 份奶制品，晒 15 分钟太阳，让身体自然合成维生素 D。';

  @override
  String get formWater => '全天均匀喝水。随身带水杯，设置每小时提醒。';

  @override
  String get formAvoidJunk => '用天然食物代替快餐，用水代替含糖饮料。看配料表，避开加工成分。';

  @override
  String get formZincIntake => '饮食中加入红肉、南瓜子、鹰嘴豆、腰果和牡蛎。每天目标 8-11mg。';

  @override
  String get formVitaminDSunlight => '让手臂和脸直接晒 15 分钟太阳，最好在中午之前。这么短的时间不需要防晒霜。';

  @override
  String get formArginineFoods => '饮食中加入坚果、种子、火鸡肉、鸡肉、大豆和奶制品。睡前吃效果最好。';

  @override
  String get formDailyCalories => '把热量分配到 3-5 餐，不要不吃早餐。优先选择天然食物，少吃空热量食物。';

  @override
  String get formQualitySleep => '晚上 10 点前上床。保持房间黑暗凉爽。下午 2 点后不喝含咖啡因的饮料。';

  @override
  String get formNoScreen => '在睡前 1 小时设个闹钟。放下所有屏幕，改为看书或做些轻柔的拉伸。';

  @override
  String get formSleepEnvironment => '使用遮光窗帘，室温保持在 18-20°C，去掉所有光源。用舒适的床垫和枕头。';

  @override
  String get formPreSleepRoutine => '睡前 30 分钟开始：调暗灯光，看看书，做呼吸练习，避免刺激性活动。';

  @override
  String get formPostureCheck => '站直，肩膀向后下沉。微微收紧核心。想象有根线从头顶把你往上拉。';

  @override
  String get formWallStand => '站立时让脚跟、臀部、肩胛骨和头部都贴着墙。保持 5 分钟，正常呼吸。';

  @override
  String get formNeckStretches => '慢慢把头向两侧、向前、向后倾斜。每个方向保持 30 秒。不要用力硬拉。';

  @override
  String get formShoulderRolls => '肩膀向前绕 15 次，再向后绕 15 次。接着做开胸拉伸，保持 20 秒。';

  @override
  String get sciMorningStretch => '晨间拉伸能给夜间恢复水分的椎间盘减压，最大限度保持身高';

  @override
  String get sciBarHanging => '悬挂利用重力拉伸脊柱，给椎间盘减压，可能带来暂时的身高增加';

  @override
  String get sciCobraStretch => '眼镜蛇式能伸展脊柱、打开胸腔，抵消久坐带来的脊柱压迫';

  @override
  String get sciJumping => '高冲击跳跃能刺激腿部生长板，并促进生长激素释放';

  @override
  String get sciSwimmingBasketball => '游泳和篮球包含全身伸展、跳跃和够高动作，能刺激生长板活动';

  @override
  String get sciEveningYoga => '晚间瑜伽能降低抑制生长激素的皮质醇，并拉伸肌肉，帮助夜间恢复';

  @override
  String get sciSprintIntervals => '冲刺跑能促进大量生长激素释放';

  @override
  String get sciHiitWorkout => '高强度运动可让生长激素提升高达 450%';

  @override
  String get sciSquats => '深蹲能刺激腿部和脊柱的生长板';

  @override
  String get sciDeadliftStretch => '脊柱减压有助于椎间盘健康';

  @override
  String get sciOverheadPress => '过头推举能伸展脊柱，强化体态肌群';

  @override
  String get sciSkippingRope => '反复跳跃能刺激下肢的生长板';

  @override
  String get sciPilatesCore => '核心力量有助于脊柱排列和体态';

  @override
  String get sciInversionHang => '倒立能给椎间盘减压，可暂时增加 1-2cm';

  @override
  String get sciProtein => '蛋白质提供骨骼和肌肉生长必需的氨基酸，在快速生长期尤其重要';

  @override
  String get sciCalciumVitaminD => '钙和维生素 D 是骨密度和骨骼纵向生长的主要基础';

  @override
  String get sciWater => '充足的水分对向生长板输送营养和关节软骨健康必不可少';

  @override
  String get sciAvoidJunk => '加工食品和糖会引起炎症和胰岛素飙升，抑制生长激素分泌';

  @override
  String get sciZincIntake => '锌对生长激素的生成必不可少';

  @override
  String get sciVitaminDSunlight => '维生素 D 对钙吸收和骨骼生长至关重要';

  @override
  String get sciArginineFoods => 'L-精氨酸能促进生长激素分泌';

  @override
  String get sciDailyCalories => '长期热量不足会降低 IGF-1，削弱生长激素脉冲，直接拖慢青春期的身高增长';

  @override
  String get sciQualitySleep => '每天 70-80% 的生长激素在深度睡眠阶段分泌，尤其是晚上 10 点到凌晨 2 点';

  @override
  String get sciNoScreen => '屏幕蓝光会抑制褪黑素分泌，推迟入睡，降低深度睡眠质量';

  @override
  String get sciSleepEnvironment => '黑暗、凉爽的环境能最大化褪黑素和生长激素分泌';

  @override
  String get sciPreSleepRoutine => '固定的睡前习惯能让深度睡眠质量提升 23%';

  @override
  String get sciPostureCheck => '正确的体态能立即让你看起来高 2-3 cm，还能防止脊柱受压';

  @override
  String get sciWallStand => '靠墙站能训练体态肌肉记忆，帮你全天保持正确的脊柱排列';

  @override
  String get sciNeckStretches => '颈部拉伸能缓解压迫，改善颈椎排列';

  @override
  String get sciShoulderRolls => '打开肩膀能纠正含胸驼背，看起来可高 1-2cm';

  @override
  String get muscleSpine => '脊柱';

  @override
  String get muscleLegs => '腿部';

  @override
  String get muscleBack => '背部';

  @override
  String get muscleShoulders => '肩部';

  @override
  String get muscleArms => '手臂';

  @override
  String get muscleCore => '核心';

  @override
  String get muscleChest => '胸部';

  @override
  String get muscleCalves => '小腿';

  @override
  String get muscleFullBody => '全身';

  @override
  String get muscleHips => '髋部';

  @override
  String get muscleBones => '骨骼';

  @override
  String get muscleMuscles => '肌肉';

  @override
  String get muscleNeck => '颈部';

  @override
  String get muscleUpperSpine => '上段脊柱';

  @override
  String get muscleUpperBack => '上背部';

  @override
  String get createRoutine => '创建任务';

  @override
  String get createRoutineTitle => '创建自定义任务';

  @override
  String get createRoutineSubtitle => '打造你自己的每日任务';

  @override
  String get routineIcon => '图标';

  @override
  String get routineTitleField => '标题';

  @override
  String get routineDescField => '描述';

  @override
  String get routineDescHint => '简单介绍一下这个任务';

  @override
  String get routineCategoryField => '类别';

  @override
  String get routineDifficultyField => '难度';

  @override
  String get routineDurationField => '时长';

  @override
  String get routineSetsRepsField => '组数 x 次数';

  @override
  String get routineFormField => '动作要领和说明';

  @override
  String get routineFormHint => '选填：这个任务怎么做';

  @override
  String get diffBeginner => '入门';

  @override
  String get diffIntermediate => '中级';

  @override
  String get diffAdvanced => '高级';

  @override
  String get catExercise => '运动';

  @override
  String get catNutrition => '营养';

  @override
  String get catSleep => '睡眠';

  @override
  String get catPosture => '体态';

  @override
  String get postureTip1 => '侧身（侧面）对着镜头站立。';

  @override
  String get postureTip2 => '距离镜头约 2 米。';

  @override
  String get postureTip3 => '手臂放松，目视前方。';

  @override
  String get postureTip4 => '穿贴身的衣服，评分更准确。';

  @override
  String get postureTip5 => '光线要好，背景要简洁。';

  @override
  String get kyphosisLabel => '驼背（上背部）';

  @override
  String get lordosisLabel => '腰椎前凸（下背部）';

  @override
  String get analyzingPosture => '正在分析体态';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String get termsOfService => '服务条款';

  @override
  String version(String ver) {
    return '版本 $ver';
  }

  @override
  String get rateApp => '给 BeTaller 评分';

  @override
  String get rateAppSubtitle => '你的评价能帮助我们成长！';

  @override
  String get unitSystem => '单位';

  @override
  String get unitMetric => '公制 (cm, kg)';

  @override
  String get unitImperial => '英制 (ft-in, lbs)';

  @override
  String get healthDisclaimer => '健康免责声明';

  @override
  String get healthDisclaimerBody =>
      'BeTaller 提供的是一般性的健康和健身指导。结果因年龄、遗传和个人因素而异。本 App 不提供医疗建议。练习侧重于通过自然习惯优化体态、维护脊柱健康和支持生长激素。开始任何新的运动或饮食计划前，请咨询专业医生。生长板闭合后（通常在 18-25 岁），身高的变化主要来自体态改善。';

  @override
  String routineProteinAmountDesc(int grams) {
    return '今天至少摄入 ${grams}g 蛋白质（根据你的体重计算）。';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return '今天至少喝 ${liters}L 水（根据你的体重计算）。';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return '今天目标摄入约 $kcal kcal，为成长补充能量。';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return '今天摄入 $iu IU 维生素 D，可以来自阳光、食物或补充剂。';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return '今天摄入 ${mg}mg 锌，帮助生长激素分泌。';
  }

  @override
  String get nutritionSupplementsTitle => '补充剂';

  @override
  String get nutritionSupplementsDisclaimer =>
      '仅作辅助，不能代替食物。开始服用任何补充剂前请先咨询医生，18 岁以下尤其要注意。';

  @override
  String get supplementVitaminDName => '维生素 D3';

  @override
  String get supplementVitaminDDose => '3,000 IU';

  @override
  String get supplementVitaminDBenefit => '促进钙吸收，有益骨密度和生长板健康';

  @override
  String get supplementZincName => '锌';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit => '生长激素生成的关键矿物质';

  @override
  String get supplementMagnesiumName => '镁';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit => '支持深度睡眠，大部分生长激素在这个阶段分泌';

  @override
  String get supplementCalciumName => '钙';

  @override
  String get supplementCalciumDose => '1,000-1,300mg';

  @override
  String get supplementCalciumBenefit => '骨密度和生长板的核心基础';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1,000mg';

  @override
  String get supplementOmega3Benefit => '减轻炎症，支持生长板的正常功能';

  @override
  String get supplementCollagenName => '胶原蛋白 + 维生素 C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit => '维生素 C 帮助身体利用胶原蛋白构建软骨和骨基质';

  @override
  String get sciSourcePrefix => '来源：';

  @override
  String get program => '计划';

  @override
  String get todaysExercises => '今日练习';

  @override
  String get dailyNutritionPlan => '每日饮食计划';

  @override
  String get nutritionGoalsComplete => '🎉 所有营养目标已完成！';

  @override
  String get nutritionGoalsIncomplete => '完成营养目标，让成长更充分';

  @override
  String get postureDetectingAlignment => '正在检测脊柱排列...';

  @override
  String get testimonial1 => '因为年龄我本来已经不抱希望了，但用了 BeTaller 我长高了。我从来没这么自信过。';

  @override
  String get testimonialDuration1 => '4 个月';

  @override
  String get testimonial2 => '大家都说“你已经长不高了”。我用了 BeTaller，让所有人都很惊讶。';

  @override
  String get testimonialDuration2 => '3 个月';

  @override
  String get testimonial3 => '开始做这些任务后，我长高了，体态也变好了。大家都看出了变化。';

  @override
  String get testimonialDuration3 => '6 个月';

  @override
  String get testimonial4 => '我还在长身体，BeTaller 的效果太棒了。我感觉自己更高更壮了。';

  @override
  String get testimonialDuration4 => '3 个月';

  @override
  String get testimonial5 => '要说没试过 BeTaller 那是骗人的。我很快就感觉到了真正的变化，强烈推荐。';

  @override
  String get testimonialDuration5 => '4 个月';

  @override
  String get designedForYou => '为你打造';

  @override
  String get designedForYouDesc => 'BeTaller 专为帮你达到甚至超越遗传极限而打造。每个功能，都为了你。';

  @override
  String get greetingAllDone => '干得漂亮！🎯';

  @override
  String get greetingAllDoneSub => '你已完成今天的任务。';

  @override
  String greetingStreak30(int streak) {
    return '连续 $streak 天。传奇级别。';
  }

  @override
  String greetingStreak7(int streak) {
    return '连续 $streak 天。继续保持。';
  }

  @override
  String greetingStreak3(int streak) {
    return '连续 $streak 天。大多数人都放弃了，你没有。';
  }

  @override
  String get greetingMorning => '早上好。新的一天，新的机会。';

  @override
  String get greetingAfternoon => '今天就是开启连续打卡的好日子。';

  @override
  String get greetingEvening => '完成你的任务，开启连续打卡。';

  @override
  String get todayCompleted => '今天已完成 ✓';

  @override
  String get todayGoals => '今日目标';

  @override
  String get challengesLabel => '挑战';

  @override
  String get dailyChallengesLabel => '每日挑战';

  @override
  String get expiresTonight => '今晚截止';

  @override
  String get allChallengesCompleted => '全部完成 ✓';

  @override
  String get challengesLoading => '新挑战即将上线。';

  @override
  String get challengesLoadingTitle => '每日挑战';

  @override
  String get behindPace => '进度落后';

  @override
  String get growthTracking => '成长追踪';

  @override
  String get growthEmptyFirst => '记录你的第一个身高，开始追踪。';

  @override
  String get growthEmptySecond => '记录第二次测量，就能看到曲线。';

  @override
  String get growthSectionLabel => '成长';

  @override
  String get generalPerformance => '整体表现';

  @override
  String get analysisBalance => '你的平衡度';

  @override
  String get analysisWeakest => '你的短板';

  @override
  String get analysisPrediction => '身高预测';

  @override
  String get analysisComparison => '对比';

  @override
  String get analysisGrowth => '成长状态';

  @override
  String get analysisWeakestHint => '从这里入手，分数涨得最快。';

  @override
  String get exploreLabel => '探索';

  @override
  String get explorePosture => '体态分析';

  @override
  String get explorePostureSub => '体态分析和矫正建议';

  @override
  String get explorePhotos => '进度照片';

  @override
  String get explorePhotosSub => '用照片记录你的蜕变';

  @override
  String get exploreNutrition => '营养';

  @override
  String get exploreNutritionSub => '蛋白质、钙和维生素指南';

  @override
  String get exploreHealth => '健康追踪';

  @override
  String get exploreHealthSub => '压力、咖啡因和健康状况追踪';

  @override
  String get exploreRecipes => '长高食谱';

  @override
  String get exploreRecipesSub => '有助成长的食谱';

  @override
  String get educationLabel => '知识';

  @override
  String get educationTitle => '长高的\n科学';

  @override
  String get educationSubtitle => '专业内容、研究和指南';

  @override
  String get aiAnalysisLabel => '成长分析';

  @override
  String get peerCompareLabel => '与同龄人对比';

  @override
  String peerCompareText(int topPct) {
    return '你位于同龄人的前 $topPct%';
  }

  @override
  String get notifWaterTitle => '💧 别忘了喝水！';

  @override
  String get notifWaterBody => '今天的喝水目标达成了吗？再喝一杯吧！';

  @override
  String get notifMorningTitle => '🌅 早上好！该运动了';

  @override
  String get notifMorningBody => '做做晨间拉伸吧！10 分钟拉伸脊柱和腿部。';

  @override
  String get notifRoutineTitle => '🔥 完成你的任务！';

  @override
  String get notifRoutineBody => '今天结束前看看你的任务。连续打卡 = 自律！';

  @override
  String get notifProteinTitle => '🥚 蛋白质日！';

  @override
  String get notifProteinBody => '强势开启新的一周！每餐都要吃蛋白质。';

  @override
  String get notifNewWeekTitle => '✨ 新的一周，新的目标！';

  @override
  String get notifNewWeekBody => '这周别落下任务。小步积累，大不一样！';

  @override
  String get notifSleepTitle => '😴 该睡觉了！';

  @override
  String get notifSleepBody => '生长激素在晚上 10 点到凌晨 2 点分泌最旺盛。放下手机吧！';

  @override
  String get notifPostureTitle => '🧍 体态检查！';

  @override
  String get notifPostureBody => '背挺直，肩膀向后。好体态 = 2-3 cm 差距！';

  @override
  String get notifVitaminDTitle => '☀️ 维生素 D 时间！';

  @override
  String get notifVitaminDBody => '去晒 15 分钟太阳吧！维生素 D 能促进钙吸收。';

  @override
  String get notifMidweekTitle => '✨ 一周过半了！';

  @override
  String get notifMidweekBody => '周中检查。成长需要耐心，但坚持就能赢！';

  @override
  String get notifScreenTitle => '📵 关掉屏幕！';

  @override
  String get notifScreenBody => '睡前 1 小时不看屏幕。蓝光会阻碍褪黑素！';

  @override
  String get notifJumpTitle => '🦘 跳跃时间！';

  @override
  String get notifJumpBody => '跳跃练习能刺激生长板。试试 3 x 20 次！';

  @override
  String get notifCalciumTitle => '🥛 补钙时间！';

  @override
  String get notifCalciumBody => '来一杯牛奶或酸奶。钙对骨骼至关重要！';

  @override
  String get notifPostureCheckTitle => '🧍 体态检查！';

  @override
  String get notifPostureCheckBody => '别低头看手机！坐直，走路挺胸。';

  @override
  String get notifWeekendTitle => '✨ 周末动力';

  @override
  String get notifWeekendBody => '周末也别落下任务！自律每天都算数。';

  @override
  String get notifWeeklyProgressTitle => '📊 每周进度';

  @override
  String get notifWeeklyProgressBody => '这周过得怎么样？看看你的成长曲线！';

  @override
  String get notifMeasureTitle => '📏 每周测量！';

  @override
  String get notifMeasureBody => '量一下身高并记录！早上测量最准确。';

  @override
  String get notifEarlySleepTitle => '😴 早点睡！';

  @override
  String get notifEarlySleepBody => '明天就是周一！睡个好觉，强势开启新一周。';

  @override
  String get notifStreak3Title => '🔥 连续 3 天！';

  @override
  String get notifStreak3Body => '好的开始！已连续 3 天。继续冲向 7 天！';

  @override
  String get notifStreak7Title => '🏆 连续 1 周！';

  @override
  String get notifStreak7Body => '太厉害了！连续 7 天完成任务！';

  @override
  String get notifStreak14Title => '⭐ 连续 2 周！';

  @override
  String get notifStreak14Body => '自律 14 天！你的身体开始改变了。';

  @override
  String get notifStreak30Title => '👑 连续 1 个月！';

  @override
  String get notifStreak30Body => '30 天！你是冠军！';

  @override
  String get notifStreak60Title => '🌟 连续 60 天！';

  @override
  String get notifStreak60Body => '60 天！了不起的成就。';

  @override
  String get notifStreak100Title => '💎 100 天！传奇！';

  @override
  String get notifStreak100Body => '连续 100 天！你已经成为传奇。';

  @override
  String get notifStreakRiskTitle => '⚠️ 别断了连续打卡！';

  @override
  String notifStreakRiskBody(int streak) {
    return '你连续 $streak 天的记录快保不住了！快去完成任务。';
  }

  @override
  String get paywallStat1 => 'cm，你的潜力尚未解锁';

  @override
  String get paywallTitle1 => '你还能\n长高多少 cm？';

  @override
  String get paywallBullet1a => '你的遗传上限已经算出来了，想看看吗？';

  @override
  String get paywallBullet1b => '你的生活方式如何影响成长？';

  @override
  String get paywallBullet1c => '你的专属路线图正在等你';

  @override
  String get paywallStat2 => '你的专属任务已就绪';

  @override
  String get paywallTitle2 => '你的计划\n已就绪';

  @override
  String get paywallBullet2a => '每天早上 8 分钟，专为你的脊柱设计';

  @override
  String get paywallBullet2b => '睡眠、营养、喝水，全部记录';

  @override
  String get paywallBullet2c => '每天更近一步，别断了连续打卡';

  @override
  String get paywallStat3 => '实时进度曲线';

  @override
  String get paywallTitle3 => '追踪你的\n成长';

  @override
  String get paywallBullet3a => '每月测量，亲眼看到自己的成长';

  @override
  String get paywallBullet3b => '通过体态分析，马上多出 2 cm';

  @override
  String get paywallBullet3c => '进度照片，让你看到变化';

  @override
  String get paywallStat4 => '每日计划，不断升级';

  @override
  String get paywallTitle4 => '每天都\n更强一点';

  @override
  String get paywallBullet4a => '赚 XP，解锁等级，让习惯变成游戏';

  @override
  String get paywallBullet4b => '达成目标的人都走过这一步';

  @override
  String get paywallBullet4c => '现在开始，第一周免费';

  @override
  String get paywallRestore => '未找到之前的购买记录';

  @override
  String get paywallRestoreNotFound => '未找到之前的购买记录';

  @override
  String get paywallPromoCode => '有优惠码？';

  @override
  String get paywallHeightUnit => '目标身高';

  @override
  String get paywallHeightTitle => '你还能长高多少？';

  @override
  String get paywallHeightDesc =>
      '我们综合分析你的遗传、生活方式和体态，逐年给出预测。一切都不是定数：你的每一步都会让预测更新。';

  @override
  String get paywallGrowthUnit => '今年';

  @override
  String get paywallGrowthTitle => '我们陪你一起追踪成长';

  @override
  String get paywallGrowthDesc => '每次测量都会立即显示在曲线上。你能逐月、逐厘米地看到自己的进步。';

  @override
  String get paywallPostureUnit => '体态分数';

  @override
  String get paywallPostureTitle => '体态是你任务的关键';

  @override
  String get paywallPostureDesc => '3 个问题快速检查你的头部、肩膀和下背部，并给出对应的矫正练习。';

  @override
  String get paywallReportUnit => '任务完成率';

  @override
  String get paywallReportTitle => '我们每周帮你复盘';

  @override
  String get paywallReportDesc => '喝水、睡眠、任务和连续打卡都在一个页面。每周我们一起找出你的优势和不足。';

  @override
  String get paywallNutritionUnit => '每天几餐';

  @override
  String get paywallNutritionTitle => '你的完整饮食计划已就绪';

  @override
  String get paywallNutritionDesc => '从早餐到晚餐，一份完整的每日计划，蛋白质、钙、锌和维生素 D 都已经帮你算好。';

  @override
  String get paywallScoreUnit => 'BeTaller 分数';

  @override
  String get paywallScoreTitle => '一直推动你前进的系统';

  @override
  String get paywallScoreDesc => '遗传、成长、营养、睡眠和自律合成一个分数。分数一旦下降，你就能清楚看到该改进哪里。';

  @override
  String get paywallPhotosUnit => '看得见的变化';

  @override
  String get paywallPhotosTitle => '用照片证明你的改变';

  @override
  String get paywallPhotosDesc => '前后对比自动生成，每个月的照片都整齐排在你的时间线上。';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => '三步开始';

  @override
  String get journeyIntroSubtitle => '我们一起设置 BeTaller。下一步正在等你。';

  @override
  String get journeyStep1Title => '收集你的数据';

  @override
  String get journeyStep1Desc => '我们记录你的身高、年龄和生活方式，然后算出你的潜力。';

  @override
  String get journeyStep2Title => 'App 导览';

  @override
  String get journeyStep2Desc => '带你了解每个功能：它能做什么，怎么用。';

  @override
  String get journeyStep3Title => '自己上手';

  @override
  String get journeyStep3Desc => '你完成每日任务，我们帮你记录进度。';

  @override
  String get journeyNow => '进行中';

  @override
  String get journeyDone => '已完成';

  @override
  String get journeySoon => '即将开始';

  @override
  String get tourHomeStreakTitle => '你的连续打卡';

  @override
  String get tourHomeStreakDesc => '只要保持自律就会一直增长。漏掉一天就会清零。';

  @override
  String get tourHomeXpTitle => '你的等级';

  @override
  String get tourHomeXpDesc => '保持自律赚取 XP，等级就会提升。别掉队！';

  @override
  String get tourHomeGoalsTitle => '今日目标';

  @override
  String get tourHomeGoalsDesc => '一眼看到今天的任务、挑战和喝水目标，什么都不会漏掉。';

  @override
  String get tourHomeTrackTitle => '喝水和睡眠记录';

  @override
  String get tourHomeTrackDesc => '在这里几秒钟就能记录每天的喝水和睡眠。';

  @override
  String get tourPlanTabsTitle => '三个标签：今天、自律、营养';

  @override
  String get tourPlanTabsDesc => '你的每日任务、每周计划和饮食计划都在这里。';

  @override
  String get tourPlanLevelTitle => '你的自律等级';

  @override
  String get tourPlanLevelDesc => '显示你完成任务的稳定程度。升级会带来更好的效果。';

  @override
  String get tourPlanTodayTitle => '今日计划';

  @override
  String get tourPlanTodayDesc => '在这里勾选每日任务，让连续打卡不断增长。';

  @override
  String get tourPlanTodayListTitle => '你今天的任务';

  @override
  String get tourPlanTodayListDesc => '做完一项就勾一项。点任务可查看详情。';

  @override
  String get tourPlanWeekGoalsTitle => '本周';

  @override
  String get tourPlanWeekGoalsDesc => '本周要完成的满分天数、训练和测量，包括必做的那一项。';

  @override
  String get tourPlanMonthGoalsTitle => '本月';

  @override
  String get tourPlanMonthGoalsDesc => '进度照片、体态检查和本月测量：这些都不该跳过。';

  @override
  String get tourProgressHeightTitle => '你当前的身高';

  @override
  String get tourProgressHeightDesc => '显示你现在的身高和累计增长。可以在这里添加新测量。';

  @override
  String get tourProgressPhotosTitle => '进度照片';

  @override
  String get tourProgressPhotosDesc => '定期拍照，直观记录你的蜕变。';

  @override
  String get tourProgressPostureTitle => '体态分析';

  @override
  String get tourProgressPostureDesc => '通过照片分析你的体态，了解该练什么。';

  @override
  String get tourAnalysisScoreTitle => '你的 BeTaller 分数';

  @override
  String get tourAnalysisScoreDesc => '根据遗传、成长速度、营养和睡眠计算出的整体表现分数。';

  @override
  String get tourAnalysisPredictionTitle => '你的身高预测';

  @override
  String get tourAnalysisPredictionDesc => '显示你预测的最终身高和逐年变化轨迹。';

  @override
  String get tourAnalysisPeerTitle => '与同龄人对比';

  @override
  String get tourAnalysisPeerDesc => '看看你的排名，和同龄人比一比。';

  @override
  String get tourHomeGoalsRoutinesTitle => '你的任务';

  @override
  String get tourHomeGoalsRoutinesDesc => '看看今天还有多少项运动任务没完成。';

  @override
  String get tourHomeGoalsChallengesTitle => '你的挑战';

  @override
  String get tourHomeGoalsChallengesDesc => '在这里追踪进行中挑战的进度。';

  @override
  String get tourHomeGoalsWaterTitle => '你的喝水目标';

  @override
  String get tourHomeGoalsWaterDesc => '看看离每日喝水目标还有多远。';

  @override
  String get tourHomeReminderTitle => '你的下次提醒';

  @override
  String get tourHomeReminderDesc => '看看下次提醒是什么时候，也可以在这里修改。';

  @override
  String get tourHomeChallengesTitle => '你的挑战';

  @override
  String get tourHomeChallengesDesc => '完成进行中的挑战，赚取额外 XP。';

  @override
  String get tourHomeGrowthTitle => '你的成长状态';

  @override
  String get tourHomeGrowthDesc => '查看累计增长、最近一次测量的变化，以及你记录了多少次。';

  @override
  String get tourHomeExploreTitle => '探索';

  @override
  String get tourHomeExploreDesc => '营养指南、长高食谱等更多内容都在这里等你。';

  @override
  String get tourPlanProgramHeaderTitle => '你的 70 天计划';

  @override
  String get tourPlanProgramHeaderDesc => '在这个圆环里查看整体进度、当前等级和天数。';

  @override
  String get tourPlanProgramLevelsTitle => '等级';

  @override
  String get tourPlanProgramLevelsDesc => '看看你在 10 个等级中的哪一级，哪些还没解锁。';

  @override
  String get tourPlanNutritionHeaderTitle => '你的营养进度';

  @override
  String get tourPlanNutritionHeaderDesc => '追踪你完成了多少项每日营养任务。';

  @override
  String get tourPlanNutritionFirstTitle => '营养任务';

  @override
  String get tourPlanNutritionFirstDesc => '勾选那些有助于成长的饮食习惯。';

  @override
  String get tourProgressChartTitle => '成长曲线';

  @override
  String get tourProgressChartDesc => '在曲线上查看过去的测量，了解你的成长趋势。';

  @override
  String get tourProgressReportTitle => '周报';

  @override
  String get tourProgressReportDesc => '查看总结你一周进度的报告。';

  @override
  String get tourProgressHistoryTitle => '你的测量记录';

  @override
  String get tourProgressHistoryDesc => '在时间线上查看你记录过的每一次身高测量。';

  @override
  String get tourAnalysisRadarTitle => '你的平衡图';

  @override
  String get tourAnalysisRadarDesc => '在雷达图上查看遗传、成长速度、营养、睡眠和自律的平衡情况，找到你的短板。';

  @override
  String get tourAnalysisDailyNeedsTitle => '你的每日需求';

  @override
  String get tourAnalysisDailyNeedsDesc => '根据你的身高和体重，查看每天需要的蛋白质、热量、睡眠和饮水量。';

  @override
  String get journeyDataDoneTitle => '第一步完成';

  @override
  String get journeyDataDoneSubtitle => '我们已经拿到你的数据，也算出了你的潜力。接下来是 App 导览。';

  @override
  String get journeyContinue => '继续';

  @override
  String get journeyEnterApp => '进入 App';

  @override
  String get journeyProgressLabel => '新手入门';

  @override
  String get journeyTourDoneTitle => '欢迎来到 BeTaller！';

  @override
  String get journeyTourDoneSubtitle => '三个步骤你都完成了。现在轮到你了：完成第一项任务，开启你的旅程。';

  @override
  String get journeyViewPlansButton => '查看方案，开始使用';

  @override
  String get paywallRestoreLabel => '恢复购买';

  @override
  String get paywallYearly => '年度';

  @override
  String get paywallBestValue => '最划算';

  @override
  String paywallSavePercent(String percent) {
    return '省 $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/周';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/月';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/年';
  }

  @override
  String get paywallMonthly => '月度';

  @override
  String get paywallWeekly => '每周';

  @override
  String get paywallFreeTrial => '免费 3 天';

  @override
  String get paywallLoadError => '无法加载购买选项，请重试';

  @override
  String get paywallCtaAlt => '继续';

  @override
  String get paywallTrialDisclaimer => '免费 3 天 · 之后自动续订 · 随时取消';

  @override
  String get paywallYearlyDisclaimer => '按年自动续订 · 随时取消';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '免费 $days 天，之后 $price/周 · 随时取消';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '免费 $days 天，之后 $price/月 · 随时取消';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '免费 $days 天，之后 $price/年 · 随时取消';
  }

  @override
  String get paywallRenewsWeekly => '按周自动续订 · 随时取消';

  @override
  String get paywallRenewsMonthly => '按月自动续订 · 随时取消';

  @override
  String get resultCardTitle => '你的成年身高预测';

  @override
  String resultRange(String min, String max) {
    return '可能范围：$min 至 $max';
  }

  @override
  String resultPercentile(String percent) {
    return '比 $percent% 的同龄人高';
  }

  @override
  String resultGrowthLeft(String amount) {
    return '预计还能长：$amount';
  }

  @override
  String get resultFootnote => '根据父母身高和生长曲线数据估算，并非医疗建议。';

  @override
  String get postureCheckTitle => '快速体态检查';

  @override
  String get postureCheckIntro =>
      '让脚跟、臀部和肩胛骨贴墙站好，然后回答三个问题。分数根据你的回答得出；照片会保存下来，用于前后对比。';

  @override
  String get postureQHead => '不抬下巴时，你的后脑勺能贴到墙吗？';

  @override
  String get postureQHeadA1 => '能，很轻松';

  @override
  String get postureQHeadA2 => '要往后用力才行';

  @override
  String get postureQHeadA3 => '不能，有空隙';

  @override
  String get postureQShoulders => '在侧面照片里，你的肩膀和耳朵相比在什么位置？';

  @override
  String get postureQShouldersA1 => '和耳朵在一条线上';

  @override
  String get postureQShouldersA2 => '稍微靠前';

  @override
  String get postureQShouldersA3 => '明显向前扣';

  @override
  String get postureQLowerBack => '把手伸到下背部后面，空隙有多大？';

  @override
  String get postureQLowerBackA1 => '刚好能放平一只手';

  @override
  String get postureQLowerBackA2 => '完全没有空隙';

  @override
  String get postureQLowerBackA3 => '能放进一个拳头';

  @override
  String get postureCheckSave => '查看我的分数';

  @override
  String get postureCheckNote => '这是自我检查，不是医学评估。';

  @override
  String get paywallTester => '测试者';

  @override
  String get introTag1 => '预测';

  @override
  String get introTag2 => '成长';

  @override
  String get introTag3 => '追踪';

  @override
  String get introTag4 => '游戏化';

  @override
  String get introTag5 => '社区';

  @override
  String get introTitle1 => '发现你的\n身高潜力';

  @override
  String get introSubtitle1 => '根据遗传、年龄和生活方式，\n帮你算出全部潜力。';

  @override
  String get introTitle2 => '每天\n高一点';

  @override
  String get introSubtitle2 => '用专属的运动和饮食计划，\n充分发挥你的潜力。';

  @override
  String get introTitle3 => '记录\n每一厘米';

  @override
  String get introSubtitle3 => '通过每月测量，\n看到自己真实的进步。';

  @override
  String get introTitle4 => '升级，\n赢奖励';

  @override
  String get introSubtitle4 => '完成 70 天计划，\n赚取 XP，解锁新等级。';

  @override
  String get introTitle5 => '已有成千上万人\n长高了';

  @override
  String get introSubtitle5 => '加入已经达成目标的\n用户社区。';

  @override
  String get criticalWindow => '关键窗口期';

  @override
  String get heightPotentialFading => '关于你的';

  @override
  String get fadingAway => '身高潜力..';

  @override
  String get painHookDesc => '没有正确的习惯，每过一天，都可能永久错失一些厘米。但现在还来得及扭转。';

  @override
  String get painGeneticTitle => '遗传不是全部';

  @override
  String get painGeneticDesc => '遗传决定 60%，另外 40% 取决于你自己。BeTaller 就是为这 40% 而生的。';

  @override
  String get painGeneticTag => '分析';

  @override
  String get painSleepTitle => '优化你的睡眠习惯';

  @override
  String get painSleepDesc => '每晚睡好觉，生长激素分泌可提升 70%。BeTaller 自动帮你追踪睡眠，你只管睡。';

  @override
  String get painSleepTag => '追踪';

  @override
  String get painPostureTitle => '靠体态，现在就多几厘米';

  @override
  String get painPostureDesc =>
      '正确的体态能立刻让你高 1.5-3 cm。BeTaller 的每日体态任务几周就能帮你养成。';

  @override
  String get painPostureTag => '体态';

  @override
  String get painExerciseTitle => '你的专属运动计划已就绪';

  @override
  String get painExerciseDesc =>
      '晨间拉伸、悬挂、脊柱练习：BeTaller 都已为你准备好并排好日程。每天只需 8-12 分钟。';

  @override
  String get painExerciseTag => '任务';

  @override
  String get painNutritionTitle => '饮食直接影响成长';

  @override
  String get painNutritionDesc => '蛋白质、钙、维生素 D：BeTaller 每天提醒你该补什么、什么时候补。';

  @override
  String get painNutritionTag => '营养';

  @override
  String get painTrackingTitle => '亲眼见证你的成长';

  @override
  String get painTrackingDesc => '每月测量、进度照片、成长曲线：你长高的每一厘米都看得见。';

  @override
  String get painTrackingTag => '进度';

  @override
  String get selectYourGender => '选择你的性别';

  @override
  String get onboardingPredictSubtitle => '用于预测你的身高潜力，并制定专属计划。';

  @override
  String get other => '其他';

  @override
  String get whenWereYouBorn => '你是哪天出生的？';

  @override
  String get heightAndWeight => '身高和体重';

  @override
  String get parentsHeight => '父母身高';

  @override
  String get weeklyWorkout => '每周运动';

  @override
  String get workoutsPerWeek => '每周运动次数';

  @override
  String get whatsYourEthnicity => '你的族裔是？';

  @override
  String get whiteCaucasian => '白人';

  @override
  String get blackAfricanAmerican => '黑人 / 非裔';

  @override
  String get hispanicLatino => '西班牙裔 / 拉丁裔';

  @override
  String get asian => '亚洲人';

  @override
  String get middleEasternIndigenous => '中东裔 / 原住民';

  @override
  String get dontWantToAnswer => '我不想回答';

  @override
  String get footSizeLabel => '鞋码';

  @override
  String get selectYourSize => '选择你的尺码';

  @override
  String get whatsYourDreamHeight => '你的理想身高是多少？';

  @override
  String get dreamHeightCalcSubtitle => '我们会根据你填写的信息，计算达到这个身高的可能性。';

  @override
  String get dreamHeightLabel => '理想身高';

  @override
  String get sleepQuestion => '你每晚\n睡几个小时？';

  @override
  String get thousandsSucceeded => '成千上万人\n已经成功';

  @override
  String get youCanToo => '你也可以';

  @override
  String get yearsOld => '岁';

  @override
  String get verifiedLabel => '已验证';

  @override
  String get scientificData => '科学数据';

  @override
  String get longTermResults => 'BeTaller 带来\n长期效果';

  @override
  String get longTermResultsSubtitle => '很多人因为坏习惯，没能长到应有的身高。';

  @override
  String get yourFinalHeight => '你的最终身高';

  @override
  String get badHabitsLegend => '坏习惯';

  @override
  String get optimizedLegend => '优化后';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => '身高可以\n通过习惯改变';

  @override
  String get chartFact2Pct => '9-10 小时';

  @override
  String get chartFact2Desc => '理想睡眠能促进\n生长激素分泌';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => '可通过\n改善体态获得';

  @override
  String get didYouKnow => '你知道吗？';

  @override
  String get didYouKnowFact1 => '日常习惯影响你 30% 的身高';

  @override
  String get didYouKnowFact2 => '脊柱受压会让你矮 1.5-3 cm';

  @override
  String get didYouKnowFact3 => '睡眠不足会让生长激素减少 70%';

  @override
  String get transformJourneyBegins => '你的蜕变之旅\n开始了';

  @override
  String get transformJourneySubtitle => '一套完整的计划，\n一步步支持你健康成长。';

  @override
  String get week1Label => '1周';

  @override
  String get week1Title => '第 1 周';

  @override
  String get week1Desc => '脊柱排列改善，体态变好';

  @override
  String get month1Label => '1月';

  @override
  String get month1Title => '第 1 个月';

  @override
  String get month1Desc => '看到最初的变化，睡眠质量提升';

  @override
  String get month3Label => '3月';

  @override
  String get month3Title => '第 3 个月';

  @override
  String get month3Desc => '平均增长 +1.5–2.5 cm，肌肉得到发展';

  @override
  String get month6Label => '6月';

  @override
  String get month6Title => '第 6 个月';

  @override
  String get month6Desc => '发挥最大潜力，迎接新身高';

  @override
  String get reachYourGoal => '达成你的目标';

  @override
  String get journeyBullet1 => '释放你的最大潜力';

  @override
  String get journeyBullet2 => '开始以新身高生活';

  @override
  String get journeyBullet3 => '写下你的成功故事';

  @override
  String get unlockButton => '全部解锁';

  @override
  String get dreamHeightOdds => '达到理想身高\n的概率';

  @override
  String get growthCompleteLabel => '成长\n完成度';

  @override
  String get tallerThanPct => '比 76.7% 的同龄人高';

  @override
  String get levelNovice => '菜鸟';

  @override
  String get levelBuilder => '筑基者';

  @override
  String get levelGrinder => '苦练者';

  @override
  String get levelWarrior => '战士';

  @override
  String get levelGodTier => '神级';

  @override
  String get levelDesc0 => '打好基础';

  @override
  String get levelDesc1 => '加速成长';

  @override
  String get levelDesc2 => '加强训练';

  @override
  String get levelDesc3 => '突破极限';

  @override
  String get levelDesc4 => '没有付出就没有收获';

  @override
  String get levelDesc5 => '冠军心态';

  @override
  String get levelDesc6 => '精英表现';

  @override
  String get levelDesc7 => '掌控你的身体';

  @override
  String get levelDesc8 => '传奇般的自律';

  @override
  String get levelDesc9 => '最大潜力';

  @override
  String levelLabel(int level) {
    return '等级 $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '你的计划还剩 $_temp0';
  }

  @override
  String get tapLabel => '点击';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => '天';

  @override
  String get legendShort => '矮';

  @override
  String get legendBelowAvg => '低于平均';

  @override
  String get legendAverage => '平均';

  @override
  String get legendTall => '高';

  @override
  String get legendVeryTall => '很高';

  @override
  String get pctBottom5 => '后 5%';

  @override
  String get pctBottom25 => '后 25%';

  @override
  String get pctMedian => '中位数';

  @override
  String get pctTop25 => '前 25%';

  @override
  String get pctTop5 => '前 5%';

  @override
  String get fallingBehind => '落后了';

  @override
  String readTimeMinutes(int minutes) {
    return '阅读约 $minutes 分钟';
  }

  @override
  String get inThisArticle => '本文内容';

  @override
  String get nextArticle => '下一篇';

  @override
  String get purchaseUnavailable => '购买未能完成，请重试。';

  @override
  String get viewPlan => '查看方案';

  @override
  String get viewPlanSubtitle => '查看你的订阅详情';

  @override
  String predictionConfidenceHint(String percent) {
    return '添加身高测量，预测准确度可达 $percent%';
  }

  @override
  String get paywallSlideHomeTitle => '一天的安排，一屏搞定';

  @override
  String get paywallSlideHomeCaption => '任务、喝水、睡眠：合上三个圆环。';

  @override
  String get paywallSlideProgressTitle => '看见每一厘米';

  @override
  String get paywallSlideProgressCaption => '每次测量都会立即显示在曲线上。';

  @override
  String get paywallSlideAnalysisTitle => '五项指标，一张图';

  @override
  String get paywallSlideAnalysisCaption => '雷达图告诉你短板在哪。';

  @override
  String get paywallSlidePotentialTitle => '了解你的潜力';

  @override
  String get paywallSlidePotentialCaption => '看看你在同龄人中的位置。';

  @override
  String get paywallSlideDisciplineTitle => '保持连续打卡';

  @override
  String get paywallSlideDisciplineCaption => '每一天都让你的等级更高。';

  @override
  String get paywallSlideRemindersTitle => '在对的时间提醒你';

  @override
  String get paywallSlideRemindersCaption => '设好时间，剩下的交给 App。';

  @override
  String get paywallSlidePostureTitle => '改善你的体态';

  @override
  String get paywallSlidePostureCaption => '一张侧面照，一次快速自检，一套清晰的练习。';

  @override
  String paywallTrialHeadline(String days) {
    return '免费 $days 天';
  }

  @override
  String paywallTrialThen(String price) {
    return '之后 $price · 随时取消';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / 年 · 随时取消';
  }

  @override
  String get obBedtimeTitle => '你通常几点睡觉？';

  @override
  String get obBedtimeSubtitle => '睡眠提醒会设在这个时间前后。';

  @override
  String get obWorkoutTimeTitle => '你几点运动？';

  @override
  String get obWorkoutTimeSubtitle => '这样训练提醒就能准时到达。';

  @override
  String get obMealsTitle => '你一天吃几餐？';

  @override
  String get obMealsSubtitle => '点一下时间，按你自己的作息调整。';

  @override
  String obMealsCount(String count) {
    return '$count 餐';
  }

  @override
  String obMealLabel(String n) {
    return '第 $n 餐';
  }

  @override
  String get obProteinTitle => '你一天吃多少克蛋白质？';

  @override
  String get obProteinSubtitle => '大概的数字就行，我们会以此制定计划。';

  @override
  String get obCaloriesTitle => '你平均一天摄入多少热量？';

  @override
  String get obCaloriesSubtitle => '估算一下就行，之后我们可以一起调整。';

  @override
  String get obNotSure => '我不确定';

  @override
  String get silNow => '现在';

  @override
  String get silPotential => '潜力';

  @override
  String get chartMeasured => '你的测量';

  @override
  String chartPotential(String height) {
    return '潜力 $height';
  }

  @override
  String chartDream(String height) {
    return '你的目标 $height';
  }

  @override
  String get targetsTitle => '今天，为你定制';

  @override
  String get targetsSubtitle => '根据你的年龄、体重和训练计算得出。';

  @override
  String get targetProtein => '蛋白质';

  @override
  String get targetCalcium => '钙';

  @override
  String get targetVitaminD => '维生素 D';

  @override
  String get targetWater => '喝水';

  @override
  String get targetSleep => '睡眠';

  @override
  String get targetMove => '训练';

  @override
  String targetPerMeal(String g) {
    return '每餐 $g g';
  }

  @override
  String get unitHours => '小时';

  @override
  String get unitMinutes => '分钟';

  @override
  String get planStrength => '力量';

  @override
  String get planJump => '跳跃和冲刺';

  @override
  String get planMobility => '拉伸';

  @override
  String get planSport => '运动';

  @override
  String get planPosture => '体态';

  @override
  String get planRest => '休息';

  @override
  String planWeekTitle(int days) {
    return '你的一周：$days 个训练日';
  }

  @override
  String get planPreviewTitle => '你的计划已就绪';

  @override
  String planPreviewTraining(int days) {
    return '每周 $days 个训练日，为成长打造';
  }

  @override
  String planPreviewProtein(int grams) {
    return '每天 $grams g 蛋白质，分配到各餐';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours 小时睡眠，附带睡前提醒';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return '今天：$plan · $minutes 分钟';
  }

  @override
  String get nRestTitle => '今天是休息日';

  @override
  String get nRestBody => '拉伸十分钟就够了。恢复也是计划的一部分。';

  @override
  String nProteinTitle(int grams) {
    return '今日蛋白质目标：$grams g';
  }

  @override
  String nProteinBody(int grams) {
    return '每餐约 $grams g：鸡蛋、酸奶、鸡肉、扁豆。';
  }

  @override
  String nWaterTitle(String liters) {
    return '喝水目标：$liters';
  }

  @override
  String get nWaterBody => '现在喝一杯，今天就能保持进度。';

  @override
  String get nSleepTitle => '该放松准备睡觉了';

  @override
  String nSleepBody(String hours) {
    return '你的目标是 $hours 小时。关掉屏幕，调暗灯光。';
  }

  @override
  String nMeasureBody(String potential) {
    return '你的潜力：$potential。早上量一下，看看曲线的变化。';
  }

  @override
  String get nTrialDay1Title => '你的计划在等你';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return '今天：$plan，$minutes 分钟。记录你的身高，开始你的曲线。';
  }

  @override
  String get nTrialEndTitle => '你的免费试用明天结束';

  @override
  String nTrialEndBody(String price) {
    return '之后将按 $price 继续。无论如何，你的计划和进度都会保留。';
  }

  @override
  String get trophyContinue => '继续加油';

  @override
  String get guideSteps => '分步说明';

  @override
  String get guideMistakes => '常见错误';

  @override
  String get guideTip => '小贴士';

  @override
  String get homeHeroTitle => '你的身高和潜力';

  @override
  String homeHeroGap(String cm) {
    return '未来还能长 $cm';
  }

  @override
  String get anSubtitle => '你的分数、影响因素和成长方向';

  @override
  String get anScoreLabel => 'BeTaller 分数';

  @override
  String get anTierStarting => '起步';

  @override
  String get anTierBuilding => '积累';

  @override
  String get anTierRising => '上升';

  @override
  String get anTierStrong => '强劲';

  @override
  String get anTierPeak => '巅峰';

  @override
  String anTrendUp(int n) {
    return '比上周 +$n';
  }

  @override
  String anTrendDown(int n) {
    return '比上周 -$n';
  }

  @override
  String get anTrendFlat => '和上周持平';

  @override
  String get anTrendFirst => '下周开始显示每周趋势';

  @override
  String anNextTier(int n, String tier) {
    return '距 $tier 还差 $n 分';
  }

  @override
  String get anTopTier => '最高级。继续保持';

  @override
  String anCoverage(int n, int total) {
    return '基于 $total 项指标中的 $n 项';
  }

  @override
  String get anNoScoreTitle => '数据还不够';

  @override
  String get anNoScoreBody => '今天记录一下睡眠、喝水或一次训练，你的第一个分数就会出现。';

  @override
  String get anFastestWin => '最快提分';

  @override
  String get anBreakdownTitle => '你的分数由什么组成';

  @override
  String get anBreakdownHint => '每项指标根据你自己的数据打 0 到 100 分。百分比表示它所占的权重。';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => '暂无数据';

  @override
  String get anNotCounted => '不计入';

  @override
  String get anFTraining => '训练';

  @override
  String get anFConsistency => '坚持度';

  @override
  String get anFSleep => '睡眠';

  @override
  String get anFHydration => '喝水';

  @override
  String get anFNutrition => '营养';

  @override
  String get anFPosture => '体态';

  @override
  String get anFMeasuring => '测量';

  @override
  String get anFGrowth => '成长速度';

  @override
  String get anFHeadroom => '成长空间';

  @override
  String anBTraining(int done, int planned) {
    return '过去 7 天完成 $done/$planned 个计划训练日';
  }

  @override
  String get anBTrainingNone => '统计你按每周计划训练的天数。';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak 天',
    );
    return '连续 $_temp0，$days 天中有 $active 天完成了一半计划';
  }

  @override
  String get anBConsistencyNone => '统计你的连续天数，以及完成至少一半计划的天数。';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 晚',
    );
    return '平均每晚 $hours 小时，目标 $target 小时，已记录 $_temp0';
  }

  @override
  String get anBSleepNone => '过去 7 天没有睡眠记录。';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '平均每天 $litres，目标 $target，已记录 $_temp0';
  }

  @override
  String get anBHydrationNone => '过去 7 天没有喝水记录。';

  @override
  String anBNutrition(int done, int planned) {
    return '过去 7 天完成 $done/$planned 项营养习惯';
  }

  @override
  String get anBNutritionNone => '统计你计划中的蛋白质、钙、锌和维生素 D 习惯。';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天前',
    );
    return '靠墙自检 $raw/90，$_temp0';
  }

  @override
  String anBPostureToday(int raw) {
    return '靠墙自检 $raw/90，今天';
  }

  @override
  String get anBPostureNone => '还没有做过体态自检。';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天前',
    );
    return '上次测量在 $_temp0';
  }

  @override
  String get anBMeasuringToday => '今天已测量';

  @override
  String get anBMeasuringNone => '还没有测量记录。';

  @override
  String anBGrowth(String v, String e) {
    return '每年 $v，你这个年龄的常见值为 $e';
  }

  @override
  String get anBGrowthNone => '需要两次间隔至少 30 天的测量。';

  @override
  String get anBGrowthAdult => '生长板通常在 21 岁前闭合，所以成长速度不计入你的分数。';

  @override
  String anBHeadroom(String cm) {
    return '今天距你的潜力还有 $cm';
  }

  @override
  String get anATraining => '开始今天的训练';

  @override
  String get anAConsistency => '完成今天一半的计划';

  @override
  String get anASleepLog => '记录昨晚的睡眠';

  @override
  String anASleep(String target) {
    return '今晚睡 $target 小时';
  }

  @override
  String get anAHydrationLog => '记录一杯水';

  @override
  String anAHydration(String left) {
    return '今天再喝 $left';
  }

  @override
  String get anAHydrationDone => '今天已达标。明天继续';

  @override
  String get anANutrition => '勾选今天的营养习惯';

  @override
  String get anAPostureFirst => '做一次 1 分钟的体态自检';

  @override
  String get anAPostureRedo => '重新做一次体态自检';

  @override
  String get anAPostureKeep => '坚持每日体态练习';

  @override
  String get anAMeasure => '现在量一下身高';

  @override
  String get anAMeasureKeep => '下周再量一次';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '$_temp0后再量一次';
  }

  @override
  String get anAGrowth => '每 2 周测量一次来追踪';

  @override
  String get anAHeadroom => '查看你的潜力';

  @override
  String get anPotentialTitle => '你的潜力';

  @override
  String get anPotentialLabel => '预测成年身高';

  @override
  String anPotentialToGo(String cm) {
    return '还差 +$cm';
  }

  @override
  String get anPotentialReached => '你已达到预测身高';

  @override
  String get anPotentialNote => 'App 里各处显示的都是同一个数字，它只会往上调。';

  @override
  String anDreamLine(String h) {
    return '你的目标：$h';
  }

  @override
  String get anSourcesTitle => '这些厘米从哪里来';

  @override
  String get anSourcesGenes => '遗传和年龄';

  @override
  String get anSourcesHabits => '睡眠、饮食、训练';

  @override
  String get anSourcesPosture => '体态';

  @override
  String get anPctTitle => '同龄身高对比';

  @override
  String anPctValue(int p) {
    return '比 $p% 的同龄人高';
  }

  @override
  String get anPctBasis => '美国 CDC 生长曲线，同年龄同性别';

  @override
  String get anPctMore => '完整对比';

  @override
  String get anNeedsBasis => '根据你的年龄、体重和训练计算得出';

  @override
  String get anCalcium => '钙';

  @override
  String get anVitaminD => '维生素 D';

  @override
  String get anMovement => '运动';

  @override
  String get anUnitMin => '分钟';

  @override
  String get anUnitHours => '小时';

  @override
  String get anPerDay => '每天';

  @override
  String get anPerNight => '每晚';

  @override
  String get anUnlockScoreTitle => '你完整的 BeTaller 分数';

  @override
  String get anUnlockScoreBody => '分数、背后的全部九项指标，以及下一步该做什么。';

  @override
  String get anUnlockSourcesTitle => '看看你的厘米从哪里来';

  @override
  String get anUnlockNeedsTitle => '为你算好的每日需求';

  @override
  String get anUnlockCta => '解锁';

  @override
  String get anFlowResultTitle => '已保存到你的曲线';

  @override
  String get anFlowResultBody => '你过去的身高现在和测量数据、潜力显示在同一条曲线上。';

  @override
  String get anFlowOpenAnalysis => '打开你的分析';

  @override
  String anTopPct(int p) {
    return '前 $p%';
  }

  @override
  String get anNeedsTitle => '你的每日需求';

  @override
  String get pgUnlockPro => '用 Pro 解锁';

  @override
  String get pgPhotosLockedTitle => '看见你的蜕变';

  @override
  String get pgPhotosLockedBody => '每两周保存一张带身高的照片，用滑块对比任意两张。';

  @override
  String get pgTransformationTitle => '你的蜕变';

  @override
  String get pgHeightChange => '身高变化';

  @override
  String get pgDaysApart => '间隔天数';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '这两张照片相隔 $_temp0，变化了 $delta。';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '身高相同，相隔 $_temp0。体态和体形会先变，身高要几个月后才跟上。';
  }

  @override
  String get pgModeSlider => '滑块';

  @override
  String get pgModeSideBySide => '并排';

  @override
  String get pgDragToReveal => '拖动对比';

  @override
  String get pgOnePhotoTitle => '你的“之前”照片已保存';

  @override
  String pgOnePhotoBody(String date) {
    return '在 $date 用同样的姿势拍下一张，就能看到第一次对比。';
  }

  @override
  String get pgEmptyTitle => '开始你的蜕变';

  @override
  String get pgEmptyBody => '每两周拍一张，同样的姿势、同样的位置，并标上身高。几个月后，你就能在第 1 天和今天之间滑动对比。';

  @override
  String get pgTakeFirstPhoto => '拍第一张照片';

  @override
  String get pgPhotoDueNow => '该拍新照片了';

  @override
  String pgNextPhotoOn(String date) {
    return '下次拍照 $date';
  }

  @override
  String pgDayN(int n) {
    return '第 $n 天';
  }

  @override
  String get pgNewPhoto => '新照片';

  @override
  String get pgGuideTitle => '每次都用同样的姿势';

  @override
  String get pgGuideSubtitle => '拍法一致，照片才有可比性。';

  @override
  String get pgGuideGhost => '上一张照片会淡淡地显示出来，对齐它就好。';

  @override
  String get pgGuideStep1 => '站在 2 m 外，手机与胸口同高';

  @override
  String get pgGuideStep2 => '面向镜头，双脚并拢，手臂放松';

  @override
  String get pgGuideStep3 => '同样的位置、同样的光线、贴身的衣服';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => '胸口高度';

  @override
  String get pgTakePhoto => '拍照';

  @override
  String get pgFromGallery => '从相册选择';

  @override
  String get pgChoosePhoto => '选择照片';

  @override
  String get pgPostureTitle => '体态检查';

  @override
  String get pgPostureLockedTitle => '找到你的薄弱环节';

  @override
  String get pgPostureLockedBody => '给头部、肩膀和下背部打分，每个部位提供两个练习，并按周查看分数变化。';

  @override
  String get pgAreaHead => '头部';

  @override
  String get pgAreaShoulders => '肩膀';

  @override
  String get pgAreaLowerBack => '下背部';

  @override
  String get pgHeadMeaning0 => '你的头正好在肩膀上方。每天做个简短的调整来保持。';

  @override
  String get pgHeadMeaning1 => '放松时你的头会往前伸。长时间看手机的人很常见，改善起来也很快。';

  @override
  String get pgHeadMeaning2 => '你的头在肩膀前方。先解决这个：它会让你在每张照片里都显矮。';

  @override
  String get pgShouldersMeaning0 => '肩膀和耳朵在一条线上。你的上背部状态很好。';

  @override
  String get pgShouldersMeaning1 => '肩膀稍微靠前。胸肌紧绷会把肩膀往前拉；打开胸腔就能让它回位。';

  @override
  String get pgShouldersMeaning2 => '圆肩。你的上背部向前弯，站立时会让你显矮。';

  @override
  String get pgLowerBackMeaning0 => '曲度正常。你的髋部和核心让脊柱保持在正确位置。';

  @override
  String get pgLowerBackMeaning1 => '下背部偏平。温和的后伸和灵活性练习能让自然曲度恢复。';

  @override
  String get pgLowerBackMeaning2 => '腰椎前凸明显。髋屈肌紧绷会让骨盆前倾；拉伸它们并加强核心就能拉平。';

  @override
  String get pgLegacyMeaning => '这是旧版本保存的结果，没有这些问题。重新检查一次，获取这个部位的建议。';

  @override
  String get pgHowItWorks => '检查是怎么进行的';

  @override
  String get pgYourPosture => '你的体态';

  @override
  String pgCheckedOn(String date) {
    return '检查于 $date';
  }

  @override
  String get pgOutOf100 => '满分 100';

  @override
  String get pgAllAreasGood => '三个部位看起来都不错。继续保持。';

  @override
  String pgStartWith(String area) {
    return '从这里开始：$area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '比上次 $delta';
  }

  @override
  String get pgStatusGood => '良好';

  @override
  String get pgStatusFair => '还可以更好';

  @override
  String get pgStatusFix => '优先改善';

  @override
  String get pgKeepItWith => '保持方法';

  @override
  String get pgFixItWith => '改善方法';

  @override
  String get pgRetakeNow => '该做每周检查了';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '$n 天后进行下次检查',
      one: '下次检查：明天',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue => '同一面墙，同样三个问题。每周检查能看出练习是否有效。';

  @override
  String pgRetakeBodyWait(String date) {
    return '坚持做上面的练习到 $date，然后重新检查，看看有没有效果。';
  }

  @override
  String get pgRetakeCheck => '重新检查';

  @override
  String get pgRetakeAnyway => '现在重新检查';

  @override
  String get pgHistoryTitle => '你的分数';

  @override
  String pgSinceFirst(String delta) {
    return '比第一次 $delta';
  }

  @override
  String get pgHistoryOne => '这是你的第一次检查。7 天后再测一次，你的趋势就从这里开始。';

  @override
  String get pgPostureIntroTitle => '你站得有多直？';

  @override
  String get pgPostureIntroBody => '靠墙回答三个问题，大约一分钟。你会得到一个分数，以及改善每个薄弱部位的两个练习。';

  @override
  String get pgPostureStep1 => '让脚跟、臀部和肩胛骨贴墙站好。';

  @override
  String get pgPostureStep2 => '拍一张全身侧面照，方便以后回顾。';

  @override
  String get pgPostureStep3 => '如实回答三个问题。分数根据你的回答得出。';

  @override
  String get pgPostureStep4 => '每周在同一时间段重新检查一次。';

  @override
  String get pgStartCheck => '开始体态检查';

  @override
  String pgWeekRange(String start, String end) {
    return '$start 至 $end';
  }

  @override
  String get pgGradeGreat => '冠军周';

  @override
  String get pgGradeGood => '扎实的一周';

  @override
  String get pgGradeOk => '渐入佳境';

  @override
  String get pgGradeStart => '全新开始';

  @override
  String get pgTopWeek => '最佳一周';

  @override
  String pgVsLastWeek(String delta) {
    return '比上周 $delta';
  }

  @override
  String get pgDaysCompleted => '完成全部计划的天数';

  @override
  String get pgDayStreak => '连续天数';

  @override
  String pgBestDay(String day) {
    return '最佳：$day';
  }

  @override
  String get pgNextWeekFocus => '下周重点';

  @override
  String pgFocusPlan(int n, int done) {
    return '争取 $n 天完成全部计划。本周你完成了 $done 天。';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return '安排 $n 次训练。本周你完成了 $done 次。';
  }

  @override
  String get pgFocusMeasure => '量一次身高：早上、光脚、同一个位置。这样才能看到真实的变化。';

  @override
  String pgFocusKeepDay(String day) {
    return '所有目标都达成了。现在让 $day 也成为完成全部计划的一天。';
  }

  @override
  String get pgFocusKeep => '所有目标都达成，每天都完成了计划。同样的计划，同样的节奏。';

  @override
  String get pgHeightThisWeek => '本周身高';

  @override
  String pgHeightNow(String height) {
    return '现在 $height';
  }

  @override
  String get pgNoMeasurementWeek => '本周还没有测量';

  @override
  String get pgFirstMeasurement => '你的第一次测量';

  @override
  String pgStartedAt(String height) {
    return '起点 $height';
  }

  @override
  String pgPotentialAt(String height) {
    return '潜力 $height';
  }

  @override
  String pgToPotential(String cm) {
    return '距预测潜力还差 $cm。';
  }

  @override
  String get pgPotentialReached => '你已达到预测潜力。改善体态仍能让你展现出更多身高。';

  @override
  String get pgHabitsToday => '今日记录';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves 个动作 · $minutes 分钟';
  }

  @override
  String plDoneCount(int done, int total) {
    return '已完成 $done/$total';
  }

  @override
  String get plStartWorkout => '开始训练';

  @override
  String get plContinueWorkout => '继续训练';

  @override
  String get plWorkoutDoneToday => '今天的训练已完成';

  @override
  String get plTraining => '训练';

  @override
  String get plHabits => '每日习惯';

  @override
  String get plRestDayNote => '轻松的一天：做一套简短的瑜伽，为明天保持身体灵活。';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps 次';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds 秒';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds 秒（每侧）';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes 分钟';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g，分配到各餐';
  }

  @override
  String plHabitWater(String liters) {
    return '全天 $liters';
  }

  @override
  String plHabitSleep(String hours) {
    return '今晚 $hours 小时';
  }

  @override
  String get plYourRoutines => '你的任务';

  @override
  String get plNewRoutine => '新任务';

  @override
  String get plCustomEmpty => '创建你自己的任务，每天在这里打勾。';

  @override
  String plDeleteRoutineQ(String name) {
    return '删除“$name”？';
  }

  @override
  String get plHoldToDelete => '长按任务即可删除。';

  @override
  String plSetOf(int current, int total) {
    return '第 $current/$total 组';
  }

  @override
  String get plRest => '休息';

  @override
  String get plStartSet => '开始本组';

  @override
  String get plSetDone => '本组完成';

  @override
  String get plSkipRest => '跳过休息';

  @override
  String get plNextMove => '下一个动作';

  @override
  String get plSkipMove => '跳过';

  @override
  String plUpNext(String name) {
    return '下一个：$name';
  }

  @override
  String get plLastMove => '最后一个动作';

  @override
  String get plWorkoutComplete => '训练完成';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves 个动作，约 $minutes 分钟。每一次训练都算数。';
  }

  @override
  String get plEachSide => '每侧';

  @override
  String get plMoveDone => '动作完成';

  @override
  String plRepsBig(int reps) {
    return '$reps 次';
  }

  @override
  String get plSessionHint => '按自己的节奏来，做完点“完成”。';

  @override
  String plProgramDayOf(int day, int total) {
    return '第 $day/$total 天';
  }

  @override
  String get plTodayStep => '今天这一步';

  @override
  String get plTickToComplete => '勾选所有动作即可完成今天';

  @override
  String plNextDayTomorrow(int day) {
    return '第 $day 天明天开放。休息也是成长的一部分。';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
    );
    return '距等级 $level 还有 $_temp0';
  }

  @override
  String get plProgramFinished => '70 天全部完成。你完成了整个计划。';

  @override
  String plDayCompleteToast(int day) {
    return '第 $day 天完成';
  }

  @override
  String get plLevelWeek => '本等级的一周';

  @override
  String get plProgressionTitle => '难度如何递增';

  @override
  String get plNow => '现在';

  @override
  String plLevelN(int n) {
    return 'Lv $n';
  }

  @override
  String get plUnlockProgram => '解锁 70 天计划';

  @override
  String get plProgramPitch => '10 个等级，每周一级。每升一级，保持时间多几秒，跳跃次数多几次，准备好了还会加一组。';

  @override
  String plDayLocked(int day) {
    return '请先完成第 $day 天';
  }

  @override
  String plCurrentDay(int day) {
    return '第 $day 天';
  }

  @override
  String get plTodaysTargets => '今日目标';

  @override
  String get plTargetsBasis => '根据你的年龄、体重和训练计算得出';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals 餐 x $grams g';
  }

  @override
  String get plZinc => '锌';

  @override
  String get plMagnesium => '镁';

  @override
  String get plEnergy => '热量';

  @override
  String get plChecklist => '今日清单';

  @override
  String plCheckProtein(int grams) {
    return '蛋白质 $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return '钙 $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return '维生素 D $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return '喝水 $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '已勾选餐食提供 $amount';
  }

  @override
  String get plVitaminDNote => '中午让手臂和脸晒 15 分钟太阳，或服用医生同意的补充剂';

  @override
  String plWaterLogged(String liters) {
    return '已记录 $liters';
  }

  @override
  String get plMealPlan => '你的饮食计划';

  @override
  String get plMealPlanSub => '真实食物、真实克数，按你的目标定量';

  @override
  String get plSnack => '加餐';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g 蛋白质 · $calcium mg 钙 · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return '目标 $grams g';
  }

  @override
  String get plMarkEaten => '标记为已吃';

  @override
  String get plEaten => '已吃';

  @override
  String get plPlanTotal => '全天合计';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return '这些餐食提供你 $kcal kcal 中的约 $planKcal。剩下的用水果、蔬菜、面包或米饭补足。';
  }

  @override
  String get plWeeklyMenu => '每周菜单';

  @override
  String get plWeeklyMenuSub => '每天不一样的菜，同样的目标';

  @override
  String get plUnlockMenu => '解锁完整每周菜单';

  @override
  String get plRecipes => '食谱';

  @override
  String get plRecipesSub => '快手高蛋白菜品';

  @override
  String get plNutritionGuide => '营养指南';

  @override
  String get plNutritionGuideSub => '营养素、食物和补充剂';

  @override
  String plPieces(int n) {
    return '$n 个';
  }

  @override
  String get plFoodOats => '燕麦';

  @override
  String get plFoodMilk => '牛奶';

  @override
  String get plFoodBanana => '香蕉';

  @override
  String get plFoodWalnuts => '核桃';

  @override
  String get plFoodGreekYogurt => '希腊酸奶';

  @override
  String get plFoodYogurt => '酸奶';

  @override
  String get plFoodEggs => '鸡蛋';

  @override
  String get plFoodBread => '全麦面包';

  @override
  String get plFoodWhiteCheese => '菲达奶酪';

  @override
  String get plFoodHardCheese => '切达奶酪';

  @override
  String get plFoodSalad => '番茄黄瓜沙拉';

  @override
  String get plFoodOrange => '橙子';

  @override
  String get plFoodPeanutButter => '花生酱';

  @override
  String get plFoodSpinach => '菠菜';

  @override
  String get plFoodCottageCheese => '茅屋奶酪';

  @override
  String get plFoodChicken => '鸡胸肉';

  @override
  String get plFoodBulgur => '碎干小麦';

  @override
  String get plFoodAyran => '咸酸奶饮（Ayran）';

  @override
  String get plFoodTuna => '金枪鱼（罐头）';

  @override
  String get plFoodPasta => '意大利面';

  @override
  String get plFoodBeef => '瘦牛肉';

  @override
  String get plFoodRice => '米饭';

  @override
  String get plFoodChickpeas => '鹰嘴豆';

  @override
  String get plFoodSalmon => '三文鱼';

  @override
  String get plFoodBroccoli => '西兰花';

  @override
  String get plFoodPotato => '土豆';

  @override
  String get plFoodLentils => '扁豆';

  @override
  String get plFoodSardines => '沙丁鱼';

  @override
  String get plFoodAlmonds => '杏仁';

  @override
  String get plFoodKefir => '开菲尔';

  @override
  String get plFoodPumpkinSeeds => '南瓜子';

  @override
  String get wtCoffee => '咖啡';

  @override
  String get wtTea => '茶';

  @override
  String get wtCola => '可乐';

  @override
  String get wtEnergyDrink => '能量饮料';

  @override
  String get crCustomBadge => '自定义';

  @override
  String get crNameHint => '例如：晨间活力拉伸';

  @override
  String get crDoseHint => '例如：3x10 次或 3x30 秒';

  @override
  String get paywallLifetime => '终身';

  @override
  String paywallOnce(String price) {
    return '一次性 $price';
  }

  @override
  String get paywallLifetimeBadge => '无需订阅';

  @override
  String get paywallLifetimeDisclaimer => '一次性付款 · 无需订阅，不会续费';

  @override
  String get pwSlidePotentialTitle => '看见你的潜力';

  @override
  String get pwSlidePotentialCaption => '根据你的年龄、身高和父母的身高计算得出。';

  @override
  String get pwSlideTodayTitle => '每天都有计划';

  @override
  String get pwSlideTodayCaption => '简短的每日训练，配有视频指导。';

  @override
  String get pwSlideProgramTitle => '70 天，10 个等级';

  @override
  String get pwSlideProgramCaption => '每周动作都会难一点。';

  @override
  String get pwSlideNutritionTitle => '为成长而吃';

  @override
  String get pwSlideNutritionCaption => '为你定制的每日蛋白质、钙和维生素 D 目标。';

  @override
  String get pwSlideChartTitle => '看着你的曲线上升';

  @override
  String get pwSlideChartCaption => '每次测量都会落在通往潜力的路线上。';

  @override
  String get pwSlideScoreTitle => '一个分数看清你的习惯';

  @override
  String get pwSlideScoreCaption => '看看该先改哪个习惯。';

  @override
  String get pwSlidePostureTitle => '今天就站得更挺拔';

  @override
  String get pwSlidePostureCaption => '快速体态检查，以及对应的矫正动作。';

  @override
  String get pwExample => '示例';

  @override
  String pwYouLine(String now, String potential) {
    return '你：$now → 潜力 $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return '示例：$now → 潜力 $potential';
  }

  @override
  String get tv3NewEyebrow => '新功能';

  @override
  String get tv3NewTitle => 'BeTaller 迎来重大更新';

  @override
  String get tv3NewDesc => '新计划、新课程、新外观。来看看有什么新变化。';

  @override
  String get tv3PotentialTitle => '这是你的潜力';

  @override
  String get tv3PotentialDesc => '你现在的身高和你能达到的身高。计划帮你缩小差距。';

  @override
  String get tv3TodayTitle => '今日计划';

  @override
  String tv3TodayDesc(String button) {
    return '为今天准备的简短训练。点 $button，跟着做就行。';
  }

  @override
  String get tv3ProgramTitle => '70 天自律计划';

  @override
  String get tv3ProgramDesc => '10 个等级，每天一步。每一天都建立在前一天的基础上。';

  @override
  String get tv3NutritionTitle => '你的每日目标';

  @override
  String get tv3NutritionDesc => '蛋白质、钙、维生素 D 和喝水量，按你的身体算好。';

  @override
  String get tv3ChartTitle => '看你的曲线';

  @override
  String get tv3ChartDesc => '每一两周测量一次，看着你的曲线向潜力攀升。';

  @override
  String get tv3ScoreTitle => '你的 BeTaller 分数';

  @override
  String get tv3ScoreDesc => '一个数字看清你的状态。先提升最弱的部分。';

  @override
  String get tv3Next => '下一步';

  @override
  String get tv3ShowMe => '带我看看';

  @override
  String get tv3Done => '出发吧';

  @override
  String get obWhyTitle => '你为什么想长高？';

  @override
  String get obWhySubtitle => '可多选。你的计划从你的理由开始。';

  @override
  String get obWhyConfidence => '更自信';

  @override
  String get obWhyImpression => '给人更好的第一印象';

  @override
  String get obWhySports => '运动表现更好';

  @override
  String get obWhyClothes => '穿衣服更好看';

  @override
  String get obWhyPhotos => '拍照更上镜';

  @override
  String get obWhyPotential => '只是想知道我的潜力';

  @override
  String get obTriedTitle => '你用过其他长高 App 吗？';

  @override
  String get obTriedSubtitle => '没有错误答案。这能帮我们告诉你这里有什么不同。';

  @override
  String get obTriedStopped => '用过，但没坚持';

  @override
  String get obTriedStill => '用过，现在还在用';

  @override
  String get obTriedFirst => '没有，这是第一个';

  @override
  String get obTriedStoppedTitle => '光有一个数字，很难坚持下去';

  @override
  String get obTriedStoppedBody =>
      '大多数 App 只给你一个数字。BeTaller 把它变成可以打勾的每日计划，还会在你设定的时间提醒你。';

  @override
  String get obTriedStillTitle => '保留对你有用的';

  @override
  String get obTriedStillBody => 'BeTaller 补上每日执行的部分：根据你的回答制定计划，让你一步一步打勾完成。';

  @override
  String get obTriedFirstTitle => '从这里开始正合适';

  @override
  String get obTriedFirstBody => '在这里你得到的不只是一个数字。BeTaller 会把你的回答变成可以打勾的每日计划。';

  @override
  String get obTriedCardTitle => '你每天要打勾的内容';

  @override
  String get obTriedItem1 => '为你这周挑选的简短训练';

  @override
  String get obTriedItem2 => '你的蛋白质目标';

  @override
  String get obTriedItem3 => '按时关灯睡觉';

  @override
  String get obBlockTitle => '是什么在阻碍你？';

  @override
  String get obBlockSubtitle => '可多选。你的计划会帮你绕开它们。';

  @override
  String get obBlockForget => '我会忘记';

  @override
  String get obBlockTime => '时间不够';

  @override
  String get obBlockExercises => '不知道该做哪些练习';

  @override
  String get obBlockMotivation => '容易没动力';

  @override
  String get obBlockBedtime => '睡得太晚';

  @override
  String get obBlockMeals => '经常不吃饭';

  @override
  String get obFirstTitle => '长高后你第一件想做的事？';

  @override
  String get obFirstSubtitle => '想象一下。这就是你努力的方向。';

  @override
  String get obFirstWardrobe => '换一批新衣服';

  @override
  String get obFirstMuscle => '练肌肉';

  @override
  String get obFirstPhotos => '多发照片';

  @override
  String get obFirstTeam => '参加校队选拔';

  @override
  String get obFirstFeelGood => '没什么特别的，就是感觉好';

  @override
  String get obBuiltChip => '为你打造';

  @override
  String get obBuiltTitle => '围绕你打造的计划';

  @override
  String get obBuiltReason => '你的理由';

  @override
  String get obBuiltGoal => '目标';

  @override
  String get obBuiltWhen => '达成之后';

  @override
  String get obBuiltBlockers => '阻碍你的事，已有对策';

  @override
  String get obFixForget => '在你选择的时间提醒你';

  @override
  String get obFixTime => '训练时间短，大多 15 分钟左右';

  @override
  String get obFixExercises => '视频指导动作，一步一步来';

  @override
  String get obFixMotivation => '连续打卡和等级，让你坚持下去';

  @override
  String get obFixBedtime => '睡眠目标和睡前提醒';

  @override
  String get obFixMeals => '蛋白质目标和饮食计划';

  @override
  String get obNotifTitle => 'BeTaller 在关键时刻提醒你';

  @override
  String get obNotifSubtitle => '按你给出的时间设置，随时可以修改。';

  @override
  String get obNotifWorkout => '训练';

  @override
  String obNotifWorkoutDetail(String time) {
    return '在 $time 训练前 30 分钟';
  }

  @override
  String get obNotifMeal => '餐食和蛋白质';

  @override
  String obNotifMealDetail(String time) {
    return '在你 $time 吃饭时';
  }

  @override
  String get obNotifWater => '喝水';

  @override
  String get obNotifWaterDetail => '下午提醒你喝水休息';

  @override
  String get obNotifSleep => '睡前放松';

  @override
  String obNotifSleepDetail(String time) {
    return '在你 $time 睡觉前一小时';
  }

  @override
  String get obNotifAllow => '开启提醒';

  @override
  String get obNotifNotNow => '以后再说';

  @override
  String get obNotifNow => '现在';

  @override
  String get ftOneFree => '免费 1 次';

  @override
  String get ftFreeToday => '今天免费';

  @override
  String get ftContinuePro => '开通 Pro 继续';

  @override
  String get ftNotNow => '以后再说';

  @override
  String get ftOutWorkoutTitle => '你的免费训练已用完';

  @override
  String get ftOutWorkoutBody => '用 Pro 保持连续打卡：每天都有指导训练，每个动作都帮你计时。';

  @override
  String get ftOutDayTitle => '你的免费第一天结束了';

  @override
  String get ftOutDayBody =>
      '你的计划、目标和进度都还在，可以随时查看。用 Pro 保持连续打卡：每天勾选计划，记录喝水和睡眠。';

  @override
  String get ftOutPostureTitle => '你的免费体态检查已用完';

  @override
  String get ftOutPostureBody => '你的结果会保留在这里。用 Pro 每周再检查一次，看着体态一点点变好。';

  @override
  String get ftOutPhotosTitle => '你的免费照片对比已用完';

  @override
  String get ftOutPhotosBody => '这组对比会一直保留给你看。用 Pro 添加更多照片，任意两张都能对比。';

  @override
  String get ftOutReportTitle => '你的免费周报已用完';

  @override
  String get ftOutReportBody => '用 Pro 每周获取完整复盘：每天的评分、你的目标，以及一件可以做得更好的事。';

  @override
  String get ftOutScoreTitle => '你已看过免费的分数详情';

  @override
  String get ftOutScoreBody => '你的分数会一直显示。用 Pro 每天查看分数由什么组成、下一步该做什么。';

  @override
  String get ftOutArticleTitle => '你已读完免费文章';

  @override
  String get ftOutArticleBody => '那篇文章会一直为你开放。用 Pro 阅读整个文章库。';

  @override
  String get ftWhyWorkout => '指导训练是 Pro 功能';

  @override
  String get ftWhyPlan => '勾选计划是 Pro 功能';

  @override
  String get ftWhyProgram => '70 天计划是 Pro 功能';

  @override
  String get ftWhyWater => '每天记录喝水是 Pro 功能';

  @override
  String get ftWhySleep => '每天记录睡眠是 Pro 功能';

  @override
  String get ftWhyNutrition => '每日饮食计划是 Pro 功能';

  @override
  String get ftWhyPosture => '每周体态检查是 Pro 功能';

  @override
  String get ftWhyPhotos => '照片对比是 Pro 功能';

  @override
  String get ftWhyReport => '每周报告是 Pro 功能';

  @override
  String get ftWhyScore => '分数详情是 Pro 功能';

  @override
  String get ftWhyArticle => '完整文章库是 Pro 功能';

  @override
  String get ftPlanLocked => '你的计划可以随时查看。勾选完成是 Pro 功能。';

  @override
  String get ftNutritionLocked => '你的目标和餐食可以随时查看。勾选完成是 Pro 功能。';

  @override
  String get ftPreviewTag => '预览';

  @override
  String get ftPreviewTitle => '预览到此结束';

  @override
  String get ftPreviewBody => '这次训练的剩余部分是 Pro 功能。接下来的内容是：';

  @override
  String get ftFreeWorkoutUsed => '这是你的免费指导训练。开通 Pro，每天都有新训练。';

  @override
  String get ftScoreLockedTitle => '你的分数由什么组成';

  @override
  String get ftScoreLockedBody => '分数的每个组成部分、依据是什么，以及下一步该做的一件事。';

  @override
  String get ftReportLockedTitle => '你完整的一周';

  @override
  String get ftReportLockedBody => '每天对照计划的评分、你的目标、你的身高，以及下周的一个重点。';

  @override
  String get ftPhotosLockedTitle => '对比这两张';

  @override
  String get ftPhotosLockedBody => '你的免费对比已用完。开通 Pro，任意两张照片都能滑动对比。';

  @override
  String get ftArticleFreeLine => '第一篇文章免费，挑你想看的吧。';

  @override
  String get plFinishWorkout => '完成';

  @override
  String get obTriedMostApps => '大多数 App';

  @override
  String get obTriedThatsIt => '一个数字，仅此而已。';

  @override
  String get obTriedPlanLabel => '你在 BeTaller 的一天';

  @override
  String get obTriedProteinSub => '分配到各餐';

  @override
  String get obTriedSleepSub => '睡前提醒';

  @override
  String get obTriedFeatVideo => '视频指导动作';

  @override
  String get obTriedFeatReminders => '按你的时间提醒';

  @override
  String get obTriedFeatStreaks => '连续打卡和等级';

  @override
  String get obBedtimeUnknown => '不知道，不固定';

  @override
  String obBedtimeUnknownHint(String time) {
    return '根据你这个年龄需要的睡眠，我们建议 $time。随时可以修改。';
  }

  @override
  String get obWorkoutTimeUnknown => '不知道，没有固定时间';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return '我们先设为 $time，随时可以修改。';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return '建议：$time 左右睡觉。随时可以修改。';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return '建议：$time 左右训练。随时可以修改。';
  }

  @override
  String get obNotifSubtitleSuggested => '按你给出的时间设置，不确定的地方我们给了建议。随时可以修改。';

  @override
  String get plFoodBrownRice => '糙米';

  @override
  String get unitHeightTitle => '身高单位';

  @override
  String get unitWeightTitle => '体重单位';

  @override
  String get unitWaterTitle => '饮水单位';

  @override
  String get unitOptCm => '厘米';

  @override
  String get unitOptFtIn => '英尺和英寸';

  @override
  String get unitOptKg => '千克';

  @override
  String get unitOptLb => '磅';

  @override
  String get unitOptStLb => '英石和磅';

  @override
  String get unitOptLiters => '升';

  @override
  String get unitOptFlOz => '液量盎司';

  @override
  String achieveGrowthImp(String amount) {
    return '长高 $amount';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return '累计长高 $amount';
  }

  @override
  String get postureBenefitIn => '头部、肩膀和下背部。站直能多展现约 1 in 你的真实身高。';

  @override
  String get notifPostureBodyIn => '背挺直，肩膀向后。好体态 = 约 1 in 差距！';

  @override
  String get painPostureDescIn => '正确的体态能立刻让你高约 1 in。BeTaller 的每日体态任务几周就能帮你养成。';

  @override
  String get routinePostureDescIn => '背挺直，肩膀向后。每小时检查一次。好体态 = 约 1 in 差距。';

  @override
  String get sciPostureCheckIn => '正确的体态能立即让你看起来高约 1 in，还能防止脊柱受压';

  @override
  String get routineProteinDescLb => '鸡蛋、鸡肉、鱼、奶制品。每天每 lb 体重至少摄入 0.7 g 蛋白质。';

  @override
  String pwPersonalTitle(String height) {
    return '你达到 $height 的计划已就绪';
  }

  @override
  String get pwPersonalEstimate => '根据你的回答估算的潜力，不是保证';

  @override
  String pwPersonalReason(String reason) {
    return '你的理由：$reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return '在你 $time 睡觉前提醒你放松';
  }

  @override
  String get obParentUnknown => '我不知道';

  @override
  String get obParentUnknownHint => '我们会改用成年人平均身高。准确度会低一些，你随时可以在个人资料中补充。';

  @override
  String get obEthnicityWhy => '仅用于估算你不知道的父母身高。';

  @override
  String get resultNoParentNote => '缺少一位家长的身高，估算准确度较低。随时可以在个人资料中补充。';

  @override
  String get resultNoParentsNote => '缺少父母的身高，估算准确度较低。随时可以在个人资料中补充。';

  @override
  String get resultFootnoteEstimated => '根据生长曲线数据和成年人平均身高估算，并非医疗建议。';

  @override
  String get obBudgetChip => '公道价格';

  @override
  String get obBudgetTitle => 'BeTaller 的价格，每个想长高的青少年都负担得起';

  @override
  String get obBudgetDesc => '你的身高不该取决于你有多少钱。所以我们为每个国家单独定价。';

  @override
  String obBudgetWeek(String price) {
    return '在这里，一周 Pro：$price';
  }

  @override
  String get obBudgetLocalTitle => '按你的国家定价';

  @override
  String get obBudgetLocalDesc => '不是从美元换算的，而是按你所在地的消费水平设定。';

  @override
  String get obBudgetWeekTitle => '先从一周开始';

  @override
  String get obBudgetWeekDesc => '无需一次付一大笔钱。随时可在 Apple ID 设置中取消。';

  @override
  String get obBudgetAllTitle => '一个方案，全部包含';

  @override
  String get obBudgetAllDesc => '训练、睡眠、营养、体态和进度报告。';

  @override
  String get obRateTitle => 'BeTaller 的初衷是真正帮到你';

  @override
  String get obRateDesc => '如果你喜欢我们的用心和坦诚，给我们评个分，我们会非常开心。';

  @override
  String get obRateCta => '给 BeTaller 评分';

  @override
  String get obRateLater => '以后再说';
}

/// The translations for Chinese, using the Han script (`zh_Hant`).
class AppLocalizationsZhHant extends AppLocalizationsZh {
  AppLocalizationsZhHant() : super('zh_Hant');

  @override
  String get navHome => '首頁';

  @override
  String get navAnalysis => '分析';

  @override
  String get navRoutines => '我的計畫';

  @override
  String get disciplineTitle => '自律';

  @override
  String get disciplineProgramTitle => '自律計畫';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total 天';
  }

  @override
  String get disciplineCompleteDay => '完成今天';

  @override
  String disciplineDayN(int n) {
    return '第 $n 天';
  }

  @override
  String get disciplineLevels => '等級';

  @override
  String get disciplineLevelDone => '已完成';

  @override
  String get disciplineLocked => '未解鎖';

  @override
  String get disciplineTodayIs => '今天';

  @override
  String get disciplineToday => '今天';

  @override
  String get disciplineTodayPlan => '今日計畫';

  @override
  String get disciplineWeek => '本週';

  @override
  String get disciplineMonth => '本月';

  @override
  String get disciplineLevel => '自律等級';

  @override
  String disciplineStreakDays(int days) {
    return '連續 $days 天';
  }

  @override
  String disciplineToNext(int days) {
    return '再 $days 天升到下一級';
  }

  @override
  String get disciplineMaxTier => '已達最高等級';

  @override
  String get disciplineTierSpark => '火花';

  @override
  String get disciplineTierSteady => '穩定';

  @override
  String get disciplineTierSharp => '敏銳';

  @override
  String get disciplineTierSolid => '扎實';

  @override
  String get disciplineTierRelentless => '不懈';

  @override
  String get disciplineTierUnbroken => '不間斷';

  @override
  String get disciplineTierLegend => '傳奇';

  @override
  String get goalPerfectDays => '完成計畫的天數';

  @override
  String get goalWorkouts => '訓練次數';

  @override
  String get goalMeasurement => '身高測量';

  @override
  String get goalPhoto => '進度照片';

  @override
  String get goalPostureCheck => '體態檢查';

  @override
  String get disciplineAllDone => '今天完成了';

  @override
  String disciplineDayProgress(int done, int total) {
    return '已完成 $done/$total';
  }

  @override
  String get navProgress => '進度';

  @override
  String get trackingSection => '你的追蹤工具';

  @override
  String get photosBenefit => '前後對比並排看，親眼看見改變，不用只看數字。';

  @override
  String get postureBenefit => '頭、肩膀和下背。站挺一點，能多展現真實身高的 2-3 cm。';

  @override
  String get reportBenefit => '逐日替這週打分數，看看哪天鬆懈了。';

  @override
  String get photosCta => '新增照片';

  @override
  String get postureCta => '分析';

  @override
  String get reportCta => '打開報告';

  @override
  String get toolStateReady => '可使用';

  @override
  String get photosSummaryEmpty => '新增第一張照片';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count 張照片',
      one: '$count 張照片',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => '還沒有分析';

  @override
  String postureSummaryScore(int score) {
    return '體態 $score/100';
  }

  @override
  String get navProfile => '個人檔案';

  @override
  String greeting(String name) {
    return '嗨，$name';
  }

  @override
  String get currentHeight => '目前身高';

  @override
  String get target => '目標';

  @override
  String completed(String pct) {
    return '已完成 $pct%';
  }

  @override
  String remaining(String cm, String unit) {
    return '還差 +$cm $unit';
  }

  @override
  String get updateAnalysis => '更新分析';

  @override
  String get analysisSubtitle => '依過去身高與習慣取得預測';

  @override
  String get dailyRoutines => '每日任務';

  @override
  String get allRoutinesDone => '所有任務都完成了！';

  @override
  String get water => '喝水';

  @override
  String get sleep => '睡眠';

  @override
  String get growthSummary => '成長摘要';

  @override
  String get total => '總計';

  @override
  String get last => '最近';

  @override
  String get measurement => '測量';

  @override
  String get dailyTip => '今日小撇步';

  @override
  String get waterTracking => '喝水紀錄';

  @override
  String get waterGoalReached => '已達成每日目標';

  @override
  String waterRemaining(String amount) {
    return '還差 $amount';
  }

  @override
  String get undo => '復原';

  @override
  String waterToday(String amount) {
    return '今天：$amount L';
  }

  @override
  String get sleepTracking => '睡眠紀錄';

  @override
  String sleepTarget(String hours) {
    return '目標：$hours 小時';
  }

  @override
  String get hours => '小時';

  @override
  String get save => '儲存';

  @override
  String get cancel => '取消';

  @override
  String get analysis => '分析';

  @override
  String get betallerScore => 'BeTaller 分數';

  @override
  String get genetic => '遺傳';

  @override
  String get growth => '成長';

  @override
  String get nutrition => '營養';

  @override
  String get sleepLabel => '睡眠';

  @override
  String get discipline => '自律';

  @override
  String get improveScore => '提升你的分數';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => '營養亮紅燈！';

  @override
  String get nutritionStrengthen => '加強營養';

  @override
  String get sleepRecordAdd => '新增睡眠紀錄';

  @override
  String get sleepPoor => '作息不規律';

  @override
  String get sleepImprove => '改善睡眠';

  @override
  String get startToday => '今天就開始！';

  @override
  String routinesRemaining(int count) {
    return '還剩 $count 項任務';
  }

  @override
  String get keepStreak => '保持連續紀錄';

  @override
  String get addFirstMeasurement => '新增第一筆測量';

  @override
  String get addMeasurement => '新增測量';

  @override
  String waterHalfNotReached(String amount) {
    return '今天喝水還不到目標的一半，再喝 ${amount}L 吧。';
  }

  @override
  String waterAlmostDone(String amount) {
    return '再喝 ${amount}L 就達標，快到了！';
  }

  @override
  String bmiLow(String bmi) {
    return '你的 BMI 是 $bmi，有點偏低。多補充蛋白質和熱量。';
  }

  @override
  String get bodyFactsTitle => '你的身體';

  @override
  String get dailyNeedsTitle => '你的每日目標';

  @override
  String bmiHigh(String bmi) {
    return '你的 BMI 是 $bmi，有點偏高。注意健康飲食。';
  }

  @override
  String get nutritionDefault => '完成喝水目標，維持均衡飲食。';

  @override
  String sleepNoRecord(String hours) {
    return '今天還沒有睡眠紀錄。目標睡 $hours 小時，記得記錄。';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return '你今天睡了 $current 小時，少了 $missing 小時。早點上床吧！';
  }

  @override
  String sleepAlmost(String hours) {
    return '快到了。睡滿 $hours 小時，最能幫助生長激素分泌。';
  }

  @override
  String get sleepGood => '作息很棒！繼續保持。';

  @override
  String noRoutinesDone(int total) {
    return '今天還沒完成任何任務。從 $total 項中挑一項開始吧！';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '今天完成 $done/$total 項任務，還差 $left 項！';
  }

  @override
  String streakBuilding(int needed) {
    return '今天做得很好！再 $needed 天就能開始連續紀錄。';
  }

  @override
  String streakContinue(int days) {
    return '連續 $days 天！持續下去分數會越來越高。';
  }

  @override
  String get noMeasurements => '還沒有身高測量。新增第一筆，預測會更準確。';

  @override
  String fewMeasurements(int count) {
    return '再新增 $count 筆測量，就能計算成長速度。';
  }

  @override
  String goodMeasurements(int count) {
    return '你已有 $count 筆測量。達到 5 筆能大幅提升準確度。';
  }

  @override
  String get keepMeasuring => '持續新增測量，每筆新資料都會讓預測更準。';

  @override
  String get heightPrediction => '身高預測';

  @override
  String get predictedHeightAt21 => '21 歲預測身高';

  @override
  String get predictionMethod => '綜合遺傳（父母）、成長速度、BMI 與年齡資料計算。';

  @override
  String get growthStatus => '成長狀態';

  @override
  String get growthRemaining => '還能長的空間';

  @override
  String get growthBreakdown => '這些公分從哪裡來';

  @override
  String get geneticGainLabel => '遺傳增長';

  @override
  String get lifestyleLabel => '生活習慣';

  @override
  String get geneticCeilingLabel => '上限';

  @override
  String get reachableTargetHeight => '你可達成的目標身高';

  @override
  String get geneticCeilingProgress => '距離遺傳上限的進度';

  @override
  String get completionLabel => '完成度';

  @override
  String get growthVelocity => '成長速度';

  @override
  String get noData => '無資料';

  @override
  String growthRate(String rating) {
    return '成長速度：$rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => '熱量';

  @override
  String get kcalDay => 'kcal/天';

  @override
  String get daily => '每日';

  @override
  String get protein => '蛋白質';

  @override
  String get minimum => '最少';

  @override
  String get age => '年齡';

  @override
  String get male => '男生';

  @override
  String get female => '女生';

  @override
  String get yearlyPrediction => '逐年預測';

  @override
  String ageYear(int age) {
    return '$age 歲';
  }

  @override
  String get progressTitle => '進度追蹤';

  @override
  String get totalGrowth => '總計';

  @override
  String get lastDiff => '最近變化';

  @override
  String get measurementCount => '測量';

  @override
  String get heightChart => '身高圖表';

  @override
  String get chartMinData => '至少需要 2 筆測量才能顯示圖表';

  @override
  String get chartInstruction => '新增測量，就能看到你的進度圖表！';

  @override
  String get addMeasurementButton => '新增測量';

  @override
  String get measurementHistory => '測量紀錄';

  @override
  String get deleteTitle => '刪除測量';

  @override
  String get deleteMessage => '確定要刪除這筆測量嗎？';

  @override
  String get dismiss => '取消';

  @override
  String get delete => '刪除';

  @override
  String get newMeasurement => '新增身高測量';

  @override
  String get routines => '任務';

  @override
  String streakDays(int days) {
    return '$days 天';
  }

  @override
  String get progressStatus => '進度狀態';

  @override
  String get completedLabel => '完成！';

  @override
  String get all => '全部';

  @override
  String get exercise => '運動';

  @override
  String get posture => '體態';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
      one: '$days 天',
    );
    return '最佳：$_temp0';
  }

  @override
  String get editProfile => '編輯個人檔案';

  @override
  String get editProfileSubtitle => '更新身高、體重、年齡資料';

  @override
  String get name => '名字';

  @override
  String birthDate(String date) {
    return '生日：$date';
  }

  @override
  String get heightCm => '身高（cm）';

  @override
  String get weightKg => '體重（kg）';

  @override
  String get fatherHeight => '爸爸的身高（cm）';

  @override
  String get motherHeight => '媽媽的身高（cm）';

  @override
  String get notifications => '通知';

  @override
  String get reminderNextLabel => '下次提醒';

  @override
  String get reminderManageHint => '管理你的提醒';

  @override
  String get reminderOffCta => '開啟通知';

  @override
  String get stateOn => '開';

  @override
  String get stateOff => '關';

  @override
  String get reminderMasterTitle => '通知';

  @override
  String reminderActiveCount(int count) {
    return '已開啟 $count 個提醒';
  }

  @override
  String get reminderBuiltIn => '內建提醒';

  @override
  String get reminderYourOwn => '自訂提醒';

  @override
  String get reminderAdd => '新增提醒';

  @override
  String get reminderDays => '日期';

  @override
  String get reminderEveryDay => '每天';

  @override
  String get reminderLabelHint => '要提醒你什麼？';

  @override
  String get reminderEmptyHint => '新增你自己的提醒：訓練、維他命、伸展，什麼都可以。';

  @override
  String get reminderCustom => '提醒';

  @override
  String get reminderCustomBody => '你設定的時間到了。';

  @override
  String get reminderExercise => '運動';

  @override
  String get reminderNutrition => '營養';

  @override
  String get reminderWater => '喝水';

  @override
  String get reminderPosture => '體態';

  @override
  String get reminderRoutine => '每日任務';

  @override
  String get reminderSleep => '睡眠';

  @override
  String get reminderMeasurement => '身高測量';

  @override
  String get notificationsOn => '提醒已開啟';

  @override
  String get notificationsOff => '提醒已關閉';

  @override
  String get premium => '升級 Premium';

  @override
  String get premiumSubtitle => '解鎖所有功能';

  @override
  String get rateUs => '幫我們評分';

  @override
  String get rateSubtitle => '喜歡這個 App 嗎？給我們 5 顆星吧！';

  @override
  String get share => '分享 App';

  @override
  String get shareSubtitle => '把 BeTaller 推薦給朋友';

  @override
  String get shareText =>
      '我用 BeTaller 發現了自己的長高潛力！你也試試：https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => '意見回饋';

  @override
  String get feedbackSubtitle => '聯絡我們';

  @override
  String get resetData => '重設所有資料';

  @override
  String get resetSubtitle => '所有資料都會被刪除';

  @override
  String get resetTitle => '重設資料';

  @override
  String get resetMessage => '所有資料都會被刪除，並回到初始設定畫面。此操作無法復原！';

  @override
  String get reset => '重設';

  @override
  String get premiumSoon => 'Premium 即將推出！';

  @override
  String get brandingSubtitle => '發現你的長高潛力';

  @override
  String get statistics => '統計';

  @override
  String get profileGroupSupport => '支援';

  @override
  String get profileGroupAccount => '帳號';

  @override
  String get profileGroupApp => 'App';

  @override
  String get profileGroupDanger => '危險區域';

  @override
  String profileMemberSince(String date) {
    return '自 $date 起';
  }

  @override
  String get profileYourJourney => '你的旅程';

  @override
  String get profileTotalGrowth => '總計';

  @override
  String get currentStreak => '目前連續';

  @override
  String get bestStreakLabel => '最佳連續';

  @override
  String get achievementLabel => '成就';

  @override
  String get achievements => '成就';

  @override
  String get achievementUnlockedTitle => '🏆 成就解鎖！';

  @override
  String get reminderTapHint => '點一下即可修改時間和日期';

  @override
  String get earned => '已獲得！';

  @override
  String get notEarned => '尚未獲得';

  @override
  String get ok => '好';

  @override
  String get language => '語言';

  @override
  String get languageSubtitle => '變更 App 語言';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => '發現你的長高潛力';

  @override
  String get onboardingMeetYou => '先來認識你';

  @override
  String get onboardingInfoNeeded => '分析需要一些基本資料。';

  @override
  String get gender => '性別';

  @override
  String get birthDateLabel => '生日';

  @override
  String get bodyMeasurements => '身體數據';

  @override
  String get bodyInfo => '分析需要你目前的身高和體重。';

  @override
  String get geneticData => '遺傳資料';

  @override
  String get geneticInfo => '父母的身高決定你的遺傳潛力。';

  @override
  String get pastHeights => '過去的身高';

  @override
  String get pastHeightsInfo => '輸入你記得的各年齡身高，可以留白。';

  @override
  String get heightHint => '輸入身高...';

  @override
  String get ageLabel => '歲';

  @override
  String get habits => '你的習慣';

  @override
  String get habitsInfo => '生活習慣會直接影響預測。';

  @override
  String get weeklyExercise => '每週運動';

  @override
  String get dailySleep => '每日睡眠';

  @override
  String get nutritionQuality => '飲食品質';

  @override
  String get nutritionDesc => '蛋白質、乳製品、蔬菜、水果攝取';

  @override
  String get nutritionBad => '很差';

  @override
  String get nutritionPoor => '偏差';

  @override
  String get nutritionMedium => '普通';

  @override
  String get nutritionGood => '良好';

  @override
  String get nutritionGreat => '很棒';

  @override
  String get startAnalysis => '開始分析';

  @override
  String get continueBtn => '繼續';

  @override
  String get analyzeBtn => '分析';

  @override
  String get analyzing => '分析中';

  @override
  String get analysisComplete => '完成！';

  @override
  String get analysisDataReceivedTitle => '已收到資料';

  @override
  String get analysisDataReceivedSubtitle => '正在開始分析...';

  @override
  String get yourScore => '你的 BeTaller 分數';

  @override
  String get letsStart => '開始吧';

  @override
  String get splashJourneySubtitle => '你的旅程開始了。🚀';

  @override
  String get splashPlanSubtitle => '你的專屬計畫準備好了。\n準備好發現你的長高潛力了嗎？';

  @override
  String get doneBtn => '完成';

  @override
  String get analysisStep1 => '正在分析遺傳資料...';

  @override
  String get analysisStep2 => '正在計算成長速度...';

  @override
  String get analysisStep3 => '正在處理營養與睡眠資料...';

  @override
  String get analysisStep4 => '正在產生身高預測...';

  @override
  String get analysisStep5 => '正在計算 BeTaller 分數...';

  @override
  String growthPotential(String cm, String unit) {
    return '+$cm $unit 成長潛力';
  }

  @override
  String get heightAt21 => '21 歲時';

  @override
  String confidenceLevel(String pct) {
    return '$pct% 信心水準';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return '範圍 $min - $max $unit';
  }

  @override
  String get currentLabel => '目前';

  @override
  String get predictedLabel => '預測';

  @override
  String get yearlyPredictions => '逐年預測';

  @override
  String get tipMorningMeasure => '早上量身高。白天椎間盤受壓會讓你稍微變矮，所以早上量最準。';

  @override
  String get tipProteinSpread => '把蛋白質分散到各餐，不要一次吃完，每餐都吃一點。';

  @override
  String get tipGrowthHormone => '生長激素在睡眠時分泌最多。晚上 10 點到凌晨 2 點要在睡覺！';

  @override
  String get tipVitaminD => '每天曬太陽 15 分鐘能增加維生素 D 合成，而維生素 D 是吸收鈣質的關鍵。';

  @override
  String get tipBarHanging => '單槓懸吊能減輕脊椎壓力。每天試試 3x30 秒。';

  @override
  String get tipSwimming => '游泳是全身運動的首選，也有助於支持長高。';

  @override
  String get tipStress => '壓力會抑制生長激素。用冥想和瑜伽來減壓。';

  @override
  String get routineMorningStretch => '早晨伸展';

  @override
  String get routineMorningStretchDesc => '起床後馬上做 10 分鐘伸展，拉伸脊椎和腿部肌肉。';

  @override
  String get routineBarHanging => '單槓懸吊';

  @override
  String get routineBarHangingDesc => '抓住單槓懸吊，伸展脊椎。3 組 x 30 秒。';

  @override
  String get routineCobraStretch => '眼鏡蛇式伸展';

  @override
  String get routineCobraStretchDesc => '趴下後撐起上半身，伸展脊椎。3 組 x 15 秒。';

  @override
  String get routineJumping => '跳躍訓練';

  @override
  String get routineJumpingDesc => '跳繩或深蹲跳，刺激生長板。3 組 x 20 下。';

  @override
  String get routineSwimming => '游泳或籃球';

  @override
  String get routineSwimmingDesc => '做一項有助長高的運動，至少 30 分鐘。';

  @override
  String get routineYoga => '晚間瑜伽與伸展';

  @override
  String get routineYogaDesc => '睡前做瑜伽和伸展，釋放壓力、放鬆肌肉。';

  @override
  String get routineProtein => '攝取蛋白質';

  @override
  String get routineProteinDesc => '蛋、雞肉、魚、乳製品。每天至少 1.5g/kg 蛋白質。';

  @override
  String get routineCalcium => '鈣與維生素 D';

  @override
  String get routineCalciumDesc => '喝牛奶、吃起司和優格，曬太陽 15 分鐘。對骨骼發育很重要。';

  @override
  String get routineWater => '喝水目標';

  @override
  String get routineWaterDesc => '每天至少喝 2-3 公升水，對代謝和成長很重要。';

  @override
  String get routineAvoidJunk => '避開垃圾食物';

  @override
  String get routineAvoidJunkDesc => '遠離速食、含糖飲料和加工食品。';

  @override
  String get routineSleep => '優質睡眠（8-10 小時）';

  @override
  String get routineSleepDesc => '生長激素在睡眠時分泌。晚上 10 點到早上 6 點是黃金時段。';

  @override
  String get routineNoScreen => '睡前遠離螢幕';

  @override
  String get routineNoScreenDesc => '睡前 1 小時放下手機和電腦，別妨礙褪黑激素分泌。';

  @override
  String get routinePosture => '體態檢查';

  @override
  String get routinePostureDesc => '背打直、肩膀往後。每小時檢查一次。好體態 = 差 2-3 cm。';

  @override
  String get routineWallStand => '靠牆站立';

  @override
  String get routineWallStandDesc => '背靠牆站：腳跟、臀部、肩膀、頭都貼牆。維持 5 分鐘。';

  @override
  String get routineSprintIntervals => '衝刺間歇訓練';

  @override
  String get routineSprintIntervalsDesc => '短時間高強度衝刺，能大量促進生長激素分泌。';

  @override
  String get routineHiitWorkout => 'HIIT 訓練';

  @override
  String get routineHiitWorkoutDesc => '高強度間歇訓練，盡可能提高生長激素分泌。';

  @override
  String get routineSquats => '徒手深蹲';

  @override
  String get routineSquatsDesc => '徒手深蹲能刺激腿部和脊椎的生長板。';

  @override
  String get routineDeadliftStretch => '硬舉式伸展';

  @override
  String get routineDeadliftStretchDesc => '硬舉式伸展可減輕脊椎壓力，維護椎間盤健康。';

  @override
  String get routineOverheadPress => '過頭推舉';

  @override
  String get routineOverheadPressDesc => '過頭推舉能伸展脊椎，強化維持體態的肌肉。';

  @override
  String get routineSkippingRope => '跳繩';

  @override
  String get routineSkippingRopeDesc => '反覆跳繩能刺激下肢的生長板。';

  @override
  String get routinePilatesCore => '皮拉提斯核心';

  @override
  String get routinePilatesCoreDesc => '皮拉提斯核心訓練有助脊椎排列和體態。';

  @override
  String get routineInversionHang => '倒立懸吊';

  @override
  String get routineInversionHangDesc => '倒立能減輕椎間盤壓力，可暫時增加 1-2cm。';

  @override
  String get routineZincIntake => '富含鋅的食物';

  @override
  String get routineZincIntakeDesc => '全天攝取富含鋅的食物，幫助生長激素生成。';

  @override
  String get routineVitaminDSunlight => '維生素 D 與日照';

  @override
  String get routineVitaminDSunlightDesc => '至少曬 15 分鐘太陽，幫助合成維生素 D 和骨骼生長。';

  @override
  String get routineArginineFoods => '富含精胺酸的食物';

  @override
  String get routineArginineFoodsDesc => '吃富含精胺酸的食物，刺激生長激素分泌。';

  @override
  String get routineDailyCalories => '每日熱量目標';

  @override
  String get routineDailyCaloriesDesc => '達成每日熱量目標。吃太少會拖慢成長。';

  @override
  String get routineSleepEnvironment => '打造好睡環境';

  @override
  String get routineSleepEnvironmentDesc => '營造黑暗、涼爽的睡眠環境，讓褪黑激素和生長激素充分分泌。';

  @override
  String get routinePreSleepRoutine => '睡前放鬆';

  @override
  String get routinePreSleepRoutineDesc => '固定的睡前習慣能讓深層睡眠品質提升 23%。';

  @override
  String get routineNeckStretches => '頸部伸展';

  @override
  String get routineNeckStretchesDesc => '頸部伸展能舒緩壓迫，改善頸椎排列。';

  @override
  String get routineShoulderRolls => '轉肩與開肩';

  @override
  String get routineShoulderRollsDesc => '打開肩膀能改善駝背前傾，看起來可高 1-2cm。';

  @override
  String get achieveCommitment => '全心投入';

  @override
  String get achieveCommitmentDesc => '填完所有資料、完整探索 App 並開始使用';

  @override
  String get achieveFirstDay => '第一步';

  @override
  String get achieveFirstDayDesc => '完成你的第一天';

  @override
  String get achieveThreeStreak => '連續 3 天';

  @override
  String get achieveThreeStreakDesc => '連續 3 天完成任務';

  @override
  String get achieveWeekStreak => '連續 7 天';

  @override
  String get achieveWeekStreakDesc => '連續 7 天完成任務';

  @override
  String get achieveTwoWeekStreak => '連續 14 天';

  @override
  String get achieveTwoWeekStreakDesc => '連續堅持 14 天';

  @override
  String get achieveMonthStreak => '連續 30 天';

  @override
  String get achieveMonthStreakDesc => '連續完成 30 天';

  @override
  String get achieveTwoMonthStreak => '連續 60 天';

  @override
  String get achieveTwoMonthStreakDesc => '連續完成 60 天';

  @override
  String get achieveHundredStreak => '連續 100 天';

  @override
  String get achieveHundredStreakDesc => '連續完成 100 天';

  @override
  String get achieveFirstMeasure => '第一次測量';

  @override
  String get achieveFirstMeasureDesc => '記錄你的第一筆身高';

  @override
  String get achieveThreeMeasures => '追蹤者';

  @override
  String get achieveThreeMeasuresDesc => '記錄 3 筆身高';

  @override
  String get achieveFiveMeasures => '規律追蹤';

  @override
  String get achieveFiveMeasuresDesc => '記錄 5 筆身高';

  @override
  String get achieveTenMeasures => '數據獵人';

  @override
  String get achieveTenMeasuresDesc => '記錄 10 筆身高';

  @override
  String get achieveFirstCm => '第一公分';

  @override
  String get achieveFirstCmDesc => '累計長高 1 cm';

  @override
  String get achieveThreeCm => '長高 3 cm';

  @override
  String get achieveThreeCmDesc => '累計長高 3 cm';

  @override
  String get achieveFiveCm => '長高 5 cm';

  @override
  String get achieveFiveCmDesc => '累計長高 5 cm';

  @override
  String get achieveTenCm => '長高 10 cm';

  @override
  String get achieveTenCmDesc => '累計長高 10 cm';

  @override
  String get quote1 => '每天都比昨天更好一點。';

  @override
  String get quote2 => '長高不是一夜之間的事，但每一夜都讓你更接近。';

  @override
  String get quote3 => '成長需要耐心，繼續加油！';

  @override
  String get quote4 => '今天踏出的一步，是明天的基礎。';

  @override
  String get quote5 => '動力用完的地方，就是自律開始的地方。';

  @override
  String get quote6 => '你的身體會感謝你，繼續加油！';

  @override
  String get quote7 => '你的潛力有多大，由你自己決定。';

  @override
  String get quote8 => '小小的步伐，帶來大大的改變。';

  @override
  String get quote9 => '最好的投資，就是投資自己。';

  @override
  String get quote10 => '你每天都離目標更近一點。';

  @override
  String get quote11 => '改變很難，但後悔更難。';

  @override
  String get quote12 => '身體是你的殿堂，好好照顧它。';

  @override
  String get quote13 => '你的對手是昨天的自己。今天就超越它！';

  @override
  String get quote14 => 'BeTaller = 耐心 + 自律 + 信念';

  @override
  String get quote15 => '相信自己，過程會塑造你。';

  @override
  String get quote16 => '今天別說做不到，明天就不會後悔。';

  @override
  String get quote17 => '每天都要進步，哪怕只有 1%。';

  @override
  String get quote18 => '鏡子會看見你的進步，耐心一點。';

  @override
  String get bmiNormal => '正常';

  @override
  String get bmiUnderweight => '過輕';

  @override
  String get bmiOverweight => '過重';

  @override
  String get bmiObese => '肥胖';

  @override
  String get velocityExcellent => '非常好';

  @override
  String get velocityNormal => '正常';

  @override
  String get velocitySlow => '偏慢';

  @override
  String get velocityVeryLow => '很低';

  @override
  String durationMinutes(String min) {
    return '$min 分鐘';
  }

  @override
  String get durationAllDay => '全天';

  @override
  String get durationNight => '晚上';

  @override
  String durationHours(String hours) {
    return '$hours 小時';
  }

  @override
  String get onboardingStep1 => '輸入你的個人資料';

  @override
  String get onboardingStep2 => '分享你過去的身高';

  @override
  String get onboardingStep3 => '評估你的習慣';

  @override
  String get onboardingStep4 => '查看你的預測和分數';

  @override
  String get hoursShort => '小時';

  @override
  String get selectLanguage => '選擇語言';

  @override
  String get systemLanguage => '系統語言';

  @override
  String get emailSubject => 'BeTaller 意見回饋';

  @override
  String get pastHeightsTip => '不記得的年齡可以留白，填 1-2 筆過去的身高就夠了。';

  @override
  String get obPastHeightsTitle => '過去的身高';

  @override
  String get obPastHeightsSubPart1 => '過去的身高能讓預測更準確。';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return '你 $age 歲時多高？';
  }

  @override
  String get obSkip => '略過';

  @override
  String get obNext => '下一步';

  @override
  String get obSkipAll => '全部略過';

  @override
  String get currentSuffix => '（目前）';

  @override
  String personalizedProtein(String amount) {
    return '蛋、雞肉、魚、乳製品。每天至少吃 ${amount}g 蛋白質。';
  }

  @override
  String personalizedWater(String amount) {
    return '每天至少喝 ${amount}L 水，對代謝和成長很重要。';
  }

  @override
  String personalizedSleep(String hours) {
    return '生長激素在睡眠時分泌。至少睡 $hours 小時，晚上 10 點到早上 6 點是黃金時段。';
  }

  @override
  String personalizedCalcium(String calories) {
    return '喝牛奶、吃起司和優格，曬太陽 15 分鐘。每日熱量目標：$calories kcal。';
  }

  @override
  String get scoreS => '太棒了！你正接近潛力的巔峰。';

  @override
  String get scoreA => '表現很好！再進步一點就能登頂。';

  @override
  String get scoreB => '方向正確。多專注在每日任務和營養上。';

  @override
  String get scoreC => '還有進步空間。規律執行任務會帶來改變。';

  @override
  String get scoreD => '潛力很大，但你需要開始行動。';

  @override
  String get scoreF => '現在就開始！每天一小步，差別很大。';

  @override
  String get cmPerYear => 'cm/年';

  @override
  String get howToDoIt => '怎麼做';

  @override
  String get musclesTargeted => '鍛鍊的肌肉與骨骼';

  @override
  String get scientificBasis => '科學根據';

  @override
  String setXofY(String current, String total) {
    return '第 $current/$total 組';
  }

  @override
  String restBeforeSet(String set) {
    return '第 $set 組前休息';
  }

  @override
  String get allSetsComplete => '所有組數完成！';

  @override
  String get setTimer => '每組計時';

  @override
  String get setTracker => '組數追蹤';

  @override
  String get builtInTimer => '內建計時器';

  @override
  String get markComplete => '標記為完成';

  @override
  String get markIncomplete => '標記為未完成';

  @override
  String get done => '完成';

  @override
  String get doneExclamation => '完成！';

  @override
  String get start => '開始';

  @override
  String get pause => '暫停';

  @override
  String get resetTimer => '重設';

  @override
  String get skipRest => '略過休息';

  @override
  String get restart => '重新開始';

  @override
  String get perSet => '每組';

  @override
  String get rest => '休息';

  @override
  String get reps => '下';

  @override
  String get difficultyBeginner => '初級';

  @override
  String get difficultyIntermediate => '中級';

  @override
  String get difficultyAdvanced => '進階';

  @override
  String get learnTitle => '知識';

  @override
  String get learnSubtitle => '有科學根據的成長知識';

  @override
  String get categoryAll => '全部';

  @override
  String get categoryScience => '科學';

  @override
  String get categoryNutrition => '營養';

  @override
  String get categoryExercise => '運動';

  @override
  String get categorySleep => '睡眠';

  @override
  String get categoryMyths => '迷思';

  @override
  String get scientificReferences => '科學文獻';

  @override
  String get relatedRoutines => '相關任務';

  @override
  String get nutritionTitle => '營養';

  @override
  String get sectionMealPlan => '菜單';

  @override
  String get sectionNutrients => '營養素';

  @override
  String get sectionFoods => '食物';

  @override
  String get sectionSupplements => '補充品';

  @override
  String todaysPlan(String day) {
    return '今日菜單：$day';
  }

  @override
  String get breakfast => '早餐';

  @override
  String get lunch => '午餐';

  @override
  String get dinner => '晚餐';

  @override
  String get snacks => '點心';

  @override
  String get searchFoods => '搜尋食物...';

  @override
  String nFoods(String count) {
    return '$count 種食物';
  }

  @override
  String dailyLabel(String amount) {
    return '每日：$amount';
  }

  @override
  String get dailyNeedByAge => '各年齡每日需求';

  @override
  String agePrefix(String range) {
    return '$range 歲';
  }

  @override
  String get topFoodSources => '主要食物來源';

  @override
  String get categoryDairy => '乳製品';

  @override
  String get categoryMeatFish => '肉類與魚';

  @override
  String get categoryVegetables => '蔬菜';

  @override
  String get categoryFruits => '水果';

  @override
  String get categoryGrains => '穀物與豆類';

  @override
  String get categoryNutsSeeds => '堅果與種子';

  @override
  String get weeklyReportTitle => '每週報告';

  @override
  String get weeklyScoreLabel => '本週分數';

  @override
  String get weeklyDailyCompletion => '逐日表現';

  @override
  String get weeklyHabits => '習慣';

  @override
  String get overview => '總覽';

  @override
  String get routinesLabel => '任務';

  @override
  String get streakLabel => '連續';

  @override
  String get heightLabel => '身高';

  @override
  String get weightLabel => '體重';

  @override
  String get dadLabel => '爸爸';

  @override
  String get motherLabel => '媽媽';

  @override
  String get metricShort => '公制';

  @override
  String get imperialShort => '英制';

  @override
  String get dailyScores => '每日分數';

  @override
  String get waterToday2 => '今日喝水';

  @override
  String get sleepToday => '今日睡眠';

  @override
  String get routineCompletion => '任務完成度';

  @override
  String get xpAndLevel => 'XP 與等級';

  @override
  String xpToNextLevel(String xp) {
    return '再 $xp XP 升到下一級';
  }

  @override
  String get activeChallenges => '進行中的挑戰';

  @override
  String nOfMCompleted(String n, String m) {
    return '已完成 $n/$m';
  }

  @override
  String get shareYourProgress => '分享你的進度';

  @override
  String get shareComingSoon => '分享功能即將推出！';

  @override
  String get premiumTest => 'Premium（測試）';

  @override
  String get premiumActive => '已啟用';

  @override
  String get premiumFree => '免費';

  @override
  String get weeklyReportMenu => '每週報告';

  @override
  String get weeklyReportMenuSubtitle => '你的進度摘要';

  @override
  String get unlockGrowthPotential => '解鎖你完整的長高潛力';

  @override
  String get featureGrowthAnalysis => '成長分析與分數';

  @override
  String get featureHeightPrediction => '身高預測與趨勢';

  @override
  String get featureAllRoutines => '全部 14 項每日任務';

  @override
  String get featureWaterSleep => '喝水與睡眠紀錄';

  @override
  String get featureProgress => '進度與測量';

  @override
  String get featureAchievements => '成就與連續紀錄';

  @override
  String get planMonthly => '月方案';

  @override
  String get planYearly => '年方案';

  @override
  String get bestValue => '最划算';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'LV $level';
  }

  @override
  String get levelBeginner => '新手';

  @override
  String get levelStarter => '起步者';

  @override
  String get levelCommitted => '投入者';

  @override
  String get levelDedicated => '專注者';

  @override
  String get levelConsistent => '穩定者';

  @override
  String get levelFocused => '專心者';

  @override
  String get levelDetermined => '堅定者';

  @override
  String get levelDisciplined => '自律者';

  @override
  String get levelStrong => '強者';

  @override
  String get levelAdvanced => '進階者';

  @override
  String get levelExpert => '專家';

  @override
  String get levelMaster => '大師';

  @override
  String get levelElite => '菁英';

  @override
  String get levelChampion => '冠軍';

  @override
  String get levelLegend => '傳奇';

  @override
  String get levelTitan => '泰坦';

  @override
  String get levelMythic => '神話';

  @override
  String get levelImmortal => '不朽';

  @override
  String get levelTranscendent => '超凡';

  @override
  String get levelUltimate => '極致';

  @override
  String get challengeCompleteAllRoutines => '完成所有任務';

  @override
  String get challengeCompleteAllRoutinesDesc => '今天完成每一項任務';

  @override
  String get challengeHydrationHero => '補水英雄';

  @override
  String get challengeHydrationHeroDesc => '達成每日喝水目標';

  @override
  String get challengeEarlySleeper => '早睡達人';

  @override
  String get challengeEarlySleeperDesc => '記錄 8 小時以上睡眠';

  @override
  String get challengeExerciseTrio => '運動三連發';

  @override
  String get challengeExerciseTrioDesc => '完成 3 項運動任務';

  @override
  String get challengeMorningStretch => '晨間伸展';

  @override
  String get challengeMorningStretchDesc => '早上 9 點前完成晨間伸展';

  @override
  String get challenge7DayWarrior => '7 天戰士';

  @override
  String get challenge7DayWarriorDesc => '連續 7 天完成所有任務';

  @override
  String get challengeGrowthTracker => '成長追蹤者';

  @override
  String get challengeGrowthTrackerDesc => '本週記錄一次身高';

  @override
  String get challengeHydrationWeek => '補水週';

  @override
  String get challengeHydrationWeekDesc => '本週有 5 天達成喝水目標';

  @override
  String get challengeFitnessChampion => '健身冠軍';

  @override
  String get challengeFitnessChampionDesc => '本週完成 15 項運動任務';

  @override
  String get challengeSleepMaster => '睡眠大師';

  @override
  String get challengeSleepMasterDesc => '5 天睡滿 8 小時以上';

  @override
  String get performanceDashboard => '表現儀表板';

  @override
  String get tierA => 'A 級';

  @override
  String get tierB => 'B 級';

  @override
  String get tierC => 'C 級';

  @override
  String get tierD => 'D 級';

  @override
  String get tierE => 'E 級';

  @override
  String get maxTierReached => '已達最高級';

  @override
  String nextTierHint(String tier, String pts) {
    return '下一級：$tier · 還需 +$pts 分';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => '管理任務';

  @override
  String get manageRoutinesSubtitle => '在每日清單中顯示或隱藏任務';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$total 項中 $visible 項啟用';
  }

  @override
  String get showAll => '全部顯示';

  @override
  String get hideAll => '全部隱藏';

  @override
  String get heightAnalysis => '身高分析';

  @override
  String get heightVsPopulation => '你在 CDC 生長曲線上的位置';

  @override
  String get globalAveragesTable => '各年齡平均身高（CDC）';

  @override
  String get standingTall => '很高';

  @override
  String get standingAboveAverage => '高於平均';

  @override
  String get standingBelowAverage => '低於平均';

  @override
  String get standingShort => '比同齡矮';

  @override
  String get yourHeightStanding => '你的身高排名';

  @override
  String get bellCurveCaption => '你這個年齡的身高分布';

  @override
  String get bellShorterThanYou => '比你矮';

  @override
  String get yourHeight => '你';

  @override
  String peerAvg(int age) {
    return '$age 歲平均';
  }

  @override
  String get aboveAvg => '高於平均';

  @override
  String get belowAvg => '低於平均';

  @override
  String get whoDataSource => '美國 CDC 生長曲線';

  @override
  String get percentileShort5 => '第 5';

  @override
  String get percentileShort50 => '第 50';

  @override
  String get percentileShort95 => '第 95';

  @override
  String get youLabel => '你';

  @override
  String get avgHeightLabel => '平均';

  @override
  String get percentileLabel => '百分位';

  @override
  String get diffLabel => '差距';

  @override
  String get whoSourceNote =>
      '資料來源：美國 CDC 2000 生長曲線（2 到 20 歲的年齡別身高）。百分位是和美國人口比較，各國可能不同。';

  @override
  String get quickPhotos => '照片';

  @override
  String get quickPosture => '體態';

  @override
  String get quickWellness => '身心';

  @override
  String get quickRecipes => '食譜';

  @override
  String get wellnessTitle => '身心追蹤';

  @override
  String get wellnessHeader => '身心健康';

  @override
  String get wellnessSubtitle => '追蹤影響成長的因素';

  @override
  String get caffeineToday => '今日咖啡因';

  @override
  String get withinLimits => '在健康範圍內';

  @override
  String get approachingLimit => '快到上限';

  @override
  String get overLimit => '超過上限，會影響 HGH';

  @override
  String get resetToday => '重設今天';

  @override
  String get stressToday => '今日壓力';

  @override
  String get stressVeryCalmLabel => '非常平靜，最適合成長';

  @override
  String get stressCalmLabel => '平靜';

  @override
  String get stressNeutralLabel => '普通';

  @override
  String get stressStressedLabel => '有壓力';

  @override
  String get stressVeryStressedLabel => '壓力很大，皮質醇會阻礙 HGH';

  @override
  String get stressTapToLog => '點一下記錄今天的感受';

  @override
  String get todaysJournal => '今日日記';

  @override
  String get journalNoNote => '（沒有筆記）';

  @override
  String get journalEdit => '編輯';

  @override
  String get journalHowWasToday => '今天過得怎麼樣？';

  @override
  String get journalSaved => '日記已儲存 · +5 XP';

  @override
  String get journalSaveEntry => '儲存日記';

  @override
  String get weeklyInsight => '每週洞察';

  @override
  String get weeklyInsightCaffeine => '咖啡因';

  @override
  String get weeklyInsightStress => '壓力';

  @override
  String get weeklyInsightMood => '心情';

  @override
  String get wellnessInfoTitle => '為什麼身心健康很重要';

  @override
  String get wellnessInfoBody =>
      '咖啡因會干擾深層睡眠，而大部分生長激素（HGH）都在深層睡眠時分泌。長期壓力會讓皮質醇升高，直接抑制 HGH。寫日記能幫你持續維持有助成長的習慣。';

  @override
  String get wellnessInfoGotIt => '了解';

  @override
  String get insightCaffeineHigh => '你這週咖啡因攝取偏高。試著減量，睡得更好、HGH 也更多。';

  @override
  String get insightStressHigh => '這週壓力偏高。試試呼吸練習：皮質醇會阻礙成長。';

  @override
  String get insightMoodLow => '最近心情比較低落。曬太陽、好好睡覺和輕度運動都有幫助。';

  @override
  String get insightGreat => '這週平衡得很好，你的身心狀態有助於成長。';

  @override
  String get insightDefault => '你的身心狀態穩定，持續記錄能看到更深入的洞察。';

  @override
  String get insightNeedMoreData => '再記錄幾天就能看到洞察。';

  @override
  String get progressPhotosTitle => '進度照片';

  @override
  String get progressPhotosHeader => '進度照片';

  @override
  String get progressPhotosSubtitle => '用照片追蹤你的變化';

  @override
  String get addProgressPhoto => '新增進度照片';

  @override
  String get captureJourney => '用照片記錄你的旅程';

  @override
  String get takePhoto => '拍照';

  @override
  String get chooseFromLibrary => '從相簿選擇';

  @override
  String get deletePhotoTitle => '要刪除照片嗎？';

  @override
  String get deletePhotoBody => '這張照片會從你的進度時間軸中移除。';

  @override
  String get timelineTab => '時間軸';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '張照片',
      one: '張照片',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$days 天長了 $cm $unit';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '天',
      one: '天',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '已長高（$unit）';
  }

  @override
  String get firstPhotoMessage => '拍下第一張照片，開始追蹤你的外觀變化。';

  @override
  String get takeFirstPhoto => '拍第一張照片';

  @override
  String get beforeAfter => '前 / 後';

  @override
  String get beforeLabel => '之前';

  @override
  String get afterLabel => '之後';

  @override
  String get yourHeightDialog => '你的身高';

  @override
  String get heightDialogMessage => '輸入這張照片拍攝時的身高';

  @override
  String get postureAnalysisTitle => '體態分析';

  @override
  String get postureCoachHeader => '體態教練';

  @override
  String get postureCoachSubtitle => '用側面照片自我檢查';

  @override
  String get latestScore => '最新分數';

  @override
  String get latestAnalysis => '最新分析';

  @override
  String get headPosition => '頭部位置';

  @override
  String get progressLabel => '進度';

  @override
  String get choosePhotoSource => '選擇照片來源';

  @override
  String get sideProfileHint => '側面拍，全身入鏡';

  @override
  String get howToTakePhoto => '如何拍照';

  @override
  String get takePosturePhoto => '拍體態照';

  @override
  String get postureExcellent => '非常好';

  @override
  String get postureGood => '良好';

  @override
  String get postureNeedsWork => '需要加強';

  @override
  String get posturePoor => '不佳';

  @override
  String get recommendedExercises => '推薦動作';

  @override
  String get postureWallStand => '靠牆站立';

  @override
  String get postureWallStandDesc => '每天背靠牆站 2 分鐘。';

  @override
  String get postureChestOpener => '開胸伸展';

  @override
  String get postureChestOpenerDesc => '放鬆緊繃的胸肌，避免肩膀被往前拉。';

  @override
  String get postureChinTucks => '收下巴';

  @override
  String get postureChinTucksDesc => '改善頭部前傾，3×10 下。';

  @override
  String get postureDeadbug => '死蟲式';

  @override
  String get postureDeadbugDesc => '強化深層核心，控制骨盆前傾。';

  @override
  String get recipesTitle => '食譜';

  @override
  String get recipesHeader => '食譜';

  @override
  String get recipesSubtitle => '為成長補充能量';

  @override
  String get recipesCategoryAll => '全部';

  @override
  String get recipesCategoryBreakfast => '早餐';

  @override
  String get recipesCategoryLunch => '午餐';

  @override
  String get recipesCategoryDinner => '晚餐';

  @override
  String get recipesCategorySnack => '點心';

  @override
  String get recipesGoalAll => '全部';

  @override
  String get recipeDiffEasy => '簡單';

  @override
  String get recipeDiffMedium => '中等';

  @override
  String get recipeDiffHard => '困難';

  @override
  String get recipesFilterType => '類型';

  @override
  String get recipesFilterNutrient => '富含';

  @override
  String get recipesGoalVitaminD => '維生素 D';

  @override
  String get recipesGoalZinc => '鋅';

  @override
  String get recipesGoalMagnesium => '鎂';

  @override
  String recipesCountLabel(int count) {
    return '$count 道食譜';
  }

  @override
  String get recipeIngredients => '食材';

  @override
  String get recipeSteps => '做法';

  @override
  String get recipesGoalProtein => '高蛋白';

  @override
  String get recipesGoalCalcium => '鈣';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => '鐵';

  @override
  String get recipesNoMatch => '沒有符合篩選條件的食譜';

  @override
  String get recipesIngredients => '食材';

  @override
  String get recipesInstructions => '做法';

  @override
  String get recipesClose => '關閉';

  @override
  String get recipesAboutTitle => '關於食譜';

  @override
  String get recipesAboutBody => '精選幫助成長的食譜。依餐別或營養目標篩選，找到最適合你計畫的一道。';

  @override
  String get animHintSpinalDecomp => '脊椎減壓';

  @override
  String get animHintGravityReversal => '反轉重力';

  @override
  String get animHintImpactBones => '骨骼衝擊負荷';

  @override
  String get animHintHighImpact => '高衝擊骨骼負荷';

  @override
  String get animHintMetabolicBurst => '代謝爆發訓練';

  @override
  String get animHintFullBodyStretch => '全身喚醒伸展';

  @override
  String get animHintSpinalExtension => '脊椎伸展';

  @override
  String get animHintCervicalDecomp => '頸椎減壓';

  @override
  String get animHintShoulderMobility => '肩部活動度';

  @override
  String get animHintFullBodyMotion => '全身律動';

  @override
  String get animHintPosteriorChain => '後側鏈伸展';

  @override
  String get animHintMuscleGrowth => '肌肉成長燃料';

  @override
  String get animHintBoneDensity => '支持骨密度';

  @override
  String get animHintSpinalDisc => '椎間盤補水';

  @override
  String get animHintCleanNutrition => '乾淨飲食';

  @override
  String get animHintIgf1 => '優化 IGF-1';

  @override
  String get animHintHghAmino => 'HGH 胺基酸前驅物';

  @override
  String get animHintCalciumAbsorption => '鈣質吸收';

  @override
  String get animHintSpinalAlignment => '脊椎排列';

  @override
  String get animHintPostureCorrection => '矯正體態';

  @override
  String get animHintMindBody => '身心平衡';

  @override
  String get animHintCoreStability => '核心穩定';

  @override
  String get animHintLegPower => '腿部力量與 HGH 激增';

  @override
  String get animHintVerticalPower => '垂直爆發力';

  @override
  String get animHintHghSurge => 'HGH 激增訓練';

  @override
  String get animHintPeakHgh => 'HGH 分泌高峰時段';

  @override
  String get animHintMelatonin => '優化褪黑激素';

  @override
  String get animHintDeepSleep => '為深層睡眠做準備';

  @override
  String get animHintSleepOpt => '優化睡眠';

  @override
  String get animHintExercise => '運動';

  @override
  String get formMorningStretch => '先轉轉脖子，再做全身伸展。每個動作維持 20-30 秒，不要彈震。';

  @override
  String get formBarHanging => '雙手與肩同寬握住單槓，全身放鬆，讓重力伸展脊椎。避免晃動。';

  @override
  String get formCobraStretch => '趴下，雙手放在肩膀下方，慢慢撐起上半身，臀部保持貼地。眼睛往上看。';

  @override
  String get formJumping => '做深蹲跳或跳繩，用前腳掌輕輕落地。每組之間休息 30 秒。';

  @override
  String get formSwimmingBasketball => '選擇游泳（自由式/仰式）或籃球。專注在跳躍、伸展和完整的動作幅度。';

  @override
  String get formEveningYoga => '做些溫和的動作：貓牛式、嬰兒式、下犬式、站姿前彎。深呼吸，每個動作維持 30-60 秒。';

  @override
  String get formSprintIntervals => '先熱身 5 分鐘，再全力衝刺 30 秒，接著走路或慢跑 90 秒恢復。重複。';

  @override
  String get formHiitWorkout => '以最大強度做波比跳、登山者、深蹲跳等動作 45 秒，休息 15 秒。';

  @override
  String get formSquats => '雙腳與肩同寬站立，身體往下蹲到大腿與地面平行。背打直，膝蓋不超過腳尖。';

  @override
  String get formDeadliftStretch =>
      '雙腳與髖同寬站立，以髖部為軸前傾、背保持平直。手往腳尖伸，感受大腿後側和背部的伸展。';

  @override
  String get formOverheadPress => '站直，雙手往上推到完全伸直。用輕重量或徒手。核心收緊，避免拱背。';

  @override
  String get formSkippingRope => '雙腳一起跳，用前腳掌輕輕落地。跳低一點、保持穩定節奏。每組之間休息。';

  @override
  String get formPilatesCore => '做棒式、死蟲式、鳥狗式、橋式和抬腿。專注在動作控制和呼吸。';

  @override
  String get formInversionHang => '使用倒立機或重力靴。從小角度開始，慢慢增加。每次時間不要太長。';

  @override
  String get formProtein => '把蛋白質分散到 3-4 餐，包括蛋、雞肉、魚、乳製品和豆類。';

  @override
  String get formCalciumVitaminD => '每天吃 3 份乳製品，並曬 15 分鐘太陽，讓身體自然合成維生素 D。';

  @override
  String get formWater => '整天規律喝水。隨身帶水壺，設定每小時提醒。';

  @override
  String get formAvoidJunk => '用原型食物取代速食，用水取代含糖飲料。看清楚成分標示，避開加工成分。';

  @override
  String get formZincIntake => '飲食中加入紅肉、南瓜子、鷹嘴豆、腰果和牡蠣。目標每天 8-11mg。';

  @override
  String get formVitaminDSunlight => '讓手臂和臉直接曬太陽 15 分鐘，最好在中午前。這麼短的時間不需要擦防曬。';

  @override
  String get formArginineFoods => '餐點中加入堅果、種子、火雞肉、雞肉、黃豆和乳製品。睡前吃效果最好。';

  @override
  String get formDailyCalories => '把熱量分散到 3-5 餐，不要不吃早餐。優先選原型食物，避開空熱量。';

  @override
  String get formQualitySleep => '晚上 10 點前上床。房間保持黑暗涼爽。下午 2 點後避免咖啡因。';

  @override
  String get formNoScreen => '在睡前 1 小時設鬧鐘，把所有螢幕收起來。改看書或做些輕度伸展。';

  @override
  String get formSleepEnvironment => '用遮光窗簾，室溫保持 18-20°C，移除所有光源。使用舒適的床墊和枕頭。';

  @override
  String get formPreSleepRoutine => '睡前 30 分鐘開始：調暗燈光、看書、做呼吸練習，避免刺激性活動。';

  @override
  String get formPostureCheck => '站直，肩膀往後往下放，核心微微出力。想像有條線從頭頂把你往上拉。';

  @override
  String get formWallStand => '腳跟、臀部、肩胛骨和頭都貼著牆站立。維持 5 分鐘，正常呼吸。';

  @override
  String get formNeckStretches => '頭慢慢往左右、前後傾。每個方向維持 30 秒，不要硬拉。';

  @override
  String get formShoulderRolls => '肩膀往前轉 15 次，再往後轉 15 次。接著做開胸伸展，維持 20 秒。';

  @override
  String get sciMorningStretch => '晨間伸展能為一夜補水的椎間盤減壓，盡量保住身高';

  @override
  String get sciBarHanging => '懸吊利用重力伸展脊椎、為椎間盤減壓，可能暫時增加身高';

  @override
  String get sciCobraStretch => '眼鏡蛇式能伸展脊椎、打開胸口，抵銷久坐造成的脊椎壓迫';

  @override
  String get sciJumping => '高衝擊跳躍能刺激腿部生長板，並促進生長激素分泌';

  @override
  String get sciSwimmingBasketball => '游泳和籃球包含全身伸展、跳躍和伸手動作，能刺激生長板活動';

  @override
  String get sciEveningYoga => '晚間瑜伽能降低會抑制生長激素的皮質醇，並伸展肌肉幫助夜間恢復';

  @override
  String get sciSprintIntervals => '衝刺能大量促進生長激素分泌';

  @override
  String get sciHiitWorkout => '高強度運動可讓 HGH 增加多達 450%';

  @override
  String get sciSquats => '深蹲能刺激腿部和脊椎的生長板';

  @override
  String get sciDeadliftStretch => '脊椎減壓有助椎間盤健康';

  @override
  String get sciOverheadPress => '過頭推舉能伸展脊椎，強化維持體態的肌肉';

  @override
  String get sciSkippingRope => '反覆跳躍能刺激下肢的生長板';

  @override
  String get sciPilatesCore => '核心肌力有助脊椎排列和體態';

  @override
  String get sciInversionHang => '倒立能減輕椎間盤壓力，可暫時增加 1-2cm';

  @override
  String get sciProtein => '蛋白質提供骨骼和肌肉生長必需的胺基酸，在快速成長期特別重要';

  @override
  String get sciCalciumVitaminD => '鈣和維生素 D 是骨密度和骨骼縱向生長的主要原料';

  @override
  String get sciWater => '充足水分是把營養送到生長板、維持關節軟骨健康的關鍵';

  @override
  String get sciAvoidJunk => '加工食品和糖會引起發炎和血糖飆升，抑制生長激素分泌';

  @override
  String get sciZincIntake => '鋅是製造生長激素的必要元素';

  @override
  String get sciVitaminDSunlight => '維生素 D 對鈣質吸收和骨骼生長很關鍵';

  @override
  String get sciArginineFoods => 'L-精胺酸能刺激生長激素分泌';

  @override
  String get sciDailyCalories => '長期熱量不足會降低 IGF-1、減弱生長激素脈衝，直接拖慢青春期的長高速度';

  @override
  String get sciQualitySleep => '每天 70-80% 的生長激素在深層睡眠時分泌，尤其是晚上 10 點到凌晨 2 點';

  @override
  String get sciNoScreen => '螢幕藍光會抑制褪黑激素分泌，讓你更晚入睡、深層睡眠品質變差';

  @override
  String get sciSleepEnvironment => '黑暗涼爽的環境能讓褪黑激素和生長激素充分分泌';

  @override
  String get sciPreSleepRoutine => '固定的睡前習慣能讓深層睡眠品質提升 23%';

  @override
  String get sciPostureCheck => '正確的體態能讓你看起來立刻高 2-3 cm，還能避免脊椎受壓';

  @override
  String get sciWallStand => '靠牆站能訓練體態的肌肉記憶，幫你整天維持正確的脊椎排列';

  @override
  String get sciNeckStretches => '頸部伸展能舒緩壓迫，改善頸椎排列';

  @override
  String get sciShoulderRolls => '打開肩膀能改善前傾體態，看起來可高 1-2cm';

  @override
  String get muscleSpine => '脊椎';

  @override
  String get muscleLegs => '腿部';

  @override
  String get muscleBack => '背部';

  @override
  String get muscleShoulders => '肩膀';

  @override
  String get muscleArms => '手臂';

  @override
  String get muscleCore => '核心';

  @override
  String get muscleChest => '胸部';

  @override
  String get muscleCalves => '小腿';

  @override
  String get muscleFullBody => '全身';

  @override
  String get muscleHips => '髖部';

  @override
  String get muscleBones => '骨骼';

  @override
  String get muscleMuscles => '肌肉';

  @override
  String get muscleNeck => '頸部';

  @override
  String get muscleUpperSpine => '上段脊椎';

  @override
  String get muscleUpperBack => '上背';

  @override
  String get createRoutine => '建立任務';

  @override
  String get createRoutineTitle => '建立自訂任務';

  @override
  String get createRoutineSubtitle => '打造你自己的每日任務';

  @override
  String get routineIcon => '圖示';

  @override
  String get routineTitleField => '標題';

  @override
  String get routineDescField => '說明';

  @override
  String get routineDescHint => '任務的簡短說明';

  @override
  String get routineCategoryField => '類別';

  @override
  String get routineDifficultyField => '難度';

  @override
  String get routineDurationField => '時長';

  @override
  String get routineSetsRepsField => '組數 x 次數';

  @override
  String get routineFormField => '動作與說明';

  @override
  String get routineFormHint => '選填：這項任務怎麼做';

  @override
  String get diffBeginner => '初級';

  @override
  String get diffIntermediate => '中級';

  @override
  String get diffAdvanced => '進階';

  @override
  String get catExercise => '運動';

  @override
  String get catNutrition => '營養';

  @override
  String get catSleep => '睡眠';

  @override
  String get catPosture => '體態';

  @override
  String get postureTip1 => '側身（側面）對著鏡頭站。';

  @override
  String get postureTip2 => '和鏡頭保持約 2 公尺距離。';

  @override
  String get postureTip3 => '雙手放鬆，眼睛直視前方。';

  @override
  String get postureTip4 => '穿合身的衣服，評分更準確。';

  @override
  String get postureTip5 => '光線充足，背景單純。';

  @override
  String get kyphosisLabel => '駝背（上背）';

  @override
  String get lordosisLabel => '骨盆前傾（下背）';

  @override
  String get analyzingPosture => '正在分析體態';

  @override
  String get privacyPolicy => '隱私權政策';

  @override
  String get termsOfService => '服務條款';

  @override
  String version(String ver) {
    return '版本 $ver';
  }

  @override
  String get rateApp => '幫 BeTaller 評分';

  @override
  String get rateAppSubtitle => '你的評論能幫助我們成長！';

  @override
  String get unitSystem => '單位';

  @override
  String get unitMetric => '公制（cm、kg）';

  @override
  String get unitImperial => '英制（ft-in、lbs）';

  @override
  String get healthDisclaimer => '健康聲明';

  @override
  String get healthDisclaimerBody =>
      'BeTaller 提供一般健康與健身建議。結果會因年齡、遺傳和個人因素而不同。本 App 不提供醫療建議。運動內容著重在透過自然習慣改善體態、維護脊椎健康和支持生長激素。開始任何新的運動或飲食計畫前，請先諮詢醫療專業人員。生長板閉合後（通常在 18-25 歲），身高變化主要來自體態改善。';

  @override
  String routineProteinAmountDesc(int grams) {
    return '今天至少攝取 ${grams}g 蛋白質，依你的體重計算。';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return '今天至少喝 ${liters}L 水，依你的體重計算。';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return '今天目標約 $kcal kcal，為成長補充能量。';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return '今天攝取 $iu IU 維生素 D，可來自日照、食物或補充品。';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return '今天攝取 ${mg}mg 鋅，幫助生長激素生成。';
  }

  @override
  String get nutritionSupplementsTitle => '補充品';

  @override
  String get nutritionSupplementsDisclaimer =>
      '只是輔助，不能取代食物。開始任何補充品前請先問醫生，未滿 18 歲尤其要注意。';

  @override
  String get supplementVitaminDName => '維生素 D3';

  @override
  String get supplementVitaminDDose => '3,000 IU';

  @override
  String get supplementVitaminDBenefit => '促進鈣質吸收，支持骨密度和生長板健康';

  @override
  String get supplementZincName => '鋅';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit => '製造生長激素的關鍵礦物質';

  @override
  String get supplementMagnesiumName => '鎂';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit => '支持深層睡眠，大部分生長激素在這時分泌';

  @override
  String get supplementCalciumName => '鈣';

  @override
  String get supplementCalciumDose => '1,000-1,300mg';

  @override
  String get supplementCalciumBenefit => '骨密度和生長板的核心原料';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1,000mg';

  @override
  String get supplementOmega3Benefit => '減少發炎，支持生長板正常運作';

  @override
  String get supplementCollagenName => '膠原蛋白 + 維生素 C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit => '維生素 C 幫助身體利用膠原蛋白，建構軟骨和骨基質';

  @override
  String get sciSourcePrefix => '來源：';

  @override
  String get program => '計畫';

  @override
  String get todaysExercises => '今日動作';

  @override
  String get dailyNutritionPlan => '每日飲食計畫';

  @override
  String get nutritionGoalsComplete => '🎉 所有營養目標都完成了！';

  @override
  String get nutritionGoalsIncomplete => '完成營養目標，讓成長效果最好';

  @override
  String get postureDetectingAlignment => '正在偵測脊椎排列...';

  @override
  String get testimonial1 => '因為年紀我本來不抱希望，但用了 BeTaller 我長高了。我的自信從來沒這麼高過。';

  @override
  String get testimonialDuration1 => '4 個月';

  @override
  String get testimonial2 => '大家都說「你不會再長了」。我用了 BeTaller，讓所有人都很驚訝。';

  @override
  String get testimonialDuration2 => '3 個月';

  @override
  String get testimonial3 => '開始做這些任務後，我長高了，體態也變好了。大家都注意到差別。';

  @override
  String get testimonialDuration3 => '6 個月';

  @override
  String get testimonial4 => '我還在成長期，BeTaller 的效果超驚人。我覺得自己更高、更強壯了。';

  @override
  String get testimonialDuration4 => '3 個月';

  @override
  String get testimonial5 => '說沒試過 BeTaller 是騙人的。我很快就感覺到真正的差別，超推薦。';

  @override
  String get testimonialDuration5 => '4 個月';

  @override
  String get designedForYou => '為你量身打造';

  @override
  String get designedForYouDesc => 'BeTaller 專為幫你達到遺傳極限、甚至超越它而打造。每項功能，都是為了你。';

  @override
  String get greetingAllDone => '做得好！🎯';

  @override
  String get greetingAllDoneSub => '你已完成今天的任務。';

  @override
  String greetingStreak30(int streak) {
    return '連續 $streak 天，傳奇等級。';
  }

  @override
  String greetingStreak7(int streak) {
    return '連續 $streak 天，繼續保持。';
  }

  @override
  String greetingStreak3(int streak) {
    return '連續 $streak 天。大多數人都放棄了，你沒有。';
  }

  @override
  String get greetingMorning => '早安。新的一天，新的機會。';

  @override
  String get greetingAfternoon => '今天很適合開始你的連續紀錄。';

  @override
  String get greetingEvening => '完成任務，開始你的連續紀錄。';

  @override
  String get todayCompleted => '今天已完成 ✓';

  @override
  String get todayGoals => '今日目標';

  @override
  String get challengesLabel => '挑戰';

  @override
  String get dailyChallengesLabel => '每日挑戰';

  @override
  String get expiresTonight => '今晚截止';

  @override
  String get allChallengesCompleted => '全部完成 ✓';

  @override
  String get challengesLoading => '新挑戰即將登場。';

  @override
  String get challengesLoadingTitle => '每日挑戰';

  @override
  String get behindPace => '進度落後';

  @override
  String get growthTracking => '成長追蹤';

  @override
  String get growthEmptyFirst => '記錄第一筆身高，開始追蹤。';

  @override
  String get growthEmptySecond => '記錄第二筆測量，就能看到圖表。';

  @override
  String get growthSectionLabel => '成長';

  @override
  String get generalPerformance => '整體表現';

  @override
  String get analysisBalance => '你的平衡';

  @override
  String get analysisWeakest => '你最弱的一環';

  @override
  String get analysisPrediction => '身高預測';

  @override
  String get analysisComparison => '比較';

  @override
  String get analysisGrowth => '成長狀態';

  @override
  String get analysisWeakestHint => '從這裡提升分數最快。';

  @override
  String get exploreLabel => '探索';

  @override
  String get explorePosture => '體態分析';

  @override
  String get explorePostureSub => '體態分析與矯正建議';

  @override
  String get explorePhotos => '進度照片';

  @override
  String get explorePhotosSub => '用照片追蹤你的轉變';

  @override
  String get exploreNutrition => '營養';

  @override
  String get exploreNutritionSub => '蛋白質、鈣和維生素指南';

  @override
  String get exploreHealth => '健康追蹤';

  @override
  String get exploreHealthSub => '壓力、咖啡因與身心追蹤';

  @override
  String get exploreRecipes => '成長食譜';

  @override
  String get exploreRecipesSub => '幫助成長的食譜';

  @override
  String get educationLabel => '知識';

  @override
  String get educationTitle => '長高的\n科學';

  @override
  String get educationSubtitle => '專業內容、研究與指南';

  @override
  String get aiAnalysisLabel => '成長分析';

  @override
  String get peerCompareLabel => '和同齡比較';

  @override
  String peerCompareText(int topPct) {
    return '你在同齡中排名前 $topPct%';
  }

  @override
  String get notifWaterTitle => '💧 別忘了喝水！';

  @override
  String get notifWaterBody => '今天的喝水目標達成了嗎？再喝一杯吧！';

  @override
  String get notifMorningTitle => '🌅 早安！運動時間';

  @override
  String get notifMorningBody => '來做晨間伸展！10 分鐘伸展脊椎和腿部。';

  @override
  String get notifRoutineTitle => '🔥 完成你的任務！';

  @override
  String get notifRoutineBody => '一天結束前檢查一下任務。連續紀錄 = 自律！';

  @override
  String get notifProteinTitle => '🥚 蛋白質日！';

  @override
  String get notifProteinBody => '用力開啟這一週！每餐都要吃蛋白質。';

  @override
  String get notifNewWeekTitle => '✨ 新的一週，新的目標！';

  @override
  String get notifNewWeekBody => '這週別跳過任務。小步伐，大差別！';

  @override
  String get notifSleepTitle => '😴 該睡覺了！';

  @override
  String get notifSleepBody => '生長激素在晚上 10 點到凌晨 2 點分泌最多。放下手機吧！';

  @override
  String get notifPostureTitle => '🧍 體態檢查！';

  @override
  String get notifPostureBody => '背打直、肩膀往後。好體態 = 差 2-3 cm！';

  @override
  String get notifVitaminDTitle => '☀️ 維生素 D 時間！';

  @override
  String get notifVitaminDBody => '曬 15 分鐘太陽！維生素 D 能促進鈣質吸收。';

  @override
  String get notifMidweekTitle => '✨ 過一半了！';

  @override
  String get notifMidweekBody => '週中檢查。成長需要耐心，但持續才會贏！';

  @override
  String get notifScreenTitle => '📵 關掉螢幕！';

  @override
  String get notifScreenBody => '睡前 1 小時不碰螢幕。藍光會阻礙褪黑激素！';

  @override
  String get notifJumpTitle => '🦘 跳躍時間！';

  @override
  String get notifJumpBody => '跳躍運動能刺激生長板。試試 3 x 20 下！';

  @override
  String get notifCalciumTitle => '🥛 補鈣時間！';

  @override
  String get notifCalciumBody => '來杯牛奶或優格。鈣對骨骼很重要！';

  @override
  String get notifPostureCheckTitle => '🧍 體態檢查！';

  @override
  String get notifPostureCheckBody => '別低頭滑手機！坐好、走路抬頭挺胸。';

  @override
  String get notifWeekendTitle => '✨ 週末動力';

  @override
  String get notifWeekendBody => '週末也別跳過任務！自律每天都算數。';

  @override
  String get notifWeeklyProgressTitle => '📊 每週進度';

  @override
  String get notifWeeklyProgressBody => '這週過得如何？看看你的成長圖表！';

  @override
  String get notifMeasureTitle => '📏 每週測量！';

  @override
  String get notifMeasureBody => '量一下身高並記錄！早上量最準。';

  @override
  String get notifEarlySleepTitle => '😴 早點睡！';

  @override
  String get notifEarlySleepBody => '明天是星期一！好好睡一覺，用力開啟新的一週。';

  @override
  String get notifStreak3Title => '🔥 連續 3 天！';

  @override
  String get notifStreak3Body => '好的開始！連續 3 天了，繼續衝到 7 天！';

  @override
  String get notifStreak7Title => '🏆 連續 1 週！';

  @override
  String get notifStreak7Body => '太強了！連續 7 天完成任務！';

  @override
  String get notifStreak14Title => '⭐ 連續 2 週！';

  @override
  String get notifStreak14Body => '自律 14 天！你的身體開始改變了。';

  @override
  String get notifStreak30Title => '👑 連續 1 個月！';

  @override
  String get notifStreak30Body => '30 天！你是冠軍！';

  @override
  String get notifStreak60Title => '🌟 連續 60 天！';

  @override
  String get notifStreak60Body => '60 天！超驚人的成就。';

  @override
  String get notifStreak100Title => '💎 100 天！傳奇！';

  @override
  String get notifStreak100Body => '連續 100 天！你已經成為傳奇。';

  @override
  String get notifStreakRiskTitle => '⚠️ 別讓連續紀錄中斷！';

  @override
  String notifStreakRiskBody(int streak) {
    return '你的 $streak 天連續紀錄快中斷了！快完成任務。';
  }

  @override
  String get paywallStat1 => 'cm，你的潛力還鎖著';

  @override
  String get paywallTitle1 => '你還能\n長高幾公分？';

  @override
  String get paywallBullet1a => '你的遺傳上限已經算好了，想看看嗎？';

  @override
  String get paywallBullet1b => '你的生活習慣如何影響成長？';

  @override
  String get paywallBullet1c => '你的專屬路線圖在等你';

  @override
  String get paywallStat2 => '你的專屬任務已準備好';

  @override
  String get paywallTitle2 => '你的計畫\n準備好了';

  @override
  String get paywallBullet2a => '每天早上 8 分鐘，為你的脊椎設計';

  @override
  String get paywallBullet2b => '睡眠、營養、喝水，全部都能追蹤';

  @override
  String get paywallBullet2c => '每天更近一步，別中斷連續紀錄';

  @override
  String get paywallStat3 => '即時進度圖表';

  @override
  String get paywallTitle3 => '追蹤你的\n成長';

  @override
  String get paywallBullet3a => '每月測量，親眼看見自己長高';

  @override
  String get paywallBullet3b => '透過體態分析，現在就多 2 cm';

  @override
  String get paywallBullet3c => '進度照片，你會看到差別';

  @override
  String get paywallStat4 => '每日計畫，持續升級';

  @override
  String get paywallTitle4 => '每天\n更強一點';

  @override
  String get paywallBullet4a => '賺 XP、解鎖等級，把習慣變成遊戲';

  @override
  String get paywallBullet4b => '達成目標的人都走過這一步';

  @override
  String get paywallBullet4c => '現在開始，第一週免費';

  @override
  String get paywallRestore => '找不到先前的購買項目';

  @override
  String get paywallRestoreNotFound => '找不到先前的購買項目';

  @override
  String get paywallPromoCode => '有優惠碼嗎？';

  @override
  String get paywallHeightUnit => '目標身高';

  @override
  String get paywallHeightTitle => '你還能長多高？';

  @override
  String get paywallHeightDesc =>
      '我們綜合分析你的遺傳、生活習慣和體態，逐年列出預測。一切都不是定局：你踏出的每一步都會更新它。';

  @override
  String get paywallGrowthUnit => '今年';

  @override
  String get paywallGrowthTitle => '我們陪你一起追蹤成長';

  @override
  String get paywallGrowthDesc => '每筆測量都會立刻出現在圖表上。逐月、逐公分看著自己進步。';

  @override
  String get paywallPostureUnit => '體態分數';

  @override
  String get paywallPostureTitle => '體態是你任務的關鍵';

  @override
  String get paywallPostureDesc => '用 3 個問題快速檢查頭、肩膀和下背，並告訴你每個部位該做哪些動作來改善。';

  @override
  String get paywallReportUnit => '任務完成率';

  @override
  String get paywallReportTitle => '我們每週幫你檢視';

  @override
  String get paywallReportDesc => '喝水、睡眠、任務和連續紀錄都在同一個畫面。每週一起找出你的強項和不足。';

  @override
  String get paywallNutritionUnit => '每天幾餐';

  @override
  String get paywallNutritionTitle => '你的完整飲食計畫準備好了';

  @override
  String get paywallNutritionDesc => '從早餐到晚餐的完整每日計畫，蛋白質、鈣、鋅和維生素 D 都幫你算好了。';

  @override
  String get paywallScoreUnit => 'BeTaller 分數';

  @override
  String get paywallScoreTitle => '持續推你前進的系統';

  @override
  String get paywallScoreDesc => '遺傳、成長、營養、睡眠和自律整合成一個分數。分數一下降，你就知道該加強哪裡。';

  @override
  String get paywallPhotosUnit => '看得見的差別';

  @override
  String get paywallPhotosTitle => '用照片證明你的改變';

  @override
  String get paywallPhotosDesc => '前後對比自動產生，每個月的照片都整齊排在你的時間軸上。';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => '三個步驟開始';

  @override
  String get journeyIntroSubtitle => '我們一起設定 BeTaller，下一步正在等你。';

  @override
  String get journeyStep1Title => '收集你的資料';

  @override
  String get journeyStep1Desc => '我們取得你的身高、年齡和生活習慣，算出你的潛力。';

  @override
  String get journeyStep2Title => 'App 導覽';

  @override
  String get journeyStep2Desc => '帶你看過每項功能：它能做什麼、怎麼使用。';

  @override
  String get journeyStep3Title => '自己上手';

  @override
  String get journeyStep3Desc => '你執行每日任務，我們幫你追蹤進度。';

  @override
  String get journeyNow => '現在';

  @override
  String get journeyDone => '完成';

  @override
  String get journeySoon => '即將';

  @override
  String get tourHomeStreakTitle => '你的連續紀錄';

  @override
  String get tourHomeStreakDesc => '只要保持自律就會持續增加。漏掉一天就會歸零。';

  @override
  String get tourHomeXpTitle => '你的等級';

  @override
  String get tourHomeXpDesc => '保持自律賺到的 XP 會讓等級上升。別脫軌了！';

  @override
  String get tourHomeGoalsTitle => '今日目標';

  @override
  String get tourHomeGoalsDesc => '一眼看到今天的任務、挑戰和喝水目標，什麼都不會漏掉。';

  @override
  String get tourHomeTrackTitle => '喝水與睡眠紀錄';

  @override
  String get tourHomeTrackDesc => '在這裡記錄每天的喝水和睡眠，幾秒就搞定。';

  @override
  String get tourPlanTabsTitle => '三個分頁：今天、自律、營養';

  @override
  String get tourPlanTabsDesc => '你的每日任務、每週計畫和飲食計畫都在這裡。';

  @override
  String get tourPlanLevelTitle => '你的自律等級';

  @override
  String get tourPlanLevelDesc => '顯示你完成任務有多穩定。升級能帶來更好的成果。';

  @override
  String get tourPlanTodayTitle => '今日計畫';

  @override
  String get tourPlanTodayDesc => '在這裡勾選每日任務，讓連續紀錄持續增加。';

  @override
  String get tourPlanTodayListTitle => '你今天的任務';

  @override
  String get tourPlanTodayListDesc => '做完一項就勾一項。點任務可以查看詳細內容。';

  @override
  String get tourPlanWeekGoalsTitle => '本週';

  @override
  String get tourPlanWeekGoalsDesc => '本週要達成的完美天數、訓練和測量，包括必做的那一項。';

  @override
  String get tourPlanMonthGoalsTitle => '本月';

  @override
  String get tourPlanMonthGoalsDesc => '進度照片、體態檢查和本月測量：這些都不該跳過。';

  @override
  String get tourProgressHeightTitle => '你目前的身高';

  @override
  String get tourProgressHeightDesc => '顯示你現在的身高和累計增長。可以從這裡新增測量。';

  @override
  String get tourProgressPhotosTitle => '進度照片';

  @override
  String get tourProgressPhotosDesc => '定期拍照，用畫面追蹤你的轉變。';

  @override
  String get tourProgressPostureTitle => '體態分析';

  @override
  String get tourProgressPostureDesc => '用照片分析你的體態，了解該加強哪裡。';

  @override
  String get tourAnalysisScoreTitle => '你的 BeTaller 分數';

  @override
  String get tourAnalysisScoreDesc => '根據遺傳、成長速度、營養和睡眠計算出的整體表現分數。';

  @override
  String get tourAnalysisPredictionTitle => '你的身高預測';

  @override
  String get tourAnalysisPredictionDesc => '顯示你預測的最終身高和逐年變化。';

  @override
  String get tourAnalysisPeerTitle => '和同齡比較';

  @override
  String get tourAnalysisPeerDesc => '看看你的排名，和同年齡的人比一比。';

  @override
  String get tourHomeGoalsRoutinesTitle => '你的任務';

  @override
  String get tourHomeGoalsRoutinesDesc => '看看今天還有幾項運動任務要完成。';

  @override
  String get tourHomeGoalsChallengesTitle => '你的挑戰';

  @override
  String get tourHomeGoalsChallengesDesc => '在這裡追蹤進行中挑戰的進度。';

  @override
  String get tourHomeGoalsWaterTitle => '你的喝水目標';

  @override
  String get tourHomeGoalsWaterDesc => '看看你離每日喝水目標還有多遠。';

  @override
  String get tourHomeReminderTitle => '你的下一個提醒';

  @override
  String get tourHomeReminderDesc => '看看下一個提醒什麼時候來，也可以在這裡修改。';

  @override
  String get tourHomeChallengesTitle => '你的挑戰';

  @override
  String get tourHomeChallengesDesc => '完成進行中的挑戰，賺取額外 XP。';

  @override
  String get tourHomeGrowthTitle => '你的成長狀態';

  @override
  String get tourHomeGrowthDesc => '看看累計增長、最近一次測量的差距，以及你記錄了幾筆。';

  @override
  String get tourHomeExploreTitle => '探索';

  @override
  String get tourHomeExploreDesc => '營養指南、成長食譜等更多內容都在這裡等你。';

  @override
  String get tourPlanProgramHeaderTitle => '你的 70 天計畫';

  @override
  String get tourPlanProgramHeaderDesc => '在這個圓環裡查看整體進度、目前等級和天數。';

  @override
  String get tourPlanProgramLevelsTitle => '等級';

  @override
  String get tourPlanProgramLevelsDesc => '看看你在 10 個等級中的哪一級，以及哪些還沒解鎖。';

  @override
  String get tourPlanNutritionHeaderTitle => '你的營養進度';

  @override
  String get tourPlanNutritionHeaderDesc => '追蹤你完成了幾項每日營養任務。';

  @override
  String get tourPlanNutritionFirstTitle => '營養任務';

  @override
  String get tourPlanNutritionFirstDesc => '勾選有助成長的飲食習慣。';

  @override
  String get tourProgressChartTitle => '成長曲線';

  @override
  String get tourProgressChartDesc => '在圖表上查看過去的測量，了解你的成長方向。';

  @override
  String get tourProgressReportTitle => '每週報告';

  @override
  String get tourProgressReportDesc => '查看整理你這週進度的報告。';

  @override
  String get tourProgressHistoryTitle => '你的測量紀錄';

  @override
  String get tourProgressHistoryDesc => '在時間軸上查看你記錄過的每筆身高。';

  @override
  String get tourAnalysisRadarTitle => '你的平衡圖';

  @override
  String get tourAnalysisRadarDesc => '在雷達圖上查看遺傳、成長速度、營養、睡眠和自律的平衡，找出最弱的一環。';

  @override
  String get tourAnalysisDailyNeedsTitle => '你的每日需求';

  @override
  String get tourAnalysisDailyNeedsDesc => '依你的身高和體重，查看每天需要的蛋白質、熱量、睡眠和水分。';

  @override
  String get journeyDataDoneTitle => '第一步完成';

  @override
  String get journeyDataDoneSubtitle => '我們已取得你的資料和潛力。接下來是 App 導覽。';

  @override
  String get journeyContinue => '繼續';

  @override
  String get journeyEnterApp => '進入 App';

  @override
  String get journeyProgressLabel => '開始使用';

  @override
  String get journeyTourDoneTitle => '歡迎來到 BeTaller！';

  @override
  String get journeyTourDoneSubtitle => '三個步驟都完成了。現在輪到你：完成第一項任務，開始你的旅程。';

  @override
  String get journeyViewPlansButton => '查看方案並開始';

  @override
  String get paywallRestoreLabel => '回復購買';

  @override
  String get paywallYearly => '年方案';

  @override
  String get paywallBestValue => '最划算';

  @override
  String paywallSavePercent(String percent) {
    return '省 $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/週';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/月';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/年';
  }

  @override
  String get paywallMonthly => '月方案';

  @override
  String get paywallWeekly => '週方案';

  @override
  String get paywallFreeTrial => '免費 3 天';

  @override
  String get paywallLoadError => '無法載入購買選項，請再試一次';

  @override
  String get paywallCtaAlt => '繼續';

  @override
  String get paywallTrialDisclaimer => '免費 3 天 · 之後自動續訂 · 可隨時取消';

  @override
  String get paywallYearlyDisclaimer => '每年自動續訂 · 可隨時取消';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '免費 $days 天，之後 $price/週 · 可隨時取消';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '免費 $days 天，之後 $price/月 · 可隨時取消';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '免費 $days 天，之後 $price/年 · 可隨時取消';
  }

  @override
  String get paywallRenewsWeekly => '每週自動續訂 · 可隨時取消';

  @override
  String get paywallRenewsMonthly => '每月自動續訂 · 可隨時取消';

  @override
  String get resultCardTitle => '你的預測成年身高';

  @override
  String resultRange(String min, String max) {
    return '可能範圍：$min 到 $max';
  }

  @override
  String resultPercentile(String percent) {
    return '比 $percent% 的同齡人高';
  }

  @override
  String resultGrowthLeft(String amount) {
    return '預估還能長：$amount';
  }

  @override
  String get resultFootnote => '依父母身高和生長曲線資料估算，不是醫療建議。';

  @override
  String get postureCheckTitle => '快速體態檢查';

  @override
  String get postureCheckIntro =>
      '腳跟、臀部和肩胛骨貼牆站好，然後回答三個問題。分數依你的回答計算，照片會保留用來做前後對比。';

  @override
  String get postureQHead => '不抬下巴的情況下，後腦勺能碰到牆嗎？';

  @override
  String get postureQHeadA1 => '可以，很輕鬆';

  @override
  String get postureQHeadA2 => '要刻意往後才碰得到';

  @override
  String get postureQHeadA3 => '不行，中間有空隙';

  @override
  String get postureQShoulders => '從側面照片看，你的肩膀和耳朵相比在哪裡？';

  @override
  String get postureQShouldersA1 => '和耳朵在同一直線';

  @override
  String get postureQShouldersA2 => '稍微偏前';

  @override
  String get postureQShouldersA3 => '明顯往前圓肩';

  @override
  String get postureQLowerBack => '把手伸到下背後面，空間有多大？';

  @override
  String get postureQLowerBackA1 => '剛好塞得進一隻平放的手';

  @override
  String get postureQLowerBackA2 => '完全沒有空間';

  @override
  String get postureQLowerBackA3 => '塞得進一個拳頭';

  @override
  String get postureCheckSave => '看我的分數';

  @override
  String get postureCheckNote => '這是自我檢查，不是醫療評估。';

  @override
  String get paywallTester => '測試者';

  @override
  String get introTag1 => '預測';

  @override
  String get introTag2 => '成長';

  @override
  String get introTag3 => '追蹤';

  @override
  String get introTag4 => '遊戲化';

  @override
  String get introTag5 => '社群';

  @override
  String get introTitle1 => '發現你的\n長高潛力';

  @override
  String get introSubtitle1 => '依遺傳、年齡和生活習慣，\n算出你的完整潛力。';

  @override
  String get introTitle2 => '每天\n高一點';

  @override
  String get introSubtitle2 => '用專屬的運動和飲食計畫，\n把潛力發揮出來。';

  @override
  String get introTitle3 => '追蹤每一\n公分';

  @override
  String get introSubtitle3 => '透過每月測量，\n看見你真實的進步。';

  @override
  String get introTitle4 => '升級，\n贏得獎勵';

  @override
  String get introSubtitle4 => '完成 70 天計畫，\n賺 XP、解鎖新等級。';

  @override
  String get introTitle5 => '已有數千人\n長高了';

  @override
  String get introSubtitle5 => '加入已達成目標的\n使用者社群。';

  @override
  String get criticalWindow => '關鍵時期';

  @override
  String get heightPotentialFading => '關於你的';

  @override
  String get fadingAway => '長高潛力的真相..';

  @override
  String get painHookDesc => '沒有正確的習慣，每過一天都可能永久失去幾公分。但現在還來得及扭轉。';

  @override
  String get painGeneticTitle => '遺傳不是全部';

  @override
  String get painGeneticDesc =>
      '遺傳決定 60%，但另外 40% 取決於你的行動。BeTaller 就是為了這 40% 而來。';

  @override
  String get painGeneticTag => '分析';

  @override
  String get painSleepTitle => '優化你的睡眠習慣';

  @override
  String get painSleepDesc => '每晚睡得好，生長激素分泌最多可提升 70%。BeTaller 自動幫你追蹤睡眠，你只要好好睡。';

  @override
  String get painSleepTag => '追蹤';

  @override
  String get painPostureTitle => '靠體態馬上多幾公分';

  @override
  String get painPostureDesc =>
      '正確的體態能立刻多出 1.5-3 cm。BeTaller 的每日體態任務，幾週內就能幫你養成。';

  @override
  String get painPostureTag => '體態';

  @override
  String get painExerciseTitle => '你的專屬運動計畫準備好了';

  @override
  String get painExerciseDesc =>
      '晨間伸展、懸吊、脊椎任務：BeTaller 都幫你準備並排好了。每天只要 8-12 分鐘。';

  @override
  String get painExerciseTag => '任務';

  @override
  String get painNutritionTitle => '飲食直接影響成長';

  @override
  String get painNutritionDesc => '蛋白質、鈣、維生素 D：BeTaller 每天提醒你該攝取哪些營養、什麼時候吃。';

  @override
  String get painNutritionTag => '營養';

  @override
  String get painTrackingTitle => '親眼見證你的成長';

  @override
  String get painTrackingDesc => '每月測量、進度照片、成長圖表：看見你長高的每一公分。';

  @override
  String get painTrackingTag => '進度';

  @override
  String get selectYourGender => '選擇你的性別';

  @override
  String get onboardingPredictSubtitle => '這會用來預測你的長高潛力，並建立你的專屬計畫。';

  @override
  String get other => '其他';

  @override
  String get whenWereYouBorn => '你的生日是？';

  @override
  String get heightAndWeight => '身高與體重';

  @override
  String get parentsHeight => '父母身高';

  @override
  String get weeklyWorkout => '每週運動';

  @override
  String get workoutsPerWeek => '每週運動次數';

  @override
  String get whatsYourEthnicity => '你的族裔是？';

  @override
  String get whiteCaucasian => '白人';

  @override
  String get blackAfricanAmerican => '黑人 / 非裔美國人';

  @override
  String get hispanicLatino => '西班牙裔 / 拉丁裔';

  @override
  String get asian => '亞洲人';

  @override
  String get middleEasternIndigenous => '中東 / 原住民';

  @override
  String get dontWantToAnswer => '我不想回答';

  @override
  String get footSizeLabel => '腳的尺寸';

  @override
  String get selectYourSize => '選擇你的尺寸';

  @override
  String get whatsYourDreamHeight => '你的理想身高是多少？';

  @override
  String get dreamHeightCalcSubtitle => '我們會依你的資料，計算達到這個身高的可能性。';

  @override
  String get dreamHeightLabel => '理想身高';

  @override
  String get sleepQuestion => '你每晚\n睡幾個小時？';

  @override
  String get thousandsSucceeded => '已有數千人\n成功';

  @override
  String get youCanToo => '你也做得到';

  @override
  String get yearsOld => '歲';

  @override
  String get verifiedLabel => '已驗證';

  @override
  String get scientificData => '科學數據';

  @override
  String get longTermResults => 'BeTaller 帶來\n長期成果';

  @override
  String get longTermResultsSubtitle => '很多人因為壞習慣，沒能長到應有的身高。';

  @override
  String get yourFinalHeight => '你的最終身高';

  @override
  String get badHabitsLegend => '壞習慣';

  @override
  String get optimizedLegend => '優化後';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => '身高可以透過\n習慣改變';

  @override
  String get chartFact2Pct => '9-10 小時';

  @override
  String get chartFact2Desc => '理想睡眠能促進\n生長激素';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => '改善體態\n就能多出';

  @override
  String get didYouKnow => '你知道嗎？';

  @override
  String get didYouKnowFact1 => '日常習慣影響你 30% 的身高';

  @override
  String get didYouKnowFact2 => '脊椎受壓會偷走 1.5-3 cm 身高';

  @override
  String get didYouKnowFact3 => '睡眠不足會讓 HGH 減少 70%';

  @override
  String get transformJourneyBegins => '你的蛻變\n旅程開始了';

  @override
  String get transformJourneySubtitle => '一套完整的計畫，\n一步步支持你健康成長。';

  @override
  String get week1Label => '1週';

  @override
  String get week1Title => '第 1 週';

  @override
  String get week1Desc => '脊椎排列改善，體態變好';

  @override
  String get month1Label => '1月';

  @override
  String get month1Title => '第 1 個月';

  @override
  String get month1Desc => '看見第一批公分，睡眠品質提升';

  @override
  String get month3Label => '3月';

  @override
  String get month3Title => '第 3 個月';

  @override
  String get month3Desc => '平均增加 +1.5–2.5 cm，肌肉發展';

  @override
  String get month6Label => '6月';

  @override
  String get month6Title => '第 6 個月';

  @override
  String get month6Desc => '達到最大潛力，帶著新身高生活';

  @override
  String get reachYourGoal => '達成你的目標';

  @override
  String get journeyBullet1 => '解鎖你的最大潛力';

  @override
  String get journeyBullet2 => '開始帶著新身高生活';

  @override
  String get journeyBullet3 => '寫下你的成功故事';

  @override
  String get unlockButton => '全部解鎖';

  @override
  String get dreamHeightOdds => '理想身高\n機率';

  @override
  String get growthCompleteLabel => '成長\n完成度';

  @override
  String get tallerThanPct => '比 76.7% 的同齡人高';

  @override
  String get levelNovice => '新手';

  @override
  String get levelBuilder => '打底者';

  @override
  String get levelGrinder => '苦練者';

  @override
  String get levelWarrior => '戰士';

  @override
  String get levelGodTier => '神級';

  @override
  String get levelDesc0 => '打好基礎';

  @override
  String get levelDesc1 => '加速成長';

  @override
  String get levelDesc2 => '加強訓練';

  @override
  String get levelDesc3 => '挑戰極限';

  @override
  String get levelDesc4 => '一分耕耘，一分收穫';

  @override
  String get levelDesc5 => '冠軍心態';

  @override
  String get levelDesc6 => '菁英表現';

  @override
  String get levelDesc7 => '掌控你的身體';

  @override
  String get levelDesc8 => '傳奇級自律';

  @override
  String get levelDesc9 => '最大潛力';

  @override
  String levelLabel(int level) {
    return '等級 $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '還剩 $days 天',
      one: '還剩 $days 天',
    );
    return '計畫$_temp0';
  }

  @override
  String get tapLabel => '點擊';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => '天';

  @override
  String get legendShort => '矮';

  @override
  String get legendBelowAvg => '低於平均';

  @override
  String get legendAverage => '平均';

  @override
  String get legendTall => '高';

  @override
  String get legendVeryTall => '很高';

  @override
  String get pctBottom5 => '後 5%';

  @override
  String get pctBottom25 => '後 25%';

  @override
  String get pctMedian => '中位數';

  @override
  String get pctTop25 => '前 25%';

  @override
  String get pctTop5 => '前 5%';

  @override
  String get fallingBehind => '落後中';

  @override
  String readTimeMinutes(int minutes) {
    return '閱讀 $minutes 分鐘';
  }

  @override
  String get inThisArticle => '本文內容';

  @override
  String get nextArticle => '下一篇';

  @override
  String get purchaseUnavailable => '無法完成購買，請再試一次。';

  @override
  String get viewPlan => '查看方案';

  @override
  String get viewPlanSubtitle => '查看你的訂閱詳情';

  @override
  String predictionConfidenceHint(String percent) {
    return '新增身高測量，預測準確度可達 $percent%';
  }

  @override
  String get paywallSlideHomeTitle => '一個畫面看完你的一天';

  @override
  String get paywallSlideHomeCaption => '任務、喝水、睡眠：把三個圓環填滿。';

  @override
  String get paywallSlideProgressTitle => '看見每一公分';

  @override
  String get paywallSlideProgressCaption => '每筆測量都會立刻出現在曲線上。';

  @override
  String get paywallSlideAnalysisTitle => '五項指標，一張圖';

  @override
  String get paywallSlideAnalysisCaption => '雷達圖會指出你最弱的一環。';

  @override
  String get paywallSlidePotentialTitle => '了解你的潛力';

  @override
  String get paywallSlidePotentialCaption => '看看你在同齡中排在哪裡。';

  @override
  String get paywallSlideDisciplineTitle => '保持連續紀錄';

  @override
  String get paywallSlideDisciplineCaption => '每一天都讓你的等級往上升。';

  @override
  String get paywallSlideRemindersTitle => '在對的時間提醒你';

  @override
  String get paywallSlideRemindersCaption => '設好時間，其他交給 App。';

  @override
  String get paywallSlidePostureTitle => '改善你的體態';

  @override
  String get paywallSlidePostureCaption => '一張側面照、快速自我檢查、清楚的任務。';

  @override
  String paywallTrialHeadline(String days) {
    return '免費 $days 天';
  }

  @override
  String paywallTrialThen(String price) {
    return '之後 $price · 可隨時取消';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / 年 · 可隨時取消';
  }

  @override
  String get obBedtimeTitle => '你通常幾點睡？';

  @override
  String get obBedtimeSubtitle => '睡眠提醒會設在這個時間前後。';

  @override
  String get obWorkoutTimeTitle => '你幾點運動？';

  @override
  String get obWorkoutTimeSubtitle => '讓訓練提醒準時出現。';

  @override
  String get obMealsTitle => '一天吃幾餐？';

  @override
  String get obMealsSubtitle => '點時間就能依你的作息調整。';

  @override
  String obMealsCount(String count) {
    return '$count 餐';
  }

  @override
  String obMealLabel(String n) {
    return '第 $n 餐';
  }

  @override
  String get obProteinTitle => '一天吃幾克蛋白質？';

  @override
  String get obProteinSubtitle => '大概的數字就夠了，我們會依此規劃。';

  @override
  String get obCaloriesTitle => '平均一天吃多少熱量？';

  @override
  String get obCaloriesSubtitle => '估計值就可以，之後我們再一起調整。';

  @override
  String get obNotSure => '我不確定';

  @override
  String get silNow => '現在';

  @override
  String get silPotential => '潛力';

  @override
  String get chartMeasured => '你的測量';

  @override
  String chartPotential(String height) {
    return '潛力 $height';
  }

  @override
  String chartDream(String height) {
    return '你的目標 $height';
  }

  @override
  String get targetsTitle => '今天，為你準備';

  @override
  String get targetsSubtitle => '依你的年齡、體重和訓練計算。';

  @override
  String get targetProtein => '蛋白質';

  @override
  String get targetCalcium => '鈣';

  @override
  String get targetVitaminD => '維生素 D';

  @override
  String get targetWater => '喝水';

  @override
  String get targetSleep => '睡眠';

  @override
  String get targetMove => '訓練';

  @override
  String targetPerMeal(String g) {
    return '每餐 $g g';
  }

  @override
  String get unitHours => '小時';

  @override
  String get unitMinutes => '分鐘';

  @override
  String get planStrength => '肌力';

  @override
  String get planJump => '跳躍與衝刺';

  @override
  String get planMobility => '伸展';

  @override
  String get planSport => '運動';

  @override
  String get planPosture => '體態';

  @override
  String get planRest => '休息';

  @override
  String planWeekTitle(int days) {
    return '你的一週：$days 天訓練';
  }

  @override
  String get planPreviewTitle => '你的計畫準備好了';

  @override
  String planPreviewTraining(int days) {
    return '每週 $days 天訓練，為成長設計';
  }

  @override
  String planPreviewProtein(int grams) {
    return '每天 $grams g 蛋白質，分配到各餐';
  }

  @override
  String planPreviewSleep(String hours) {
    return '睡 $hours 小時，搭配就寢提醒';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return '今天：$plan · $minutes 分鐘';
  }

  @override
  String get nRestTitle => '今天是休息日';

  @override
  String get nRestBody => '伸展十分鐘就夠了。恢復也是計畫的一部分。';

  @override
  String nProteinTitle(int grams) {
    return '今日蛋白質目標：$grams g';
  }

  @override
  String nProteinBody(int grams) {
    return '每餐約 $grams g：蛋、優格、雞肉、扁豆。';
  }

  @override
  String nWaterTitle(String liters) {
    return '喝水目標：$liters';
  }

  @override
  String get nWaterBody => '現在喝一杯，今天就能保持進度。';

  @override
  String get nSleepTitle => '該放鬆準備睡了';

  @override
  String nSleepBody(String hours) {
    return '你的目標是 $hours 小時。關掉螢幕，調暗燈光。';
  }

  @override
  String nMeasureBody(String potential) {
    return '你的潛力：$potential。早上量一下身高，看你的圖表變化。';
  }

  @override
  String get nTrialDay1Title => '你的計畫在等你';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return '今天：$plan，$minutes 分鐘。記錄你的身高，讓圖表開始累積。';
  }

  @override
  String get nTrialEndTitle => '你的免費試用明天結束';

  @override
  String nTrialEndBody(String price) {
    return '之後以 $price 繼續。無論如何，你的計畫和進度都會保留。';
  }

  @override
  String get trophyContinue => '繼續加油';

  @override
  String get guideSteps => '步驟說明';

  @override
  String get guideMistakes => '常見錯誤';

  @override
  String get guideTip => '小撇步';

  @override
  String get homeHeroTitle => '你的身高與潛力';

  @override
  String homeHeroGap(String cm) {
    return '還有 $cm 的空間';
  }

  @override
  String get anSubtitle => '你的分數、影響它的因素和你的方向';

  @override
  String get anScoreLabel => 'BeTaller 分數';

  @override
  String get anTierStarting => '起步';

  @override
  String get anTierBuilding => '累積中';

  @override
  String get anTierRising => '上升中';

  @override
  String get anTierStrong => '強勁';

  @override
  String get anTierPeak => '巔峰';

  @override
  String anTrendUp(int n) {
    return '比上週 +$n';
  }

  @override
  String anTrendDown(int n) {
    return '比上週 -$n';
  }

  @override
  String get anTrendFlat => '和上週一樣';

  @override
  String get anTrendFirst => '下週開始顯示每週趨勢';

  @override
  String anNextTier(int n, String tier) {
    return '再 $n 分到 $tier';
  }

  @override
  String get anTopTier => '最高級，繼續保持';

  @override
  String anCoverage(int n, int total) {
    return '依 $total 項指標中的 $n 項計算';
  }

  @override
  String get anNoScoreTitle => '資料還不夠';

  @override
  String get anNoScoreBody => '今天記錄睡眠、喝點水或做一次訓練，就會出現你的第一個分數。';

  @override
  String get anFastestWin => '最快提升';

  @override
  String get anBreakdownTitle => '你的分數怎麼來';

  @override
  String get anBreakdownHint => '每項指標都依你自己的資料給 0 到 100 分。百分比代表它佔的比重。';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => '還沒有資料';

  @override
  String get anNotCounted => '不計入';

  @override
  String get anFTraining => '訓練';

  @override
  String get anFConsistency => '持續度';

  @override
  String get anFSleep => '睡眠';

  @override
  String get anFHydration => '喝水';

  @override
  String get anFNutrition => '營養';

  @override
  String get anFPosture => '體態';

  @override
  String get anFMeasuring => '測量';

  @override
  String get anFGrowth => '成長速度';

  @override
  String get anFHeadroom => '成長空間';

  @override
  String anBTraining(int done, int planned) {
    return '過去 7 天完成 $planned 個計畫訓練日中的 $done 個';
  }

  @override
  String get anBTrainingNone => '依你的每週計畫計算訓練天數。';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak 天',
      one: '$streak 天',
    );
    return '連續 $_temp0，$days 天中有 $active 天完成一半計畫';
  }

  @override
  String get anBConsistencyNone => '計算你的連續紀錄，以及完成至少一半計畫的天數。';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 晚',
      one: '$days 晚',
    );
    return '平均每晚 $hours 小時，目標 $target 小時，已記錄 $_temp0';
  }

  @override
  String get anBSleepNone => '過去 7 天沒有睡眠紀錄。';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
      one: '$days 天',
    );
    return '平均每天 $litres，目標 $target，已記錄 $_temp0';
  }

  @override
  String get anBHydrationNone => '過去 7 天沒有喝水紀錄。';

  @override
  String anBNutrition(int done, int planned) {
    return '過去 7 天完成 $planned 項營養習慣中的 $done 項';
  }

  @override
  String get anBNutritionNone => '計算你計畫中的蛋白質、鈣、鋅和維生素 D 習慣。';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天前',
      one: '$days 天前',
    );
    return '靠牆自我檢查 $raw/90，$_temp0';
  }

  @override
  String anBPostureToday(int raw) {
    return '靠牆自我檢查 $raw/90，今天';
  }

  @override
  String get anBPostureNone => '還沒做過體態自我檢查。';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天前',
      one: '$days 天前',
    );
    return '上次測量：$_temp0';
  }

  @override
  String get anBMeasuringToday => '今天已測量';

  @override
  String get anBMeasuringNone => '還沒有測量。';

  @override
  String anBGrowth(String v, String e) {
    return '每年 $v，你這個年齡一般為 $e';
  }

  @override
  String get anBGrowthNone => '需要兩筆相隔至少 30 天的測量。';

  @override
  String get anBGrowthAdult => '生長板通常在 21 歲前閉合，所以成長速度不計入你的分數。';

  @override
  String anBHeadroom(String cm) {
    return '目前離你的潛力還有 $cm';
  }

  @override
  String get anATraining => '開始今天的訓練';

  @override
  String get anAConsistency => '完成今天一半的計畫';

  @override
  String get anASleepLog => '記錄昨晚的睡眠';

  @override
  String anASleep(String target) {
    return '今晚睡 $target 小時';
  }

  @override
  String get anAHydrationLog => '記錄一杯水';

  @override
  String anAHydration(String left) {
    return '今天再喝 $left';
  }

  @override
  String get anAHydrationDone => '今天已達標，明天照做';

  @override
  String get anANutrition => '勾選今天的營養習慣';

  @override
  String get anAPostureFirst => '做 1 分鐘體態自我檢查';

  @override
  String get anAPostureRedo => '重做體態自我檢查';

  @override
  String get anAPostureKeep => '持續每日體態任務';

  @override
  String get anAMeasure => '現在量身高';

  @override
  String get anAMeasureKeep => '下週再量一次';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天後再量一次',
      one: '$days 天後再量一次',
    );
    return '$_temp0';
  }

  @override
  String get anAGrowth => '每 2 週量一次來追蹤';

  @override
  String get anAHeadroom => '查看你的潛力';

  @override
  String get anPotentialTitle => '你的潛力';

  @override
  String get anPotentialLabel => '預測成年身高';

  @override
  String anPotentialToGo(String cm) {
    return '還差 +$cm';
  }

  @override
  String get anPotentialReached => '你已達到預測身高';

  @override
  String get anPotentialNote => 'App 裡各處都是同一個數字，而且只會往上調。';

  @override
  String anDreamLine(String h) {
    return '你的目標：$h';
  }

  @override
  String get anSourcesTitle => '這些公分從哪裡來';

  @override
  String get anSourcesGenes => '遺傳與年齡';

  @override
  String get anSourcesHabits => '睡眠、飲食、訓練';

  @override
  String get anSourcesPosture => '體態';

  @override
  String get anPctTitle => '你這個年齡的身高';

  @override
  String anPctValue(int p) {
    return '比 $p% 的同齡人高';
  }

  @override
  String get anPctBasis => '美國 CDC 生長曲線，同年齡同性別';

  @override
  String get anPctMore => '完整比較';

  @override
  String get anNeedsBasis => '依你的年齡、體重和訓練計算';

  @override
  String get anCalcium => '鈣';

  @override
  String get anVitaminD => '維生素 D';

  @override
  String get anMovement => '活動';

  @override
  String get anUnitMin => '分鐘';

  @override
  String get anUnitHours => '小時';

  @override
  String get anPerDay => '每天';

  @override
  String get anPerNight => '每晚';

  @override
  String get anUnlockScoreTitle => '你完整的 BeTaller 分數';

  @override
  String get anUnlockScoreBody => '分數、背後的九項指標，以及下一步該做什麼。';

  @override
  String get anUnlockSourcesTitle => '看看你的公分從哪裡來';

  @override
  String get anUnlockNeedsTitle => '幫你算好的每日需求';

  @override
  String get anUnlockCta => '解鎖';

  @override
  String get anFlowResultTitle => '已存到你的圖表';

  @override
  String get anFlowResultBody => '你過去的身高現在和測量值、潛力一起顯示在同一條曲線上。';

  @override
  String get anFlowOpenAnalysis => '打開你的分析';

  @override
  String anTopPct(int p) {
    return '前 $p%';
  }

  @override
  String get anNeedsTitle => '你的每日需求';

  @override
  String get pgUnlockPro => '用 Pro 解鎖';

  @override
  String get pgPhotosLockedTitle => '看見你的轉變';

  @override
  String get pgPhotosLockedBody => '每兩週存一張附身高的照片，用滑桿比較任兩張。';

  @override
  String get pgTransformationTitle => '你的轉變';

  @override
  String get pgHeightChange => '身高變化';

  @override
  String get pgDaysApart => '相隔天數';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
      one: '$days 天',
    );
    return '這兩張照片相隔 $_temp0，差了 $delta。';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days 天',
      one: '$days 天',
    );
    return '身高相同，相隔 $_temp0。體態和身形會先改變，身高則在幾個月內跟上。';
  }

  @override
  String get pgModeSlider => '滑桿';

  @override
  String get pgModeSideBySide => '並排';

  @override
  String get pgDragToReveal => '拖曳來比較';

  @override
  String get pgOnePhotoTitle => '你的「之前」照片已儲存';

  @override
  String pgOnePhotoBody(String date) {
    return '在 $date 用同樣姿勢拍下一張，就能看到第一次對比。';
  }

  @override
  String get pgEmptyTitle => '開始你的轉變';

  @override
  String get pgEmptyBody => '每兩週一張照片，同樣姿勢、同個地點，附上你的身高。幾個月後，你就能在第 1 天和今天之間滑動比較。';

  @override
  String get pgTakeFirstPhoto => '拍你的第一張照片';

  @override
  String get pgPhotoDueNow => '該拍新照片了';

  @override
  String pgNextPhotoOn(String date) {
    return '下一張照片 $date';
  }

  @override
  String pgDayN(int n) {
    return '第 $n 天';
  }

  @override
  String get pgNewPhoto => '新照片';

  @override
  String get pgGuideTitle => '每次都用同樣姿勢';

  @override
  String get pgGuideSubtitle => '照片用同樣方式拍，比較起來才準。';

  @override
  String get pgGuideGhost => '上一張照片會淡淡顯示，把自己對齊它。';

  @override
  String get pgGuideStep1 => '站在 2 m 外，手機放在胸口高度';

  @override
  String get pgGuideStep2 => '面向鏡頭，雙腳併攏，雙手放鬆';

  @override
  String get pgGuideStep3 => '同個地點、同樣光線、穿合身衣服';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => '胸口高度';

  @override
  String get pgTakePhoto => '拍照';

  @override
  String get pgFromGallery => '從相簿選擇';

  @override
  String get pgChoosePhoto => '選擇照片';

  @override
  String get pgPostureTitle => '體態檢查';

  @override
  String get pgPostureLockedTitle => '找出你的弱點';

  @override
  String get pgPostureLockedBody => '替頭、肩膀和下背打分數，每個部位給你兩個動作，並逐週查看分數。';

  @override
  String get pgAreaHead => '頭部';

  @override
  String get pgAreaShoulders => '肩膀';

  @override
  String get pgAreaLowerBack => '下背';

  @override
  String get pgHeadMeaning0 => '你的頭正好在肩膀上方。每天花點時間調整，維持下去。';

  @override
  String get pgHeadMeaning1 => '放鬆時頭會往前傾。長時間滑手機很常見，而且很快就能改善。';

  @override
  String get pgHeadMeaning2 => '你的頭在肩膀前方。先改善這個：它會讓你在每張照片裡都顯得比較矮。';

  @override
  String get pgShouldersMeaning0 => '肩膀和耳朵在同一直線，你的上背很盡責。';

  @override
  String get pgShouldersMeaning1 => '肩膀稍微往前。胸口緊繃會把肩膀往內拉，打開胸口就能拉回來。';

  @override
  String get pgShouldersMeaning2 => '圓肩。你的上背往前彎，站姿就少了幾分高度。';

  @override
  String get pgLowerBackMeaning0 => '自然的曲線。你的髖部和核心讓脊椎保持在正確位置。';

  @override
  String get pgLowerBackMeaning1 => '下背太平。溫和的後仰和活動度練習能找回自然曲線。';

  @override
  String get pgLowerBackMeaning2 => '下背明顯拱起。髖屈肌太緊會讓骨盆前傾；伸展它們並強化核心就能拉回來。';

  @override
  String get pgLegacyMeaning => '這是舊版本儲存的結果，沒有這些問題。重做檢查就能取得這個部位的建議。';

  @override
  String get pgHowItWorks => '檢查方式說明';

  @override
  String get pgYourPosture => '你的體態';

  @override
  String pgCheckedOn(String date) {
    return '檢查日期 $date';
  }

  @override
  String get pgOutOf100 => '滿分 100';

  @override
  String get pgAllAreasGood => '三個部位看起來都不錯，繼續保持。';

  @override
  String pgStartWith(String area) {
    return '從這裡開始：$area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '比上次 $delta';
  }

  @override
  String get pgStatusGood => '良好';

  @override
  String get pgStatusFair => '還能更好';

  @override
  String get pgStatusFix => '優先改善';

  @override
  String get pgKeepItWith => '這樣維持';

  @override
  String get pgFixItWith => '這樣改善';

  @override
  String get pgRetakeNow => '該做每週檢查了';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '下次檢查：$n 天後',
      one: '下次檢查：明天',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue => '同一面牆、同樣三個問題。每週檢查能看出動作有沒有效。';

  @override
  String pgRetakeBodyWait(String date) {
    return '持續做上面的動作到 $date，再重做檢查看看有沒有效。';
  }

  @override
  String get pgRetakeCheck => '重做檢查';

  @override
  String get pgRetakeAnyway => '現在重做';

  @override
  String get pgHistoryTitle => '你的分數';

  @override
  String pgSinceFirst(String delta) {
    return '比第一次 $delta';
  }

  @override
  String get pgHistoryOne => '這是你的第一次檢查。7 天後再做一次，趨勢就從這裡開始。';

  @override
  String get pgPostureIntroTitle => '你站得有多直？';

  @override
  String get pgPostureIntroBody => '靠牆回答三個問題，大約一分鐘。你會得到分數，以及改善每個弱點的兩個動作。';

  @override
  String get pgPostureStep1 => '腳跟、臀部和肩胛骨貼牆站好。';

  @override
  String get pgPostureStep2 => '拍一張全身入鏡的側面照，之後可以回頭比較。';

  @override
  String get pgPostureStep3 => '誠實回答三個問題，分數依你的回答計算。';

  @override
  String get pgPostureStep4 => '每週在同一個時段重做一次。';

  @override
  String get pgStartCheck => '開始體態檢查';

  @override
  String pgWeekRange(String start, String end) {
    return '$start 到 $end';
  }

  @override
  String get pgGradeGreat => '冠軍週';

  @override
  String get pgGradeGood => '扎實的一週';

  @override
  String get pgGradeOk => '漸入佳境';

  @override
  String get pgGradeStart => '重新出發';

  @override
  String get pgTopWeek => '最佳週';

  @override
  String pgVsLastWeek(String delta) {
    return '比上週 $delta';
  }

  @override
  String get pgDaysCompleted => '完成整份計畫的天數';

  @override
  String get pgDayStreak => '天連續紀錄';

  @override
  String pgBestDay(String day) {
    return '最佳：$day';
  }

  @override
  String get pgNextWeekFocus => '下週重點';

  @override
  String pgFocusPlan(int n, int done) {
    return '在 $n 天完成整份計畫。這週你做到了 $done 天。';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return '安排 $n 次訓練。這週你做了 $done 次。';
  }

  @override
  String get pgFocusMeasure => '量一次身高：早上、赤腳、同個地點。這樣才看得出真正的變化。';

  @override
  String pgFocusKeepDay(String day) {
    return '所有目標都達成了。現在讓$day也成為完整的一天。';
  }

  @override
  String get pgFocusKeep => '所有目標都達成，每天都完整。同樣的計畫，同樣的節奏。';

  @override
  String get pgHeightThisWeek => '本週身高';

  @override
  String pgHeightNow(String height) {
    return '目前 $height';
  }

  @override
  String get pgNoMeasurementWeek => '本週還沒有測量';

  @override
  String get pgFirstMeasurement => '你的第一筆測量';

  @override
  String pgStartedAt(String height) {
    return '起點 $height';
  }

  @override
  String pgPotentialAt(String height) {
    return '潛力 $height';
  }

  @override
  String pgToPotential(String cm) {
    return '離預測潛力還有 $cm。';
  }

  @override
  String get pgPotentialReached => '你已達到預測潛力。改善體態仍能讓你展現更多身高。';

  @override
  String get pgHabitsToday => '今日紀錄';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves 個動作 · $minutes 分鐘';
  }

  @override
  String plDoneCount(int done, int total) {
    return '已完成 $done/$total';
  }

  @override
  String get plStartWorkout => '開始訓練';

  @override
  String get plContinueWorkout => '繼續訓練';

  @override
  String get plWorkoutDoneToday => '今天的訓練已完成';

  @override
  String get plTraining => '訓練';

  @override
  String get plHabits => '每日習慣';

  @override
  String get plRestDayNote => '輕鬆的一天：做一小段瑜伽，讓身體為明天保持放鬆。';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps 下';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds 秒';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds 秒（每邊）';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes 分鐘';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g，分配到各餐';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters，分散在一天中';
  }

  @override
  String plHabitSleep(String hours) {
    return '今晚 $hours 小時';
  }

  @override
  String get plYourRoutines => '你的任務';

  @override
  String get plNewRoutine => '新增任務';

  @override
  String get plCustomEmpty => '建立你自己的任務，每天在這裡打勾。';

  @override
  String plDeleteRoutineQ(String name) {
    return '要刪除「$name」嗎？';
  }

  @override
  String get plHoldToDelete => '長按任務即可刪除。';

  @override
  String plSetOf(int current, int total) {
    return '第 $current/$total 組';
  }

  @override
  String get plRest => '休息';

  @override
  String get plStartSet => '開始這組';

  @override
  String get plSetDone => '這組完成';

  @override
  String get plSkipRest => '略過休息';

  @override
  String get plNextMove => '下一個動作';

  @override
  String get plSkipMove => '略過';

  @override
  String plUpNext(String name) {
    return '下一個：$name';
  }

  @override
  String get plLastMove => '最後一個動作';

  @override
  String get plWorkoutComplete => '訓練完成';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves 個動作，約 $minutes 分鐘。每一次都算數。';
  }

  @override
  String get plEachSide => '每邊';

  @override
  String get plMoveDone => '動作完成';

  @override
  String plRepsBig(int reps) {
    return '$reps 下';
  }

  @override
  String get plSessionHint => '照自己的節奏做，完成後點「完成」。';

  @override
  String plProgramDayOf(int day, int total) {
    return '第 $day/$total 天';
  }

  @override
  String get plTodayStep => '今天這一步';

  @override
  String get plTickToComplete => '勾完每個動作就完成今天';

  @override
  String plNextDayTomorrow(int day) {
    return '第 $day 天明天開放。休息也是成長的一部分。';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '再 $days 天',
      one: '再 $days 天',
    );
    return '$_temp0升到第 $level 級';
  }

  @override
  String get plProgramFinished => '70 天全部完成，你完成了整個計畫。';

  @override
  String plDayCompleteToast(int day) {
    return '第 $day 天完成';
  }

  @override
  String get plLevelWeek => '本級的一週';

  @override
  String get plProgressionTitle => '難度怎麼提升';

  @override
  String get plNow => '現在';

  @override
  String plLevelN(int n) {
    return 'Lv $n';
  }

  @override
  String get plUnlockProgram => '解鎖 70 天計畫';

  @override
  String get plProgramPitch => '10 個等級，每週一級。每升一級，維持動作的秒數、跳躍的次數都會增加，準備好時再加一組。';

  @override
  String plDayLocked(int day) {
    return '先完成第 $day 天';
  }

  @override
  String plCurrentDay(int day) {
    return '第 $day 天';
  }

  @override
  String get plTodaysTargets => '今日目標';

  @override
  String get plTargetsBasis => '依你的年齡、體重和訓練計算';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals 餐 x $grams g';
  }

  @override
  String get plZinc => '鋅';

  @override
  String get plMagnesium => '鎂';

  @override
  String get plEnergy => '熱量';

  @override
  String get plChecklist => '今日清單';

  @override
  String plCheckProtein(int grams) {
    return '蛋白質 $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return '鈣 $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return '維生素 D $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return '喝水 $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '已勾選餐點提供 $amount';
  }

  @override
  String get plVitaminDNote => '中午讓手臂和臉曬 15 分鐘太陽，或吃醫生同意的補充品';

  @override
  String plWaterLogged(String liters) {
    return '目前已記錄 $liters';
  }

  @override
  String get plMealPlan => '你的菜單';

  @override
  String get plMealPlanSub => '真實食物、真實克數，依你的目標分量';

  @override
  String get plSnack => '點心';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '蛋白質 $protein g · 鈣 $calcium mg · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return '目標 $grams g';
  }

  @override
  String get plMarkEaten => '標記為已吃';

  @override
  String get plEaten => '已吃';

  @override
  String get plPlanTotal => '全天總計';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return '這些餐點約提供 $kcal kcal 中的 $planKcal。其餘用水果、蔬菜、麵包或米飯補足。';
  }

  @override
  String get plWeeklyMenu => '每週菜單';

  @override
  String get plWeeklyMenuSub => '每天不同的餐點，同樣的目標';

  @override
  String get plUnlockMenu => '解鎖完整每週菜單';

  @override
  String get plRecipes => '食譜';

  @override
  String get plRecipesSub => '快速高蛋白料理';

  @override
  String get plNutritionGuide => '營養指南';

  @override
  String get plNutritionGuideSub => '營養素、食物與補充品';

  @override
  String plPieces(int n) {
    return '$n 個';
  }

  @override
  String get plFoodOats => '燕麥';

  @override
  String get plFoodMilk => '牛奶';

  @override
  String get plFoodBanana => '香蕉';

  @override
  String get plFoodWalnuts => '核桃';

  @override
  String get plFoodGreekYogurt => '希臘優格';

  @override
  String get plFoodYogurt => '優格';

  @override
  String get plFoodEggs => '蛋';

  @override
  String get plFoodBread => '全麥麵包';

  @override
  String get plFoodWhiteCheese => '菲達起司';

  @override
  String get plFoodHardCheese => '切達起司';

  @override
  String get plFoodSalad => '番茄小黃瓜沙拉';

  @override
  String get plFoodOrange => '柳橙';

  @override
  String get plFoodPeanutButter => '花生醬';

  @override
  String get plFoodSpinach => '菠菜';

  @override
  String get plFoodCottageCheese => '茅屋起司';

  @override
  String get plFoodChicken => '雞胸肉';

  @override
  String get plFoodBulgur => '布格麥';

  @override
  String get plFoodAyran => 'Ayran（優格飲）';

  @override
  String get plFoodTuna => '鮪魚（罐頭）';

  @override
  String get plFoodPasta => '義大利麵';

  @override
  String get plFoodBeef => '瘦牛肉';

  @override
  String get plFoodRice => '白飯';

  @override
  String get plFoodChickpeas => '鷹嘴豆';

  @override
  String get plFoodSalmon => '鮭魚';

  @override
  String get plFoodBroccoli => '花椰菜';

  @override
  String get plFoodPotato => '馬鈴薯';

  @override
  String get plFoodLentils => '扁豆';

  @override
  String get plFoodSardines => '沙丁魚';

  @override
  String get plFoodAlmonds => '杏仁';

  @override
  String get plFoodKefir => '克菲爾';

  @override
  String get plFoodPumpkinSeeds => '南瓜子';

  @override
  String get wtCoffee => '咖啡';

  @override
  String get wtTea => '茶';

  @override
  String get wtCola => '可樂';

  @override
  String get wtEnergyDrink => '能量飲料';

  @override
  String get crCustomBadge => '自訂';

  @override
  String get crNameHint => '例如：晨間活力伸展';

  @override
  String get crDoseHint => '例如：3x10 下或 3x30 秒';

  @override
  String get paywallLifetime => '終身';

  @override
  String paywallOnce(String price) {
    return '一次付清 $price';
  }

  @override
  String get paywallLifetimeBadge => '免訂閱';

  @override
  String get paywallLifetimeDisclaimer => '一次性付款 · 免訂閱，不會自動續訂';

  @override
  String get pwSlidePotentialTitle => '看看你的潛力';

  @override
  String get pwSlidePotentialCaption => '依你的年齡、身高和父母身高計算。';

  @override
  String get pwSlideTodayTitle => '每天都有計畫';

  @override
  String get pwSlideTodayCaption => '簡短的每日訓練，附影片教學。';

  @override
  String get pwSlideProgramTitle => '70 天，10 個等級';

  @override
  String get pwSlideProgramCaption => '每週動作都會稍微變難一點。';

  @override
  String get pwSlideNutritionTitle => '為成長而吃';

  @override
  String get pwSlideNutritionCaption => '為你量身設定每日蛋白質、鈣和維生素 D 目標。';

  @override
  String get pwSlideChartTitle => '看著你的曲線上升';

  @override
  String get pwSlideChartCaption => '每筆測量都會落在通往潛力的路線上。';

  @override
  String get pwSlideScoreTitle => '一個分數看習慣';

  @override
  String get pwSlideScoreCaption => '知道該先改善哪個習慣。';

  @override
  String get pwSlidePostureTitle => '今天就站得更挺';

  @override
  String get pwSlidePostureCaption => '快速體態檢查，加上改善的動作。';

  @override
  String get pwExample => '範例';

  @override
  String pwYouLine(String now, String potential) {
    return '你：$now → 潛力 $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return '範例：$now → 潛力 $potential';
  }

  @override
  String get tv3NewEyebrow => '新功能';

  @override
  String get tv3NewTitle => 'BeTaller 大更新';

  @override
  String get tv3NewDesc => '新計畫、新課程、新外觀。來看看有什麼新東西。';

  @override
  String get tv3PotentialTitle => '這是你的潛力';

  @override
  String get tv3PotentialDesc => '你現在的身高，和你能達到的高度並排。計畫會幫你縮短差距。';

  @override
  String get tv3TodayTitle => '今日計畫';

  @override
  String tv3TodayDesc(String button) {
    return '為今天準備的簡短訓練。點「$button」跟著做。';
  }

  @override
  String get tv3ProgramTitle => '70 天自律計畫';

  @override
  String get tv3ProgramDesc => '每天一步，橫跨 10 個等級。每天都建立在前一天的基礎上。';

  @override
  String get tv3NutritionTitle => '你的每日目標';

  @override
  String get tv3NutritionDesc => '蛋白質、鈣、維生素 D 和水分，依你的身體計算。';

  @override
  String get tv3ChartTitle => '看著你的曲線';

  @override
  String get tv3ChartDesc => '每一兩週量一次，看你的曲線往潛力爬升。';

  @override
  String get tv3ScoreTitle => '你的 BeTaller 分數';

  @override
  String get tv3ScoreDesc => '用一個數字看你的表現。先提升最弱的部分。';

  @override
  String get tv3Next => '下一步';

  @override
  String get tv3ShowMe => '帶我看看';

  @override
  String get tv3Done => '出發吧';

  @override
  String get obWhyTitle => '你為什麼想長高？';

  @override
  String get obWhySubtitle => '可複選。你的計畫從你的理由開始。';

  @override
  String get obWhyConfidence => '更有自信';

  @override
  String get obWhyImpression => '給人更好的第一印象';

  @override
  String get obWhySports => '運動表現更好';

  @override
  String get obWhyClothes => '衣服穿起來更好看';

  @override
  String get obWhyPhotos => '拍照更好看';

  @override
  String get obWhyPotential => '只是想知道我的潛力';

  @override
  String get obTriedTitle => '你用過其他長高 App 嗎？';

  @override
  String get obTriedSubtitle => '沒有錯誤答案，這能幫我們讓你看到這裡的不同。';

  @override
  String get obTriedStopped => '用過，但後來沒用了';

  @override
  String get obTriedStill => '有，現在還在用';

  @override
  String get obTriedFirst => '沒有，這是第一個';

  @override
  String get obTriedStoppedTitle => '光有數字撐不下去';

  @override
  String get obTriedStoppedBody =>
      '大多數 App 只給你一個數字。BeTaller 把它變成每天能打勾的計畫，還會在你設定的時間提醒你。';

  @override
  String get obTriedStillTitle => '保留對你有用的';

  @override
  String get obTriedStillBody => 'BeTaller 補上每天的部分：依你的回答打造、可以一步步打勾的計畫。';

  @override
  String get obTriedFirstTitle => '很好的起點';

  @override
  String get obTriedFirstBody => '在這裡你得到的不只是一個數字。BeTaller 會把你的回答變成每天能打勾的計畫。';

  @override
  String get obTriedCardTitle => '你每天要打勾的事';

  @override
  String get obTriedItem1 => '為你這週挑選的簡短訓練';

  @override
  String get obTriedItem2 => '你的蛋白質目標';

  @override
  String get obTriedItem3 => '準時熄燈睡覺';

  @override
  String get obBlockTitle => '什麼會阻礙你？';

  @override
  String get obBlockSubtitle => '可複選。你的計畫會幫你避開它們。';

  @override
  String get obBlockForget => '我會忘記';

  @override
  String get obBlockTime => '時間不夠';

  @override
  String get obBlockExercises => '不知道該做哪些動作';

  @override
  String get obBlockMotivation => '動力會消失';

  @override
  String get obBlockBedtime => '我很晚睡';

  @override
  String get obBlockMeals => '我會跳過正餐';

  @override
  String get obFirstTitle => '長高後你第一件想做的事？';

  @override
  String get obFirstSubtitle => '想像一下，那就是你努力的目標。';

  @override
  String get obFirstWardrobe => '更新我的衣櫃';

  @override
  String get obFirstMuscle => '練肌肉';

  @override
  String get obFirstPhotos => '多發幾張照片';

  @override
  String get obFirstTeam => '參加校隊選拔';

  @override
  String get obFirstFeelGood => '沒什麼特別的，就是感覺很好';

  @override
  String get obBuiltChip => '為你打造';

  @override
  String get obBuiltTitle => '你的計畫，為你量身打造';

  @override
  String get obBuiltReason => '你的理由';

  @override
  String get obBuiltGoal => '目標';

  @override
  String get obBuiltWhen => '預計達成時間';

  @override
  String get obBuiltBlockers => '阻礙你的事，已經處理好';

  @override
  String get obFixForget => '在你選的時間提醒你';

  @override
  String get obFixTime => '簡短的訓練，大多約 15 分鐘';

  @override
  String get obFixExercises => '影片教學動作，一步一步來';

  @override
  String get obFixMotivation => '連續紀錄和等級讓你持續前進';

  @override
  String get obFixBedtime => '睡眠目標和就寢提醒';

  @override
  String get obFixMeals => '蛋白質目標和菜單';

  @override
  String get obNotifTitle => 'BeTaller 會在重要時刻提醒你';

  @override
  String get obNotifSubtitle => '依你給的時間設定，隨時都能修改。';

  @override
  String get obNotifWorkout => '訓練';

  @override
  String obNotifWorkoutDetail(String time) {
    return '在你 $time 的訓練前 30 分鐘';
  }

  @override
  String get obNotifMeal => '餐點與蛋白質';

  @override
  String obNotifMealDetail(String time) {
    return '在你 $time 用餐時';
  }

  @override
  String get obNotifWater => '喝水';

  @override
  String get obNotifWaterDetail => '下午喝水休息一下';

  @override
  String get obNotifSleep => '睡前放鬆';

  @override
  String obNotifSleepDetail(String time) {
    return '在你 $time 就寢前一小時';
  }

  @override
  String get obNotifAllow => '開啟提醒';

  @override
  String get obNotifNotNow => '暫時不要';

  @override
  String get obNotifNow => '現在';

  @override
  String get ftOneFree => '1 次免費';

  @override
  String get ftFreeToday => '今天免費';

  @override
  String get ftContinuePro => '用 Pro 繼續';

  @override
  String get ftNotNow => '暫時不要';

  @override
  String get ftOutWorkoutTitle => '你已用完免費訓練';

  @override
  String get ftOutWorkoutBody => '用 Pro 保持連續紀錄：每天都有引導訓練，每個動作都幫你計時。';

  @override
  String get ftOutDayTitle => '你的免費第一天結束了';

  @override
  String get ftOutDayBody => '你的計畫、目標和進度都還能在這裡查看。用 Pro 保持連續紀錄：每天勾選計畫、記錄喝水和睡眠。';

  @override
  String get ftOutPostureTitle => '你已用完免費體態檢查';

  @override
  String get ftOutPostureBody => '你的結果會保留在這裡。用 Pro 每週再檢查，看著體態變好。';

  @override
  String get ftOutPhotosTitle => '你已用完免費照片比較';

  @override
  String get ftOutPhotosBody => '那組照片你還是可以看。用 Pro 新增更多照片，任選兩張比較。';

  @override
  String get ftOutReportTitle => '你已用完免費每週報告';

  @override
  String get ftOutReportBody => '用 Pro 每週取得完整回顧：每天的分數、你的目標，以及一件可以做得更好的事。';

  @override
  String get ftOutScoreTitle => '你已看過免費的分數分析';

  @override
  String get ftOutScoreBody => '你的分數會留在畫面上。用 Pro 每天看看分數怎麼來、下一步該做什麼。';

  @override
  String get ftOutArticleTitle => '你已讀完免費文章';

  @override
  String get ftOutArticleBody => '那篇文章你還是可以看。用 Pro 閱讀整個文章庫。';

  @override
  String get ftWhyWorkout => '引導訓練是 Pro 功能';

  @override
  String get ftWhyPlan => '勾選計畫是 Pro 功能';

  @override
  String get ftWhyProgram => '70 天計畫是 Pro 功能';

  @override
  String get ftWhyWater => '每天記錄喝水是 Pro 功能';

  @override
  String get ftWhySleep => '每天記錄睡眠是 Pro 功能';

  @override
  String get ftWhyNutrition => '每日飲食計畫是 Pro 功能';

  @override
  String get ftWhyPosture => '每週體態檢查是 Pro 功能';

  @override
  String get ftWhyPhotos => '照片比較是 Pro 功能';

  @override
  String get ftWhyReport => '每週報告是 Pro 功能';

  @override
  String get ftWhyScore => '分數分析是 Pro 功能';

  @override
  String get ftWhyArticle => '完整文章庫是 Pro 功能';

  @override
  String get ftPlanLocked => '你的計畫仍可在這裡查看，勾選則是 Pro 功能。';

  @override
  String get ftNutritionLocked => '你的目標和餐點仍可在這裡查看，勾選則是 Pro 功能。';

  @override
  String get ftPreviewTag => '預覽';

  @override
  String get ftPreviewTitle => '預覽到這裡';

  @override
  String get ftPreviewBody => '這次訓練的其餘部分是 Pro 功能。接下來的內容：';

  @override
  String get ftFreeWorkoutUsed => '這是你的免費引導訓練。Pro 每天都會提供新的訓練。';

  @override
  String get ftScoreLockedTitle => '你的分數怎麼來';

  @override
  String get ftScoreLockedBody => '分數的每個部分、依據是什麼，以及下一步該做的那件事。';

  @override
  String get ftReportLockedTitle => '你完整的一週';

  @override
  String get ftReportLockedBody => '依計畫替每天打分數，還有你的目標、身高和下週的一個重點。';

  @override
  String get ftPhotosLockedTitle => '比較這兩張';

  @override
  String get ftPhotosLockedBody => '你的免費比較已用完。用 Pro 可以在任兩張照片間滑動比較。';

  @override
  String get ftArticleFreeLine => '第一篇文章免費，挑你想看的吧。';

  @override
  String get plFinishWorkout => '完成';

  @override
  String get obTriedMostApps => '大多數 App';

  @override
  String get obTriedThatsIt => '一個數字，就這樣。';

  @override
  String get obTriedPlanLabel => '你在 BeTaller 的一天';

  @override
  String get obTriedProteinSub => '分配到各餐';

  @override
  String get obTriedSleepSub => '睡前提醒';

  @override
  String get obTriedFeatVideo => '影片教學動作';

  @override
  String get obTriedFeatReminders => '依你的時間提醒';

  @override
  String get obTriedFeatStreaks => '連續紀錄與等級';

  @override
  String get obBedtimeUnknown => '不知道，每天不一樣';

  @override
  String obBedtimeUnknownHint(String time) {
    return '我們會依你這個年齡需要的睡眠，建議 $time。隨時都能修改。';
  }

  @override
  String get obWorkoutTimeUnknown => '不知道，我沒有固定時間';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return '我們先用 $time，隨時都能修改。';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return '建議：大約 $time 就寢。隨時都能修改。';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return '建議：大約 $time 訓練。隨時都能修改。';
  }

  @override
  String get obNotifSubtitleSuggested => '依你給的時間設定，不確定的地方我們給了建議。隨時都能修改。';

  @override
  String get plFoodBrownRice => '糙米';

  @override
  String get unitHeightTitle => '身高單位';

  @override
  String get unitWeightTitle => '體重單位';

  @override
  String get unitWaterTitle => '水量單位';

  @override
  String get unitOptCm => '公分';

  @override
  String get unitOptFtIn => '英尺和英寸';

  @override
  String get unitOptKg => '公斤';

  @override
  String get unitOptLb => '磅';

  @override
  String get unitOptStLb => '英石和磅';

  @override
  String get unitOptLiters => '公升';

  @override
  String get unitOptFlOz => '液量盎司';

  @override
  String achieveGrowthImp(String amount) {
    return '長高 $amount';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return '累計長高 $amount';
  }

  @override
  String get postureBenefitIn => '頭、肩膀和下背。站挺一點，能多展現真實身高約 1 in。';

  @override
  String get notifPostureBodyIn => '背打直、肩膀往後。好體態 = 差約 1 in！';

  @override
  String get painPostureDescIn =>
      '正確的體態能立刻多出約 1 in。BeTaller 的每日體態任務，幾週內就能幫你養成。';

  @override
  String get routinePostureDescIn => '背打直、肩膀往後。每小時檢查一次。好體態 = 差約 1 in。';

  @override
  String get sciPostureCheckIn => '正確的體態能讓你看起來立刻高約 1 in，還能避免脊椎受壓';

  @override
  String get routineProteinDescLb => '蛋、雞肉、魚、乳製品。每天每 lb 體重至少 0.7 g 蛋白質。';

  @override
  String pwPersonalTitle(String height) {
    return '你達到 $height 的計畫準備好了';
  }

  @override
  String get pwPersonalEstimate => '依你的回答估算的潛力，不是保證';

  @override
  String pwPersonalReason(String reason) {
    return '你的理由：$reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return '在你 $time 就寢前提醒你放鬆';
  }

  @override
  String get obParentUnknown => '我不知道';

  @override
  String get obParentUnknownHint => '我們會改用成人平均身高。準確度較低，你隨時可以在個人檔案補上。';

  @override
  String get obEthnicityWhy => '只用來估算你不知道的父母身高。';

  @override
  String get resultNoParentNote => '缺少一位父母的身高，估算準確度較低。隨時可以在個人檔案補上。';

  @override
  String get resultNoParentsNote => '缺少父母的身高，估算準確度較低。隨時可以在個人檔案補上。';

  @override
  String get resultFootnoteEstimated => '依生長曲線資料和成人平均身高估算，不是醫療建議。';

  @override
  String get obBudgetChip => '合理價格';

  @override
  String get obBudgetTitle => 'BeTaller 的價格，讓每個想長高的青少年都負擔得起';

  @override
  String get obBudgetDesc => '你的身高不該取決於你有多少錢。所以我們依每個國家分別設定價格。';

  @override
  String obBudgetWeek(String price) {
    return '這裡的 Pro 一週：$price';
  }

  @override
  String get obBudgetLocalTitle => '依你的國家定價';

  @override
  String get obBudgetLocalDesc => '不是從美元換算：依你所在地的消費水準設定。';

  @override
  String get obBudgetWeekTitle => '從一週開始就好';

  @override
  String get obBudgetWeekDesc => '不用先付一大筆錢。隨時都能在 Apple ID 設定中取消。';

  @override
  String get obBudgetAllTitle => '一個方案包含所有功能';

  @override
  String get obBudgetAllDesc => '訓練、睡眠、營養、體態和進度報告。';

  @override
  String get obRateTitle => 'BeTaller 是為了真正幫助你而打造';

  @override
  String get obRateDesc => '如果你喜歡我們的用心和誠實，幫我們評分會讓我們非常開心。';

  @override
  String get obRateCta => '幫 BeTaller 評分';

  @override
  String get obRateLater => '以後再說';
}
