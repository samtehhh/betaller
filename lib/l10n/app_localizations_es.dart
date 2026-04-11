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
  String get noData => 'SIN DATOS';

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

  @override
  String get performanceDashboard => 'PANEL DE RENDIMIENTO';

  @override
  String get tierA => 'NIVEL A';

  @override
  String get tierB => 'NIVEL B';

  @override
  String get tierC => 'NIVEL C';

  @override
  String get tierD => 'NIVEL D';

  @override
  String get tierE => 'NIVEL E';

  @override
  String get maxTierReached => 'NIVEL MÁXIMO ALCANZADO';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Siguiente: $tier · +$pts pts necesarios';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Gestionar rutinas';

  @override
  String get manageRoutinesSubtitle =>
      'Mostrar u ocultar rutinas de tu lista diaria';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible de $total activas';
  }

  @override
  String get showAll => 'Mostrar todo';

  @override
  String get hideAll => 'Ocultar todo';

  @override
  String get heightAnalysis => 'Análisis de Altura';

  @override
  String get heightVsPopulation => 'Tu Posición en la Población Mundial';

  @override
  String get globalAveragesTable => 'Promedios Globales por Edad';

  @override
  String get standingTall => 'Estatura Alta';

  @override
  String get standingAboveAverage => 'Por Encima del Promedio';

  @override
  String get standingBelowAverage => 'Por Debajo del Promedio';

  @override
  String get standingShort => 'Por Debajo de los Compañeros';

  @override
  String get yourHeightStanding => 'TU POSICIÓN DE ALTURA';

  @override
  String get yourHeight => 'Tú';

  @override
  String peerAvg(int age) {
    return 'Prom. edad $age';
  }

  @override
  String get aboveAvg => 'Sobre prom.';

  @override
  String get belowAvg => 'Bajo prom.';

  @override
  String get whoDataSource => 'Referencia Global OMS 2007';

  @override
  String get percentileShort5 => 'P5';

  @override
  String get percentileShort50 => 'P50';

  @override
  String get percentileShort95 => 'P95';

  @override
  String get youLabel => 'Tú';

  @override
  String get avgHeightLabel => 'PROM';

  @override
  String get percentileLabel => 'PCT';

  @override
  String get diffLabel => 'DIFE';

  @override
  String get whoSourceNote =>
      'Fuente: Referencia de crecimiento OMS 2007 y estimaciones mundiales NCD-RisC. Los percentiles son promedios globales y pueden variar según el país.';

  @override
  String get quickPhotos => 'Fotos';

  @override
  String get quickPosture => 'Postura';

  @override
  String get quickWellness => 'Bienestar';

  @override
  String get quickRecipes => 'Recetas';

  @override
  String get wellnessTitle => 'Seguimiento de Bienestar';

  @override
  String get wellnessHeader => 'BIENESTAR';

  @override
  String get wellnessSubtitle =>
      'Sigue los factores que afectan tu crecimiento';

  @override
  String get caffeineToday => 'Cafeína hoy';

  @override
  String get withinLimits => 'Dentro de límites saludables';

  @override
  String get approachingLimit => 'Acercándose al límite';

  @override
  String get overLimit => 'Sobre el límite — afecta la HGH';

  @override
  String get resetToday => 'Reiniciar hoy';

  @override
  String get stressToday => 'Estrés hoy';

  @override
  String get stressVeryCalmLabel => 'Muy tranquilo — óptimo para crecer';

  @override
  String get stressCalmLabel => 'Tranquilo';

  @override
  String get stressNeutralLabel => 'Neutral';

  @override
  String get stressStressedLabel => 'Estresado';

  @override
  String get stressVeryStressedLabel =>
      'Muy estresado — el cortisol bloquea la HGH';

  @override
  String get stressTapToLog => 'Toca para registrar cómo te sientes';

  @override
  String get todaysJournal => 'Diario de hoy';

  @override
  String get journalNoNote => '(sin nota)';

  @override
  String get journalEdit => 'Editar';

  @override
  String get journalHowWasToday => '¿Cómo fue tu día?';

  @override
  String get journalSaved => 'Diario guardado · +5 XP';

  @override
  String get journalSaveEntry => 'Guardar';

  @override
  String get weeklyInsight => 'Análisis semanal';

  @override
  String get weeklyInsightCaffeine => 'CAFEÍNA';

  @override
  String get weeklyInsightStress => 'ESTRÉS';

  @override
  String get weeklyInsightMood => 'ÁNIMO';

  @override
  String get wellnessInfoTitle => 'Por qué importa el bienestar';

  @override
  String get wellnessInfoBody =>
      'La cafeína interfiere con el sueño profundo, cuando se libera la mayor parte de la hormona del crecimiento (HGH). El estrés crónico eleva el cortisol, que suprime directamente la HGH. Llevar un diario te ayuda a mantener hábitos que apoyan el crecimiento.';

  @override
  String get wellnessInfoGotIt => 'Entendido';

  @override
  String get insightCaffeineHigh =>
      'Tu cafeína está alta esta semana. Intenta reducir para mejor sueño y HGH.';

  @override
  String get insightStressHigh =>
      'El estrés está elevado esta semana. Considera ejercicios de respiración — el cortisol bloquea el crecimiento.';

  @override
  String get insightMoodLow =>
      'El ánimo ha estado bajo últimamente. La luz solar, el sueño y el ejercicio suave ayudan.';

  @override
  String get insightGreat =>
      'Gran equilibrio esta semana. Tu bienestar apoya un crecimiento óptimo.';

  @override
  String get insightDefault =>
      'Tu bienestar va por buen camino. Sigue registrando para análisis más profundos.';

  @override
  String get insightNeedMoreData => 'Registra unos días más para ver análisis.';

  @override
  String get progressPhotosTitle => 'Fotos de progreso';

  @override
  String get progressPhotosHeader => 'FOTOS DE PROGRESO';

  @override
  String get progressPhotosSubtitle => 'Sigue tu recorrido visual';

  @override
  String get addProgressPhoto => 'Añadir foto';

  @override
  String get captureJourney => 'Captura tu recorrido visual';

  @override
  String get takePhoto => 'Tomar foto';

  @override
  String get chooseFromLibrary => 'Elegir de la galería';

  @override
  String get deletePhotoTitle => '¿Eliminar foto?';

  @override
  String get deletePhotoBody =>
      'Esta foto se eliminará de tu línea de progreso.';

  @override
  String get timelineTab => 'Línea temporal';

  @override
  String photoLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'fotos',
      one: 'foto',
    );
    return '$_temp0';
  }

  @override
  String dayLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'días',
      one: 'día',
    );
    return '$_temp0';
  }

  @override
  String get cmGained => 'cm ganados';

  @override
  String get firstPhotoMessage =>
      'Toma tu primera foto para empezar a seguir tu progreso visual.';

  @override
  String get takeFirstPhoto => 'Primera foto';

  @override
  String get beforeAfter => 'ANTES / DESPUÉS';

  @override
  String get beforeLabel => 'ANTES';

  @override
  String get afterLabel => 'DESPUÉS';

  @override
  String get yourHeightDialog => 'Tu altura';

  @override
  String get heightDialogMessage =>
      'Introduce tu altura actual en cm para esta foto';

  @override
  String get postureAnalysisTitle => 'Análisis postural';

  @override
  String get postureCoachHeader => 'COACH DE POSTURA';

  @override
  String get postureCoachSubtitle => 'Puntuación postural con IA';

  @override
  String get latestScore => 'ÚLTIMA PUNTUACIÓN';

  @override
  String get latestAnalysis => 'ÚLTIMO ANÁLISIS';

  @override
  String get headPosition => 'Posición de la cabeza';

  @override
  String get progressLabel => 'PROGRESO';

  @override
  String get choosePhotoSource => 'Elegir fuente de foto';

  @override
  String get sideProfileHint => 'Perfil lateral, cuerpo completo en el cuadro';

  @override
  String get howToTakePhoto => 'CÓMO TOMAR LA FOTO';

  @override
  String get takePosturePhoto => 'Foto de postura';

  @override
  String get postureExcellent => 'Excelente';

  @override
  String get postureGood => 'Bueno';

  @override
  String get postureNeedsWork => 'Necesita mejorar';

  @override
  String get posturePoor => 'Pobre';

  @override
  String get recommendedExercises => 'EJERCICIOS RECOMENDADOS';

  @override
  String get postureWallStand => 'Postura en la pared';

  @override
  String get postureWallStandDesc =>
      'Ponte de espaldas contra la pared 2 minutos al día.';

  @override
  String get postureChestOpener => 'Apertura de pecho';

  @override
  String get postureChestOpenerDesc =>
      'Abre los pectorales tensos que tiran los hombros hacia adelante.';

  @override
  String get postureChinTucks => 'Retracción de mentón';

  @override
  String get postureChinTucksDesc =>
      'Corrige la postura de cabeza adelantada — 3×10 repeticiones.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Fortalece el core profundo para control de la lordosis.';

  @override
  String get recipesTitle => 'Recetas';

  @override
  String get recipesHeader => 'RECETAS';

  @override
  String get recipesSubtitle => 'Alimenta tu crecimiento';

  @override
  String get recipesCategoryAll => 'Todas';

  @override
  String get recipesCategoryBreakfast => 'Desayuno';

  @override
  String get recipesCategoryLunch => 'Almuerzo';

  @override
  String get recipesCategoryDinner => 'Cena';

  @override
  String get recipesCategorySnack => 'Merienda';

  @override
  String get recipesGoalAll => 'Todos';

  @override
  String get recipesGoalProtein => 'Alto en proteína';

  @override
  String get recipesGoalCalcium => 'Calcio';

  @override
  String get recipesGoalOmega3 => 'Omega-3';

  @override
  String get recipesGoalIron => 'Hierro';

  @override
  String get recipesNoMatch => 'Ninguna receta coincide con estos filtros';

  @override
  String get recipesIngredients => 'Ingredientes';

  @override
  String get recipesInstructions => 'Instrucciones';

  @override
  String get recipesClose => 'CERRAR';

  @override
  String get recipesAboutTitle => 'Acerca de las recetas';

  @override
  String get recipesAboutBody =>
      'Recetas seleccionadas para alimentar tu crecimiento. Filtra por tipo de comida u objetivo nutricional para encontrar la mejor opción.';

  @override
  String get animHintSpinalDecomp => 'Descompresión espinal';

  @override
  String get animHintGravityReversal => 'Reversión de gravedad';

  @override
  String get animHintImpactBones => 'Carga de impacto óseo';

  @override
  String get animHintHighImpact => 'Carga ósea de alto impacto';

  @override
  String get animHintMetabolicBurst => 'Entrenamiento metabólico intenso';

  @override
  String get animHintFullBodyStretch => 'Estiramiento corporal de despertar';

  @override
  String get animHintSpinalExtension => 'Extensión espinal';

  @override
  String get animHintCervicalDecomp => 'Descompresión cervical';

  @override
  String get animHintShoulderMobility => 'Movilidad de hombros';

  @override
  String get animHintFullBodyMotion => 'Movimiento corporal completo';

  @override
  String get animHintPosteriorChain => 'Estiramiento cadena posterior';

  @override
  String get animHintMuscleGrowth => 'Combustible de crecimiento muscular';

  @override
  String get animHintBoneDensity => 'Soporte de densidad ósea';

  @override
  String get animHintSpinalDisc => 'Hidratación de discos espinales';

  @override
  String get animHintCleanNutrition => 'Nutrición limpia';

  @override
  String get animHintIgf1 => 'Optimización IGF-1';

  @override
  String get animHintHghAmino => 'Precursor amino HGH';

  @override
  String get animHintCalciumAbsorption => 'Absorción de calcio';

  @override
  String get animHintSpinalAlignment => 'Alineación espinal';

  @override
  String get animHintPostureCorrection => 'Corrección postural';

  @override
  String get animHintMindBody => 'Equilibrio mente-cuerpo';

  @override
  String get animHintCoreStability => 'Estabilidad del core';

  @override
  String get animHintLegPower => 'Potencia de piernas y pico de HGH';

  @override
  String get animHintVerticalPower => 'Potencia vertical';

  @override
  String get animHintHghSurge => 'Entrenamiento pico HGH';

  @override
  String get animHintPeakHgh => 'Ventana de liberación máxima de HGH';

  @override
  String get animHintMelatonin => 'Optimización de melatonina';

  @override
  String get animHintDeepSleep => 'Configuración de sueño profundo';

  @override
  String get animHintSleepOpt => 'Optimización del sueño';

  @override
  String get animHintExercise => 'Ejercicio';

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
  String get muscleSpine => 'Columna';

  @override
  String get muscleLegs => 'Piernas';

  @override
  String get muscleBack => 'Espalda';

  @override
  String get muscleShoulders => 'Hombros';

  @override
  String get muscleArms => 'Brazos';

  @override
  String get muscleCore => 'Abdomen';

  @override
  String get muscleChest => 'Pecho';

  @override
  String get muscleCalves => 'Pantorrillas';

  @override
  String get muscleFullBody => 'Cuerpo entero';

  @override
  String get muscleHips => 'Caderas';

  @override
  String get muscleBones => 'Huesos';

  @override
  String get muscleMuscles => 'Músculos';

  @override
  String get muscleNeck => 'Cuello';

  @override
  String get muscleUpperSpine => 'Columna sup.';

  @override
  String get muscleUpperBack => 'Espalda alta';

  @override
  String get createRoutine => 'Crear rutina';

  @override
  String get createRoutineTitle => 'Crear rutina personalizada';

  @override
  String get createRoutineSubtitle => 'Crea tu propia rutina diaria';

  @override
  String get routineIcon => 'Icono';

  @override
  String get routineTitleField => 'Título';

  @override
  String get routineDescField => 'Descripción';

  @override
  String get routineDescHint => 'Resumen corto de la rutina';

  @override
  String get routineCategoryField => 'Categoría';

  @override
  String get routineDifficultyField => 'Dificultad';

  @override
  String get routineDurationField => 'Duración';

  @override
  String get routineSetsRepsField => 'Series x Repeticiones';

  @override
  String get routineFormField => 'Instrucciones';

  @override
  String get routineFormHint => 'Opcional — cómo realizar esta rutina';

  @override
  String get diffBeginner => 'Principiante';

  @override
  String get diffIntermediate => 'Intermedio';

  @override
  String get diffAdvanced => 'Avanzado';

  @override
  String get catExercise => 'Ejercicio';

  @override
  String get catNutrition => 'Nutrición';

  @override
  String get catSleep => 'Sueño';

  @override
  String get catPosture => 'Postura';

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
}
