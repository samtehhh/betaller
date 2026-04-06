// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get navHome => 'Inicio';

  @override
  String get navAnalysis => 'Análisis';

  @override
  String get navRoutines => 'Rutinas';

  @override
  String get navProgress => 'Progreso';

  @override
  String get navProfile => 'Perfil';

  @override
  String greeting(String name) {
    return 'Hola, $name';
  }

  @override
  String get currentHeight => 'Altura Actual';

  @override
  String get target => 'Objetivo';

  @override
  String completed(String pct) {
    return '$pct% completado';
  }

  @override
  String remaining(String cm) {
    return '+$cm cm restantes';
  }

  @override
  String get updateAnalysis => 'Actualizar Análisis';

  @override
  String get analysisSubtitle =>
      'Obtén predicciones a partir de alturas pasadas + hábitos';

  @override
  String get dailyRoutines => 'Rutinas Diarias';

  @override
  String get allRoutinesDone => '¡Todas las rutinas completadas!';

  @override
  String get water => 'Agua';

  @override
  String get sleep => 'Sueño';

  @override
  String get growthSummary => 'Resumen de Crecimiento';

  @override
  String get total => 'TOTAL';

  @override
  String get last => 'ÚLTIMO';

  @override
  String get measurement => 'MED.';

  @override
  String get dailyTip => 'Consejo del Día';

  @override
  String get waterTracking => 'Seguimiento de Agua';

  @override
  String waterToday(String amount) {
    return 'Hoy: $amount L';
  }

  @override
  String get sleepTracking => 'Seguimiento de Sueño';

  @override
  String sleepTarget(String hours) {
    return 'Objetivo: $hours horas';
  }

  @override
  String get hours => 'horas';

  @override
  String get save => 'Guardar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get analysis => 'Análisis';

  @override
  String get betallerScore => 'Puntuación BeTaller';

  @override
  String get genetic => 'Genético';

  @override
  String get growth => 'Crecimiento';

  @override
  String get nutrition => 'Nutrición';

  @override
  String get sleepLabel => 'Sueño';

  @override
  String get discipline => 'Disciplina';

  @override
  String get improveScore => 'Mejora Tu Puntuación';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => '¡Nutrición Crítica!';

  @override
  String get nutritionStrengthen => 'Reforzar Nutrición';

  @override
  String get sleepRecordAdd => 'Agregar Registro de Sueño';

  @override
  String get sleepPoor => 'Horario de Sueño Deficiente';

  @override
  String get sleepImprove => 'Mejorar Sueño';

  @override
  String get startToday => '¡Empieza Hoy!';

  @override
  String routinesRemaining(int count) {
    return '$count Rutinas Pendientes';
  }

  @override
  String get keepStreak => 'Mantén la Racha';

  @override
  String get addFirstMeasurement => 'Agregar Primera Medición';

  @override
  String get addMeasurement => 'Agregar Medición';

  @override
  String waterHalfNotReached(String amount) {
    return 'No has alcanzado la mitad de tu meta de agua hoy. Bebe ${amount}L más.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'Faltan ${amount}L para alcanzar tu meta de agua. ¡Ya casi!';
  }

  @override
  String bmiLow(String bmi) {
    return 'Tu IMC es $bmi — un poco bajo. Aumenta la ingesta de proteínas y calorías.';
  }

  @override
  String bmiHigh(String bmi) {
    return 'Tu IMC es $bmi — un poco alto. Enfócate en una alimentación saludable.';
  }

  @override
  String get nutritionDefault =>
      'Completa tu meta de agua y mantén una nutrición equilibrada.';

  @override
  String sleepNoRecord(String hours) {
    return 'Sin registro de sueño hoy. Apunta a $hours horas y regístralo.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Dormiste $current horas hoy — te faltan $missing horas. ¡Acuéstate más temprano!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Casi lo logras. Alcanzar $hours horas maximizará la hormona de crecimiento.';
  }

  @override
  String get sleepGood => '¡Excelente horario de sueño! Sigue así.';

  @override
  String noRoutinesDone(int total) {
    return 'No completaste rutinas hoy. ¡Empieza con una de $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total rutinas hechas hoy. ¡Faltan $left más!';
  }

  @override
  String streakBuilding(int needed) {
    return '¡Buen trabajo hoy! $needed días más para iniciar una racha.';
  }

  @override
  String streakContinue(int days) {
    return '¡Racha de $days días! Tu puntuación sube mientras continúes.';
  }

  @override
  String get noMeasurements =>
      'Aún no hay mediciones de altura. Agrega la primera para predicciones precisas.';

  @override
  String fewMeasurements(int count) {
    return 'Agrega $count mediciones más para calcular la velocidad de crecimiento.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Tienes $count mediciones. Llegar a 5 mejorará mucho la precisión.';
  }

  @override
  String get keepMeasuring =>
      'Sigue agregando mediciones. Cada nuevo dato mejora las predicciones.';

  @override
  String get heightPrediction => 'Predicción de Altura';

  @override
  String get predictedHeightAt21 => 'Altura predicha a los 21';

  @override
  String get predictionMethod =>
      'Calculado combinando datos genéticos (padres), velocidad de crecimiento, IMC y edad.';

  @override
  String get growthStatus => 'Estado de Crecimiento';

  @override
  String get completionLabel => 'COMPLETADO';

  @override
  String get growthVelocity => 'VELOCIDAD DE CRECIMIENTO';

  @override
  String get noData => 'Sin datos';

  @override
  String growthRate(String rating) {
    return 'Tasa de crecimiento: $rating';
  }

  @override
  String get bmi => 'IMC';

  @override
  String get calories => 'Calorías';

  @override
  String get kcalDay => 'kcal/día';

  @override
  String get daily => 'diario';

  @override
  String get protein => 'Proteína';

  @override
  String get minimum => 'mínimo';

  @override
  String get age => 'Edad';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Femenino';

  @override
  String get yearlyPrediction => 'PREDICCIÓN ANUAL';

  @override
  String ageYear(int age) {
    return '$age años';
  }

  @override
  String get progressTitle => 'Seguimiento de Progreso';

  @override
  String get totalGrowth => 'Total';

  @override
  String get lastDiff => 'Última Dif.';

  @override
  String get measurementCount => 'Med.';

  @override
  String get heightChart => 'Gráfico de Altura';

  @override
  String get chartMinData =>
      'Se necesitan al menos 2 mediciones para el gráfico';

  @override
  String get chartInstruction =>
      '¡Agrega mediciones para ver tu gráfico de progreso!';

  @override
  String get addMeasurementButton => 'AGREGAR NUEVA MEDICIÓN';

  @override
  String get measurementHistory => 'HISTORIAL DE MEDICIONES';

  @override
  String get deleteTitle => 'Eliminar Medición';

  @override
  String get deleteMessage =>
      '¿Estás seguro de que quieres eliminar esta medición?';

  @override
  String get dismiss => 'Cancelar';

  @override
  String get delete => 'Eliminar';

  @override
  String get newMeasurement => 'Nueva Medición de Altura';

  @override
  String get routines => 'Rutinas';

  @override
  String streakDays(int days) {
    return '$days Días';
  }

  @override
  String get progressStatus => 'Estado de Progreso';

  @override
  String get completedLabel => '¡Completado!';

  @override
  String get all => 'Todos';

  @override
  String get exercise => 'Ejercicio';

  @override
  String get posture => 'Postura';

  @override
  String bestStreak(int days) {
    return 'Mejor: $days días';
  }

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get editProfileSubtitle =>
      'Actualiza información de altura, peso y edad';

  @override
  String get name => 'Nombre';

  @override
  String birthDate(String date) {
    return 'Nacimiento: $date';
  }

  @override
  String get heightCm => 'Altura (cm)';

  @override
  String get weightKg => 'Peso (kg)';

  @override
  String get fatherHeight => 'Altura del Padre (cm)';

  @override
  String get motherHeight => 'Altura de la Madre (cm)';

  @override
  String get notifications => 'Notificaciones';

  @override
  String get notificationsOn => 'Recordatorios activos';

  @override
  String get notificationsOff => 'Recordatorios desactivados';

  @override
  String get premium => 'Actualizar a Premium';

  @override
  String get premiumSubtitle => 'Desbloquea todas las funciones';

  @override
  String get rateUs => 'Califícanos';

  @override
  String get rateSubtitle => '¿Te gusta la app? ¡Danos 5 estrellas!';

  @override
  String get share => 'Compartir App';

  @override
  String get shareSubtitle => 'Cuéntale a tus amigos sobre BeTaller';

  @override
  String get shareText =>
      '¡Descubrí mi potencial de crecimiento con BeTaller! Pruébalo tú también: https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';

  @override
  String get feedback => 'Enviar Comentarios';

  @override
  String get feedbackSubtitle => 'Contáctanos';

  @override
  String get resetData => 'Restablecer Todos los Datos';

  @override
  String get resetSubtitle => 'Se eliminarán todos los datos';

  @override
  String get resetTitle => 'Restablecer Datos';

  @override
  String get resetMessage =>
      'Se eliminarán todos los datos y volverás a la pantalla de introducción. ¡Esto no se puede deshacer!';

  @override
  String get reset => 'Restablecer';

  @override
  String get premiumSoon => '¡Premium disponible pronto!';

  @override
  String get brandingSubtitle => 'Descubre tu potencial de crecimiento';

  @override
  String get statistics => 'Estadísticas';

  @override
  String get currentStreak => 'Racha Actual';

  @override
  String get bestStreakLabel => 'Mejor Racha';

  @override
  String get achievementLabel => 'Logro';

  @override
  String get achievements => 'Logros';

  @override
  String get earned => '¡Obtenido!';

  @override
  String get notEarned => 'Aún no obtenido';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Cambiar idioma de la app';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Descubre tu potencial de crecimiento';

  @override
  String get onboardingMeetYou => 'Vamos a Conocerte';

  @override
  String get onboardingInfoNeeded =>
      'Información básica necesaria para el análisis.';

  @override
  String get gender => 'GÉNERO';

  @override
  String get birthDateLabel => 'FECHA DE NACIMIENTO';

  @override
  String get bodyMeasurements => 'Medidas Corporales';

  @override
  String get bodyInfo =>
      'Tu altura y peso actuales son necesarios para el análisis.';

  @override
  String get geneticData => 'Datos Genéticos';

  @override
  String get geneticInfo =>
      'La altura de los padres determina tu potencial genético.';

  @override
  String get pastHeights => 'Alturas Anteriores';

  @override
  String get pastHeightsInfo =>
      'Ingresa las alturas que recuerdes a distintas edades. Puedes dejar espacios en blanco.';

  @override
  String get heightHint => 'Ingresa altura...';

  @override
  String get ageLabel => 'edad';

  @override
  String get habits => 'Tus Hábitos';

  @override
  String get habitsInfo =>
      'Tu estilo de vida afecta directamente las predicciones.';

  @override
  String get weeklyExercise => 'Ejercicio Semanal';

  @override
  String get dailySleep => 'Sueño Diario';

  @override
  String get nutritionQuality => 'CALIDAD NUTRICIONAL';

  @override
  String get nutritionDesc =>
      'Ingesta de proteínas, lácteos, verduras y frutas';

  @override
  String get nutritionBad => 'Mala';

  @override
  String get nutritionPoor => 'Deficiente';

  @override
  String get nutritionMedium => 'Regular';

  @override
  String get nutritionGood => 'Buena';

  @override
  String get nutritionGreat => 'Excelente';

  @override
  String get startAnalysis => 'Iniciar Análisis';

  @override
  String get continueBtn => 'Continuar';

  @override
  String get analyzeBtn => 'Analizar';

  @override
  String get analyzing => 'Analizando';

  @override
  String get analysisComplete => '¡Completado!';

  @override
  String get yourScore => 'Tu Puntuación BeTaller';

  @override
  String get letsStart => 'Comencemos';

  @override
  String get doneBtn => 'Listo';

  @override
  String get analysisStep1 => 'Analizando datos genéticos...';

  @override
  String get analysisStep2 => 'Calculando velocidad de crecimiento...';

  @override
  String get analysisStep3 => 'Procesando datos de nutrición y sueño...';

  @override
  String get analysisStep4 => 'Generando predicción de altura...';

  @override
  String get analysisStep5 => 'Calculando puntuación BeTaller...';

  @override
  String growthPotential(String cm) {
    return '+$cm cm de potencial de crecimiento';
  }

  @override
  String get heightAt21 => 'a los 21 años';

  @override
  String confidenceLevel(String pct) {
    return '$pct% nivel de confianza';
  }

  @override
  String heightRange(String min, String max) {
    return 'Rango de $min - $max cm';
  }

  @override
  String get currentLabel => 'ACTUAL';

  @override
  String get predictedLabel => 'PREDICHO';

  @override
  String get yearlyPredictions => 'Predicciones Anuales';

  @override
  String get tipMorningMeasure =>
      'Mídete por la mañana - la presión en los discos causa pérdida de altura durante el día. La medición más precisa es por la mañana.';

  @override
  String get tipProteinSpread =>
      'Distribuye la ingesta de proteínas entre comidas. No comas todo de una vez, incluye proteínas en cada comida.';

  @override
  String get tipGrowthHormone =>
      'La hormona de crecimiento alcanza su pico durante el sueño. ¡Duerme entre las 10 PM y las 2 AM!';

  @override
  String get tipVitaminD =>
      '15 minutos de exposición solar diaria aumentan la producción de vitamina D. La vitamina D es esencial para la absorción de calcio.';

  @override
  String get tipBarHanging =>
      'Colgarse de la barra descomprime la columna. Prueba 3x30 segundos al día.';

  @override
  String get tipSwimming =>
      'La natación es el mejor deporte para un entrenamiento completo y apoyo al crecimiento de altura.';

  @override
  String get tipStress =>
      'El estrés suprime la hormona de crecimiento. Reduce el estrés con meditación y yoga.';

  @override
  String get routineMorningStretch => 'Estiramientos Matutinos';

  @override
  String get routineMorningStretchDesc =>
      'Haz 10 minutos de estiramientos al despertar. Estira la columna y los músculos de las piernas.';

  @override
  String get routineBarHanging => 'Colgarse de la Barra';

  @override
  String get routineBarHangingDesc =>
      'Cuélgate de una barra de dominadas para extender la columna. 3 series x 30 segundos.';

  @override
  String get routineCobraStretch => 'Estiramiento de Cobra';

  @override
  String get routineCobraStretchDesc =>
      'Acuéstate boca abajo y levanta el torso. Estira la columna. 3 series x 15 segundos.';

  @override
  String get routineJumping => 'Ejercicios de Salto';

  @override
  String get routineJumpingDesc =>
      'Saltar la cuerda o sentadillas con salto. Estimula las placas de crecimiento. 3 series x 20 repeticiones.';

  @override
  String get routineSwimming => 'Natación o Baloncesto';

  @override
  String get routineSwimmingDesc =>
      'Practica un deporte que favorezca el crecimiento. Al menos 30 minutos.';

  @override
  String get routineYoga => 'Yoga y Estiramientos Nocturnos';

  @override
  String get routineYogaDesc =>
      'Rutina de yoga y estiramientos antes de dormir. Libera estrés, relaja músculos.';

  @override
  String get routineProtein => 'Ingesta de Proteínas';

  @override
  String get routineProteinDesc =>
      'Huevos, pollo, pescado, lácteos. Al menos 1.5g/kg de proteína diaria.';

  @override
  String get routineCalcium => 'Calcio y Vitamina D';

  @override
  String get routineCalciumDesc =>
      'Consume leche, queso, yogur. Toma el sol 15 min. Esencial para el desarrollo óseo.';

  @override
  String get routineWater => 'Meta de Ingesta de Agua';

  @override
  String get routineWaterDesc =>
      'Bebe al menos 2-3 litros de agua al día. Esencial para el metabolismo y el crecimiento.';

  @override
  String get routineAvoidJunk => 'Evitar Comida Chatarra';

  @override
  String get routineAvoidJunkDesc =>
      'Aléjate de la comida rápida, bebidas azucaradas y alimentos procesados.';

  @override
  String get routineSleep => 'Sueño de Calidad (8-10 hrs)';

  @override
  String get routineSleepDesc =>
      'La hormona de crecimiento se libera durante el sueño. 10 PM-6 AM son horas doradas.';

  @override
  String get routineNoScreen => 'Descanso de Pantallas Antes de Dormir';

  @override
  String get routineNoScreenDesc =>
      'Deja el teléfono y la computadora 1 hora antes de dormir. No bloquees la producción de melatonina.';

  @override
  String get routinePosture => 'Control de Postura';

  @override
  String get routinePostureDesc =>
      'Mantén la espalda recta, hombros hacia atrás. Revisa cada hora. Buena postura = 2-3 cm de diferencia.';

  @override
  String get routineWallStand => 'Ejercicio de Pared';

  @override
  String get routineWallStandDesc =>
      'Apóyate contra la pared: talones, caderas, hombros y cabeza tocando la pared. Mantén 5 min.';

  @override
  String get routineSprintIntervals => 'Intervalos de Sprint';

  @override
  String get routineSprintIntervalsDesc =>
      'El entrenamiento de intervalos de sprint desencadena una liberación significativa de hormona de crecimiento mediante ráfagas de alta intensidad.';

  @override
  String get routineHiitWorkout => 'Entrenamiento HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'Entrenamiento de intervalos de alta intensidad para maximizar la liberación de hormona de crecimiento.';

  @override
  String get routineSquats => 'Sentadillas con Peso Corporal';

  @override
  String get routineSquatsDesc =>
      'Las sentadillas con peso corporal estimulan las placas de crecimiento en piernas y columna vertebral.';

  @override
  String get routineDeadliftStretch => 'Estiramiento Deadlift';

  @override
  String get routineDeadliftStretchDesc =>
      'Estiramiento deadlift para la descompresión espinal y la salud de los discos vertebrales.';

  @override
  String get routineOverheadPress => 'Press por Encima de la Cabeza';

  @override
  String get routineOverheadPressDesc =>
      'El press por encima de la cabeza estira la columna vertebral y fortalece los músculos posturales.';

  @override
  String get routineSkippingRope => 'Saltar la Cuerda';

  @override
  String get routineSkippingRopeDesc =>
      'Los saltos repetitivos con cuerda estimulan las placas de crecimiento en las extremidades inferiores.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Los ejercicios de Pilates Core apoyan la alineación espinal y la postura.';

  @override
  String get routineInversionHang => 'Suspensión Invertida';

  @override
  String get routineInversionHangDesc =>
      'La inversión descomprime los discos espinales y puede añadir temporalmente 1-2 cm.';

  @override
  String get routineZincIntake => 'Alimentos Ricos en Zinc';

  @override
  String get routineZincIntakeDesc =>
      'Consume alimentos ricos en zinc durante el día para la producción de hormona de crecimiento.';

  @override
  String get routineVitaminDSunlight => 'Vitamina D y Luz Solar';

  @override
  String get routineVitaminDSunlightDesc =>
      'Recibe al menos 15 minutos de luz solar directa para la síntesis de vitamina D y el crecimiento óseo.';

  @override
  String get routineArginineFoods => 'Alimentos Ricos en Arginina';

  @override
  String get routineArginineFoodsDesc =>
      'Come alimentos ricos en arginina para estimular la secreción de hormona de crecimiento.';

  @override
  String get routineSleepEnvironment => 'Optimizar el Entorno de Sueño';

  @override
  String get routineSleepEnvironmentDesc =>
      'Crea un entorno de sueño oscuro y fresco para maximizar la liberación de melatonina y hormona de crecimiento.';

  @override
  String get routinePreSleepRoutine => 'Rutina Pre-Sueño';

  @override
  String get routinePreSleepRoutineDesc =>
      'Una rutina pre-sueño constante mejora la calidad del sueño profundo en un 23%.';

  @override
  String get routineNeckStretches => 'Estiramientos de Cuello';

  @override
  String get routineNeckStretchesDesc =>
      'Los estiramientos de cuello alivian la compresión y mejoran la alineación cervical.';

  @override
  String get routineShoulderRolls => 'Rotaciones y Aperturas de Hombros';

  @override
  String get routineShoulderRollsDesc =>
      'Abrir los hombros corrige la postura hacia adelante y puede añadir 1-2 cm en apariencia.';

  @override
  String get achieveFirstDay => 'Primer Paso';

  @override
  String get achieveFirstDayDesc => 'Completa tu primer día';

  @override
  String get achieveThreeStreak => 'Racha de 3 Días';

  @override
  String get achieveThreeStreakDesc => 'Completa rutinas 3 días seguidos';

  @override
  String get achieveWeekStreak => 'Racha de 7 Días';

  @override
  String get achieveWeekStreakDesc => 'Completa rutinas 7 días seguidos';

  @override
  String get achieveTwoWeekStreak => 'Racha de 14 Días';

  @override
  String get achieveTwoWeekStreakDesc => 'Continúa durante 14 días seguidos';

  @override
  String get achieveMonthStreak => 'Racha de 30 Días';

  @override
  String get achieveMonthStreakDesc => 'Completa 30 días seguidos';

  @override
  String get achieveTwoMonthStreak => 'Racha de 60 Días';

  @override
  String get achieveTwoMonthStreakDesc => 'Completa 60 días seguidos';

  @override
  String get achieveHundredStreak => 'Racha de 100 Días';

  @override
  String get achieveHundredStreakDesc => 'Completa 100 días seguidos';

  @override
  String get achieveFirstMeasure => 'Primera Medición';

  @override
  String get achieveFirstMeasureDesc =>
      'Registra tu primera medición de altura';

  @override
  String get achieveThreeMeasures => 'Rastreador';

  @override
  String get achieveThreeMeasuresDesc => 'Registra 3 mediciones de altura';

  @override
  String get achieveFiveMeasures => 'Seguimiento Regular';

  @override
  String get achieveFiveMeasuresDesc => 'Registra 5 mediciones de altura';

  @override
  String get achieveTenMeasures => 'Cazador de Datos';

  @override
  String get achieveTenMeasuresDesc => 'Registra 10 mediciones de altura';

  @override
  String get achieveFirstCm => 'Primer Centímetro';

  @override
  String get achieveFirstCmDesc => 'Registra 1 cm de crecimiento total';

  @override
  String get achieveThreeCm => '3 cm de Crecimiento';

  @override
  String get achieveThreeCmDesc => 'Registra 3 cm de crecimiento total';

  @override
  String get achieveFiveCm => '5 cm de Crecimiento';

  @override
  String get achieveFiveCmDesc => 'Registra 5 cm de crecimiento total';

  @override
  String get achieveTenCm => '10 cm de Crecimiento';

  @override
  String get achieveTenCmDesc => 'Registra 10 cm de crecimiento total';

  @override
  String get quote1 => 'Sé mejor que ayer, cada día.';

  @override
  String get quote2 =>
      'El crecimiento no ocurre de la noche a la mañana, pero cada noche te acerca más.';

  @override
  String get quote3 => '¡El crecimiento requiere paciencia, sigue adelante!';

  @override
  String get quote4 =>
      'El paso que das hoy construye los cimientos del mañana.';

  @override
  String get quote5 => 'La disciplina empieza donde termina la motivación.';

  @override
  String get quote6 => '¡Tu cuerpo te lo agradecerá, sigue adelante!';

  @override
  String get quote7 => 'Tú estableces los límites de tu potencial.';

  @override
  String get quote8 => 'Pequeños pasos crean grandes cambios.';

  @override
  String get quote9 => 'La mejor inversión es en ti mismo.';

  @override
  String get quote10 => 'Cada día estás más cerca de tu meta.';

  @override
  String get quote11 =>
      'El cambio es difícil, pero el arrepentimiento es peor.';

  @override
  String get quote12 => 'Tu cuerpo es un templo, cuídalo.';

  @override
  String get quote13 => 'Tu rival es el tú de ayer. ¡Supéralo hoy!';

  @override
  String get quote14 => 'BeTaller = Paciencia + Disciplina + Convicción';

  @override
  String get quote15 => 'Cree en ti mismo, el proceso te formará.';

  @override
  String get quote16 => 'No digas hoy no puedo, no te arrepientas mañana.';

  @override
  String get quote17 => 'Muestra progreso cada día, aunque sea solo un 1%.';

  @override
  String get quote18 => 'El espejo mostrará tu progreso, ten paciencia.';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiUnderweight => 'Bajo peso';

  @override
  String get bmiOverweight => 'Sobrepeso';

  @override
  String get bmiObese => 'Obeso';

  @override
  String get velocityExcellent => 'Excelente';

  @override
  String get velocityNormal => 'Normal';

  @override
  String get velocitySlow => 'Lento';

  @override
  String get velocityVeryLow => 'Muy Bajo';

  @override
  String durationMinutes(String min) {
    return '$min min';
  }

  @override
  String get durationAllDay => 'Todo el día';

  @override
  String get durationNight => 'Noche';

  @override
  String durationHours(String hours) {
    return '$hours horas';
  }

  @override
  String get onboardingStep1 => 'Ingresa tu información personal';

  @override
  String get onboardingStep2 => 'Comparte tus alturas anteriores';

  @override
  String get onboardingStep3 => 'Evalúa tus hábitos';

  @override
  String get onboardingStep4 => 'Ve tu predicción y puntuación';

  @override
  String get hoursShort => 'h';

  @override
  String get selectLanguage => 'Seleccionar idioma';

  @override
  String get systemLanguage => 'Idioma del sistema';

  @override
  String get emailSubject => 'BeTaller Comentarios';

  @override
  String get pastHeightsTip =>
      'Puedes dejar en blanco las edades que no recuerdes. Ingresar 1-2 alturas pasadas es suficiente.';

  @override
  String get currentSuffix => '(actual)';

  @override
  String personalizedProtein(String amount) {
    return 'Huevos, pollo, pescado, lácteos. Come al menos ${amount}g de proteína al día.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Bebe al menos ${amount}L de agua al día. Esencial para el metabolismo y crecimiento.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'La hormona del crecimiento se libera durante el sueño. Duerme al menos $hours horas. 22:00-06:00 son horas doradas.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Consume leche, queso, yogur. 15 min de sol. Meta calórica diaria: $calories kcal.';
  }

  @override
  String get scoreS => '¡Excelente! Estás alcanzando la cima de tu potencial.';

  @override
  String get scoreA => '¡Vas genial! Pequeñas mejoras te llevarán a la cima.';

  @override
  String get scoreB =>
      'Vas por buen camino. Enfócate un poco más en rutinas y nutrición.';

  @override
  String get scoreC =>
      'Hay margen de mejora. Las rutinas regulares harán la diferencia.';

  @override
  String get scoreD => 'Alto potencial pero necesitas pasar a la acción.';

  @override
  String get scoreF =>
      '¡Empieza ahora! Un pequeño paso cada día hace una gran diferencia.';

  @override
  String get cmPerYear => 'cm/año';

  @override
  String get howToDoIt => 'Cómo hacerlo';

  @override
  String get musclesTargeted => 'Músculos y huesos trabajados';

  @override
  String get scientificBasis => 'Base científica';

  @override
  String setXofY(String current, String total) {
    return 'Serie $current de $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Descanso antes de la serie $set';
  }

  @override
  String get allSetsComplete => '¡Todas las series completadas!';

  @override
  String get setTimer => 'Temporizador de serie';

  @override
  String get setTracker => 'Seguimiento de series';

  @override
  String get builtInTimer => 'Temporizador integrado';

  @override
  String get markComplete => 'Marcar completado';

  @override
  String get markIncomplete => 'Marcar incompleto';

  @override
  String get done => 'Hecho';

  @override
  String get doneExclamation => '¡Hecho!';

  @override
  String get start => 'Iniciar';

  @override
  String get pause => 'Pausar';

  @override
  String get resetTimer => 'Reiniciar';

  @override
  String get skipRest => 'Saltar descanso';

  @override
  String get restart => 'Reiniciar';

  @override
  String get perSet => 'por serie';

  @override
  String get rest => 'DESCANSO';

  @override
  String get reps => 'reps';

  @override
  String get difficultyBeginner => 'Principiante';

  @override
  String get difficultyIntermediate => 'Intermedio';

  @override
  String get difficultyAdvanced => 'Avanzado';

  @override
  String get learnTitle => 'Aprender';

  @override
  String get learnSubtitle => 'Conocimiento científico para el crecimiento';

  @override
  String get categoryAll => 'Todos';

  @override
  String get categoryScience => 'Ciencia';

  @override
  String get categoryNutrition => 'Nutrición';

  @override
  String get categoryExercise => 'Ejercicio';

  @override
  String get categorySleep => 'Sueño';

  @override
  String get categoryMyths => 'Mitos';

  @override
  String get scientificReferences => 'Referencias científicas';

  @override
  String get relatedRoutines => 'Rutinas relacionadas';

  @override
  String get nutritionTitle => 'Nutrición';

  @override
  String get sectionMealPlan => 'Plan de comidas';

  @override
  String get sectionNutrients => 'Nutrientes';

  @override
  String get sectionFoods => 'Alimentos';

  @override
  String todaysPlan(String day) {
    return 'Plan de hoy — $day';
  }

  @override
  String get breakfast => 'Desayuno';

  @override
  String get lunch => 'Almuerzo';

  @override
  String get dinner => 'Cena';

  @override
  String get snacks => 'Meriendas';

  @override
  String get searchFoods => 'Buscar alimentos...';

  @override
  String nFoods(String count) {
    return '$count alimentos';
  }

  @override
  String dailyLabel(String amount) {
    return 'Diario: $amount';
  }

  @override
  String get dailyNeedByAge => 'NECESIDAD DIARIA POR EDAD';

  @override
  String agePrefix(String range) {
    return 'Edad $range';
  }

  @override
  String get topFoodSources => 'PRINCIPALES FUENTES ALIMENTARIAS';

  @override
  String get categoryDairy => 'Lácteos';

  @override
  String get categoryMeatFish => 'Carne y pescado';

  @override
  String get categoryVegetables => 'Verduras';

  @override
  String get categoryFruits => 'Frutas';

  @override
  String get categoryGrains => 'Cereales y legumbres';

  @override
  String get categoryNutsSeeds => 'Frutos secos y semillas';

  @override
  String get weeklyReportTitle => 'Informe semanal';

  @override
  String get overview => 'Resumen';

  @override
  String get routinesLabel => 'Rutinas';

  @override
  String get streakLabel => 'Racha';

  @override
  String get heightLabel => 'Altura';

  @override
  String get dailyScores => 'Puntuaciones diarias';

  @override
  String get waterToday2 => 'Agua hoy';

  @override
  String get sleepToday => 'Sueño hoy';

  @override
  String get routineCompletion => 'Completado de rutinas';

  @override
  String get xpAndLevel => 'XP y nivel';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP para el siguiente nivel';
  }

  @override
  String get activeChallenges => 'Desafíos activos';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m completados';
  }

  @override
  String get shareYourProgress => 'Comparte tu progreso';

  @override
  String get shareComingSoon => '¡Función de compartir próximamente!';

  @override
  String get premiumTest => 'Premium (Test)';

  @override
  String get premiumActive => 'Activo';

  @override
  String get premiumFree => 'Gratis';

  @override
  String get weeklyReportMenu => 'Informe semanal';

  @override
  String get weeklyReportMenuSubtitle => 'Tu resumen de progreso';

  @override
  String get unlockGrowthPotential =>
      'Desbloquea todo tu potencial de crecimiento';

  @override
  String get featureGrowthAnalysis => 'Análisis de crecimiento y puntuación';

  @override
  String get featureHeightPrediction => 'Predicción y pronóstico de altura';

  @override
  String get featureAllRoutines => 'Las 14 rutinas diarias';

  @override
  String get featureWaterSleep => 'Seguimiento de agua y sueño';

  @override
  String get featureProgress => 'Progreso y mediciones';

  @override
  String get featureAchievements => 'Logros y rachas';

  @override
  String get planMonthly => 'Mensual';

  @override
  String get planYearly => 'Anual';

  @override
  String get bestValue => 'MEJOR OFERTA';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'NIV $level';
  }

  @override
  String get levelBeginner => 'Principiante';

  @override
  String get levelStarter => 'Iniciado';

  @override
  String get levelCommitted => 'Comprometido';

  @override
  String get levelDedicated => 'Dedicado';

  @override
  String get levelConsistent => 'Constante';

  @override
  String get levelFocused => 'Enfocado';

  @override
  String get levelDetermined => 'Determinado';

  @override
  String get levelDisciplined => 'Disciplinado';

  @override
  String get levelStrong => 'Fuerte';

  @override
  String get levelAdvanced => 'Avanzado';

  @override
  String get levelExpert => 'Experto';

  @override
  String get levelMaster => 'Maestro';

  @override
  String get levelElite => 'Élite';

  @override
  String get levelChampion => 'Campeón';

  @override
  String get levelLegend => 'Leyenda';

  @override
  String get levelTitan => 'Titán';

  @override
  String get levelMythic => 'Mítico';

  @override
  String get levelImmortal => 'Inmortal';

  @override
  String get levelTranscendent => 'Trascendente';

  @override
  String get levelUltimate => 'Supremo';

  @override
  String get challengeCompleteAllRoutines => 'Completar todas las rutinas';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Terminar cada rutina hoy';

  @override
  String get challengeHydrationHero => 'Héroe de hidratación';

  @override
  String get challengeHydrationHeroDesc => 'Alcanzar tu meta diaria de agua';

  @override
  String get challengeEarlySleeper => 'Dormilón temprano';

  @override
  String get challengeEarlySleeperDesc => 'Registrar 8+ horas de sueño';

  @override
  String get challengeExerciseTrio => 'Trío de ejercicios';

  @override
  String get challengeExerciseTrioDesc => 'Completar 3 rutinas de ejercicio';

  @override
  String get challengeMorningStretch => 'Estiramiento matutino';

  @override
  String get challengeMorningStretchDesc => 'Estirar antes de las 9 AM';

  @override
  String get challenge7DayWarrior => 'Guerrero de 7 días';

  @override
  String get challenge7DayWarriorDesc =>
      'Completar todas las rutinas durante 7 días consecutivos';

  @override
  String get challengeGrowthTracker => 'Rastreador de crecimiento';

  @override
  String get challengeGrowthTrackerDesc =>
      'Registrar una medición de altura esta semana';

  @override
  String get challengeHydrationWeek => 'Semana de hidratación';

  @override
  String get challengeHydrationWeekDesc =>
      'Alcanzar la meta de agua 5 días esta semana';

  @override
  String get challengeFitnessChampion => 'Campeón de fitness';

  @override
  String get challengeFitnessChampionDesc =>
      'Completar 15 rutinas de ejercicio esta semana';

  @override
  String get challengeSleepMaster => 'Maestro del sueño';

  @override
  String get challengeSleepMasterDesc =>
      'Registrar 8+ horas de sueño durante 5 días';
}
