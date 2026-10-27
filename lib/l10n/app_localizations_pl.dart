// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get navHome => 'Start';

  @override
  String get navAnalysis => 'Analiza';

  @override
  String get navRoutines => 'Mój plan';

  @override
  String get disciplineTitle => 'Dyscyplina';

  @override
  String get disciplineProgramTitle => 'Program dyscypliny';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total dni';
  }

  @override
  String get disciplineCompleteDay => 'Zakończ dzień';

  @override
  String disciplineDayN(int n) {
    return 'Dzień $n';
  }

  @override
  String get disciplineLevels => 'Poziomy';

  @override
  String get disciplineLevelDone => 'Zaliczone';

  @override
  String get disciplineLocked => 'Zablokowane';

  @override
  String get disciplineTodayIs => 'Dziś';

  @override
  String get disciplineToday => 'Dziś';

  @override
  String get disciplineTodayPlan => 'Plan na dziś';

  @override
  String get disciplineWeek => 'Ten tydzień';

  @override
  String get disciplineMonth => 'Ten miesiąc';

  @override
  String get disciplineLevel => 'Poziom dyscypliny';

  @override
  String disciplineStreakDays(int days) {
    return 'Seria: $days dni';
  }

  @override
  String disciplineToNext(int days) {
    return 'Do następnego poziomu: $days dni';
  }

  @override
  String get disciplineMaxTier => 'Najwyższy poziom!';

  @override
  String get disciplineTierSpark => 'Iskra';

  @override
  String get disciplineTierSteady => 'Stabilny';

  @override
  String get disciplineTierSharp => 'Czujny';

  @override
  String get disciplineTierSolid => 'Solidny';

  @override
  String get disciplineTierRelentless => 'Nieustępliwy';

  @override
  String get disciplineTierUnbroken => 'Niezłomny';

  @override
  String get disciplineTierLegend => 'Legenda';

  @override
  String get goalPerfectDays => 'Dni z ukończonym planem';

  @override
  String get goalWorkouts => 'Treningi';

  @override
  String get goalMeasurement => 'Pomiar wzrostu';

  @override
  String get goalPhoto => 'Zdjęcie postępów';

  @override
  String get goalPostureCheck => 'Kontrola postawy';

  @override
  String get disciplineAllDone => 'Na dziś gotowe';

  @override
  String disciplineDayProgress(int done, int total) {
    return 'Zrobione: $done/$total';
  }

  @override
  String get navProgress => 'Postępy';

  @override
  String get trackingSection => 'Twoje narzędzia';

  @override
  String get photosBenefit =>
      'Przed i po, obok siebie. Zobacz zmianę, zamiast o niej czytać.';

  @override
  String get postureBenefit =>
      'Głowa, ramiona i dolny odcinek pleców. Wyprostowana sylwetka pokazuje nawet 2-3 cm więcej twojego prawdziwego wzrostu.';

  @override
  String get reportBenefit =>
      'Oceń swój tydzień dzień po dniu i zobacz, gdzie coś nie wyszło.';

  @override
  String get photosCta => 'Dodaj zdjęcie';

  @override
  String get postureCta => 'Analizuj';

  @override
  String get reportCta => 'Otwórz raport';

  @override
  String get toolStateReady => 'Gotowe';

  @override
  String get photosSummaryEmpty => 'Dodaj pierwsze zdjęcie';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count zdjęcia',
      many: '$count zdjęć',
      few: '$count zdjęcia',
      one: '$count zdjęcie',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'Brak analizy';

  @override
  String postureSummaryScore(int score) {
    return 'Postawa: $score/100';
  }

  @override
  String get navProfile => 'Profil';

  @override
  String greeting(String name) {
    return 'Cześć, $name';
  }

  @override
  String get currentHeight => 'Obecny wzrost';

  @override
  String get target => 'Cel';

  @override
  String completed(String pct) {
    return 'Ukończono $pct%';
  }

  @override
  String remaining(String cm, String unit) {
    return '+$cm $unit do celu';
  }

  @override
  String get updateAnalysis => 'Zaktualizuj analizę';

  @override
  String get analysisSubtitle =>
      'Prognozy na podstawie dawnych pomiarów i nawyków';

  @override
  String get dailyRoutines => 'Codzienne zadania';

  @override
  String get allRoutinesDone => 'Wszystkie zadania zrobione!';

  @override
  String get water => 'Woda';

  @override
  String get sleep => 'Sen';

  @override
  String get growthSummary => 'Podsumowanie wzrostu';

  @override
  String get total => 'RAZEM';

  @override
  String get last => 'OSTATNI';

  @override
  String get measurement => 'POM.';

  @override
  String get dailyTip => 'Porada dnia';

  @override
  String get waterTracking => 'Nawodnienie';

  @override
  String get waterGoalReached => 'Dzienny cel osiągnięty';

  @override
  String waterRemaining(String amount) {
    return 'Jeszcze $amount';
  }

  @override
  String get undo => 'Cofnij';

  @override
  String waterToday(String amount) {
    return 'Dziś: $amount L';
  }

  @override
  String get sleepTracking => 'Śledzenie snu';

  @override
  String sleepTarget(String hours) {
    return 'Cel: $hours godz.';
  }

  @override
  String get hours => 'godz.';

  @override
  String get save => 'Zapisz';

  @override
  String get cancel => 'Anuluj';

  @override
  String get analysis => 'Analiza';

  @override
  String get betallerScore => 'Wynik BeTaller';

  @override
  String get genetic => 'Genetyka';

  @override
  String get growth => 'Wzrost';

  @override
  String get nutrition => 'Odżywianie';

  @override
  String get sleepLabel => 'Sen';

  @override
  String get discipline => 'Dyscyplina';

  @override
  String get improveScore => 'Popraw swój wynik';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Odżywianie – pilne!';

  @override
  String get nutritionStrengthen => 'Popraw odżywianie';

  @override
  String get sleepRecordAdd => 'Dodaj zapis snu';

  @override
  String get sleepPoor => 'Słaby rytm snu';

  @override
  String get sleepImprove => 'Popraw sen';

  @override
  String get startToday => 'Zacznij dziś!';

  @override
  String routinesRemaining(int count) {
    return 'Zostało zadań: $count';
  }

  @override
  String get keepStreak => 'Utrzymaj serię';

  @override
  String get addFirstMeasurement => 'Dodaj pierwszy pomiar';

  @override
  String get addMeasurement => 'Dodaj pomiar';

  @override
  String waterHalfNotReached(String amount) {
    return 'Nie masz jeszcze połowy dziennego celu wody. Wypij jeszcze $amount L.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'Do celu brakuje $amount L wody. Już prawie!';
  }

  @override
  String bmiLow(String bmi) {
    return 'Twoje BMI wynosi $bmi — trochę za nisko. Jedz więcej białka i kalorii.';
  }

  @override
  String get bodyFactsTitle => 'Twoje ciało';

  @override
  String get dailyNeedsTitle => 'Twoje dzienne cele';

  @override
  String bmiHigh(String bmi) {
    return 'Twoje BMI wynosi $bmi — trochę za wysoko. Postaw na zdrowe jedzenie.';
  }

  @override
  String get nutritionDefault =>
      'Zrealizuj cel wody i dbaj o zbilansowaną dietę.';

  @override
  String sleepNoRecord(String hours) {
    return 'Brak zapisu snu na dziś. Celuj w $hours godz. i zapisz sen.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Dzisiejszy sen: $current godz. — brakuje $missing godz. Połóż się wcześniej!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Już prawie. $hours godz. snu to najlepsze warunki dla hormonu wzrostu.';
  }

  @override
  String get sleepGood => 'Świetny rytm snu! Tak trzymaj.';

  @override
  String noRoutinesDone(int total) {
    return 'Dziś jeszcze nic nie zrobione. Zacznij od jednego z $total zadań!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return 'Zadania zrobione dziś: $done/$total. Zostało: $left!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Świetna robota! Dni do startu serii: $needed.';
  }

  @override
  String streakContinue(int days) {
    return 'Seria: $days dni! Twój wynik rośnie, gdy ją kontynuujesz.';
  }

  @override
  String get noMeasurements =>
      'Brak pomiarów wzrostu. Dodaj pierwszy, by prognozy były dokładne.';

  @override
  String fewMeasurements(int count) {
    return 'Brakujące pomiary: $count. Dodaj je, by obliczyć tempo wzrostu.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Liczba pomiarów: $count. Przy 5 dokładność wyraźnie wzrośnie.';
  }

  @override
  String get keepMeasuring =>
      'Dodawaj kolejne pomiary. Każdy nowy wynik poprawia prognozy.';

  @override
  String get heightPrediction => 'Prognoza wzrostu';

  @override
  String get predictedHeightAt21 => 'Prognoza na wiek 21 lat';

  @override
  String get predictionMethod =>
      'Obliczane na podstawie genetyki (rodzice), tempa wzrostu, BMI i wieku.';

  @override
  String get growthStatus => 'Status wzrostu';

  @override
  String get growthRemaining => 'Jeszcze przed tobą';

  @override
  String get growthBreakdown => 'Skąd biorą się te centymetry';

  @override
  String get geneticGainLabel => 'Zysk genetyczny';

  @override
  String get lifestyleLabel => 'Styl życia';

  @override
  String get geneticCeilingLabel => 'Pułap';

  @override
  String get reachableTargetHeight => 'Twój osiągalny wzrost docelowy';

  @override
  String get geneticCeilingProgress => 'Postęp do pułapu genetycznego';

  @override
  String get completionLabel => 'UKOŃCZENIE';

  @override
  String get growthVelocity => 'TEMPO WZROSTU';

  @override
  String get noData => 'BRAK DANYCH';

  @override
  String growthRate(String rating) {
    return 'Tempo wzrostu: $rating';
  }

  @override
  String get bmi => 'BMI';

  @override
  String get calories => 'Kalorie';

  @override
  String get kcalDay => 'kcal/dzień';

  @override
  String get daily => 'dziennie';

  @override
  String get protein => 'Białko';

  @override
  String get minimum => 'minimum';

  @override
  String get age => 'Wiek';

  @override
  String get male => 'Chłopak';

  @override
  String get female => 'Dziewczyna';

  @override
  String get yearlyPrediction => 'PROGNOZA ROCZNA';

  @override
  String ageYear(int age) {
    return '$age lat';
  }

  @override
  String get progressTitle => 'Śledzenie postępów';

  @override
  String get totalGrowth => 'Razem';

  @override
  String get lastDiff => 'Ostatnia zmiana';

  @override
  String get measurementCount => 'Pom.';

  @override
  String get heightChart => 'Wykres wzrostu';

  @override
  String get chartMinData => 'Do wykresu potrzeba co najmniej 2 pomiarów';

  @override
  String get chartInstruction => 'Dodaj pomiary, aby zobaczyć wykres postępów!';

  @override
  String get addMeasurementButton => 'DODAJ NOWY POMIAR';

  @override
  String get measurementHistory => 'HISTORIA POMIARÓW';

  @override
  String get deleteTitle => 'Usuń pomiar';

  @override
  String get deleteMessage => 'Na pewno chcesz usunąć ten pomiar?';

  @override
  String get dismiss => 'Anuluj';

  @override
  String get delete => 'Usuń';

  @override
  String get newMeasurement => 'Nowy pomiar wzrostu';

  @override
  String get routines => 'Zadania';

  @override
  String streakDays(int days) {
    return 'Dni: $days';
  }

  @override
  String get progressStatus => 'Stan postępów';

  @override
  String get completedLabel => 'Zrobione!';

  @override
  String get all => 'Wszystkie';

  @override
  String get exercise => 'Ćwiczenia';

  @override
  String get posture => 'Postawa';

  @override
  String bestStreak(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dzień',
    );
    return 'Rekord: $_temp0';
  }

  @override
  String get editProfile => 'Edytuj profil';

  @override
  String get editProfileSubtitle => 'Zmień wzrost, wagę i wiek';

  @override
  String get name => 'Imię';

  @override
  String birthDate(String date) {
    return 'Data ur.: $date';
  }

  @override
  String get heightCm => 'Wzrost (cm)';

  @override
  String get weightKg => 'Waga (kg)';

  @override
  String get fatherHeight => 'Wzrost taty (cm)';

  @override
  String get motherHeight => 'Wzrost mamy (cm)';

  @override
  String get notifications => 'Powiadomienia';

  @override
  String get reminderNextLabel => 'Następne przypomnienie';

  @override
  String get reminderManageHint => 'Zarządzaj przypomnieniami';

  @override
  String get reminderOffCta => 'Włącz powiadomienia';

  @override
  String get stateOn => 'Wł.';

  @override
  String get stateOff => 'Wył.';

  @override
  String get reminderMasterTitle => 'Powiadomienia';

  @override
  String reminderActiveCount(int count) {
    return 'Aktywne: $count';
  }

  @override
  String get reminderBuiltIn => 'Wbudowane przypomnienia';

  @override
  String get reminderYourOwn => 'Twoje przypomnienia';

  @override
  String get reminderAdd => 'Dodaj przypomnienie';

  @override
  String get reminderDays => 'Dni';

  @override
  String get reminderEveryDay => 'Codziennie';

  @override
  String get reminderLabelHint => 'O czym mamy ci przypomnieć?';

  @override
  String get reminderEmptyHint =>
      'Dodaj własne: trening, witaminy, rozciąganie — co tylko chcesz.';

  @override
  String get reminderCustom => 'Przypomnienie';

  @override
  String get reminderCustomBody => 'Nadeszła ustawiona przez ciebie godzina.';

  @override
  String get reminderExercise => 'Ćwiczenia';

  @override
  String get reminderNutrition => 'Odżywianie';

  @override
  String get reminderWater => 'Woda';

  @override
  String get reminderPosture => 'Postawa';

  @override
  String get reminderRoutine => 'Codzienny plan';

  @override
  String get reminderSleep => 'Sen';

  @override
  String get reminderMeasurement => 'Pomiar wzrostu';

  @override
  String get notificationsOn => 'Przypomnienia włączone';

  @override
  String get notificationsOff => 'Bez przypomnień';

  @override
  String get premium => 'Przejdź na Premium';

  @override
  String get premiumSubtitle => 'Odblokuj wszystkie funkcje';

  @override
  String get rateUs => 'Oceń nas';

  @override
  String get rateSubtitle => 'Podoba ci się aplikacja? Daj nam 5 gwiazdek!';

  @override
  String get share => 'Udostępnij';

  @override
  String get shareSubtitle => 'Powiedz znajomym o BeTaller';

  @override
  String get shareText =>
      'Dzięki BeTaller poznaję swój potencjał wzrostu! Wypróbuj też: https://apps.apple.com/app/id6761445065';

  @override
  String get feedback => 'Prześlij opinię';

  @override
  String get feedbackSubtitle => 'Napisz do nas';

  @override
  String get resetData => 'Zresetuj wszystkie dane';

  @override
  String get resetSubtitle => 'Wszystkie dane zostaną usunięte';

  @override
  String get resetTitle => 'Resetuj dane';

  @override
  String get resetMessage =>
      'Wszystkie dane zostaną usunięte i wrócisz do ekranu powitalnego. Tego nie da się cofnąć!';

  @override
  String get reset => 'Resetuj';

  @override
  String get premiumSoon => 'Premium już wkrótce!';

  @override
  String get brandingSubtitle => 'Odkryj swój potencjał wzrostu';

  @override
  String get statistics => 'Statystyki';

  @override
  String get profileGroupSupport => 'Pomoc';

  @override
  String get profileGroupAccount => 'Konto';

  @override
  String get profileGroupApp => 'Aplikacja';

  @override
  String get profileGroupDanger => 'Strefa ryzyka';

  @override
  String profileMemberSince(String date) {
    return 'Od $date';
  }

  @override
  String get profileYourJourney => 'Twoja droga';

  @override
  String get profileTotalGrowth => 'Razem';

  @override
  String get currentStreak => 'Obecna seria';

  @override
  String get bestStreakLabel => 'Najlepsza seria';

  @override
  String get achievementLabel => 'Osiągnięcie';

  @override
  String get achievements => 'Osiągnięcia';

  @override
  String get achievementUnlockedTitle => '🏆 Osiągnięcie odblokowane!';

  @override
  String get reminderTapHint => 'Stuknij, aby zmienić godzinę i dni';

  @override
  String get earned => 'Zdobyte!';

  @override
  String get notEarned => 'Jeszcze nie zdobyte';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Język';

  @override
  String get languageSubtitle => 'Zmień język aplikacji';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Odkryj swój potencjał wzrostu';

  @override
  String get onboardingMeetYou => 'Poznajmy się';

  @override
  String get onboardingInfoNeeded =>
      'Do analizy potrzebujemy podstawowych danych.';

  @override
  String get gender => 'PŁEĆ';

  @override
  String get birthDateLabel => 'DATA URODZENIA';

  @override
  String get bodyMeasurements => 'Wymiary ciała';

  @override
  String get bodyInfo =>
      'Do analizy potrzebujemy twojego obecnego wzrostu i wagi.';

  @override
  String get geneticData => 'Dane genetyczne';

  @override
  String get geneticInfo =>
      'Wzrost rodziców wyznacza twój potencjał genetyczny.';

  @override
  String get pastHeights => 'Dawne pomiary';

  @override
  String get pastHeightsInfo =>
      'Wpisz wzrost, jaki pamiętasz z różnych lat. Możesz zostawić puste pola.';

  @override
  String get heightHint => 'Wpisz wzrost...';

  @override
  String get ageLabel => 'wiek';

  @override
  String get habits => 'Twoje nawyki';

  @override
  String get habitsInfo => 'Twój styl życia bezpośrednio wpływa na prognozy.';

  @override
  String get weeklyExercise => 'Ćwiczenia w tygodniu';

  @override
  String get dailySleep => 'Sen dziennie';

  @override
  String get nutritionQuality => 'JAKOŚĆ ODŻYWIANIA';

  @override
  String get nutritionDesc => 'Białko, nabiał, warzywa, owoce';

  @override
  String get nutritionBad => 'Zła';

  @override
  String get nutritionPoor => 'Słaba';

  @override
  String get nutritionMedium => 'Średnia';

  @override
  String get nutritionGood => 'Dobra';

  @override
  String get nutritionGreat => 'Świetna';

  @override
  String get startAnalysis => 'Rozpocznij analizę';

  @override
  String get continueBtn => 'Dalej';

  @override
  String get analyzeBtn => 'Analizuj';

  @override
  String get analyzing => 'Analizowanie';

  @override
  String get analysisComplete => 'Gotowe!';

  @override
  String get analysisDataReceivedTitle => 'Dane odebrane';

  @override
  String get analysisDataReceivedSubtitle => 'Zaczynamy analizę...';

  @override
  String get yourScore => 'Twój wynik BeTaller';

  @override
  String get letsStart => 'Zaczynamy';

  @override
  String get splashJourneySubtitle => 'Twoja droga się zaczyna. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Twój spersonalizowany plan jest gotowy.\nSprawdzisz swój potencjał wzrostu?';

  @override
  String get doneBtn => 'Gotowe';

  @override
  String get analysisStep1 => 'Analiza danych genetycznych...';

  @override
  String get analysisStep2 => 'Obliczanie tempa wzrostu...';

  @override
  String get analysisStep3 => 'Przetwarzanie danych o odżywianiu i śnie...';

  @override
  String get analysisStep4 => 'Tworzenie prognozy wzrostu...';

  @override
  String get analysisStep5 => 'Obliczanie wyniku BeTaller...';

  @override
  String growthPotential(String cm, String unit) {
    return '+$cm $unit potencjału wzrostu';
  }

  @override
  String get heightAt21 => 'w wieku 21 lat';

  @override
  String confidenceLevel(String pct) {
    return 'Pewność: $pct%';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'Zakres: $min - $max $unit';
  }

  @override
  String get currentLabel => 'OBECNY';

  @override
  String get predictedLabel => 'PROGNOZA';

  @override
  String get yearlyPredictions => 'Prognozy roczne';

  @override
  String get tipMorningMeasure =>
      'Mierz wzrost rano. Nacisk na krążki międzykręgowe sprawia, że w ciągu dnia twój wzrost trochę spada, więc poranny pomiar jest najdokładniejszy.';

  @override
  String get tipProteinSpread =>
      'Rozłóż białko na wszystkie posiłki. Nie jedz go naraz — dodawaj białko do każdego posiłku.';

  @override
  String get tipGrowthHormone =>
      'Hormon wzrostu osiąga szczyt podczas snu. Śpij między 22:00 a 2:00!';

  @override
  String get tipVitaminD =>
      '15 minut słońca dziennie zwiększa produkcję witaminy D. Witamina D jest niezbędna do wchłaniania wapnia.';

  @override
  String get tipBarHanging =>
      'Zwis na drążku odciąża kręgosłup. Spróbuj 3x30 sekund dziennie.';

  @override
  String get tipSwimming =>
      'Pływanie to świetny sport na całe ciało, który wspiera wzrost.';

  @override
  String get tipStress =>
      'Stres hamuje hormon wzrostu. Zmniejszaj go medytacją i jogą.';

  @override
  String get routineMorningStretch => 'Poranne rozciąganie';

  @override
  String get routineMorningStretchDesc =>
      'Zaraz po przebudzeniu rozciągaj się przez 10 minut. Rozciągnij kręgosłup i mięśnie nóg.';

  @override
  String get routineBarHanging => 'Zwis na drążku';

  @override
  String get routineBarHangingDesc =>
      'Zawiśnij na drążku, aby rozciągnąć kręgosłup. 3 serie x 30 sekund.';

  @override
  String get routineCobraStretch => 'Pozycja kobry';

  @override
  String get routineCobraStretchDesc =>
      'Połóż się na brzuchu i unieś górną część ciała. Rozciągnij kręgosłup. 3 serie x 15 sekund.';

  @override
  String get routineJumping => 'Skoki';

  @override
  String get routineJumpingDesc =>
      'Skakanka lub wyskoki z przysiadu. Pobudzają chrząstki wzrostowe. 3 serie x 20 powtórzeń.';

  @override
  String get routineSwimming => 'Pływanie lub koszykówka';

  @override
  String get routineSwimmingDesc =>
      'Uprawiaj sport, który wspiera wzrost. Co najmniej 30 minut.';

  @override
  String get routineYoga => 'Wieczorna joga i rozciąganie';

  @override
  String get routineYogaDesc =>
      'Joga i rozciąganie przed snem. Rozładuj stres, rozluźnij mięśnie.';

  @override
  String get routineProtein => 'Białko';

  @override
  String get routineProteinDesc =>
      'Jajka, kurczak, ryby, nabiał. Co najmniej 1,5 g/kg białka dziennie.';

  @override
  String get routineCalcium => 'Wapń i witamina D';

  @override
  String get routineCalciumDesc =>
      'Jedz mleko, ser, jogurt. 15 min na słońcu. Kluczowe dla rozwoju kości.';

  @override
  String get routineWater => 'Cel wody';

  @override
  String get routineWaterDesc =>
      'Pij co najmniej 2-3 litry wody dziennie. Niezbędne dla metabolizmu i wzrostu.';

  @override
  String get routineAvoidJunk => 'Unikaj fast foodów';

  @override
  String get routineAvoidJunkDesc =>
      'Trzymaj się z dala od fast foodów, słodzonych napojów i przetworzonej żywności.';

  @override
  String get routineSleep => 'Dobry sen (8-10 godz.)';

  @override
  String get routineSleepDesc =>
      'Hormon wzrostu wydziela się podczas snu. 22:00-6:00 to złote godziny.';

  @override
  String get routineNoScreen => 'Bez ekranu przed snem';

  @override
  String get routineNoScreenDesc =>
      'Odłóż telefon i komputer godzinę przed snem. Nie blokuj produkcji melatoniny.';

  @override
  String get routinePosture => 'Kontrola postawy';

  @override
  String get routinePostureDesc =>
      'Plecy proste, ramiona do tyłu. Sprawdzaj co godzinę. Dobra postawa = 2-3 cm różnicy.';

  @override
  String get routineWallStand => 'Stanie przy ścianie';

  @override
  String get routineWallStandDesc =>
      'Oprzyj się plecami o ścianę: pięty, biodra, łopatki i głowa dotykają ściany. Wytrzymaj 5 min.';

  @override
  String get routineSprintIntervals => 'Interwały sprinterskie';

  @override
  String get routineSprintIntervalsDesc =>
      'Interwały sprinterskie wywołują wyraźny wyrzut hormonu wzrostu dzięki krótkim, intensywnym zrywom.';

  @override
  String get routineHiitWorkout => 'Trening HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'Intensywny trening interwałowy, który maksymalizuje wydzielanie hormonu wzrostu.';

  @override
  String get routineSquats => 'Przysiady';

  @override
  String get routineSquatsDesc =>
      'Przysiady bez obciążenia pobudzają chrząstki wzrostowe w nogach i kręgosłupie.';

  @override
  String get routineDeadliftStretch => 'Rozciąganie w skłonie';

  @override
  String get routineDeadliftStretchDesc =>
      'Rozciąganie w pozycji martwego ciągu odciąża kręgosłup i wspiera zdrowie krążków międzykręgowych.';

  @override
  String get routineOverheadPress => 'Wyciskanie nad głowę';

  @override
  String get routineOverheadPressDesc =>
      'Wyciskanie nad głowę rozciąga kręgosłup i wzmacnia mięśnie postawy.';

  @override
  String get routineSkippingRope => 'Skakanka';

  @override
  String get routineSkippingRopeDesc =>
      'Powtarzane skoki na skakance pobudzają chrząstki wzrostowe w nogach.';

  @override
  String get routinePilatesCore => 'Pilates na core';

  @override
  String get routinePilatesCoreDesc =>
      'Ćwiczenia pilatesu na mięśnie głębokie wspierają prawidłowe ustawienie kręgosłupa i postawę.';

  @override
  String get routineInversionHang => 'Zwis głową w dół';

  @override
  String get routineInversionHangDesc =>
      'Zwis głową w dół odciąża krążki międzykręgowe i może chwilowo dodać 1-2 cm.';

  @override
  String get routineZincIntake => 'Produkty bogate w cynk';

  @override
  String get routineZincIntakeDesc =>
      'Jedz w ciągu dnia produkty bogate w cynk, który wspiera produkcję hormonu wzrostu.';

  @override
  String get routineVitaminDSunlight => 'Witamina D i słońce';

  @override
  String get routineVitaminDSunlightDesc =>
      'Spędź co najmniej 15 minut na słońcu dla syntezy witaminy D i wzrostu kości.';

  @override
  String get routineArginineFoods => 'Produkty bogate w argininę';

  @override
  String get routineArginineFoodsDesc =>
      'Jedz produkty bogate w argininę, aby pobudzić wydzielanie hormonu wzrostu.';

  @override
  String get routineDailyCalories => 'Dzienny cel kalorii';

  @override
  String get routineDailyCaloriesDesc =>
      'Osiągnij dzienny cel kalorii. Jedzenie za mało spowalnia wzrost.';

  @override
  String get routineSleepEnvironment => 'Lepsze warunki do snu';

  @override
  String get routineSleepEnvironmentDesc =>
      'Zadbaj o ciemną i chłodną sypialnię, aby wspierać wydzielanie melatoniny i hormonu wzrostu.';

  @override
  String get routinePreSleepRoutine => 'Wyciszenie przed snem';

  @override
  String get routinePreSleepRoutineDesc =>
      'Stały rytuał przed snem poprawia jakość głębokiego snu o 23%.';

  @override
  String get routineNeckStretches => 'Rozciąganie szyi';

  @override
  String get routineNeckStretchesDesc =>
      'Rozciąganie szyi zmniejsza ucisk i poprawia ustawienie odcinka szyjnego.';

  @override
  String get routineShoulderRolls => 'Krążenia i otwieranie barków';

  @override
  String get routineShoulderRollsDesc =>
      'Otwarcie barków koryguje pochyloną postawę i może optycznie dodać 1-2 cm.';

  @override
  String get achieveCommitment => 'Zaangażowanie';

  @override
  String get achieveCommitmentDesc =>
      'Wpisz wszystkie dane, poznaj całą aplikację i zacznij z niej korzystać';

  @override
  String get achieveFirstDay => 'Pierwszy krok';

  @override
  String get achieveFirstDayDesc => 'Ukończ pierwszy dzień';

  @override
  String get achieveThreeStreak => 'Seria 3 dni';

  @override
  String get achieveThreeStreakDesc => 'Wykonuj zadania 3 dni z rzędu';

  @override
  String get achieveWeekStreak => 'Seria 7 dni';

  @override
  String get achieveWeekStreakDesc => 'Wykonuj zadania 7 dni z rzędu';

  @override
  String get achieveTwoWeekStreak => 'Seria 14 dni';

  @override
  String get achieveTwoWeekStreakDesc => 'Wytrwaj 14 dni z rzędu';

  @override
  String get achieveMonthStreak => 'Seria 30 dni';

  @override
  String get achieveMonthStreakDesc => 'Zalicz 30 dni z rzędu';

  @override
  String get achieveTwoMonthStreak => 'Seria 60 dni';

  @override
  String get achieveTwoMonthStreakDesc => 'Zalicz 60 dni z rzędu';

  @override
  String get achieveHundredStreak => 'Seria 100 dni';

  @override
  String get achieveHundredStreakDesc => 'Zalicz 100 dni z rzędu';

  @override
  String get achieveFirstMeasure => 'Pierwszy pomiar';

  @override
  String get achieveFirstMeasureDesc => 'Zapisz pierwszy pomiar wzrostu';

  @override
  String get achieveThreeMeasures => 'Tropiciel';

  @override
  String get achieveThreeMeasuresDesc => 'Zapisz 3 pomiary wzrostu';

  @override
  String get achieveFiveMeasures => 'Regularne pomiary';

  @override
  String get achieveFiveMeasuresDesc => 'Zapisz 5 pomiarów wzrostu';

  @override
  String get achieveTenMeasures => 'Łowca danych';

  @override
  String get achieveTenMeasuresDesc => 'Zapisz 10 pomiarów wzrostu';

  @override
  String get achieveFirstCm => 'Pierwszy centymetr';

  @override
  String get achieveFirstCmDesc => 'Zanotuj 1 cm wzrostu łącznie';

  @override
  String get achieveThreeCm => '3 cm wzrostu';

  @override
  String get achieveThreeCmDesc => 'Zanotuj 3 cm wzrostu łącznie';

  @override
  String get achieveFiveCm => '5 cm wzrostu';

  @override
  String get achieveFiveCmDesc => 'Zanotuj 5 cm wzrostu łącznie';

  @override
  String get achieveTenCm => '10 cm wzrostu';

  @override
  String get achieveTenCmDesc => 'Zanotuj 10 cm wzrostu łącznie';

  @override
  String get quote1 => 'Każdego dnia stawaj się lepszą wersją siebie.';

  @override
  String get quote2 =>
      'Wzrost nie dzieje się w jedną noc, ale każda noc przybliża cię do celu.';

  @override
  String get quote3 => 'Wzrost wymaga cierpliwości. Działaj dalej!';

  @override
  String get quote4 => 'Krok, który robisz dziś, buduje fundament jutra.';

  @override
  String get quote5 =>
      'Dyscyplina zaczyna się tam, gdzie kończy się motywacja.';

  @override
  String get quote6 => 'Twoje ciało ci podziękuje. Działaj dalej!';

  @override
  String get quote7 => 'To ty wyznaczasz granice swojego potencjału.';

  @override
  String get quote8 => 'Małe kroki tworzą wielkie zmiany.';

  @override
  String get quote9 => 'Najlepsza inwestycja to inwestycja w siebie.';

  @override
  String get quote10 => 'Z każdym dniem jesteś bliżej celu.';

  @override
  String get quote11 => 'Zmiana jest trudna, ale żal jest trudniejszy.';

  @override
  String get quote12 => 'Twoje ciało to świątynia. Dbaj o nie.';

  @override
  String get quote13 => 'Twój rywal to ty z wczoraj. Pokonaj go dziś!';

  @override
  String get quote14 => 'BeTaller = cierpliwość + dyscyplina + wiara';

  @override
  String get quote15 => 'Uwierz w siebie, proces cię ukształtuje.';

  @override
  String get quote16 => 'Nie mów dziś „nie dam rady”, by jutro nie żałować.';

  @override
  String get quote17 => 'Rób postęp każdego dnia, nawet jeśli to tylko 1%.';

  @override
  String get quote18 => 'Lustro pokaże twoje postępy. Daj sobie czas.';

  @override
  String get bmiNormal => 'Norma';

  @override
  String get bmiUnderweight => 'Niedowaga';

  @override
  String get bmiOverweight => 'Nadwaga';

  @override
  String get bmiObese => 'Otyłość';

  @override
  String get velocityExcellent => 'Świetne';

  @override
  String get velocityNormal => 'Normalne';

  @override
  String get velocitySlow => 'Wolne';

  @override
  String get velocityVeryLow => 'Bardzo niskie';

  @override
  String durationMinutes(String min) {
    return '$min min';
  }

  @override
  String get durationAllDay => 'Cały dzień';

  @override
  String get durationNight => 'Noc';

  @override
  String durationHours(String hours) {
    return '$hours godz.';
  }

  @override
  String get onboardingStep1 => 'Wpisz swoje dane';

  @override
  String get onboardingStep2 => 'Podaj dawne pomiary wzrostu';

  @override
  String get onboardingStep3 => 'Oceń swoje nawyki';

  @override
  String get onboardingStep4 => 'Zobacz prognozę i wynik';

  @override
  String get hoursShort => 'h';

  @override
  String get selectLanguage => 'Wybierz język';

  @override
  String get systemLanguage => 'Język systemu';

  @override
  String get emailSubject => 'BeTaller – opinia';

  @override
  String get pastHeightsTip =>
      'Możesz pominąć lata, których nie pamiętasz. Wystarczą 1-2 dawne pomiary.';

  @override
  String get obPastHeightsTitle => 'Dawne pomiary';

  @override
  String get obPastHeightsSubPart1 =>
      'Dawne pomiary wzrostu sprawiają, że prognoza jest dokładniejsza.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'Twój wzrost w wieku $age lat?';
  }

  @override
  String get obSkip => 'Pomiń';

  @override
  String get obNext => 'Dalej';

  @override
  String get obSkipAll => 'Pomiń wszystko';

  @override
  String get currentSuffix => '(obecnie)';

  @override
  String personalizedProtein(String amount) {
    return 'Jajka, kurczak, ryby, nabiał. Jedz co najmniej $amount g białka dziennie.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Pij co najmniej $amount L wody dziennie. Niezbędne dla metabolizmu i wzrostu.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'Hormon wzrostu wydziela się podczas snu. Śpij co najmniej $hours godz. 22:00-6:00 to złote godziny.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Jedz mleko, ser, jogurt. 15 min słońca. Dzienny cel kalorii: $calories kcal.';
  }

  @override
  String get scoreS => 'Świetnie! Zbliżasz się do szczytu swojego potencjału.';

  @override
  String get scoreA =>
      'Idzie ci świetnie! Drobne poprawki mogą zaprowadzić cię na szczyt.';

  @override
  String get scoreB =>
      'Dobry kierunek. Skup się trochę bardziej na zadaniach i odżywianiu.';

  @override
  String get scoreC => 'Jest co poprawiać. Regularne zadania zrobią różnicę.';

  @override
  String get scoreD => 'Duży potencjał, ale czas zacząć działać.';

  @override
  String get scoreF =>
      'Zacznij teraz! Mały krok każdego dnia robi dużą różnicę.';

  @override
  String get cmPerYear => 'cm/rok';

  @override
  String get howToDoIt => 'Jak to zrobić';

  @override
  String get musclesTargeted => 'Mięśnie i kości';

  @override
  String get scientificBasis => 'Podstawy naukowe';

  @override
  String setXofY(String current, String total) {
    return 'Seria $current z $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Przerwa przed serią $set';
  }

  @override
  String get allSetsComplete => 'Wszystkie serie zrobione!';

  @override
  String get setTimer => 'Minutnik serii';

  @override
  String get setTracker => 'Licznik serii';

  @override
  String get builtInTimer => 'Wbudowany minutnik';

  @override
  String get markComplete => 'Oznacz jako zrobione';

  @override
  String get markIncomplete => 'Cofnij oznaczenie';

  @override
  String get done => 'Gotowe';

  @override
  String get doneExclamation => 'Gotowe!';

  @override
  String get start => 'Start';

  @override
  String get pause => 'Pauza';

  @override
  String get resetTimer => 'Resetuj';

  @override
  String get skipRest => 'Pomiń przerwę';

  @override
  String get restart => 'Od nowa';

  @override
  String get perSet => 'na serię';

  @override
  String get rest => 'PRZERWA';

  @override
  String get reps => 'powt.';

  @override
  String get difficultyBeginner => 'Początkujący';

  @override
  String get difficultyIntermediate => 'Średni';

  @override
  String get difficultyAdvanced => 'Zaawansowany';

  @override
  String get learnTitle => 'Wiedza';

  @override
  String get learnSubtitle => 'Wiedza o wzroście oparta na nauce';

  @override
  String get categoryAll => 'Wszystko';

  @override
  String get categoryScience => 'Nauka';

  @override
  String get categoryNutrition => 'Odżywianie';

  @override
  String get categoryExercise => 'Ćwiczenia';

  @override
  String get categorySleep => 'Sen';

  @override
  String get categoryMyths => 'Mity';

  @override
  String get scientificReferences => 'Źródła naukowe';

  @override
  String get relatedRoutines => 'Powiązane zadania';

  @override
  String get nutritionTitle => 'Odżywianie';

  @override
  String get sectionMealPlan => 'Plan posiłków';

  @override
  String get sectionNutrients => 'Składniki';

  @override
  String get sectionFoods => 'Produkty';

  @override
  String get sectionSupplements => 'Suplementy';

  @override
  String todaysPlan(String day) {
    return 'Plan na dziś — $day';
  }

  @override
  String get breakfast => 'Śniadanie';

  @override
  String get lunch => 'Obiad';

  @override
  String get dinner => 'Kolacja';

  @override
  String get snacks => 'Przekąski';

  @override
  String get searchFoods => 'Szukaj produktów...';

  @override
  String nFoods(String count) {
    return 'Produkty: $count';
  }

  @override
  String dailyLabel(String amount) {
    return 'Dziennie: $amount';
  }

  @override
  String get dailyNeedByAge => 'DZIENNE POTRZEBY WG WIEKU';

  @override
  String agePrefix(String range) {
    return 'Wiek $range';
  }

  @override
  String get topFoodSources => 'NAJLEPSZE ŹRÓDŁA';

  @override
  String get categoryDairy => 'Nabiał';

  @override
  String get categoryMeatFish => 'Mięso i ryby';

  @override
  String get categoryVegetables => 'Warzywa';

  @override
  String get categoryFruits => 'Owoce';

  @override
  String get categoryGrains => 'Zboża i strączki';

  @override
  String get categoryNutsSeeds => 'Orzechy i nasiona';

  @override
  String get weeklyReportTitle => 'Raport tygodniowy';

  @override
  String get weeklyScoreLabel => 'Wynik tygodnia';

  @override
  String get weeklyDailyCompletion => 'Dzień po dniu';

  @override
  String get weeklyHabits => 'Nawyki';

  @override
  String get overview => 'Przegląd';

  @override
  String get routinesLabel => 'Zadania';

  @override
  String get streakLabel => 'Seria';

  @override
  String get heightLabel => 'Wzrost';

  @override
  String get weightLabel => 'Waga';

  @override
  String get dadLabel => 'Tata';

  @override
  String get motherLabel => 'Mama';

  @override
  String get metricShort => 'Metryczne';

  @override
  String get imperialShort => 'Imperialne';

  @override
  String get dailyScores => 'Wyniki dnia';

  @override
  String get waterToday2 => 'Woda dziś';

  @override
  String get sleepToday => 'Sen dziś';

  @override
  String get routineCompletion => 'Wykonanie zadań';

  @override
  String get xpAndLevel => 'XP i poziom';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP do następnego poziomu';
  }

  @override
  String get activeChallenges => 'Aktywne wyzwania';

  @override
  String nOfMCompleted(String n, String m) {
    return 'Zrobione: $n/$m';
  }

  @override
  String get shareYourProgress => 'Udostępnij postępy';

  @override
  String get shareComingSoon => 'Udostępnianie już wkrótce!';

  @override
  String get premiumTest => 'Premium (test)';

  @override
  String get premiumActive => 'Aktywne';

  @override
  String get premiumFree => 'Darmowe';

  @override
  String get weeklyReportMenu => 'Raport tygodniowy';

  @override
  String get weeklyReportMenuSubtitle => 'Podsumowanie postępów';

  @override
  String get unlockGrowthPotential => 'Odblokuj pełny potencjał wzrostu';

  @override
  String get featureGrowthAnalysis => 'Analiza wzrostu i wynik';

  @override
  String get featureHeightPrediction => 'Prognoza wzrostu';

  @override
  String get featureAllRoutines => 'Wszystkie 14 codziennych zadań';

  @override
  String get featureWaterSleep => 'Śledzenie wody i snu';

  @override
  String get featureProgress => 'Postępy i pomiary';

  @override
  String get featureAchievements => 'Osiągnięcia i serie';

  @override
  String get planMonthly => 'Miesięczny';

  @override
  String get planYearly => 'Roczny';

  @override
  String get bestValue => 'NAJLEPSZA OFERTA';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'POZ. $level';
  }

  @override
  String get levelBeginner => 'Nowicjusz';

  @override
  String get levelStarter => 'Debiutant';

  @override
  String get levelCommitted => 'Zaangażowany';

  @override
  String get levelDedicated => 'Oddany';

  @override
  String get levelConsistent => 'Konsekwentny';

  @override
  String get levelFocused => 'Skupiony';

  @override
  String get levelDetermined => 'Zdeterminowany';

  @override
  String get levelDisciplined => 'Zdyscyplinowany';

  @override
  String get levelStrong => 'Silny';

  @override
  String get levelAdvanced => 'Zaawansowany';

  @override
  String get levelExpert => 'Ekspert';

  @override
  String get levelMaster => 'Mistrz';

  @override
  String get levelElite => 'Elita';

  @override
  String get levelChampion => 'Czempion';

  @override
  String get levelLegend => 'Legenda';

  @override
  String get levelTitan => 'Tytan';

  @override
  String get levelMythic => 'Mityczny';

  @override
  String get levelImmortal => 'Nieśmiertelny';

  @override
  String get levelTranscendent => 'Ponadczasowy';

  @override
  String get levelUltimate => 'Absolutny';

  @override
  String get challengeCompleteAllRoutines => 'Wszystkie zadania';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Zrób dziś wszystkie zadania';

  @override
  String get challengeHydrationHero => 'Nawodnienie na medal';

  @override
  String get challengeHydrationHeroDesc => 'Osiągnij dzienny cel wody';

  @override
  String get challengeEarlySleeper => 'Wczesny sen';

  @override
  String get challengeEarlySleeperDesc => 'Zapisz co najmniej 8 godz. snu';

  @override
  String get challengeExerciseTrio => 'Trzy ćwiczenia';

  @override
  String get challengeExerciseTrioDesc => 'Zrób 3 ćwiczenia z planu';

  @override
  String get challengeMorningStretch => 'Poranne rozciąganie';

  @override
  String get challengeMorningStretchDesc => 'Rozciągnij się rano przed 9:00';

  @override
  String get challenge7DayWarrior => 'Tydzień wojownika';

  @override
  String get challenge7DayWarriorDesc =>
      'Rób wszystkie zadania przez 7 dni z rzędu';

  @override
  String get challengeGrowthTracker => 'Kontrola wzrostu';

  @override
  String get challengeGrowthTrackerDesc =>
      'Zapisz pomiar wzrostu w tym tygodniu';

  @override
  String get challengeHydrationWeek => 'Tydzień nawodnienia';

  @override
  String get challengeHydrationWeekDesc =>
      'Osiągnij cel wody 5 dni w tym tygodniu';

  @override
  String get challengeFitnessChampion => 'Mistrzostwo fitness';

  @override
  String get challengeFitnessChampionDesc => 'Zrób 15 ćwiczeń w tym tygodniu';

  @override
  String get challengeSleepMaster => 'Mistrzostwo snu';

  @override
  String get challengeSleepMasterDesc => 'Zapisz 8+ godz. snu przez 5 dni';

  @override
  String get performanceDashboard => 'PANEL WYNIKÓW';

  @override
  String get tierA => 'KLASA A';

  @override
  String get tierB => 'KLASA B';

  @override
  String get tierC => 'KLASA C';

  @override
  String get tierD => 'KLASA D';

  @override
  String get tierE => 'KLASA E';

  @override
  String get maxTierReached => 'NAJWYŻSZA KLASA';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Następna klasa: $tier · brakuje +$pts pkt';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Zarządzaj zadaniami';

  @override
  String get manageRoutinesSubtitle => 'Pokaż lub ukryj zadania na liście dnia';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return 'Aktywne: $visible z $total';
  }

  @override
  String get showAll => 'Pokaż wszystkie';

  @override
  String get hideAll => 'Ukryj wszystkie';

  @override
  String get heightAnalysis => 'Analiza wzrostu';

  @override
  String get heightVsPopulation => 'Twoje miejsce na siatce centylowej CDC';

  @override
  String get globalAveragesTable => 'Średni wzrost wg wieku (CDC)';

  @override
  String get standingTall => 'Wyróżniasz się';

  @override
  String get standingAboveAverage => 'Powyżej średniej';

  @override
  String get standingBelowAverage => 'Poniżej średniej';

  @override
  String get standingShort => 'Niżej niż rówieśnicy';

  @override
  String get yourHeightStanding => 'TWOJA POZYCJA';

  @override
  String get bellCurveCaption => 'Rozkład wzrostu w twoim wieku';

  @override
  String get bellShorterThanYou => 'niższych od ciebie';

  @override
  String get yourHeight => 'Ty';

  @override
  String peerAvg(int age) {
    return 'Śr. $age lat';
  }

  @override
  String get aboveAvg => 'Ponad śr.';

  @override
  String get belowAvg => 'Poniżej śr.';

  @override
  String get whoDataSource => 'Siatki centylowe CDC (USA)';

  @override
  String get percentileShort5 => '5.';

  @override
  String get percentileShort50 => '50.';

  @override
  String get percentileShort95 => '95.';

  @override
  String get youLabel => 'Ty';

  @override
  String get avgHeightLabel => 'ŚR.';

  @override
  String get percentileLabel => 'CENT.';

  @override
  String get diffLabel => 'RÓŻN.';

  @override
  String get whoSourceNote =>
      'Źródło danych: siatki centylowe US CDC 2000 (wzrost wg wieku, od 2 do 20 lat). Centyle porównują cię z populacją USA i mogą się różnić w zależności od kraju.';

  @override
  String get quickPhotos => 'Zdjęcia';

  @override
  String get quickPosture => 'Postawa';

  @override
  String get quickWellness => 'Samopoczucie';

  @override
  String get quickRecipes => 'Przepisy';

  @override
  String get wellnessTitle => 'Samopoczucie';

  @override
  String get wellnessHeader => 'SAMOPOCZUCIE';

  @override
  String get wellnessSubtitle => 'Śledź czynniki wpływające na wzrost';

  @override
  String get caffeineToday => 'Kofeina dziś';

  @override
  String get withinLimits => 'W zdrowych granicach';

  @override
  String get approachingLimit => 'Blisko limitu';

  @override
  String get overLimit => 'Ponad limit, wpływa na HGH';

  @override
  String get resetToday => 'Resetuj dzień';

  @override
  String get stressToday => 'Stres dziś';

  @override
  String get stressVeryCalmLabel => 'Pełny spokój, idealnie dla wzrostu';

  @override
  String get stressCalmLabel => 'Spokój';

  @override
  String get stressNeutralLabel => 'Neutralnie';

  @override
  String get stressStressedLabel => 'Stres';

  @override
  String get stressVeryStressedLabel => 'Silny stres, kortyzol blokuje HGH';

  @override
  String get stressTapToLog => 'Stuknij, by zapisać, jak się dziś czujesz';

  @override
  String get todaysJournal => 'Dziennik dnia';

  @override
  String get journalNoNote => '(brak notatki)';

  @override
  String get journalEdit => 'Edytuj';

  @override
  String get journalHowWasToday => 'Jak minął dzień?';

  @override
  String get journalSaved => 'Dziennik zapisany · +5 XP';

  @override
  String get journalSaveEntry => 'Zapisz wpis';

  @override
  String get weeklyInsight => 'Wnioski tygodnia';

  @override
  String get weeklyInsightCaffeine => 'KOFEINA';

  @override
  String get weeklyInsightStress => 'STRES';

  @override
  String get weeklyInsightMood => 'NASTRÓJ';

  @override
  String get wellnessInfoTitle => 'Dlaczego to ważne';

  @override
  String get wellnessInfoBody =>
      'Kofeina zaburza głęboki sen, a to właśnie wtedy wydziela się najwięcej hormonu wzrostu (HGH). Przewlekły stres podnosi poziom kortyzolu, który bezpośrednio hamuje HGH. Dziennik pomaga trzymać się nawyków wspierających wzrost.';

  @override
  String get wellnessInfoGotIt => 'Rozumiem';

  @override
  String get insightCaffeineHigh =>
      'W tym tygodniu kofeiny jest dużo. Ogranicz ją dla lepszego snu i HGH.';

  @override
  String get insightStressHigh =>
      'W tym tygodniu stres jest podwyższony. Spróbuj ćwiczeń oddechowych: kortyzol blokuje wzrost.';

  @override
  String get insightMoodLow =>
      'Ostatnio nastrój jest słabszy. Pomagają słońce, sen i lekki ruch.';

  @override
  String get insightGreat =>
      'Świetna równowaga w tym tygodniu. Twoje samopoczucie wspiera wzrost.';

  @override
  String get insightDefault =>
      'Twoje samopoczucie jest w normie. Zapisuj dalej, by zobaczyć więcej wniosków.';

  @override
  String get insightNeedMoreData =>
      'Zapisuj jeszcze przez kilka dni, by zobaczyć wnioski.';

  @override
  String get progressPhotosTitle => 'Zdjęcia postępów';

  @override
  String get progressPhotosHeader => 'ZDJĘCIA POSTĘPÓW';

  @override
  String get progressPhotosSubtitle => 'Śledź swoją przemianę';

  @override
  String get addProgressPhoto => 'Dodaj zdjęcie';

  @override
  String get captureJourney => 'Uwiecznij swoją przemianę';

  @override
  String get takePhoto => 'Zrób zdjęcie';

  @override
  String get chooseFromLibrary => 'Wybierz z galerii';

  @override
  String get deletePhotoTitle => 'Usunąć zdjęcie?';

  @override
  String get deletePhotoBody => 'To zdjęcie zniknie z osi czasu postępów.';

  @override
  String get timelineTab => 'Oś czasu';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'zdjęcia',
      many: 'zdjęć',
      few: 'zdjęcia',
      one: 'zdjęcie',
    );
    return '$_temp0';
  }

  @override
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit w $days dni';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'dnia',
      many: 'dni',
      few: 'dni',
      one: 'dzień',
    );
    return '$_temp0';
  }

  @override
  String cmGained(String unit) {
    return '$unit przyrostu';
  }

  @override
  String get firstPhotoMessage =>
      'Zrób pierwsze zdjęcie, aby śledzić wizualne postępy.';

  @override
  String get takeFirstPhoto => 'Zrób pierwsze zdjęcie';

  @override
  String get beforeAfter => 'PRZED / PO';

  @override
  String get beforeLabel => 'PRZED';

  @override
  String get afterLabel => 'PO';

  @override
  String get yourHeightDialog => 'Twój wzrost';

  @override
  String get heightDialogMessage => 'Wpisz obecny wzrost dla tego zdjęcia';

  @override
  String get postureAnalysisTitle => 'Analiza postawy';

  @override
  String get postureCoachHeader => 'TRENER POSTAWY';

  @override
  String get postureCoachSubtitle => 'Samoocena na zdjęciu z boku';

  @override
  String get latestScore => 'OSTATNI WYNIK';

  @override
  String get latestAnalysis => 'OSTATNIA ANALIZA';

  @override
  String get headPosition => 'Pozycja głowy';

  @override
  String get progressLabel => 'POSTĘPY';

  @override
  String get choosePhotoSource => 'Wybierz źródło zdjęcia';

  @override
  String get sideProfileHint => 'Z profilu, cała sylwetka w kadrze';

  @override
  String get howToTakePhoto => 'JAK ZROBIĆ ZDJĘCIE';

  @override
  String get takePosturePhoto => 'Zrób zdjęcie postawy';

  @override
  String get postureExcellent => 'Świetna';

  @override
  String get postureGood => 'Dobra';

  @override
  String get postureNeedsWork => 'Do poprawy';

  @override
  String get posturePoor => 'Słaba';

  @override
  String get recommendedExercises => 'ZALECANE ĆWICZENIA';

  @override
  String get postureWallStand => 'Przy ścianie';

  @override
  String get postureWallStandDesc =>
      'Stój plecami przy ścianie 2 minuty dziennie.';

  @override
  String get postureChestOpener => 'Otwarcie klatki';

  @override
  String get postureChestOpenerDesc =>
      'Rozluźnia napięte mięśnie piersiowe, które ciągną barki do przodu.';

  @override
  String get postureChinTucks => 'Cofanie brody';

  @override
  String get postureChinTucksDesc =>
      'Koryguje wysuniętą głowę — 3×10 powtórzeń.';

  @override
  String get postureDeadbug => 'Martwy robak';

  @override
  String get postureDeadbugDesc =>
      'Wzmacnia mięśnie głębokie i pomaga kontrolować lordozę.';

  @override
  String get recipesTitle => 'Przepisy';

  @override
  String get recipesHeader => 'PRZEPISY';

  @override
  String get recipesSubtitle => 'Paliwo dla wzrostu';

  @override
  String get recipesCategoryAll => 'Wszystkie';

  @override
  String get recipesCategoryBreakfast => 'Śniadanie';

  @override
  String get recipesCategoryLunch => 'Obiad';

  @override
  String get recipesCategoryDinner => 'Kolacja';

  @override
  String get recipesCategorySnack => 'Przekąska';

  @override
  String get recipesGoalAll => 'Wszystkie';

  @override
  String get recipeDiffEasy => 'Łatwy';

  @override
  String get recipeDiffMedium => 'Średni';

  @override
  String get recipeDiffHard => 'Trudny';

  @override
  String get recipesFilterType => 'RODZAJ';

  @override
  String get recipesFilterNutrient => 'BOGATE W';

  @override
  String get recipesGoalVitaminD => 'Witamina D';

  @override
  String get recipesGoalZinc => 'Cynk';

  @override
  String get recipesGoalMagnesium => 'Magnez';

  @override
  String recipesCountLabel(int count) {
    return 'Przepisy: $count';
  }

  @override
  String get recipeIngredients => 'Składniki';

  @override
  String get recipeSteps => 'Przygotowanie';

  @override
  String get recipesGoalProtein => 'Dużo białka';

  @override
  String get recipesGoalCalcium => 'Wapń';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'Żelazo';

  @override
  String get recipesNoMatch => 'Brak przepisów dla tych filtrów';

  @override
  String get recipesIngredients => 'Składniki';

  @override
  String get recipesInstructions => 'Przygotowanie';

  @override
  String get recipesClose => 'ZAMKNIJ';

  @override
  String get recipesAboutTitle => 'O przepisach';

  @override
  String get recipesAboutBody =>
      'Wybrane przepisy, które dodają energii do wzrostu. Filtruj według rodzaju posiłku lub celu odżywczego, by znaleźć coś idealnego do swojego planu.';

  @override
  String get animHintSpinalDecomp => 'Odciążenie kręgosłupa';

  @override
  String get animHintGravityReversal => 'Odwrócenie grawitacji';

  @override
  String get animHintImpactBones => 'Obciążenie udarowe kości';

  @override
  String get animHintHighImpact => 'Mocne obciążenie kości';

  @override
  String get animHintMetabolicBurst => 'Trening metaboliczny';

  @override
  String get animHintFullBodyStretch => 'Rozciąganie na pobudkę';

  @override
  String get animHintSpinalExtension => 'Wyprost kręgosłupa';

  @override
  String get animHintCervicalDecomp => 'Odciążenie odcinka szyjnego';

  @override
  String get animHintShoulderMobility => 'Mobilność barków';

  @override
  String get animHintFullBodyMotion => 'Ruch całego ciała';

  @override
  String get animHintPosteriorChain => 'Rozciąganie tylnej taśmy';

  @override
  String get animHintMuscleGrowth => 'Paliwo dla mięśni';

  @override
  String get animHintBoneDensity => 'Wsparcie gęstości kości';

  @override
  String get animHintSpinalDisc => 'Nawodnienie krążków';

  @override
  String get animHintCleanNutrition => 'Czyste odżywianie';

  @override
  String get animHintIgf1 => 'Wsparcie IGF-1';

  @override
  String get animHintHghAmino => 'Aminokwas dla HGH';

  @override
  String get animHintCalciumAbsorption => 'Wchłanianie wapnia';

  @override
  String get animHintSpinalAlignment => 'Ustawienie kręgosłupa';

  @override
  String get animHintPostureCorrection => 'Korekta postawy';

  @override
  String get animHintMindBody => 'Równowaga ciała i umysłu';

  @override
  String get animHintCoreStability => 'Stabilność korpusu';

  @override
  String get animHintLegPower => 'Siła nóg i wyrzut HGH';

  @override
  String get animHintVerticalPower => 'Moc wyskoku';

  @override
  String get animHintHghSurge => 'Trening na wyrzut HGH';

  @override
  String get animHintPeakHgh => 'Okno szczytu HGH';

  @override
  String get animHintMelatonin => 'Wsparcie melatoniny';

  @override
  String get animHintDeepSleep => 'Przygotowanie do snu';

  @override
  String get animHintSleepOpt => 'Lepszy sen';

  @override
  String get animHintExercise => 'Ćwiczenie';

  @override
  String get formMorningStretch =>
      'Zacznij od krążeń szyi, potem przejdź do rozciągania całego ciała. Utrzymaj każdą pozycję 20-30 sekund, bez sprężynowania.';

  @override
  String get formBarHanging =>
      'Chwyć drążek na szerokość barków, rozluźnij całe ciało i pozwól grawitacji rozciągnąć kręgosłup. Nie bujaj się.';

  @override
  String get formCobraStretch =>
      'Połóż się na brzuchu, dłonie pod barkami. Powoli unieś górną część ciała, biodra zostają na podłodze. Patrz w górę.';

  @override
  String get formJumping =>
      'Rób wyskoki z przysiadu lub skacz na skakance. Ląduj miękko na przodostopiu. Odpoczywaj 30 sekund między seriami.';

  @override
  String get formSwimmingBasketball =>
      'Wybierz pływanie (kraul/grzbiet) lub koszykówkę. Skup się na skokach, sięganiu i pełnym zakresie ruchu.';

  @override
  String get formEveningYoga =>
      'Wykonuj łagodne pozycje: koci grzbiet, pozycja dziecka, pies z głową w dół, skłon w przód. Oddychaj głęboko i utrzymuj każdą pozycję 30-60 sekund.';

  @override
  String get formSprintIntervals =>
      'Rozgrzewaj się 5 minut, potem sprintuj z maksymalnym wysiłkiem przez 30 sekund. Idź lub truchtaj 90 sekund, by odpocząć. Powtarzaj.';

  @override
  String get formHiitWorkout =>
      'Wykonuj ćwiczenia, takie jak burpees, wspinaczka i wyskoki z przysiadu, z maksymalną intensywnością przez 45 sekund, potem 15 sekund przerwy.';

  @override
  String get formSquats =>
      'Stań ze stopami na szerokość barków. Opuszczaj ciało, aż uda będą równoległe do podłogi. Plecy proste, kolana nie wychodzą przed palce.';

  @override
  String get formDeadliftStretch =>
      'Stań ze stopami na szerokość bioder, pochyl się w biodrach z prostymi plecami. Sięgnij do palców stóp i poczuj rozciąganie z tyłu ud i w plecach.';

  @override
  String get formOverheadPress =>
      'Stań prosto i wypchnij ręce nad głowę do pełnego wyprostu. Użyj lekkich ciężarów lub własnego ciała. Napnij brzuch i nie wyginaj pleców.';

  @override
  String get formSkippingRope =>
      'Skacz obunóż, lądując miękko na przodostopiu. Skoki niskie i równe. Odpoczywaj między seriami.';

  @override
  String get formPilatesCore =>
      'Wykonuj deskę, martwego robaka, bird dog, mostek i unoszenie nóg. Skup się na kontroli ruchu i oddechu.';

  @override
  String get formInversionHang =>
      'Użyj stołu inwersyjnego lub butów grawitacyjnych. Zacznij od lekkiego nachylenia i stopniowo je zwiększaj. Sesje mają być krótkie.';

  @override
  String get formProtein =>
      'Rozłóż białko na 3-4 posiłki. Jedz jajka, kurczaka, ryby, nabiał i rośliny strączkowe.';

  @override
  String get formCalciumVitaminD =>
      'Jedz 3 porcje nabiału dziennie i spędzaj 15 minut na słońcu, by naturalnie wytwarzać witaminę D.';

  @override
  String get formWater =>
      'Pij wodę regularnie przez cały dzień. Noś ze sobą butelkę i ustaw przypomnienia co godzinę.';

  @override
  String get formAvoidJunk =>
      'Zamień fast food na nieprzetworzone jedzenie, a słodkie napoje na wodę. Czytaj etykiety i unikaj przetworzonych składników.';

  @override
  String get formZincIntake =>
      'Jedz czerwone mięso, pestki dyni, ciecierzycę, nerkowce i ostrygi. Celuj w 8-11 mg dziennie.';

  @override
  String get formVitaminDSunlight =>
      'Wystaw ręce i twarz na bezpośrednie słońce na 15 minut, najlepiej przed południem. Przy tak krótkim czasie filtr nie jest potrzebny.';

  @override
  String get formArginineFoods =>
      'Dodawaj do posiłków orzechy, nasiona, indyka, kurczaka, soję i nabiał. Najlepiej przed snem.';

  @override
  String get formDailyCalories =>
      'Rozłóż kalorie na 3-5 posiłków i nie pomijaj śniadania. Wybieraj pełnowartościowe jedzenie zamiast pustych kalorii.';

  @override
  String get formQualitySleep =>
      'Kładź się spać do 22:00. Pokój ma być ciemny i chłodny. Unikaj kofeiny po 14:00.';

  @override
  String get formNoScreen =>
      'Ustaw alarm na godzinę przed snem. Odłóż wszystkie ekrany. Zamiast tego poczytaj książkę lub delikatnie się porozciągaj.';

  @override
  String get formSleepEnvironment =>
      'Używaj zasłon zaciemniających, utrzymuj w pokoju 18-20°C, usuń wszystkie źródła światła. Zadbaj o wygodny materac i poduszkę.';

  @override
  String get formPreSleepRoutine =>
      'Zacznij 30 minut przed snem: przygaś światło, poczytaj książkę, zrób ćwiczenia oddechowe, unikaj pobudzających zajęć.';

  @override
  String get formPostureCheck =>
      'Stań prosto, barki do tyłu i w dół. Lekko napnij brzuch. Wyobraź sobie nitkę, która ciągnie cię w górę za czubek głowy.';

  @override
  String get formWallStand =>
      'Stań tak, by pięty, pośladki, łopatki i głowa dotykały ściany. Wytrzymaj 5 minut. Oddychaj normalnie.';

  @override
  String get formNeckStretches =>
      'Powoli przechylaj głowę na boki, do przodu i do tyłu. Utrzymaj każdy kierunek 30 sekund. Nie forsuj rozciągania.';

  @override
  String get formShoulderRolls =>
      'Wykonaj 15 krążeń barków do przodu, potem 15 do tyłu. Następnie rozciągnij klatkę piersiową, utrzymując pozycję 20 sekund.';

  @override
  String get sciMorningStretch =>
      'Poranne rozciąganie odciąża krążki międzykręgowe, które nawodniły się w nocy, pomagając zachować wzrost';

  @override
  String get sciBarHanging =>
      'Zwis odciąża krążki międzykręgowe, wykorzystując grawitację do rozciągnięcia kręgosłupa, co może chwilowo dodać wzrostu';

  @override
  String get sciCobraStretch =>
      'Pozycja kobry wydłuża kręgosłup i otwiera klatkę piersiową, przeciwdziałając uciskowi od siedzenia';

  @override
  String get sciJumping =>
      'Intensywne skoki pobudzają chrząstki wzrostowe w nogach i wywołują wydzielanie hormonu wzrostu';

  @override
  String get sciSwimmingBasketball =>
      'Pływanie i koszykówka to rozciąganie całego ciała, skoki i sięganie, które pobudzają chrząstki wzrostowe';

  @override
  String get sciEveningYoga =>
      'Wieczorna joga obniża kortyzol, który hamuje hormon wzrostu, i rozciąga mięśnie przed nocną regeneracją';

  @override
  String get sciSprintIntervals =>
      'Sprinty wywołują wyraźny wyrzut hormonu wzrostu';

  @override
  String get sciHiitWorkout => 'Intensywny wysiłek zwiększa HGH nawet o 450%';

  @override
  String get sciSquats =>
      'Przysiady pobudzają chrząstki wzrostowe w nogach i kręgosłupie';

  @override
  String get sciDeadliftStretch =>
      'Odciążenie kręgosłupa wspiera zdrowie krążków międzykręgowych';

  @override
  String get sciOverheadPress =>
      'Wyciskanie nad głowę rozciąga kręgosłup i wzmacnia mięśnie postawy';

  @override
  String get sciSkippingRope =>
      'Powtarzane skoki pobudzają chrząstki wzrostowe w nogach';

  @override
  String get sciPilatesCore =>
      'Silny korpus wspiera prawidłowe ustawienie kręgosłupa i postawę';

  @override
  String get sciInversionHang =>
      'Zwis głową w dół odciąża krążki międzykręgowe i może chwilowo dodać 1-2 cm';

  @override
  String get sciProtein =>
      'Białko dostarcza aminokwasów niezbędnych do wzrostu kości i mięśni, zwłaszcza w okresie skoków wzrostu';

  @override
  String get sciCalciumVitaminD =>
      'Wapń i witamina D to główne budulce gęstości kości i ich wzrostu na długość';

  @override
  String get sciWater =>
      'Nawodnienie jest niezbędne do transportu składników odżywczych do chrząstek wzrostowych i dla zdrowia chrząstki stawowej';

  @override
  String get sciAvoidJunk =>
      'Przetworzona żywność i cukier wywołują stany zapalne i skoki insuliny, które hamują wydzielanie hormonu wzrostu';

  @override
  String get sciZincIntake =>
      'Cynk jest niezbędny do produkcji hormonu wzrostu';

  @override
  String get sciVitaminDSunlight =>
      'Witamina D jest kluczowa dla wchłaniania wapnia i wzrostu kości';

  @override
  String get sciArginineFoods =>
      'L-arginina pobudza wydzielanie hormonu wzrostu';

  @override
  String get sciDailyCalories =>
      'Długotrwały niedobór kalorii obniża IGF-1 i osłabia wyrzuty hormonu wzrostu, bezpośrednio spowalniając wzrost w okresie dojrzewania';

  @override
  String get sciQualitySleep =>
      '70-80% dziennej puli hormonu wzrostu wydziela się w fazie głębokiego snu, zwłaszcza między 22:00 a 2:00';

  @override
  String get sciNoScreen =>
      'Niebieskie światło ekranów hamuje produkcję melatoniny, opóźnia zasypianie i pogarsza jakość głębokiego snu';

  @override
  String get sciSleepEnvironment =>
      'Ciemność i chłód wspierają wydzielanie melatoniny i hormonu wzrostu';

  @override
  String get sciPreSleepRoutine =>
      'Stały rytuał przed snem poprawia jakość głębokiego snu o 23%';

  @override
  String get sciPostureCheck =>
      'Prawidłowa postawa może od razu dodać 2-3 cm widocznego wzrostu i zapobiega uciskowi kręgosłupa';

  @override
  String get sciWallStand =>
      'Stanie przy ścianie uczy mięśnie właściwej postawy i pomaga utrzymać prawidłowe ustawienie kręgosłupa przez cały dzień';

  @override
  String get sciNeckStretches =>
      'Rozciąganie szyi zmniejsza ucisk i poprawia ustawienie odcinka szyjnego';

  @override
  String get sciShoulderRolls =>
      'Otwarcie barków koryguje pochyloną postawę i może optycznie dodać 1-2 cm';

  @override
  String get muscleSpine => 'Kręgosłup';

  @override
  String get muscleLegs => 'Nogi';

  @override
  String get muscleBack => 'Plecy';

  @override
  String get muscleShoulders => 'Barki';

  @override
  String get muscleArms => 'Ręce';

  @override
  String get muscleCore => 'Korpus';

  @override
  String get muscleChest => 'Klatka';

  @override
  String get muscleCalves => 'Łydki';

  @override
  String get muscleFullBody => 'Całe ciało';

  @override
  String get muscleHips => 'Biodra';

  @override
  String get muscleBones => 'Kości';

  @override
  String get muscleMuscles => 'Mięśnie';

  @override
  String get muscleNeck => 'Szyja';

  @override
  String get muscleUpperSpine => 'Górny kręgosłup';

  @override
  String get muscleUpperBack => 'Górne plecy';

  @override
  String get createRoutine => 'Utwórz zadanie';

  @override
  String get createRoutineTitle => 'Własne zadanie';

  @override
  String get createRoutineSubtitle => 'Stwórz własne codzienne zadanie';

  @override
  String get routineIcon => 'Ikona';

  @override
  String get routineTitleField => 'Tytuł';

  @override
  String get routineDescField => 'Opis';

  @override
  String get routineDescHint => 'Krótki opis zadania';

  @override
  String get routineCategoryField => 'Kategoria';

  @override
  String get routineDifficultyField => 'Trudność';

  @override
  String get routineDurationField => 'Czas trwania';

  @override
  String get routineSetsRepsField => 'Serie x powtórzenia';

  @override
  String get routineFormField => 'Technika i instrukcje';

  @override
  String get routineFormHint => 'Opcjonalnie: jak wykonać to zadanie';

  @override
  String get diffBeginner => 'Początkujący';

  @override
  String get diffIntermediate => 'Średni';

  @override
  String get diffAdvanced => 'Zaawansowany';

  @override
  String get catExercise => 'Ćwiczenia';

  @override
  String get catNutrition => 'Odżywianie';

  @override
  String get catSleep => 'Sen';

  @override
  String get catPosture => 'Postawa';

  @override
  String get postureTip1 => 'Stań bokiem (profilem) do aparatu.';

  @override
  String get postureTip2 => 'Zachowaj ok. 2 metrów odległości od obiektywu.';

  @override
  String get postureTip3 => 'Ręce luźno, patrz prosto przed siebie.';

  @override
  String get postureTip4 => 'Załóż dopasowane ubranie, by ocena była dokładna.';

  @override
  String get postureTip5 => 'Zadbaj o dobre światło i gładkie tło.';

  @override
  String get kyphosisLabel => 'Kifoza (górna część pleców)';

  @override
  String get lordosisLabel => 'Lordoza (dolna część pleców)';

  @override
  String get analyzingPosture => 'ANALIZA POSTAWY';

  @override
  String get privacyPolicy => 'Polityka prywatności';

  @override
  String get termsOfService => 'Warunki korzystania';

  @override
  String version(String ver) {
    return 'Wersja $ver';
  }

  @override
  String get rateApp => 'Oceń BeTaller';

  @override
  String get rateAppSubtitle => 'Twoja opinia pomaga nam się rozwijać!';

  @override
  String get unitSystem => 'System jednostek';

  @override
  String get unitMetric => 'Metryczny (cm, kg)';

  @override
  String get unitImperial => 'Imperialny (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Zastrzeżenie zdrowotne';

  @override
  String get healthDisclaimerBody =>
      'BeTaller zapewnia ogólne wskazówki dotyczące zdrowego stylu życia i aktywności fizycznej. Efekty różnią się w zależności od wieku, genetyki i czynników indywidualnych. Ta aplikacja nie udziela porad medycznych. Ćwiczenia skupiają się na poprawie postawy, zdrowiu kręgosłupa i wspieraniu hormonu wzrostu przez naturalne nawyki. Przed rozpoczęciem nowego programu ćwiczeń lub odżywiania skonsultuj się z lekarzem. Zmiany wzrostu po zamknięciu chrząstek wzrostowych (zwykle w wieku 18-25 lat) wynikają głównie z poprawy postawy.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Zjedz dziś co najmniej $grams g białka — wyliczone na podstawie twojej wagi.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Wypij dziś co najmniej $liters L wody — wyliczone na podstawie twojej wagi.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Celuj dziś w około $kcal kcal, by zapewnić energię do wzrostu.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Dostarcz dziś $iu IU witaminy D — ze słońca, jedzenia lub suplementu.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Dostarcz dziś $mg mg cynku, by wspierać produkcję hormonu wzrostu.';
  }

  @override
  String get nutritionSupplementsTitle => 'SUPLEMENTY';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Opcjonalne wsparcie, nie zamiennik jedzenia. Przed rozpoczęciem suplementacji porozmawiaj z lekarzem, zwłaszcza przed 18. rokiem życia.';

  @override
  String get supplementVitaminDName => 'Witamina D3';

  @override
  String get supplementVitaminDDose => '3000 IU';

  @override
  String get supplementVitaminDBenefit =>
      'Zwiększa wchłanianie wapnia, wspierając gęstość kości i chrząstki wzrostowe';

  @override
  String get supplementZincName => 'Cynk';

  @override
  String get supplementZincDose => '8-11 mg';

  @override
  String get supplementZincBenefit =>
      'Kluczowy minerał dla produkcji hormonu wzrostu';

  @override
  String get supplementMagnesiumName => 'Magnez';

  @override
  String get supplementMagnesiumDose => '300-400 mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Wspiera fazę głębokiego snu, w której wydziela się najwięcej hormonu wzrostu';

  @override
  String get supplementCalciumName => 'Wapń';

  @override
  String get supplementCalciumDose => '1000-1300 mg';

  @override
  String get supplementCalciumBenefit =>
      'Główny budulec gęstości kości i chrząstek wzrostowych';

  @override
  String get supplementOmega3Name => 'Omega-3';

  @override
  String get supplementOmega3Dose => '1000 mg';

  @override
  String get supplementOmega3Benefit =>
      'Zmniejsza stany zapalne i wspiera prawidłową pracę chrząstek wzrostowych';

  @override
  String get supplementCollagenName => 'Kolagen + witamina C';

  @override
  String get supplementCollagenDose => '10 g + 500 mg';

  @override
  String get supplementCollagenBenefit =>
      'Witamina C pomaga organizmowi wykorzystać kolagen do budowy chrząstki i tkanki kostnej';

  @override
  String get sciSourcePrefix => 'Źródło: ';

  @override
  String get program => 'Program';

  @override
  String get todaysExercises => 'DZISIEJSZE ĆWICZENIA';

  @override
  String get dailyNutritionPlan => 'DZIENNY PLAN ODŻYWIANIA';

  @override
  String get nutritionGoalsComplete => '🎉 Wszystkie cele odżywcze zrobione!';

  @override
  String get nutritionGoalsIncomplete =>
      'Zrealizuj cele odżywcze, by najlepiej wspierać wzrost';

  @override
  String get postureDetectingAlignment => 'Wykrywanie ustawienia kręgosłupa...';

  @override
  String get testimonial1 =>
      'Wydawało się, że w moim wieku to już koniec, a z BeTaller przybyło mi centymetrów. Moja pewność siebie jeszcze nigdy nie była tak wysoka.';

  @override
  String get testimonialDuration1 => '4 miesiące';

  @override
  String get testimonial2 =>
      'Wszyscy mówili: „już nie urośniesz”. Z BeTaller wszyscy się zdziwili.';

  @override
  String get testimonialDuration2 => '3 miesiące';

  @override
  String get testimonial3 =>
      'Odkąd robię zadania, przybyło mi wzrostu, a postawa się poprawiła. Wszyscy zauważyli różnicę.';

  @override
  String get testimonialDuration3 => '6 miesięcy';

  @override
  String get testimonial4 =>
      'Wciąż jestem w fazie wzrostu, a efekt BeTaller jest niesamowity. Czuję, że przybywa mi wzrostu i siły.';

  @override
  String get testimonialDuration4 => '3 miesiące';

  @override
  String get testimonial5 =>
      'Szczerze? BeTaller działa. Prawdziwą różnicę widać było szybko. Gorąco polecam.';

  @override
  String get testimonialDuration5 => '4 miesiące';

  @override
  String get designedForYou => 'Stworzone dla ciebie';

  @override
  String get designedForYouDesc =>
      'BeTaller powstał właśnie po to, by pomóc ci osiągnąć twój genetyczny limit, a nawet go przekroczyć. Każda funkcja jest dla ciebie.';

  @override
  String get greetingAllDone => 'Świetna robota! 🎯';

  @override
  String get greetingAllDoneSub => 'Dzisiejsze zadania zrobione.';

  @override
  String greetingStreak30(int streak) {
    return 'Seria $streak dni. Poziom legendy.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'Seria $streak dni. Tak trzymaj.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak dni z rzędu. Większość odpuszcza. Ty nie.';
  }

  @override
  String get greetingMorning => 'Dzień dobry. Nowy dzień, nowa szansa.';

  @override
  String get greetingAfternoon => 'Dziś jest świetny dzień, by zacząć serię.';

  @override
  String get greetingEvening => 'Zrób zadania i zacznij serię.';

  @override
  String get todayCompleted => 'Dzień zaliczony ✓';

  @override
  String get todayGoals => 'Cele na dziś';

  @override
  String get challengesLabel => 'Wyzwania';

  @override
  String get dailyChallengesLabel => 'WYZWANIA DNIA';

  @override
  String get expiresTonight => 'Kończy się dziś';

  @override
  String get allChallengesCompleted => 'Wszystko zrobione ✓';

  @override
  String get challengesLoading => 'Nowe wyzwania już wkrótce.';

  @override
  String get challengesLoadingTitle => 'Wyzwania dnia';

  @override
  String get behindPace => 'Poniżej tempa';

  @override
  String get growthTracking => 'Śledzenie wzrostu';

  @override
  String get growthEmptyFirst => 'Zapisz pierwszy pomiar, by zacząć śledzenie.';

  @override
  String get growthEmptySecond => 'Zapisz drugi pomiar, by zobaczyć wykres.';

  @override
  String get growthSectionLabel => 'WZROST';

  @override
  String get generalPerformance => 'OGÓLNY WYNIK';

  @override
  String get analysisBalance => 'Twoja równowaga';

  @override
  String get analysisWeakest => 'Twoje najsłabsze ogniwo';

  @override
  String get analysisPrediction => 'Prognoza wzrostu';

  @override
  String get analysisComparison => 'Porównanie';

  @override
  String get analysisGrowth => 'Status wzrostu';

  @override
  String get analysisWeakestHint => 'Tu najszybciej podniesiesz swój wynik.';

  @override
  String get exploreLabel => 'ODKRYWAJ';

  @override
  String get explorePosture => 'Analiza postawy';

  @override
  String get explorePostureSub => 'Analiza postawy i wskazówki korekty';

  @override
  String get explorePhotos => 'Zdjęcia postępów';

  @override
  String get explorePhotosSub => 'Śledź swoją przemianę na zdjęciach';

  @override
  String get exploreNutrition => 'Odżywianie';

  @override
  String get exploreNutritionSub => 'Przewodnik po białku, wapniu i witaminach';

  @override
  String get exploreHealth => 'Zdrowie';

  @override
  String get exploreHealthSub => 'Stres, kofeina i samopoczucie';

  @override
  String get exploreRecipes => 'Przepisy na wzrost';

  @override
  String get exploreRecipesSub => 'Przepisy, które wspierają wzrost';

  @override
  String get educationLabel => 'WIEDZA';

  @override
  String get educationTitle => 'Nauka\no wzroście';

  @override
  String get educationSubtitle => 'Treści eksperckie, badania i poradniki';

  @override
  String get aiAnalysisLabel => 'ANALIZA WZROSTU';

  @override
  String get peerCompareLabel => 'PORÓWNANIE Z RÓWIEŚNIKAMI';

  @override
  String peerCompareText(int topPct) {
    return 'Jesteś w czołowych $topPct% rówieśników';
  }

  @override
  String get notifWaterTitle => '💧 Pamiętaj o wodzie!';

  @override
  String get notifWaterBody =>
      'Cel wody na dziś osiągnięty? Wypij jeszcze szklankę!';

  @override
  String get notifMorningTitle => '🌅 Dzień dobry! Czas na ćwiczenia';

  @override
  String get notifMorningBody =>
      'Zrób poranne rozciąganie! 10 minut na kręgosłup i nogi.';

  @override
  String get notifRoutineTitle => '🔥 Zrób swoje zadania!';

  @override
  String get notifRoutineBody =>
      'Sprawdź zadania przed końcem dnia. Seria = dyscyplina!';

  @override
  String get notifProteinTitle => '🥚 Dzień białka!';

  @override
  String get notifProteinBody =>
      'Zacznij tydzień mocno! Białko w każdym posiłku.';

  @override
  String get notifNewWeekTitle => '✨ Nowy tydzień, nowe cele!';

  @override
  String get notifNewWeekBody =>
      'Nie pomijaj zadań w tym tygodniu. Małe kroki, duża różnica!';

  @override
  String get notifSleepTitle => '😴 Czas spać!';

  @override
  String get notifSleepBody =>
      'Hormon wzrostu osiąga szczyt między 22:00 a 2:00. Odłóż telefon!';

  @override
  String get notifPostureTitle => '🧍 Kontrola postawy!';

  @override
  String get notifPostureBody =>
      'Plecy proste, ramiona do tyłu. Dobra postawa = 2-3 cm różnicy!';

  @override
  String get notifVitaminDTitle => '☀️ Czas na witaminę D!';

  @override
  String get notifVitaminDBody =>
      'Złap 15 minut słońca! Witamina D wspiera wchłanianie wapnia.';

  @override
  String get notifMidweekTitle => '✨ Połowa za tobą!';

  @override
  String get notifMidweekBody =>
      'Kontrola w połowie tygodnia. Wzrost wymaga cierpliwości, ale regularność wygrywa!';

  @override
  String get notifScreenTitle => '📵 Ekrany off!';

  @override
  String get notifScreenBody =>
      'Bez ekranów godzinę przed snem. Niebieskie światło blokuje melatoninę!';

  @override
  String get notifJumpTitle => '🦘 Czas na skoki!';

  @override
  String get notifJumpBody =>
      'Skoki pobudzają chrząstki wzrostowe. Spróbuj 3 x 20 powtórzeń!';

  @override
  String get notifCalciumTitle => '🥛 Czas na wapń!';

  @override
  String get notifCalciumBody =>
      'Szklanka mleka albo jogurt. Wapń jest kluczowy dla kości!';

  @override
  String get notifPostureCheckTitle => '🧍 Kontrola postawy!';

  @override
  String get notifPostureCheckBody =>
      'Nie zginaj szyi nad telefonem! Siedź i chodź prosto.';

  @override
  String get notifWeekendTitle => '✨ Motywacja na weekend';

  @override
  String get notifWeekendBody =>
      'Nie pomijaj zadań w weekend! Dyscyplina obowiązuje codziennie.';

  @override
  String get notifWeeklyProgressTitle => '📊 Postępy tygodnia';

  @override
  String get notifWeeklyProgressBody =>
      'Jak minął tydzień? Sprawdź swój wykres wzrostu!';

  @override
  String get notifMeasureTitle => '📏 Cotygodniowy pomiar!';

  @override
  String get notifMeasureBody =>
      'Zmierz i zapisz swój wzrost! Poranne pomiary są najdokładniejsze.';

  @override
  String get notifEarlySleepTitle => '😴 Wcześnie do łóżka!';

  @override
  String get notifEarlySleepBody =>
      'Jutro poniedziałek! Zacznij tydzień mocno, dobrze się wysypiając.';

  @override
  String get notifStreak3Title => '🔥 Seria 3 dni!';

  @override
  String get notifStreak3Body => 'Świetny start! 3 dni z rzędu. Dalej, do 7!';

  @override
  String get notifStreak7Title => '🏆 Tydzień z rzędu!';

  @override
  String get notifStreak7Body =>
      'Niesamowite! 7 dni z rzędu ze zrobionymi zadaniami!';

  @override
  String get notifStreak14Title => '⭐ 2 tygodnie z rzędu!';

  @override
  String get notifStreak14Body =>
      '14 dni dyscypliny! Twoje ciało zaczyna się zmieniać.';

  @override
  String get notifStreak30Title => '👑 Miesiąc z rzędu!';

  @override
  String get notifStreak30Body => '30 dni! Mistrzowski poziom!';

  @override
  String get notifStreak60Title => '🌟 Seria 60 dni!';

  @override
  String get notifStreak60Body => '60 dni! Niesamowite osiągnięcie.';

  @override
  String get notifStreak100Title => '💎 100 DNI! LEGENDA!';

  @override
  String get notifStreak100Body => '100 dni z rzędu! Status: legenda.';

  @override
  String get notifStreakRiskTitle => '⚠️ Nie strać serii!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Twoja seria $streak dni jest zagrożona! Zrób swoje zadania.';
  }

  @override
  String get paywallStat1 => 'cm — twój potencjał jest zablokowany';

  @override
  String get paywallTitle1 => 'Ile cm\nmożesz urosnąć?';

  @override
  String get paywallBullet1a =>
      'Twój pułap genetyczny jest już obliczony. Chcesz go zobaczyć?';

  @override
  String get paywallBullet1b => 'Jak twój styl życia wpływa na wzrost?';

  @override
  String get paywallBullet1c => 'Czeka na ciebie osobista mapa drogowa';

  @override
  String get paywallStat2 => 'twój plan zadań jest gotowy';

  @override
  String get paywallTitle2 => 'Twój plan\njest gotowy';

  @override
  String get paywallBullet2a =>
      '8 minut każdego ranka — z myślą o twoim kręgosłupie';

  @override
  String get paywallBullet2b => 'Sen, odżywianie, woda — wszystko pod kontrolą';

  @override
  String get paywallBullet2c => 'Każdego dnia krok bliżej, nie przerywaj serii';

  @override
  String get paywallStat3 => 'wykresy postępów na żywo';

  @override
  String get paywallTitle3 => 'Śledź swój\nwzrost';

  @override
  String get paywallBullet3a =>
      'Comiesięczne pomiary — zobacz wzrost na własne oczy';

  @override
  String get paywallBullet3b => 'Zyskaj 2 cm od razu dzięki analizie postawy';

  @override
  String get paywallBullet3c => 'Zdjęcia postępów — zobaczysz różnicę';

  @override
  String get paywallStat4 => 'dzienny program — awans poziomu';

  @override
  String get paywallTitle4 => 'Silniej\nkażdego dnia';

  @override
  String get paywallBullet4a =>
      'Zdobywaj XP, odblokowuj poziomy — nawyki stają się grą';

  @override
  String get paywallBullet4b => 'Ci, którzy osiągnęli cel, zaczynali tutaj';

  @override
  String get paywallBullet4c => 'Zacznij teraz — pierwszy tydzień gratis';

  @override
  String get paywallRestore => 'Nie znaleziono wcześniejszych zakupów';

  @override
  String get paywallRestoreNotFound => 'Nie znaleziono wcześniejszych zakupów';

  @override
  String get paywallPromoCode => 'Masz kod promocyjny?';

  @override
  String get paywallHeightUnit => 'wzrost docelowy';

  @override
  String get paywallHeightTitle => 'O ile możesz urosnąć?';

  @override
  String get paywallHeightDesc =>
      'Analizujemy razem twoją genetykę, styl życia i postawę, a prognozę rozpisujemy rok po roku. Nic nie jest przesądzone: każdy twój krok ją aktualizuje.';

  @override
  String get paywallGrowthUnit => 'w tym roku';

  @override
  String get paywallGrowthTitle => 'Śledzimy twój wzrost razem z tobą';

  @override
  String get paywallGrowthDesc =>
      'Każdy pomiar od razu trafia na wykres. Obserwujesz postępy miesiąc po miesiącu, centymetr po centymetrze.';

  @override
  String get paywallPostureUnit => 'wynik postawy';

  @override
  String get paywallPostureTitle => 'Postawa to klucz do twoich zadań';

  @override
  String get paywallPostureDesc =>
      'Szybki test z 3 pytaniami o głowę, barki i dolny odcinek pleców, z konkretnymi ćwiczeniami na każdy z nich.';

  @override
  String get paywallReportUnit => 'zrobionych zadań';

  @override
  String get paywallReportTitle => 'Co tydzień robimy podsumowanie';

  @override
  String get paywallReportDesc =>
      'Woda, sen, zadania i seria na jednym ekranie. Co tydzień razem wskazujemy twoje mocne strony i braki.';

  @override
  String get paywallNutritionUnit => 'posiłków dziennie';

  @override
  String get paywallNutritionTitle => 'Twój pełny plan odżywiania jest gotowy';

  @override
  String get paywallNutritionDesc =>
      'Od śniadania do kolacji: pełny plan dnia z wyliczonym białkiem, wapniem, cynkiem i witaminą D.';

  @override
  String get paywallScoreUnit => 'Wynik BeTaller';

  @override
  String get paywallScoreTitle => 'System, który ciągle pcha cię do przodu';

  @override
  String get paywallScoreDesc =>
      'Genetyka, wzrost, odżywianie, sen i dyscyplina łączą się w jeden wynik. Gdy spada, od razu widzisz, co poprawić.';

  @override
  String get paywallPhotosUnit => 'widoczna różnica';

  @override
  String get paywallPhotosTitle => 'Udowodnij zmianę zdjęciami';

  @override
  String get paywallPhotosDesc =>
      'Porównania przed i po tworzą się same, a zdjęcia z każdego miesiąca układają się na twojej osi czasu.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'Zaczynamy w trzech krokach';

  @override
  String get journeyIntroSubtitle =>
      'Konfigurujemy BeTaller razem. Czeka cię kolejny krok.';

  @override
  String get journeyStep1Title => 'Zbieramy twoje dane';

  @override
  String get journeyStep1Desc =>
      'Bierzemy pod uwagę twój wzrost, wiek i styl życia, a potem wyliczamy twój potencjał.';

  @override
  String get journeyStep2Title => 'Przewodnik po aplikacji';

  @override
  String get journeyStep2Desc =>
      'Pokazujemy każdą funkcję: do czego służy i jak z niej korzystać.';

  @override
  String get journeyStep3Title => 'Twoja kolej';

  @override
  String get journeyStep3Desc =>
      'Ty realizujesz codzienny plan, a my śledzimy twoje postępy.';

  @override
  String get journeyNow => 'TERAZ';

  @override
  String get journeyDone => 'GOTOWE';

  @override
  String get journeySoon => 'WKRÓTCE';

  @override
  String get tourHomeStreakTitle => 'Twoja seria';

  @override
  String get tourHomeStreakDesc =>
      'Rośnie, dopóki trzymasz dyscyplinę. Opuść dzień, a zacznie się od zera.';

  @override
  String get tourHomeXpTitle => 'Twój poziom';

  @override
  String get tourHomeXpDesc =>
      'Rośnie z XP zdobywanym za dyscyplinę. Nie zbaczaj z kursu!';

  @override
  String get tourHomeGoalsTitle => 'Cele na dziś';

  @override
  String get tourHomeGoalsDesc =>
      'Pokazuje zadania dnia i cel wody w jednym miejscu, żeby nic ci nie umknęło.';

  @override
  String get tourHomeTrackTitle => 'Woda i sen';

  @override
  String get tourHomeTrackDesc =>
      'Zapisuj tu codzienną wodę i sen w kilka sekund.';

  @override
  String get tourPlanTabsTitle => 'Trzy karty: Dziś, Dyscyplina, Odżywianie';

  @override
  String get tourPlanTabsDesc =>
      'Tu znajdziesz codzienny plan, program tygodniowy i plan odżywiania.';

  @override
  String get tourPlanLevelTitle => 'Twój poziom dyscypliny';

  @override
  String get tourPlanLevelDesc =>
      'Pokazuje, jak regularnie robisz swoje zadania. Wyższy poziom to lepsze efekty.';

  @override
  String get tourPlanTodayTitle => 'Plan na dziś';

  @override
  String get tourPlanTodayDesc =>
      'Odhaczaj tu codzienne zadania, by wydłużać serię.';

  @override
  String get tourPlanTodayListTitle => 'Twoje zadania na dziś';

  @override
  String get tourPlanTodayListDesc =>
      'Odhacz każde po wykonaniu. Stuknij zadanie, by zobaczyć szczegóły.';

  @override
  String get tourPlanWeekGoalsTitle => 'Ten tydzień';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Idealne dni, treningi i pomiar, których wymaga ten tydzień, łącznie z obowiązkowym.';

  @override
  String get tourPlanMonthGoalsTitle => 'Ten miesiąc';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Zdjęcia postępów, kontrola postawy i pomiary w tym miesiącu: tego nie warto pomijać.';

  @override
  String get tourProgressHeightTitle => 'Twój obecny wzrost';

  @override
  String get tourProgressHeightDesc =>
      'Pokazuje twój aktualny wzrost i łączny przyrost. Tu dodasz nowy pomiar.';

  @override
  String get tourProgressPhotosTitle => 'Zdjęcia postępów';

  @override
  String get tourProgressPhotosDesc =>
      'Śledź swoją przemianę na regularnie robionych zdjęciach.';

  @override
  String get tourProgressPostureTitle => 'Analiza postawy';

  @override
  String get tourProgressPostureDesc =>
      'Przeanalizuj postawę na podstawie zdjęcia i dowiedz się, nad czym pracować.';

  @override
  String get tourAnalysisScoreTitle => 'Twój wynik BeTaller';

  @override
  String get tourAnalysisScoreDesc =>
      'Twój ogólny wynik, liczony z genetyki, tempa wzrostu, odżywiania i snu.';

  @override
  String get tourAnalysisPredictionTitle => 'Twoja prognoza wzrostu';

  @override
  String get tourAnalysisPredictionDesc =>
      'Pokazuje prognozowany wzrost końcowy i jego przebieg rok po roku.';

  @override
  String get tourAnalysisPeerTitle => 'Porównanie z rówieśnikami';

  @override
  String get tourAnalysisPeerDesc =>
      'Zobacz, jak wypadasz na tle innych osób w twoim wieku.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'Twoje zadania';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Zobacz, ile ćwiczeń zostało ci jeszcze na dziś.';

  @override
  String get tourHomeGoalsChallengesTitle => 'Twoje wyzwania';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Śledź tutaj postęp aktywnych wyzwań.';

  @override
  String get tourHomeGoalsWaterTitle => 'Twój cel wody';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Zobacz, jak blisko jesteś dziennego celu wody.';

  @override
  String get tourHomeReminderTitle => 'Następne przypomnienie';

  @override
  String get tourHomeReminderDesc =>
      'Zobacz, kiedy przyjdzie następne przypomnienie, i edytuj je stąd.';

  @override
  String get tourHomeChallengesTitle => 'Twoje wyzwania';

  @override
  String get tourHomeChallengesDesc =>
      'Kończ aktywne wyzwania, by zdobywać dodatkowe XP.';

  @override
  String get tourHomeGrowthTitle => 'Twój status wzrostu';

  @override
  String get tourHomeGrowthDesc =>
      'Zobacz różnicę między łącznym a ostatnim pomiarem oraz liczbę zapisanych pomiarów.';

  @override
  String get tourHomeExploreTitle => 'Odkrywaj';

  @override
  String get tourHomeExploreDesc =>
      'Poradniki żywieniowe, przepisy na wzrost i więcej czekają tutaj.';

  @override
  String get tourPlanProgramHeaderTitle => 'Twój 70-dniowy program';

  @override
  String get tourPlanProgramHeaderDesc =>
      'W tym pierścieniu widzisz ogólne postępy, obecny poziom i dzień.';

  @override
  String get tourPlanProgramLevelsTitle => 'Poziomy';

  @override
  String get tourPlanProgramLevelsDesc =>
      'Zobacz, na którym z 10 poziomów jesteś i które są jeszcze zablokowane.';

  @override
  String get tourPlanNutritionHeaderTitle => 'Postępy w odżywianiu';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Śledź, ile codziennych zadań żywieniowych jest już zrobionych.';

  @override
  String get tourPlanNutritionFirstTitle => 'Zadania żywieniowe';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Odhaczaj nawyki żywieniowe, które wspierają wzrost.';

  @override
  String get tourProgressChartTitle => 'Krzywa wzrostu';

  @override
  String get tourProgressChartDesc =>
      'Zobacz dawne pomiary na wykresie i zrozum, dokąd zmierzasz.';

  @override
  String get tourProgressReportTitle => 'Raport tygodniowy';

  @override
  String get tourProgressReportDesc =>
      'Przejrzyj raport podsumowujący postępy z tygodnia.';

  @override
  String get tourProgressHistoryTitle => 'Historia pomiarów';

  @override
  String get tourProgressHistoryDesc =>
      'Zobacz na osi czasu wszystkie zapisane pomiary wzrostu.';

  @override
  String get tourAnalysisRadarTitle => 'Wykres równowagi';

  @override
  String get tourAnalysisRadarDesc =>
      'Zobacz na wykresie radarowym równowagę genetyki, tempa wzrostu, odżywiania, snu i dyscypliny oraz poznaj swoje najsłabsze ogniwo.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'Twoje dzienne potrzeby';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Zobacz dzienne zapotrzebowanie na białko, kalorie, sen i wodę, dopasowane do twojego wzrostu i wagi.';

  @override
  String get journeyDataDoneTitle => 'Pierwszy krok za tobą';

  @override
  String get journeyDataDoneSubtitle =>
      'Mamy twoje dane i potencjał. Teraz czas na przewodnik po aplikacji.';

  @override
  String get journeyContinue => 'Dalej';

  @override
  String get journeyEnterApp => 'Wejdź do aplikacji';

  @override
  String get journeyProgressLabel => 'Pierwsze kroki';

  @override
  String get journeyTourDoneTitle => 'Witaj w BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'Wszystkie trzy kroki za tobą. Teraz twoja kolej: zacznij swoją drogę od pierwszego zadania.';

  @override
  String get journeyViewPlansButton => 'Zobacz plany i zacznij';

  @override
  String get paywallRestoreLabel => 'Przywróć zakupy';

  @override
  String get paywallYearly => 'Roczny';

  @override
  String get paywallBestValue => 'Najlepsza oferta';

  @override
  String paywallSavePercent(String percent) {
    return 'TANIEJ O $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/tydz.';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/mies.';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/rok';
  }

  @override
  String get paywallMonthly => 'Miesięczny';

  @override
  String get paywallWeekly => 'Tygodniowy';

  @override
  String get paywallFreeTrial => '3 dni za darmo';

  @override
  String get paywallLoadError =>
      'Nie udało się wczytać opcji zakupu, spróbuj ponownie';

  @override
  String get paywallCtaAlt => 'Dalej';

  @override
  String get paywallTrialDisclaimer =>
      '3 dni za darmo · potem odnawia się automatycznie · anuluj kiedy chcesz';

  @override
  String get paywallYearlyDisclaimer =>
      'Odnawia się co rok · anuluj kiedy chcesz';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days dni za darmo, potem $price/tydz. · anuluj kiedy chcesz';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days dni za darmo, potem $price/mies. · anuluj kiedy chcesz';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days dni za darmo, potem $price/rok · anuluj kiedy chcesz';
  }

  @override
  String get paywallRenewsWeekly =>
      'Odnawia się co tydzień · anuluj kiedy chcesz';

  @override
  String get paywallRenewsMonthly =>
      'Odnawia się co miesiąc · anuluj kiedy chcesz';

  @override
  String get resultCardTitle => 'Twój prognozowany wzrost w dorosłości';

  @override
  String resultRange(String min, String max) {
    return 'Prawdopodobny zakres: od $min do $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Wzrost większy niż u $percent% osób w twoim wieku';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Szacowany pozostały wzrost: $amount';
  }

  @override
  String get resultFootnote =>
      'Szacunek na podstawie wzrostu rodziców i siatek centylowych. To nie jest porada medyczna.';

  @override
  String get postureCheckTitle => 'Szybki test postawy';

  @override
  String get postureCheckIntro =>
      'Stań tak, by pięty, biodra i łopatki dotykały ściany, a potem odpowiedz na trzy pytania. Wynik zależy od twoich odpowiedzi, a zdjęcie zostaje do porównania przed i po.';

  @override
  String get postureQHead => 'Czy tył głowy dotyka ściany bez unoszenia brody?';

  @override
  String get postureQHeadA1 => 'Tak, bez trudu';

  @override
  String get postureQHeadA2 => 'Tylko gdy ją cofnę';

  @override
  String get postureQHeadA3 => 'Nie, jest przerwa';

  @override
  String get postureQShoulders =>
      'Gdzie na zdjęciu z boku są twoje barki w porównaniu z uszami?';

  @override
  String get postureQShouldersA1 => 'W linii z uszami';

  @override
  String get postureQShouldersA2 => 'Trochę z przodu';

  @override
  String get postureQShouldersA3 => 'Wyraźnie zaokrąglone do przodu';

  @override
  String get postureQLowerBack =>
      'Wsuń dłoń za dolny odcinek pleców. Ile jest miejsca?';

  @override
  String get postureQLowerBackA1 => 'Mieści się płaska dłoń';

  @override
  String get postureQLowerBackA2 => 'Wcale';

  @override
  String get postureQLowerBackA3 => 'Mieści się pięść';

  @override
  String get postureCheckSave => 'Pokaż mój wynik';

  @override
  String get postureCheckNote => 'To samoocena, a nie badanie lekarskie.';

  @override
  String get paywallTester => 'Tester';

  @override
  String get introTag1 => 'PROGNOZA';

  @override
  String get introTag2 => 'WZROST';

  @override
  String get introTag3 => 'ŚLEDZENIE';

  @override
  String get introTag4 => 'GRYWALIZACJA';

  @override
  String get introTag5 => 'SPOŁECZNOŚĆ';

  @override
  String get introTitle1 => 'Odkryj swój\npotencjał wzrostu';

  @override
  String get introSubtitle1 =>
      'Obliczymy twój pełny potencjał\nna podstawie genetyki, wieku i stylu życia.';

  @override
  String get introTitle2 => 'Krok wyżej\nkażdego dnia';

  @override
  String get introSubtitle2 =>
      'Rozwijaj swój potencjał dzięki osobistym\nplanom ćwiczeń i odżywiania.';

  @override
  String get introTitle3 => 'Śledź każdy\ncentymetr';

  @override
  String get introSubtitle3 =>
      'Zobacz, jak rosną twoje prawdziwe postępy\ndzięki comiesięcznym pomiarom.';

  @override
  String get introTitle4 => 'Awansuj\ni zdobywaj nagrody';

  @override
  String get introSubtitle4 =>
      'Kończ 70-dniowe programy,\nzdobywaj XP i odblokowuj poziomy.';

  @override
  String get introTitle5 => 'Tysiące osób\njuż urosło';

  @override
  String get introSubtitle5 =>
      'Dołącz do społeczności osób,\nktóre osiągnęły swoje cele.';

  @override
  String get criticalWindow => 'KRYTYCZNY OKRES';

  @override
  String get heightPotentialFading => 'Fakty o twoim';

  @override
  String get fadingAway => 'potencjale wzrostu..';

  @override
  String get painHookDesc =>
      'Z każdym dniem bez dobrych nawyków centymetry przepadają na zawsze. Ale wciąż można to odwrócić.';

  @override
  String get painGeneticTitle => 'Genetyka to nie wszystko';

  @override
  String get painGeneticDesc =>
      'Genetyka odpowiada za 60%, ale to, co robisz, decyduje o pozostałych 40%. BeTaller jest właśnie dla tych 40%.';

  @override
  String get painGeneticTag => 'Analiza';

  @override
  String get painSleepTitle => 'Popraw swój rytm snu';

  @override
  String get painSleepDesc =>
      'Dobry sen każdej nocy może zwiększyć produkcję hormonu wzrostu nawet o 70%. BeTaller automatycznie śledzi sen, a ty po prostu śpisz.';

  @override
  String get painSleepTag => 'Śledzenie';

  @override
  String get painPostureTitle => 'Zyskaj centymetry od razu dzięki postawie';

  @override
  String get painPostureDesc =>
      'Prawidłowa postawa może od razu dodać 1,5-3 cm. Codzienne ćwiczenia postawy w BeTaller utrwalą ją w kilka tygodni.';

  @override
  String get painPostureTag => 'Postawa';

  @override
  String get painExerciseTitle => 'Twój plan ćwiczeń jest gotowy';

  @override
  String get painExerciseDesc =>
      'Poranne rozciąganie, zwisy, ćwiczenia na kręgosłup: BeTaller przygotował je i zaplanował dla ciebie. Tylko 8-12 minut dziennie.';

  @override
  String get painExerciseTag => 'Zadania';

  @override
  String get painNutritionTitle => 'Odżywianie bezpośrednio wpływa na wzrost';

  @override
  String get painNutritionDesc =>
      'Białko, wapń, witamina D: BeTaller codziennie przypomina, jakie składniki przyjmować i kiedy.';

  @override
  String get painNutritionTag => 'Odżywianie';

  @override
  String get painTrackingTitle => 'Obserwuj swój wzrost na własne oczy';

  @override
  String get painTrackingDesc =>
      'Comiesięczne pomiary, zdjęcia postępów, wykres wzrostu: zobacz każdy zdobyty centymetr.';

  @override
  String get painTrackingTag => 'Postępy';

  @override
  String get selectYourGender => 'Wybierz płeć';

  @override
  String get onboardingPredictSubtitle =>
      'Użyjemy tego, by przewidzieć twój potencjał wzrostu i stworzyć osobisty plan.';

  @override
  String get other => 'Inna';

  @override
  String get whenWereYouBorn => 'Twoja data urodzenia?';

  @override
  String get heightAndWeight => 'Wzrost i waga';

  @override
  String get parentsHeight => 'Wzrost rodziców';

  @override
  String get weeklyWorkout => 'Treningi w tygodniu';

  @override
  String get workoutsPerWeek => 'Treningi na tydzień';

  @override
  String get whatsYourEthnicity => 'Jakie masz pochodzenie?';

  @override
  String get whiteCaucasian => 'Białe / europejskie';

  @override
  String get blackAfricanAmerican => 'Czarnoskóre / afroamerykańskie';

  @override
  String get hispanicLatino => 'Latynoskie';

  @override
  String get asian => 'Azjatyckie';

  @override
  String get middleEasternIndigenous => 'Bliskowschodnie / rdzenne';

  @override
  String get dontWantToAnswer => 'Wolę nie odpowiadać';

  @override
  String get footSizeLabel => 'Rozmiar stopy';

  @override
  String get selectYourSize => 'Wybierz rozmiar';

  @override
  String get whatsYourDreamHeight => 'Jaki jest twój wymarzony wzrost?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Na podstawie twoich danych obliczymy szanse na osiągnięcie tego wzrostu.';

  @override
  String get dreamHeightLabel => 'Wymarzony wzrost';

  @override
  String get sleepQuestion => 'Ile godzin\nśpisz każdej nocy?';

  @override
  String get thousandsSucceeded => 'Tysiącom\nsię udało';

  @override
  String get youCanToo => 'Tobie też się uda';

  @override
  String get yearsOld => 'lat';

  @override
  String get verifiedLabel => 'Zweryfikowane';

  @override
  String get scientificData => 'DANE NAUKOWE';

  @override
  String get longTermResults => 'BeTaller daje\ntrwałe efekty';

  @override
  String get longTermResultsSubtitle =>
      'Wiele osób nie osiąga pełnego wzrostu przez złe nawyki.';

  @override
  String get yourFinalHeight => 'Twój wzrost końcowy';

  @override
  String get badHabitsLegend => 'Złe nawyki';

  @override
  String get optimizedLegend => 'Optymalnie';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'Wzrost można zmienić\nnawykami';

  @override
  String get chartFact2Pct => '9-10 h';

  @override
  String get chartFact2Desc => 'Odpowiedni sen wspiera\nhormon wzrostu';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Można zyskać\nlepszą postawą';

  @override
  String get didYouKnow => 'Czy wiesz?';

  @override
  String get didYouKnowFact1 =>
      'Codzienne nawyki wpływają na 30% twojego wzrostu';

  @override
  String get didYouKnowFact2 => 'Ucisk kręgosłupa zabiera 1,5-3 cm wzrostu';

  @override
  String get didYouKnowFact3 => 'Niedobór snu obniża HGH o 70%';

  @override
  String get transformJourneyBegins => 'Twoja przemiana\nsię zaczyna';

  @override
  String get transformJourneySubtitle =>
      'Kompleksowy program, który krok po kroku\nwspiera twój zdrowy wzrost.';

  @override
  String get week1Label => '1T';

  @override
  String get week1Title => 'Tydzień 1';

  @override
  String get week1Desc =>
      'Ustawienie kręgosłupa się poprawia, postawa jest lepsza';

  @override
  String get month1Label => '1M';

  @override
  String get month1Title => 'Miesiąc 1';

  @override
  String get month1Desc => 'Pierwsze widoczne centymetry, lepsza jakość snu';

  @override
  String get month3Label => '3M';

  @override
  String get month3Title => 'Miesiąc 3';

  @override
  String get month3Desc => 'Średnio +1,5–2,5 cm, rozwój mięśni';

  @override
  String get month6Label => '6M';

  @override
  String get month6Title => 'Miesiąc 6';

  @override
  String get month6Desc => 'Maksymalny potencjał i życie z nowym wzrostem';

  @override
  String get reachYourGoal => 'Osiągnij cel';

  @override
  String get journeyBullet1 => 'Odblokuj maksymalny potencjał';

  @override
  String get journeyBullet2 => 'Zacznij żyć z nowym wzrostem';

  @override
  String get journeyBullet3 => 'Napisz swoją historię sukcesu';

  @override
  String get unlockButton => 'Odblokuj wszystko';

  @override
  String get dreamHeightOdds => 'Szanse na\nwymarzony wzrost';

  @override
  String get growthCompleteLabel => 'Wzrost\nukończony';

  @override
  String get tallerThanPct => 'Wzrost większy niż u 76,7% rówieśników';

  @override
  String get levelNovice => 'Adept';

  @override
  String get levelBuilder => 'Budowniczy';

  @override
  String get levelGrinder => 'Pracuś';

  @override
  String get levelWarrior => 'Wojownik';

  @override
  String get levelGodTier => 'Boski poziom';

  @override
  String get levelDesc0 => 'Zbuduj fundament';

  @override
  String get levelDesc1 => 'Przyspiesz wzrost';

  @override
  String get levelDesc2 => 'Wzmocnij trening';

  @override
  String get levelDesc3 => 'Przekraczaj granice';

  @override
  String get levelDesc4 => 'Bez wysiłku nie ma efektów';

  @override
  String get levelDesc5 => 'Mentalność mistrza';

  @override
  String get levelDesc6 => 'Elitarna forma';

  @override
  String get levelDesc7 => 'Opanuj swoje ciało';

  @override
  String get levelDesc8 => 'Legendarna dyscyplina';

  @override
  String get levelDesc9 => 'Maksymalny potencjał';

  @override
  String levelLabel(int level) {
    return 'POZIOM $level';
  }

  @override
  String daysLeftProgram(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Zostało $days dnia',
      many: 'Zostało $days dni',
      few: 'Zostały $days dni',
      one: 'Został $days dzień',
    );
    return '$_temp0 do końca programu';
  }

  @override
  String get tapLabel => 'STUKNIJ';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100 g';
  }

  @override
  String get dayShort => 'Dzień';

  @override
  String get legendShort => 'Niski';

  @override
  String get legendBelowAvg => 'Poniżej śr.';

  @override
  String get legendAverage => 'Średni';

  @override
  String get legendTall => 'Wysoki';

  @override
  String get legendVeryTall => 'Bardzo wysoki';

  @override
  String get pctBottom5 => 'Dolne 5%';

  @override
  String get pctBottom25 => 'Dolne 25%';

  @override
  String get pctMedian => 'Mediana';

  @override
  String get pctTop25 => 'Górne 25%';

  @override
  String get pctTop5 => 'Górne 5%';

  @override
  String get fallingBehind => 'Zostajesz w tyle';

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes min czytania';
  }

  @override
  String get inThisArticle => 'W tym artykule';

  @override
  String get nextArticle => 'Następny artykuł';

  @override
  String get purchaseUnavailable =>
      'Nie udało się dokończyć zakupu. Spróbuj ponownie.';

  @override
  String get viewPlan => 'Zobacz plan';

  @override
  String get viewPlanSubtitle => 'Szczegóły subskrypcji';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Dodanie pomiarów wzrostu podnosi pewność prognozy do $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'Twój dzień na jednym ekranie';

  @override
  String get paywallSlideHomeCaption =>
      'Zadania, woda, sen: trzy pierścienie do zamknięcia.';

  @override
  String get paywallSlideProgressTitle => 'Zobacz każdy centymetr';

  @override
  String get paywallSlideProgressCaption =>
      'Każdy pomiar od razu trafia na krzywą.';

  @override
  String get paywallSlideAnalysisTitle => 'Pięć wskaźników, jeden kształt';

  @override
  String get paywallSlideAnalysisCaption =>
      'Radar wskazuje twoje najsłabsze ogniwo.';

  @override
  String get paywallSlidePotentialTitle => 'Poznaj swój potencjał';

  @override
  String get paywallSlidePotentialCaption =>
      'Zobacz, jak wypadasz na tle rówieśników.';

  @override
  String get paywallSlideDisciplineTitle => 'Utrzymaj serię';

  @override
  String get paywallSlideDisciplineCaption =>
      'Każdy dzień podnosi twój poziom.';

  @override
  String get paywallSlideRemindersTitle => 'Przypomnienia w porę';

  @override
  String get paywallSlideRemindersCaption =>
      'Ustaw godziny, a resztą zajmie się aplikacja.';

  @override
  String get paywallSlidePostureTitle => 'Popraw postawę';

  @override
  String get paywallSlidePostureCaption =>
      'Zdjęcie z boku, szybka samoocena, jasny plan ćwiczeń.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days DNI ZA DARMO';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Potem $price · anuluj kiedy chcesz';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / rok · anuluj kiedy chcesz';
  }

  @override
  String get obBedtimeTitle => 'O której zwykle idziesz spać?';

  @override
  String get obBedtimeSubtitle =>
      'Przypomnienie o śnie ustawimy w okolicach tej godziny.';

  @override
  String get obWorkoutTimeTitle => 'O której trenujesz?';

  @override
  String get obWorkoutTimeSubtitle =>
      'Żeby przypomnienie o treningu przyszło w samą porę.';

  @override
  String get obMealsTitle => 'Ile posiłków dziennie?';

  @override
  String get obMealsSubtitle =>
      'Stuknij godzinę, by dopasować ją do swojego rytmu.';

  @override
  String obMealsCount(String count) {
    return 'Posiłki: $count';
  }

  @override
  String obMealLabel(String n) {
    return 'Posiłek $n';
  }

  @override
  String get obProteinTitle => 'Ile gramów białka dziennie?';

  @override
  String get obProteinSubtitle =>
      'Wystarczy przybliżona liczba. Zbudujemy wokół niej twój plan.';

  @override
  String get obCaloriesTitle => 'Ile kalorii dziennie, średnio?';

  @override
  String get obCaloriesSubtitle =>
      'Wystarczy szacunek, później możemy go razem doprecyzować.';

  @override
  String get obNotSure => 'Nie wiem';

  @override
  String get silNow => 'TERAZ';

  @override
  String get silPotential => 'POTENCJAŁ';

  @override
  String get chartMeasured => 'Twoje pomiary';

  @override
  String chartPotential(String height) {
    return 'Potencjał $height';
  }

  @override
  String chartDream(String height) {
    return 'Twój cel $height';
  }

  @override
  String get targetsTitle => 'Dziś dla ciebie';

  @override
  String get targetsSubtitle =>
      'Wyliczone na podstawie wieku, wagi i treningów.';

  @override
  String get targetProtein => 'Białko';

  @override
  String get targetCalcium => 'Wapń';

  @override
  String get targetVitaminD => 'Witamina D';

  @override
  String get targetWater => 'Woda';

  @override
  String get targetSleep => 'Sen';

  @override
  String get targetMove => 'Trening';

  @override
  String targetPerMeal(String g) {
    return '$g g na posiłek';
  }

  @override
  String get unitHours => 'h';

  @override
  String get unitMinutes => 'min';

  @override
  String get planStrength => 'Siła';

  @override
  String get planJump => 'Skoki i sprinty';

  @override
  String get planMobility => 'Rozciąganie';

  @override
  String get planSport => 'Sport';

  @override
  String get planPosture => 'Postawa';

  @override
  String get planRest => 'Odpoczynek';

  @override
  String planWeekTitle(int days) {
    return 'Twój tydzień: $days dni treningu';
  }

  @override
  String get planPreviewTitle => 'Twój plan jest gotowy';

  @override
  String planPreviewTraining(int days) {
    return '$days dni treningu w tygodniu, z myślą o wzroście';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g białka dziennie, rozłożone na posiłki';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours godz. snu i przypomnienie o pójściu spać';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Dziś: $plan · $minutes min';
  }

  @override
  String get nRestTitle => 'Dziś dzień odpoczynku';

  @override
  String get nRestBody =>
      'Wystarczy dziesięć minut rozciągania. Regeneracja to część planu.';

  @override
  String nProteinTitle(int grams) {
    return 'Dzisiejszy cel białka: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'Około $grams g na posiłek: jajka, jogurt, kurczak, soczewica.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Cel wody: $liters';
  }

  @override
  String get nWaterBody => 'Jedna szklanka teraz i dziś trzymasz kurs.';

  @override
  String get nSleepTitle => 'Czas się wyciszyć';

  @override
  String nSleepBody(String hours) {
    return 'Twój cel to $hours godz. Ekrany off, światło przygaszone.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Twój potencjał: $potential. Zmierz się rano i zobacz, jak zmienia się wykres.';
  }

  @override
  String get nTrialDay1Title => 'Twój plan czeka';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Dziś: $plan, $minutes min. Zapisz wzrost, by wykres ruszył.';
  }

  @override
  String get nTrialEndTitle => 'Okres próbny kończy się jutro';

  @override
  String nTrialEndBody(String price) {
    return 'Potem kontynuacja za $price. Twój plan i postępy zostaną zapisane tak czy inaczej.';
  }

  @override
  String get trophyContinue => 'Działaj dalej';

  @override
  String get guideSteps => 'Krok po kroku';

  @override
  String get guideMistakes => 'Częste błędy';

  @override
  String get guideTip => 'Wskazówka';

  @override
  String get homeHeroTitle => 'Twój wzrost i potencjał';

  @override
  String homeHeroGap(String cm) {
    return 'Jeszcze $cm przed tobą';
  }

  @override
  String get anSubtitle => 'Twój wynik, co na niego wpływa i dokąd zmierzasz';

  @override
  String get anScoreLabel => 'Wynik BeTaller';

  @override
  String get anTierStarting => 'Start';

  @override
  String get anTierBuilding => 'Budowa';

  @override
  String get anTierRising => 'Rozwój';

  @override
  String get anTierStrong => 'Siła';

  @override
  String get anTierPeak => 'Szczyt';

  @override
  String anTrendUp(int n) {
    return '+$n od zeszłego tyg.';
  }

  @override
  String anTrendDown(int n) {
    return '-$n od zeszłego tyg.';
  }

  @override
  String get anTrendFlat => 'Jak w zeszłym tyg.';

  @override
  String get anTrendFirst =>
      'Trend tygodniowy zobaczysz od przyszłego tygodnia';

  @override
  String anNextTier(int n, String tier) {
    return '$n pkt do poziomu $tier';
  }

  @override
  String get anTopTier => 'Najwyższy poziom. Utrzymaj go';

  @override
  String anCoverage(int n, int total) {
    return 'Na podstawie $n z $total sygnałów';
  }

  @override
  String get anNoScoreTitle => 'Za mało danych';

  @override
  String get anNoScoreBody =>
      'Zapisz dziś sen, trochę wody lub jeden trening, a pojawi się twój pierwszy wynik.';

  @override
  String get anFastestWin => 'Najszybszy zysk';

  @override
  String get anBreakdownTitle => 'Co buduje twój wynik';

  @override
  String get anBreakdownHint =>
      'Każdy sygnał dostaje od 0 do 100 punktów na podstawie twoich danych. Procent pokazuje jego wagę.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'Brak danych';

  @override
  String get anNotCounted => 'Nie liczy się';

  @override
  String get anFTraining => 'Trening';

  @override
  String get anFConsistency => 'Regularność';

  @override
  String get anFSleep => 'Sen';

  @override
  String get anFHydration => 'Nawodnienie';

  @override
  String get anFNutrition => 'Odżywianie';

  @override
  String get anFPosture => 'Postawa';

  @override
  String get anFMeasuring => 'Pomiary';

  @override
  String get anFGrowth => 'Tempo wzrostu';

  @override
  String get anFHeadroom => 'Zapas wzrostu';

  @override
  String anBTraining(int done, int planned) {
    return '$done z $planned zaplanowanych dni treningowych w ostatnich 7 dniach';
  }

  @override
  String get anBTrainingNone =>
      'Liczy dni treningowe względem twojego planu tygodniowego.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak dnia',
      many: '$streak dni',
      few: '$streak dni',
      one: '$streak dzień',
    );
    return 'Seria: $_temp0, $active z $days dni z co najmniej połową planu';
  }

  @override
  String get anBConsistencyNone =>
      'Liczy twoją serię i dni, w których robisz co najmniej połowę planu.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days nocy',
      many: '$days nocy',
      few: '$days noce',
      one: '$days noc',
    );
    return 'Średnio $hours h na noc, cel $target h, zapisane: $_temp0';
  }

  @override
  String get anBSleepNone => 'Brak zapisów snu z ostatnich 7 dni.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dzień',
    );
    return 'Średnio $litres dziennie, cel $target, zapisane: $_temp0';
  }

  @override
  String get anBHydrationNone => 'Brak zapisów wody z ostatnich 7 dni.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done z $planned nawyków żywieniowych w ostatnich 7 dniach';
  }

  @override
  String get anBNutritionNone =>
      'Liczy nawyki z twojego planu: białko, wapń, cynk i witaminę D.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dzień',
    );
    return 'Test przy ścianie $raw/90, $_temp0 temu';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Test przy ścianie $raw/90, dziś';
  }

  @override
  String get anBPostureNone => 'Brak testu postawy.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dzień',
    );
    return 'Ostatni pomiar $_temp0 temu';
  }

  @override
  String get anBMeasuringToday => 'Pomiar dziś';

  @override
  String get anBMeasuringNone => 'Brak pomiaru.';

  @override
  String anBGrowth(String v, String e) {
    return '$v rocznie, typowo w twoim wieku $e';
  }

  @override
  String get anBGrowthNone =>
      'Potrzebne są dwa pomiary w odstępie co najmniej 30 dni.';

  @override
  String get anBGrowthAdult =>
      'Chrząstki wzrostowe zwykle zamykają się do 21. roku życia, więc tempo wzrostu się u ciebie nie liczy.';

  @override
  String anBHeadroom(String cm) {
    return '$cm między dziś a twoim potencjałem';
  }

  @override
  String get anATraining => 'Zacznij dzisiejszy trening';

  @override
  String get anAConsistency => 'Zrób połowę dzisiejszego planu';

  @override
  String get anASleepLog => 'Zapisz sen z ostatniej nocy';

  @override
  String anASleep(String target) {
    return 'Śpij dziś $target h';
  }

  @override
  String get anAHydrationLog => 'Zapisz szklankę wody';

  @override
  String anAHydration(String left) {
    return 'Wypij dziś jeszcze $left';
  }

  @override
  String get anAHydrationDone => 'Cel na dziś osiągnięty. Jutro to samo';

  @override
  String get anANutrition => 'Odhacz dzisiejsze nawyki żywieniowe';

  @override
  String get anAPostureFirst => 'Zrób 1-minutowy test postawy';

  @override
  String get anAPostureRedo => 'Powtórz test postawy';

  @override
  String get anAPostureKeep => 'Trzymaj się codziennych ćwiczeń postawy';

  @override
  String get anAMeasure => 'Zmierz teraz swój wzrost';

  @override
  String get anAMeasureKeep => 'Zmierz się za tydzień';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dzień',
    );
    return 'Zmierz się ponownie za $_temp0';
  }

  @override
  String get anAGrowth => 'Mierz się co 2 tygodnie, by to śledzić';

  @override
  String get anAHeadroom => 'Zobacz swój potencjał';

  @override
  String get anPotentialTitle => 'Twój potencjał';

  @override
  String get anPotentialLabel => 'Prognozowany wzrost w dorosłości';

  @override
  String anPotentialToGo(String cm) {
    return 'Jeszcze +$cm';
  }

  @override
  String get anPotentialReached => 'Masz już prognozowany wzrost';

  @override
  String get anPotentialNote =>
      'Ta sama liczba w całej aplikacji. Może się tylko zwiększać.';

  @override
  String anDreamLine(String h) {
    return 'Twój cel: $h';
  }

  @override
  String get anSourcesTitle => 'Skąd biorą się centymetry';

  @override
  String get anSourcesGenes => 'Geny i wiek';

  @override
  String get anSourcesHabits => 'Sen, jedzenie, trening';

  @override
  String get anSourcesPosture => 'Postawa';

  @override
  String get anPctTitle => 'Wzrost na tle wieku';

  @override
  String anPctValue(int p) {
    return 'Wzrost większy niż u $p% osób w twoim wieku';
  }

  @override
  String get anPctBasis => 'Siatki centylowe US CDC, ten sam wiek i płeć';

  @override
  String get anPctMore => 'Pełne porównanie';

  @override
  String get anNeedsBasis => 'Wyliczone na podstawie wieku, wagi i treningów';

  @override
  String get anCalcium => 'Wapń';

  @override
  String get anVitaminD => 'Witamina D';

  @override
  String get anMovement => 'Ruch';

  @override
  String get anUnitMin => 'min';

  @override
  String get anUnitHours => 'h';

  @override
  String get anPerDay => 'dziennie';

  @override
  String get anPerNight => 'na noc';

  @override
  String get anUnlockScoreTitle => 'Twój pełny wynik BeTaller';

  @override
  String get anUnlockScoreBody =>
      'Wynik, wszystkie dziewięć sygnałów za nim i to, co robić dalej.';

  @override
  String get anUnlockSourcesTitle => 'Zobacz, skąd biorą się twoje centymetry';

  @override
  String get anUnlockNeedsTitle =>
      'Twoje dzienne potrzeby, wyliczone dla ciebie';

  @override
  String get anUnlockCta => 'Odblokuj';

  @override
  String get anFlowResultTitle => 'Zapisane na wykresie';

  @override
  String get anFlowResultBody =>
      'Twoje dawne pomiary są teraz na tej samej krzywej co obecne pomiary i potencjał.';

  @override
  String get anFlowOpenAnalysis => 'Otwórz analizę';

  @override
  String anTopPct(int p) {
    return 'TOP $p%';
  }

  @override
  String get anNeedsTitle => 'Twoje dzienne potrzeby';

  @override
  String get pgUnlockPro => 'Odblokuj z Pro';

  @override
  String get pgPhotosLockedTitle => 'Zobacz swoją przemianę';

  @override
  String get pgPhotosLockedBody =>
      'Co dwa tygodnie zapisuj zdjęcie ze swoim wzrostem i porównuj dowolne dwa suwakiem.';

  @override
  String get pgTransformationTitle => 'Twoja przemiana';

  @override
  String get pgHeightChange => 'zmiana wzrostu';

  @override
  String get pgDaysApart => 'dni odstępu';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dnia',
    );
    return '$delta między tymi dwoma zdjęciami, zrobionymi w odstępie $_temp0.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dnia',
    );
    return 'Ten sam wzrost w odstępie $_temp0. Najpierw zmienia się postawa i sylwetka, wzrost przychodzi z miesiącami.';
  }

  @override
  String get pgModeSlider => 'Suwak';

  @override
  String get pgModeSideBySide => 'Obok siebie';

  @override
  String get pgDragToReveal => 'Przeciągnij, by porównać';

  @override
  String get pgOnePhotoTitle => 'Zdjęcie „przed” zapisane';

  @override
  String pgOnePhotoBody(String date) {
    return 'Zrób kolejne $date w tej samej pozie, by zobaczyć pierwsze porównanie.';
  }

  @override
  String get pgEmptyTitle => 'Zacznij swoją przemianę';

  @override
  String get pgEmptyBody =>
      'Jedno zdjęcie co dwa tygodnie, ta sama poza, to samo miejsce, z twoim wzrostem. Za kilka miesięcy przesuniesz suwak między dniem 1 a dziś.';

  @override
  String get pgTakeFirstPhoto => 'Zrób pierwsze zdjęcie';

  @override
  String get pgPhotoDueNow => 'Czas na nowe zdjęcie';

  @override
  String pgNextPhotoOn(String date) {
    return 'Następne zdjęcie $date';
  }

  @override
  String pgDayN(int n) {
    return 'Dzień $n';
  }

  @override
  String get pgNewPhoto => 'Nowe zdjęcie';

  @override
  String get pgGuideTitle => 'Za każdym razem ta sama poza';

  @override
  String get pgGuideSubtitle =>
      'Zdjęcia dobrze się porównuje tylko wtedy, gdy są robione tak samo.';

  @override
  String get pgGuideGhost =>
      'Ostatnie zdjęcie jest widoczne w tle. Ustaw się zgodnie z nim.';

  @override
  String get pgGuideStep1 =>
      'Stań 2 m od telefonu, telefon na wysokości klatki';

  @override
  String get pgGuideStep2 => 'Przodem do aparatu, stopy razem, ręce luźno';

  @override
  String get pgGuideStep3 =>
      'To samo miejsce, to samo światło, dopasowane ubranie';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'wysokość klatki';

  @override
  String get pgTakePhoto => 'Zrób zdjęcie';

  @override
  String get pgFromGallery => 'Wybierz z galerii';

  @override
  String get pgChoosePhoto => 'Wybierz zdjęcie';

  @override
  String get pgPostureTitle => 'Test postawy';

  @override
  String get pgPostureLockedTitle => 'Znajdź słabe punkty';

  @override
  String get pgPostureLockedBody =>
      'Oceń głowę, barki i dolny odcinek pleców, dostań po dwa ćwiczenia na każdy obszar i śledź wynik tydzień po tygodniu.';

  @override
  String get pgAreaHead => 'Głowa';

  @override
  String get pgAreaShoulders => 'Barki';

  @override
  String get pgAreaLowerBack => 'Lędźwie';

  @override
  String get pgHeadMeaning0 =>
      'Głowa jest dokładnie nad barkami. Utrzymaj to krótkim codziennym ćwiczeniem.';

  @override
  String get pgHeadMeaning1 =>
      'Gdy się rozluźniasz, głowa wysuwa się do przodu. To bardzo częste przy długim korzystaniu z telefonu i szybko się poprawia.';

  @override
  String get pgHeadMeaning2 =>
      'Głowa jest przed barkami. Zacznij od tego: przez to wyglądasz niżej na każdym zdjęciu.';

  @override
  String get pgShouldersMeaning0 =>
      'Barki w linii z uszami. Górna część pleców dobrze wykonuje swoją pracę.';

  @override
  String get pgShouldersMeaning1 =>
      'Barki lekko wysunięte. Napięta klatka piersiowa ciągnie je do przodu; jej rozciągnięcie przywraca je na miejsce.';

  @override
  String get pgShouldersMeaning2 =>
      'Zaokrąglone barki. Górna część pleców wygina się do przodu, co odbiera wzrostu twojej sylwetce.';

  @override
  String get pgLowerBackMeaning0 =>
      'Neutralne wygięcie. Biodra i mięśnie brzucha trzymają kręgosłup tam, gdzie powinien być.';

  @override
  String get pgLowerBackMeaning1 =>
      'Płaski dolny odcinek pleców. Łagodne wyprosty i ćwiczenia mobilności przywracają naturalne wygięcie.';

  @override
  String get pgLowerBackMeaning2 =>
      'Mocne wygięcie. Napięte zginacze bioder przechylają miednicę do przodu; ich rozciąganie i silniejszy brzuch to wyrównują.';

  @override
  String get pgLegacyMeaning =>
      'Zapisane przez starszą wersję bez tych pytań. Powtórz test, by dostać wskazówki dla tego obszaru.';

  @override
  String get pgHowItWorks => 'Jak działa test';

  @override
  String get pgYourPosture => 'Twoja postawa';

  @override
  String pgCheckedOn(String date) {
    return 'Test: $date';
  }

  @override
  String get pgOutOf100 => 'na 100';

  @override
  String get pgAllAreasGood =>
      'Wszystkie trzy obszary wyglądają dobrze. Utrzymaj to.';

  @override
  String pgStartWith(String area) {
    return 'Zacznij od: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta od ostatniego testu';
  }

  @override
  String get pgStatusGood => 'Dobrze';

  @override
  String get pgStatusFair => 'Może być lepiej';

  @override
  String get pgStatusFix => 'Popraw najpierw';

  @override
  String get pgKeepItWith => 'Utrzymaj dzięki';

  @override
  String get pgFixItWith => 'Popraw dzięki';

  @override
  String get pgRetakeNow => 'Czas na cotygodniowy test';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Następny test za $n dnia',
      many: 'Następny test za $n dni',
      few: 'Następny test za $n dni',
      one: 'Następny test jutro',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Ta sama ściana, te same trzy pytania. Cotygodniowe testy pokazują, czy ćwiczenia działają.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Rób powyższe ćwiczenia do $date, potem powtórz test, by sprawdzić efekty.';
  }

  @override
  String get pgRetakeCheck => 'Powtórz test';

  @override
  String get pgRetakeAnyway => 'Powtórz teraz';

  @override
  String get pgHistoryTitle => 'Twoje wyniki';

  @override
  String pgSinceFirst(String delta) {
    return '$delta od pierwszego';
  }

  @override
  String get pgHistoryOne =>
      'To twój pierwszy test. Powtórz go za 7 dni, a tu zacznie się twój trend.';

  @override
  String get pgPostureIntroTitle => 'Jak prosto stoisz?';

  @override
  String get pgPostureIntroBody =>
      'Trzy pytania przy ścianie, około minuty. Dostajesz wynik i po dwa ćwiczenia na każdy słaby punkt.';

  @override
  String get pgPostureStep1 =>
      'Stań tak, by pięty, biodra i łopatki dotykały ściany.';

  @override
  String get pgPostureStep2 =>
      'Zrób zdjęcie z boku, cała sylwetka w kadrze, by móc później porównać.';

  @override
  String get pgPostureStep3 =>
      'Szczerze odpowiedz na trzy pytania. Wynik zależy od twoich odpowiedzi.';

  @override
  String get pgPostureStep4 =>
      'Powtarzaj raz w tygodniu, o tej samej porze dnia.';

  @override
  String get pgStartCheck => 'Zacznij test postawy';

  @override
  String pgWeekRange(String start, String end) {
    return '$start – $end';
  }

  @override
  String get pgGradeGreat => 'Tydzień mistrza';

  @override
  String get pgGradeGood => 'Solidny tydzień';

  @override
  String get pgGradeOk => 'Rozkręcasz się';

  @override
  String get pgGradeStart => 'Nowy początek';

  @override
  String get pgTopWeek => 'Top tydzień';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta od zeszłego tyg.';
  }

  @override
  String get pgDaysCompleted => 'dni z pełnym planem';

  @override
  String get pgDayStreak => 'dni serii';

  @override
  String pgBestDay(String day) {
    return 'Najlepszy: $day';
  }

  @override
  String get pgNextWeekFocus => 'Na przyszły tydzień';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Dni z pełnym planem — cel: $n, w tym tygodniu: $done.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Treningi — cel: $n, w tym tygodniu: $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Zmierz wzrost raz, rano, boso, w tym samym miejscu. Tak zobaczysz prawdziwą zmianę.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Wszystkie cele osiągnięte. Teraz niech $day też będzie pełnym dniem.';
  }

  @override
  String get pgFocusKeep =>
      'Wszystkie cele osiągnięte, każdy dzień pełny. Ten sam plan, ten sam rytm.';

  @override
  String get pgHeightThisWeek => 'Wzrost w tym tygodniu';

  @override
  String pgHeightNow(String height) {
    return 'Teraz $height';
  }

  @override
  String get pgNoMeasurementWeek => 'Brak pomiaru w tym tygodniu';

  @override
  String get pgFirstMeasurement => 'Twój pierwszy pomiar';

  @override
  String pgStartedAt(String height) {
    return 'Start $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Potencjał $height';
  }

  @override
  String pgToPotential(String cm) {
    return 'Do prognozowanego potencjału zostało $cm.';
  }

  @override
  String get pgPotentialReached =>
      'Masz już prognozowany potencjał. Praca nad postawą może jeszcze dodać to, co widać.';

  @override
  String get pgHabitsToday => 'Zapisane dziś';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return 'Ćwiczenia: $moves · $minutes min';
  }

  @override
  String plDoneCount(int done, int total) {
    return 'Zrobione: $done/$total';
  }

  @override
  String get plStartWorkout => 'Zacznij trening';

  @override
  String get plContinueWorkout => 'Kontynuuj trening';

  @override
  String get plWorkoutDoneToday => 'Dzisiejszy trening zrobiony';

  @override
  String get plTraining => 'Trening';

  @override
  String get plHabits => 'Codzienne nawyki';

  @override
  String get plRestDayNote =>
      'Lżejszy dzień: krótka sekwencja jogi rozluźni cię przed jutrem.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps powt.';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds s';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds s na stronę';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g w posiłkach';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters w ciągu dnia';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours h tej nocy';
  }

  @override
  String get plYourRoutines => 'Twoje zadania';

  @override
  String get plNewRoutine => 'Nowe zadanie';

  @override
  String get plCustomEmpty =>
      'Stwórz własne zadanie i odhaczaj je tu codziennie.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'Usunąć „$name”?';
  }

  @override
  String get plHoldToDelete => 'Przytrzymaj zadanie, by je usunąć.';

  @override
  String plSetOf(int current, int total) {
    return 'Seria $current z $total';
  }

  @override
  String get plRest => 'Przerwa';

  @override
  String get plStartSet => 'Zacznij serię';

  @override
  String get plSetDone => 'Seria zrobiona';

  @override
  String get plSkipRest => 'Pomiń przerwę';

  @override
  String get plNextMove => 'Następne';

  @override
  String get plSkipMove => 'Pomiń';

  @override
  String plUpNext(String name) {
    return 'Dalej: $name';
  }

  @override
  String get plLastMove => 'Ostatnie ćwiczenie';

  @override
  String get plWorkoutComplete => 'Trening zrobiony';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return 'Ćwiczenia: $moves, ok. $minutes min. Każda sesja się liczy.';
  }

  @override
  String get plEachSide => 'Na stronę';

  @override
  String get plMoveDone => 'Zrobione';

  @override
  String plRepsBig(int reps) {
    return '$reps powt.';
  }

  @override
  String get plSessionHint =>
      'Ćwicz we własnym tempie i stuknij „Zrobione” na koniec.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'Dzień $day z $total';
  }

  @override
  String get plTodayStep => 'Dzisiejszy krok';

  @override
  String get plTickToComplete => 'Odhacz każde ćwiczenie, by zaliczyć dzień';

  @override
  String plNextDayTomorrow(int day) {
    return 'Dzień $day otworzy się jutro. Odpoczynek to część wzrostu.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dnia',
      many: '$days dni',
      few: '$days dni',
      one: '$days dzień',
    );
    return '$_temp0 do poziomu $level';
  }

  @override
  String get plProgramFinished =>
      'Wszystkie 70 dni zaliczone. Program ukończony.';

  @override
  String plDayCompleteToast(int day) {
    return 'Dzień $day zaliczony';
  }

  @override
  String get plLevelWeek => 'Tydzień tego poziomu';

  @override
  String get plProgressionTitle => 'Jak rośnie trudność';

  @override
  String get plNow => 'Teraz';

  @override
  String plLevelN(int n) {
    return 'Poz. $n';
  }

  @override
  String get plUnlockProgram => 'Odblokuj 70-dniowy program';

  @override
  String get plProgramPitch =>
      '10 poziomów, jeden na tydzień. Każdy dodaje sekundy do utrzymań, powtórzenia do skoków i serię, gdy przyjdzie pora.';

  @override
  String plDayLocked(int day) {
    return 'Najpierw zalicz dzień $day';
  }

  @override
  String plCurrentDay(int day) {
    return 'Dzień $day';
  }

  @override
  String get plTodaysTargets => 'Cele na dziś';

  @override
  String get plTargetsBasis => 'Wyliczone na podstawie wieku, wagi i treningów';

  @override
  String plProteinSplit(int meals, int grams) {
    return 'Posiłki: $meals x $grams g';
  }

  @override
  String get plZinc => 'Cynk';

  @override
  String get plMagnesium => 'Magnez';

  @override
  String get plEnergy => 'Energia';

  @override
  String get plChecklist => 'Lista na dziś';

  @override
  String plCheckProtein(int grams) {
    return 'Białko $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'Wapń $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'Witamina D $iu IU';
  }

  @override
  String plCheckWater(String liters) {
    return 'Woda $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount z odhaczonych posiłków';
  }

  @override
  String get plVitaminDNote =>
      '15 min słońca w południe na ręce i twarz albo suplement zatwierdzony przez lekarza';

  @override
  String plWaterLogged(String liters) {
    return 'Zapisane do tej pory: $liters';
  }

  @override
  String get plMealPlan => 'Twój plan posiłków';

  @override
  String get plMealPlanSub =>
      'Prawdziwe jedzenie, konkretne gramy, dopasowane do celów';

  @override
  String get plSnack => 'Przekąska';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g białka · $calcium mg wapnia · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'cel $grams g';
  }

  @override
  String get plMarkEaten => 'Oznacz jako zjedzone';

  @override
  String get plEaten => 'Zjedzone';

  @override
  String get plPlanTotal => 'Suma dnia';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'Te posiłki dają ok. $planKcal z twoich $kcal kcal. Resztę uzupełnij owocami, warzywami, chlebem lub ryżem.';
  }

  @override
  String get plWeeklyMenu => 'Menu tygodniowe';

  @override
  String get plWeeklyMenuSub => 'Każdego dnia inny talerz, te same cele';

  @override
  String get plUnlockMenu => 'Odblokuj pełne menu tygodniowe';

  @override
  String get plRecipes => 'Przepisy';

  @override
  String get plRecipesSub => 'Szybkie dania bogate w białko';

  @override
  String get plNutritionGuide => 'Przewodnik żywieniowy';

  @override
  String get plNutritionGuideSub => 'Składniki, produkty i suplementy';

  @override
  String plPieces(int n) {
    return '$n szt.';
  }

  @override
  String get plFoodOats => 'Płatki owsiane';

  @override
  String get plFoodMilk => 'Mleko';

  @override
  String get plFoodBanana => 'Banan';

  @override
  String get plFoodWalnuts => 'Orzechy włoskie';

  @override
  String get plFoodGreekYogurt => 'Jogurt grecki';

  @override
  String get plFoodYogurt => 'Jogurt';

  @override
  String get plFoodEggs => 'Jajka';

  @override
  String get plFoodBread => 'Chleb pełnoziarnisty';

  @override
  String get plFoodWhiteCheese => 'Ser feta';

  @override
  String get plFoodHardCheese => 'Ser cheddar';

  @override
  String get plFoodSalad => 'Sałatka z pomidora i ogórka';

  @override
  String get plFoodOrange => 'Pomarańcza';

  @override
  String get plFoodPeanutButter => 'Masło orzechowe';

  @override
  String get plFoodSpinach => 'Szpinak';

  @override
  String get plFoodCottageCheese => 'Serek wiejski';

  @override
  String get plFoodChicken => 'Pierś z kurczaka';

  @override
  String get plFoodBulgur => 'Kasza bulgur';

  @override
  String get plFoodAyran => 'Ajran (napój jogurtowy)';

  @override
  String get plFoodTuna => 'Tuńczyk (z puszki)';

  @override
  String get plFoodPasta => 'Makaron';

  @override
  String get plFoodBeef => 'Chuda wołowina';

  @override
  String get plFoodRice => 'Ryż';

  @override
  String get plFoodChickpeas => 'Ciecierzyca';

  @override
  String get plFoodSalmon => 'Łosoś';

  @override
  String get plFoodBroccoli => 'Brokuły';

  @override
  String get plFoodPotato => 'Ziemniaki';

  @override
  String get plFoodLentils => 'Soczewica';

  @override
  String get plFoodSardines => 'Sardynki';

  @override
  String get plFoodAlmonds => 'Migdały';

  @override
  String get plFoodKefir => 'Kefir';

  @override
  String get plFoodPumpkinSeeds => 'Pestki dyni';

  @override
  String get wtCoffee => 'Kawa';

  @override
  String get wtTea => 'Herbata';

  @override
  String get wtCola => 'Cola';

  @override
  String get wtEnergyDrink => 'Energetyk';

  @override
  String get crCustomBadge => 'Własne';

  @override
  String get crNameHint => 'np. Mocne poranne rozciąganie';

  @override
  String get crDoseHint => 'np. 3x10 powt. lub 3x30 sekund';

  @override
  String get paywallLifetime => 'Dożywotnio';

  @override
  String paywallOnce(String price) {
    return '$price jednorazowo';
  }

  @override
  String get paywallLifetimeBadge => 'Bez subskrypcji';

  @override
  String get paywallLifetimeDisclaimer =>
      'Płatność jednorazowa · bez subskrypcji, nic się nie odnawia';

  @override
  String get pwSlidePotentialTitle => 'Zobacz swój potencjał';

  @override
  String get pwSlidePotentialCaption =>
      'Wyliczony na podstawie twojego wieku, wzrostu i wzrostu rodziców.';

  @override
  String get pwSlideTodayTitle => 'Plan na każdy dzień';

  @override
  String get pwSlideTodayCaption =>
      'Krótkie codzienne treningi z instrukcjami wideo.';

  @override
  String get pwSlideProgramTitle => '70 dni, 10 poziomów';

  @override
  String get pwSlideProgramCaption =>
      'Co tydzień ćwiczenia stają się trochę trudniejsze.';

  @override
  String get pwSlideNutritionTitle => 'Jedz dla wzrostu';

  @override
  String get pwSlideNutritionCaption =>
      'Dzienne cele białka, wapnia i witaminy D, dopasowane do ciebie.';

  @override
  String get pwSlideChartTitle => 'Patrz, jak rośnie twoja krzywa';

  @override
  String get pwSlideChartCaption =>
      'Każdy pomiar trafia na drogę do twojego potencjału.';

  @override
  String get pwSlideScoreTitle => 'Jeden wynik dla nawyków';

  @override
  String get pwSlideScoreCaption => 'Zobacz, który nawyk poprawić najpierw.';

  @override
  String get pwSlidePostureTitle => 'Stań prosto już dziś';

  @override
  String get pwSlidePostureCaption =>
      'Szybki test postawy i ćwiczenia, które ją poprawią.';

  @override
  String get pwExample => 'Przykład';

  @override
  String pwYouLine(String now, String potential) {
    return 'Ty: $now → potencjał $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'Przykład: $now → potencjał $potential';
  }

  @override
  String get tv3NewEyebrow => 'Nowości';

  @override
  String get tv3NewTitle => 'BeTaller ma dużą aktualizację';

  @override
  String get tv3NewDesc =>
      'Nowy plan, nowy program, nowy wygląd. Oto co nowego.';

  @override
  String get tv3PotentialTitle => 'To twój potencjał';

  @override
  String get tv3PotentialDesc =>
      'Twój wzrost dziś obok tego, gdzie możesz dojść. Plan zmniejsza tę różnicę.';

  @override
  String get tv3TodayTitle => 'Plan na dziś';

  @override
  String tv3TodayDesc(String button) {
    return 'Krótki trening na dziś. Stuknij $button i ćwicz razem z nami.';
  }

  @override
  String get tv3ProgramTitle => '70 dni dyscypliny';

  @override
  String get tv3ProgramDesc =>
      'Jeden krok dziennie przez 10 poziomów. Każdy dzień buduje na poprzednim.';

  @override
  String get tv3NutritionTitle => 'Twoje dzienne cele';

  @override
  String get tv3NutritionDesc =>
      'Białko, wapń, witamina D i woda, wyliczone dla twojego ciała.';

  @override
  String get tv3ChartTitle => 'Obserwuj swoją krzywą';

  @override
  String get tv3ChartDesc =>
      'Mierz się co tydzień lub dwa i patrz, jak linia pnie się do twojego potencjału.';

  @override
  String get tv3ScoreTitle => 'Twój wynik BeTaller';

  @override
  String get tv3ScoreDesc =>
      'Jedna liczba pokazuje, jak ci idzie. Najpierw popraw najsłabszy obszar.';

  @override
  String get tv3Next => 'Dalej';

  @override
  String get tv3ShowMe => 'Pokaż';

  @override
  String get tv3Done => 'Zaczynamy';

  @override
  String get obWhyTitle => 'Dlaczego chcesz urosnąć?';

  @override
  String get obWhySubtitle =>
      'Zaznacz wszystko, co pasuje. Twój plan zaczyna się od twojego powodu.';

  @override
  String get obWhyConfidence => 'Więcej pewności siebie';

  @override
  String get obWhyImpression => 'Lepsze pierwsze wrażenie';

  @override
  String get obWhySports => 'Lepsze wyniki w sporcie';

  @override
  String get obWhyClothes => 'Lepiej leżące ubrania';

  @override
  String get obWhyPhotos => 'Lepszy wygląd na zdjęciach';

  @override
  String get obWhyPotential => 'Chcę tylko poznać swój potencjał';

  @override
  String get obTriedTitle => 'Znasz inne aplikacje do wzrostu?';

  @override
  String get obTriedSubtitle =>
      'Nie ma złej odpowiedzi. Dzięki temu pokażemy, co jest tu inne.';

  @override
  String get obTriedStopped => 'Tak, ale już nie używam';

  @override
  String get obTriedStill => 'Tak, wciąż używam';

  @override
  String get obTriedFirst => 'Nie, to moja pierwsza';

  @override
  String get obTriedStoppedTitle => 'Sama liczba nie utrzyma motywacji';

  @override
  String get obTriedStoppedBody =>
      'Większość aplikacji daje ci liczbę. BeTaller zamienia ją w codzienny plan do odhaczania, z przypomnieniami o twoich porach.';

  @override
  String get obTriedStillTitle => 'Zostaw to, co działa';

  @override
  String get obTriedStillBody =>
      'BeTaller dodaje codzienną część: plan zbudowany z twoich odpowiedzi, który odhaczasz krok po kroku.';

  @override
  String get obTriedFirstTitle => 'Dobre miejsce na start';

  @override
  String get obTriedFirstBody =>
      'Tu nie dostaniesz samej liczby. BeTaller zamienia twoje odpowiedzi w codzienny plan do odhaczania.';

  @override
  String get obTriedCardTitle => 'Co odhaczasz każdego dnia';

  @override
  String get obTriedItem1 => 'Krótki trening dobrany do twojego tygodnia';

  @override
  String get obTriedItem2 => 'Twój cel białka';

  @override
  String get obTriedItem3 => 'Sen o właściwej porze';

  @override
  String get obBlockTitle => 'Co ci przeszkadza?';

  @override
  String get obBlockSubtitle =>
      'Zaznacz wszystko, co pasuje. Plan to uwzględni.';

  @override
  String get obBlockForget => 'Zapominam';

  @override
  String get obBlockTime => 'Brak czasu';

  @override
  String get obBlockExercises => 'Nie wiem, jakie ćwiczenia';

  @override
  String get obBlockMotivation => 'Tracę motywację';

  @override
  String get obBlockBedtime => 'Późno chodzę spać';

  @override
  String get obBlockMeals => 'Pomijam posiłki';

  @override
  String get obFirstTitle => 'Co zrobisz najpierw, gdy urośniesz?';

  @override
  String get obFirstSubtitle => 'Wyobraź to sobie. Właśnie do tego dążysz.';

  @override
  String get obFirstWardrobe => 'Odświeżę garderobę';

  @override
  String get obFirstMuscle => 'Zbuduję mięśnie';

  @override
  String get obFirstPhotos => 'Wrzucę więcej zdjęć';

  @override
  String get obFirstTeam => 'Spróbuję dostać się do drużyny';

  @override
  String get obFirstFeelGood =>
      'Nic szczególnego, po prostu poczuję się dobrze';

  @override
  String get obBuiltChip => 'Dla ciebie';

  @override
  String get obBuiltTitle => 'Twój plan, zbudowany wokół ciebie';

  @override
  String get obBuiltReason => 'Twój powód';

  @override
  String get obBuiltGoal => 'Cel';

  @override
  String get obBuiltWhen => 'Kiedy to osiągniesz';

  @override
  String get obBuiltBlockers => 'Przeszkody, z którymi sobie radzimy';

  @override
  String get obFixForget => 'Przypomnienia o wybranych porach';

  @override
  String get obFixTime => 'Krótkie sesje, zwykle około 15 minut';

  @override
  String get obFixExercises => 'Ćwiczenia z wideo, krok po kroku';

  @override
  String get obFixMotivation => 'Serie i poziomy, które motywują';

  @override
  String get obFixBedtime => 'Cel snu i przypomnienie przed snem';

  @override
  String get obFixMeals => 'Cel białka i plan posiłków';

  @override
  String get obNotifTitle => 'BeTaller przypomni ci, gdy to ważne';

  @override
  String get obNotifSubtitle =>
      'Ustawione na podane przez ciebie pory. Możesz je zmienić w każdej chwili.';

  @override
  String get obNotifWorkout => 'Trening';

  @override
  String obNotifWorkoutDetail(String time) {
    return '30 min przed treningiem o $time';
  }

  @override
  String get obNotifMeal => 'Posiłek i białko';

  @override
  String obNotifMealDetail(String time) {
    return 'Przy posiłku o $time';
  }

  @override
  String get obNotifWater => 'Woda';

  @override
  String get obNotifWaterDetail => 'Przerwa na wodę po południu';

  @override
  String get obNotifSleep => 'Wyciszenie';

  @override
  String obNotifSleepDetail(String time) {
    return 'Godzinę przed snem o $time';
  }

  @override
  String get obNotifAllow => 'Włącz przypomnienia';

  @override
  String get obNotifNotNow => 'Nie teraz';

  @override
  String get obNotifNow => 'teraz';

  @override
  String get ftOneFree => '1 za darmo';

  @override
  String get ftFreeToday => 'Dziś za darmo';

  @override
  String get ftContinuePro => 'Kontynuuj z Pro';

  @override
  String get ftNotNow => 'Nie teraz';

  @override
  String get ftOutWorkoutTitle => 'Darmowy trening wykorzystany';

  @override
  String get ftOutWorkoutBody =>
      'Utrzymaj serię z Pro: trening z instrukcją każdego dnia, każde ćwiczenie z odmierzonym czasem.';

  @override
  String get ftOutDayTitle => 'Darmowy pierwszy dzień za tobą';

  @override
  String get ftOutDayBody =>
      'Twój plan, cele i postępy zostają tu do wglądu. Utrzymaj serię z Pro: odhaczaj plan i zapisuj wodę i sen każdego dnia.';

  @override
  String get ftOutPostureTitle => 'Darmowy test postawy wykorzystany';

  @override
  String get ftOutPostureBody =>
      'Twój wynik tu zostaje. Z Pro rób test co tydzień i obserwuj, jak poprawia się postawa.';

  @override
  String get ftOutPhotosTitle => 'Darmowe porównanie zdjęć wykorzystane';

  @override
  String get ftOutPhotosBody =>
      'Ta para zdjęć zostaje do wglądu. Z Pro dodawaj kolejne zdjęcia i porównuj dowolne dwa.';

  @override
  String get ftOutReportTitle => 'Darmowy raport tygodniowy wykorzystany';

  @override
  String get ftOutReportBody =>
      'Z Pro dostajesz pełne podsumowanie co tydzień: ocenę każdego dnia, swoje cele i jedną rzecz do poprawy.';

  @override
  String get ftOutScoreTitle => 'Darmowy podgląd wyniku wykorzystany';

  @override
  String get ftOutScoreBody =>
      'Twój wynik zostaje na ekranie. Z Pro codziennie widzisz, co go buduje i co robić dalej.';

  @override
  String get ftOutArticleTitle => 'Darmowy artykuł przeczytany';

  @override
  String get ftOutArticleBody =>
      'Ten artykuł zostaje dla ciebie otwarty. Z Pro przeczytasz całą bibliotekę.';

  @override
  String get ftWhyWorkout => 'Treningi z instrukcją to część Pro';

  @override
  String get ftWhyPlan => 'Odhaczanie planu to część Pro';

  @override
  String get ftWhyProgram => '70-dniowy program to część Pro';

  @override
  String get ftWhyWater => 'Codzienne zapisywanie wody to część Pro';

  @override
  String get ftWhySleep => 'Codzienne zapisywanie snu to część Pro';

  @override
  String get ftWhyNutrition => 'Dzienny plan odżywiania to część Pro';

  @override
  String get ftWhyPosture => 'Cotygodniowe testy postawy to część Pro';

  @override
  String get ftWhyPhotos => 'Porównania zdjęć to część Pro';

  @override
  String get ftWhyReport => 'Raport tygodniowy to część Pro';

  @override
  String get ftWhyScore => 'Rozbicie wyniku to część Pro';

  @override
  String get ftWhyArticle => 'Pełna biblioteka to część Pro';

  @override
  String get ftPlanLocked =>
      'Twój plan zostaje tu do wglądu. Odhaczanie go to część Pro.';

  @override
  String get ftNutritionLocked =>
      'Twoje cele i posiłki zostają tu do wglądu. Odhaczanie ich to część Pro.';

  @override
  String get ftPreviewTag => 'Podgląd';

  @override
  String get ftPreviewTitle => 'To był podgląd';

  @override
  String get ftPreviewBody =>
      'Reszta tego treningu to część Pro. Oto co dalej:';

  @override
  String get ftFreeWorkoutUsed =>
      'To był twój darmowy trening z instrukcją. Z Pro dostajesz je codziennie.';

  @override
  String get ftScoreLockedTitle => 'Co buduje twój wynik';

  @override
  String get ftScoreLockedBody =>
      'Każdy element wyniku, na czym się opiera i jedna rzecz do zrobienia.';

  @override
  String get ftReportLockedTitle => 'Twój pełny tydzień';

  @override
  String get ftReportLockedBody =>
      'Każdy dzień oceniony względem planu, twoje cele, wzrost i jeden cel na przyszły tydzień.';

  @override
  String get ftPhotosLockedTitle => 'Porównaj te dwa';

  @override
  String get ftPhotosLockedBody =>
      'Darmowe porównanie wykorzystane. Z Pro przesuniesz suwak między dowolnymi dwoma zdjęciami.';

  @override
  String get ftArticleFreeLine =>
      'Pierwszy artykuł jest za darmo. Wybierz ten, który chcesz.';

  @override
  String get plFinishWorkout => 'Zakończ';

  @override
  String get obTriedMostApps => 'Większość aplikacji';

  @override
  String get obTriedThatsIt => 'Liczba i tyle.';

  @override
  String get obTriedPlanLabel => 'Twój dzień z BeTaller';

  @override
  String get obTriedProteinSub => 'Rozłożone na posiłki';

  @override
  String get obTriedSleepSub => 'Przypomnienie przed snem';

  @override
  String get obTriedFeatVideo => 'Ćwiczenia z wideo';

  @override
  String get obTriedFeatReminders => 'Przypomnienia o twoich porach';

  @override
  String get obTriedFeatStreaks => 'Serie i poziomy';

  @override
  String get obBedtimeUnknown => 'Nie wiem, bywa różnie';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'Proponujemy $time, zgodnie z ilością snu potrzebną w twoim wieku. Możesz to zmienić w każdej chwili.';
  }

  @override
  String get obWorkoutTimeUnknown => 'Nie wiem, nie mam stałej pory';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'Na razie ustawimy $time. Możesz to zmienić w każdej chwili.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'Sugestia: sen około $time. Zmienisz to w każdej chwili.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'Sugestia: trening około $time. Zmienisz to w każdej chwili.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'Ustawione na podane przez ciebie pory, z sugestią tam, gdzie brakowało odpowiedzi. Możesz je zmienić w każdej chwili.';

  @override
  String get plFoodBrownRice => 'Brązowy ryż';

  @override
  String get unitHeightTitle => 'Jednostka wzrostu';

  @override
  String get unitWeightTitle => 'Jednostka wagi';

  @override
  String get unitWaterTitle => 'Jednostka wody';

  @override
  String get unitOptCm => 'Centymetry';

  @override
  String get unitOptFtIn => 'Stopy i cale';

  @override
  String get unitOptKg => 'Kilogramy';

  @override
  String get unitOptLb => 'Funty';

  @override
  String get unitOptStLb => 'Stony i funty';

  @override
  String get unitOptLiters => 'Litry';

  @override
  String get unitOptFlOz => 'Uncje płynu';

  @override
  String achieveGrowthImp(String amount) {
    return '$amount wzrostu';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'Zanotuj łącznie $amount wzrostu';
  }

  @override
  String get postureBenefitIn =>
      'Głowa, ramiona i dolny odcinek pleców. Wyprostowana sylwetka pokazuje nawet około 1 cala więcej twojego prawdziwego wzrostu.';

  @override
  String get notifPostureBodyIn =>
      'Plecy proste, ramiona do tyłu. Dobra postawa = około 1 cala różnicy!';

  @override
  String get painPostureDescIn =>
      'Prawidłowa postawa może od razu dodać nawet około 1 cala. Codzienne ćwiczenia postawy w BeTaller utrwalą ją w kilka tygodni.';

  @override
  String get routinePostureDescIn =>
      'Plecy proste, ramiona do tyłu. Sprawdzaj co godzinę. Dobra postawa = około 1 cala różnicy.';

  @override
  String get sciPostureCheckIn =>
      'Prawidłowa postawa może od razu dodać około 1 cala widocznego wzrostu i zapobiega uciskowi kręgosłupa';

  @override
  String get routineProteinDescLb =>
      'Jajka, kurczak, ryby, nabiał. Co najmniej 0,7 g białka na lb masy ciała dziennie.';

  @override
  String pwPersonalTitle(String height) {
    return 'Twój plan, by osiągnąć $height, jest gotowy';
  }

  @override
  String get pwPersonalEstimate =>
      'Szacowany potencjał na podstawie odpowiedzi, bez gwarancji';

  @override
  String pwPersonalReason(String reason) {
    return 'Twój powód: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'Przypomnienie o wyciszeniu przed snem o $time';
  }

  @override
  String get obParentUnknown => 'Nie wiem';

  @override
  String get obParentUnknownHint =>
      'Użyjemy wtedy średniego wzrostu dorosłych. To mniej dokładne, a wzrost możesz dodać w profilu w każdej chwili.';

  @override
  String get obEthnicityWhy =>
      'Używamy tego tylko do oszacowania wzrostu rodzica, którego nie znasz.';

  @override
  String get resultNoParentNote =>
      'Oszacowane bez wzrostu jednego z rodziców, więc mniej dokładne. Dodaj go w profilu w każdej chwili.';

  @override
  String get resultNoParentsNote =>
      'Oszacowane bez wzrostu rodziców, więc mniej dokładne. Dodaj go w profilu w każdej chwili.';

  @override
  String get resultFootnoteEstimated =>
      'Szacunek na podstawie siatek centylowych i średniego wzrostu dorosłych. To nie jest porada medyczna.';

  @override
  String get obBudgetChip => 'UCZCIWA CENA';

  @override
  String get obBudgetTitle =>
      'BeTaller ma cenę dopasowaną do każdego nastolatka, który chce urosnąć';

  @override
  String get obBudgetDesc =>
      'Twój wzrost nie powinien zależeć od tego, ile masz pieniędzy. Dlatego cena jest ustalana osobno dla każdego kraju.';

  @override
  String obBudgetWeek(String price) {
    return 'Tydzień Pro tutaj: $price';
  }

  @override
  String get obBudgetLocalTitle => 'Cena dla twojego kraju';

  @override
  String get obBudgetLocalDesc =>
      'Nie przeliczona z dolarów: dopasowana do budżetów tam, gdzie mieszkasz.';

  @override
  String get obBudgetWeekTitle => 'Zacznij od jednego tygodnia';

  @override
  String get obBudgetWeekDesc =>
      'Bez dużej płatności na start. Anuluj w dowolnym momencie w ustawieniach Apple ID.';

  @override
  String get obBudgetAllTitle => 'Wszystko w jednym planie';

  @override
  String get obBudgetAllDesc =>
      'Treningi, sen, odżywianie, postawa i raporty postępów.';

  @override
  String get obRateTitle => 'BeTaller powstał, żeby naprawdę ci pomóc';

  @override
  String get obRateDesc =>
      'Jeśli spodobała ci się nasza osobista uwaga i szczerość, bardzo ucieszy nas twoja ocena.';

  @override
  String get obRateCta => 'Oceń BeTaller';

  @override
  String get obRateLater => 'Może później';
}
