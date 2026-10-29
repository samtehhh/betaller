// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get navHome => 'ホーム';

  @override
  String get navAnalysis => '分析';

  @override
  String get navRoutines => 'プラン';

  @override
  String get disciplineTitle => '継続力';

  @override
  String get disciplineProgramTitle => '継続プログラム';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total日';
  }

  @override
  String get disciplineCompleteDay => '今日を完了する';

  @override
  String disciplineDayN(int n) {
    return '$n日目';
  }

  @override
  String get disciplineLevels => 'レベル';

  @override
  String get disciplineLevelDone => '達成';

  @override
  String get disciplineLocked => 'ロック中';

  @override
  String get disciplineTodayIs => '今日';

  @override
  String get disciplineToday => '今日';

  @override
  String get disciplineTodayPlan => '今日のプラン';

  @override
  String get disciplineWeek => '今週';

  @override
  String get disciplineMonth => '今月';

  @override
  String get disciplineLevel => '継続レベル';

  @override
  String disciplineStreakDays(int days) {
    return '$days日連続';
  }

  @override
  String disciplineToNext(int days) {
    return '次のレベルまであと$days日';
  }

  @override
  String get disciplineMaxTier => '最高レベルに到達';

  @override
  String get disciplineTierSpark => 'スパーク';

  @override
  String get disciplineTierSteady => 'ステディ';

  @override
  String get disciplineTierSharp => 'シャープ';

  @override
  String get disciplineTierSolid => 'ソリッド';

  @override
  String get disciplineTierRelentless => 'ノンストップ';

  @override
  String get disciplineTierUnbroken => 'アンブレイカブル';

  @override
  String get disciplineTierLegend => 'レジェンド';

  @override
  String get goalPerfectDays => 'プランを完了した日';

  @override
  String get goalWorkouts => 'トレーニング回数';

  @override
  String get goalMeasurement => '身長の測定';

  @override
  String get goalPhoto => '記録写真';

  @override
  String get goalPostureCheck => '姿勢チェック';

  @override
  String get disciplineAllDone => '今日は完了！';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total 完了';
  }

  @override
  String get navProgress => '記録';

  @override
  String get trackingSection => '記録ツール';

  @override
  String get photosBenefit => 'ビフォーとアフターを並べて比較。数字より、目で変化がわかります。';

  @override
  String get postureBenefit => '頭・肩・腰をチェック。姿勢を正すと、本来の身長が最大2〜3 cm高く見えます。';

  @override
  String get reportBenefit => '1週間を1日ずつ採点して、どこで崩れたかを確認しよう。';

  @override
  String get photosCta => '写真を追加';

  @override
  String get postureCta => '分析する';

  @override
  String get reportCta => 'レポートを開く';

  @override
  String get toolStateReady => '準備OK';

  @override
  String get photosSummaryEmpty => '最初の写真を追加しよう';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '写真 $count枚',
      one: '写真 $count枚',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'まだ分析していません';

  @override
  String postureSummaryScore(int score) {
    return '姿勢 $score/100';
  }

  @override
  String get navProfile => 'プロフィール';

  @override
  String greeting(String name) {
    return 'こんにちは、$nameさん';
  }

  @override
  String get currentHeight => '現在の身長';

  @override
  String get target => '目標';

  @override
  String completed(String pct) {
    return '$pct% 達成';
  }

  @override
  String remaining(String cm, String unit) {
    return 'あと +$cm $unit';
  }

  @override
  String get updateAnalysis => '分析を更新';

  @override
  String get analysisSubtitle => '過去の身長と習慣から予測します';

  @override
  String get dailyRoutines => '毎日のルーティン';

  @override
  String get allRoutinesDone => 'ルーティンをすべて完了！';

  @override
  String get water => '水分';

  @override
  String get sleep => '睡眠';

  @override
  String get growthSummary => '成長のまとめ';

  @override
  String get total => '合計';

  @override
  String get last => '前回';

  @override
  String get measurement => '測定';

  @override
  String get dailyTip => '今日のヒント';

  @override
  String get waterTracking => '水分の記録';

  @override
  String get waterGoalReached => '今日の目標を達成';

  @override
  String waterRemaining(String amount) {
    return 'あと$amount';
  }

  @override
  String get undo => '元に戻す';

  @override
  String waterToday(String amount) {
    return '今日：$amount L';
  }

  @override
  String get sleepTracking => '睡眠の記録';

  @override
  String sleepTarget(String hours) {
    return '目標：$hours時間';
  }

  @override
  String get hours => '時間';

  @override
  String get save => '保存';

  @override
  String get cancel => 'キャンセル';

  @override
  String get analysis => '分析';

  @override
  String get betallerScore => 'BeTallerスコア';

  @override
  String get genetic => '遺伝';

  @override
  String get growth => '成長';

  @override
  String get nutrition => '栄養';

  @override
  String get sleepLabel => '睡眠';

  @override
  String get discipline => '継続力';

  @override
  String get improveScore => 'スコアを上げよう';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => '栄養が不足しています！';

  @override
  String get nutritionStrengthen => '栄養を強化しよう';

  @override
  String get sleepRecordAdd => '睡眠を記録する';

  @override
  String get sleepPoor => '睡眠リズムが乱れています';

  @override
  String get sleepImprove => '睡眠を改善しよう';

  @override
  String get startToday => '今日から始めよう！';

  @override
  String routinesRemaining(int count) {
    return '残りのルーティン：$count';
  }

  @override
  String get keepStreak => '連続記録をキープ';

  @override
  String get addFirstMeasurement => '最初の測定を追加';

  @override
  String get addMeasurement => '測定を追加';

  @override
  String waterHalfNotReached(String amount) {
    return '今日はまだ水分目標の半分に届いていません。あと${amount}L飲みましょう。';
  }

  @override
  String waterAlmostDone(String amount) {
    return '水分目標まであと${amount}L。もう少し！';
  }

  @override
  String bmiLow(String bmi) {
    return 'BMIは$bmiで、やや低めです。たんぱく質とカロリーを増やしましょう。';
  }

  @override
  String get bodyFactsTitle => 'あなたの体';

  @override
  String get dailyNeedsTitle => '1日の目標';

  @override
  String bmiHigh(String bmi) {
    return 'BMIは$bmiで、やや高めです。バランスのよい食事を心がけましょう。';
  }

  @override
  String get nutritionDefault => '水分目標を達成し、バランスのよい食事を続けましょう。';

  @override
  String sleepNoRecord(String hours) {
    return '今日の睡眠記録がありません。$hours時間を目指して記録しましょう。';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return '今日の睡眠は$current時間で、$missing時間足りません。早めに寝ましょう！';
  }

  @override
  String sleepAlmost(String hours) {
    return 'あと少し。$hours時間眠ると成長ホルモンを最大限に活かせます。';
  }

  @override
  String get sleepGood => '睡眠リズムはばっちり！この調子で。';

  @override
  String noRoutinesDone(int total) {
    return '今日はまだルーティンを完了していません。$total個のうち1つから始めよう！';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '今日は$done/$total個のルーティンを完了。あと$left個！';
  }

  @override
  String streakBuilding(int needed) {
    return '今日もよくできました！あと$needed日で連続記録がスタートします。';
  }

  @override
  String streakContinue(int days) {
    return '$days日連続！続けるほどスコアが上がります。';
  }

  @override
  String get noMeasurements => 'まだ身長の測定がありません。正確な予測のために最初の測定を追加しましょう。';

  @override
  String fewMeasurements(int count) {
    return '成長スピードを計算するには、あと$count回の測定が必要です。';
  }

  @override
  String goodMeasurements(int count) {
    return '測定は$count回です。5回になると精度が大きく上がります。';
  }

  @override
  String get keepMeasuring => '測定を続けましょう。データが増えるほど予測が正確になります。';

  @override
  String get heightPrediction => '身長予測';

  @override
  String get predictedHeightAt21 => '21歳時の予測身長';

  @override
  String get predictionMethod => '遺伝（両親の身長）、成長スピード、BMI、年齢のデータを組み合わせて計算しています。';

  @override
  String get growthStatus => '成長の状況';

  @override
  String get growthRemaining => 'これからの伸びしろ';

  @override
  String get growthBreakdown => 'その伸びしろの内訳';

  @override
  String get geneticGainLabel => '遺伝による伸び';

  @override
  String get lifestyleLabel => '生活習慣';

  @override
  String get geneticCeilingLabel => '上限';

  @override
  String get reachableTargetHeight => '目指せる目標身長';

  @override
  String get geneticCeilingProgress => '遺伝的な上限までの進み具合';

  @override
  String get completionLabel => '達成度';

  @override
  String get growthVelocity => '成長スピード';

  @override
  String get noData => 'データなし';

  @override
  String growthRate(String rating) {
    return '成長ペース：$rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'カロリー';

  @override
  String get kcalDay => 'kcal/日';

  @override
  String get daily => '1日';

  @override
  String get protein => 'たんぱく質';

  @override
  String get minimum => '最低';

  @override
  String get age => '年齢';

  @override
  String get male => '男性';

  @override
  String get female => '女性';

  @override
  String get yearlyPrediction => '年ごとの予測';

  @override
  String ageYear(int age) {
    return '$age歳';
  }

  @override
  String get progressTitle => '成長の記録';

  @override
  String get totalGrowth => '合計';

  @override
  String get lastDiff => '前回との差';

  @override
  String get measurementCount => '測定';

  @override
  String get heightChart => '身長グラフ';

  @override
  String get chartMinData => 'グラフには2回以上の測定が必要です';

  @override
  String get chartInstruction => '測定を追加して成長グラフを見よう！';

  @override
  String get addMeasurementButton => '新しい測定を追加';

  @override
  String get measurementHistory => '測定履歴';

  @override
  String get deleteTitle => '測定を削除';

  @override
  String get deleteMessage => 'この測定を削除してもよろしいですか？';

  @override
  String get dismiss => 'キャンセル';

  @override
  String get delete => '削除';

  @override
  String get newMeasurement => '新しい身長測定';

  @override
  String get routines => 'ルーティン';

  @override
  String streakDays(int days) {
    return '$days日';
  }

  @override
  String get progressStatus => '進み具合';

  @override
  String get completedLabel => '完了！';

  @override
  String get all => 'すべて';

  @override
  String get exercise => '運動';

  @override
  String get posture => '姿勢';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
      one: '$days日',
    );
    return '最高：$_temp0';
  }

  @override
  String get editProfile => 'プロフィールを編集';

  @override
  String get editProfileSubtitle => '身長・体重・年齢を更新';

  @override
  String get name => '名前';

  @override
  String birthDate(String date) {
    return '生年月日：$date';
  }

  @override
  String get heightCm => '身長 (cm)';

  @override
  String get weightKg => '体重 (kg)';

  @override
  String get fatherHeight => '父親の身長 (cm)';

  @override
  String get motherHeight => '母親の身長 (cm)';

  @override
  String get notifications => '通知';

  @override
  String get reminderNextLabel => '次のリマインダー';

  @override
  String get reminderManageHint => 'リマインダーを管理';

  @override
  String get reminderOffCta => '通知をオンにする';

  @override
  String get stateOn => 'オン';

  @override
  String get stateOff => 'オフ';

  @override
  String get reminderMasterTitle => '通知';

  @override
  String reminderActiveCount(int count) {
    return '$count件のリマインダーがオン';
  }

  @override
  String get reminderBuiltIn => '標準のリマインダー';

  @override
  String get reminderYourOwn => '自分のリマインダー';

  @override
  String get reminderAdd => 'リマインダーを追加';

  @override
  String get reminderDays => '曜日';

  @override
  String get reminderEveryDay => '毎日';

  @override
  String get reminderLabelHint => '何をお知らせしますか？';

  @override
  String get reminderEmptyHint => 'トレーニング、ビタミン、ストレッチなど、必要なものを自由に追加しよう。';

  @override
  String get reminderCustom => 'リマインダー';

  @override
  String get reminderCustomBody => '設定した時間になりました。';

  @override
  String get reminderExercise => '運動';

  @override
  String get reminderNutrition => '栄養';

  @override
  String get reminderWater => '水分';

  @override
  String get reminderPosture => '姿勢';

  @override
  String get reminderRoutine => '毎日のルーティン';

  @override
  String get reminderSleep => '睡眠';

  @override
  String get reminderMeasurement => '身長の測定';

  @override
  String get notificationsOn => 'リマインダー：オン';

  @override
  String get notificationsOff => 'リマインダー：オフ';

  @override
  String get premium => 'プレミアムにアップグレード';

  @override
  String get premiumSubtitle => 'すべての機能を解放';

  @override
  String get rateUs => '評価する';

  @override
  String get rateSubtitle => '気に入ったら星5つで応援してください！';

  @override
  String get share => 'アプリをシェア';

  @override
  String get shareSubtitle => '友だちにBeTallerを紹介しよう';

  @override
  String get shareText =>
      'BeTallerで自分の成長の可能性がわかった！あなたも試してみて：https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'フィードバックを送る';

  @override
  String get feedbackSubtitle => 'お問い合わせ';

  @override
  String get resetData => 'すべてのデータをリセット';

  @override
  String get resetSubtitle => 'すべてのデータが削除されます';

  @override
  String get resetTitle => 'データをリセット';

  @override
  String get resetMessage => 'すべてのデータが削除され、初期設定画面に戻ります。この操作は取り消せません！';

  @override
  String get reset => 'リセット';

  @override
  String get premiumSoon => 'プレミアムは近日公開！';

  @override
  String get brandingSubtitle => 'あなたの成長の可能性を見つけよう';

  @override
  String get statistics => '統計';

  @override
  String get profileGroupSupport => 'サポート';

  @override
  String get profileGroupAccount => 'アカウント';

  @override
  String get profileGroupApp => 'アプリ';

  @override
  String get profileGroupDanger => '危険な操作';

  @override
  String profileMemberSince(String date) {
    return '$dateから';
  }

  @override
  String get profileYourJourney => 'あなたの歩み';

  @override
  String get profileTotalGrowth => '合計';

  @override
  String get currentStreak => '現在の連続記録';

  @override
  String get bestStreakLabel => '最高連続記録';

  @override
  String get achievementLabel => '実績';

  @override
  String get achievements => '実績';

  @override
  String get achievementUnlockedTitle => '🏆 実績を解除！';

  @override
  String get reminderTapHint => 'タップして時間と曜日を変更';

  @override
  String get earned => '獲得！';

  @override
  String get notEarned => '未獲得';

  @override
  String get ok => 'OK';

  @override
  String get language => '言語';

  @override
  String get languageSubtitle => 'アプリの言語を変更';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'あなたの成長の可能性を見つけよう';

  @override
  String get onboardingMeetYou => 'あなたのことを教えてください';

  @override
  String get onboardingInfoNeeded => '分析に必要な基本情報です。';

  @override
  String get gender => '性別';

  @override
  String get birthDateLabel => '生年月日';

  @override
  String get bodyMeasurements => '体のサイズ';

  @override
  String get bodyInfo => '分析には現在の身長と体重が必要です。';

  @override
  String get geneticData => '遺伝データ';

  @override
  String get geneticInfo => '両親の身長から遺伝的なポテンシャルを算出します。';

  @override
  String get pastHeights => '過去の身長';

  @override
  String get pastHeightsInfo => '覚えている年齢ごとの身長を入力してください。空欄のままでもOKです。';

  @override
  String get heightHint => '身長を入力...';

  @override
  String get ageLabel => '歳';

  @override
  String get habits => 'あなたの習慣';

  @override
  String get habitsInfo => '生活習慣は予測に直接影響します。';

  @override
  String get weeklyExercise => '週の運動量';

  @override
  String get dailySleep => '1日の睡眠';

  @override
  String get nutritionQuality => '食事の質';

  @override
  String get nutritionDesc => 'たんぱく質、乳製品、野菜、果物の摂取';

  @override
  String get nutritionBad => '悪い';

  @override
  String get nutritionPoor => '不十分';

  @override
  String get nutritionMedium => 'ふつう';

  @override
  String get nutritionGood => '良い';

  @override
  String get nutritionGreat => 'とても良い';

  @override
  String get startAnalysis => '分析を始める';

  @override
  String get continueBtn => '次へ';

  @override
  String get analyzeBtn => '分析する';

  @override
  String get analyzing => '分析中';

  @override
  String get analysisComplete => '完了！';

  @override
  String get analysisDataReceivedTitle => 'データを受け取りました';

  @override
  String get analysisDataReceivedSubtitle => '分析を開始しています...';

  @override
  String get yourScore => 'あなたのBeTallerスコア';

  @override
  String get letsStart => '始めよう';

  @override
  String get splashJourneySubtitle => 'あなたの挑戦が始まります。🚀';

  @override
  String get splashPlanSubtitle => 'あなた専用のプランができました。\n身長のポテンシャルを見てみませんか？';

  @override
  String get doneBtn => '完了';

  @override
  String get analysisStep1 => '遺伝データを分析中...';

  @override
  String get analysisStep2 => '成長スピードを計算中...';

  @override
  String get analysisStep3 => '栄養と睡眠のデータを処理中...';

  @override
  String get analysisStep4 => '身長予測を作成中...';

  @override
  String get analysisStep5 => 'BeTallerスコアを計算中...';

  @override
  String growthPotential(String cm, String unit) {
    return '+$cm $unit の成長ポテンシャル';
  }

  @override
  String get heightAt21 => '21歳時';

  @override
  String confidenceLevel(String pct) {
    return '信頼度 $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return '$min〜$max $unit の範囲';
  }

  @override
  String get currentLabel => '現在';

  @override
  String get predictedLabel => '予測';

  @override
  String get yearlyPredictions => '年ごとの予測';

  @override
  String get tipMorningMeasure =>
      '身長は朝に測りましょう。日中は椎間板に圧力がかかって少し縮むため、朝の測定がいちばん正確です。';

  @override
  String get tipProteinSpread => 'たんぱく質は一度にまとめて摂らず、毎食に分けて摂りましょう。';

  @override
  String get tipGrowthHormone => '成長ホルモンは睡眠中に最も多く分泌されます。22時〜2時には眠っていましょう！';

  @override
  String get tipVitaminD => '毎日15分日光を浴びると、ビタミンDの生成が増えます。ビタミンDはカルシウムの吸収に欠かせません。';

  @override
  String get tipBarHanging => 'ぶら下がりは背骨への圧迫をやわらげます。1日30秒×3回から試してみよう。';

  @override
  String get tipSwimming => '水泳は全身運動になり、成長をサポートするのに最適なスポーツです。';

  @override
  String get tipStress => 'ストレスは成長ホルモンの分泌を抑えます。瞑想やヨガでストレスを減らしましょう。';

  @override
  String get routineMorningStretch => '朝のストレッチ';

  @override
  String get routineMorningStretchDesc => '起きてすぐ10分ストレッチ。背骨と脚の筋肉を伸ばしましょう。';

  @override
  String get routineBarHanging => 'ぶら下がり';

  @override
  String get routineBarHangingDesc => '鉄棒にぶら下がって背骨を伸ばします。30秒×3セット。';

  @override
  String get routineCobraStretch => 'コブラのポーズ';

  @override
  String get routineCobraStretchDesc => 'うつ伏せになり上半身を持ち上げ、背骨を伸ばします。15秒×3セット。';

  @override
  String get routineJumping => 'ジャンプ運動';

  @override
  String get routineJumpingDesc => '縄跳びやスクワットジャンプ。成長板を刺激します。20回×3セット。';

  @override
  String get routineSwimming => '水泳またはバスケ';

  @override
  String get routineSwimmingDesc => '成長をサポートするスポーツを最低30分行いましょう。';

  @override
  String get routineYoga => '夜のヨガ＆ストレッチ';

  @override
  String get routineYogaDesc => '寝る前のヨガとストレッチで、ストレスを解消し筋肉をほぐしましょう。';

  @override
  String get routineProtein => 'たんぱく質の摂取';

  @override
  String get routineProteinDesc => '卵、鶏肉、魚、乳製品。1日に体重1kgあたり1.5g以上のたんぱく質を。';

  @override
  String get routineCalcium => 'カルシウム＆ビタミンD';

  @override
  String get routineCalciumDesc => '牛乳、チーズ、ヨーグルトを摂り、15分日光を浴びましょう。骨の発達に欠かせません。';

  @override
  String get routineWater => '水分摂取の目標';

  @override
  String get routineWaterDesc => '1日2〜3リットル以上の水を飲みましょう。代謝と成長に欠かせません。';

  @override
  String get routineAvoidJunk => 'ジャンクフードを控える';

  @override
  String get routineAvoidJunkDesc => 'ファストフード、甘い飲み物、加工食品は控えましょう。';

  @override
  String get routineSleep => '質のよい睡眠（8〜10時間）';

  @override
  String get routineSleepDesc => '成長ホルモンは睡眠中に分泌されます。22時〜6時がゴールデンタイムです。';

  @override
  String get routineNoScreen => '寝る前のスマホ断ち';

  @override
  String get routineNoScreenDesc => '寝る1時間前にはスマホやパソコンを置きましょう。メラトニンの分泌を妨げないために。';

  @override
  String get routinePosture => '姿勢チェック';

  @override
  String get routinePostureDesc =>
      '背すじを伸ばし、肩を後ろに。1時間ごとにチェック。よい姿勢で2〜3 cmの差が出ます。';

  @override
  String get routineWallStand => '壁立ちエクササイズ';

  @override
  String get routineWallStandDesc => '壁に背をつけ、かかと・お尻・肩・頭を壁につけて5分キープ。';

  @override
  String get routineSprintIntervals => 'スプリントインターバル';

  @override
  String get routineSprintIntervalsDesc =>
      '短い全力ダッシュを繰り返すことで、成長ホルモンの分泌を大きく促します。';

  @override
  String get routineHiitWorkout => 'HIITトレーニング';

  @override
  String get routineHiitWorkoutDesc => '高強度インターバルトレーニングで成長ホルモンの分泌を最大化します。';

  @override
  String get routineSquats => '自重スクワット';

  @override
  String get routineSquatsDesc => '自重スクワットは脚と背骨の成長板を刺激します。';

  @override
  String get routineDeadliftStretch => 'デッドリフトストレッチ';

  @override
  String get routineDeadliftStretchDesc => '背骨の圧迫をやわらげ、椎間板の健康を保つストレッチです。';

  @override
  String get routineOverheadPress => 'オーバーヘッドプレス';

  @override
  String get routineOverheadPressDesc => '頭上に押し上げる動きで背骨を伸ばし、姿勢を支える筋肉を鍛えます。';

  @override
  String get routineSkippingRope => '縄跳び';

  @override
  String get routineSkippingRopeDesc => '縄跳びの繰り返しのジャンプが、脚の成長板を刺激します。';

  @override
  String get routinePilatesCore => 'ピラティス体幹';

  @override
  String get routinePilatesCoreDesc => 'ピラティスの体幹運動で背骨の並びと姿勢をサポートします。';

  @override
  String get routineInversionHang => '逆さぶら下がり';

  @override
  String get routineInversionHangDesc =>
      '逆さになると椎間板の圧迫がやわらぎ、一時的に1〜2cm伸びることがあります。';

  @override
  String get routineZincIntake => '亜鉛を含む食品';

  @override
  String get routineZincIntakeDesc => '成長ホルモンの生成のため、1日を通して亜鉛を含む食品を摂りましょう。';

  @override
  String get routineVitaminDSunlight => 'ビタミンD＆日光';

  @override
  String get routineVitaminDSunlightDesc =>
      'ビタミンDの合成と骨の成長のため、15分以上直射日光を浴びましょう。';

  @override
  String get routineArginineFoods => 'アルギニンを含む食品';

  @override
  String get routineArginineFoodsDesc => 'アルギニンを含む食品を食べて、成長ホルモンの分泌を促しましょう。';

  @override
  String get routineDailyCalories => '1日のカロリー目標';

  @override
  String get routineDailyCaloriesDesc => '1日のカロリー目標を達成しましょう。食べなさすぎは成長を遅らせます。';

  @override
  String get routineSleepEnvironment => '睡眠環境を整える';

  @override
  String get routineSleepEnvironmentDesc =>
      '暗くて涼しい寝室にして、メラトニンと成長ホルモンの分泌を最大化しましょう。';

  @override
  String get routinePreSleepRoutine => '寝る前のリラックス';

  @override
  String get routinePreSleepRoutineDesc => '毎晩同じ入眠ルーティンを続けると、深い睡眠の質が23%向上します。';

  @override
  String get routineNeckStretches => '首のストレッチ';

  @override
  String get routineNeckStretchesDesc => '首のストレッチで圧迫をやわらげ、首の骨の並びを整えます。';

  @override
  String get routineShoulderRolls => '肩回し＆肩ひらき';

  @override
  String get routineShoulderRollsDesc => '肩をひらくと前かがみの姿勢が整い、見た目で1〜2cm高く見えることも。';

  @override
  String get achieveCommitment => '本気宣言';

  @override
  String get achieveCommitmentDesc => 'データをすべて入力し、アプリを一通り見て、使い始めよう';

  @override
  String get achieveFirstDay => '最初の一歩';

  @override
  String get achieveFirstDayDesc => '最初の1日を完了する';

  @override
  String get achieveThreeStreak => '3日連続';

  @override
  String get achieveThreeStreakDesc => '3日連続でルーティンを完了する';

  @override
  String get achieveWeekStreak => '7日連続';

  @override
  String get achieveWeekStreakDesc => '7日連続でルーティンを完了する';

  @override
  String get achieveTwoWeekStreak => '14日連続';

  @override
  String get achieveTwoWeekStreakDesc => '14日間続ける';

  @override
  String get achieveMonthStreak => '30日連続';

  @override
  String get achieveMonthStreakDesc => '30日連続で完了する';

  @override
  String get achieveTwoMonthStreak => '60日連続';

  @override
  String get achieveTwoMonthStreakDesc => '60日連続で完了する';

  @override
  String get achieveHundredStreak => '100日連続';

  @override
  String get achieveHundredStreakDesc => '100日連続で完了する';

  @override
  String get achieveFirstMeasure => '初めての測定';

  @override
  String get achieveFirstMeasureDesc => '初めて身長を記録する';

  @override
  String get achieveThreeMeasures => 'トラッカー';

  @override
  String get achieveThreeMeasuresDesc => '身長を3回記録する';

  @override
  String get achieveFiveMeasures => '定期チェック';

  @override
  String get achieveFiveMeasuresDesc => '身長を5回記録する';

  @override
  String get achieveTenMeasures => 'データハンター';

  @override
  String get achieveTenMeasuresDesc => '身長を10回記録する';

  @override
  String get achieveFirstCm => '最初の1センチ';

  @override
  String get achieveFirstCmDesc => '合計1 cmの伸びを記録する';

  @override
  String get achieveThreeCm => '3 cm成長';

  @override
  String get achieveThreeCmDesc => '合計3 cmの伸びを記録する';

  @override
  String get achieveFiveCm => '5 cm成長';

  @override
  String get achieveFiveCmDesc => '合計5 cmの伸びを記録する';

  @override
  String get achieveTenCm => '10 cm成長';

  @override
  String get achieveTenCmDesc => '合計10 cmの伸びを記録する';

  @override
  String get quote1 => '毎日、昨日の自分を超えよう。';

  @override
  String get quote2 => '成長は一晩では起きない。でも毎晩、少しずつ近づいている。';

  @override
  String get quote3 => '成長には根気が必要。続けよう！';

  @override
  String get quote4 => '今日の一歩が、明日の土台になる。';

  @override
  String get quote5 => 'やる気が尽きたところから、継続力が始まる。';

  @override
  String get quote6 => '体はきっと応えてくれる。続けよう！';

  @override
  String get quote7 => '可能性の限界を決めるのは、自分自身。';

  @override
  String get quote8 => '小さな一歩が、大きな変化を生む。';

  @override
  String get quote9 => '最高の投資は、自分への投資。';

  @override
  String get quote10 => '毎日、目標に少しずつ近づいている。';

  @override
  String get quote11 => '変わるのは大変。でも後悔はもっとつらい。';

  @override
  String get quote12 => '体は一生の宝物。大切にしよう。';

  @override
  String get quote13 => 'ライバルは昨日の自分。今日、超えよう！';

  @override
  String get quote14 => 'BeTaller = 根気 + 継続 + 自信';

  @override
  String get quote15 => '自分を信じよう。積み重ねがあなたを変える。';

  @override
  String get quote16 => '今日「無理」と言わなければ、明日後悔しない。';

  @override
  String get quote17 => 'たった1%でも、毎日前進しよう。';

  @override
  String get quote18 => '鏡が変化を見せてくれる。焦らずに。';

  @override
  String get bmiNormal => '標準';

  @override
  String get bmiUnderweight => '低体重';

  @override
  String get bmiOverweight => '過体重';

  @override
  String get bmiObese => '肥満';

  @override
  String get velocityExcellent => 'とても速い';

  @override
  String get velocityNormal => '標準';

  @override
  String get velocitySlow => 'ゆっくり';

  @override
  String get velocityVeryLow => 'とても遅い';

  @override
  String durationMinutes(String min) {
    return '$min分';
  }

  @override
  String get durationAllDay => '終日';

  @override
  String get durationNight => '夜';

  @override
  String durationHours(String hours) {
    return '$hours時間';
  }

  @override
  String get onboardingStep1 => '基本情報を入力';

  @override
  String get onboardingStep2 => '過去の身長を入力';

  @override
  String get onboardingStep3 => '習慣をチェック';

  @override
  String get onboardingStep4 => '予測とスコアを確認';

  @override
  String get hoursShort => '時間';

  @override
  String get selectLanguage => '言語を選択';

  @override
  String get systemLanguage => '端末の言語';

  @override
  String get emailSubject => 'BeTallerへのフィードバック';

  @override
  String get pastHeightsTip => 'わからない年齢は空欄でOK。過去の身長を1〜2個入力すれば十分です。';

  @override
  String get obPastHeightsTitle => '過去の身長';

  @override
  String get obPastHeightsSubPart1 => '過去の身長があると、予測がより正確になります。';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return '$age歳のとき、身長はどれくらいでしたか？';
  }

  @override
  String get obSkip => 'スキップ';

  @override
  String get obNext => '次へ';

  @override
  String get obSkipAll => 'すべてスキップ';

  @override
  String get currentSuffix => '（現在）';

  @override
  String personalizedProtein(String amount) {
    return '卵、鶏肉、魚、乳製品。1日に${amount}g以上のたんぱく質を摂りましょう。';
  }

  @override
  String personalizedWater(String amount) {
    return '1日に${amount}L以上の水を飲みましょう。代謝と成長に欠かせません。';
  }

  @override
  String personalizedSleep(String hours) {
    return '成長ホルモンは睡眠中に分泌されます。$hours時間以上眠りましょう。22時〜6時がゴールデンタイム。';
  }

  @override
  String personalizedCalcium(String calories) {
    return '牛乳、チーズ、ヨーグルトを摂り、15分日光を浴びましょう。1日のカロリー目標：$calories kcal。';
  }

  @override
  String get scoreS => 'すばらしい！ポテンシャルの頂点に近づいています。';

  @override
  String get scoreA => 'とても順調！少しの工夫でトップを狙えます。';

  @override
  String get scoreB => 'いい調子です。ルーティンと栄養にもう少し集中しよう。';

  @override
  String get scoreC => 'まだ伸びしろがあります。ルーティンを続ければ差が出ます。';

  @override
  String get scoreD => 'ポテンシャルは高いので、行動を始めましょう。';

  @override
  String get scoreF => '今すぐ始めよう！毎日の小さな一歩が大きな差になります。';

  @override
  String get cmPerYear => 'cm/年';

  @override
  String get howToDoIt => 'やり方';

  @override
  String get musclesTargeted => '鍛える筋肉と骨';

  @override
  String get scientificBasis => '科学的根拠';

  @override
  String setXofY(String current, String total) {
    return 'セット $current/$total';
  }

  @override
  String restBeforeSet(String set) {
    return 'セット$setの前に休憩';
  }

  @override
  String get allSetsComplete => '全セット完了！';

  @override
  String get setTimer => 'セットタイマー';

  @override
  String get setTracker => 'セット記録';

  @override
  String get builtInTimer => '内蔵タイマー';

  @override
  String get markComplete => '完了にする';

  @override
  String get markIncomplete => '未完了に戻す';

  @override
  String get done => '完了';

  @override
  String get doneExclamation => '完了！';

  @override
  String get start => 'スタート';

  @override
  String get pause => '一時停止';

  @override
  String get resetTimer => 'リセット';

  @override
  String get skipRest => '休憩をスキップ';

  @override
  String get restart => 'やり直す';

  @override
  String get perSet => '1セットあたり';

  @override
  String get rest => '休憩';

  @override
  String get reps => '回';

  @override
  String get difficultyBeginner => '初級';

  @override
  String get difficultyIntermediate => '中級';

  @override
  String get difficultyAdvanced => '上級';

  @override
  String get learnTitle => '学ぶ';

  @override
  String get learnSubtitle => '成長のための科学的な知識';

  @override
  String get categoryAll => 'すべて';

  @override
  String get categoryScience => '科学';

  @override
  String get categoryNutrition => '栄養';

  @override
  String get categoryExercise => '運動';

  @override
  String get categorySleep => '睡眠';

  @override
  String get categoryMyths => 'よくある誤解';

  @override
  String get scientificReferences => '参考文献';

  @override
  String get relatedRoutines => '関連するルーティン';

  @override
  String get nutritionTitle => '栄養';

  @override
  String get sectionMealPlan => '食事プラン';

  @override
  String get sectionNutrients => '栄養素';

  @override
  String get sectionFoods => '食品';

  @override
  String get sectionSupplements => 'サプリメント';

  @override
  String todaysPlan(String day) {
    return '今日のプラン — $day';
  }

  @override
  String get breakfast => '朝食';

  @override
  String get lunch => '昼食';

  @override
  String get dinner => '夕食';

  @override
  String get snacks => '間食';

  @override
  String get searchFoods => '食品を検索...';

  @override
  String nFoods(String count) {
    return '$count品目';
  }

  @override
  String dailyLabel(String amount) {
    return '1日：$amount';
  }

  @override
  String get dailyNeedByAge => '年齢別の1日の必要量';

  @override
  String agePrefix(String range) {
    return '$range歳';
  }

  @override
  String get topFoodSources => 'おもな食品';

  @override
  String get categoryDairy => '乳製品';

  @override
  String get categoryMeatFish => '肉・魚';

  @override
  String get categoryVegetables => '野菜';

  @override
  String get categoryFruits => '果物';

  @override
  String get categoryGrains => '穀物・豆類';

  @override
  String get categoryNutsSeeds => 'ナッツ・種子';

  @override
  String get weeklyReportTitle => '週間レポート';

  @override
  String get weeklyScoreLabel => '今週のスコア';

  @override
  String get weeklyDailyCompletion => '1日ごと';

  @override
  String get weeklyHabits => '習慣';

  @override
  String get overview => '概要';

  @override
  String get routinesLabel => 'ルーティン';

  @override
  String get streakLabel => '連続記録';

  @override
  String get heightLabel => '身長';

  @override
  String get weightLabel => '体重';

  @override
  String get dadLabel => '父';

  @override
  String get motherLabel => '母';

  @override
  String get metricShort => 'メートル法';

  @override
  String get imperialShort => 'ヤード・ポンド法';

  @override
  String get dailyScores => '毎日のスコア';

  @override
  String get waterToday2 => '今日の水分';

  @override
  String get sleepToday => '今日の睡眠';

  @override
  String get routineCompletion => 'ルーティン達成度';

  @override
  String get xpAndLevel => 'XPとレベル';

  @override
  String xpToNextLevel(String xp) {
    return '次のレベルまで$xp XP';
  }

  @override
  String get activeChallenges => '進行中のチャレンジ';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m 完了';
  }

  @override
  String get shareYourProgress => '成長をシェアしよう';

  @override
  String get shareComingSoon => 'シェア機能は近日公開！';

  @override
  String get premiumTest => 'プレミアム（テスト）';

  @override
  String get premiumActive => '有効';

  @override
  String get premiumFree => '無料';

  @override
  String get weeklyReportMenu => '週間レポート';

  @override
  String get weeklyReportMenuSubtitle => '成長のまとめ';

  @override
  String get unlockGrowthPotential => '成長の可能性を最大限に引き出そう';

  @override
  String get featureGrowthAnalysis => '成長分析とスコア';

  @override
  String get featureHeightPrediction => '身長予測と見通し';

  @override
  String get featureAllRoutines => '14種類すべての毎日のルーティン';

  @override
  String get featureWaterSleep => '水分と睡眠の記録';

  @override
  String get featureProgress => '成長の記録と測定';

  @override
  String get featureAchievements => '実績と連続記録';

  @override
  String get planMonthly => '月額';

  @override
  String get planYearly => '年額';

  @override
  String get bestValue => 'いちばんお得';

  @override
  String get premiumLabel => 'プレミアム';

  @override
  String lvl(String level) {
    return 'LV $level';
  }

  @override
  String get levelBeginner => 'ビギナー';

  @override
  String get levelStarter => 'スターター';

  @override
  String get levelCommitted => '本気';

  @override
  String get levelDedicated => 'ひたむき';

  @override
  String get levelConsistent => '安定';

  @override
  String get levelFocused => '集中';

  @override
  String get levelDetermined => '不屈';

  @override
  String get levelDisciplined => '鍛錬';

  @override
  String get levelStrong => 'ストロング';

  @override
  String get levelAdvanced => '上級者';

  @override
  String get levelExpert => 'エキスパート';

  @override
  String get levelMaster => 'マスター';

  @override
  String get levelElite => 'エリート';

  @override
  String get levelChampion => 'チャンピオン';

  @override
  String get levelLegend => 'レジェンド';

  @override
  String get levelTitan => 'タイタン';

  @override
  String get levelMythic => '神話級';

  @override
  String get levelImmortal => '不滅';

  @override
  String get levelTranscendent => '超越';

  @override
  String get levelUltimate => 'アルティメット';

  @override
  String get challengeCompleteAllRoutines => '全ルーティン完了';

  @override
  String get challengeCompleteAllRoutinesDesc => '今日のルーティンをすべて終える';

  @override
  String get challengeHydrationHero => '水分補給ヒーロー';

  @override
  String get challengeHydrationHeroDesc => '1日の水分目標を達成する';

  @override
  String get challengeEarlySleeper => '早寝さん';

  @override
  String get challengeEarlySleeperDesc => '8時間以上の睡眠を記録する';

  @override
  String get challengeExerciseTrio => '運動トリオ';

  @override
  String get challengeExerciseTrioDesc => '運動ルーティンを3つ完了する';

  @override
  String get challengeMorningStretch => '朝ストレッチ';

  @override
  String get challengeMorningStretchDesc => '朝9時までにストレッチをする';

  @override
  String get challenge7DayWarrior => '7日間ウォリアー';

  @override
  String get challenge7DayWarriorDesc => '7日連続で全ルーティンを完了する';

  @override
  String get challengeGrowthTracker => '成長トラッカー';

  @override
  String get challengeGrowthTrackerDesc => '今週、身長を1回記録する';

  @override
  String get challengeHydrationWeek => '水分補給ウィーク';

  @override
  String get challengeHydrationWeekDesc => '今週5日、水分目標を達成する';

  @override
  String get challengeFitnessChampion => 'フィットネス王者';

  @override
  String get challengeFitnessChampionDesc => '今週、運動ルーティンを15回完了する';

  @override
  String get challengeSleepMaster => '睡眠マスター';

  @override
  String get challengeSleepMasterDesc => '5日間、8時間以上の睡眠を記録する';

  @override
  String get performanceDashboard => 'パフォーマンス';

  @override
  String get tierA => 'ランクA';

  @override
  String get tierB => 'ランクB';

  @override
  String get tierC => 'ランクC';

  @override
  String get tierD => 'ランクD';

  @override
  String get tierE => 'ランクE';

  @override
  String get maxTierReached => '最高ランクに到達';

  @override
  String nextTierHint(String tier, String pts) {
    return '次のランク：$tier・あと+${pts}pt';
  }

  @override
  String get premiumBadge => 'プレミアム';

  @override
  String get manageRoutines => 'ルーティンを管理';

  @override
  String get manageRoutinesSubtitle => '毎日のリストに表示するルーティンを選ぶ';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$total個中$visible個が有効';
  }

  @override
  String get showAll => 'すべて表示';

  @override
  String get hideAll => 'すべて非表示';

  @override
  String get heightAnalysis => '身長分析';

  @override
  String get heightVsPopulation => 'CDC成長曲線でのあなたの位置';

  @override
  String get globalAveragesTable => '年齢別の平均身長（CDC）';

  @override
  String get standingTall => '高め';

  @override
  String get standingAboveAverage => '平均より上';

  @override
  String get standingBelowAverage => '平均より下';

  @override
  String get standingShort => '同年代より低め';

  @override
  String get yourHeightStanding => 'あなたの身長の位置';

  @override
  String get bellCurveCaption => '同じ年齢の身長の分布';

  @override
  String get bellShorterThanYou => 'があなたより低い';

  @override
  String get yourHeight => 'あなた';

  @override
  String peerAvg(int age) {
    return '$age歳の平均';
  }

  @override
  String get aboveAvg => '平均以上';

  @override
  String get belowAvg => '平均以下';

  @override
  String get whoDataSource => '米国CDC成長曲線';

  @override
  String get percentileShort5 => '5%';

  @override
  String get percentileShort50 => '50%';

  @override
  String get percentileShort95 => '95%';

  @override
  String get youLabel => 'あなた';

  @override
  String get avgHeightLabel => '平均';

  @override
  String get percentileLabel => '百分位';

  @override
  String get diffLabel => '差';

  @override
  String get whoSourceNote =>
      'データ出典：米国CDC 2000年成長曲線（年齢別身長、2〜20歳）。百分位は米国の人口との比較で、国によって異なる場合があります。';

  @override
  String get quickPhotos => '写真';

  @override
  String get quickPosture => '姿勢';

  @override
  String get quickWellness => '体調';

  @override
  String get quickRecipes => 'レシピ';

  @override
  String get wellnessTitle => '体調トラッカー';

  @override
  String get wellnessHeader => '体調';

  @override
  String get wellnessSubtitle => '成長に影響する要素を記録しよう';

  @override
  String get caffeineToday => '今日のカフェイン';

  @override
  String get withinLimits => '適量の範囲内';

  @override
  String get approachingLimit => '上限に近づいています';

  @override
  String get overLimit => '上限オーバー、成長ホルモンに影響';

  @override
  String get resetToday => '今日をリセット';

  @override
  String get stressToday => '今日のストレス';

  @override
  String get stressVeryCalmLabel => 'とても穏やか、成長に最適';

  @override
  String get stressCalmLabel => '穏やか';

  @override
  String get stressNeutralLabel => 'ふつう';

  @override
  String get stressStressedLabel => 'ストレスあり';

  @override
  String get stressVeryStressedLabel => '強いストレス、コルチゾールが成長ホルモンを妨げます';

  @override
  String get stressTapToLog => 'タップして今日の気分を記録';

  @override
  String get todaysJournal => '今日の日記';

  @override
  String get journalNoNote => '（メモなし）';

  @override
  String get journalEdit => '編集';

  @override
  String get journalHowWasToday => '今日はどうだった？';

  @override
  String get journalSaved => '日記を保存しました・+5 XP';

  @override
  String get journalSaveEntry => '保存する';

  @override
  String get weeklyInsight => '今週の気づき';

  @override
  String get weeklyInsightCaffeine => 'カフェイン';

  @override
  String get weeklyInsightStress => 'ストレス';

  @override
  String get weeklyInsightMood => '気分';

  @override
  String get wellnessInfoTitle => '体調管理が大切な理由';

  @override
  String get wellnessInfoBody =>
      'カフェインは深い睡眠を妨げます。成長ホルモン（HGH）の多くは深い睡眠中に分泌されます。慢性的なストレスはコルチゾールを増やし、成長ホルモンを直接抑えます。日記をつけると、成長を支える習慣を続けやすくなります。';

  @override
  String get wellnessInfoGotIt => 'わかった';

  @override
  String get insightCaffeineHigh => '今週はカフェインが多めです。睡眠と成長ホルモンのために減らしてみましょう。';

  @override
  String get insightStressHigh => '今週はストレスが高めです。呼吸法を試してみよう。コルチゾールは成長を妨げます。';

  @override
  String get insightMoodLow => '最近、気分が落ち込みがちです。日光、睡眠、軽い運動がどれも助けになります。';

  @override
  String get insightGreat => '今週はバランスばっちり。体調が最適な成長を支えています。';

  @override
  String get insightDefault => '体調は順調です。記録を続けると、より詳しい気づきが得られます。';

  @override
  String get insightNeedMoreData => 'あと数日記録すると、気づきが表示されます。';

  @override
  String get progressPhotosTitle => '記録写真';

  @override
  String get progressPhotosHeader => '記録写真';

  @override
  String get progressPhotosSubtitle => '見た目の変化を記録しよう';

  @override
  String get addProgressPhoto => '記録写真を追加';

  @override
  String get captureJourney => '見た目の変化を残そう';

  @override
  String get takePhoto => '写真を撮る';

  @override
  String get chooseFromLibrary => 'ライブラリから選ぶ';

  @override
  String get deletePhotoTitle => '写真を削除しますか？';

  @override
  String get deletePhotoBody => 'この写真は成長のタイムラインから削除されます。';

  @override
  String get timelineTab => 'タイムライン';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '枚',
      one: '枚',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$days日で$cm $unit';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '日',
      one: '日',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit 伸びた';
  }

  @override
  String get firstPhotoMessage => '最初の写真を撮って、見た目の変化を記録し始めよう。';

  @override
  String get takeFirstPhoto => '最初の写真を撮る';

  @override
  String get beforeAfter => 'ビフォー / アフター';

  @override
  String get beforeLabel => 'ビフォー';

  @override
  String get afterLabel => 'アフター';

  @override
  String get yourHeightDialog => 'あなたの身長';

  @override
  String get heightDialogMessage => 'この写真を撮ったときの身長を入力してください';

  @override
  String get postureAnalysisTitle => '姿勢分析';

  @override
  String get postureCoachHeader => '姿勢コーチ';

  @override
  String get postureCoachSubtitle => '横からの写真でセルフチェック';

  @override
  String get latestScore => '最新スコア';

  @override
  String get latestAnalysis => '最新の分析';

  @override
  String get headPosition => '頭の位置';

  @override
  String get progressLabel => '推移';

  @override
  String get choosePhotoSource => '写真の取得方法を選択';

  @override
  String get sideProfileHint => '真横から、全身が入るように';

  @override
  String get howToTakePhoto => '写真の撮り方';

  @override
  String get takePosturePhoto => '姿勢の写真を撮る';

  @override
  String get postureExcellent => 'とても良い';

  @override
  String get postureGood => '良い';

  @override
  String get postureNeedsWork => '改善の余地あり';

  @override
  String get posturePoor => '悪い';

  @override
  String get recommendedExercises => 'おすすめのエクササイズ';

  @override
  String get postureWallStand => '壁立ち';

  @override
  String get postureWallStandDesc => '毎日2分間、壁に背中をつけて立ちましょう。';

  @override
  String get postureChestOpener => '胸ひらき';

  @override
  String get postureChestOpenerDesc => '肩を前に引っぱる硬い胸の筋肉をほぐします。';

  @override
  String get postureChinTucks => 'あご引き';

  @override
  String get postureChinTucksDesc => '頭が前に出た姿勢を改善 — 10回×3セット。';

  @override
  String get postureDeadbug => 'デッドバグ';

  @override
  String get postureDeadbugDesc => '深層の体幹を鍛えて、反り腰をコントロールします。';

  @override
  String get recipesTitle => 'レシピ';

  @override
  String get recipesHeader => 'レシピ';

  @override
  String get recipesSubtitle => '成長をごはんで支えよう';

  @override
  String get recipesCategoryAll => 'すべて';

  @override
  String get recipesCategoryBreakfast => '朝食';

  @override
  String get recipesCategoryLunch => '昼食';

  @override
  String get recipesCategoryDinner => '夕食';

  @override
  String get recipesCategorySnack => '間食';

  @override
  String get recipesGoalAll => 'すべて';

  @override
  String get recipeDiffEasy => 'かんたん';

  @override
  String get recipeDiffMedium => 'ふつう';

  @override
  String get recipeDiffHard => 'むずかしい';

  @override
  String get recipesFilterType => '種類';

  @override
  String get recipesFilterNutrient => '豊富な栄養素';

  @override
  String get recipesGoalVitaminD => 'ビタミンD';

  @override
  String get recipesGoalZinc => '亜鉛';

  @override
  String get recipesGoalMagnesium => 'マグネシウム';

  @override
  String recipesCountLabel(int count) {
    return '$count件のレシピ';
  }

  @override
  String get recipeIngredients => '材料';

  @override
  String get recipeSteps => '作り方';

  @override
  String get recipesGoalProtein => '高たんぱく';

  @override
  String get recipesGoalCalcium => 'カルシウム';

  @override
  String get recipesGoalOmega3 => 'オメガ3';

  @override
  String get recipesGoalIron => '鉄分';

  @override
  String get recipesNoMatch => '条件に合うレシピがありません';

  @override
  String get recipesIngredients => '材料';

  @override
  String get recipesInstructions => '作り方';

  @override
  String get recipesClose => '閉じる';

  @override
  String get recipesAboutTitle => 'レシピについて';

  @override
  String get recipesAboutBody =>
      '成長をサポートするために厳選したレシピです。食事の種類や栄養の目的で絞り込んで、あなたのプランにぴったりのものを見つけよう。';

  @override
  String get animHintSpinalDecomp => '背骨の圧迫をやわらげる';

  @override
  String get animHintGravityReversal => '重力をリセット';

  @override
  String get animHintImpactBones => '骨に適度な刺激';

  @override
  String get animHintHighImpact => '骨に強めの刺激';

  @override
  String get animHintMetabolicBurst => '代謝アップトレーニング';

  @override
  String get animHintFullBodyStretch => '全身を目覚めさせるストレッチ';

  @override
  String get animHintSpinalExtension => '背骨を伸ばす';

  @override
  String get animHintCervicalDecomp => '首の圧迫をやわらげる';

  @override
  String get animHintShoulderMobility => '肩の可動域アップ';

  @override
  String get animHintFullBodyMotion => '全身を動かす';

  @override
  String get animHintPosteriorChain => '体の裏側のストレッチ';

  @override
  String get animHintMuscleGrowth => '筋肉の成長を支える栄養';

  @override
  String get animHintBoneDensity => '骨密度をサポート';

  @override
  String get animHintSpinalDisc => '椎間板のうるおい';

  @override
  String get animHintCleanNutrition => 'クリーンな食事';

  @override
  String get animHintIgf1 => 'IGF-1を最適化';

  @override
  String get animHintHghAmino => '成長ホルモンのもとになるアミノ酸';

  @override
  String get animHintCalciumAbsorption => 'カルシウムの吸収';

  @override
  String get animHintSpinalAlignment => '背骨の並びを整える';

  @override
  String get animHintPostureCorrection => '姿勢の改善';

  @override
  String get animHintMindBody => '心と体のバランス';

  @override
  String get animHintCoreStability => '体幹の安定';

  @override
  String get animHintLegPower => '脚力アップ＆成長ホルモン';

  @override
  String get animHintVerticalPower => 'ジャンプ力';

  @override
  String get animHintHghSurge => '成長ホルモンを促すトレーニング';

  @override
  String get animHintPeakHgh => '成長ホルモン分泌のピーク時間';

  @override
  String get animHintMelatonin => 'メラトニンを最適化';

  @override
  String get animHintDeepSleep => '深い睡眠の準備';

  @override
  String get animHintSleepOpt => '睡眠の最適化';

  @override
  String get animHintExercise => '運動';

  @override
  String get formMorningStretch =>
      '首回しから始めて、全身のストレッチへ。反動をつけずに、各ストレッチを20〜30秒キープします。';

  @override
  String get formBarHanging => '肩幅で鉄棒を握り、全身の力を抜いて重力で背骨を伸ばします。体を揺らさないように。';

  @override
  String get formCobraStretch =>
      'うつ伏せになり、手を肩の下に置きます。腰を床につけたまま、ゆっくり上半身を持ち上げて上を見ます。';

  @override
  String get formJumping => 'スクワットジャンプか縄跳びをします。つま先側でやわらかく着地。セット間は30秒休憩。';

  @override
  String get formSwimmingBasketball =>
      '水泳（クロール／背泳ぎ）かバスケを選びます。ジャンプ、手を伸ばす動き、大きな動作を意識しよう。';

  @override
  String get formEveningYoga =>
      'キャット＆カウ、チャイルドポーズ、ダウンドッグ、前屈などのやさしいポーズを。深く呼吸し、各ポーズを30〜60秒キープ。';

  @override
  String get formSprintIntervals =>
      '5分間ウォームアップしたら、30秒全力でダッシュ。90秒歩くか軽く走って回復。これを繰り返します。';

  @override
  String get formHiitWorkout => 'バーピー、マウンテンクライマー、ジャンプスクワットなどを全力で45秒、休憩15秒。';

  @override
  String get formSquats =>
      '足を肩幅に開いて立ち、太ももが床と平行になるまで腰を下ろします。背すじを伸ばし、ひざがつま先より前に出ないように。';

  @override
  String get formDeadliftStretch =>
      '足を腰幅に開いて立ち、背中をまっすぐ保ったまま股関節から前に倒します。つま先に手を伸ばし、太ももの裏と背中の伸びを感じよう。';

  @override
  String get formOverheadPress =>
      'まっすぐ立ち、腕を頭上へ伸ばしきるまで押し上げます。軽いおもりか自重で。体幹を締め、背中を反らさないように。';

  @override
  String get formSkippingRope =>
      '両足でジャンプし、つま先側でやわらかく着地。低く一定のリズムで跳びます。セット間は休憩を。';

  @override
  String get formPilatesCore =>
      'プランク、デッドバグ、バードドッグ、ブリッジ、レッグレイズを行います。コントロールした動きと呼吸を意識しよう。';

  @override
  String get formInversionHang =>
      '逆さ吊りテーブルやグラビティブーツを使います。ゆるい角度から始めて少しずつ上げましょう。1回は短時間で。';

  @override
  String get formProtein => 'たんぱく質は3〜4食に分けて摂りましょう。卵、鶏肉、魚、乳製品、豆類を取り入れて。';

  @override
  String get formCalciumVitaminD => '乳製品を1日3回摂り、15分日光を浴びて自然にビタミンDを作りましょう。';

  @override
  String get formWater => '1日を通してこまめに水を飲みましょう。水筒を持ち歩き、1時間ごとにリマインダーを設定すると◎。';

  @override
  String get formAvoidJunk =>
      'ファストフードは自然な食材に、甘い飲み物は水に置き換えましょう。成分表示を見て、加工された原材料は避けて。';

  @override
  String get formZincIntake =>
      '赤身肉、かぼちゃの種、ひよこ豆、カシューナッツ、牡蠣を食事に取り入れましょう。1日8〜11mgが目安。';

  @override
  String get formVitaminDSunlight =>
      '腕と顔に15分間、直射日光を当てましょう。できれば午前中に。この時間なら日焼け止めは不要です。';

  @override
  String get formArginineFoods =>
      'ナッツ、種子、七面鳥、鶏肉、大豆、乳製品を食事に取り入れましょう。寝る前に摂るのがおすすめ。';

  @override
  String get formDailyCalories =>
      'カロリーは3〜5食に分けて、朝食は抜かないように。中身のないカロリーより、自然な食材を優先しよう。';

  @override
  String get formQualitySleep => '22時までに寝ましょう。部屋は暗く涼しく。14時以降のカフェインは控えて。';

  @override
  String get formNoScreen => '寝る1時間前にアラームを設定し、画面はすべて片づけましょう。代わりに読書や軽いストレッチを。';

  @override
  String get formSleepEnvironment =>
      '遮光カーテンを使い、室温は18〜20°Cに。光の出るものはすべてなくしましょう。快適なマットレスと枕を使って。';

  @override
  String get formPreSleepRoutine =>
      '寝る30分前から始めよう：照明を暗くする、本を読む、呼吸法をする、刺激の強いことは避ける。';

  @override
  String get formPostureCheck =>
      '肩を後ろに引いて下げ、まっすぐ立ちます。体幹に軽く力を入れて、頭のてっぺんを糸で引っぱられるイメージで。';

  @override
  String get formWallStand => 'かかと・お尻・肩甲骨・頭を壁につけて立ち、5分キープ。呼吸はふつうに。';

  @override
  String get formNeckStretches => '頭をゆっくり左右、前、後ろに倒します。各方向30秒キープ。無理に伸ばさないように。';

  @override
  String get formShoulderRolls => '肩を前に15回、後ろに15回回します。続けて胸をひらくストレッチを20秒キープ。';

  @override
  String get sciMorningStretch =>
      '朝のストレッチは、夜のあいだに水分を取り戻した椎間板への圧迫をやわらげ、身長を保つのに役立ちます';

  @override
  String get sciBarHanging => 'ぶら下がると重力で背骨が伸び、椎間板の圧迫がやわらぐため、一時的に身長が伸びる可能性があります';

  @override
  String get sciCobraStretch => 'コブラのポーズは背骨を伸ばして胸をひらき、座りっぱなしによる背骨の圧迫を打ち消します';

  @override
  String get sciJumping => '衝撃のあるジャンプは脚の成長板を刺激し、成長ホルモンの分泌を促します';

  @override
  String get sciSwimmingBasketball =>
      '水泳やバスケには全身を伸ばす、跳ぶ、手を伸ばす動きが多く、成長板の働きを刺激します';

  @override
  String get sciEveningYoga => '夜のヨガは成長ホルモンを妨げるコルチゾールを減らし、筋肉を伸ばして夜の回復を助けます';

  @override
  String get sciSprintIntervals => '全力ダッシュは成長ホルモンの分泌を大きく促します';

  @override
  String get sciHiitWorkout => '高強度の運動で成長ホルモンが最大450%増えます';

  @override
  String get sciSquats => 'スクワットは脚と背骨の成長板を刺激します';

  @override
  String get sciDeadliftStretch => '背骨の圧迫をやわらげると、椎間板の健康につながります';

  @override
  String get sciOverheadPress => '頭上に押し上げる動きは背骨を伸ばし、姿勢を支える筋肉を鍛えます';

  @override
  String get sciSkippingRope => '繰り返しのジャンプは脚の成長板を刺激します';

  @override
  String get sciPilatesCore => '体幹の強さが背骨の並びと姿勢を支えます';

  @override
  String get sciInversionHang => '逆さになると椎間板の圧迫がやわらぎ、一時的に1〜2cm伸びることがあります';

  @override
  String get sciProtein => 'たんぱく質は骨と筋肉の成長に欠かせないアミノ酸を供給します。特に成長期には重要です';

  @override
  String get sciCalciumVitaminD => 'カルシウムとビタミンDは、骨密度と骨の伸びを支える主要な材料です';

  @override
  String get sciWater => '水分は成長板への栄養の運搬と、関節の軟骨の健康に欠かせません';

  @override
  String get sciAvoidJunk => '加工食品や砂糖は炎症や血糖値の急上昇を招き、成長ホルモンの分泌を抑えます';

  @override
  String get sciZincIntake => '亜鉛は成長ホルモンの生成に欠かせません';

  @override
  String get sciVitaminDSunlight => 'ビタミンDはカルシウムの吸収と骨の成長に重要です';

  @override
  String get sciArginineFoods => 'L-アルギニンは成長ホルモンの分泌を促します';

  @override
  String get sciDailyCalories =>
      'カロリー不足が続くとIGF-1が下がり、成長ホルモンの分泌が弱まるため、思春期の身長の伸びが直接遅くなります';

  @override
  String get sciQualitySleep => '1日の成長ホルモンの70〜80%は深い睡眠中、特に22時〜2時に分泌されます';

  @override
  String get sciNoScreen => '画面のブルーライトはメラトニンの分泌を抑え、寝つきを遅らせて深い睡眠の質を下げます';

  @override
  String get sciSleepEnvironment => '暗く涼しい環境がメラトニンと成長ホルモンを最大化します';

  @override
  String get sciPreSleepRoutine => '毎晩同じ入眠ルーティンで、深い睡眠の質が23%向上します';

  @override
  String get sciPostureCheck => '姿勢を正すと見た目の身長がすぐに2〜3 cm高くなり、背骨の圧迫も防げます';

  @override
  String get sciWallStand => '壁立ちで正しい姿勢を体に覚えさせ、1日中背骨のよい並びを保ちやすくなります';

  @override
  String get sciNeckStretches => '首のストレッチで圧迫をやわらげ、首の骨の並びを整えます';

  @override
  String get sciShoulderRolls => '肩をひらくと前かがみの姿勢が整い、見た目で1〜2cm高く見えることも';

  @override
  String get muscleSpine => '背骨';

  @override
  String get muscleLegs => '脚';

  @override
  String get muscleBack => '背中';

  @override
  String get muscleShoulders => '肩';

  @override
  String get muscleArms => '腕';

  @override
  String get muscleCore => '体幹';

  @override
  String get muscleChest => '胸';

  @override
  String get muscleCalves => 'ふくらはぎ';

  @override
  String get muscleFullBody => '全身';

  @override
  String get muscleHips => '股関節';

  @override
  String get muscleBones => '骨';

  @override
  String get muscleMuscles => '筋肉';

  @override
  String get muscleNeck => '首';

  @override
  String get muscleUpperSpine => '背骨の上部';

  @override
  String get muscleUpperBack => '背中の上部';

  @override
  String get createRoutine => 'ルーティンを作成';

  @override
  String get createRoutineTitle => 'オリジナルルーティンを作成';

  @override
  String get createRoutineSubtitle => '自分だけの毎日のルーティンを作ろう';

  @override
  String get routineIcon => 'アイコン';

  @override
  String get routineTitleField => 'タイトル';

  @override
  String get routineDescField => '説明';

  @override
  String get routineDescHint => 'ルーティンの短い説明';

  @override
  String get routineCategoryField => 'カテゴリ';

  @override
  String get routineDifficultyField => '難易度';

  @override
  String get routineDurationField => '時間';

  @override
  String get routineSetsRepsField => 'セット×回数';

  @override
  String get routineFormField => 'フォームとやり方';

  @override
  String get routineFormHint => '任意：このルーティンのやり方';

  @override
  String get diffBeginner => '初級';

  @override
  String get diffIntermediate => '中級';

  @override
  String get diffAdvanced => '上級';

  @override
  String get catExercise => '運動';

  @override
  String get catNutrition => '栄養';

  @override
  String get catSleep => '睡眠';

  @override
  String get catPosture => '姿勢';

  @override
  String get postureTip1 => 'カメラに対して真横を向いて立ちましょう。';

  @override
  String get postureTip2 => 'レンズから約2メートル離れましょう。';

  @override
  String get postureTip3 => '腕の力を抜き、まっすぐ前を見ましょう。';

  @override
  String get postureTip4 => '正確に採点するため、体にフィットした服を着ましょう。';

  @override
  String get postureTip5 => '明るい場所で、無地の背景を使いましょう。';

  @override
  String get kyphosisLabel => '猫背（背中の上部）';

  @override
  String get lordosisLabel => '反り腰（腰）';

  @override
  String get analyzingPosture => '姿勢を分析中';

  @override
  String get privacyPolicy => 'プライバシーポリシー';

  @override
  String get termsOfService => '利用規約';

  @override
  String version(String ver) {
    return 'バージョン $ver';
  }

  @override
  String get rateApp => 'BeTallerを評価';

  @override
  String get rateAppSubtitle => 'あなたのレビューが励みになります！';

  @override
  String get unitSystem => '単位';

  @override
  String get unitMetric => 'メートル法（cm、kg）';

  @override
  String get unitImperial => 'ヤード・ポンド法（ft-in、lbs）';

  @override
  String get healthDisclaimer => '健康に関する注意事項';

  @override
  String get healthDisclaimerBody =>
      'BeTallerは、一般的な健康とフィットネスのためのガイドを提供します。結果は年齢、遺伝、個人の要因によって異なります。このアプリは医療上のアドバイスを提供するものではありません。エクササイズは、自然な習慣による姿勢の改善、背骨の健康、成長ホルモンのサポートを目的としています。新しい運動や食事のプログラムを始める前に、医師などの専門家に相談してください。成長板が閉じた後（通常18〜25歳）の身長の変化は、主に姿勢の改善によるものです。';

  @override
  String routineProteinAmountDesc(int grams) {
    return '今日は${grams}g以上のたんぱく質を摂ろう。体重から計算しています。';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return '今日は${liters}L以上の水を飲もう。体重から計算しています。';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return '成長のエネルギーとして、今日は約$kcal kcalを目指そう。';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return '今日は$iu IUのビタミンDを。日光、食事、サプリから摂れます。';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return '成長ホルモンの生成を助けるため、今日は${mg}mgの亜鉛を摂ろう。';
  }

  @override
  String get nutritionSupplementsTitle => 'サプリメント';

  @override
  String get nutritionSupplementsDisclaimer =>
      'あくまで補助で、食事の代わりにはなりません。サプリを始める前に、特に18歳未満の場合は医師に相談してください。';

  @override
  String get supplementVitaminDName => 'ビタミンD3';

  @override
  String get supplementVitaminDDose => '3,000 IU';

  @override
  String get supplementVitaminDBenefit => 'カルシウムの吸収を高め、骨密度と成長板の健康を支えます';

  @override
  String get supplementZincName => '亜鉛';

  @override
  String get supplementZincDose => '8〜11mg';

  @override
  String get supplementZincBenefit => '成長ホルモンの生成に欠かせない重要なミネラル';

  @override
  String get supplementMagnesiumName => 'マグネシウム';

  @override
  String get supplementMagnesiumDose => '300〜400mg';

  @override
  String get supplementMagnesiumBenefit => '成長ホルモンが最も多く分泌される深い睡眠をサポートします';

  @override
  String get supplementCalciumName => 'カルシウム';

  @override
  String get supplementCalciumDose => '1,000〜1,300mg';

  @override
  String get supplementCalciumBenefit => '骨密度と成長板をつくる基本の材料';

  @override
  String get supplementOmega3Name => 'オメガ3';

  @override
  String get supplementOmega3Dose => '1,000mg';

  @override
  String get supplementOmega3Benefit => '炎症を抑え、成長板の健康な働きを支えます';

  @override
  String get supplementCollagenName => 'コラーゲン＋ビタミンC';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit => 'ビタミンCは、体がコラーゲンを使って軟骨や骨の土台をつくるのを助けます';

  @override
  String get sciSourcePrefix => '出典：';

  @override
  String get program => 'プログラム';

  @override
  String get todaysExercises => '今日のエクササイズ';

  @override
  String get dailyNutritionPlan => '毎日の栄養プラン';

  @override
  String get nutritionGoalsComplete => '🎉 栄養の目標をすべて達成！';

  @override
  String get nutritionGoalsIncomplete => '最適な成長のために、栄養の目標を達成しよう';

  @override
  String get postureDetectingAlignment => '背骨の並びを検出中...';

  @override
  String get testimonial1 =>
      '年齢的にもう無理だと思っていたけど、BeTallerで伸びました。今までで一番自信が持てています。';

  @override
  String get testimonialDuration1 => '4か月';

  @override
  String get testimonial2 => 'みんなに「もう伸びないよ」と言われたけど、BeTallerを使ってみんなを驚かせました。';

  @override
  String get testimonialDuration2 => '3か月';

  @override
  String get testimonial3 => 'ルーティンを始めてから背が伸びて、姿勢もよくなりました。周りもみんな気づいてくれました。';

  @override
  String get testimonialDuration3 => '6か月';

  @override
  String get testimonial4 => 'まだ成長期で、BeTallerの効果がすごいです。背が伸びて体も強くなった気がします。';

  @override
  String get testimonialDuration4 => '3か月';

  @override
  String get testimonial5 => 'BeTallerを試してないと言ったらウソになります。すぐに変化を感じました。本当におすすめ。';

  @override
  String get testimonialDuration5 => '4か月';

  @override
  String get designedForYou => 'あなたのために';

  @override
  String get designedForYouDesc =>
      'BeTallerは、あなたが遺伝的な限界に届き、さらにその先を目指せるように作られました。すべての機能が、あなたのために。';

  @override
  String get greetingAllDone => 'よくできました！🎯';

  @override
  String get greetingAllDoneSub => '今日のタスクをすべて完了しました。';

  @override
  String greetingStreak30(int streak) {
    return '$streak日連続。レジェンド級です。';
  }

  @override
  String greetingStreak7(int streak) {
    return '$streak日連続。この調子で。';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak日連続。多くの人がやめるところ、あなたは続けています。';
  }

  @override
  String get greetingMorning => 'おはよう。新しい1日、新しいチャンス。';

  @override
  String get greetingAfternoon => '今日は連続記録を始めるのにぴったりの日。';

  @override
  String get greetingEvening => 'タスクを完了して、連続記録をスタートしよう。';

  @override
  String get todayCompleted => '今日は完了 ✓';

  @override
  String get todayGoals => '今日の目標';

  @override
  String get challengesLabel => 'チャレンジ';

  @override
  String get dailyChallengesLabel => 'デイリーチャレンジ';

  @override
  String get expiresTonight => '今夜まで';

  @override
  String get allChallengesCompleted => 'すべて完了 ✓';

  @override
  String get challengesLoading => '新しいチャレンジをまもなく読み込みます。';

  @override
  String get challengesLoadingTitle => 'デイリーチャレンジ';

  @override
  String get behindPace => 'ペース遅れ';

  @override
  String get growthTracking => '成長の記録';

  @override
  String get growthEmptyFirst => '最初の身長を記録して、追跡を始めよう。';

  @override
  String get growthEmptySecond => '2回目の測定を記録すると、グラフが表示されます。';

  @override
  String get growthSectionLabel => '成長';

  @override
  String get generalPerformance => '総合パフォーマンス';

  @override
  String get analysisBalance => 'あなたのバランス';

  @override
  String get analysisWeakest => 'いちばんの弱点';

  @override
  String get analysisPrediction => '身長予測';

  @override
  String get analysisComparison => '比較';

  @override
  String get analysisGrowth => '成長の状況';

  @override
  String get analysisWeakestHint => 'ここを伸ばすのが、スコアアップへの近道です。';

  @override
  String get exploreLabel => '探す';

  @override
  String get explorePosture => '姿勢分析';

  @override
  String get explorePostureSub => '姿勢の分析と改善のヒント';

  @override
  String get explorePhotos => '記録写真';

  @override
  String get explorePhotosSub => '写真で変化を記録しよう';

  @override
  String get exploreNutrition => '栄養';

  @override
  String get exploreNutritionSub => 'たんぱく質・カルシウム・ビタミンのガイド';

  @override
  String get exploreHealth => '体調の記録';

  @override
  String get exploreHealthSub => 'ストレス・カフェイン・体調の記録';

  @override
  String get exploreRecipes => '成長レシピ';

  @override
  String get exploreRecipesSub => '成長をサポートするレシピ';

  @override
  String get educationLabel => '学び';

  @override
  String get educationTitle => '身長が伸びる\nしくみ';

  @override
  String get educationSubtitle => '専門家の解説、研究、ガイド';

  @override
  String get aiAnalysisLabel => '成長分析';

  @override
  String get peerCompareLabel => '同年代と比較';

  @override
  String peerCompareText(int topPct) {
    return '同年代の上位$topPct%に入っています';
  }

  @override
  String get notifWaterTitle => '💧 水分補給を忘れずに！';

  @override
  String get notifWaterBody => '今日の水分目標は達成できた？もう1杯飲もう！';

  @override
  String get notifMorningTitle => '🌅 おはよう！運動の時間です';

  @override
  String get notifMorningBody => '朝のストレッチをしよう！背骨と脚を10分伸ばそう。';

  @override
  String get notifRoutineTitle => '🔥 ルーティンを完了しよう！';

  @override
  String get notifRoutineBody => '1日が終わる前にルーティンをチェック。連続記録＝継続力！';

  @override
  String get notifProteinTitle => '🥚 たんぱく質の日！';

  @override
  String get notifProteinBody => 'いいスタートで1週間を始めよう！毎食たんぱく質を。';

  @override
  String get notifNewWeekTitle => '✨ 新しい週、新しい目標！';

  @override
  String get notifNewWeekBody => '今週はルーティンをサボらずに。小さな一歩が大きな差に！';

  @override
  String get notifSleepTitle => '😴 おやすみの時間！';

  @override
  String get notifSleepBody => '成長ホルモンは22時〜2時にピークに。スマホを置こう！';

  @override
  String get notifPostureTitle => '🧍 姿勢チェック！';

  @override
  String get notifPostureBody => '背すじを伸ばして、肩を後ろに。よい姿勢で2〜3 cmの差！';

  @override
  String get notifVitaminDTitle => '☀️ ビタミンDの時間！';

  @override
  String get notifVitaminDBody => '15分日光を浴びよう！ビタミンDがカルシウムの吸収を高めます。';

  @override
  String get notifMidweekTitle => '✨ もう半分！';

  @override
  String get notifMidweekBody => '週の半ばのチェック。成長には根気が必要。でも続けた人が勝つ！';

  @override
  String get notifScreenTitle => '📵 画面オフ！';

  @override
  String get notifScreenBody => '寝る1時間前は画面を見ないで。ブルーライトはメラトニンを妨げます！';

  @override
  String get notifJumpTitle => '🦘 ジャンプの時間！';

  @override
  String get notifJumpBody => 'ジャンプ運動は成長板を刺激します。20回×3セットに挑戦！';

  @override
  String get notifCalciumTitle => '🥛 カルシウムの時間！';

  @override
  String get notifCalciumBody => '牛乳かヨーグルトを1杯。カルシウムは骨に欠かせません！';

  @override
  String get notifPostureCheckTitle => '🧍 姿勢チェック！';

  @override
  String get notifPostureCheckBody => 'スマホを見るとき首を曲げないで！背すじを伸ばして座って歩こう。';

  @override
  String get notifWeekendTitle => '✨ 週末のモチベーション';

  @override
  String get notifWeekendBody => '週末もルーティンをサボらずに！継続は毎日のこと。';

  @override
  String get notifWeeklyProgressTitle => '📊 今週の成長';

  @override
  String get notifWeeklyProgressBody => '今週はどうだった？成長グラフをチェックしよう！';

  @override
  String get notifMeasureTitle => '📏 週に一度の測定！';

  @override
  String get notifMeasureBody => '身長を測って記録しよう！朝の測定がいちばん正確です。';

  @override
  String get notifEarlySleepTitle => '😴 今日は早く寝よう！';

  @override
  String get notifEarlySleepBody => '明日は月曜日！ぐっすり眠って、いいスタートを切ろう。';

  @override
  String get notifStreak3Title => '🔥 3日連続！';

  @override
  String get notifStreak3Body => 'いいスタート！3日連続です。7日を目指そう！';

  @override
  String get notifStreak7Title => '🏆 1週間連続！';

  @override
  String get notifStreak7Body => 'すごい！7日連続でルーティンを完了！';

  @override
  String get notifStreak14Title => '⭐ 2週間連続！';

  @override
  String get notifStreak14Body => '14日間の継続！体が変わり始めています。';

  @override
  String get notifStreak30Title => '👑 1か月連続！';

  @override
  String get notifStreak30Body => '30日達成！あなたはチャンピオンです！';

  @override
  String get notifStreak60Title => '🌟 60日連続！';

  @override
  String get notifStreak60Body => '60日！本当にすごい達成です。';

  @override
  String get notifStreak100Title => '💎 100日！レジェンド！';

  @override
  String get notifStreak100Body => '100日連続！あなたはレジェンドになりました。';

  @override
  String get notifStreakRiskTitle => '⚠️ 連続記録が途切れそう！';

  @override
  String notifStreakRiskBody(int streak) {
    return '$streak日の連続記録がピンチ！ルーティンを完了しよう。';
  }

  @override
  String get paywallStat1 => 'cm — あなたのポテンシャルはロック中';

  @override
  String get paywallTitle1 => 'あと何cm\n伸びる？';

  @override
  String get paywallBullet1a => '遺伝的な上限を計算しました。見てみる？';

  @override
  String get paywallBullet1b => '生活習慣は成長にどう影響する？';

  @override
  String get paywallBullet1c => 'あなた専用のロードマップが待っています';

  @override
  String get paywallStat2 => 'あなた専用のルーティンが完成';

  @override
  String get paywallTitle2 => 'プランが\n完成しました';

  @override
  String get paywallBullet2a => '毎朝8分 — 背骨のために設計';

  @override
  String get paywallBullet2b => '睡眠・栄養・水分をまとめて記録';

  @override
  String get paywallBullet2c => '毎日一歩ずつ前へ。連続記録を途切れさせないで';

  @override
  String get paywallStat3 => 'リアルタイムの成長グラフ';

  @override
  String get paywallTitle3 => '成長を\n記録しよう';

  @override
  String get paywallBullet3a => '毎月の測定 — 成長を自分の目で確かめよう';

  @override
  String get paywallBullet3b => '姿勢分析で今すぐ2 cm高く見せよう';

  @override
  String get paywallBullet3c => '記録写真 — 違いがきっとわかります';

  @override
  String get paywallStat4 => '毎日のプログラム — レベルアップ中';

  @override
  String get paywallTitle4 => '毎日\n強くなる';

  @override
  String get paywallBullet4a => 'XPを集めてレベル解放 — 習慣がゲームに';

  @override
  String get paywallBullet4b => '目標を達成した人たちも、ここから始めました';

  @override
  String get paywallBullet4c => '今すぐ始めよう — 最初の1週間は無料';

  @override
  String get paywallRestore => '以前の購入が見つかりません';

  @override
  String get paywallRestoreNotFound => '以前の購入が見つかりません';

  @override
  String get paywallPromoCode => 'プロモコードをお持ちですか？';

  @override
  String get paywallHeightUnit => '目標身長';

  @override
  String get paywallHeightTitle => 'あとどれくらい伸びる？';

  @override
  String get paywallHeightDesc =>
      '遺伝・生活習慣・姿勢をあわせて分析し、1年ごとの予測を示します。予測は固定ではなく、あなたの行動に合わせて更新されます。';

  @override
  String get paywallGrowthUnit => '今年';

  @override
  String get paywallGrowthTitle => 'あなたの成長を一緒に記録します';

  @override
  String get paywallGrowthDesc => '測定するたびにすぐグラフに反映。1か月ごと、1センチごとに成長を確かめられます。';

  @override
  String get paywallPostureUnit => '姿勢スコア';

  @override
  String get paywallPostureTitle => '姿勢がルーティンのカギ';

  @override
  String get paywallPostureDesc => '頭・肩・腰を3つの質問ですばやくチェックし、それぞれを直すエクササイズを紹介します。';

  @override
  String get paywallReportUnit => 'ルーティン完了';

  @override
  String get paywallReportTitle => '毎週あなたを振り返ります';

  @override
  String get paywallReportDesc =>
      '水分・睡眠・ルーティン・連続記録をひとつの画面に。毎週、強みと足りないところを一緒に確認します。';

  @override
  String get paywallNutritionUnit => '1日の食事回数';

  @override
  String get paywallNutritionTitle => 'あなたの栄養プランが完成';

  @override
  String get paywallNutritionDesc =>
      '朝食から夕食まで、たんぱく質・カルシウム・亜鉛・ビタミンDを計算済みの1日のプラン。';

  @override
  String get paywallScoreUnit => 'BeTallerスコア';

  @override
  String get paywallScoreTitle => 'あなたを前に進め続けるしくみ';

  @override
  String get paywallScoreDesc =>
      '遺伝・成長・栄養・睡眠・継続力をひとつのスコアに。下がったら、どこを改善すればいいかがすぐにわかります。';

  @override
  String get paywallPhotosUnit => '目に見える変化';

  @override
  String get paywallPhotosTitle => '変化を写真で証明しよう';

  @override
  String get paywallPhotosDesc => 'ビフォー・アフターの比較は自動で作成。毎月の写真がタイムラインに並びます。';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => '3ステップで始めよう';

  @override
  String get journeyIntroSubtitle => '一緒にBeTallerを設定しましょう。次のステップが待っています。';

  @override
  String get journeyStep1Title => 'データの入力';

  @override
  String get journeyStep1Desc => '身長・年齢・生活習慣から、あなたのポテンシャルを計算します。';

  @override
  String get journeyStep2Title => 'アプリの紹介';

  @override
  String get journeyStep2Desc => 'すべての機能について、何ができてどう使うかを紹介します。';

  @override
  String get journeyStep3Title => '自分で使ってみる';

  @override
  String get journeyStep3Desc => '毎日のルーティンをこなし、成長の記録は私たちにおまかせ。';

  @override
  String get journeyNow => 'いま';

  @override
  String get journeyDone => '完了';

  @override
  String get journeySoon => 'このあと';

  @override
  String get tourHomeStreakTitle => '連続記録';

  @override
  String get tourHomeStreakDesc => '継続している限り伸び続けます。1日休むとリセットされます。';

  @override
  String get tourHomeXpTitle => 'あなたのレベル';

  @override
  String get tourHomeXpDesc => '継続して獲得したXPで上がります。ペースを落とさないで！';

  @override
  String get tourHomeGoalsTitle => '今日の目標';

  @override
  String get tourHomeGoalsDesc => '今日のルーティン、タスク、水分目標がひと目でわかるので、見落としません。';

  @override
  String get tourHomeTrackTitle => '水分と睡眠の記録';

  @override
  String get tourHomeTrackDesc => '毎日の水分と睡眠を、ここから数秒で記録できます。';

  @override
  String get tourPlanTabsTitle => '3つのタブ：今日・継続・栄養';

  @override
  String get tourPlanTabsDesc => '毎日のルーティン、週のプログラム、栄養プランはすべてここにあります。';

  @override
  String get tourPlanLevelTitle => '継続レベル';

  @override
  String get tourPlanLevelDesc => 'ルーティンをどれだけ続けているかを示します。レベルが上がるほど結果も出やすく。';

  @override
  String get tourPlanTodayTitle => '今日のプラン';

  @override
  String get tourPlanTodayDesc => 'ここで毎日のルーティンをチェックして、連続記録を伸ばそう。';

  @override
  String get tourPlanTodayListTitle => '今日のルーティン';

  @override
  String get tourPlanTodayListDesc => '終わったらチェック。ルーティンをタップすると詳細が開きます。';

  @override
  String get tourPlanWeekGoalsTitle => '今週';

  @override
  String get tourPlanWeekGoalsDesc => '今週のプラン完了日、トレーニング、そして必須の測定を確認できます。';

  @override
  String get tourPlanMonthGoalsTitle => '今月';

  @override
  String get tourPlanMonthGoalsDesc => '記録写真、姿勢チェック、今月の測定。どれも飛ばさずにやりたいものです。';

  @override
  String get tourProgressHeightTitle => '現在の身長';

  @override
  String get tourProgressHeightDesc => 'いまの身長と合計の伸びを表示します。ここから新しい測定を追加できます。';

  @override
  String get tourProgressPhotosTitle => '記録写真';

  @override
  String get tourProgressPhotosDesc => '定期的に写真を撮って、見た目の変化を記録しよう。';

  @override
  String get tourProgressPostureTitle => '姿勢分析';

  @override
  String get tourProgressPostureDesc => '写真から姿勢を分析し、何に取り組むべきかがわかります。';

  @override
  String get tourAnalysisScoreTitle => 'あなたのBeTallerスコア';

  @override
  String get tourAnalysisScoreDesc => '遺伝・成長スピード・栄養・睡眠から計算した総合スコアです。';

  @override
  String get tourAnalysisPredictionTitle => 'あなたの身長予測';

  @override
  String get tourAnalysisPredictionDesc => '最終的な予測身長と、1年ごとの推移を表示します。';

  @override
  String get tourAnalysisPeerTitle => '同年代と比較';

  @override
  String get tourAnalysisPeerDesc => '同じ年齢の人たちと比べて、自分の位置を確認しよう。';

  @override
  String get tourHomeGoalsRoutinesTitle => 'ルーティン';

  @override
  String get tourHomeGoalsRoutinesDesc => '今日あといくつ運動ルーティンが残っているかを確認できます。';

  @override
  String get tourHomeGoalsChallengesTitle => 'タスク';

  @override
  String get tourHomeGoalsChallengesDesc => '進行中のチャレンジの進み具合をここで確認できます。';

  @override
  String get tourHomeGoalsWaterTitle => '水分目標';

  @override
  String get tourHomeGoalsWaterDesc => '1日の水分目標まであとどれくらいかを確認できます。';

  @override
  String get tourHomeReminderTitle => '次のリマインダー';

  @override
  String get tourHomeReminderDesc => '次のリマインダーがいつ届くかを確認し、ここから編集できます。';

  @override
  String get tourHomeChallengesTitle => 'チャレンジ';

  @override
  String get tourHomeChallengesDesc => '進行中のチャレンジを完了して、XPを追加でゲットしよう。';

  @override
  String get tourHomeGrowthTitle => '成長の状況';

  @override
  String get tourHomeGrowthDesc => '合計の伸びと前回の測定との差、記録した測定の回数を確認できます。';

  @override
  String get tourHomeExploreTitle => '探す';

  @override
  String get tourHomeExploreDesc => '栄養ガイドや成長レシピなどがここで待っています。';

  @override
  String get tourPlanProgramHeaderTitle => '70日間プログラム';

  @override
  String get tourPlanProgramHeaderDesc => 'このリングで、全体の進み具合と現在のレベル・日数を確認できます。';

  @override
  String get tourPlanProgramLevelsTitle => 'レベル';

  @override
  String get tourPlanProgramLevelsDesc => '10レベルのうちどこにいて、どれがまだロック中かを確認できます。';

  @override
  String get tourPlanNutritionHeaderTitle => '栄養の進み具合';

  @override
  String get tourPlanNutritionHeaderDesc => '毎日の栄養ルーティンをいくつ完了したかを確認できます。';

  @override
  String get tourPlanNutritionFirstTitle => '栄養ルーティン';

  @override
  String get tourPlanNutritionFirstDesc => '成長を支える食習慣をチェックしていこう。';

  @override
  String get tourProgressChartTitle => '成長曲線';

  @override
  String get tourProgressChartDesc => 'これまでの測定をグラフで見て、これからの方向をつかもう。';

  @override
  String get tourProgressReportTitle => '週間レポート';

  @override
  String get tourProgressReportDesc => '1週間の成長をまとめたレポートを確認しよう。';

  @override
  String get tourProgressHistoryTitle => '測定履歴';

  @override
  String get tourProgressHistoryDesc => '記録したすべての身長測定をタイムラインで確認できます。';

  @override
  String get tourAnalysisRadarTitle => 'バランスチャート';

  @override
  String get tourAnalysisRadarDesc =>
      '遺伝・成長スピード・栄養・睡眠・継続力のバランスをレーダーチャートで確認し、いちばんの弱点がわかります。';

  @override
  String get tourAnalysisDailyNeedsTitle => '1日に必要な量';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      '身長と体重に合わせた、1日に必要なたんぱく質・カロリー・睡眠・水分を確認できます。';

  @override
  String get journeyDataDoneTitle => '最初のステップ完了';

  @override
  String get journeyDataDoneSubtitle => 'データとポテンシャルがそろいました。次はアプリの紹介です。';

  @override
  String get journeyContinue => '次へ';

  @override
  String get journeyEnterApp => 'アプリをはじめる';

  @override
  String get journeyProgressLabel => 'はじめに';

  @override
  String get journeyTourDoneTitle => 'BeTallerへようこそ！';

  @override
  String get journeyTourDoneSubtitle =>
      '3つのステップをすべて完了しました。ここからはあなたの番。最初のルーティンを完了して、スタートを切ろう。';

  @override
  String get journeyViewPlansButton => 'プランを見て始めよう';

  @override
  String get paywallRestoreLabel => '購入を復元';

  @override
  String get paywallYearly => '年額';

  @override
  String get paywallBestValue => 'いちばんお得';

  @override
  String paywallSavePercent(String percent) {
    return '$percent%お得';
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
  String get paywallMonthly => '月額';

  @override
  String get paywallWeekly => '週額';

  @override
  String get paywallFreeTrial => '3日間無料';

  @override
  String get paywallLoadError => '購入オプションを読み込めませんでした。もう一度お試しください';

  @override
  String get paywallCtaAlt => '次へ';

  @override
  String get paywallTrialDisclaimer => '3日間無料・その後自動更新・いつでも解約可能';

  @override
  String get paywallYearlyDisclaimer => '毎年自動更新・いつでも解約可能';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days日間無料、その後$price/週・いつでも解約可能';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days日間無料、その後$price/月・いつでも解約可能';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days日間無料、その後$price/年・いつでも解約可能';
  }

  @override
  String get paywallRenewsWeekly => '毎週自動更新・いつでも解約可能';

  @override
  String get paywallRenewsMonthly => '毎月自動更新・いつでも解約可能';

  @override
  String get resultCardTitle => '大人になったときの予測身長';

  @override
  String resultRange(String min, String max) {
    return '予測範囲：$min〜$max';
  }

  @override
  String resultPercentile(String percent) {
    return '同じ年齢の人の$percent%より高い';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'これからの伸び（推定）：$amount';
  }

  @override
  String get resultFootnote => '両親の身長と成長曲線のデータにもとづく推定です。医療上のアドバイスではありません。';

  @override
  String get postureCheckTitle => 'かんたん姿勢チェック';

  @override
  String get postureCheckIntro =>
      'かかと・お尻・肩甲骨を壁につけて立ち、3つの質問に答えてください。スコアは回答から計算され、写真はビフォー・アフターの比較用に保存されます。';

  @override
  String get postureQHead => 'あごを上げずに、後頭部が壁につきますか？';

  @override
  String get postureQHeadA1 => 'はい、らくにつく';

  @override
  String get postureQHeadA2 => '頭を後ろに押せばつく';

  @override
  String get postureQHeadA3 => 'いいえ、すき間がある';

  @override
  String get postureQShoulders => '横からの写真で、肩は耳と比べてどこにありますか？';

  @override
  String get postureQShouldersA1 => '耳と一直線';

  @override
  String get postureQShouldersA2 => '少し前に出ている';

  @override
  String get postureQShouldersA3 => 'はっきり前に丸まっている';

  @override
  String get postureQLowerBack => '腰の後ろに手を入れてみて。すき間はどれくらい？';

  @override
  String get postureQLowerBackA1 => '手のひらがちょうど入る';

  @override
  String get postureQLowerBackA2 => 'まったくすき間がない';

  @override
  String get postureQLowerBackA3 => 'こぶしが入る';

  @override
  String get postureCheckSave => 'スコアを見る';

  @override
  String get postureCheckNote => 'セルフチェックであり、医学的な評価ではありません。';

  @override
  String get paywallTester => 'テスター';

  @override
  String get introTag1 => '予測';

  @override
  String get introTag2 => '成長';

  @override
  String get introTag3 => '記録';

  @override
  String get introTag4 => 'ゲーム感覚';

  @override
  String get introTag5 => 'コミュニティ';

  @override
  String get introTitle1 => '身長のポテンシャルを\n見つけよう';

  @override
  String get introSubtitle1 => '遺伝・年齢・生活習慣から\nあなたのポテンシャルを計算します。';

  @override
  String get introTitle2 => '毎日、一歩ずつ\n高みへ';

  @override
  String get introSubtitle2 => 'あなた専用の運動と栄養のプランで\nポテンシャルを引き出そう。';

  @override
  String get introTitle3 => '1センチも\n見逃さない';

  @override
  String get introSubtitle3 => '毎月の測定で、本当の成長が\nどう進んでいるかを確認しよう。';

  @override
  String get introTitle4 => 'レベルアップして\nごほうびをゲット';

  @override
  String get introSubtitle4 => '70日間プログラムを完了して\nXPを集め、新しいレベルを解放しよう。';

  @override
  String get introTitle5 => 'すでに何千人もが\n背を伸ばしています';

  @override
  String get introSubtitle5 => '目標を達成したユーザーの\nコミュニティに参加しよう。';

  @override
  String get criticalWindow => '大切な時期';

  @override
  String get heightPotentialFading => 'あなたの身長のポテンシャル、';

  @override
  String get fadingAway => 'その真実..';

  @override
  String get painHookDesc =>
      '正しい習慣がないまま日が過ぎると、伸びるはずのセンチが失われていきます。でも、今からでも取り戻せます。';

  @override
  String get painGeneticTitle => '遺伝がすべてではない';

  @override
  String get painGeneticDesc =>
      '遺伝で決まるのは60%。残りの40%はあなたの行動次第です。BeTallerはまさにその40%のためにあります。';

  @override
  String get painGeneticTag => '分析';

  @override
  String get painSleepTitle => '睡眠リズムを整えよう';

  @override
  String get painSleepDesc =>
      '毎晩しっかり眠ると、成長ホルモンの分泌が70%増えることも。睡眠の記録はBeTallerにおまかせ。あなたは眠るだけ。';

  @override
  String get painSleepTag => '記録';

  @override
  String get painPostureTitle => '姿勢で今すぐ数センチ高く';

  @override
  String get painPostureDesc =>
      '姿勢を正すと、すぐに1.5〜3 cm高く見えます。BeTallerの毎日の姿勢ルーティンで、数週間で身につきます。';

  @override
  String get painPostureTag => '姿勢';

  @override
  String get painExerciseTitle => 'あなた専用の運動プランが完成';

  @override
  String get painExerciseDesc =>
      '朝のストレッチ、ぶら下がり、背骨のルーティン。BeTallerが準備してスケジュールしました。1日たった8〜12分。';

  @override
  String get painExerciseTag => 'ルーティン';

  @override
  String get painNutritionTitle => '食事は成長に直接影響する';

  @override
  String get painNutritionDesc =>
      'たんぱく質、カルシウム、ビタミンD。どの栄養をいつ摂るか、BeTallerが毎日お知らせします。';

  @override
  String get painNutritionTag => '栄養';

  @override
  String get painTrackingTitle => '成長を自分の目で確かめよう';

  @override
  String get painTrackingDesc => '毎月の測定、記録写真、成長グラフ。伸びた1センチをすべて確認できます。';

  @override
  String get painTrackingTag => '成長';

  @override
  String get selectYourGender => '性別を選んでください';

  @override
  String get onboardingPredictSubtitle => '身長のポテンシャルの予測と、あなた専用プランの作成に使います。';

  @override
  String get other => 'その他';

  @override
  String get whenWereYouBorn => '生年月日は？';

  @override
  String get heightAndWeight => '身長と体重';

  @override
  String get parentsHeight => '両親の身長';

  @override
  String get weeklyWorkout => '週の運動';

  @override
  String get workoutsPerWeek => '週の運動回数';

  @override
  String get whatsYourEthnicity => 'あなたのルーツは？';

  @override
  String get whiteCaucasian => '白人';

  @override
  String get blackAfricanAmerican => '黒人／アフリカ系';

  @override
  String get hispanicLatino => 'ヒスパニック／ラテン系';

  @override
  String get asian => 'アジア系';

  @override
  String get middleEasternIndigenous => '中東系／先住民';

  @override
  String get dontWantToAnswer => '答えたくない';

  @override
  String get footSizeLabel => '足のサイズ';

  @override
  String get selectYourSize => 'サイズを選んでください';

  @override
  String get whatsYourDreamHeight => '理想の身長は？';

  @override
  String get dreamHeightCalcSubtitle => '入力内容から、この身長に届く可能性を計算します。';

  @override
  String get dreamHeightLabel => '理想の身長';

  @override
  String get sleepQuestion => '毎晩何時間\n眠っていますか？';

  @override
  String get thousandsSucceeded => '何千人もが\n成功';

  @override
  String get youCanToo => 'あなたにもできる';

  @override
  String get yearsOld => '歳';

  @override
  String get verifiedLabel => '確認済み';

  @override
  String get scientificData => '科学データ';

  @override
  String get longTermResults => 'BeTallerは\n長期的な結果を生む';

  @override
  String get longTermResultsSubtitle => '多くの人が、悪い習慣のせいで本来の身長に届いていません。';

  @override
  String get yourFinalHeight => '最終的な身長';

  @override
  String get badHabitsLegend => '悪い習慣';

  @override
  String get optimizedLegend => '最適化';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => '習慣で変えられる\n身長の割合';

  @override
  String get chartFact2Pct => '9〜10時間';

  @override
  String get chartFact2Desc => '理想の睡眠で\n成長ホルモンアップ';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => '姿勢の改善で\n高く見せられる';

  @override
  String get didYouKnow => '知ってた？';

  @override
  String get didYouKnowFact1 => '毎日の習慣は身長の30%に影響します';

  @override
  String get didYouKnowFact2 => '背骨の圧迫で身長が1.5〜3 cm低くなります';

  @override
  String get didYouKnowFact3 => '睡眠不足で成長ホルモンが70%減ります';

  @override
  String get transformJourneyBegins => 'あなたの変化が\nここから始まる';

  @override
  String get transformJourneySubtitle => '健やかな成長を一歩ずつ支える\n総合プログラムです。';

  @override
  String get week1Label => '1週';

  @override
  String get week1Title => '1週目';

  @override
  String get week1Desc => '背骨の並びが整い、姿勢がよくなる';

  @override
  String get month1Label => '1か月';

  @override
  String get month1Title => '1か月目';

  @override
  String get month1Desc => '目に見える最初の変化、睡眠の質が向上';

  @override
  String get month3Label => '3か月';

  @override
  String get month3Title => '3か月目';

  @override
  String get month3Desc => '平均+1.5〜2.5 cm、筋肉の発達';

  @override
  String get month6Label => '6か月';

  @override
  String get month6Title => '6か月目';

  @override
  String get month6Desc => 'ポテンシャルを最大限に、新しい身長で過ごそう';

  @override
  String get reachYourGoal => '目標を達成しよう';

  @override
  String get journeyBullet1 => '最大のポテンシャルを引き出す';

  @override
  String get journeyBullet2 => '新しい身長での毎日を始める';

  @override
  String get journeyBullet3 => 'あなたの成功ストーリーを書こう';

  @override
  String get unlockButton => 'すべて解放';

  @override
  String get dreamHeightOdds => '理想の身長に\n届く確率';

  @override
  String get growthCompleteLabel => '成長の\n達成度';

  @override
  String get tallerThanPct => '同じ年齢の76.7%より高い';

  @override
  String get levelNovice => 'ルーキー';

  @override
  String get levelBuilder => 'ビルダー';

  @override
  String get levelGrinder => '努力家';

  @override
  String get levelWarrior => 'ウォリアー';

  @override
  String get levelGodTier => '神レベル';

  @override
  String get levelDesc0 => '土台をつくる';

  @override
  String get levelDesc1 => '成長を加速';

  @override
  String get levelDesc2 => 'トレーニングを強化';

  @override
  String get levelDesc3 => '限界に挑む';

  @override
  String get levelDesc4 => '努力なくして成果なし';

  @override
  String get levelDesc5 => 'チャンピオンの心';

  @override
  String get levelDesc6 => 'エリートの実力';

  @override
  String get levelDesc7 => '体を極める';

  @override
  String get levelDesc8 => '伝説の継続力';

  @override
  String get levelDesc9 => 'ポテンシャルを最大に';

  @override
  String levelLabel(int level) {
    return 'レベル $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
      one: '$days日',
    );
    return 'プログラム残り$_temp0';
  }

  @override
  String get tapLabel => 'タップ';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => '日';

  @override
  String get legendShort => '低い';

  @override
  String get legendBelowAvg => '平均以下';

  @override
  String get legendAverage => '平均';

  @override
  String get legendTall => '高い';

  @override
  String get legendVeryTall => 'とても高い';

  @override
  String get pctBottom5 => '下位5%';

  @override
  String get pctBottom25 => '下位25%';

  @override
  String get pctMedian => '中央値';

  @override
  String get pctTop25 => '上位25%';

  @override
  String get pctTop5 => '上位5%';

  @override
  String get fallingBehind => '遅れぎみ';

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes分で読めます';
  }

  @override
  String get inThisArticle => 'この記事の内容';

  @override
  String get nextArticle => '次の記事';

  @override
  String get purchaseUnavailable => '購入を完了できませんでした。もう一度お試しください。';

  @override
  String get viewPlan => 'プランを見る';

  @override
  String get viewPlanSubtitle => 'サブスクリプションの詳細を確認';

  @override
  String predictionConfidenceHint(String percent) {
    return '身長の測定を追加すると、予測の信頼度が$percent%に上がります';
  }

  @override
  String get paywallSlideHomeTitle => '1日をひとつの画面に';

  @override
  String get paywallSlideHomeCaption => 'ルーティン・水分・睡眠、3つのリングを完成させよう。';

  @override
  String get paywallSlideProgressTitle => '1センチも見逃さない';

  @override
  String get paywallSlideProgressCaption => '測定するたびにすぐ曲線に反映。';

  @override
  String get paywallSlideAnalysisTitle => '5つの指標をひとつの形に';

  @override
  String get paywallSlideAnalysisCaption => 'レーダーチャートがいちばんの弱点を教えてくれます。';

  @override
  String get paywallSlidePotentialTitle => '自分のポテンシャルを知ろう';

  @override
  String get paywallSlidePotentialCaption => '同年代の中での自分の位置がわかります。';

  @override
  String get paywallSlideDisciplineTitle => '連続記録をキープ';

  @override
  String get paywallSlideDisciplineCaption => '毎日の積み重ねでレベルアップ。';

  @override
  String get paywallSlideRemindersTitle => 'ちょうどいい時間にお知らせ';

  @override
  String get paywallSlideRemindersCaption => '時間を決めれば、あとはアプリにおまかせ。';

  @override
  String get paywallSlidePostureTitle => '姿勢を整えよう';

  @override
  String get paywallSlidePostureCaption => '横からの写真、かんたんセルフチェック、わかりやすいルーティン。';

  @override
  String paywallTrialHeadline(String days) {
    return '$days日間無料';
  }

  @override
  String paywallTrialThen(String price) {
    return 'その後$price・いつでも解約可能';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / 年・いつでも解約可能';
  }

  @override
  String get obBedtimeTitle => 'いつも何時に寝ますか？';

  @override
  String get obBedtimeSubtitle => 'この時間に合わせて睡眠リマインダーを設定します。';

  @override
  String get obWorkoutTimeTitle => '何時に運動しますか？';

  @override
  String get obWorkoutTimeSubtitle => 'トレーニングのリマインダーをちょうどいい時間に届けます。';

  @override
  String get obMealsTitle => '1日に何食食べますか？';

  @override
  String get obMealsSubtitle => '時間をタップして、自分の生活に合わせて調整しよう。';

  @override
  String obMealsCount(String count) {
    return '$count食';
  }

  @override
  String obMealLabel(String n) {
    return '$n食目';
  }

  @override
  String get obProteinTitle => '1日にたんぱく質を何g摂っていますか？';

  @override
  String get obProteinSubtitle => 'だいたいの数字でOK。それをもとにプランを作ります。';

  @override
  String get obCaloriesTitle => '1日の平均カロリーは？';

  @override
  String get obCaloriesSubtitle => '目安で大丈夫。あとで一緒に調整できます。';

  @override
  String get obNotSure => 'わからない';

  @override
  String get silNow => '現在';

  @override
  String get silPotential => 'ポテンシャル';

  @override
  String get chartMeasured => 'あなたの測定';

  @override
  String chartPotential(String height) {
    return 'ポテンシャル $height';
  }

  @override
  String chartDream(String height) {
    return '目標 $height';
  }

  @override
  String get targetsTitle => '今日のあなたへ';

  @override
  String get targetsSubtitle => '年齢・体重・トレーニングから計算しました。';

  @override
  String get targetProtein => 'たんぱく質';

  @override
  String get targetCalcium => 'カルシウム';

  @override
  String get targetVitaminD => 'ビタミンD';

  @override
  String get targetWater => '水分';

  @override
  String get targetSleep => '睡眠';

  @override
  String get targetMove => 'トレーニング';

  @override
  String targetPerMeal(String g) {
    return '1食あたり$g g';
  }

  @override
  String get unitHours => '時間';

  @override
  String get unitMinutes => '分';

  @override
  String get planStrength => '筋トレ';

  @override
  String get planJump => 'ジャンプ＆ダッシュ';

  @override
  String get planMobility => 'ストレッチ';

  @override
  String get planSport => 'スポーツ';

  @override
  String get planPosture => '姿勢';

  @override
  String get planRest => '休み';

  @override
  String planWeekTitle(int days) {
    return '今週：トレーニング$days日';
  }

  @override
  String get planPreviewTitle => 'プランが完成しました';

  @override
  String planPreviewTraining(int days) {
    return '成長のために組んだ、週$days日のトレーニング';
  }

  @override
  String planPreviewProtein(int grams) {
    return '1日$grams gのたんぱく質を、食事ごとに分けて';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours時間の睡眠と、就寝リマインダー';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return '今日：$plan・$minutes分';
  }

  @override
  String get nRestTitle => '今日は休息日';

  @override
  String get nRestBody => '10分のストレッチで十分。回復もプランの一部です。';

  @override
  String nProteinTitle(int grams) {
    return '今日のたんぱく質目標：$grams g';
  }

  @override
  String nProteinBody(int grams) {
    return '1食あたり約$grams g：卵、ヨーグルト、鶏肉、レンズ豆など。';
  }

  @override
  String nWaterTitle(String liters) {
    return '水分目標：$liters';
  }

  @override
  String get nWaterBody => '今1杯飲めば、今日のペースをキープできます。';

  @override
  String get nSleepTitle => 'そろそろリラックスの時間';

  @override
  String nSleepBody(String hours) {
    return '目標は$hours時間。画面を消して、明かりを落とそう。';
  }

  @override
  String nMeasureBody(String potential) {
    return 'あなたのポテンシャル：$potential。朝に測って、グラフの変化を見よう。';
  }

  @override
  String get nTrialDay1Title => 'プランが待っています';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return '今日：$plan、$minutes分。身長を記録してグラフをスタートしよう。';
  }

  @override
  String get nTrialEndTitle => '無料トライアルは明日で終了します';

  @override
  String nTrialEndBody(String price) {
    return 'その後は$priceで継続されます。どちらの場合も、プランと記録は保存されたままです。';
  }

  @override
  String get trophyContinue => '続ける';

  @override
  String get guideSteps => '手順';

  @override
  String get guideMistakes => 'よくある間違い';

  @override
  String get guideTip => 'ヒント';

  @override
  String get homeHeroTitle => 'あなたの身長とポテンシャル';

  @override
  String homeHeroGap(String cm) {
    return 'あと$cmの伸びしろ';
  }

  @override
  String get anSubtitle => 'スコア、その決め手、そしてこれから';

  @override
  String get anScoreLabel => 'BeTallerスコア';

  @override
  String get anTierStarting => 'スタート';

  @override
  String get anTierBuilding => '積み上げ中';

  @override
  String get anTierRising => '上昇中';

  @override
  String get anTierStrong => '好調';

  @override
  String get anTierPeak => 'ピーク';

  @override
  String anTrendUp(int n) {
    return '先週より+$n';
  }

  @override
  String anTrendDown(int n) {
    return '先週より-$n';
  }

  @override
  String get anTrendFlat => '先週と同じ';

  @override
  String get anTrendFirst => '週ごとの推移は来週から表示されます';

  @override
  String anNextTier(int n, String tier) {
    return '$tierまであと$nポイント';
  }

  @override
  String get anTopTier => '最高ランク。このままキープ';

  @override
  String anCoverage(int n, int total) {
    return '$total項目中$n項目にもとづく';
  }

  @override
  String get anNoScoreTitle => 'まだデータが足りません';

  @override
  String get anNoScoreBody => '今日、睡眠・水分・トレーニングのどれかを記録すると、最初のスコアが表示されます。';

  @override
  String get anFastestWin => 'いちばんの近道';

  @override
  String get anBreakdownTitle => 'スコアの内訳';

  @override
  String get anBreakdownHint => '各項目はあなた自身のデータから0〜100で採点されます。％はその項目の比重です。';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'まだデータなし';

  @override
  String get anNotCounted => '対象外';

  @override
  String get anFTraining => 'トレーニング';

  @override
  String get anFConsistency => '継続';

  @override
  String get anFSleep => '睡眠';

  @override
  String get anFHydration => '水分';

  @override
  String get anFNutrition => '栄養';

  @override
  String get anFPosture => '姿勢';

  @override
  String get anFMeasuring => '測定';

  @override
  String get anFGrowth => '成長スピード';

  @override
  String get anFHeadroom => '伸びしろ';

  @override
  String anBTraining(int done, int planned) {
    return '直近7日間で、予定$planned日中$done日トレーニング';
  }

  @override
  String get anBTrainingNone => '週のプランに対して、トレーニングした日数を数えます。';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak日',
      one: '$streak日',
    );
    return '連続$_temp0、$days日中$active日でプランの半分以上を完了';
  }

  @override
  String get anBConsistencyNone => '連続記録と、プランの半分以上を完了した日数を数えます。';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days晩',
      one: '$days晩',
    );
    return '平均$hours時間/晩、目標$target時間、$_temp0記録';
  }

  @override
  String get anBSleepNone => '直近7日間に睡眠の記録がありません。';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
      one: '$days日',
    );
    return '平均$litres/日、目標$target、$_temp0記録';
  }

  @override
  String get anBHydrationNone => '直近7日間に水分の記録がありません。';

  @override
  String anBNutrition(int done, int planned) {
    return '直近7日間で、栄養習慣$planned個中$done個を完了';
  }

  @override
  String get anBNutritionNone => 'プランに含まれるたんぱく質・カルシウム・亜鉛・ビタミンDの習慣を数えます。';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日前',
      one: '$days日前',
    );
    return '壁セルフチェック $raw/90、$_temp0';
  }

  @override
  String anBPostureToday(int raw) {
    return '壁セルフチェック $raw/90、今日';
  }

  @override
  String get anBPostureNone => 'まだ姿勢のセルフチェックをしていません。';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日前',
      one: '$days日前',
    );
    return '最後の測定は$_temp0';
  }

  @override
  String get anBMeasuringToday => '今日測定済み';

  @override
  String get anBMeasuringNone => 'まだ測定していません。';

  @override
  String anBGrowth(String v, String e) {
    return '年$v、あなたの年齢の目安は$e';
  }

  @override
  String get anBGrowthNone => '30日以上あけた2回の測定が必要です。';

  @override
  String get anBGrowthAdult => '成長板はふつう21歳までに閉じるため、成長スピードはスコアに含まれません。';

  @override
  String anBHeadroom(String cm) {
    return '今日からポテンシャルまで$cm';
  }

  @override
  String get anATraining => '今日のトレーニングを始める';

  @override
  String get anAConsistency => '今日のプランの半分を終える';

  @override
  String get anASleepLog => '昨夜の睡眠を記録する';

  @override
  String anASleep(String target) {
    return '今夜は$target時間眠る';
  }

  @override
  String get anAHydrationLog => '水を1杯記録する';

  @override
  String anAHydration(String left) {
    return '今日あと$left飲む';
  }

  @override
  String get anAHydrationDone => '今日の目標達成。明日も同じように';

  @override
  String get anANutrition => '今日の栄養習慣をチェックする';

  @override
  String get anAPostureFirst => '1分の姿勢セルフチェックをする';

  @override
  String get anAPostureRedo => '姿勢セルフチェックをやり直す';

  @override
  String get anAPostureKeep => '毎日の姿勢ルーティンを続ける';

  @override
  String get anAMeasure => '今すぐ身長を測る';

  @override
  String get anAMeasureKeep => '来週また測る';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日後',
      one: '$days日後',
    );
    return '$_temp0にまた測る';
  }

  @override
  String get anAGrowth => '2週間ごとに測って追跡する';

  @override
  String get anAHeadroom => 'ポテンシャルを見る';

  @override
  String get anPotentialTitle => 'あなたのポテンシャル';

  @override
  String get anPotentialLabel => '大人になったときの予測身長';

  @override
  String anPotentialToGo(String cm) {
    return 'あと+$cm';
  }

  @override
  String get anPotentialReached => '予測身長に到達しています';

  @override
  String get anPotentialNote => 'アプリ内のどこでも同じ数字です。上がることはあっても下がりません。';

  @override
  String anDreamLine(String h) {
    return '目標：$h';
  }

  @override
  String get anSourcesTitle => 'そのセンチはどこから来る？';

  @override
  String get anSourcesGenes => '遺伝と年齢';

  @override
  String get anSourcesHabits => '睡眠・食事・トレーニング';

  @override
  String get anSourcesPosture => '姿勢';

  @override
  String get anPctTitle => '年齢別の身長';

  @override
  String anPctValue(int p) {
    return '同じ年齢の人の$p%より高い';
  }

  @override
  String get anPctBasis => '米国CDC成長曲線、同じ年齢・性別';

  @override
  String get anPctMore => '詳しく比較';

  @override
  String get anNeedsBasis => '年齢・体重・トレーニングから計算';

  @override
  String get anCalcium => 'カルシウム';

  @override
  String get anVitaminD => 'ビタミンD';

  @override
  String get anMovement => '運動';

  @override
  String get anUnitMin => '分';

  @override
  String get anUnitHours => '時間';

  @override
  String get anPerDay => '/日';

  @override
  String get anPerNight => '/晩';

  @override
  String get anUnlockScoreTitle => 'BeTallerスコアのすべて';

  @override
  String get anUnlockScoreBody => 'スコア、その元になる9項目、そして次にやるべきこと。';

  @override
  String get anUnlockSourcesTitle => 'あなたのセンチがどこから来るかを見る';

  @override
  String get anUnlockNeedsTitle => 'あなたに合わせた1日の必要量';

  @override
  String get anUnlockCta => '解放する';

  @override
  String get anFlowResultTitle => 'グラフに保存しました';

  @override
  String get anFlowResultBody => '過去の身長が、測定やポテンシャルと同じ曲線に表示されるようになりました。';

  @override
  String get anFlowOpenAnalysis => '分析を開く';

  @override
  String anTopPct(int p) {
    return '上位$p%';
  }

  @override
  String get anNeedsTitle => '1日に必要な量';

  @override
  String get pgUnlockPro => 'Proで解放';

  @override
  String get pgPhotosLockedTitle => '自分の変化を見よう';

  @override
  String get pgPhotosLockedBody => '2週間ごとに身長つきで写真を保存し、好きな2枚をスライダーで比較できます。';

  @override
  String get pgTransformationTitle => 'あなたの変化';

  @override
  String get pgHeightChange => '身長の変化';

  @override
  String get pgDaysApart => '日の間隔';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
      one: '$days日',
    );
    return '$_temp0の間隔で撮った2枚の写真で$deltaの差。';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
      one: '$days日',
    );
    return '$_temp0の間隔で身長は同じ。姿勢や体つきが先に変わり、身長は数か月かけてついてきます。';
  }

  @override
  String get pgModeSlider => 'スライダー';

  @override
  String get pgModeSideBySide => '並べて表示';

  @override
  String get pgDragToReveal => 'ドラッグして比較';

  @override
  String get pgOnePhotoTitle => 'ビフォー写真を保存しました';

  @override
  String pgOnePhotoBody(String date) {
    return '$dateに同じポーズで次の写真を撮ると、最初の比較が見られます。';
  }

  @override
  String get pgEmptyTitle => '変化の記録を始めよう';

  @override
  String get pgEmptyBody =>
      '2週間に1枚、同じポーズ・同じ場所で、身長と一緒に。数か月後には1日目と今日をスライドで見比べられます。';

  @override
  String get pgTakeFirstPhoto => '最初の写真を撮る';

  @override
  String get pgPhotoDueNow => '新しい写真を撮る時期です';

  @override
  String pgNextPhotoOn(String date) {
    return '次の写真：$date';
  }

  @override
  String pgDayN(int n) {
    return '$n日目';
  }

  @override
  String get pgNewPhoto => '新しい写真';

  @override
  String get pgGuideTitle => '毎回同じポーズで';

  @override
  String get pgGuideSubtitle => '同じ撮り方をしてこそ、写真をきちんと比較できます。';

  @override
  String get pgGuideGhost => '前回の写真がうっすら表示されます。それに体を合わせよう。';

  @override
  String get pgGuideStep1 => '2 m離れて、スマホは胸の高さに';

  @override
  String get pgGuideStep2 => 'カメラに正面を向け、足をそろえて腕の力を抜く';

  @override
  String get pgGuideStep3 => '同じ場所、同じ明るさ、体にフィットした服で';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => '胸の高さ';

  @override
  String get pgTakePhoto => '写真を撮る';

  @override
  String get pgFromGallery => 'ギャラリーから選ぶ';

  @override
  String get pgChoosePhoto => '写真を選ぶ';

  @override
  String get pgPostureTitle => '姿勢チェック';

  @override
  String get pgPostureLockedTitle => '弱点を見つけよう';

  @override
  String get pgPostureLockedBody =>
      '頭・肩・腰を採点し、それぞれに2つのエクササイズを提案。スコアの推移も週ごとに確認できます。';

  @override
  String get pgAreaHead => '頭';

  @override
  String get pgAreaShoulders => '肩';

  @override
  String get pgAreaLowerBack => '腰';

  @override
  String get pgHeadMeaning0 => '頭がちょうど肩の真上にあります。毎日の短いリセットでキープしよう。';

  @override
  String get pgHeadMeaning1 => '力を抜くと頭が前に出がちです。スマホを長く使う人によくあることで、すぐに改善できます。';

  @override
  String get pgHeadMeaning2 => '頭が肩より前に出ています。まずここを直そう。どの写真でも背が低く見える原因になります。';

  @override
  String get pgShouldersMeaning0 => '肩が耳と一直線です。背中の上部がしっかり働いています。';

  @override
  String get pgShouldersMeaning1 =>
      '肩が少し前に出ています。胸の筋肉が硬いと肩が引っぱられます。胸をひらけば元に戻ります。';

  @override
  String get pgShouldersMeaning2 => '肩が丸まっています。背中の上部が前に曲がり、立ち姿の身長を低く見せています。';

  @override
  String get pgLowerBackMeaning0 => '自然なカーブです。股関節と体幹が背骨を正しい位置に保っています。';

  @override
  String get pgLowerBackMeaning1 =>
      '腰が平らになっています。やさしく反らす運動と可動域のトレーニングで、自然なカーブが戻ります。';

  @override
  String get pgLowerBackMeaning2 =>
      '反りが強めです。股関節の前側の筋肉が硬いと骨盤が前に傾きます。ストレッチと体幹の強化で整えよう。';

  @override
  String get pgLegacyMeaning =>
      'これらの質問がない旧バージョンで保存されました。この部位のアドバイスを見るには、もう一度チェックしてください。';

  @override
  String get pgHowItWorks => 'チェックのしくみ';

  @override
  String get pgYourPosture => 'あなたの姿勢';

  @override
  String pgCheckedOn(String date) {
    return '$dateにチェック';
  }

  @override
  String get pgOutOf100 => '/100';

  @override
  String get pgAllAreasGood => '3つの部位すべて良好です。この状態をキープしよう。';

  @override
  String pgStartWith(String area) {
    return 'まずはここから：$area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '前回のチェックより$delta';
  }

  @override
  String get pgStatusGood => '良好';

  @override
  String get pgStatusFair => 'もう少し';

  @override
  String get pgStatusFix => '最優先で改善';

  @override
  String get pgKeepItWith => 'キープするには';

  @override
  String get pgFixItWith => '改善するには';

  @override
  String get pgRetakeNow => '週に一度のチェックの時間です';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: '次のチェック：$n日後',
      one: '次のチェック：明日',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue => '同じ壁で、同じ3つの質問に。毎週チェックすると、エクササイズの効果がわかります。';

  @override
  String pgRetakeBodyWait(String date) {
    return '$dateまで上のエクササイズを続けてから、もう一度チェックして効果を確かめよう。';
  }

  @override
  String get pgRetakeCheck => 'もう一度チェック';

  @override
  String get pgRetakeAnyway => '今すぐチェック';

  @override
  String get pgHistoryTitle => 'スコアの推移';

  @override
  String pgSinceFirst(String delta) {
    return '初回から$delta';
  }

  @override
  String get pgHistoryOne => 'これが初めてのチェックです。7日後にもう一度チェックすると、ここから推移が始まります。';

  @override
  String get pgPostureIntroTitle => 'どれくらいまっすぐ立てている？';

  @override
  String get pgPostureIntroBody =>
      '壁を使った3つの質問で、約1分。スコアと、弱点ごとに改善する2つのエクササイズがわかります。';

  @override
  String get pgPostureStep1 => 'かかと・お尻・肩甲骨を壁につけて立ちます。';

  @override
  String get pgPostureStep2 => 'あとで見返せるよう、全身が入るように横から写真を撮ります。';

  @override
  String get pgPostureStep3 => '3つの質問に正直に答えます。スコアは回答から計算されます。';

  @override
  String get pgPostureStep4 => '週に1回、同じ時間帯にもう一度チェックしよう。';

  @override
  String get pgStartCheck => '姿勢チェックを始める';

  @override
  String pgWeekRange(String start, String end) {
    return '$start〜$end';
  }

  @override
  String get pgGradeGreat => 'チャンピオン級の1週間';

  @override
  String get pgGradeGood => '充実した1週間';

  @override
  String get pgGradeOk => 'エンジンがかかってきた';

  @override
  String get pgGradeStart => '新しいスタート';

  @override
  String get pgTopWeek => '最高の週';

  @override
  String pgVsLastWeek(String delta) {
    return '先週より$delta';
  }

  @override
  String get pgDaysCompleted => 'プランを完了した日';

  @override
  String get pgDayStreak => '日連続';

  @override
  String pgBestDay(String day) {
    return 'ベスト：$day';
  }

  @override
  String get pgNextWeekFocus => '来週のフォーカス';

  @override
  String pgFocusPlan(int n, int done) {
    return '$n日間プランをすべて完了しよう。今週は$done日でした。';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'トレーニングを$n回入れよう。今週は$done回でした。';
  }

  @override
  String get pgFocusMeasure => '朝、裸足で、同じ場所で身長を1回測ろう。それが本当の変化を見る方法です。';

  @override
  String pgFocusKeepDay(String day) {
    return '目標はすべて達成。次は$dayもフルで完了しよう。';
  }

  @override
  String get pgFocusKeep => '目標はすべて達成、毎日フルで完了。同じプラン、同じリズムで。';

  @override
  String get pgHeightThisWeek => '今週の身長';

  @override
  String pgHeightNow(String height) {
    return '現在 $height';
  }

  @override
  String get pgNoMeasurementWeek => '今週はまだ測定していません';

  @override
  String get pgFirstMeasurement => '初めての測定';

  @override
  String pgStartedAt(String height) {
    return 'スタート $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'ポテンシャル $height';
  }

  @override
  String pgToPotential(String cm) {
    return '予測ポテンシャルまであと$cm。';
  }

  @override
  String get pgPotentialReached => '予測ポテンシャルに到達しています。姿勢の改善で、見た目の身長はまだ伸ばせます。';

  @override
  String get pgHabitsToday => '今日の記録';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves種目・$minutes分';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total 完了';
  }

  @override
  String get plStartWorkout => 'トレーニング開始';

  @override
  String get plContinueWorkout => 'トレーニングを再開';

  @override
  String get plWorkoutDoneToday => '今日のトレーニングは完了';

  @override
  String get plTraining => 'トレーニング';

  @override
  String get plHabits => '毎日の習慣';

  @override
  String get plRestDayNote => '軽めの日：短いヨガで体をほぐして、明日に備えよう。';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets × $reps回';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets × $seconds秒';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets × 左右各$seconds秒';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes分';
  }

  @override
  String plHabitProtein(int grams) {
    return '食事全体で$grams g';
  }

  @override
  String plHabitWater(String liters) {
    return '1日を通して$liters';
  }

  @override
  String plHabitSleep(String hours) {
    return '今夜$hours時間';
  }

  @override
  String get plYourRoutines => 'あなたのルーティン';

  @override
  String get plNewRoutine => '新しいルーティン';

  @override
  String get plCustomEmpty => '自分だけのルーティンを作って、毎日ここでチェックしよう。';

  @override
  String plDeleteRoutineQ(String name) {
    return '「$name」を削除しますか？';
  }

  @override
  String get plHoldToDelete => 'ルーティンを長押しすると削除できます。';

  @override
  String plSetOf(int current, int total) {
    return 'セット $current/$total';
  }

  @override
  String get plRest => '休憩';

  @override
  String get plStartSet => 'セット開始';

  @override
  String get plSetDone => 'セット完了';

  @override
  String get plSkipRest => '休憩をスキップ';

  @override
  String get plNextMove => '次の種目';

  @override
  String get plSkipMove => 'スキップ';

  @override
  String plUpNext(String name) {
    return '次：$name';
  }

  @override
  String get plLastMove => '最後の種目';

  @override
  String get plWorkoutComplete => 'トレーニング完了';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '約$minutes分で$moves種目。1回1回が積み重なります。';
  }

  @override
  String get plEachSide => '左右それぞれ';

  @override
  String get plMoveDone => '種目完了';

  @override
  String plRepsBig(int reps) {
    return '$reps回';
  }

  @override
  String get plSessionHint => '自分のペースで進めて、終わったら完了をタップ。';

  @override
  String plProgramDayOf(int day, int total) {
    return '$total日中$day日目';
  }

  @override
  String get plTodayStep => '今日のステップ';

  @override
  String get plTickToComplete => 'すべての種目をチェックして、今日を完了しよう';

  @override
  String plNextDayTomorrow(int day) {
    return '$day日目は明日解放されます。休むことも成長の一部です。';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days日',
      one: '$days日',
    );
    return 'レベル$levelまであと$_temp0';
  }

  @override
  String get plProgramFinished => '70日間すべて完了。プログラムを達成しました。';

  @override
  String plDayCompleteToast(int day) {
    return '$day日目完了';
  }

  @override
  String get plLevelWeek => 'このレベルの1週間';

  @override
  String get plProgressionTitle => 'どう難しくなっていく？';

  @override
  String get plNow => 'いま';

  @override
  String plLevelN(int n) {
    return 'Lv $n';
  }

  @override
  String get plUnlockProgram => '70日間プログラムを解放';

  @override
  String get plProgramPitch =>
      '10レベルを1週間に1つずつ。レベルごとにキープの秒数やジャンプの回数が増え、準備ができたらセットも増えます。';

  @override
  String plDayLocked(int day) {
    return '先に$day日目を完了しよう';
  }

  @override
  String plCurrentDay(int day) {
    return '$day日目';
  }

  @override
  String get plTodaysTargets => '今日の目標';

  @override
  String get plTargetsBasis => '年齢・体重・トレーニングから計算';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals食 × $grams g';
  }

  @override
  String get plZinc => '亜鉛';

  @override
  String get plMagnesium => 'マグネシウム';

  @override
  String get plEnergy => 'エネルギー';

  @override
  String get plChecklist => '今日のチェックリスト';

  @override
  String plCheckProtein(int grams) {
    return 'たんぱく質 $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'カルシウム $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'ビタミンD $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return '水分 $liters';
  }

  @override
  String plFromMeals(String amount) {
    return 'チェックした食事から$amount';
  }

  @override
  String get plVitaminDNote => '昼間に腕と顔へ15分日光を浴びるか、医師がOKしたサプリで';

  @override
  String plWaterLogged(String liters) {
    return 'ここまで$liters記録';
  }

  @override
  String get plMealPlan => 'あなたの食事プラン';

  @override
  String get plMealPlanSub => '実際の食材と分量を、あなたの目標に合わせて';

  @override
  String get plSnack => '間食';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return 'たんぱく質$protein g・カルシウム$calcium mg・$kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return '目標 $grams g';
  }

  @override
  String get plMarkEaten => '食べたにする';

  @override
  String get plEaten => '食べた';

  @override
  String get plPlanTotal => '1日の合計';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'これらの食事で$kcal kcalのうち約$planKcalをまかなえます。残りは果物、野菜、パン、ごはんで補おう。';
  }

  @override
  String get plWeeklyMenu => '1週間のメニュー';

  @override
  String get plWeeklyMenuSub => '毎日ちがうメニューで、目標は同じ';

  @override
  String get plUnlockMenu => '1週間のメニューをすべて解放';

  @override
  String get plRecipes => 'レシピ';

  @override
  String get plRecipesSub => 'すぐ作れる高たんぱくメニュー';

  @override
  String get plNutritionGuide => '栄養ガイド';

  @override
  String get plNutritionGuideSub => '栄養素・食品・サプリメント';

  @override
  String plPieces(int n) {
    return '$n個';
  }

  @override
  String get plFoodOats => 'オートミール';

  @override
  String get plFoodMilk => '牛乳';

  @override
  String get plFoodBanana => 'バナナ';

  @override
  String get plFoodWalnuts => 'くるみ';

  @override
  String get plFoodGreekYogurt => 'ギリシャヨーグルト';

  @override
  String get plFoodYogurt => 'ヨーグルト';

  @override
  String get plFoodEggs => '卵';

  @override
  String get plFoodBread => '全粒粉パン';

  @override
  String get plFoodWhiteCheese => 'フェタチーズ';

  @override
  String get plFoodHardCheese => 'チェダーチーズ';

  @override
  String get plFoodSalad => 'トマトときゅうりのサラダ';

  @override
  String get plFoodOrange => 'オレンジ';

  @override
  String get plFoodPeanutButter => 'ピーナッツバター';

  @override
  String get plFoodSpinach => 'ほうれん草';

  @override
  String get plFoodCottageCheese => 'カッテージチーズ';

  @override
  String get plFoodChicken => '鶏むね肉';

  @override
  String get plFoodBulgur => 'ブルグル';

  @override
  String get plFoodAyran => 'アイラン（ヨーグルトドリンク）';

  @override
  String get plFoodTuna => 'ツナ（缶詰）';

  @override
  String get plFoodPasta => 'パスタ';

  @override
  String get plFoodBeef => '赤身の牛肉';

  @override
  String get plFoodRice => 'ごはん';

  @override
  String get plFoodChickpeas => 'ひよこ豆';

  @override
  String get plFoodSalmon => 'サーモン';

  @override
  String get plFoodBroccoli => 'ブロッコリー';

  @override
  String get plFoodPotato => 'じゃがいも';

  @override
  String get plFoodLentils => 'レンズ豆';

  @override
  String get plFoodSardines => 'いわし';

  @override
  String get plFoodAlmonds => 'アーモンド';

  @override
  String get plFoodKefir => 'ケフィア';

  @override
  String get plFoodPumpkinSeeds => 'かぼちゃの種';

  @override
  String get wtCoffee => 'コーヒー';

  @override
  String get wtTea => 'お茶';

  @override
  String get wtCola => 'コーラ';

  @override
  String get wtEnergyDrink => 'エナジー';

  @override
  String get crCustomBadge => 'オリジナル';

  @override
  String get crNameHint => '例：朝のパワーストレッチ';

  @override
  String get crDoseHint => '例：10回×3セット、30秒×3セット';

  @override
  String get paywallLifetime => '買い切り';

  @override
  String paywallOnce(String price) {
    return '$price（1回のみ）';
  }

  @override
  String get paywallLifetimeBadge => 'サブスクなし';

  @override
  String get paywallLifetimeDisclaimer => '1回払い・サブスクなし、自動更新なし';

  @override
  String get pwSlidePotentialTitle => 'ポテンシャルを見よう';

  @override
  String get pwSlidePotentialCaption => '年齢・身長・両親の身長から計算します。';

  @override
  String get pwSlideTodayTitle => '毎日のプラン';

  @override
  String get pwSlideTodayCaption => '動画ガイドつきの短いトレーニングを毎日。';

  @override
  String get pwSlideProgramTitle => '70日間、10レベル';

  @override
  String get pwSlideProgramCaption => '毎週、種目が少しずつレベルアップ。';

  @override
  String get pwSlideNutritionTitle => '成長のために食べよう';

  @override
  String get pwSlideNutritionCaption => 'あなた専用の、毎日のたんぱく質・カルシウム・ビタミンDの目標。';

  @override
  String get pwSlideChartTitle => '曲線が上がっていくのを見よう';

  @override
  String get pwSlideChartCaption => '測定するたびに、ポテンシャルへの道のりに記録されます。';

  @override
  String get pwSlideScoreTitle => '習慣をひとつのスコアに';

  @override
  String get pwSlideScoreCaption => 'どの習慣から直すべきかがわかります。';

  @override
  String get pwSlidePostureTitle => '今日から高く立とう';

  @override
  String get pwSlidePostureCaption => 'かんたんな姿勢チェックと、改善するための種目。';

  @override
  String get pwExample => '例';

  @override
  String pwYouLine(String now, String potential) {
    return 'あなた：$now → ポテンシャル $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return '例：$now → ポテンシャル $potential';
  }

  @override
  String get tv3NewEyebrow => '新機能';

  @override
  String get tv3NewTitle => 'BeTallerが大きくアップデート';

  @override
  String get tv3NewDesc => '新しいプラン、新しいプログラム、新しいデザイン。新しくなった点を紹介します。';

  @override
  String get tv3PotentialTitle => 'これがあなたのポテンシャル';

  @override
  String get tv3PotentialDesc => '今日の身長と、届く可能性のある身長を並べて表示。プランでその差を縮めよう。';

  @override
  String get tv3TodayTitle => '今日のプラン';

  @override
  String tv3TodayDesc(String button) {
    return '今日のために作った短いトレーニング。$buttonをタップして一緒に進めよう。';
  }

  @override
  String get tv3ProgramTitle => '70日間の継続プログラム';

  @override
  String get tv3ProgramDesc => '10レベルを1日1ステップずつ。毎日が前日の積み重ねになります。';

  @override
  String get tv3NutritionTitle => '1日の目標';

  @override
  String get tv3NutritionDesc => 'たんぱく質・カルシウム・ビタミンD・水分を、あなたの体に合わせて計算。';

  @override
  String get tv3ChartTitle => '成長曲線を見よう';

  @override
  String get tv3ChartDesc => '1〜2週間ごとに測って、線がポテンシャルに向かって上がっていくのを見よう。';

  @override
  String get tv3ScoreTitle => 'あなたのBeTallerスコア';

  @override
  String get tv3ScoreDesc => '調子をひとつの数字で。いちばん弱いところから伸ばそう。';

  @override
  String get tv3Next => '次へ';

  @override
  String get tv3ShowMe => '見てみる';

  @override
  String get tv3Done => 'さあ始めよう';

  @override
  String get obWhyTitle => '背を伸ばしたい理由は？';

  @override
  String get obWhySubtitle => '当てはまるものをすべて選んでください。プランはあなたの理由から始まります。';

  @override
  String get obWhyConfidence => 'もっと自信を持ちたい';

  @override
  String get obWhyImpression => '第一印象をよくしたい';

  @override
  String get obWhySports => 'スポーツで活躍したい';

  @override
  String get obWhyClothes => '服をかっこよく着こなしたい';

  @override
  String get obWhyPhotos => '写真映りをよくしたい';

  @override
  String get obWhyPotential => '自分のポテンシャルを知りたいだけ';

  @override
  String get obTriedTitle => 'ほかの身長アプリを使ったことは？';

  @override
  String get obTriedSubtitle => '正解はありません。BeTallerの違いを伝えるのに役立ちます。';

  @override
  String get obTriedStopped => 'あるけど、やめた';

  @override
  String get obTriedStill => 'あって、今も使っている';

  @override
  String get obTriedFirst => 'いいえ、これが初めて';

  @override
  String get obTriedStoppedTitle => '数字だけでは続かない';

  @override
  String get obTriedStoppedBody =>
      '多くのアプリは数字を出すだけ。BeTallerはそれを毎日チェックできるプランにして、あなたの好きな時間にリマインドします。';

  @override
  String get obTriedStillTitle => '合うものはそのまま続けよう';

  @override
  String get obTriedStillBody =>
      'BeTallerは毎日の部分をプラス。あなたの回答から作った、1ステップずつチェックできるプランです。';

  @override
  String get obTriedFirstTitle => '始めるのにぴったり';

  @override
  String get obTriedFirstBody =>
      'ここでは数字を出すだけではありません。BeTallerはあなたの回答を、毎日チェックできるプランに変えます。';

  @override
  String get obTriedCardTitle => '毎日チェックすること';

  @override
  String get obTriedItem1 => 'その週に合わせた短いトレーニング';

  @override
  String get obTriedItem2 => 'たんぱく質の目標';

  @override
  String get obTriedItem3 => '時間どおりに消灯';

  @override
  String get obBlockTitle => '続けるのを邪魔しているものは？';

  @override
  String get obBlockSubtitle => '当てはまるものをすべて選んでください。プランがそれに合わせて工夫します。';

  @override
  String get obBlockForget => '忘れてしまう';

  @override
  String get obBlockTime => '時間がない';

  @override
  String get obBlockExercises => 'どの運動をすればいいかわからない';

  @override
  String get obBlockMotivation => 'やる気が続かない';

  @override
  String get obBlockBedtime => '寝るのが遅い';

  @override
  String get obBlockMeals => '食事を抜きがち';

  @override
  String get obFirstTitle => '背が伸びたら、まず何をする？';

  @override
  String get obFirstSubtitle => '想像してみて。それがあなたの目指すものです。';

  @override
  String get obFirstWardrobe => '服を新しくそろえる';

  @override
  String get obFirstMuscle => '筋肉をつける';

  @override
  String get obFirstPhotos => '写真をもっと投稿する';

  @override
  String get obFirstTeam => 'チームの入団テストを受ける';

  @override
  String get obFirstFeelGood => '特にない、ただ気分よく過ごしたい';

  @override
  String get obBuiltChip => 'あなた専用';

  @override
  String get obBuiltTitle => 'あなたに合わせて作ったプラン';

  @override
  String get obBuiltReason => 'あなたの理由';

  @override
  String get obBuiltGoal => '目標';

  @override
  String get obBuiltWhen => '達成の目安';

  @override
  String get obBuiltBlockers => '続かない原因への対策';

  @override
  String get obFixForget => 'あなたが選んだ時間にリマインダー';

  @override
  String get obFixTime => '短いセッション、ほとんどが約15分';

  @override
  String get obFixExercises => '動画ガイドつきの種目を1ステップずつ';

  @override
  String get obFixMotivation => '続ける力になる連続記録とレベル';

  @override
  String get obFixBedtime => '睡眠の目標と就寝リマインダー';

  @override
  String get obFixMeals => 'たんぱく質の目標と食事プラン';

  @override
  String get obNotifTitle => '大事なタイミングでBeTallerがお知らせ';

  @override
  String get obNotifSubtitle => '教えてもらった時間に設定しました。いつでも変更できます。';

  @override
  String get obNotifWorkout => 'トレーニング';

  @override
  String obNotifWorkoutDetail(String time) {
    return '$timeのトレーニングの30分前';
  }

  @override
  String get obNotifMeal => '食事とたんぱく質';

  @override
  String obNotifMealDetail(String time) {
    return '$timeの食事のときに';
  }

  @override
  String get obNotifWater => '水分';

  @override
  String get obNotifWaterDetail => '午後に水分補給のひと休み';

  @override
  String get obNotifSleep => 'おやすみ準備';

  @override
  String obNotifSleepDetail(String time) {
    return '$timeの就寝の1時間前';
  }

  @override
  String get obNotifAllow => 'リマインダーをオンにする';

  @override
  String get obNotifNotNow => 'あとで';

  @override
  String get obNotifNow => 'いま';

  @override
  String get ftOneFree => '1回無料';

  @override
  String get ftFreeToday => '今日は無料';

  @override
  String get ftContinuePro => 'Proで続ける';

  @override
  String get ftNotNow => 'あとで';

  @override
  String get ftOutWorkoutTitle => '無料のトレーニングを使いました';

  @override
  String get ftOutWorkoutBody =>
      'Proで連続記録をキープしよう。毎日ガイドつきのトレーニングで、すべての種目のタイミングをお知らせします。';

  @override
  String get ftOutDayTitle => '無料の1日目が終わりました';

  @override
  String get ftOutDayBody =>
      'プラン、目標、記録はここでいつでも見られます。Proで連続記録をキープしよう：毎日プランをチェックし、水分と睡眠を記録できます。';

  @override
  String get ftOutPostureTitle => '無料の姿勢チェックを使いました';

  @override
  String get ftOutPostureBody => '結果はここに残ります。Proなら毎週チェックして、姿勢がよくなっていくのを確認できます。';

  @override
  String get ftOutPhotosTitle => '無料の写真比較を使いました';

  @override
  String get ftOutPhotosBody => 'その2枚はいつでも見られます。Proなら写真を追加して、好きな2枚を比較できます。';

  @override
  String get ftOutReportTitle => '無料の週間レポートを使いました';

  @override
  String get ftOutReportBody => 'Proなら毎週フルのまとめが届きます：1日ごとのスコア、目標、そして改善すべきこと1つ。';

  @override
  String get ftOutScoreTitle => '無料のスコア内訳を見ました';

  @override
  String get ftOutScoreBody => 'スコアは画面に残ります。Proなら、スコアの内訳と次にやることを毎日確認できます。';

  @override
  String get ftOutArticleTitle => '無料の記事を読みました';

  @override
  String get ftOutArticleBody => 'その記事はいつでも読めます。Proならすべての記事が読み放題です。';

  @override
  String get ftWhyWorkout => 'ガイドつきトレーニングはProの機能です';

  @override
  String get ftWhyPlan => 'プランのチェックはProの機能です';

  @override
  String get ftWhyProgram => '70日間プログラムはProの機能です';

  @override
  String get ftWhyWater => '毎日の水分記録はProの機能です';

  @override
  String get ftWhySleep => '毎日の睡眠記録はProの機能です';

  @override
  String get ftWhyNutrition => '毎日の栄養プランはProの機能です';

  @override
  String get ftWhyPosture => '毎週の姿勢チェックはProの機能です';

  @override
  String get ftWhyPhotos => '写真の比較はProの機能です';

  @override
  String get ftWhyReport => '週間レポートはProの機能です';

  @override
  String get ftWhyScore => 'スコアの内訳はProの機能です';

  @override
  String get ftWhyArticle => 'すべての記事はProの機能です';

  @override
  String get ftPlanLocked => 'プランはここでいつでも見られます。チェックするのはProの機能です。';

  @override
  String get ftNutritionLocked => '目標と食事はここでいつでも見られます。チェックするのはProの機能です。';

  @override
  String get ftPreviewTag => 'プレビュー';

  @override
  String get ftPreviewTitle => 'プレビューはここまで';

  @override
  String get ftPreviewBody => 'このトレーニングの続きはProの機能です。このあとの内容はこちら：';

  @override
  String get ftFreeWorkoutUsed => '無料のガイドつきトレーニングはこれで終わりです。Proなら毎日続けられます。';

  @override
  String get ftScoreLockedTitle => 'スコアの内訳';

  @override
  String get ftScoreLockedBody => 'スコアのすべての項目、その根拠、そして次にやるべきこと1つ。';

  @override
  String get ftReportLockedTitle => '1週間のすべて';

  @override
  String get ftReportLockedBody => 'プランに対する毎日のスコア、目標、身長、そして来週のフォーカス1つ。';

  @override
  String get ftPhotosLockedTitle => 'この2枚を比較';

  @override
  String get ftPhotosLockedBody => '無料の比較は使用済みです。Proなら好きな2枚をスライダーで比較できます。';

  @override
  String get ftArticleFreeLine => '最初の記事は無料。読みたいものを選んでね。';

  @override
  String get plFinishWorkout => '終了';

  @override
  String get obTriedMostApps => '多くのアプリ';

  @override
  String get obTriedThatsIt => '数字が出て、それで終わり。';

  @override
  String get obTriedPlanLabel => 'BeTallerでの1日';

  @override
  String get obTriedProteinSub => '食事ごとに分けて';

  @override
  String get obTriedSleepSub => '寝る前にリマインダー';

  @override
  String get obTriedFeatVideo => '動画ガイドつきの種目';

  @override
  String get obTriedFeatReminders => '好きな時間にリマインダー';

  @override
  String get obTriedFeatStreaks => '連続記録とレベル';

  @override
  String get obBedtimeUnknown => 'わからない、日によって違う';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'あなたの年齢に必要な睡眠から、$timeをおすすめします。いつでも変更できます。';
  }

  @override
  String get obWorkoutTimeUnknown => 'わからない、決まった時間はない';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'ひとまず$timeに設定します。いつでも変更できます。';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'おすすめ：$timeごろに就寝。いつでも変更できます。';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'おすすめ：$timeごろにトレーニング。いつでも変更できます。';
  }

  @override
  String get obNotifSubtitleSuggested =>
      '教えてもらった時間に設定し、わからなかったところはおすすめの時間にしました。いつでも変更できます。';

  @override
  String get plFoodBrownRice => '玄米';

  @override
  String get unitHeightTitle => '身長の単位';

  @override
  String get unitWeightTitle => '体重の単位';

  @override
  String get unitWaterTitle => '水分の単位';

  @override
  String get unitOptCm => 'センチメートル';

  @override
  String get unitOptFtIn => 'フィートとインチ';

  @override
  String get unitOptKg => 'キログラム';

  @override
  String get unitOptLb => 'ポンド';

  @override
  String get unitOptStLb => 'ストーンとポンド';

  @override
  String get unitOptLiters => 'リットル';

  @override
  String get unitOptFlOz => '液量オンス';

  @override
  String achieveGrowthImp(String amount) {
    return '$amount成長';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return '合計$amountの伸びを記録する';
  }

  @override
  String get postureBenefitIn => '頭・肩・腰をチェック。姿勢を正すと、本来の身長が最大約1 in高く見えます。';

  @override
  String get notifPostureBodyIn => '背すじを伸ばして、肩を後ろに。よい姿勢で約1 inの差！';

  @override
  String get painPostureDescIn =>
      '姿勢を正すと、すぐに最大約1 in高く見えます。BeTallerの毎日の姿勢ルーティンで、数週間で身につきます。';

  @override
  String get routinePostureDescIn =>
      '背すじを伸ばし、肩を後ろに。1時間ごとにチェック。よい姿勢で約1 inの差が出ます。';

  @override
  String get sciPostureCheckIn => '姿勢を正すと見た目の身長がすぐに約1 in高くなり、背骨の圧迫も防げます';

  @override
  String get routineProteinDescLb => '卵、鶏肉、魚、乳製品。1日に体重1 lbあたり0.7 g以上のたんぱく質を。';

  @override
  String pwPersonalTitle(String height) {
    return '$heightを目指すプランができました';
  }

  @override
  String get pwPersonalEstimate => '回答から推定したポテンシャルで、保証ではありません';

  @override
  String pwPersonalReason(String reason) {
    return 'あなたの理由：$reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return '$timeの就寝前に、リラックスのリマインダー';
  }

  @override
  String get obParentUnknown => 'わからない';

  @override
  String get obParentUnknownHint =>
      '代わりに大人の平均身長を使います。精度は下がりますが、プロフィールからいつでも追加できます。';

  @override
  String get obEthnicityWhy => 'わからない親の身長を推定するためだけに使います。';

  @override
  String get resultNoParentNote =>
      '片方の親の身長なしで推定しているため、精度は下がります。プロフィールからいつでも追加できます。';

  @override
  String get resultNoParentsNote =>
      '両親の身長なしで推定しているため、精度は下がります。プロフィールからいつでも追加できます。';

  @override
  String get resultFootnoteEstimated =>
      '成長曲線のデータと大人の平均身長にもとづく推定です。医療上のアドバイスではありません。';

  @override
  String get obBudgetChip => '適正価格';

  @override
  String get obBudgetTitle => 'BeTallerは、背を伸ばしたいすべての10代のための価格です';

  @override
  String get obBudgetDesc => '身長がお金のあるなしで左右されるべきではありません。だから価格は国ごとに設定しています。';

  @override
  String obBudgetWeek(String price) {
    return 'ここでのPro 1週間：$price';
  }

  @override
  String get obBudgetLocalTitle => 'あなたの国に合わせた価格';

  @override
  String get obBudgetLocalDesc => '米ドルからの換算ではなく、あなたの住む地域の予算に合わせて設定しています。';

  @override
  String get obBudgetWeekTitle => 'まずは1週間から';

  @override
  String get obBudgetWeekDesc => '最初に大きな支払いはありません。Apple IDの設定からいつでも解約できます。';

  @override
  String get obBudgetAllTitle => 'すべてがひとつのプランに';

  @override
  String get obBudgetAllDesc => 'トレーニング、睡眠、栄養、姿勢、成長レポート。';

  @override
  String get obRateTitle => 'BeTallerは、本当にあなたの役に立つために作られました';

  @override
  String get obRateDesc => '一人ひとりに寄り添う姿勢と正直さを気に入ってもらえたら、評価してもらえるととてもうれしいです。';

  @override
  String get obRateCta => 'BeTallerを評価';

  @override
  String get obRateLater => 'あとで';
}
