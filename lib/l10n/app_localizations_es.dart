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
  String get routineSprintIntervals => 'Sprint Interval Training';

  @override
  String get routineSprintIntervalsDesc =>
      'Sprint interval training triggers significant growth hormone release through high-intensity bursts.';

  @override
  String get routineHiitWorkout => 'HIIT Workout';

  @override
  String get routineHiitWorkoutDesc =>
      'High intensity interval training to maximize growth hormone release.';

  @override
  String get routineSquats => 'Bodyweight Squats';

  @override
  String get routineSquatsDesc =>
      'Bodyweight squats stimulate growth plates in legs and spine.';

  @override
  String get routineDeadliftStretch => 'Deadlift Stretch';

  @override
  String get routineDeadliftStretchDesc =>
      'Deadlift stretch for spinal decompression and vertebral disc health.';

  @override
  String get routineOverheadPress => 'Overhead Press';

  @override
  String get routineOverheadPressDesc =>
      'Overhead pressing stretches the spine and strengthens posture muscles.';

  @override
  String get routineSkippingRope => 'Skipping Rope';

  @override
  String get routineSkippingRopeDesc =>
      'Repetitive jumping with a skipping rope stimulates growth plates in lower extremities.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Pilates core exercises support spinal alignment and posture.';

  @override
  String get routineInversionHang => 'Inversion Hanging';

  @override
  String get routineInversionHangDesc =>
      'Inversion decompresses spinal discs, can temporarily add 1-2cm.';

  @override
  String get routineZincIntake => 'Zinc Rich Foods';

  @override
  String get routineZincIntakeDesc =>
      'Consume zinc-rich foods throughout the day for growth hormone production.';

  @override
  String get routineVitaminDSunlight => 'Vitamin D & Sunlight';

  @override
  String get routineVitaminDSunlightDesc =>
      'Get at least 15 minutes of direct sunlight for Vitamin D synthesis and bone growth.';

  @override
  String get routineArginineFoods => 'Arginine Rich Foods';

  @override
  String get routineArginineFoodsDesc =>
      'Eat arginine-rich foods to stimulate growth hormone secretion.';

  @override
  String get routineSleepEnvironment => 'Optimize Sleep Environment';

  @override
  String get routineSleepEnvironmentDesc =>
      'Create a dark, cool sleeping environment to maximize melatonin and growth hormone release.';

  @override
  String get routinePreSleepRoutine => 'Pre-Sleep Wind Down';

  @override
  String get routinePreSleepRoutineDesc =>
      'A consistent pre-sleep routine improves deep sleep quality by 23%.';

  @override
  String get routineNeckStretches => 'Neck Stretches';

  @override
  String get routineNeckStretchesDesc =>
      'Neck stretches relieve compression and improve cervical alignment.';

  @override
  String get routineShoulderRolls => 'Shoulder Rolls & Opens';

  @override
  String get routineShoulderRollsDesc =>
      'Opening shoulders corrects forward posture, can add 1-2cm in appearance.';

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
  String get durationNight => 'Night';

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
}
