// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get navHome => 'Главная';

  @override
  String get navAnalysis => 'Анализ';

  @override
  String get navRoutines => 'Мой план';

  @override
  String get disciplineTitle => 'Дисциплина';

  @override
  String get disciplineProgramTitle => 'Программа дисциплины';

  @override
  String disciplineJourneyDay(int done, int total) {
    return 'Дни: $done/$total';
  }

  @override
  String get disciplineCompleteDay => 'Завершить день';

  @override
  String disciplineDayN(int n) {
    return 'День $n';
  }

  @override
  String get disciplineLevels => 'Уровни';

  @override
  String get disciplineLevelDone => 'Пройден';

  @override
  String get disciplineLocked => 'Закрыт';

  @override
  String get disciplineTodayIs => 'Сегодня';

  @override
  String get disciplineToday => 'Сегодня';

  @override
  String get disciplineTodayPlan => 'План на сегодня';

  @override
  String get disciplineWeek => 'Эта неделя';

  @override
  String get disciplineMonth => 'Этот месяц';

  @override
  String get disciplineLevel => 'Уровень дисциплины';

  @override
  String disciplineStreakDays(int days) {
    return 'Серия: $days дн.';
  }

  @override
  String disciplineToNext(int days) {
    return 'До следующего уровня: $days дн.';
  }

  @override
  String get disciplineMaxTier => 'Высший уровень достигнут';

  @override
  String get disciplineTierSpark => 'Искра';

  @override
  String get disciplineTierSteady => 'Стабильный';

  @override
  String get disciplineTierSharp => 'Собранный';

  @override
  String get disciplineTierSolid => 'Крепкий';

  @override
  String get disciplineTierRelentless => 'Неудержимый';

  @override
  String get disciplineTierUnbroken => 'Несгибаемый';

  @override
  String get disciplineTierLegend => 'Легенда';

  @override
  String get goalPerfectDays => 'Дни с выполненным планом';

  @override
  String get goalWorkouts => 'Тренировки';

  @override
  String get goalMeasurement => 'Замер роста';

  @override
  String get goalPhoto => 'Фото прогресса';

  @override
  String get goalPostureCheck => 'Проверка осанки';

  @override
  String get disciplineAllDone => 'На сегодня всё';

  @override
  String disciplineDayProgress(int done, int total) {
    return 'Готово: $done/$total';
  }

  @override
  String get navProgress => 'Прогресс';

  @override
  String get trackingSection => 'Твои инструменты';

  @override
  String get photosBenefit =>
      'До и после — рядом. Смотри на изменения, а не читай о них.';

  @override
  String get postureBenefit =>
      'Голова, плечи и поясница. Ровная осанка показывает до 2–3 см твоего настоящего роста.';

  @override
  String get reportBenefit =>
      'Оценивай неделю по дням и смотри, где был провал.';

  @override
  String get photosCta => 'Добавить фото';

  @override
  String get postureCta => 'Анализ';

  @override
  String get reportCta => 'Открыть отчёт';

  @override
  String get toolStateReady => 'Готово';

  @override
  String get photosSummaryEmpty => 'Добавь первое фото';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count фото',
      many: '$count фото',
      few: '$count фото',
      one: '$count фото',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'Анализа пока нет';

  @override
  String postureSummaryScore(int score) {
    return 'Осанка: $score/100';
  }

  @override
  String get navProfile => 'Профиль';

  @override
  String greeting(String name) {
    return 'Привет, $name';
  }

  @override
  String get currentHeight => 'Текущий рост';

  @override
  String get target => 'Цель';

  @override
  String completed(String pct) {
    return 'Выполнено: $pct%';
  }

  @override
  String remaining(String cm, String unit) {
    return 'Осталось +$cm $unit';
  }

  @override
  String get updateAnalysis => 'Обновить анализ';

  @override
  String get analysisSubtitle => 'Прогноз по прошлому росту и привычкам';

  @override
  String get dailyRoutines => 'Задания на день';

  @override
  String get allRoutinesDone => 'Все задания выполнены!';

  @override
  String get water => 'Вода';

  @override
  String get sleep => 'Сон';

  @override
  String get growthSummary => 'Итоги роста';

  @override
  String get total => 'ВСЕГО';

  @override
  String get last => 'ПОСЛЕДНИЙ';

  @override
  String get measurement => 'ЗАМЕРЫ';

  @override
  String get dailyTip => 'Совет дня';

  @override
  String get waterTracking => 'Учёт воды';

  @override
  String get waterGoalReached => 'Дневная цель выполнена';

  @override
  String waterRemaining(String amount) {
    return 'Осталось $amount';
  }

  @override
  String get undo => 'Отменить';

  @override
  String waterToday(String amount) {
    return 'Сегодня: $amount л';
  }

  @override
  String get sleepTracking => 'Учёт сна';

  @override
  String sleepTarget(String hours) {
    return 'Цель: $hours ч';
  }

  @override
  String get hours => 'ч';

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get analysis => 'Анализ';

  @override
  String get betallerScore => 'Оценка BeTaller';

  @override
  String get genetic => 'Генетика';

  @override
  String get growth => 'Рост';

  @override
  String get nutrition => 'Питание';

  @override
  String get sleepLabel => 'Сон';

  @override
  String get discipline => 'Дисциплина';

  @override
  String get improveScore => 'Подними оценку';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Питание: всё плохо!';

  @override
  String get nutritionStrengthen => 'Улучши питание';

  @override
  String get sleepRecordAdd => 'Записать сон';

  @override
  String get sleepPoor => 'Плохой режим сна';

  @override
  String get sleepImprove => 'Улучши сон';

  @override
  String get startToday => 'Начни сегодня!';

  @override
  String routinesRemaining(int count) {
    return 'Осталось заданий: $count';
  }

  @override
  String get keepStreak => 'Не прерывай серию';

  @override
  String get addFirstMeasurement => 'Добавить первый замер';

  @override
  String get addMeasurement => 'Добавить замер';

  @override
  String waterHalfNotReached(String amount) {
    return 'Сегодня не набралось и половины нормы воды. Выпей ещё $amount л.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'До нормы воды осталось $amount л. Почти всё!';
  }

  @override
  String bmiLow(String bmi) {
    return 'Твой ИМТ — $bmi, это немного мало. Добавь больше белка и калорий.';
  }

  @override
  String get bodyFactsTitle => 'Твоё тело';

  @override
  String get dailyNeedsTitle => 'Твои цели на день';

  @override
  String bmiHigh(String bmi) {
    return 'Твой ИМТ — $bmi, это немного много. Сделай упор на здоровую еду.';
  }

  @override
  String get nutritionDefault =>
      'Выполняй норму воды и питайся сбалансированно.';

  @override
  String sleepNoRecord(String hours) {
    return 'Сегодня сон не записан. Старайся спать $hours ч и отмечай это.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Сегодня сна: $current ч — на $missing ч меньше нормы. Ложись пораньше!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Почти! $hours ч сна дадут максимум гормона роста.';
  }

  @override
  String get sleepGood => 'Отличный режим сна! Так держать.';

  @override
  String noRoutinesDone(int total) {
    return 'Сегодня пока ничего не выполнено. Начни с одного задания — всего их $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return 'Сегодня выполнено $done/$total. Осталось ещё $left!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Отличный день! Ещё $needed дн. — и начнётся серия.';
  }

  @override
  String streakContinue(int days) {
    return 'Серия: $days дн.! Чем дольше держишь, тем выше оценка.';
  }

  @override
  String get noMeasurements =>
      'Замеров роста пока нет. Добавь первый, чтобы прогноз был точным.';

  @override
  String fewMeasurements(int count) {
    return 'Нужно ещё замеров: $count — и мы рассчитаем скорость роста.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Замеров: $count. Когда будет 5, прогноз станет намного точнее.';
  }

  @override
  String get keepMeasuring =>
      'Продолжай добавлять замеры. Каждый новый делает прогноз точнее.';

  @override
  String get heightPrediction => 'Прогноз роста';

  @override
  String get predictedHeightAt21 => 'Прогноз роста к 21 году';

  @override
  String get predictionMethod =>
      'Рассчитано по генетике (рост родителей), скорости роста, ИМТ и возрасту.';

  @override
  String get growthStatus => 'Статус роста';

  @override
  String get growthRemaining => 'Ещё впереди';

  @override
  String get growthBreakdown => 'Откуда эти сантиметры';

  @override
  String get geneticGainLabel => 'Генетический прирост';

  @override
  String get lifestyleLabel => 'Образ жизни';

  @override
  String get geneticCeilingLabel => 'Потолок';

  @override
  String get reachableTargetHeight => 'Твой достижимый рост';

  @override
  String get geneticCeilingProgress => 'Путь к генетическому потолку';

  @override
  String get completionLabel => 'ВЫПОЛНЕНО';

  @override
  String get growthVelocity => 'СКОРОСТЬ РОСТА';

  @override
  String get noData => 'НЕТ ДАННЫХ';

  @override
  String growthRate(String rating) {
    return 'Темп роста: $rating';
  }

  @override
  String get bmi => 'ИМТ';

  @override
  String get calories => 'Калории';

  @override
  String get kcalDay => 'ккал/день';

  @override
  String get daily => 'в день';

  @override
  String get protein => 'Белок';

  @override
  String get minimum => 'минимум';

  @override
  String get age => 'Возраст';

  @override
  String get male => 'Мужской';

  @override
  String get female => 'Женский';

  @override
  String get yearlyPrediction => 'ПРОГНОЗ ПО ГОДАМ';

  @override
  String ageYear(int age) {
    return '$age лет';
  }

  @override
  String get progressTitle => 'Отслеживание прогресса';

  @override
  String get totalGrowth => 'Всего';

  @override
  String get lastDiff => 'Прирост';

  @override
  String get measurementCount => 'Замеры';

  @override
  String get heightChart => 'График роста';

  @override
  String get chartMinData => 'Для графика нужно минимум 2 замера';

  @override
  String get chartInstruction =>
      'Добавляй замеры, чтобы увидеть график прогресса!';

  @override
  String get addMeasurementButton => 'ДОБАВИТЬ ЗАМЕР';

  @override
  String get measurementHistory => 'ИСТОРИЯ ЗАМЕРОВ';

  @override
  String get deleteTitle => 'Удалить замер';

  @override
  String get deleteMessage => 'Точно удалить этот замер?';

  @override
  String get dismiss => 'Отмена';

  @override
  String get delete => 'Удалить';

  @override
  String get newMeasurement => 'Новый замер роста';

  @override
  String get routines => 'Задания';

  @override
  String streakDays(int days) {
    return '$days дн.';
  }

  @override
  String get progressStatus => 'Прогресс';

  @override
  String get completedLabel => 'Готово!';

  @override
  String get all => 'Все';

  @override
  String get exercise => 'Упражнения';

  @override
  String get posture => 'Осанка';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return 'Рекорд: $_temp0';
  }

  @override
  String get editProfile => 'Изменить профиль';

  @override
  String get editProfileSubtitle => 'Рост, вес, возраст';

  @override
  String get name => 'Имя';

  @override
  String birthDate(String date) {
    return 'Дата рождения: $date';
  }

  @override
  String get heightCm => 'Рост (см)';

  @override
  String get weightKg => 'Вес (кг)';

  @override
  String get fatherHeight => 'Рост папы (см)';

  @override
  String get motherHeight => 'Рост мамы (см)';

  @override
  String get notifications => 'Уведомления';

  @override
  String get reminderNextLabel => 'Следующее напоминание';

  @override
  String get reminderManageHint => 'Настрой свои напоминания';

  @override
  String get reminderOffCta => 'Включить уведомления';

  @override
  String get stateOn => 'Вкл.';

  @override
  String get stateOff => 'Выкл.';

  @override
  String get reminderMasterTitle => 'Уведомления';

  @override
  String reminderActiveCount(int count) {
    return 'Активных напоминаний: $count';
  }

  @override
  String get reminderBuiltIn => 'Встроенные напоминания';

  @override
  String get reminderYourOwn => 'Твои напоминания';

  @override
  String get reminderAdd => 'Добавить напоминание';

  @override
  String get reminderDays => 'Дни';

  @override
  String get reminderEveryDay => 'Каждый день';

  @override
  String get reminderLabelHint => 'О чём напомнить?';

  @override
  String get reminderEmptyHint =>
      'Добавь своё: тренировка, витамины, растяжка — что угодно.';

  @override
  String get reminderCustom => 'Напоминание';

  @override
  String get reminderCustomBody => 'Пора — наступило заданное время.';

  @override
  String get reminderExercise => 'Упражнения';

  @override
  String get reminderNutrition => 'Питание';

  @override
  String get reminderWater => 'Вода';

  @override
  String get reminderPosture => 'Осанка';

  @override
  String get reminderRoutine => 'Задания на день';

  @override
  String get reminderSleep => 'Сон';

  @override
  String get reminderMeasurement => 'Замер роста';

  @override
  String get notificationsOn => 'Напоминания включены';

  @override
  String get notificationsOff => 'Напоминания выключены';

  @override
  String get premium => 'Перейти на Премиум';

  @override
  String get premiumSubtitle => 'Открой все функции';

  @override
  String get rateUs => 'Оцени нас';

  @override
  String get rateSubtitle => 'Нравится приложение? Поставь 5 звёзд!';

  @override
  String get share => 'Поделиться';

  @override
  String get shareSubtitle => 'Расскажи друзьям о BeTaller';

  @override
  String get shareText =>
      'BeTaller показал мой потенциал роста! Попробуй и ты: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Оставить отзыв';

  @override
  String get feedbackSubtitle => 'Напиши нам';

  @override
  String get resetData => 'Сбросить все данные';

  @override
  String get resetSubtitle => 'Все данные будут удалены';

  @override
  String get resetTitle => 'Сброс данных';

  @override
  String get resetMessage =>
      'Все данные будут удалены, и ты вернёшься к начальной настройке. Это нельзя отменить!';

  @override
  String get reset => 'Сбросить';

  @override
  String get premiumSoon => 'Премиум скоро!';

  @override
  String get brandingSubtitle => 'Узнай свой потенциал роста';

  @override
  String get statistics => 'Статистика';

  @override
  String get profileGroupSupport => 'Поддержка';

  @override
  String get profileGroupAccount => 'Аккаунт';

  @override
  String get profileGroupApp => 'Приложение';

  @override
  String get profileGroupDanger => 'Опасная зона';

  @override
  String profileMemberSince(String date) {
    return 'С $date';
  }

  @override
  String get profileYourJourney => 'Твой путь';

  @override
  String get profileTotalGrowth => 'Всего';

  @override
  String get currentStreak => 'Текущая серия';

  @override
  String get bestStreakLabel => 'Лучшая серия';

  @override
  String get achievementLabel => 'Достижение';

  @override
  String get achievements => 'Достижения';

  @override
  String get achievementUnlockedTitle => '🏆 Новое достижение!';

  @override
  String get reminderTapHint => 'Нажми, чтобы изменить время и дни';

  @override
  String get earned => 'Получено!';

  @override
  String get notEarned => 'Ещё не получено';

  @override
  String get ok => 'ОК';

  @override
  String get language => 'Язык';

  @override
  String get languageSubtitle => 'Сменить язык приложения';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Узнай свой потенциал роста';

  @override
  String get onboardingMeetYou => 'Давай познакомимся';

  @override
  String get onboardingInfoNeeded => 'Для анализа нужны базовые данные.';

  @override
  String get gender => 'ПОЛ';

  @override
  String get birthDateLabel => 'ДАТА РОЖДЕНИЯ';

  @override
  String get bodyMeasurements => 'Параметры тела';

  @override
  String get bodyInfo => 'Для анализа нужны твои текущие рост и вес.';

  @override
  String get geneticData => 'Генетика';

  @override
  String get geneticInfo =>
      'Рост родителей определяет твой генетический потенциал.';

  @override
  String get pastHeights => 'Прошлый рост';

  @override
  String get pastHeightsInfo =>
      'Укажи, какой у тебя был рост в разном возрасте. Что не помнишь — оставь пустым.';

  @override
  String get heightHint => 'Введи рост...';

  @override
  String get ageLabel => 'возраст';

  @override
  String get habits => 'Твои привычки';

  @override
  String get habitsInfo => 'Образ жизни напрямую влияет на прогноз.';

  @override
  String get weeklyExercise => 'Тренировки в неделю';

  @override
  String get dailySleep => 'Сон в сутки';

  @override
  String get nutritionQuality => 'КАЧЕСТВО ПИТАНИЯ';

  @override
  String get nutritionDesc => 'Белок, молочка, овощи, фрукты';

  @override
  String get nutritionBad => 'Плохо';

  @override
  String get nutritionPoor => 'Слабо';

  @override
  String get nutritionMedium => 'Средне';

  @override
  String get nutritionGood => 'Хорошо';

  @override
  String get nutritionGreat => 'Отлично';

  @override
  String get startAnalysis => 'Начать анализ';

  @override
  String get continueBtn => 'Далее';

  @override
  String get analyzeBtn => 'Анализировать';

  @override
  String get analyzing => 'Анализируем';

  @override
  String get analysisComplete => 'Готово!';

  @override
  String get analysisDataReceivedTitle => 'Данные получены';

  @override
  String get analysisDataReceivedSubtitle => 'Начинаем анализ...';

  @override
  String get yourScore => 'Твоя оценка BeTaller';

  @override
  String get letsStart => 'Поехали';

  @override
  String get splashJourneySubtitle => 'Твой путь начинается. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Твой личный план готов.\nУзнаем твой потенциал роста?';

  @override
  String get doneBtn => 'Готово';

  @override
  String get analysisStep1 => 'Анализируем генетику...';

  @override
  String get analysisStep2 => 'Считаем скорость роста...';

  @override
  String get analysisStep3 => 'Обрабатываем питание и сон...';

  @override
  String get analysisStep4 => 'Строим прогноз роста...';

  @override
  String get analysisStep5 => 'Считаем оценку BeTaller...';

  @override
  String growthPotential(String cm, String unit) {
    return 'Потенциал роста: +$cm $unit';
  }

  @override
  String get heightAt21 => 'к 21 году';

  @override
  String confidenceLevel(String pct) {
    return 'Уверенность: $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'Диапазон: $min - $max $unit';
  }

  @override
  String get currentLabel => 'СЕЙЧАС';

  @override
  String get predictedLabel => 'ПРОГНОЗ';

  @override
  String get yearlyPredictions => 'Прогноз по годам';

  @override
  String get tipMorningMeasure =>
      'Измеряй рост утром. За день диски позвоночника сжимаются, и ты становишься чуть ниже, поэтому утренний замер самый точный.';

  @override
  String get tipProteinSpread =>
      'Распределяй белок по приёмам пищи. Не ешь всё сразу — добавляй белок в каждый приём.';

  @override
  String get tipGrowthHormone =>
      'Больше всего гормона роста выделяется во сне. Старайся спать с 22:00 до 2:00!';

  @override
  String get tipVitaminD =>
      '15 минут на солнце каждый день помогают вырабатывать витамин D. Без него кальций плохо усваивается.';

  @override
  String get tipBarHanging =>
      'Вис на турнике разгружает позвоночник. Попробуй 3×30 секунд каждый день.';

  @override
  String get tipSwimming =>
      'Плавание — лучший спорт, чтобы нагрузить всё тело и поддержать рост.';

  @override
  String get tipStress =>
      'Стресс подавляет гормон роста. Снимай его медитацией и йогой.';

  @override
  String get routineMorningStretch => 'Утренняя растяжка';

  @override
  String get routineMorningStretchDesc =>
      '10 минут растяжки сразу после пробуждения. Тяни позвоночник и мышцы ног.';

  @override
  String get routineBarHanging => 'Вис на турнике';

  @override
  String get routineBarHangingDesc =>
      'Повисни на турнике, чтобы вытянуть позвоночник. 3 подхода × 30 секунд.';

  @override
  String get routineCobraStretch => 'Поза кобры';

  @override
  String get routineCobraStretchDesc =>
      'Ляг на живот и подними верх корпуса. Тяни позвоночник. 3 подхода × 15 секунд.';

  @override
  String get routineJumping => 'Прыжки';

  @override
  String get routineJumpingDesc =>
      'Скакалка или прыжки из приседа. Стимулируют зоны роста. 3 подхода × 20 раз.';

  @override
  String get routineSwimming => 'Плавание или баскетбол';

  @override
  String get routineSwimmingDesc =>
      'Занимайся спортом, который помогает росту. Минимум 30 минут.';

  @override
  String get routineYoga => 'Вечерняя йога и растяжка';

  @override
  String get routineYogaDesc =>
      'Йога и растяжка перед сном. Снимают стресс и расслабляют мышцы.';

  @override
  String get routineProtein => 'Белок';

  @override
  String get routineProteinDesc =>
      'Яйца, курица, рыба, молочка. Минимум 1,5 г белка на кг веса в день.';

  @override
  String get routineCalcium => 'Кальций и витамин D';

  @override
  String get routineCalciumDesc =>
      'Молоко, сыр, йогурт. 15 минут на солнце. Это очень важно для костей.';

  @override
  String get routineWater => 'Норма воды';

  @override
  String get routineWaterDesc =>
      'Пей минимум 2–3 литра воды в день. Это важно для обмена веществ и роста.';

  @override
  String get routineAvoidJunk => 'Без фастфуда';

  @override
  String get routineAvoidJunkDesc =>
      'Держись подальше от фастфуда, сладких напитков и переработанной еды.';

  @override
  String get routineSleep => 'Хороший сон (8–10 ч)';

  @override
  String get routineSleepDesc =>
      'Гормон роста выделяется во сне. С 22:00 до 6:00 — золотые часы.';

  @override
  String get routineNoScreen => 'Без экранов перед сном';

  @override
  String get routineNoScreenDesc =>
      'Отложи телефон и компьютер за час до сна. Не мешай выработке мелатонина.';

  @override
  String get routinePosture => 'Проверка осанки';

  @override
  String get routinePostureDesc =>
      'Спина прямая, плечи назад. Проверяй каждый час. Хорошая осанка = разница в 2–3 см.';

  @override
  String get routineWallStand => 'Стойка у стены';

  @override
  String get routineWallStandDesc =>
      'Встань спиной к стене: пятки, таз, плечи и голова касаются стены. Держи 5 минут.';

  @override
  String get routineSprintIntervals => 'Спринт-интервалы';

  @override
  String get routineSprintIntervalsDesc =>
      'Короткие мощные спринты дают заметный выброс гормона роста.';

  @override
  String get routineHiitWorkout => 'HIIT-тренировка';

  @override
  String get routineHiitWorkoutDesc =>
      'Высокоинтенсивные интервалы, чтобы выжать максимум гормона роста.';

  @override
  String get routineSquats => 'Приседания';

  @override
  String get routineSquatsDesc =>
      'Приседания с собственным весом стимулируют зоны роста в ногах и позвоночнике.';

  @override
  String get routineDeadliftStretch => 'Растяжка в наклоне';

  @override
  String get routineDeadliftStretchDesc =>
      'Растяжка в наклоне разгружает позвоночник и полезна для межпозвоночных дисков.';

  @override
  String get routineOverheadPress => 'Жим над головой';

  @override
  String get routineOverheadPressDesc =>
      'Жим над головой вытягивает позвоночник и укрепляет мышцы осанки.';

  @override
  String get routineSkippingRope => 'Скакалка';

  @override
  String get routineSkippingRopeDesc =>
      'Прыжки на скакалке стимулируют зоны роста в ногах.';

  @override
  String get routinePilatesCore => 'Пилатес на кор';

  @override
  String get routinePilatesCoreDesc =>
      'Упражнения пилатеса на кор помогают держать позвоночник ровно и улучшают осанку.';

  @override
  String get routineInversionHang => 'Вис вниз головой';

  @override
  String get routineInversionHangDesc =>
      'Вис вниз головой разгружает межпозвоночные диски и может временно добавить 1–2 см.';

  @override
  String get routineZincIntake => 'Продукты с цинком';

  @override
  String get routineZincIntakeDesc =>
      'Ешь продукты с цинком в течение дня — он нужен для выработки гормона роста.';

  @override
  String get routineVitaminDSunlight => 'Витамин D и солнце';

  @override
  String get routineVitaminDSunlightDesc =>
      'Бывай на прямом солнце минимум 15 минут — для витамина D и роста костей.';

  @override
  String get routineArginineFoods => 'Продукты с аргинином';

  @override
  String get routineArginineFoodsDesc =>
      'Ешь продукты с аргинином — он стимулирует выработку гормона роста.';

  @override
  String get routineDailyCalories => 'Норма калорий';

  @override
  String get routineDailyCaloriesDesc =>
      'Набирай свою дневную норму калорий. Недоедание тормозит рост.';

  @override
  String get routineSleepEnvironment => 'Условия для сна';

  @override
  String get routineSleepEnvironmentDesc =>
      'Сделай в спальне темно и прохладно — так выделяется больше мелатонина и гормона роста.';

  @override
  String get routinePreSleepRoutine => 'Спокойный вечер';

  @override
  String get routinePreSleepRoutineDesc =>
      'Постоянный ритуал перед сном улучшает глубокий сон на 23%.';

  @override
  String get routineNeckStretches => 'Растяжка шеи';

  @override
  String get routineNeckStretchesDesc =>
      'Растяжка шеи снимает зажатость и выравнивает шейный отдел.';

  @override
  String get routineShoulderRolls => 'Раскрытие плеч';

  @override
  String get routineShoulderRollsDesc =>
      'Раскрытые плечи убирают сутулость и визуально добавляют 1–2 см.';

  @override
  String get achieveCommitment => 'Настрой';

  @override
  String get achieveCommitmentDesc =>
      'Введи все данные, изучи приложение и начни им пользоваться';

  @override
  String get achieveFirstDay => 'Первый шаг';

  @override
  String get achieveFirstDayDesc => 'Заверши первый день';

  @override
  String get achieveThreeStreak => '3 дня подряд';

  @override
  String get achieveThreeStreakDesc => 'Выполняй задания 3 дня подряд';

  @override
  String get achieveWeekStreak => '7 дней подряд';

  @override
  String get achieveWeekStreakDesc => 'Выполняй задания 7 дней подряд';

  @override
  String get achieveTwoWeekStreak => '14 дней подряд';

  @override
  String get achieveTwoWeekStreakDesc => 'Продержись 14 дней без перерыва';

  @override
  String get achieveMonthStreak => '30 дней подряд';

  @override
  String get achieveMonthStreakDesc => 'Пройди 30 дней подряд';

  @override
  String get achieveTwoMonthStreak => '60 дней подряд';

  @override
  String get achieveTwoMonthStreakDesc => 'Пройди 60 дней подряд';

  @override
  String get achieveHundredStreak => '100 дней подряд';

  @override
  String get achieveHundredStreakDesc => 'Пройди 100 дней подряд';

  @override
  String get achieveFirstMeasure => 'Первый замер';

  @override
  String get achieveFirstMeasureDesc => 'Запиши первый замер роста';

  @override
  String get achieveThreeMeasures => 'Наблюдатель';

  @override
  String get achieveThreeMeasuresDesc => 'Запиши 3 замера роста';

  @override
  String get achieveFiveMeasures => 'Регулярный учёт';

  @override
  String get achieveFiveMeasuresDesc => 'Запиши 5 замеров роста';

  @override
  String get achieveTenMeasures => 'Охотник за данными';

  @override
  String get achieveTenMeasuresDesc => 'Запиши 10 замеров роста';

  @override
  String get achieveFirstCm => 'Первый сантиметр';

  @override
  String get achieveFirstCmDesc => 'Зафиксируй общий прирост 1 см';

  @override
  String get achieveThreeCm => '+3 см';

  @override
  String get achieveThreeCmDesc => 'Зафиксируй общий прирост 3 см';

  @override
  String get achieveFiveCm => '+5 см';

  @override
  String get achieveFiveCmDesc => 'Зафиксируй общий прирост 5 см';

  @override
  String get achieveTenCm => '+10 см';

  @override
  String get achieveTenCmDesc => 'Зафиксируй общий прирост 10 см';

  @override
  String get quote1 => 'Будь лучше, чем вчера. Каждый день.';

  @override
  String get quote2 =>
      'Рост не случается за одну ночь, но каждая ночь приближает тебя к цели.';

  @override
  String get quote3 => 'Рост требует терпения — не сдавайся!';

  @override
  String get quote4 =>
      'Шаг, который ты делаешь сегодня, — фундамент завтрашнего дня.';

  @override
  String get quote5 =>
      'Дисциплина начинается там, где заканчивается мотивация.';

  @override
  String get quote6 => 'Твоё тело скажет тебе спасибо — продолжай!';

  @override
  String get quote7 => 'Границы своего потенциала задаёшь только ты.';

  @override
  String get quote8 => 'Маленькие шаги приводят к большим переменам.';

  @override
  String get quote9 => 'Лучшая инвестиция — в себя.';

  @override
  String get quote10 => 'С каждым днём ты всё ближе к цели.';

  @override
  String get quote11 => 'Меняться трудно, но жалеть ещё труднее.';

  @override
  String get quote12 => 'Твоё тело — твой храм. Береги его.';

  @override
  String get quote13 =>
      'Твой соперник — твоё вчерашнее «я». Обгони его сегодня!';

  @override
  String get quote14 => 'BeTaller = Терпение + Дисциплина + Вера';

  @override
  String get quote15 => 'Верь в себя — путь сам тебя изменит.';

  @override
  String get quote16 =>
      'Не говори сегодня «не могу» — не придётся жалеть завтра.';

  @override
  String get quote17 => 'Становись лучше каждый день, пусть даже на 1%.';

  @override
  String get quote18 => 'Зеркало покажет твой прогресс — наберись терпения.';

  @override
  String get bmiNormal => 'Норма';

  @override
  String get bmiUnderweight => 'Недовес';

  @override
  String get bmiOverweight => 'Лишний вес';

  @override
  String get bmiObese => 'Ожирение';

  @override
  String get velocityExcellent => 'Отлично';

  @override
  String get velocityNormal => 'Норма';

  @override
  String get velocitySlow => 'Медленно';

  @override
  String get velocityVeryLow => 'Очень низко';

  @override
  String durationMinutes(String min) {
    return '$min мин';
  }

  @override
  String get durationAllDay => 'Весь день';

  @override
  String get durationNight => 'Ночь';

  @override
  String durationHours(String hours) {
    return '$hours ч';
  }

  @override
  String get onboardingStep1 => 'Введи личные данные';

  @override
  String get onboardingStep2 => 'Укажи свой прошлый рост';

  @override
  String get onboardingStep3 => 'Оцени свои привычки';

  @override
  String get onboardingStep4 => 'Посмотри прогноз и оценку';

  @override
  String get hoursShort => 'ч';

  @override
  String get selectLanguage => 'Выбери язык';

  @override
  String get systemLanguage => 'Язык системы';

  @override
  String get emailSubject => 'Отзыв о BeTaller';

  @override
  String get pastHeightsTip =>
      'Если не помнишь рост в каком-то возрасте — оставь пустым. Хватит 1–2 значений.';

  @override
  String get obPastHeightsTitle => 'Прошлый рост';

  @override
  String get obPastHeightsSubPart1 =>
      'Твой прошлый рост делает прогноз точнее.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'Какой у тебя был рост в $age?';
  }

  @override
  String get obSkip => 'Пропустить';

  @override
  String get obNext => 'Далее';

  @override
  String get obSkipAll => 'Пропустить всё';

  @override
  String get currentSuffix => '(сейчас)';

  @override
  String personalizedProtein(String amount) {
    return 'Яйца, курица, рыба, молочка. Минимум $amount г белка в день.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Пей минимум $amount л воды в день. Это важно для обмена веществ и роста.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Гормон роста выделяется во сне. Спи минимум $hours ч. С 22:00 до 6:00 — золотые часы.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Молоко, сыр, йогурт. 15 минут на солнце. Норма калорий в день: $calories ккал.';
  }

  @override
  String get scoreS => 'Отлично! Ты выходишь на пик своего потенциала.';

  @override
  String get scoreA => 'Всё идёт отлично! Немного улучшений — и ты на вершине.';

  @override
  String get scoreB =>
      'Ты на верном пути. Удели чуть больше внимания заданиям и питанию.';

  @override
  String get scoreC => 'Есть куда расти. Регулярные задания дадут результат.';

  @override
  String get scoreD => 'Потенциал высокий, но пора действовать.';

  @override
  String get scoreF =>
      'Начни прямо сейчас! Маленький шаг каждый день — большая разница.';

  @override
  String get cmPerYear => 'см/год';

  @override
  String get howToDoIt => 'Как выполнять';

  @override
  String get musclesTargeted => 'Какие мышцы и кости работают';

  @override
  String get scientificBasis => 'Научная основа';

  @override
  String setXofY(String current, String total) {
    return 'Подход $current из $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Отдых перед подходом $set';
  }

  @override
  String get allSetsComplete => 'Все подходы выполнены!';

  @override
  String get setTimer => 'Таймер подходов';

  @override
  String get setTracker => 'Счётчик подходов';

  @override
  String get builtInTimer => 'Встроенный таймер';

  @override
  String get markComplete => 'Отметить выполненным';

  @override
  String get markIncomplete => 'Снять отметку';

  @override
  String get done => 'Готово';

  @override
  String get doneExclamation => 'Готово!';

  @override
  String get start => 'Старт';

  @override
  String get pause => 'Пауза';

  @override
  String get resetTimer => 'Сброс';

  @override
  String get skipRest => 'Пропустить отдых';

  @override
  String get restart => 'Заново';

  @override
  String get perSet => 'за подход';

  @override
  String get rest => 'ОТДЫХ';

  @override
  String get reps => 'повт.';

  @override
  String get difficultyBeginner => 'Новичок';

  @override
  String get difficultyIntermediate => 'Средний';

  @override
  String get difficultyAdvanced => 'Продвинутый';

  @override
  String get learnTitle => 'Знания';

  @override
  String get learnSubtitle => 'Научные факты о росте';

  @override
  String get categoryAll => 'Все';

  @override
  String get categoryScience => 'Наука';

  @override
  String get categoryNutrition => 'Питание';

  @override
  String get categoryExercise => 'Упражнения';

  @override
  String get categorySleep => 'Сон';

  @override
  String get categoryMyths => 'Мифы';

  @override
  String get scientificReferences => 'Научные источники';

  @override
  String get relatedRoutines => 'Похожие задания';

  @override
  String get nutritionTitle => 'Питание';

  @override
  String get sectionMealPlan => 'План питания';

  @override
  String get sectionNutrients => 'Нутриенты';

  @override
  String get sectionFoods => 'Продукты';

  @override
  String get sectionSupplements => 'Добавки';

  @override
  String todaysPlan(String day) {
    return 'План на сегодня — $day';
  }

  @override
  String get breakfast => 'Завтрак';

  @override
  String get lunch => 'Обед';

  @override
  String get dinner => 'Ужин';

  @override
  String get snacks => 'Перекусы';

  @override
  String get searchFoods => 'Поиск продуктов...';

  @override
  String nFoods(String count) {
    return 'Продуктов: $count';
  }

  @override
  String dailyLabel(String amount) {
    return 'В день: $amount';
  }

  @override
  String get dailyNeedByAge => 'НОРМА В ДЕНЬ ПО ВОЗРАСТУ';

  @override
  String agePrefix(String range) {
    return 'Возраст $range';
  }

  @override
  String get topFoodSources => 'ЛУЧШИЕ ИСТОЧНИКИ';

  @override
  String get categoryDairy => 'Молочное';

  @override
  String get categoryMeatFish => 'Мясо и рыба';

  @override
  String get categoryVegetables => 'Овощи';

  @override
  String get categoryFruits => 'Фрукты';

  @override
  String get categoryGrains => 'Злаки и бобовые';

  @override
  String get categoryNutsSeeds => 'Орехи и семечки';

  @override
  String get weeklyReportTitle => 'Отчёт за неделю';

  @override
  String get weeklyScoreLabel => 'Оценка недели';

  @override
  String get weeklyDailyCompletion => 'По дням';

  @override
  String get weeklyHabits => 'Привычки';

  @override
  String get overview => 'Обзор';

  @override
  String get routinesLabel => 'Задания';

  @override
  String get streakLabel => 'Серия';

  @override
  String get heightLabel => 'Рост';

  @override
  String get weightLabel => 'Вес';

  @override
  String get dadLabel => 'Папа';

  @override
  String get motherLabel => 'Мама';

  @override
  String get metricShort => 'Метрич.';

  @override
  String get imperialShort => 'Импер.';

  @override
  String get dailyScores => 'Оценки по дням';

  @override
  String get waterToday2 => 'Вода сегодня';

  @override
  String get sleepToday => 'Сон сегодня';

  @override
  String get routineCompletion => 'Выполнение заданий';

  @override
  String get xpAndLevel => 'XP и уровень';

  @override
  String xpToNextLevel(String xp) {
    return 'До следующего уровня: $xp XP';
  }

  @override
  String get activeChallenges => 'Активные челленджи';

  @override
  String nOfMCompleted(String n, String m) {
    return 'Выполнено: $n/$m';
  }

  @override
  String get shareYourProgress => 'Поделись прогрессом';

  @override
  String get shareComingSoon => 'Функция «Поделиться» скоро появится!';

  @override
  String get premiumTest => 'Премиум (тест)';

  @override
  String get premiumActive => 'Активен';

  @override
  String get premiumFree => 'Бесплатно';

  @override
  String get weeklyReportMenu => 'Отчёт за неделю';

  @override
  String get weeklyReportMenuSubtitle => 'Итоги твоего прогресса';

  @override
  String get unlockGrowthPotential => 'Раскрой весь свой потенциал роста';

  @override
  String get featureGrowthAnalysis => 'Анализ роста и оценка';

  @override
  String get featureHeightPrediction => 'Прогноз роста';

  @override
  String get featureAllRoutines => 'Все 14 ежедневных заданий';

  @override
  String get featureWaterSleep => 'Учёт воды и сна';

  @override
  String get featureProgress => 'Прогресс и замеры';

  @override
  String get featureAchievements => 'Достижения и серии';

  @override
  String get planMonthly => 'Месяц';

  @override
  String get planYearly => 'Год';

  @override
  String get bestValue => 'ВЫГОДНЕЕ ВСЕГО';

  @override
  String get premiumLabel => 'Премиум';

  @override
  String lvl(String level) {
    return 'УР. $level';
  }

  @override
  String get levelBeginner => 'Новичок';

  @override
  String get levelStarter => 'Начинающий';

  @override
  String get levelCommitted => 'Увлечённый';

  @override
  String get levelDedicated => 'Преданный';

  @override
  String get levelConsistent => 'Постоянный';

  @override
  String get levelFocused => 'Сосредоточенный';

  @override
  String get levelDetermined => 'Решительный';

  @override
  String get levelDisciplined => 'Дисциплинированный';

  @override
  String get levelStrong => 'Сильный';

  @override
  String get levelAdvanced => 'Продвинутый';

  @override
  String get levelExpert => 'Эксперт';

  @override
  String get levelMaster => 'Мастер';

  @override
  String get levelElite => 'Элита';

  @override
  String get levelChampion => 'Чемпион';

  @override
  String get levelLegend => 'Легенда';

  @override
  String get levelTitan => 'Титан';

  @override
  String get levelMythic => 'Мифический';

  @override
  String get levelImmortal => 'Бессмертный';

  @override
  String get levelTranscendent => 'Запредельный';

  @override
  String get levelUltimate => 'Абсолют';

  @override
  String get challengeCompleteAllRoutines => 'Все задания';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Выполни сегодня все задания';

  @override
  String get challengeHydrationHero => 'Герой воды';

  @override
  String get challengeHydrationHeroDesc => 'Выпей дневную норму воды';

  @override
  String get challengeEarlySleeper => 'Ранний сон';

  @override
  String get challengeEarlySleeperDesc => 'Запиши 8+ часов сна';

  @override
  String get challengeExerciseTrio => 'Тройка упражнений';

  @override
  String get challengeExerciseTrioDesc => 'Выполни 3 упражнения';

  @override
  String get challengeMorningStretch => 'Утренняя растяжка';

  @override
  String get challengeMorningStretchDesc => 'Сделай утреннюю растяжку до 9:00';

  @override
  String get challenge7DayWarrior => 'Воин 7 дней';

  @override
  String get challenge7DayWarriorDesc => 'Выполняй все задания 7 дней подряд';

  @override
  String get challengeGrowthTracker => 'Следим за ростом';

  @override
  String get challengeGrowthTrackerDesc => 'Запиши замер роста на этой неделе';

  @override
  String get challengeHydrationWeek => 'Неделя воды';

  @override
  String get challengeHydrationWeekDesc =>
      'Выпивай норму воды 5 дней на этой неделе';

  @override
  String get challengeFitnessChampion => 'Чемпион фитнеса';

  @override
  String get challengeFitnessChampionDesc =>
      'Выполни 15 упражнений на этой неделе';

  @override
  String get challengeSleepMaster => 'Мастер сна';

  @override
  String get challengeSleepMasterDesc => 'Спи 8+ часов 5 дней';

  @override
  String get performanceDashboard => 'ПАНЕЛЬ РЕЗУЛЬТАТОВ';

  @override
  String get tierA => 'РАНГ A';

  @override
  String get tierB => 'РАНГ B';

  @override
  String get tierC => 'РАНГ C';

  @override
  String get tierD => 'РАНГ D';

  @override
  String get tierE => 'РАНГ E';

  @override
  String get maxTierReached => 'ВЫСШИЙ РАНГ';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Следующий ранг: $tier · нужно +$pts очк.';
  }

  @override
  String get premiumBadge => 'Премиум';

  @override
  String get manageRoutines => 'Настроить задания';

  @override
  String get manageRoutinesSubtitle =>
      'Показывай или скрывай задания в списке на день';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return 'Активно: $visible из $total';
  }

  @override
  String get showAll => 'Показать все';

  @override
  String get hideAll => 'Скрыть все';

  @override
  String get heightAnalysis => 'Анализ роста';

  @override
  String get heightVsPopulation => 'Твоё место на графике роста CDC';

  @override
  String get globalAveragesTable => 'Средний рост по возрасту (CDC)';

  @override
  String get standingTall => 'Высокий рост';

  @override
  String get standingAboveAverage => 'Выше среднего';

  @override
  String get standingBelowAverage => 'Ниже среднего';

  @override
  String get standingShort => 'Ниже сверстников';

  @override
  String get yourHeightStanding => 'ТВОЙ РОСТ СРЕДИ СВЕРСТНИКОВ';

  @override
  String get bellCurveCaption => 'Как распределяется рост в твоём возрасте';

  @override
  String get bellShorterThanYou => 'ниже тебя';

  @override
  String get yourHeight => 'Ты';

  @override
  String peerAvg(int age) {
    return 'Среднее в $age';
  }

  @override
  String get aboveAvg => 'Выше ср.';

  @override
  String get belowAvg => 'Ниже ср.';

  @override
  String get whoDataSource => 'Графики роста CDC (США)';

  @override
  String get percentileShort5 => '5-й';

  @override
  String get percentileShort50 => '50-й';

  @override
  String get percentileShort95 => '95-й';

  @override
  String get youLabel => 'Ты';

  @override
  String get avgHeightLabel => 'СРЕД.';

  @override
  String get percentileLabel => 'ПЕРЦ.';

  @override
  String get diffLabel => 'РАЗН.';

  @override
  String get whoSourceNote =>
      'Источник данных: графики роста CDC США 2000 года (рост по возрасту, от 2 до 20 лет). Перцентили сравнивают тебя с населением США и в других странах могут отличаться.';

  @override
  String get quickPhotos => 'Фото';

  @override
  String get quickPosture => 'Осанка';

  @override
  String get quickWellness => 'Самочувствие';

  @override
  String get quickRecipes => 'Рецепты';

  @override
  String get wellnessTitle => 'Самочувствие';

  @override
  String get wellnessHeader => 'САМОЧУВСТВИЕ';

  @override
  String get wellnessSubtitle => 'Следи за тем, что влияет на твой рост';

  @override
  String get caffeineToday => 'Кофеин сегодня';

  @override
  String get withinLimits => 'В пределах нормы';

  @override
  String get approachingLimit => 'Почти на пределе';

  @override
  String get overLimit => 'Перебор, мешает гормону роста';

  @override
  String get resetToday => 'Сбросить за сегодня';

  @override
  String get stressToday => 'Стресс сегодня';

  @override
  String get stressVeryCalmLabel => 'Полное спокойствие — лучшее для роста';

  @override
  String get stressCalmLabel => 'Спокойно';

  @override
  String get stressNeutralLabel => 'Нормально';

  @override
  String get stressStressedLabel => 'Напряжённо';

  @override
  String get stressVeryStressedLabel =>
      'Сильный стресс — кортизол блокирует гормон роста';

  @override
  String get stressTapToLog => 'Нажми и отметь, как ты сегодня';

  @override
  String get todaysJournal => 'Дневник за сегодня';

  @override
  String get journalNoNote => '(без заметки)';

  @override
  String get journalEdit => 'Изменить';

  @override
  String get journalHowWasToday => 'Как прошёл день?';

  @override
  String get journalSaved => 'Запись сохранена · +5 XP';

  @override
  String get journalSaveEntry => 'Сохранить запись';

  @override
  String get weeklyInsight => 'Итог недели';

  @override
  String get weeklyInsightCaffeine => 'КОФЕИН';

  @override
  String get weeklyInsightStress => 'СТРЕСС';

  @override
  String get weeklyInsightMood => 'НАСТРОЕНИЕ';

  @override
  String get wellnessInfoTitle => 'Почему важно самочувствие';

  @override
  String get wellnessInfoBody =>
      'Кофеин мешает глубокому сну, а именно в нём выделяется больше всего гормона роста (СТГ). Постоянный стресс повышает кортизол, который напрямую подавляет СТГ. Дневник помогает не бросать привычки, которые поддерживают рост.';

  @override
  String get wellnessInfoGotIt => 'Понятно';

  @override
  String get insightCaffeineHigh =>
      'На этой неделе много кофеина. Попробуй пить меньше — будет лучше сон и больше СТГ.';

  @override
  String get insightStressHigh =>
      'На этой неделе стресс повышен. Попробуй дыхательные упражнения: кортизол тормозит рост.';

  @override
  String get insightMoodLow =>
      'В последнее время настроение на нуле. Помогут солнце, сон и лёгкая активность.';

  @override
  String get insightGreat =>
      'Отличный баланс на этой неделе. Твоё самочувствие помогает расти.';

  @override
  String get insightDefault =>
      'С самочувствием всё в порядке. Продолжай отмечать — выводы будут точнее.';

  @override
  String get insightNeedMoreData =>
      'Отмечай ещё несколько дней, чтобы увидеть выводы.';

  @override
  String get progressPhotosTitle => 'Фото прогресса';

  @override
  String get progressPhotosHeader => 'ФОТО ПРОГРЕССА';

  @override
  String get progressPhotosSubtitle => 'Следи за изменениями на фото';

  @override
  String get addProgressPhoto => 'Добавить фото';

  @override
  String get captureJourney => 'Сохраняй свой путь на фото';

  @override
  String get takePhoto => 'Сделать фото';

  @override
  String get chooseFromLibrary => 'Выбрать из галереи';

  @override
  String get deletePhotoTitle => 'Удалить фото?';

  @override
  String get deletePhotoBody => 'Это фото пропадёт из ленты прогресса.';

  @override
  String get timelineTab => 'Лента';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'фото',
      many: 'фото',
      few: 'фото',
      one: 'фото',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit за $days дн.';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'дня',
      many: 'дней',
      few: 'дня',
      one: 'день',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return 'Прирост, $unit';
  }

  @override
  String get firstPhotoMessage =>
      'Сделай первое фото, чтобы следить за изменениями.';

  @override
  String get takeFirstPhoto => 'Сделать первое фото';

  @override
  String get beforeAfter => 'ДО / ПОСЛЕ';

  @override
  String get beforeLabel => 'ДО';

  @override
  String get afterLabel => 'ПОСЛЕ';

  @override
  String get yourHeightDialog => 'Твой рост';

  @override
  String get heightDialogMessage => 'Введи свой текущий рост для этого фото';

  @override
  String get postureAnalysisTitle => 'Анализ осанки';

  @override
  String get postureCoachHeader => 'ТРЕНЕР ОСАНКИ';

  @override
  String get postureCoachSubtitle => 'Проверь себя по фото сбоку';

  @override
  String get latestScore => 'ПОСЛЕДНЯЯ ОЦЕНКА';

  @override
  String get latestAnalysis => 'ПОСЛЕДНИЙ АНАЛИЗ';

  @override
  String get headPosition => 'Положение головы';

  @override
  String get progressLabel => 'ПРОГРЕСС';

  @override
  String get choosePhotoSource => 'Откуда взять фото';

  @override
  String get sideProfileHint => 'Сбоку, всё тело в кадре';

  @override
  String get howToTakePhoto => 'КАК СДЕЛАТЬ ФОТО';

  @override
  String get takePosturePhoto => 'Сфоткать осанку';

  @override
  String get postureExcellent => 'Отлично';

  @override
  String get postureGood => 'Хорошо';

  @override
  String get postureNeedsWork => 'Есть над чем работать';

  @override
  String get posturePoor => 'Плохо';

  @override
  String get recommendedExercises => 'РЕКОМЕНДУЕМЫЕ УПРАЖНЕНИЯ';

  @override
  String get postureWallStand => 'Стойка у стены';

  @override
  String get postureWallStandDesc =>
      'Стой спиной к стене по 2 минуты каждый день.';

  @override
  String get postureChestOpener => 'Раскрытие груди';

  @override
  String get postureChestOpenerDesc =>
      'Растягивает зажатые грудные мышцы, которые тянут плечи вперёд.';

  @override
  String get postureChinTucks => 'Втягивание подбородка';

  @override
  String get postureChinTucksDesc =>
      'Исправляет голову, выдвинутую вперёд — 3×10 повторов.';

  @override
  String get postureDeadbug => 'Мёртвый жук';

  @override
  String get postureDeadbugDesc =>
      'Укрепляет глубокие мышцы кора и помогает контролировать прогиб в пояснице.';

  @override
  String get recipesTitle => 'Рецепты';

  @override
  String get recipesHeader => 'РЕЦЕПТЫ';

  @override
  String get recipesSubtitle => 'Топливо для роста';

  @override
  String get recipesCategoryAll => 'Все';

  @override
  String get recipesCategoryBreakfast => 'Завтрак';

  @override
  String get recipesCategoryLunch => 'Обед';

  @override
  String get recipesCategoryDinner => 'Ужин';

  @override
  String get recipesCategorySnack => 'Перекус';

  @override
  String get recipesGoalAll => 'Все';

  @override
  String get recipeDiffEasy => 'Легко';

  @override
  String get recipeDiffMedium => 'Средне';

  @override
  String get recipeDiffHard => 'Сложно';

  @override
  String get recipesFilterType => 'ТИП';

  @override
  String get recipesFilterNutrient => 'БОГАТО';

  @override
  String get recipesGoalVitaminD => 'Витамин D';

  @override
  String get recipesGoalZinc => 'Цинк';

  @override
  String get recipesGoalMagnesium => 'Магний';

  @override
  String recipesCountLabel(int count) {
    return 'Рецептов: $count';
  }

  @override
  String get recipeIngredients => 'Ингредиенты';

  @override
  String get recipeSteps => 'Приготовление';

  @override
  String get recipesGoalProtein => 'Много белка';

  @override
  String get recipesGoalCalcium => 'Кальций';

  @override
  String get recipesGoalOmega3 => 'Омега-3';

  @override
  String get recipesGoalIron => 'Железо';

  @override
  String get recipesNoMatch => 'Под эти фильтры рецептов нет';

  @override
  String get recipesIngredients => 'Ингредиенты';

  @override
  String get recipesInstructions => 'Как готовить';

  @override
  String get recipesClose => 'ЗАКРЫТЬ';

  @override
  String get recipesAboutTitle => 'О рецептах';

  @override
  String get recipesAboutBody =>
      'Подобранные рецепты, которые дают энергию для роста. Фильтруй по типу блюда или по нутриенту, чтобы найти то, что подходит твоему плану.';

  @override
  String get animHintSpinalDecomp => 'Разгрузка позвоночника';

  @override
  String get animHintGravityReversal => 'Против гравитации';

  @override
  String get animHintImpactBones => 'Ударная нагрузка для костей';

  @override
  String get animHintHighImpact => 'Сильная ударная нагрузка на кости';

  @override
  String get animHintMetabolicBurst => 'Взрывная метаболическая тренировка';

  @override
  String get animHintFullBodyStretch => 'Бодрящая растяжка всего тела';

  @override
  String get animHintSpinalExtension => 'Вытяжение позвоночника';

  @override
  String get animHintCervicalDecomp => 'Разгрузка шейного отдела';

  @override
  String get animHintShoulderMobility => 'Подвижность плеч';

  @override
  String get animHintFullBodyMotion => 'Движение всего тела';

  @override
  String get animHintPosteriorChain => 'Растяжка задней цепи';

  @override
  String get animHintMuscleGrowth => 'Топливо для мышц';

  @override
  String get animHintBoneDensity => 'Для плотности костей';

  @override
  String get animHintSpinalDisc => 'Увлажнение дисков позвоночника';

  @override
  String get animHintCleanNutrition => 'Чистое питание';

  @override
  String get animHintIgf1 => 'Поддержка IGF-1';

  @override
  String get animHintHghAmino => 'Аминокислота для СТГ';

  @override
  String get animHintCalciumAbsorption => 'Усвоение кальция';

  @override
  String get animHintSpinalAlignment => 'Ровный позвоночник';

  @override
  String get animHintPostureCorrection => 'Коррекция осанки';

  @override
  String get animHintMindBody => 'Баланс тела и разума';

  @override
  String get animHintCoreStability => 'Стабильность кора';

  @override
  String get animHintLegPower => 'Сила ног и всплеск СТГ';

  @override
  String get animHintVerticalPower => 'Сила прыжка';

  @override
  String get animHintHghSurge => 'Тренировка для всплеска СТГ';

  @override
  String get animHintPeakHgh => 'Окно пика СТГ';

  @override
  String get animHintMelatonin => 'Больше мелатонина';

  @override
  String get animHintDeepSleep => 'Подготовка к глубокому сну';

  @override
  String get animHintSleepOpt => 'Улучшение сна';

  @override
  String get animHintExercise => 'Упражнение';

  @override
  String get formMorningStretch =>
      'Начни с вращений шеей, потом переходи к растяжке всего тела. Держи каждую позу 20–30 секунд, без пружинящих движений.';

  @override
  String get formBarHanging =>
      'Возьмись за турник на ширине плеч, полностью расслабься и дай гравитации вытянуть позвоночник. Не раскачивайся.';

  @override
  String get formCobraStretch =>
      'Ляг на живот, ладони под плечами. Медленно поднимай верх корпуса, бёдра оставь на полу. Смотри вверх.';

  @override
  String get formJumping =>
      'Делай прыжки из приседа или прыгай на скакалке. Приземляйся мягко на носки. Отдыхай 30 секунд между подходами.';

  @override
  String get formSwimmingBasketball =>
      'Выбери плавание (кроль/на спине) или баскетбол. Делай упор на прыжки, вытягивание и полную амплитуду.';

  @override
  String get formEveningYoga =>
      'Делай мягкие позы: кошка-корова, поза ребёнка, собака мордой вниз, наклон вперёд. Дыши глубоко и держи каждую позу 30–60 секунд.';

  @override
  String get formSprintIntervals =>
      'Разомнись 5 минут, затем беги изо всех сил 30 секунд. 90 секунд иди шагом или трусцой, чтобы восстановиться. Повтори.';

  @override
  String get formHiitWorkout =>
      'Делай бёрпи, «альпиниста» и прыжки из приседа на максимум 45 секунд, потом отдых 15 секунд.';

  @override
  String get formSquats =>
      'Встань, ноги на ширине плеч. Опускайся, пока бёдра не станут параллельны полу. Спина прямая, колени не выходят за носки.';

  @override
  String get formDeadliftStretch =>
      'Встань, ноги на ширине таза. Наклонись от бёдер с ровной спиной. Тянись к носкам — почувствуй растяжение в задней поверхности бёдер и спине.';

  @override
  String get formOverheadPress =>
      'Встань прямо и выжми руки вверх до полного выпрямления. Используй лёгкий вес или работай без него. Держи кор в напряжении и не прогибай спину.';

  @override
  String get formSkippingRope =>
      'Прыгай на двух ногах, мягко приземляясь на носки. Прыжки невысокие и ровные. Отдыхай между подходами.';

  @override
  String get formPilatesCore =>
      'Делай планку, «мёртвого жука», «птицу-собаку», мостик и подъёмы ног. Двигайся под контролем и следи за дыханием.';

  @override
  String get formInversionHang =>
      'Используй инверсионный стол или гравитационные ботинки. Начни с небольшого наклона и увеличивай постепенно. Подходы делай короткими.';

  @override
  String get formProtein =>
      'Распредели белок на 3–4 приёма пищи. Ешь яйца, курицу, рыбу, молочку и бобовые.';

  @override
  String get formCalciumVitaminD =>
      'Съедай 3 порции молочного в день и бывай 15 минут на солнце, чтобы организм сам вырабатывал витамин D.';

  @override
  String get formWater =>
      'Пей воду равномерно в течение дня. Носи с собой бутылку и поставь напоминания каждый час.';

  @override
  String get formAvoidJunk =>
      'Меняй фастфуд на нормальную еду, а сладкие напитки — на воду. Читай состав и избегай переработанных продуктов.';

  @override
  String get formZincIntake =>
      'Добавь в рацион красное мясо, тыквенные семечки, нут, кешью и устрицы. Цель — 8–11 мг в день.';

  @override
  String get formVitaminDSunlight =>
      'Подставь руки и лицо прямому солнцу на 15 минут, лучше до полудня. На такое короткое время солнцезащитный крем не нужен.';

  @override
  String get formArginineFoods =>
      'Добавляй в еду орехи, семечки, индейку, курицу, сою и молочку. Лучше всего — перед сном.';

  @override
  String get formDailyCalories =>
      'Распредели калории на 3–5 приёмов пищи и не пропускай завтрак. Выбирай нормальную еду, а не пустые калории.';

  @override
  String get formQualitySleep =>
      'Ложись спать до 22:00. В комнате должно быть темно и прохладно. После 14:00 — без кофеина.';

  @override
  String get formNoScreen =>
      'Поставь будильник за час до сна. Убери все экраны. Вместо них почитай книгу или сделай лёгкую растяжку.';

  @override
  String get formSleepEnvironment =>
      'Повесь плотные шторы, держи в комнате 18–20 °C, убери все источники света. Спи на удобном матрасе и подушке.';

  @override
  String get formPreSleepRoutine =>
      'Начни за 30 минут до сна: приглуши свет, почитай книгу, сделай дыхательные упражнения, избегай всего, что бодрит.';

  @override
  String get formPostureCheck =>
      'Встань прямо, плечи назад и вниз. Слегка напряги кор. Представь, что тебя тянет вверх ниточка от макушки.';

  @override
  String get formWallStand =>
      'Встань так, чтобы пятки, ягодицы, лопатки и голова касались стены. Держи 5 минут. Дыши спокойно.';

  @override
  String get formNeckStretches =>
      'Медленно наклоняй голову в стороны, вперёд и назад. Держи каждое положение 30 секунд. Не тяни через силу.';

  @override
  String get formShoulderRolls =>
      'Сделай 15 вращений плечами вперёд, затем 15 назад. После этого растяни грудь, удерживая по 20 секунд.';

  @override
  String get sciMorningStretch =>
      'Утренняя растяжка разгружает диски позвоночника, которые за ночь наполнились жидкостью, и помогает дольше сохранить рост';

  @override
  String get sciBarHanging =>
      'Вис разгружает межпозвоночные диски: гравитация вытягивает позвоночник, и рост может временно прибавиться';

  @override
  String get sciCobraStretch =>
      'Поза кобры вытягивает позвоночник и раскрывает грудь, снимая сжатие от долгого сидения';

  @override
  String get sciJumping =>
      'Интенсивные прыжки стимулируют зоны роста в ногах и запускают выброс гормона роста';

  @override
  String get sciSwimmingBasketball =>
      'В плавании и баскетболе много вытягивания, прыжков и тянущихся движений — это стимулирует зоны роста';

  @override
  String get sciEveningYoga =>
      'Вечерняя йога снижает кортизол, который тормозит гормон роста, и растягивает мышцы для ночного восстановления';

  @override
  String get sciSprintIntervals => 'Спринт даёт заметный выброс гормона роста';

  @override
  String get sciHiitWorkout =>
      'Интенсивная нагрузка повышает уровень СТГ до 450%';

  @override
  String get sciSquats =>
      'Приседания стимулируют зоны роста в ногах и позвоночнике';

  @override
  String get sciDeadliftStretch =>
      'Разгрузка позвоночника полезна для межпозвоночных дисков';

  @override
  String get sciOverheadPress =>
      'Жим над головой вытягивает позвоночник и укрепляет мышцы осанки';

  @override
  String get sciSkippingRope =>
      'Повторяющиеся прыжки стимулируют зоны роста в ногах';

  @override
  String get sciPilatesCore =>
      'Сильный кор помогает держать позвоночник ровно и улучшает осанку';

  @override
  String get sciInversionHang =>
      'Вис вниз головой разгружает диски позвоночника и может временно добавить 1–2 см';

  @override
  String get sciProtein =>
      'Белок даёт аминокислоты, без которых не растут кости и мышцы, особенно во время скачков роста';

  @override
  String get sciCalciumVitaminD =>
      'Кальций и витамин D — главный строительный материал для плотности и роста костей в длину';

  @override
  String get sciWater =>
      'Вода нужна, чтобы питательные вещества доходили до зон роста, и для здоровья хрящей суставов';

  @override
  String get sciAvoidJunk =>
      'Переработанная еда и сахар вызывают воспаление и скачки инсулина, которые подавляют выработку гормона роста';

  @override
  String get sciZincIntake => 'Цинк необходим для выработки гормона роста';

  @override
  String get sciVitaminDSunlight =>
      'Витамин D очень важен для усвоения кальция и роста костей';

  @override
  String get sciArginineFoods =>
      'L-аргинин стимулирует выработку гормона роста';

  @override
  String get sciDailyCalories =>
      'Постоянная нехватка калорий снижает IGF-1 и ослабляет выбросы гормона роста, а это напрямую замедляет рост в подростковом возрасте';

  @override
  String get sciQualitySleep =>
      '70–80% суточного гормона роста выделяется в фазе глубокого сна, особенно с 22:00 до 2:00';

  @override
  String get sciNoScreen =>
      'Синий свет от экранов подавляет мелатонин: заснуть сложнее, а глубокий сон становится хуже';

  @override
  String get sciSleepEnvironment =>
      'Темнота и прохлада дают максимум мелатонина и гормона роста';

  @override
  String get sciPreSleepRoutine =>
      'Постоянный ритуал перед сном улучшает глубокий сон на 23%';

  @override
  String get sciPostureCheck =>
      'Правильная осанка сразу добавляет 2–3 см к видимому росту и защищает позвоночник от сжатия';

  @override
  String get sciWallStand =>
      'Стойка у стены тренирует мышечную память осанки и помогает держать позвоночник ровно весь день';

  @override
  String get sciNeckStretches =>
      'Растяжка шеи снимает сжатие и выравнивает шейный отдел';

  @override
  String get sciShoulderRolls =>
      'Раскрытые плечи убирают сутулость и визуально добавляют 1–2 см';

  @override
  String get muscleSpine => 'Позвоночник';

  @override
  String get muscleLegs => 'Ноги';

  @override
  String get muscleBack => 'Спина';

  @override
  String get muscleShoulders => 'Плечи';

  @override
  String get muscleArms => 'Руки';

  @override
  String get muscleCore => 'Кор';

  @override
  String get muscleChest => 'Грудь';

  @override
  String get muscleCalves => 'Икры';

  @override
  String get muscleFullBody => 'Всё тело';

  @override
  String get muscleHips => 'Бёдра';

  @override
  String get muscleBones => 'Кости';

  @override
  String get muscleMuscles => 'Мышцы';

  @override
  String get muscleNeck => 'Шея';

  @override
  String get muscleUpperSpine => 'Верх позвоночника';

  @override
  String get muscleUpperBack => 'Верх спины';

  @override
  String get createRoutine => 'Создать задание';

  @override
  String get createRoutineTitle => 'Своё задание';

  @override
  String get createRoutineSubtitle => 'Придумай своё ежедневное задание';

  @override
  String get routineIcon => 'Иконка';

  @override
  String get routineTitleField => 'Название';

  @override
  String get routineDescField => 'Описание';

  @override
  String get routineDescHint => 'Коротко о задании';

  @override
  String get routineCategoryField => 'Категория';

  @override
  String get routineDifficultyField => 'Сложность';

  @override
  String get routineDurationField => 'Длительность';

  @override
  String get routineSetsRepsField => 'Подходы × повторы';

  @override
  String get routineFormField => 'Техника и инструкция';

  @override
  String get routineFormHint => 'Необязательно: как выполнять';

  @override
  String get diffBeginner => 'Новичок';

  @override
  String get diffIntermediate => 'Средний';

  @override
  String get diffAdvanced => 'Продвинутый';

  @override
  String get catExercise => 'Упражнения';

  @override
  String get catNutrition => 'Питание';

  @override
  String get catSleep => 'Сон';

  @override
  String get catPosture => 'Осанка';

  @override
  String get postureTip1 => 'Встань к камере боком (в профиль).';

  @override
  String get postureTip2 => 'Отойди от камеры примерно на 2 метра.';

  @override
  String get postureTip3 => 'Руки расслаблены, смотри прямо перед собой.';

  @override
  String get postureTip4 =>
      'Надень облегающую одежду, чтобы оценка была точной.';

  @override
  String get postureTip5 => 'Нужен хороший свет и однотонный фон.';

  @override
  String get kyphosisLabel => 'Кифоз (верх спины)';

  @override
  String get lordosisLabel => 'Лордоз (поясница)';

  @override
  String get analyzingPosture => 'АНАЛИЗИРУЕМ ОСАНКУ';

  @override
  String get privacyPolicy => 'Политика конфиденциальности';

  @override
  String get termsOfService => 'Условия использования';

  @override
  String version(String ver) {
    return 'Версия $ver';
  }

  @override
  String get rateApp => 'Оцени BeTaller';

  @override
  String get rateAppSubtitle => 'Твой отзыв помогает нам расти!';

  @override
  String get unitSystem => 'Единицы измерения';

  @override
  String get unitMetric => 'Метрические (см, кг)';

  @override
  String get unitImperial => 'Имперские (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'О здоровье';

  @override
  String get healthDisclaimerBody =>
      'BeTaller даёт общие советы о здоровом образе жизни и фитнесе. Результаты зависят от возраста, генетики и индивидуальных особенностей. Приложение не даёт медицинских советов. Упражнения направлены на улучшение осанки, здоровье позвоночника и поддержку гормона роста через естественные привычки. Перед началом новой программы тренировок или питания проконсультируйся с врачом. После закрытия зон роста (обычно в 18–25 лет) рост меняется в основном за счёт улучшения осанки.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Съешь сегодня минимум $grams г белка — рассчитано по твоему весу.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Выпей сегодня минимум $liters л воды — рассчитано по твоему весу.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Сегодня старайся набрать около $kcal ккал — это энергия для роста.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Получи сегодня $iu МЕ витамина D — от солнца, из еды или добавки.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Получи сегодня $mg мг цинка для выработки гормона роста.';
  }

  @override
  String get nutritionSupplementsTitle => 'ДОБАВКИ';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Это дополнительная поддержка, а не замена еде. Перед приёмом любых добавок поговори с врачом, особенно если тебе нет 18.';

  @override
  String get supplementVitaminDName => 'Витамин D3';

  @override
  String get supplementVitaminDDose => '3000 МЕ';

  @override
  String get supplementVitaminDBenefit =>
      'Улучшает усвоение кальция для плотности костей и здоровья зон роста';

  @override
  String get supplementZincName => 'Цинк';

  @override
  String get supplementZincDose => '8–11 мг';

  @override
  String get supplementZincBenefit =>
      'Ключевой минерал для выработки гормона роста';

  @override
  String get supplementMagnesiumName => 'Магний';

  @override
  String get supplementMagnesiumDose => '300–400 мг';

  @override
  String get supplementMagnesiumBenefit =>
      'Поддерживает глубокий сон, в котором выделяется больше всего гормона роста';

  @override
  String get supplementCalciumName => 'Кальций';

  @override
  String get supplementCalciumDose => '1000–1300 мг';

  @override
  String get supplementCalciumBenefit =>
      'Главный строительный материал для костей и зон роста';

  @override
  String get supplementOmega3Name => 'Омега-3';

  @override
  String get supplementOmega3Dose => '1000 мг';

  @override
  String get supplementOmega3Benefit =>
      'Снижает воспаление и помогает зонам роста работать нормально';

  @override
  String get supplementCollagenName => 'Коллаген + витамин C';

  @override
  String get supplementCollagenDose => '10 г + 500 мг';

  @override
  String get supplementCollagenBenefit =>
      'Витамин C помогает организму использовать коллаген для хрящей и костной ткани';

  @override
  String get sciSourcePrefix => 'Источник: ';

  @override
  String get program => 'Программа';

  @override
  String get todaysExercises => 'УПРАЖНЕНИЯ НА СЕГОДНЯ';

  @override
  String get dailyNutritionPlan => 'ПЛАН ПИТАНИЯ НА ДЕНЬ';

  @override
  String get nutritionGoalsComplete => '🎉 Все цели по питанию выполнены!';

  @override
  String get nutritionGoalsIncomplete =>
      'Выполни цели по питанию, чтобы расти по максимуму';

  @override
  String get postureDetectingAlignment =>
      'Определяем положение позвоночника...';

  @override
  String get testimonial1 =>
      'Из-за возраста надежды почти не было, но с BeTaller рост пошёл вверх. Такой уверенности в себе у меня ещё не было.';

  @override
  String get testimonialDuration1 => '4 месяца';

  @override
  String get testimonial2 =>
      'Все говорили: «Ты уже не вырастешь». С BeTaller получилось всех удивить.';

  @override
  String get testimonialDuration2 => '3 месяца';

  @override
  String get testimonial3 =>
      'Как только начались задания, рост прибавился, а осанка стала лучше. Разницу заметили все.';

  @override
  String get testimonialDuration3 => '6 месяцев';

  @override
  String get testimonial4 =>
      'Я ещё расту, и эффект от BeTaller просто невероятный. Чувствую себя выше и сильнее.';

  @override
  String get testimonialDuration4 => '3 месяца';

  @override
  String get testimonial5 =>
      'Не буду врать — без BeTaller тут не обошлось. Разница заметна быстро, очень советую.';

  @override
  String get testimonialDuration5 => '4 месяца';

  @override
  String get designedForYou => 'Создано для тебя';

  @override
  String get designedForYouDesc =>
      'BeTaller создан специально, чтобы помочь тебе дойти до своего генетического предела и даже превзойти его. Каждая функция — для тебя.';

  @override
  String get greetingAllDone => 'Отлично! 🎯';

  @override
  String get greetingAllDoneSub => 'Все задачи на сегодня выполнены.';

  @override
  String greetingStreak30(int streak) {
    return 'Серия: $streak дн. Легендарный уровень.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'Серия: $streak дн. Так держать.';
  }

  @override
  String greetingStreak3(int streak) {
    return 'Дней подряд: $streak. Большинство сдаются. А ты — нет.';
  }

  @override
  String get greetingMorning => 'Доброе утро. Новый день — новый шанс.';

  @override
  String get greetingAfternoon => 'Сегодня отличный день, чтобы начать серию.';

  @override
  String get greetingEvening => 'Выполни задачи — начни серию.';

  @override
  String get todayCompleted => 'Сегодня выполнено ✓';

  @override
  String get todayGoals => 'Цели на сегодня';

  @override
  String get challengesLabel => 'Челленджи';

  @override
  String get dailyChallengesLabel => 'ЧЕЛЛЕНДЖИ ДНЯ';

  @override
  String get expiresTonight => 'До конца дня';

  @override
  String get allChallengesCompleted => 'Всё выполнено ✓';

  @override
  String get challengesLoading => 'Скоро появятся новые челленджи.';

  @override
  String get challengesLoadingTitle => 'Челленджи дня';

  @override
  String get behindPace => 'Отстаёшь от темпа';

  @override
  String get growthTracking => 'Учёт роста';

  @override
  String get growthEmptyFirst => 'Запиши свой рост, чтобы начать отслеживание.';

  @override
  String get growthEmptySecond => 'Добавь второй замер, чтобы увидеть график.';

  @override
  String get growthSectionLabel => 'РОСТ';

  @override
  String get generalPerformance => 'ОБЩИЙ РЕЗУЛЬТАТ';

  @override
  String get analysisBalance => 'Твой баланс';

  @override
  String get analysisWeakest => 'Твоё слабое место';

  @override
  String get analysisPrediction => 'Прогноз роста';

  @override
  String get analysisComparison => 'Сравнение';

  @override
  String get analysisGrowth => 'Статус роста';

  @override
  String get analysisWeakestHint => 'Здесь оценку поднять проще всего.';

  @override
  String get exploreLabel => 'ЕЩЁ';

  @override
  String get explorePosture => 'Анализ осанки';

  @override
  String get explorePostureSub => 'Анализ осанки и советы, как её исправить';

  @override
  String get explorePhotos => 'Фото прогресса';

  @override
  String get explorePhotosSub => 'Следи за изменениями по фото';

  @override
  String get exploreNutrition => 'Питание';

  @override
  String get exploreNutritionSub => 'Гид по белку, кальцию и витаминам';

  @override
  String get exploreHealth => 'Самочувствие';

  @override
  String get exploreHealthSub => 'Стресс, кофеин и самочувствие';

  @override
  String get exploreRecipes => 'Рецепты для роста';

  @override
  String get exploreRecipesSub => 'Рецепты, которые поддерживают рост';

  @override
  String get educationLabel => 'ЗНАНИЯ';

  @override
  String get educationTitle => 'Наука\nо росте';

  @override
  String get educationSubtitle => 'Материалы экспертов, исследования и гиды';

  @override
  String get aiAnalysisLabel => 'АНАЛИЗ РОСТА';

  @override
  String get peerCompareLabel => 'СРАВНЕНИЕ СО СВЕРСТНИКАМИ';

  @override
  String peerCompareText(int topPct) {
    return 'Ты в топ-$topPct% среди сверстников';
  }

  @override
  String get notifWaterTitle => '💧 Не забудь попить воды!';

  @override
  String get notifWaterBody =>
      'Дневная норма воды уже набрана? Выпей ещё стакан!';

  @override
  String get notifMorningTitle => '🌅 Доброе утро! Время зарядки';

  @override
  String get notifMorningBody =>
      'Сделай утреннюю растяжку! 10 минут на спину и ноги.';

  @override
  String get notifRoutineTitle => '🔥 Выполни задания!';

  @override
  String get notifRoutineBody =>
      'Проверь задания, пока день не закончился. Серия = дисциплина!';

  @override
  String get notifProteinTitle => '🥚 День белка!';

  @override
  String get notifProteinBody =>
      'Начни неделю мощно! Белок — в каждый приём пищи.';

  @override
  String get notifNewWeekTitle => '✨ Новая неделя — новые цели!';

  @override
  String get notifNewWeekBody =>
      'Не пропускай задания на этой неделе. Маленькие шаги — большая разница!';

  @override
  String get notifSleepTitle => '😴 Пора спать!';

  @override
  String get notifSleepBody =>
      'Пик гормона роста — с 22:00 до 2:00. Отложи телефон!';

  @override
  String get notifPostureTitle => '🧍 Проверь осанку!';

  @override
  String get notifPostureBody =>
      'Спина прямая, плечи назад. Хорошая осанка = разница в 2–3 см!';

  @override
  String get notifVitaminDTitle => '☀️ Время витамина D!';

  @override
  String get notifVitaminDBody =>
      'Побудь 15 минут на солнце! Витамин D помогает усваивать кальций.';

  @override
  String get notifMidweekTitle => '✨ Полпути позади!';

  @override
  String get notifMidweekBody =>
      'Середина недели. Рост требует терпения, но побеждает постоянство!';

  @override
  String get notifScreenTitle => '📵 Выключай экраны!';

  @override
  String get notifScreenBody =>
      'Никаких экранов за час до сна. Синий свет блокирует мелатонин!';

  @override
  String get notifJumpTitle => '🦘 Время прыжков!';

  @override
  String get notifJumpBody =>
      'Прыжки стимулируют зоны роста. Попробуй 3 × 20 раз!';

  @override
  String get notifCalciumTitle => '🥛 Время кальция!';

  @override
  String get notifCalciumBody =>
      'Стакан молока или йогурт. Кальций очень важен для костей!';

  @override
  String get notifPostureCheckTitle => '🧍 Проверь осанку!';

  @override
  String get notifPostureCheckBody =>
      'Не склоняй шею к телефону! Сиди и ходи прямо.';

  @override
  String get notifWeekendTitle => '✨ Мотивация на выходные';

  @override
  String get notifWeekendBody =>
      'Не пропускай задания в выходные! Дисциплина работает каждый день.';

  @override
  String get notifWeeklyProgressTitle => '📊 Прогресс за неделю';

  @override
  String get notifWeeklyProgressBody =>
      'Как прошла неделя? Загляни в график роста!';

  @override
  String get notifMeasureTitle => '📏 Замер недели!';

  @override
  String get notifMeasureBody =>
      'Измерь и запиши свой рост! Утренние замеры самые точные.';

  @override
  String get notifEarlySleepTitle => '😴 Ложись пораньше!';

  @override
  String get notifEarlySleepBody =>
      'Завтра понедельник! Начни неделю бодро — выспись.';

  @override
  String get notifStreak3Title => '🔥 3 дня подряд!';

  @override
  String get notifStreak3Body => 'Отличный старт! 3 дня подряд. Дотяни до 7!';

  @override
  String get notifStreak7Title => '🏆 Неделя подряд!';

  @override
  String get notifStreak7Body =>
      'Невероятно! 7 дней подряд все задания выполнены!';

  @override
  String get notifStreak14Title => '⭐ 2 недели подряд!';

  @override
  String get notifStreak14Body =>
      '14 дней дисциплины! Твоё тело начинает меняться.';

  @override
  String get notifStreak30Title => '👑 Месяц подряд!';

  @override
  String get notifStreak30Body => '30 дней! Ты чемпион!';

  @override
  String get notifStreak60Title => '🌟 60 дней подряд!';

  @override
  String get notifStreak60Body => '60 дней! Это невероятное достижение.';

  @override
  String get notifStreak100Title => '💎 100 ДНЕЙ! ЛЕГЕНДА!';

  @override
  String get notifStreak100Body => '100 дней подряд! Теперь ты легенда.';

  @override
  String get notifStreakRiskTitle => '⚠️ Не потеряй серию!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Твоя серия ($streak дн.) под угрозой! Выполни задания.';
  }

  @override
  String get paywallStat1 => 'см — твой потенциал пока закрыт';

  @override
  String get paywallTitle1 => 'На сколько см\nты можешь вырасти?';

  @override
  String get paywallBullet1a =>
      'Твой генетический потолок уже рассчитан — хочешь посмотреть?';

  @override
  String get paywallBullet1b => 'Как образ жизни влияет на твой рост?';

  @override
  String get paywallBullet1c => 'Твой личный план уже ждёт';

  @override
  String get paywallStat2 => 'твоя программа готова';

  @override
  String get paywallTitle2 => 'Твой план\nготов';

  @override
  String get paywallBullet2a =>
      '8 минут каждое утро — специально для твоего позвоночника';

  @override
  String get paywallBullet2b => 'Сон, питание, вода — всё под контролем';

  @override
  String get paywallBullet2c => 'Каждый день на шаг ближе — не прерывай серию';

  @override
  String get paywallStat3 => 'графики прогресса в реальном времени';

  @override
  String get paywallTitle3 => 'Следи за\nсвоим ростом';

  @override
  String get paywallBullet3a =>
      'Замеры каждый месяц — увидь свой рост своими глазами';

  @override
  String get paywallBullet3b => 'Плюс 2 см прямо сейчас с анализом осанки';

  @override
  String get paywallBullet3c => 'Фото прогресса — ты увидишь разницу';

  @override
  String get paywallStat4 => 'программа на каждый день — растёшь в уровнях';

  @override
  String get paywallTitle4 => 'Сильнее\nс каждым днём';

  @override
  String get paywallBullet4a =>
      'Получай XP, открывай уровни — привычки превращаются в игру';

  @override
  String get paywallBullet4b => 'Все, кто дошёл до цели, начинали здесь';

  @override
  String get paywallBullet4c => 'Начни сейчас — первая неделя бесплатно';

  @override
  String get paywallRestore => 'Прошлых покупок не найдено';

  @override
  String get paywallRestoreNotFound => 'Прошлых покупок не найдено';

  @override
  String get paywallPromoCode => 'Есть промокод?';

  @override
  String get paywallHeightUnit => 'целевой рост';

  @override
  String get paywallHeightTitle => 'На сколько ты можешь вырасти?';

  @override
  String get paywallHeightDesc =>
      'Мы вместе учитываем генетику, образ жизни и осанку и строим прогноз по годам. Ничего не высечено в камне: каждый твой шаг его обновляет.';

  @override
  String get paywallGrowthUnit => 'за этот год';

  @override
  String get paywallGrowthTitle => 'Следим за твоим ростом вместе с тобой';

  @override
  String get paywallGrowthDesc =>
      'Каждый замер сразу появляется на графике. Ты видишь прогресс месяц за месяцем, сантиметр за сантиметром.';

  @override
  String get paywallPostureUnit => 'оценка осанки';

  @override
  String get paywallPostureTitle => 'Осанка — ключ к твоим заданиям';

  @override
  String get paywallPostureDesc =>
      'Быстрая проверка из 3 вопросов: голова, плечи и поясница — и точные упражнения, чтобы исправить каждое.';

  @override
  String get paywallReportUnit => 'заданий выполнено';

  @override
  String get paywallReportTitle => 'Каждую неделю подводим итоги';

  @override
  String get paywallReportDesc =>
      'Вода, сон, задания и серия на одном экране. Каждую неделю вместе находим твои сильные стороны и пробелы.';

  @override
  String get paywallNutritionUnit => 'приёма пищи в день';

  @override
  String get paywallNutritionTitle => 'Полный план питания готов';

  @override
  String get paywallNutritionDesc =>
      'От завтрака до ужина — полный план на день, где белок, кальций, цинк и витамин D уже посчитаны.';

  @override
  String get paywallScoreUnit => 'Оценка BeTaller';

  @override
  String get paywallScoreTitle => 'Система, которая двигает тебя вперёд';

  @override
  String get paywallScoreDesc =>
      'Генетика, рост, питание, сон и дисциплина сводятся в одну оценку. Как только она падает, ты точно видишь, что подтянуть.';

  @override
  String get paywallPhotosUnit => 'видимая разница';

  @override
  String get paywallPhotosTitle => 'Докажи перемены фотками';

  @override
  String get paywallPhotosDesc =>
      'Сравнения «до и после» собираются сами, а фото за каждый месяц лежат вместе в твоей ленте.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'Начнём в три шага';

  @override
  String get journeyIntroSubtitle =>
      'Настроим BeTaller вместе. Твой следующий шаг уже ждёт.';

  @override
  String get journeyStep1Title => 'Собираем данные';

  @override
  String get journeyStep1Desc =>
      'Узнаём твой рост, возраст и образ жизни и рассчитываем потенциал.';

  @override
  String get journeyStep2Title => 'Знакомство с приложением';

  @override
  String get journeyStep2Desc =>
      'Пройдёмся по всем функциям: что они делают и как ими пользоваться.';

  @override
  String get journeyStep3Title => 'Дальше — ты';

  @override
  String get journeyStep3Desc =>
      'Ты выполняешь свои ежедневные задания, а мы следим за прогрессом.';

  @override
  String get journeyNow => 'СЕЙЧАС';

  @override
  String get journeyDone => 'ГОТОВО';

  @override
  String get journeySoon => 'СКОРО';

  @override
  String get tourHomeStreakTitle => 'Твоя серия';

  @override
  String get tourHomeStreakDesc =>
      'Растёт, пока ты держишь дисциплину. Пропустишь день — начнётся заново.';

  @override
  String get tourHomeXpTitle => 'Твой уровень';

  @override
  String get tourHomeXpDesc =>
      'Растёт вместе с XP, которые ты получаешь за дисциплину. Не сбивайся!';

  @override
  String get tourHomeGoalsTitle => 'Цели на сегодня';

  @override
  String get tourHomeGoalsDesc =>
      'Задания, задачи и цель по воде на день — всё одним взглядом, чтобы ничего не упустить.';

  @override
  String get tourHomeTrackTitle => 'Учёт воды и сна';

  @override
  String get tourHomeTrackDesc =>
      'Отмечай воду и сон прямо здесь — за пару секунд.';

  @override
  String get tourPlanTabsTitle => 'Три вкладки: Сегодня, Дисциплина, Питание';

  @override
  String get tourPlanTabsDesc =>
      'Здесь всё: задания на день, программа на неделю и план питания.';

  @override
  String get tourPlanLevelTitle => 'Твой уровень дисциплины';

  @override
  String get tourPlanLevelDesc =>
      'Показывает, насколько регулярно ты выполняешь задания. Чем выше уровень, тем лучше результат.';

  @override
  String get tourPlanTodayTitle => 'План на сегодня';

  @override
  String get tourPlanTodayDesc =>
      'Отмечай здесь ежедневные задания, чтобы растить серию.';

  @override
  String get tourPlanTodayListTitle => 'Твои задания на сегодня';

  @override
  String get tourPlanTodayListDesc =>
      'Отмечай каждое, как только выполнишь. Нажми на задание, чтобы открыть подробности.';

  @override
  String get tourPlanWeekGoalsTitle => 'Эта неделя';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Идеальные дни, тренировки и замер на этой неделе, включая обязательный.';

  @override
  String get tourPlanMonthGoalsTitle => 'Этот месяц';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Фото прогресса, проверка осанки и замеры за месяц — то, что не стоит пропускать.';

  @override
  String get tourProgressHeightTitle => 'Твой текущий рост';

  @override
  String get tourProgressHeightDesc =>
      'Показывает твой рост сейчас и общий прирост. Отсюда можно добавить новый замер.';

  @override
  String get tourProgressPhotosTitle => 'Фото прогресса';

  @override
  String get tourProgressPhotosDesc =>
      'Следи за изменениями по фото, которые делаешь регулярно.';

  @override
  String get tourProgressPostureTitle => 'Анализ осанки';

  @override
  String get tourProgressPostureDesc =>
      'Проанализируй осанку по фото и узнай, над чем работать.';

  @override
  String get tourAnalysisScoreTitle => 'Твоя оценка BeTaller';

  @override
  String get tourAnalysisScoreDesc =>
      'Общая оценка результата: считается по генетике, скорости роста, питанию и сну.';

  @override
  String get tourAnalysisPredictionTitle => 'Твой прогноз роста';

  @override
  String get tourAnalysisPredictionDesc =>
      'Показывает прогноз твоего итогового роста и как он меняется по годам.';

  @override
  String get tourAnalysisPeerTitle => 'Сравнение со сверстниками';

  @override
  String get tourAnalysisPeerDesc =>
      'Узнай своё место и сравни себя с ровесниками.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Твои задания';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Сколько упражнений тебе ещё осталось сделать сегодня.';

  @override
  String get tourHomeGoalsChallengesTitle => 'Твои задачи';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Следи за прогрессом активных челленджей прямо здесь.';

  @override
  String get tourHomeGoalsWaterTitle => 'Твоя цель по воде';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Сколько осталось до дневной нормы воды.';

  @override
  String get tourHomeReminderTitle => 'Следующее напоминание';

  @override
  String get tourHomeReminderDesc =>
      'Когда придёт следующее напоминание — и его можно изменить прямо отсюда.';

  @override
  String get tourHomeChallengesTitle => 'Твои челленджи';

  @override
  String get tourHomeChallengesDesc =>
      'Выполняй активные челленджи и получай дополнительные XP.';

  @override
  String get tourHomeGrowthTitle => 'Статус роста';

  @override
  String get tourHomeGrowthDesc =>
      'Общий прирост, разница с последним замером и сколько замеров уже записано.';

  @override
  String get tourHomeExploreTitle => 'Ещё';

  @override
  String get tourHomeExploreDesc =>
      'Здесь тебя ждут гиды по питанию, рецепты для роста и многое другое.';

  @override
  String get tourPlanProgramHeaderTitle => 'Твоя программа на 70 дней';

  @override
  String get tourPlanProgramHeaderDesc =>
      'В этом кольце — общий прогресс, текущий уровень и день.';

  @override
  String get tourPlanProgramLevelsTitle => 'Уровни';

  @override
  String get tourPlanProgramLevelsDesc =>
      'На каком ты из 10 уровней и какие ещё закрыты.';

  @override
  String get tourPlanNutritionHeaderTitle => 'Прогресс по питанию';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Сколько заданий по питанию на сегодня уже выполнено.';

  @override
  String get tourPlanNutritionFirstTitle => 'Задания по питанию';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Отмечай привычки в питании, которые помогают расти.';

  @override
  String get tourProgressChartTitle => 'Кривая роста';

  @override
  String get tourProgressChartDesc =>
      'Прошлые замеры на графике — и куда ты движешься.';

  @override
  String get tourProgressReportTitle => 'Отчёт за неделю';

  @override
  String get tourProgressReportDesc => 'Посмотри отчёт с итогами твоей недели.';

  @override
  String get tourProgressHistoryTitle => 'История замеров';

  @override
  String get tourProgressHistoryDesc => 'Все твои замеры роста на одной ленте.';

  @override
  String get tourAnalysisRadarTitle => 'Диаграмма баланса';

  @override
  String get tourAnalysisRadarDesc =>
      'Генетика, скорость роста, питание, сон и дисциплина на радарной диаграмме — и твоё самое слабое место.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'Твои нормы на день';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Сколько тебе нужно белка, калорий, сна и воды в день — с учётом роста и веса.';

  @override
  String get journeyDataDoneTitle => 'Первый шаг пройден';

  @override
  String get journeyDataDoneSubtitle =>
      'Данные и потенциал у нас. Дальше — знакомство с приложением.';

  @override
  String get journeyContinue => 'Далее';

  @override
  String get journeyEnterApp => 'Войти в приложение';

  @override
  String get journeyProgressLabel => 'Начало';

  @override
  String get journeyTourDoneTitle => 'Добро пожаловать в BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'Все три шага пройдены. Теперь твоя очередь: начни путь с первого задания.';

  @override
  String get journeyViewPlansButton => 'Посмотреть тарифы и начать';

  @override
  String get paywallRestoreLabel => 'Восстановить покупки';

  @override
  String get paywallYearly => 'Год';

  @override
  String get paywallBestValue => 'Выгоднее всего';

  @override
  String paywallSavePercent(String percent) {
    return 'ВЫГОДА $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/нед.';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/мес.';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/год';
  }

  @override
  String get paywallMonthly => 'Месяц';

  @override
  String get paywallWeekly => 'Неделя';

  @override
  String get paywallFreeTrial => '3 дня бесплатно';

  @override
  String get paywallLoadError =>
      'Не удалось загрузить варианты покупки, попробуй ещё раз';

  @override
  String get paywallCtaAlt => 'Продолжить';

  @override
  String get paywallTrialDisclaimer =>
      '3 дня бесплатно · потом автопродление · отмена в любой момент';

  @override
  String get paywallYearlyDisclaimer =>
      'Автопродление раз в год · отмена в любой момент';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days дн. бесплатно, затем $price/нед. · отмена в любой момент';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days дн. бесплатно, затем $price/мес. · отмена в любой момент';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days дн. бесплатно, затем $price/год · отмена в любой момент';
  }

  @override
  String get paywallRenewsWeekly =>
      'Автопродление каждую неделю · отмена в любой момент';

  @override
  String get paywallRenewsMonthly =>
      'Автопродление каждый месяц · отмена в любой момент';

  @override
  String get resultCardTitle => 'Твой прогноз роста во взрослом возрасте';

  @override
  String resultRange(String min, String max) {
    return 'Вероятный диапазон: от $min до $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Выше, чем $percent% твоих ровесников';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Примерно осталось вырасти: $amount';
  }

  @override
  String get resultFootnote =>
      'Это оценка по росту родителей и данным графиков роста. Не медицинская рекомендация.';

  @override
  String get postureCheckTitle => 'Быстрая проверка осанки';

  @override
  String get postureCheckIntro =>
      'Встань к стене так, чтобы пятки, таз и лопатки касались её, и ответь на три вопроса. Оценка считается по твоим ответам, а фото сохраняется для сравнения «до и после».';

  @override
  String get postureQHead =>
      'Затылок касается стены, если не поднимать подбородок?';

  @override
  String get postureQHeadA1 => 'Да, легко';

  @override
  String get postureQHeadA2 => 'Только если отвести голову назад';

  @override
  String get postureQHeadA3 => 'Нет, есть зазор';

  @override
  String get postureQShoulders =>
      'Где на фото сбоку твои плечи по сравнению с ушами?';

  @override
  String get postureQShouldersA1 => 'На одной линии с ушами';

  @override
  String get postureQShouldersA2 => 'Чуть впереди';

  @override
  String get postureQShouldersA3 => 'Заметно скруглены вперёд';

  @override
  String get postureQLowerBack =>
      'Просунь руку за поясницу. Сколько там места?';

  @override
  String get postureQLowerBackA1 => 'Ровно проходит ладонь';

  @override
  String get postureQLowerBackA2 => 'Места совсем нет';

  @override
  String get postureQLowerBackA3 => 'Проходит кулак';

  @override
  String get postureCheckSave => 'Узнать оценку';

  @override
  String get postureCheckNote => 'Это самопроверка, а не медицинская оценка.';

  @override
  String get paywallTester => 'Тестер';

  @override
  String get introTag1 => 'ПРОГНОЗ';

  @override
  String get introTag2 => 'РОСТ';

  @override
  String get introTag3 => 'УЧЁТ';

  @override
  String get introTag4 => 'ИГРА';

  @override
  String get introTag5 => 'СООБЩЕСТВО';

  @override
  String get introTitle1 => 'Узнай свой\nпотенциал роста';

  @override
  String get introSubtitle1 =>
      'Мы рассчитаем твой потенциал\nпо генетике, возрасту и образу жизни.';

  @override
  String get introTitle2 => 'Каждый день —\nна шаг выше';

  @override
  String get introSubtitle2 =>
      'Раскрой потенциал с личным планом\nупражнений и питания.';

  @override
  String get introTitle3 => 'Следи за каждым\nсантиметром';

  @override
  String get introSubtitle3 =>
      'Смотри, как меняется твой реальный\nпрогресс по ежемесячным замерам.';

  @override
  String get introTitle4 => 'Повышай уровень,\nполучай награды';

  @override
  String get introSubtitle4 =>
      'Проходи 70-дневные программы,\nполучай XP и открывай новые уровни.';

  @override
  String get introTitle5 => 'Тысячи уже\nстали выше';

  @override
  String get introSubtitle5 =>
      'Присоединяйся к тем,\nкто уже дошёл до своей цели.';

  @override
  String get criticalWindow => 'КРИТИЧЕСКОЕ ОКНО';

  @override
  String get heightPotentialFading => 'Факты о твоём';

  @override
  String get fadingAway => 'потенциале роста..';

  @override
  String get painHookDesc =>
      'Без правильных привычек каждый день навсегда уносит сантиметры. Но это ещё можно изменить.';

  @override
  String get painGeneticTitle => 'Генетика — это не всё';

  @override
  String get painGeneticDesc =>
      'Генетика решает 60%, а остальные 40% зависят от тебя. BeTaller создан как раз для этих 40%.';

  @override
  String get painGeneticTag => 'Анализ';

  @override
  String get painSleepTitle => 'Настрой режим сна';

  @override
  String get painSleepDesc =>
      'Правильный сон каждую ночь может повысить выработку гормона роста на 70%. BeTaller сам ведёт учёт сна — тебе остаётся только спать.';

  @override
  String get painSleepTag => 'Учёт';

  @override
  String get painPostureTitle => 'Плюс сантиметры уже сейчас — с осанкой';

  @override
  String get painPostureDesc =>
      'Правильная осанка может сразу добавить 1,5–3 см. Ежедневные задания BeTaller на осанку закрепят это за несколько недель.';

  @override
  String get painPostureTag => 'Осанка';

  @override
  String get painExerciseTitle => 'Твой план упражнений готов';

  @override
  String get painExerciseDesc =>
      'Утренняя растяжка, вис, упражнения для спины: BeTaller всё подготовил и расписал за тебя. Всего 8–12 минут в день.';

  @override
  String get painExerciseTag => 'Задания';

  @override
  String get painNutritionTitle => 'Питание напрямую влияет на рост';

  @override
  String get painNutritionDesc =>
      'Белок, кальций, витамин D: BeTaller каждый день напоминает, что и когда есть.';

  @override
  String get painNutritionTag => 'Питание';

  @override
  String get painTrackingTitle => 'Смотри на свой рост своими глазами';

  @override
  String get painTrackingDesc =>
      'Ежемесячные замеры, фото прогресса, график роста: видно каждый новый сантиметр.';

  @override
  String get painTrackingTag => 'Прогресс';

  @override
  String get selectYourGender => 'Укажи свой пол';

  @override
  String get onboardingPredictSubtitle =>
      'Это нужно, чтобы спрогнозировать твой потенциал роста и составить личный план.';

  @override
  String get other => 'Другое';

  @override
  String get whenWereYouBorn => 'Укажи дату рождения';

  @override
  String get heightAndWeight => 'Рост и вес';

  @override
  String get parentsHeight => 'Рост родителей';

  @override
  String get weeklyWorkout => 'Тренировки в неделю';

  @override
  String get workoutsPerWeek => 'Тренировок в неделю';

  @override
  String get whatsYourEthnicity => 'Твоё происхождение?';

  @override
  String get whiteCaucasian => 'Европеоидное';

  @override
  String get blackAfricanAmerican => 'Африканское';

  @override
  String get hispanicLatino => 'Латиноамериканское';

  @override
  String get asian => 'Азиатское';

  @override
  String get middleEasternIndigenous => 'Ближневосточное / коренные народы';

  @override
  String get dontWantToAnswer => 'Не хочу отвечать';

  @override
  String get footSizeLabel => 'Размер стопы';

  @override
  String get selectYourSize => 'Выбери размер';

  @override
  String get whatsYourDreamHeight => 'О каком росте ты мечтаешь?';

  @override
  String get dreamHeightCalcSubtitle =>
      'По твоим данным мы рассчитаем, насколько реально достичь этого роста.';

  @override
  String get dreamHeightLabel => 'Рост мечты';

  @override
  String get sleepQuestion => 'Сколько часов\nты спишь за ночь?';

  @override
  String get thousandsSucceeded => 'У тысяч\nполучилось';

  @override
  String get youCanToo => 'Получится и у тебя';

  @override
  String get yearsOld => 'лет';

  @override
  String get verifiedLabel => 'Подтверждено';

  @override
  String get scientificData => 'НАУЧНЫЕ ДАННЫЕ';

  @override
  String get longTermResults => 'BeTaller даёт\nдолгосрочный результат';

  @override
  String get longTermResultsSubtitle =>
      'Многие не достигают своего максимального роста из-за вредных привычек.';

  @override
  String get yourFinalHeight => 'Твой итоговый рост';

  @override
  String get badHabitsLegend => 'Вредные привычки';

  @override
  String get optimizedLegend => 'С правильными';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'роста можно изменить\nпривычками';

  @override
  String get chartFact2Pct => '9–10 ч';

  @override
  String get chartFact2Desc => 'сна в идеале усиливают\nгормон роста';

  @override
  String get chartFact3Pct => '3 см';

  @override
  String get chartFact3Desc => 'можно получить,\nулучшив осанку';

  @override
  String get didYouKnow => 'А ты знаешь?';

  @override
  String get didYouKnowFact1 =>
      'Ежедневные привычки влияют на 30% твоего роста';

  @override
  String get didYouKnowFact2 => 'Сжатие позвоночника крадёт 1,5–3 см роста';

  @override
  String get didYouKnowFact3 => 'Недосып снижает СТГ на 70%';

  @override
  String get transformJourneyBegins => 'Твой путь к переменам\nначинается';

  @override
  String get transformJourneySubtitle =>
      'Комплексная программа, которая шаг за шагом\nподдерживает твой здоровый рост.';

  @override
  String get week1Label => '1 Н';

  @override
  String get week1Title => 'Неделя 1';

  @override
  String get week1Desc => 'Позвоночник выравнивается, осанка становится лучше';

  @override
  String get month1Label => '1 М';

  @override
  String get month1Title => 'Месяц 1';

  @override
  String get month1Desc => 'Первые заметные сантиметры, сон становится лучше';

  @override
  String get month3Label => '3 М';

  @override
  String get month3Title => 'Месяц 3';

  @override
  String get month3Desc => 'В среднем +1,5–2,5 см, мышцы крепнут';

  @override
  String get month6Label => '6 М';

  @override
  String get month6Title => 'Месяц 6';

  @override
  String get month6Desc => 'Выход на максимум потенциала, жизнь с новым ростом';

  @override
  String get reachYourGoal => 'Достигни цели';

  @override
  String get journeyBullet1 => 'Раскрой свой максимальный потенциал';

  @override
  String get journeyBullet2 => 'Начни жить с новым ростом';

  @override
  String get journeyBullet3 => 'Напиши свою историю успеха';

  @override
  String get unlockButton => 'Открыть всё';

  @override
  String get dreamHeightOdds => 'Шансы на\nрост мечты';

  @override
  String get growthCompleteLabel => 'Рост\nзавершён';

  @override
  String get tallerThanPct => 'Выше 76,7% ровесников';

  @override
  String get levelNovice => 'Новичок';

  @override
  String get levelBuilder => 'Строитель';

  @override
  String get levelGrinder => 'Работяга';

  @override
  String get levelWarrior => 'Воин';

  @override
  String get levelGodTier => 'Уровень бога';

  @override
  String get levelDesc0 => 'Заложи фундамент';

  @override
  String get levelDesc1 => 'Ускорь рост';

  @override
  String get levelDesc2 => 'Усиль тренировки';

  @override
  String get levelDesc3 => 'Выходи за пределы';

  @override
  String get levelDesc4 => 'Без труда нет результата';

  @override
  String get levelDesc5 => 'Мышление чемпиона';

  @override
  String get levelDesc6 => 'Результат элиты';

  @override
  String get levelDesc7 => 'Управляй своим телом';

  @override
  String get levelDesc8 => 'Легендарная дисциплина';

  @override
  String get levelDesc9 => 'Максимум потенциала';

  @override
  String levelLabel(int level) {
    return 'УРОВЕНЬ $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'осталось $days дня',
      many: 'осталось $days дней',
      few: 'осталось $days дня',
      one: 'остался $days день',
    );
    return 'До конца программы $_temp0';
  }

  @override
  String get tapLabel => 'НАЖМИ';

  @override
  String kcalPer100g(int calories) {
    return '$calories ккал / 100 г';
  }

  @override
  String get dayShort => 'День';

  @override
  String get legendShort => 'Низкий';

  @override
  String get legendBelowAvg => 'Ниже ср.';

  @override
  String get legendAverage => 'Средний';

  @override
  String get legendTall => 'Высокий';

  @override
  String get legendVeryTall => 'Очень высокий';

  @override
  String get pctBottom5 => 'Нижние 5%';

  @override
  String get pctBottom25 => 'Нижние 25%';

  @override
  String get pctMedian => 'Медиана';

  @override
  String get pctTop25 => 'Топ-25%';

  @override
  String get pctTop5 => 'Топ-5%';

  @override
  String get fallingBehind => 'Отстаёшь';

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes мин чтения';
  }

  @override
  String get inThisArticle => 'В этой статье';

  @override
  String get nextArticle => 'Следующая статья';

  @override
  String get purchaseUnavailable =>
      'Не удалось завершить покупку. Попробуй ещё раз.';

  @override
  String get viewPlan => 'Моя подписка';

  @override
  String get viewPlanSubtitle => 'Подробности подписки';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Добавь замеры роста — и точность прогноза вырастет до $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'Весь день на одном экране';

  @override
  String get paywallSlideHomeCaption =>
      'Задания, вода, сон: три кольца, которые нужно закрыть.';

  @override
  String get paywallSlideProgressTitle => 'Видно каждый сантиметр';

  @override
  String get paywallSlideProgressCaption =>
      'Каждый замер сразу попадает на кривую.';

  @override
  String get paywallSlideAnalysisTitle => 'Пять показателей — одна фигура';

  @override
  String get paywallSlideAnalysisCaption => 'Радар покажет твоё слабое место.';

  @override
  String get paywallSlidePotentialTitle => 'Узнай свой потенциал';

  @override
  String get paywallSlidePotentialCaption =>
      'Смотри, где ты среди сверстников.';

  @override
  String get paywallSlideDisciplineTitle => 'Держи серию';

  @override
  String get paywallSlideDisciplineCaption =>
      'Каждый день поднимает твой уровень.';

  @override
  String get paywallSlideRemindersTitle => 'Напомним вовремя';

  @override
  String get paywallSlideRemindersCaption =>
      'Выбери время, остальное приложение сделает само.';

  @override
  String get paywallSlidePostureTitle => 'Исправь осанку';

  @override
  String get paywallSlidePostureCaption =>
      'Фото сбоку, быстрая самопроверка, понятный план.';

  @override
  String paywallTrialHeadline(String days) {
    return 'БЕСПЛАТНО: $days ДН.';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Затем $price · отмена в любой момент';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / год · отмена в любой момент';
  }

  @override
  String get obBedtimeTitle => 'Во сколько ты обычно ложишься спать?';

  @override
  String get obBedtimeSubtitle =>
      'Напоминание о сне поставим примерно на это время.';

  @override
  String get obWorkoutTimeTitle => 'Во сколько ты тренируешься?';

  @override
  String get obWorkoutTimeSubtitle =>
      'Чтобы напоминание о тренировке приходило вовремя.';

  @override
  String get obMealsTitle => 'Сколько раз в день ты ешь?';

  @override
  String get obMealsSubtitle =>
      'Нажми на время, чтобы подстроить его под свой распорядок.';

  @override
  String obMealsCount(String count) {
    return 'Приёмов пищи: $count';
  }

  @override
  String obMealLabel(String n) {
    return 'Приём пищи $n';
  }

  @override
  String get obProteinTitle => 'Сколько граммов белка в день?';

  @override
  String get obProteinSubtitle =>
      'Хватит примерной цифры. Мы построим план вокруг неё.';

  @override
  String get obCaloriesTitle => 'Сколько калорий в день в среднем?';

  @override
  String get obCaloriesSubtitle =>
      'Хватит примерной оценки — потом уточним вместе.';

  @override
  String get obNotSure => 'Не знаю';

  @override
  String get silNow => 'СЕЙЧАС';

  @override
  String get silPotential => 'ПОТЕНЦИАЛ';

  @override
  String get chartMeasured => 'Твои замеры';

  @override
  String chartPotential(String height) {
    return 'Потенциал $height';
  }

  @override
  String chartDream(String height) {
    return 'Твоя цель $height';
  }

  @override
  String get targetsTitle => 'Сегодня для тебя';

  @override
  String get targetsSubtitle =>
      'Рассчитано по твоему возрасту, весу и тренировкам.';

  @override
  String get targetProtein => 'Белок';

  @override
  String get targetCalcium => 'Кальций';

  @override
  String get targetVitaminD => 'Витамин D';

  @override
  String get targetWater => 'Вода';

  @override
  String get targetSleep => 'Сон';

  @override
  String get targetMove => 'Тренировка';

  @override
  String targetPerMeal(String g) {
    return '$g г за приём';
  }

  @override
  String get unitHours => 'ч';

  @override
  String get unitMinutes => 'мин';

  @override
  String get planStrength => 'Сила';

  @override
  String get planJump => 'Прыжки и спринты';

  @override
  String get planMobility => 'Растяжка';

  @override
  String get planSport => 'Спорт';

  @override
  String get planPosture => 'Осанка';

  @override
  String get planRest => 'Отдых';

  @override
  String planWeekTitle(int days) {
    return 'Твоя неделя: $days дн. тренировок';
  }

  @override
  String get planPreviewTitle => 'Твой план готов';

  @override
  String planPreviewTraining(int days) {
    return '$days дн. тренировок в неделю — для роста';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams г белка в день, распределено по приёмам пищи';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours ч сна и напоминание перед сном';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Сегодня: $plan · $minutes мин';
  }

  @override
  String get nRestTitle => 'Сегодня день отдыха';

  @override
  String get nRestBody =>
      'Хватит десяти минут растяжки. Восстановление — тоже часть плана.';

  @override
  String nProteinTitle(int grams) {
    return 'Цель по белку на сегодня: $grams г';
  }

  @override
  String nProteinBody(int grams) {
    return 'Примерно $grams г за приём: яйца, йогурт, курица, чечевица.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Цель по воде: $liters';
  }

  @override
  String get nWaterBody => 'Один стакан сейчас — и ты в графике на сегодня.';

  @override
  String get nSleepTitle => 'Пора закругляться';

  @override
  String nSleepBody(String hours) {
    return 'Твоя цель — $hours ч. Экраны выключить, свет приглушить.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Твой потенциал: $potential. Измерь рост утром и посмотри, как двигается график.';
  }

  @override
  String get nTrialDay1Title => 'Твой план ждёт';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Сегодня: $plan, $minutes мин. Запиши рост, чтобы запустить график.';
  }

  @override
  String get nTrialEndTitle => 'Пробный период заканчивается завтра';

  @override
  String nTrialEndBody(String price) {
    return 'Дальше — $price. Твой план и прогресс сохранятся в любом случае.';
  }

  @override
  String get trophyContinue => 'Продолжить';

  @override
  String get guideSteps => 'Шаг за шагом';

  @override
  String get guideMistakes => 'Частые ошибки';

  @override
  String get guideTip => 'Совет';

  @override
  String get homeHeroTitle => 'Твой рост и твой потенциал';

  @override
  String homeHeroGap(String cm) {
    return 'Ещё впереди: $cm';
  }

  @override
  String get anSubtitle => 'Твоя оценка, что на неё влияет и куда ты движешься';

  @override
  String get anScoreLabel => 'Оценка BeTaller';

  @override
  String get anTierStarting => 'Старт';

  @override
  String get anTierBuilding => 'Разгон';

  @override
  String get anTierRising => 'Подъём';

  @override
  String get anTierStrong => 'Сила';

  @override
  String get anTierPeak => 'Пик';

  @override
  String anTrendUp(int n) {
    return '+$n к прошлой неделе';
  }

  @override
  String anTrendDown(int n) {
    return '-$n к прошлой неделе';
  }

  @override
  String get anTrendFlat => 'Как на прошлой неделе';

  @override
  String get anTrendFirst => 'Динамика по неделям появится со следующей недели';

  @override
  String anNextTier(int n, String tier) {
    return 'Ещё $n очк. до уровня «$tier»';
  }

  @override
  String get anTopTier => 'Высший уровень. Удержи его';

  @override
  String anCoverage(int n, int total) {
    return 'По $n из $total показателей';
  }

  @override
  String get anNoScoreTitle => 'Пока мало данных';

  @override
  String get anNoScoreBody =>
      'Запиши сегодня сон, немного воды или одну тренировку — и появится первая оценка.';

  @override
  String get anFastestWin => 'Самый быстрый плюс';

  @override
  String get anBreakdownTitle => 'Из чего складывается оценка';

  @override
  String get anBreakdownHint =>
      'Каждый показатель оценивается от 0 до 100 по твоим данным. Процент — это его вес в оценке.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'Пока нет данных';

  @override
  String get anNotCounted => 'Не учитывается';

  @override
  String get anFTraining => 'Тренировки';

  @override
  String get anFConsistency => 'Постоянство';

  @override
  String get anFSleep => 'Сон';

  @override
  String get anFHydration => 'Вода';

  @override
  String get anFNutrition => 'Питание';

  @override
  String get anFPosture => 'Осанка';

  @override
  String get anFMeasuring => 'Замеры';

  @override
  String get anFGrowth => 'Скорость роста';

  @override
  String get anFHeadroom => 'Запас роста';

  @override
  String anBTraining(int done, int planned) {
    return '$done из $planned запланированных дней тренировок за последние 7 дней';
  }

  @override
  String get anBTrainingNone =>
      'Считает дни тренировок по сравнению с твоим планом на неделю.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak дня',
      many: '$streak дней',
      few: '$streak дня',
      one: '$streak день',
    );
    return 'Серия $_temp0, половина плана выполнена в $active из $days дн.';
  }

  @override
  String get anBConsistencyNone =>
      'Считает твою серию и дни, когда выполнено хотя бы полплана.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days ночи',
      many: '$days ночей',
      few: '$days ночи',
      one: '$days ночь',
    );
    return 'В среднем $hours ч за ночь, цель $target ч, записано $_temp0';
  }

  @override
  String get anBSleepNone => 'За последние 7 дней сон не записан.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return 'В среднем $litres в день, цель $target, записано $_temp0';
  }

  @override
  String get anBHydrationNone => 'За последние 7 дней вода не записана.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done из $planned привычек в питании выполнено за последние 7 дней';
  }

  @override
  String get anBNutritionNone =>
      'Считает привычки по белку, кальцию, цинку и витамину D из твоего плана.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return 'Проверка у стены $raw/90, $_temp0 назад';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Проверка у стены $raw/90, сегодня';
  }

  @override
  String get anBPostureNone => 'Проверки осанки пока не было.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return 'Последний замер — $_temp0 назад';
  }

  @override
  String get anBMeasuringToday => 'Замер сегодня';

  @override
  String get anBMeasuringNone => 'Замеров пока нет.';

  @override
  String anBGrowth(String v, String e) {
    return '$v в год, обычно в твоём возрасте $e';
  }

  @override
  String get anBGrowthNone => 'Нужно два замера с разницей минимум 30 дней.';

  @override
  String get anBGrowthAdult =>
      'Зоны роста обычно закрываются к 21 году, поэтому скорость роста у тебя не учитывается.';

  @override
  String anBHeadroom(String cm) {
    return '$cm между сегодняшним ростом и твоим потенциалом';
  }

  @override
  String get anATraining => 'Начни сегодняшнюю тренировку';

  @override
  String get anAConsistency => 'Выполни половину плана на сегодня';

  @override
  String get anASleepLog => 'Запиши сон за прошлую ночь';

  @override
  String anASleep(String target) {
    return 'Поспи сегодня $target ч';
  }

  @override
  String get anAHydrationLog => 'Запиши стакан воды';

  @override
  String anAHydration(String left) {
    return 'Выпей сегодня ещё $left';
  }

  @override
  String get anAHydrationDone => 'Норма на сегодня выполнена. Завтра так же';

  @override
  String get anANutrition => 'Отметь привычки в питании на сегодня';

  @override
  String get anAPostureFirst => 'Пройди проверку осанки за 1 минуту';

  @override
  String get anAPostureRedo => 'Пройди проверку осанки ещё раз';

  @override
  String get anAPostureKeep => 'Не бросай ежедневные задания на осанку';

  @override
  String get anAMeasure => 'Измерь рост прямо сейчас';

  @override
  String get anAMeasureKeep => 'Измерь снова на следующей неделе';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return 'Измерь снова через $_temp0';
  }

  @override
  String get anAGrowth =>
      'Измеряй рост каждые 2 недели, чтобы следить за скоростью';

  @override
  String get anAHeadroom => 'Посмотри свой потенциал';

  @override
  String get anPotentialTitle => 'Твой потенциал';

  @override
  String get anPotentialLabel => 'Прогноз взрослого роста';

  @override
  String anPotentialToGo(String cm) {
    return 'Ещё +$cm';
  }

  @override
  String get anPotentialReached => 'Прогнозируемый рост уже достигнут';

  @override
  String get anPotentialNote =>
      'Это число одинаковое во всём приложении. Оно может только расти.';

  @override
  String anDreamLine(String h) {
    return 'Твоя цель: $h';
  }

  @override
  String get anSourcesTitle => 'Откуда берутся сантиметры';

  @override
  String get anSourcesGenes => 'Гены и возраст';

  @override
  String get anSourcesHabits => 'Сон, еда, тренировки';

  @override
  String get anSourcesPosture => 'Осанка';

  @override
  String get anPctTitle => 'Рост для твоего возраста';

  @override
  String anPctValue(int p) {
    return 'Выше, чем $p% твоих ровесников';
  }

  @override
  String get anPctBasis => 'Графики роста CDC (США), тот же возраст и пол';

  @override
  String get anPctMore => 'Полное сравнение';

  @override
  String get anNeedsBasis =>
      'Рассчитано по твоему возрасту, весу и тренировкам';

  @override
  String get anCalcium => 'Кальций';

  @override
  String get anVitaminD => 'Витамин D';

  @override
  String get anMovement => 'Движение';

  @override
  String get anUnitMin => 'мин';

  @override
  String get anUnitHours => 'ч';

  @override
  String get anPerDay => 'в день';

  @override
  String get anPerNight => 'за ночь';

  @override
  String get anUnlockScoreTitle => 'Твоя полная оценка BeTaller';

  @override
  String get anUnlockScoreBody =>
      'Оценка, все девять показателей за ней и что делать дальше.';

  @override
  String get anUnlockSourcesTitle => 'Узнай, откуда берутся твои сантиметры';

  @override
  String get anUnlockNeedsTitle => 'Твои нормы на день — уже рассчитаны';

  @override
  String get anUnlockCta => 'Открыть';

  @override
  String get anFlowResultTitle => 'Сохранено на графике';

  @override
  String get anFlowResultBody =>
      'Твой прошлый рост теперь на той же кривой, что и твои замеры и потенциал.';

  @override
  String get anFlowOpenAnalysis => 'Открыть анализ';

  @override
  String anTopPct(int p) {
    return 'ТОП-$p%';
  }

  @override
  String get anNeedsTitle => 'Твои нормы на день';

  @override
  String get pgUnlockPro => 'Открыть с Pro';

  @override
  String get pgPhotosLockedTitle => 'Смотри на свои перемены';

  @override
  String get pgPhotosLockedBody =>
      'Сохраняй фото с ростом каждые две недели и сравнивай любые два с помощью ползунка.';

  @override
  String get pgTransformationTitle => 'Твои перемены';

  @override
  String get pgHeightChange => 'изменение роста';

  @override
  String get pgDaysApart => 'дней между фото';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return '$delta между этими двумя фото, сделанными с разницей в $_temp0.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return 'Рост тот же, разница — $_temp0. Сначала меняются осанка и фигура, а рост подтягивается за месяцы.';
  }

  @override
  String get pgModeSlider => 'Ползунок';

  @override
  String get pgModeSideBySide => 'Рядом';

  @override
  String get pgDragToReveal => 'Двигай, чтобы сравнить';

  @override
  String get pgOnePhotoTitle => 'Фото «до» сохранено';

  @override
  String pgOnePhotoBody(String date) {
    return 'Сделай следующее $date в той же позе — и увидишь первое сравнение.';
  }

  @override
  String get pgEmptyTitle => 'Начни свои перемены';

  @override
  String get pgEmptyBody =>
      'Одно фото раз в две недели, та же поза, то же место, с указанием роста. Через несколько месяцев сможешь листать от первого дня до сегодня.';

  @override
  String get pgTakeFirstPhoto => 'Сделать первое фото';

  @override
  String get pgPhotoDueNow => 'Пора сделать фото';

  @override
  String pgNextPhotoOn(String date) {
    return 'Следующее фото $date';
  }

  @override
  String pgDayN(int n) {
    return 'День $n';
  }

  @override
  String get pgNewPhoto => 'Новое фото';

  @override
  String get pgGuideTitle => 'Каждый раз та же поза';

  @override
  String get pgGuideSubtitle =>
      'Фото удобно сравнивать, только если они сделаны одинаково.';

  @override
  String get pgGuideGhost =>
      'Твоё прошлое фото видно полупрозрачным. Встань точно по нему.';

  @override
  String get pgGuideStep1 => 'Встань в 2 м, телефон на уровне груди';

  @override
  String get pgGuideStep2 => 'Лицом к камере, ноги вместе, руки расслаблены';

  @override
  String get pgGuideStep3 => 'То же место, тот же свет, облегающая одежда';

  @override
  String get pgGuideDistance => '2 м';

  @override
  String get pgChestHeight => 'уровень груди';

  @override
  String get pgTakePhoto => 'Сделать фото';

  @override
  String get pgFromGallery => 'Выбрать из галереи';

  @override
  String get pgChoosePhoto => 'Выбери фото';

  @override
  String get pgPostureTitle => 'Проверка осанки';

  @override
  String get pgPostureLockedTitle => 'Найди свои слабые места';

  @override
  String get pgPostureLockedBody =>
      'Оцени голову, плечи и поясницу, получи по два упражнения на каждую зону и смотри оценку неделя за неделей.';

  @override
  String get pgAreaHead => 'Голова';

  @override
  String get pgAreaShoulders => 'Плечи';

  @override
  String get pgAreaLowerBack => 'Поясница';

  @override
  String get pgHeadMeaning0 =>
      'Голова ровно над плечами. Сохраняй так с помощью короткой ежедневной разминки.';

  @override
  String get pgHeadMeaning1 =>
      'Когда ты расслабляешься, голова уходит вперёд. Так бывает у многих из-за телефона — и это быстро исправляется.';

  @override
  String get pgHeadMeaning2 =>
      'Голова выдвинута перед плечами. Исправь это первым: из-за этого ты выглядишь ниже на любом фото.';

  @override
  String get pgShouldersMeaning0 =>
      'Плечи на одной линии с ушами. Верх спины работает как надо.';

  @override
  String get pgShouldersMeaning1 =>
      'Плечи немного впереди. Их тянут зажатые грудные мышцы; если их раскрыть, плечи вернутся на место.';

  @override
  String get pgShouldersMeaning2 =>
      'Плечи скруглены. Верх спины изогнут вперёд, и из-за этого ты выглядишь ниже, чем есть.';

  @override
  String get pgLowerBackMeaning0 =>
      'Нейтральный прогиб. Таз и кор держат позвоночник там, где нужно.';

  @override
  String get pgLowerBackMeaning1 =>
      'Поясница плоская. Мягкие прогибы и упражнения на подвижность вернут естественный изгиб.';

  @override
  String get pgLowerBackMeaning2 =>
      'Сильный прогиб. Зажатые сгибатели бедра наклоняют таз вперёд; их растяжка и сильный кор выровняют его.';

  @override
  String get pgLegacyMeaning =>
      'Сохранено в старой версии без этих вопросов. Пройди проверку заново, чтобы получить советы по этой зоне.';

  @override
  String get pgHowItWorks => 'Как работает проверка';

  @override
  String get pgYourPosture => 'Твоя осанка';

  @override
  String pgCheckedOn(String date) {
    return 'Проверка: $date';
  }

  @override
  String get pgOutOf100 => 'из 100';

  @override
  String get pgAllAreasGood => 'Все три зоны в порядке. Так и держи.';

  @override
  String pgStartWith(String area) {
    return 'Начни с этого: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta к прошлой проверке';
  }

  @override
  String get pgStatusGood => 'Хорошо';

  @override
  String get pgStatusFair => 'Можно лучше';

  @override
  String get pgStatusFix => 'Исправить в первую очередь';

  @override
  String get pgKeepItWith => 'Чтобы сохранить';

  @override
  String get pgFixItWith => 'Чтобы исправить';

  @override
  String get pgRetakeNow => 'Пора на еженедельную проверку';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Следующая проверка через $n дня',
      many: 'Следующая проверка через $n дней',
      few: 'Следующая проверка через $n дня',
      one: 'Следующая проверка через $n день',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Та же стена, те же три вопроса. Проверки каждую неделю покажут, работают ли упражнения.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Делай упражнения выше до $date, а потом пройди проверку снова и посмотри, помогли ли они.';
  }

  @override
  String get pgRetakeCheck => 'Пройти снова';

  @override
  String get pgRetakeAnyway => 'Пройти сейчас';

  @override
  String get pgHistoryTitle => 'Твои оценки';

  @override
  String pgSinceFirst(String delta) {
    return '$delta с первой проверки';
  }

  @override
  String get pgHistoryOne =>
      'Это твоя первая проверка. Пройди её снова через 7 дней — отсюда начнётся твоя динамика.';

  @override
  String get pgPostureIntroTitle => 'Насколько ровно ты стоишь?';

  @override
  String get pgPostureIntroBody =>
      'Три вопроса у стены, примерно минута. Ты получишь оценку и по два упражнения на каждое слабое место.';

  @override
  String get pgPostureStep1 =>
      'Встань так, чтобы пятки, таз и лопатки касались стены.';

  @override
  String get pgPostureStep2 =>
      'Сделай фото сбоку, всё тело в кадре, — чтобы потом было с чем сравнить.';

  @override
  String get pgPostureStep3 =>
      'Честно ответь на три вопроса. Оценка считается по твоим ответам.';

  @override
  String get pgPostureStep4 =>
      'Проходи проверку раз в неделю в одно и то же время дня.';

  @override
  String get pgStartCheck => 'Начать проверку осанки';

  @override
  String pgWeekRange(String start, String end) {
    return '$start – $end';
  }

  @override
  String get pgGradeGreat => 'Неделя чемпиона';

  @override
  String get pgGradeGood => 'Крепкая неделя';

  @override
  String get pgGradeOk => 'Набираешь ход';

  @override
  String get pgGradeStart => 'Новый старт';

  @override
  String get pgTopWeek => 'Лучшая неделя';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta к прошлой неделе';
  }

  @override
  String get pgDaysCompleted => 'дн. с полным планом';

  @override
  String get pgDayStreak => 'дн. подряд';

  @override
  String pgBestDay(String day) {
    return 'Лучший день: $day';
  }

  @override
  String get pgNextWeekFocus => 'Фокус на следующую неделю';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Выполни весь план в $n дн. На этой неделе получилось: $done.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Впиши тренировок: $n. На этой неделе было: $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Измерь рост один раз: утром, без обуви, на том же месте. Так видно настоящие изменения.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Все цели выполнены. Теперь сделай полным и $day.';
  }

  @override
  String get pgFocusKeep =>
      'Все цели выполнены, все дни полные. Тот же план, тот же ритм.';

  @override
  String get pgHeightThisWeek => 'Рост за неделю';

  @override
  String pgHeightNow(String height) {
    return 'Сейчас $height';
  }

  @override
  String get pgNoMeasurementWeek => 'На этой неделе замеров ещё нет';

  @override
  String get pgFirstMeasurement => 'Твой первый замер';

  @override
  String pgStartedAt(String height) {
    return 'Старт $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Потенциал $height';
  }

  @override
  String pgToPotential(String cm) {
    return 'До прогнозируемого потенциала осталось $cm.';
  }

  @override
  String get pgPotentialReached =>
      'Прогнозируемый потенциал достигнут. Работа над осанкой ещё может прибавить видимого роста.';

  @override
  String get pgHabitsToday => 'Отмечено сегодня';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return 'Упражнений: $moves · $minutes мин';
  }

  @override
  String plDoneCount(int done, int total) {
    return 'Готово: $done/$total';
  }

  @override
  String get plStartWorkout => 'Начать тренировку';

  @override
  String get plContinueWorkout => 'Продолжить тренировку';

  @override
  String get plWorkoutDoneToday => 'Тренировка на сегодня выполнена';

  @override
  String get plTraining => 'Тренировка';

  @override
  String get plHabits => 'Привычки на день';

  @override
  String get plRestDayNote =>
      'Лёгкий день: короткая йога сохранит гибкость к завтрашнему дню.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets × $reps повт.';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets × $seconds с';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets × $seconds с на каждую сторону';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes мин';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams г за все приёмы пищи';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters в течение дня';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours ч сегодня ночью';
  }

  @override
  String get plYourRoutines => 'Твои задания';

  @override
  String get plNewRoutine => 'Новое задание';

  @override
  String get plCustomEmpty =>
      'Создай своё задание и отмечай его здесь каждый день.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'Удалить «$name»?';
  }

  @override
  String get plHoldToDelete => 'Нажми и удерживай задание, чтобы удалить его.';

  @override
  String plSetOf(int current, int total) {
    return 'Подход $current из $total';
  }

  @override
  String get plRest => 'Отдых';

  @override
  String get plStartSet => 'Начать подход';

  @override
  String get plSetDone => 'Подход выполнен';

  @override
  String get plSkipRest => 'Пропустить отдых';

  @override
  String get plNextMove => 'Следующее упражнение';

  @override
  String get plSkipMove => 'Пропустить';

  @override
  String plUpNext(String name) {
    return 'Дальше: $name';
  }

  @override
  String get plLastMove => 'Последнее упражнение';

  @override
  String get plWorkoutComplete => 'Тренировка завершена';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return 'Упражнений: $moves, примерно $minutes мин. Каждая тренировка на счету.';
  }

  @override
  String get plEachSide => 'На каждую сторону';

  @override
  String get plMoveDone => 'Упражнение выполнено';

  @override
  String plRepsBig(int reps) {
    return '$reps повт.';
  }

  @override
  String get plSessionHint =>
      'Двигайся в своём темпе и нажми «Готово», когда закончишь.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'День $day из $total';
  }

  @override
  String get plTodayStep => 'Шаг на сегодня';

  @override
  String get plTickToComplete => 'Отметь все упражнения, чтобы завершить день';

  @override
  String plNextDayTomorrow(int day) {
    return 'День $day откроется завтра. Отдых — тоже часть роста.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days дня',
      many: '$days дней',
      few: '$days дня',
      one: '$days день',
    );
    return 'До уровня $level: $_temp0';
  }

  @override
  String get plProgramFinished => 'Все 70 дней позади. Программа пройдена.';

  @override
  String plDayCompleteToast(int day) {
    return 'День $day завершён';
  }

  @override
  String get plLevelWeek => 'Неделя этого уровня';

  @override
  String get plProgressionTitle => 'Как растёт сложность';

  @override
  String get plNow => 'Сейчас';

  @override
  String plLevelN(int n) {
    return 'Ур. $n';
  }

  @override
  String get plUnlockProgram => 'Открой программу на 70 дней';

  @override
  String get plProgramPitch =>
      '10 уровней, по одному в неделю. Каждый добавляет секунды к удержаниям, повторы к прыжкам и подход, когда придёт время.';

  @override
  String plDayLocked(int day) {
    return 'Сначала заверши день $day';
  }

  @override
  String plCurrentDay(int day) {
    return 'День $day';
  }

  @override
  String get plTodaysTargets => 'Цели на сегодня';

  @override
  String get plTargetsBasis =>
      'Рассчитано по твоему возрасту, весу и тренировкам';

  @override
  String plProteinSplit(int meals, int grams) {
    return 'Приёмов: $meals × $grams г';
  }

  @override
  String get plZinc => 'Цинк';

  @override
  String get plMagnesium => 'Магний';

  @override
  String get plEnergy => 'Энергия';

  @override
  String get plChecklist => 'Чек-лист на сегодня';

  @override
  String plCheckProtein(int grams) {
    return 'Белок $grams г';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'Кальций $mg мг';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'Витамин D $iu МЕ';
  }

  @override
  String plCheckWater(String liters) {
    return 'Вода $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount из отмеченных приёмов пищи';
  }

  @override
  String get plVitaminDNote =>
      '15 минут полуденного солнца на руки и лицо или добавка, которую одобрил врач';

  @override
  String plWaterLogged(String liters) {
    return 'Уже записано: $liters';
  }

  @override
  String get plMealPlan => 'Твой план питания';

  @override
  String get plMealPlanSub => 'Обычная еда, точные граммы, под твои цели';

  @override
  String get plSnack => 'Перекус';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein г белка · $calcium мг кальция · $kcal ккал';
  }

  @override
  String plMealGoal(int grams) {
    return 'цель $grams г';
  }

  @override
  String get plMarkEaten => 'Отметить как съеденное';

  @override
  String get plEaten => 'Съедено';

  @override
  String get plPlanTotal => 'Итого за день';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'Эти блюда дают примерно $planKcal из твоих $kcal ккал. Остальное добери фруктами, овощами, хлебом или рисом.';
  }

  @override
  String get plWeeklyMenu => 'Меню на неделю';

  @override
  String get plWeeklyMenuSub => 'Каждый день новое блюдо, цели те же';

  @override
  String get plUnlockMenu => 'Открой полное меню на неделю';

  @override
  String get plRecipes => 'Рецепты';

  @override
  String get plRecipesSub => 'Быстрые блюда с большим количеством белка';

  @override
  String get plNutritionGuide => 'Гид по питанию';

  @override
  String get plNutritionGuideSub => 'Нутриенты, продукты и добавки';

  @override
  String plPieces(int n) {
    return '$n шт.';
  }

  @override
  String get plFoodOats => 'Овсянка';

  @override
  String get plFoodMilk => 'Молоко';

  @override
  String get plFoodBanana => 'Банан';

  @override
  String get plFoodWalnuts => 'Грецкие орехи';

  @override
  String get plFoodGreekYogurt => 'Греческий йогурт';

  @override
  String get plFoodYogurt => 'Йогурт';

  @override
  String get plFoodEggs => 'Яйца';

  @override
  String get plFoodBread => 'Цельнозерновой хлеб';

  @override
  String get plFoodWhiteCheese => 'Фета';

  @override
  String get plFoodHardCheese => 'Чеддер';

  @override
  String get plFoodSalad => 'Салат из помидоров и огурцов';

  @override
  String get plFoodOrange => 'Апельсин';

  @override
  String get plFoodPeanutButter => 'Арахисовая паста';

  @override
  String get plFoodSpinach => 'Шпинат';

  @override
  String get plFoodCottageCheese => 'Творог';

  @override
  String get plFoodChicken => 'Куриная грудка';

  @override
  String get plFoodBulgur => 'Булгур';

  @override
  String get plFoodAyran => 'Айран (кисломолочный напиток)';

  @override
  String get plFoodTuna => 'Тунец (консервы)';

  @override
  String get plFoodPasta => 'Макароны';

  @override
  String get plFoodBeef => 'Нежирная говядина';

  @override
  String get plFoodRice => 'Рис';

  @override
  String get plFoodChickpeas => 'Нут';

  @override
  String get plFoodSalmon => 'Лосось';

  @override
  String get plFoodBroccoli => 'Брокколи';

  @override
  String get plFoodPotato => 'Картофель';

  @override
  String get plFoodLentils => 'Чечевица';

  @override
  String get plFoodSardines => 'Сардины';

  @override
  String get plFoodAlmonds => 'Миндаль';

  @override
  String get plFoodKefir => 'Кефир';

  @override
  String get plFoodPumpkinSeeds => 'Тыквенные семечки';

  @override
  String get wtCoffee => 'Кофе';

  @override
  String get wtTea => 'Чай';

  @override
  String get wtCola => 'Кола';

  @override
  String get wtEnergyDrink => 'Энергетик';

  @override
  String get crCustomBadge => 'Своё';

  @override
  String get crNameHint => 'напр. Утренняя бодрая растяжка';

  @override
  String get crDoseHint => 'напр. 3×10 повторов или 3×30 секунд';

  @override
  String get paywallLifetime => 'Навсегда';

  @override
  String paywallOnce(String price) {
    return '$price разово';
  }

  @override
  String get paywallLifetimeBadge => 'Без подписки';

  @override
  String get paywallLifetimeDisclaimer =>
      'Разовый платёж · без подписки, ничего не продлевается';

  @override
  String get pwSlidePotentialTitle => 'Узнай свой потенциал';

  @override
  String get pwSlidePotentialCaption =>
      'Рассчитано по твоему возрасту, росту и росту родителей.';

  @override
  String get pwSlideTodayTitle => 'План на каждый день';

  @override
  String get pwSlideTodayCaption =>
      'Короткие тренировки на каждый день с видеоподсказками.';

  @override
  String get pwSlideProgramTitle => '70 дней, 10 уровней';

  @override
  String get pwSlideProgramCaption => 'Каждую неделю упражнения чуть сложнее.';

  @override
  String get pwSlideNutritionTitle => 'Ешь для роста';

  @override
  String get pwSlideNutritionCaption =>
      'Цели по белку, кальцию и витамину D на день — лично для тебя.';

  @override
  String get pwSlideChartTitle => 'Смотри, как растёт кривая';

  @override
  String get pwSlideChartCaption =>
      'Каждый замер ложится на путь к твоему потенциалу.';

  @override
  String get pwSlideScoreTitle => 'Одна оценка твоих привычек';

  @override
  String get pwSlideScoreCaption => 'Узнай, какую привычку исправить первой.';

  @override
  String get pwSlidePostureTitle => 'Стань выше уже сегодня';

  @override
  String get pwSlidePostureCaption =>
      'Быстрая проверка осанки и упражнения, которые её исправят.';

  @override
  String get pwExample => 'Пример';

  @override
  String pwYouLine(String now, String potential) {
    return 'Ты: $now → потенциал $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'Пример: $now → потенциал $potential';
  }

  @override
  String get tv3NewEyebrow => 'Что нового';

  @override
  String get tv3NewTitle => 'BeTaller сильно обновился';

  @override
  String get tv3NewDesc =>
      'Новый план, новая программа, новый вид. Вот что изменилось.';

  @override
  String get tv3PotentialTitle => 'Это твой потенциал';

  @override
  String get tv3PotentialDesc =>
      'Твой рост сегодня — и то, до чего ты можешь дойти. План сокращает разницу.';

  @override
  String get tv3TodayTitle => 'План на сегодня';

  @override
  String tv3TodayDesc(String button) {
    return 'Короткая тренировка на сегодня. Нажми $button и повторяй.';
  }

  @override
  String get tv3ProgramTitle => '70 дней дисциплины';

  @override
  String get tv3ProgramDesc =>
      'Один шаг в день через 10 уровней. Каждый день продолжает предыдущий.';

  @override
  String get tv3NutritionTitle => 'Твои цели на день';

  @override
  String get tv3NutritionDesc =>
      'Белок, кальций, витамин D и вода — рассчитано под твоё тело.';

  @override
  String get tv3ChartTitle => 'Следи за кривой';

  @override
  String get tv3ChartDesc =>
      'Измеряй рост раз в одну-две недели и смотри, как линия поднимается к твоему потенциалу.';

  @override
  String get tv3ScoreTitle => 'Твоя оценка BeTaller';

  @override
  String get tv3ScoreDesc =>
      'Одно число о том, как у тебя дела. Сначала подтяни самую слабую зону.';

  @override
  String get tv3Next => 'Далее';

  @override
  String get tv3ShowMe => 'Покажи';

  @override
  String get tv3Done => 'Поехали';

  @override
  String get obWhyTitle => 'Зачем тебе быть выше?';

  @override
  String get obWhySubtitle =>
      'Выбери всё, что подходит. Твой план начинается с твоей причины.';

  @override
  String get obWhyConfidence => 'Быть увереннее в себе';

  @override
  String get obWhyImpression => 'Производить сильное первое впечатление';

  @override
  String get obWhySports => 'Добиться большего в спорте';

  @override
  String get obWhyClothes => 'Чтобы одежда лучше сидела';

  @override
  String get obWhyPhotos => 'Лучше выглядеть на фото';

  @override
  String get obWhyPotential => 'Просто узнать свой потенциал';

  @override
  String get obTriedTitle => 'Были другие приложения для роста?';

  @override
  String get obTriedSubtitle =>
      'Неправильных ответов нет. Так мы покажем, чем отличаемся.';

  @override
  String get obTriedStopped => 'Да, но уже не пользуюсь';

  @override
  String get obTriedStill => 'Да, пользуюсь до сих пор';

  @override
  String get obTriedFirst => 'Нет, это первое';

  @override
  String get obTriedStoppedTitle => 'Одно число не даст тебе мотивации';

  @override
  String get obTriedStoppedBody =>
      'Большинство приложений просто дают число. BeTaller превращает его в план на каждый день, который можно отмечать, — с напоминаниями в удобное тебе время.';

  @override
  String get obTriedStillTitle => 'Оставь то, что тебе помогает';

  @override
  String get obTriedStillBody =>
      'BeTaller добавляет ежедневную часть: план по твоим ответам, который можно отмечать шаг за шагом.';

  @override
  String get obTriedFirstTitle => 'Отличное место для старта';

  @override
  String get obTriedFirstBody =>
      'Здесь ты получишь не только число. BeTaller превратит твои ответы в план на каждый день, который можно отмечать.';

  @override
  String get obTriedCardTitle => 'Что ты отмечаешь каждый день';

  @override
  String get obTriedItem1 => 'Короткая тренировка под твою неделю';

  @override
  String get obTriedItem2 => 'Твоя цель по белку';

  @override
  String get obTriedItem3 => 'Отбой вовремя';

  @override
  String get obBlockTitle => 'Что тебе мешает?';

  @override
  String get obBlockSubtitle => 'Выбери всё, что подходит. План это учтёт.';

  @override
  String get obBlockForget => 'Забываю';

  @override
  String get obBlockTime => 'Не хватает времени';

  @override
  String get obBlockExercises => 'Не знаю, какие упражнения делать';

  @override
  String get obBlockMotivation => 'Пропадает мотивация';

  @override
  String get obBlockBedtime => 'Поздно ложусь';

  @override
  String get obBlockMeals => 'Пропускаю приёмы пищи';

  @override
  String get obFirstTitle => 'Что сделаешь первым, когда станешь выше?';

  @override
  String get obFirstSubtitle => 'Представь это. Вот к чему ты идёшь.';

  @override
  String get obFirstWardrobe => 'Обновлю гардероб';

  @override
  String get obFirstMuscle => 'Накачаюсь';

  @override
  String get obFirstPhotos => 'Буду выкладывать больше фото';

  @override
  String get obFirstTeam => 'Попробую попасть в команду';

  @override
  String get obFirstFeelGood => 'Ничего особенного, просто буду кайфовать';

  @override
  String get obBuiltChip => 'Создано для тебя';

  @override
  String get obBuiltTitle => 'Твой план — под тебя';

  @override
  String get obBuiltReason => 'Твоя причина';

  @override
  String get obBuiltGoal => 'Цель';

  @override
  String get obBuiltWhen => 'Когда дойдёшь до цели';

  @override
  String get obBuiltBlockers => 'Что мешает — уже решено';

  @override
  String get obFixForget => 'Напоминания в выбранное тобой время';

  @override
  String get obFixTime => 'Короткие тренировки, в основном около 15 минут';

  @override
  String get obFixExercises => 'Упражнения с видео, шаг за шагом';

  @override
  String get obFixMotivation => 'Серии и уровни, которые не дают остановиться';

  @override
  String get obFixBedtime => 'Цель по сну и напоминание перед сном';

  @override
  String get obFixMeals => 'Цель по белку и план питания';

  @override
  String get obNotifTitle => 'BeTaller напомнит, когда это важно';

  @override
  String get obNotifSubtitle =>
      'Настроено на время из твоих ответов. Его можно поменять в любой момент.';

  @override
  String get obNotifWorkout => 'Тренировка';

  @override
  String obNotifWorkoutDetail(String time) {
    return 'За 30 минут до тренировки в $time';
  }

  @override
  String get obNotifMeal => 'Еда и белок';

  @override
  String obNotifMealDetail(String time) {
    return 'Во время приёма пищи в $time';
  }

  @override
  String get obNotifWater => 'Вода';

  @override
  String get obNotifWaterDetail => 'Перерыв на воду днём';

  @override
  String get obNotifSleep => 'Подготовка ко сну';

  @override
  String obNotifSleepDetail(String time) {
    return 'За час до отбоя в $time';
  }

  @override
  String get obNotifAllow => 'Включить напоминания';

  @override
  String get obNotifNotNow => 'Не сейчас';

  @override
  String get obNotifNow => 'сейчас';

  @override
  String get ftOneFree => '1 бесплатно';

  @override
  String get ftFreeToday => 'Сегодня бесплатно';

  @override
  String get ftContinuePro => 'Продолжить с Pro';

  @override
  String get ftNotNow => 'Не сейчас';

  @override
  String get ftOutWorkoutTitle => 'Бесплатная тренировка использована';

  @override
  String get ftOutWorkoutBody =>
      'Сохрани серию с Pro: тренировка с подсказками каждый день, каждое упражнение с таймером.';

  @override
  String get ftOutDayTitle => 'Бесплатный первый день закончился';

  @override
  String get ftOutDayBody =>
      'План, цели и прогресс остаются здесь — их можно читать. Сохрани серию с Pro: отмечай план и записывай воду и сон каждый день.';

  @override
  String get ftOutPostureTitle => 'Бесплатная проверка осанки использована';

  @override
  String get ftOutPostureBody =>
      'Твой результат остаётся здесь. Проверяй осанку каждую неделю с Pro и смотри, как она улучшается.';

  @override
  String get ftOutPhotosTitle => 'Бесплатное сравнение фото использовано';

  @override
  String get ftOutPhotosBody =>
      'Эту пару можно смотреть и дальше. Добавляй больше фото и сравнивай любые два с Pro.';

  @override
  String get ftOutReportTitle => 'Бесплатный отчёт за неделю использован';

  @override
  String get ftOutReportBody =>
      'Получай полный разбор каждую неделю с Pro: оценка каждого дня, твои цели и одно, что можно улучшить.';

  @override
  String get ftOutScoreTitle => 'Бесплатный разбор оценки уже просмотрен';

  @override
  String get ftOutScoreBody =>
      'Оценка остаётся на экране. Смотри, из чего она складывается и что делать дальше, каждый день с Pro.';

  @override
  String get ftOutArticleTitle => 'Бесплатная статья прочитана';

  @override
  String get ftOutArticleBody =>
      'Эта статья остаётся открытой для тебя. Читай всю библиотеку с Pro.';

  @override
  String get ftWhyWorkout => 'Тренировки с подсказками входят в Pro';

  @override
  String get ftWhyPlan => 'Отмечать план можно в Pro';

  @override
  String get ftWhyProgram => 'Программа на 70 дней входит в Pro';

  @override
  String get ftWhyWater => 'Ежедневный учёт воды входит в Pro';

  @override
  String get ftWhySleep => 'Ежедневный учёт сна входит в Pro';

  @override
  String get ftWhyNutrition => 'План питания на каждый день входит в Pro';

  @override
  String get ftWhyPosture => 'Еженедельные проверки осанки входят в Pro';

  @override
  String get ftWhyPhotos => 'Сравнение фото входит в Pro';

  @override
  String get ftWhyReport => 'Отчёт за неделю входит в Pro';

  @override
  String get ftWhyScore => 'Разбор оценки входит в Pro';

  @override
  String get ftWhyArticle => 'Вся библиотека входит в Pro';

  @override
  String get ftPlanLocked => 'План можно читать здесь. А отмечать его — в Pro.';

  @override
  String get ftNutritionLocked =>
      'Цели и блюда можно читать здесь. А отмечать их — в Pro.';

  @override
  String get ftPreviewTag => 'Превью';

  @override
  String get ftPreviewTitle => 'Это было превью';

  @override
  String get ftPreviewBody =>
      'Остальная часть тренировки входит в Pro. Вот что дальше:';

  @override
  String get ftFreeWorkoutUsed =>
      'Это была бесплатная тренировка с подсказками. С Pro они будут каждый день.';

  @override
  String get ftScoreLockedTitle => 'Из чего складывается оценка';

  @override
  String get ftScoreLockedBody =>
      'Каждая часть оценки, на чём она основана и что сделать дальше.';

  @override
  String get ftReportLockedTitle => 'Вся твоя неделя';

  @override
  String get ftReportLockedBody =>
      'Каждый день в сравнении с планом, твои цели, рост и один фокус на следующую неделю.';

  @override
  String get ftPhotosLockedTitle => 'Сравни эти два фото';

  @override
  String get ftPhotosLockedBody =>
      'Бесплатное сравнение уже использовано. С Pro можно двигать ползунок между любыми двумя фото.';

  @override
  String get ftArticleFreeLine =>
      'Первая статья бесплатно. Выбери ту, что хочешь.';

  @override
  String get plFinishWorkout => 'Завершить';

  @override
  String get obTriedMostApps => 'Большинство приложений';

  @override
  String get obTriedThatsIt => 'Одно число — и всё.';

  @override
  String get obTriedPlanLabel => 'Твой день в BeTaller';

  @override
  String get obTriedProteinSub => 'Распределено по приёмам пищи';

  @override
  String get obTriedSleepSub => 'Напоминание перед сном';

  @override
  String get obTriedFeatVideo => 'Упражнения с видео';

  @override
  String get obTriedFeatReminders => 'Напоминания в твоё время';

  @override
  String get obTriedFeatStreaks => 'Серии и уровни';

  @override
  String get obBedtimeUnknown => 'Не знаю, по-разному';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'Предложим $time — исходя из того, сколько сна нужно в твоём возрасте. Можно поменять в любой момент.';
  }

  @override
  String get obWorkoutTimeUnknown => 'Не знаю, точного времени нет';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'Пока поставим $time. Можно поменять в любой момент.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'Предлагаем: отбой около $time. Можно поменять в любой момент.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'Предлагаем: тренировка около $time. Можно поменять в любой момент.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'Настроено на время из твоих ответов, а где ответа не было — с нашей подсказкой. Всё можно поменять в любой момент.';

  @override
  String get plFoodBrownRice => 'Бурый рис';

  @override
  String get unitHeightTitle => 'Единицы роста';

  @override
  String get unitWeightTitle => 'Единицы веса';

  @override
  String get unitWaterTitle => 'Единицы воды';

  @override
  String get unitOptCm => 'Сантиметры';

  @override
  String get unitOptFtIn => 'Футы и дюймы';

  @override
  String get unitOptKg => 'Килограммы';

  @override
  String get unitOptLb => 'Фунты';

  @override
  String get unitOptStLb => 'Стоуны и фунты';

  @override
  String get unitOptLiters => 'Литры';

  @override
  String get unitOptFlOz => 'Жидкие унции';

  @override
  String achieveGrowthImp(String amount) {
    return 'Прирост $amount';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'Зафиксируй общий прирост $amount';
  }

  @override
  String get postureBenefitIn =>
      'Голова, плечи и поясница. Ровная осанка показывает примерно на 1 дюйм больше твоего настоящего роста.';

  @override
  String get notifPostureBodyIn =>
      'Спина прямая, плечи назад. Хорошая осанка = разница примерно в 1 дюйм!';

  @override
  String get painPostureDescIn =>
      'Правильная осанка может сразу добавить примерно 1 дюйм. Ежедневные задания BeTaller на осанку закрепят это за несколько недель.';

  @override
  String get routinePostureDescIn =>
      'Спина прямая, плечи назад. Проверяй каждый час. Хорошая осанка = разница примерно в 1 дюйм.';

  @override
  String get sciPostureCheckIn =>
      'Правильная осанка сразу добавляет примерно 1 дюйм к видимому росту и защищает позвоночник от сжатия';

  @override
  String get routineProteinDescLb =>
      'Яйца, курица, рыба, молочка. Минимум 0,7 г белка на фунт веса в день.';

  @override
  String pwPersonalTitle(String height) {
    return 'Твой план, чтобы дойти до $height, готов';
  }

  @override
  String get pwPersonalEstimate =>
      'Примерный потенциал по твоим ответам, а не гарантия';

  @override
  String pwPersonalReason(String reason) {
    return 'Твоя причина: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'Напоминание успокоиться перед отбоем в $time';
  }

  @override
  String get obParentUnknown => 'Не знаю';

  @override
  String get obParentUnknownHint =>
      'Тогда возьмём средний рост взрослого. Это менее точно, а добавить рост можно в профиле в любой момент.';

  @override
  String get obEthnicityWhy =>
      'Нужно только чтобы примерно оценить рост родителя, которого ты не знаешь.';

  @override
  String get resultNoParentNote =>
      'Рассчитано без роста одного из родителей, поэтому менее точно. Его можно добавить в профиле в любой момент.';

  @override
  String get resultNoParentsNote =>
      'Рассчитано без роста родителей, поэтому менее точно. Их рост можно добавить в профиле в любой момент.';

  @override
  String get resultFootnoteEstimated =>
      'Это оценка по данным графиков роста и среднему росту взрослых. Не медицинская рекомендация.';

  @override
  String get obBudgetChip => 'ЧЕСТНАЯ ЦЕНА';

  @override
  String get obBudgetTitle =>
      'Цена BeTaller по карману каждому подростку, который хочет расти';

  @override
  String get obBudgetDesc =>
      'Твой рост не должен зависеть от того, сколько у тебя денег. Поэтому цена задаётся отдельно для каждой страны.';

  @override
  String obBudgetWeek(String price) {
    return 'Неделя Pro здесь: $price';
  }

  @override
  String get obBudgetLocalTitle => 'Цена для твоей страны';

  @override
  String get obBudgetLocalDesc =>
      'Не пересчитана из долларов США, а задана под бюджеты там, где ты живёшь.';

  @override
  String get obBudgetWeekTitle => 'Начни всего с недели';

  @override
  String get obBudgetWeekDesc =>
      'Никакого крупного платежа сразу. Отменить можно в любой момент в настройках Apple ID.';

  @override
  String get obBudgetAllTitle => 'Всё в одном плане';

  @override
  String get obBudgetAllDesc =>
      'Тренировки, сон, питание, осанка и отчёты о прогрессе.';

  @override
  String get obRateTitle => 'BeTaller создан, чтобы правда тебе помочь';

  @override
  String get obRateDesc =>
      'Если тебе понравились наше внимание и честность, нам будет очень приятно получить твою оценку.';

  @override
  String get obRateCta => 'Оценить BeTaller';

  @override
  String get obRateLater => 'Может, позже';
}
