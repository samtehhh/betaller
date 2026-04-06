// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get navHome => 'Início';

  @override
  String get navAnalysis => 'Análise';

  @override
  String get navRoutines => 'Rotinas';

  @override
  String get navProgress => 'Progresso';

  @override
  String get navProfile => 'Perfil';

  @override
  String greeting(String name) {
    return 'Olá, $name';
  }

  @override
  String get currentHeight => 'Altura Atual';

  @override
  String get target => 'Meta';

  @override
  String completed(String pct) {
    return '$pct% concluído';
  }

  @override
  String remaining(String cm) {
    return '+$cm cm restantes';
  }

  @override
  String get updateAnalysis => 'Atualizar Análise';

  @override
  String get analysisSubtitle =>
      'Obtenha previsões a partir de alturas anteriores + hábitos';

  @override
  String get dailyRoutines => 'Rotinas Diárias';

  @override
  String get allRoutinesDone => 'Todas as rotinas concluídas!';

  @override
  String get water => 'Água';

  @override
  String get sleep => 'Sono';

  @override
  String get growthSummary => 'Resumo de Crescimento';

  @override
  String get total => 'TOTAL';

  @override
  String get last => 'ÚLTIMO';

  @override
  String get measurement => 'MED.';

  @override
  String get dailyTip => 'Dica do Dia';

  @override
  String get waterTracking => 'Acompanhamento de Água';

  @override
  String waterToday(String amount) {
    return 'Hoje: $amount L';
  }

  @override
  String get sleepTracking => 'Acompanhamento de Sono';

  @override
  String sleepTarget(String hours) {
    return 'Meta: $hours horas';
  }

  @override
  String get hours => 'horas';

  @override
  String get save => 'Salvar';

  @override
  String get cancel => 'Cancelar';

  @override
  String get analysis => 'Análise';

  @override
  String get betallerScore => 'Pontuação BeTaller';

  @override
  String get genetic => 'Genético';

  @override
  String get growth => 'Crescimento';

  @override
  String get nutrition => 'Nutrição';

  @override
  String get sleepLabel => 'Sono';

  @override
  String get discipline => 'Disciplina';

  @override
  String get improveScore => 'Melhore Sua Pontuação';

  @override
  String gradeProgress(String current, String next) {
    return '$current → $next';
  }

  @override
  String get nutritionCritical => 'Nutrição Crítica!';

  @override
  String get nutritionStrengthen => 'Fortalecer Nutrição';

  @override
  String get sleepRecordAdd => 'Adicionar Registro de Sono';

  @override
  String get sleepPoor => 'Horário de Sono Ruim';

  @override
  String get sleepImprove => 'Melhorar Sono';

  @override
  String get startToday => 'Comece Hoje!';

  @override
  String routinesRemaining(int count) {
    return '$count Rotinas Restantes';
  }

  @override
  String get keepStreak => 'Mantenha a Sequência';

  @override
  String get addFirstMeasurement => 'Adicionar Primeira Medição';

  @override
  String get addMeasurement => 'Adicionar Medição';

  @override
  String waterHalfNotReached(String amount) {
    return 'Você não atingiu metade da sua meta de água hoje. Beba mais ${amount}L.';
  }

  @override
  String waterAlmostDone(String amount) {
    return 'Faltam ${amount}L para atingir a meta de água. Quase lá!';
  }

  @override
  String bmiLow(String bmi) {
    return 'Seu IMC é $bmi — um pouco baixo. Aumente a ingestão de proteínas e calorias.';
  }

  @override
  String bmiHigh(String bmi) {
    return 'Seu IMC é $bmi — um pouco alto. Foque em alimentação saudável.';
  }

  @override
  String get nutritionDefault =>
      'Complete sua meta de água e mantenha uma nutrição equilibrada.';

  @override
  String sleepNoRecord(String hours) {
    return 'Sem registro de sono hoje. Mire em $hours horas e registre.';
  }

  @override
  String sleepInsufficient(String current, String missing) {
    return 'Você dormiu $current horas hoje — faltaram $missing horas. Vá dormir mais cedo!';
  }

  @override
  String sleepAlmost(String hours) {
    return 'Quase lá. Atingir $hours horas maximizará o hormônio do crescimento.';
  }

  @override
  String get sleepGood => 'Ótimo horário de sono! Continue assim.';

  @override
  String noRoutinesDone(int total) {
    return 'Nenhuma rotina concluída hoje. Comece com uma das $total!';
  }

  @override
  String routinesPartial(int done, int total, int left) {
    return '$done/$total rotinas feitas hoje. Faltam $left!';
  }

  @override
  String streakBuilding(int needed) {
    return 'Ótimo trabalho hoje! Mais $needed dias para iniciar uma sequência.';
  }

  @override
  String streakContinue(int days) {
    return 'Sequência de $days dias! Sua pontuação sobe enquanto você continua.';
  }

  @override
  String get noMeasurements =>
      'Nenhuma medição de altura ainda. Adicione a primeira para previsões precisas.';

  @override
  String fewMeasurements(int count) {
    return 'Adicione mais $count medições para calcular a velocidade de crescimento.';
  }

  @override
  String goodMeasurements(int count) {
    return 'Você tem $count medições. Chegar a 5 melhorará muito a precisão.';
  }

  @override
  String get keepMeasuring =>
      'Continue adicionando medições. Cada novo dado melhora as previsões.';

  @override
  String get heightPrediction => 'Previsão de Altura';

  @override
  String get predictedHeightAt21 => 'Altura prevista aos 21';

  @override
  String get predictionMethod =>
      'Calculado combinando dados genéticos (pais), velocidade de crescimento, IMC e idade.';

  @override
  String get growthStatus => 'Status de Crescimento';

  @override
  String get completionLabel => 'CONCLUSÃO';

  @override
  String get growthVelocity => 'VELOCIDADE DE CRESCIMENTO';

  @override
  String get noData => 'Sem dados';

  @override
  String growthRate(String rating) {
    return 'Taxa de crescimento: $rating';
  }

  @override
  String get bmi => 'IMC';

  @override
  String get calories => 'Calorias';

  @override
  String get kcalDay => 'kcal/dia';

  @override
  String get daily => 'diário';

  @override
  String get protein => 'Proteína';

  @override
  String get minimum => 'mínimo';

  @override
  String get age => 'Idade';

  @override
  String get male => 'Masculino';

  @override
  String get female => 'Feminino';

  @override
  String get yearlyPrediction => 'PREVISÃO ANUAL';

  @override
  String ageYear(int age) {
    return '$age anos';
  }

  @override
  String get progressTitle => 'Acompanhamento de Progresso';

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
      'São necessárias pelo menos 2 medições para o gráfico';

  @override
  String get chartInstruction =>
      'Adicione medições para ver seu gráfico de progresso!';

  @override
  String get addMeasurementButton => 'ADICIONAR NOVA MEDIÇÃO';

  @override
  String get measurementHistory => 'HISTÓRICO DE MEDIÇÕES';

  @override
  String get deleteTitle => 'Excluir Medição';

  @override
  String get deleteMessage => 'Tem certeza de que deseja excluir esta medição?';

  @override
  String get dismiss => 'Cancelar';

  @override
  String get delete => 'Excluir';

  @override
  String get newMeasurement => 'Nova Medição de Altura';

  @override
  String get routines => 'Rotinas';

  @override
  String streakDays(int days) {
    return '$days Dias';
  }

  @override
  String get progressStatus => 'Status de Progresso';

  @override
  String get completedLabel => 'Concluído!';

  @override
  String get all => 'Todos';

  @override
  String get exercise => 'Exercício';

  @override
  String get posture => 'Postura';

  @override
  String bestStreak(int days) {
    return 'Melhor: $days dias';
  }

  @override
  String get editProfile => 'Editar Perfil';

  @override
  String get editProfileSubtitle =>
      'Atualize informações de altura, peso e idade';

  @override
  String get name => 'Nome';

  @override
  String birthDate(String date) {
    return 'Nascimento: $date';
  }

  @override
  String get heightCm => 'Altura (cm)';

  @override
  String get weightKg => 'Peso (kg)';

  @override
  String get fatherHeight => 'Altura do Pai (cm)';

  @override
  String get motherHeight => 'Altura da Mãe (cm)';

  @override
  String get notifications => 'Notificações';

  @override
  String get notificationsOn => 'Lembretes ativos';

  @override
  String get notificationsOff => 'Lembretes desativados';

  @override
  String get premium => 'Atualizar para Premium';

  @override
  String get premiumSubtitle => 'Desbloqueie todos os recursos';

  @override
  String get rateUs => 'Avalie-nos';

  @override
  String get rateSubtitle => 'Gostando do app? Dê-nos 5 estrelas!';

  @override
  String get share => 'Compartilhar App';

  @override
  String get shareSubtitle => 'Conte aos seus amigos sobre o BeTaller';

  @override
  String get shareText =>
      'Descobri meu potencial de crescimento com o BeTaller! Experimente também: https://play.google.com/store/apps/details?id=com.glowup.boyuzatma_app';

  @override
  String get feedback => 'Enviar Feedback';

  @override
  String get feedbackSubtitle => 'Entre em contato conosco';

  @override
  String get resetData => 'Redefinir Todos os Dados';

  @override
  String get resetSubtitle => 'Todos os dados serão excluídos';

  @override
  String get resetTitle => 'Redefinir Dados';

  @override
  String get resetMessage =>
      'Todos os dados serão excluídos e você voltará à tela de introdução. Isso não pode ser desfeito!';

  @override
  String get reset => 'Redefinir';

  @override
  String get premiumSoon => 'Premium em breve!';

  @override
  String get brandingSubtitle => 'Descubra seu potencial de crescimento';

  @override
  String get statistics => 'Estatísticas';

  @override
  String get currentStreak => 'Sequência Atual';

  @override
  String get bestStreakLabel => 'Melhor Sequência';

  @override
  String get achievementLabel => 'Conquista';

  @override
  String get achievements => 'Conquistas';

  @override
  String get earned => 'Conquistado!';

  @override
  String get notEarned => 'Ainda não conquistado';

  @override
  String get ok => 'OK';

  @override
  String get language => 'Idioma';

  @override
  String get languageSubtitle => 'Alterar idioma do app';

  @override
  String get onboardingTitle => 'BeTaller';

  @override
  String get onboardingSubtitle => 'Descubra seu potencial de crescimento';

  @override
  String get onboardingMeetYou => 'Vamos Nos Conhecer';

  @override
  String get onboardingInfoNeeded =>
      'Informações básicas necessárias para a análise.';

  @override
  String get gender => 'SEXO';

  @override
  String get birthDateLabel => 'DATA DE NASCIMENTO';

  @override
  String get bodyMeasurements => 'Medidas Corporais';

  @override
  String get bodyInfo =>
      'Sua altura e peso atuais são necessários para a análise.';

  @override
  String get geneticData => 'Dados Genéticos';

  @override
  String get geneticInfo =>
      'A altura dos pais determina seu potencial genético.';

  @override
  String get pastHeights => 'Alturas Anteriores';

  @override
  String get pastHeightsInfo =>
      'Insira as alturas que você lembra em diferentes idades. Pode deixar em branco.';

  @override
  String get heightHint => 'Insira a altura...';

  @override
  String get ageLabel => 'idade';

  @override
  String get habits => 'Seus Hábitos';

  @override
  String get habitsInfo => 'Seu estilo de vida afeta diretamente as previsões.';

  @override
  String get weeklyExercise => 'Exercício Semanal';

  @override
  String get dailySleep => 'Sono Diário';

  @override
  String get nutritionQuality => 'QUALIDADE NUTRICIONAL';

  @override
  String get nutritionDesc =>
      'Ingestão de proteínas, laticínios, vegetais e frutas';

  @override
  String get nutritionBad => 'Ruim';

  @override
  String get nutritionPoor => 'Fraca';

  @override
  String get nutritionMedium => 'Média';

  @override
  String get nutritionGood => 'Boa';

  @override
  String get nutritionGreat => 'Ótima';

  @override
  String get startAnalysis => 'Iniciar Análise';

  @override
  String get continueBtn => 'Continuar';

  @override
  String get analyzeBtn => 'Analisar';

  @override
  String get analyzing => 'Analisando';

  @override
  String get analysisComplete => 'Concluído!';

  @override
  String get yourScore => 'Sua Pontuação BeTaller';

  @override
  String get letsStart => 'Vamos Começar';

  @override
  String get doneBtn => 'Pronto';

  @override
  String get analysisStep1 => 'Analisando dados genéticos...';

  @override
  String get analysisStep2 => 'Calculando velocidade de crescimento...';

  @override
  String get analysisStep3 => 'Processando dados de nutrição e sono...';

  @override
  String get analysisStep4 => 'Gerando previsão de altura...';

  @override
  String get analysisStep5 => 'Calculando pontuação BeTaller...';

  @override
  String growthPotential(String cm) {
    return '+$cm cm de potencial de crescimento';
  }

  @override
  String get heightAt21 => 'aos 21 anos';

  @override
  String confidenceLevel(String pct) {
    return '$pct% nível de confiança';
  }

  @override
  String heightRange(String min, String max) {
    return 'Faixa de $min - $max cm';
  }

  @override
  String get currentLabel => 'ATUAL';

  @override
  String get predictedLabel => 'PREVISTO';

  @override
  String get yearlyPredictions => 'Previsões Anuais';

  @override
  String get tipMorningMeasure =>
      'Meça a altura de manhã - a pressão nos discos causa perda de altura durante o dia. A medição mais precisa é pela manhã.';

  @override
  String get tipProteinSpread =>
      'Distribua a ingestão de proteínas entre as refeições. Não coma tudo de uma vez, inclua proteínas em cada refeição.';

  @override
  String get tipGrowthHormone =>
      'O hormônio do crescimento atinge o pico durante o sono. Esteja dormindo entre 22h e 2h!';

  @override
  String get tipVitaminD =>
      '15 minutos de exposição solar diária aumentam a produção de vitamina D. A vitamina D é essencial para a absorção de cálcio.';

  @override
  String get tipBarHanging =>
      'Pendurar-se na barra descomprime a coluna. Tente 3x30 segundos por dia.';

  @override
  String get tipSwimming =>
      'A natação é o melhor esporte para treino completo e apoio ao crescimento em altura.';

  @override
  String get tipStress =>
      'O estresse suprime o hormônio do crescimento. Reduza o estresse com meditação e yoga.';

  @override
  String get routineMorningStretch => 'Alongamento Matinal';

  @override
  String get routineMorningStretchDesc =>
      'Faça 10 minutos de alongamento ao acordar. Alongue a coluna e os músculos das pernas.';

  @override
  String get routineBarHanging => 'Pendurar na Barra';

  @override
  String get routineBarHangingDesc =>
      'Pendure-se em uma barra de flexão para estender a coluna. 3 séries x 30 segundos.';

  @override
  String get routineCobraStretch => 'Alongamento Cobra';

  @override
  String get routineCobraStretchDesc =>
      'Deite de bruços e levante o tronco. Alongue a coluna. 3 séries x 15 segundos.';

  @override
  String get routineJumping => 'Exercícios de Salto';

  @override
  String get routineJumpingDesc =>
      'Pular corda ou agachamento com salto. Estimula as placas de crescimento. 3 séries x 20 repetições.';

  @override
  String get routineSwimming => 'Natação ou Basquete';

  @override
  String get routineSwimmingDesc =>
      'Pratique um esporte que favoreça o crescimento. Pelo menos 30 minutos.';

  @override
  String get routineYoga => 'Yoga e Alongamento Noturno';

  @override
  String get routineYogaDesc =>
      'Rotina de yoga e alongamento antes de dormir. Libere o estresse, relaxe os músculos.';

  @override
  String get routineProtein => 'Ingestão de Proteínas';

  @override
  String get routineProteinDesc =>
      'Ovos, frango, peixe, laticínios. Pelo menos 1,5g/kg de proteína por dia.';

  @override
  String get routineCalcium => 'Cálcio e Vitamina D';

  @override
  String get routineCalciumDesc =>
      'Consuma leite, queijo, iogurte. Tome sol 15 min. Essencial para o desenvolvimento ósseo.';

  @override
  String get routineWater => 'Meta de Ingestão de Água';

  @override
  String get routineWaterDesc =>
      'Beba pelo menos 2-3 litros de água por dia. Essencial para o metabolismo e o crescimento.';

  @override
  String get routineAvoidJunk => 'Evitar Junk Food';

  @override
  String get routineAvoidJunkDesc =>
      'Fique longe de fast food, bebidas açucaradas e alimentos processados.';

  @override
  String get routineSleep => 'Sono de Qualidade (8-10 hrs)';

  @override
  String get routineSleepDesc =>
      'O hormônio do crescimento é liberado durante o sono. 22h-6h são as horas de ouro.';

  @override
  String get routineNoScreen => 'Pausa de Telas Antes de Dormir';

  @override
  String get routineNoScreenDesc =>
      'Guarde o celular e o computador 1 hora antes de dormir. Não bloqueie a produção de melatonina.';

  @override
  String get routinePosture => 'Verificação de Postura';

  @override
  String get routinePostureDesc =>
      'Mantenha as costas retas, ombros para trás. Verifique a cada hora. Boa postura = 2-3 cm de diferença.';

  @override
  String get routineWallStand => 'Exercício na Parede';

  @override
  String get routineWallStandDesc =>
      'Encoste-se na parede: calcanhares, quadris, ombros e cabeça encostados. Mantenha por 5 min.';

  @override
  String get routineSprintIntervals => 'Intervalos de Sprint';

  @override
  String get routineSprintIntervalsDesc =>
      'O treino de intervalos de sprint desencadeia uma liberação significativa de hormônio do crescimento por meio de explosões de alta intensidade.';

  @override
  String get routineHiitWorkout => 'Treino HIIT';

  @override
  String get routineHiitWorkoutDesc =>
      'Treino intervalado de alta intensidade para maximizar a liberação de hormônio do crescimento.';

  @override
  String get routineSquats => 'Agachamentos com Peso Corporal';

  @override
  String get routineSquatsDesc =>
      'Agachamentos com peso corporal estimulam as placas de crescimento nas pernas e coluna.';

  @override
  String get routineDeadliftStretch => 'Alongamento Deadlift';

  @override
  String get routineDeadliftStretchDesc =>
      'Alongamento deadlift para descompressão da coluna e saúde dos discos vertebrais.';

  @override
  String get routineOverheadPress => 'Press Acima da Cabeça';

  @override
  String get routineOverheadPressDesc =>
      'O press acima da cabeça alonga a coluna e fortalece os músculos posturais.';

  @override
  String get routineSkippingRope => 'Pular Corda';

  @override
  String get routineSkippingRopeDesc =>
      'Saltos repetitivos com corda estimulam as placas de crescimento nas extremidades inferiores.';

  @override
  String get routinePilatesCore => 'Pilates Core';

  @override
  String get routinePilatesCoreDesc =>
      'Exercícios de Pilates Core apoiam o alinhamento da coluna e a postura.';

  @override
  String get routineInversionHang => 'Suspensão Invertida';

  @override
  String get routineInversionHangDesc =>
      'A inversão descomprime os discos da coluna e pode adicionar temporariamente 1-2 cm.';

  @override
  String get routineZincIntake => 'Alimentos Ricos em Zinco';

  @override
  String get routineZincIntakeDesc =>
      'Consuma alimentos ricos em zinco ao longo do dia para a produção de hormônio do crescimento.';

  @override
  String get routineVitaminDSunlight => 'Vitamina D e Luz Solar';

  @override
  String get routineVitaminDSunlightDesc =>
      'Receba pelo menos 15 minutos de luz solar direta para a síntese de vitamina D e crescimento ósseo.';

  @override
  String get routineArginineFoods => 'Alimentos Ricos em Arginina';

  @override
  String get routineArginineFoodsDesc =>
      'Coma alimentos ricos em arginina para estimular a secreção de hormônio do crescimento.';

  @override
  String get routineSleepEnvironment => 'Otimizar o Ambiente de Sono';

  @override
  String get routineSleepEnvironmentDesc =>
      'Crie um ambiente de sono escuro e fresco para maximizar a liberação de melatonina e hormônio do crescimento.';

  @override
  String get routinePreSleepRoutine => 'Rotina Pré-Sono';

  @override
  String get routinePreSleepRoutineDesc =>
      'Uma rotina pré-sono consistente melhora a qualidade do sono profundo em 23%.';

  @override
  String get routineNeckStretches => 'Alongamentos de Pescoço';

  @override
  String get routineNeckStretchesDesc =>
      'Alongamentos de pescoço aliviam a compressão e melhoram o alinhamento cervical.';

  @override
  String get routineShoulderRolls => 'Rotações e Aberturas de Ombros';

  @override
  String get routineShoulderRollsDesc =>
      'Abrir os ombros corrige a postura para frente e pode adicionar 1-2 cm na aparência.';

  @override
  String get achieveFirstDay => 'Primeiro Passo';

  @override
  String get achieveFirstDayDesc => 'Complete seu primeiro dia';

  @override
  String get achieveThreeStreak => 'Sequência de 3 Dias';

  @override
  String get achieveThreeStreakDesc => 'Complete rotinas por 3 dias seguidos';

  @override
  String get achieveWeekStreak => 'Sequência de 7 Dias';

  @override
  String get achieveWeekStreakDesc => 'Complete rotinas por 7 dias seguidos';

  @override
  String get achieveTwoWeekStreak => 'Sequência de 14 Dias';

  @override
  String get achieveTwoWeekStreakDesc => 'Continue por 14 dias seguidos';

  @override
  String get achieveMonthStreak => 'Sequência de 30 Dias';

  @override
  String get achieveMonthStreakDesc => 'Complete 30 dias seguidos';

  @override
  String get achieveTwoMonthStreak => 'Sequência de 60 Dias';

  @override
  String get achieveTwoMonthStreakDesc => 'Complete 60 dias seguidos';

  @override
  String get achieveHundredStreak => 'Sequência de 100 Dias';

  @override
  String get achieveHundredStreakDesc => 'Complete 100 dias seguidos';

  @override
  String get achieveFirstMeasure => 'Primeira Medição';

  @override
  String get achieveFirstMeasureDesc =>
      'Registre sua primeira medição de altura';

  @override
  String get achieveThreeMeasures => 'Rastreador';

  @override
  String get achieveThreeMeasuresDesc => 'Registre 3 medições de altura';

  @override
  String get achieveFiveMeasures => 'Acompanhamento Regular';

  @override
  String get achieveFiveMeasuresDesc => 'Registre 5 medições de altura';

  @override
  String get achieveTenMeasures => 'Caçador de Dados';

  @override
  String get achieveTenMeasuresDesc => 'Registre 10 medições de altura';

  @override
  String get achieveFirstCm => 'Primeiro Centímetro';

  @override
  String get achieveFirstCmDesc => 'Registre 1 cm de crescimento total';

  @override
  String get achieveThreeCm => '3 cm de Crescimento';

  @override
  String get achieveThreeCmDesc => 'Registre 3 cm de crescimento total';

  @override
  String get achieveFiveCm => '5 cm de Crescimento';

  @override
  String get achieveFiveCmDesc => 'Registre 5 cm de crescimento total';

  @override
  String get achieveTenCm => '10 cm de Crescimento';

  @override
  String get achieveTenCmDesc => 'Registre 10 cm de crescimento total';

  @override
  String get quote1 => 'Seja melhor que ontem, todos os dias.';

  @override
  String get quote2 =>
      'O crescimento não acontece da noite para o dia, mas cada noite te aproxima.';

  @override
  String get quote3 => 'O crescimento exige paciência, continue!';

  @override
  String get quote4 => 'O passo que você dá hoje constrói a base de amanhã.';

  @override
  String get quote5 => 'A disciplina começa onde a motivação termina.';

  @override
  String get quote6 => 'Seu corpo vai agradecer, continue!';

  @override
  String get quote7 => 'Você define os limites do seu potencial.';

  @override
  String get quote8 => 'Pequenos passos criam grandes mudanças.';

  @override
  String get quote9 => 'O melhor investimento é em você mesmo.';

  @override
  String get quote10 => 'Você está mais perto da sua meta a cada dia.';

  @override
  String get quote11 => 'A mudança é difícil, mas o arrependimento é pior.';

  @override
  String get quote12 => 'Seu corpo é um templo, cuide dele.';

  @override
  String get quote13 => 'Seu rival é o você de ontem. Supere-o hoje!';

  @override
  String get quote14 => 'BeTaller = Paciência + Disciplina + Crença';

  @override
  String get quote15 => 'Acredite em si mesmo, o processo vai te moldar.';

  @override
  String get quote16 =>
      'Não diga hoje eu não consigo, não se arrependa amanhã.';

  @override
  String get quote17 =>
      'Mostre progresso todos os dias, mesmo que seja apenas 1%.';

  @override
  String get quote18 => 'O espelho mostrará seu progresso, tenha paciência.';

  @override
  String get bmiNormal => 'Normal';

  @override
  String get bmiUnderweight => 'Abaixo do peso';

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
  String get velocityVeryLow => 'Muito Baixo';

  @override
  String durationMinutes(String min) {
    return '$min min';
  }

  @override
  String get durationAllDay => 'O dia todo';

  @override
  String get durationNight => 'Noite';

  @override
  String durationHours(String hours) {
    return '$hours horas';
  }

  @override
  String get onboardingStep1 => 'Insira suas informações pessoais';

  @override
  String get onboardingStep2 => 'Compartilhe suas alturas anteriores';

  @override
  String get onboardingStep3 => 'Avalie seus hábitos';

  @override
  String get onboardingStep4 => 'Veja sua previsão e pontuação';

  @override
  String get hoursShort => 'h';

  @override
  String get selectLanguage => 'Selecionar idioma';

  @override
  String get systemLanguage => 'Idioma do sistema';

  @override
  String get emailSubject => 'BeTaller Feedback';

  @override
  String get pastHeightsTip =>
      'Você pode deixar idades desconhecidas em branco. Inserir 1-2 alturas passadas é suficiente.';

  @override
  String get currentSuffix => '(atual)';

  @override
  String personalizedProtein(String amount) {
    return 'Ovos, frango, peixe, laticínios. Coma pelo menos ${amount}g de proteína por dia.';
  }

  @override
  String personalizedWater(String amount) {
    return 'Beba pelo menos ${amount}L de água por dia. Essencial para metabolismo e crescimento.';
  }

  @override
  String personalizedSleep(String hours) {
    return 'O hormônio do crescimento é liberado durante o sono. Durma pelo menos $hours horas. 22h-6h são horas de ouro.';
  }

  @override
  String personalizedCalcium(String calories) {
    return 'Consuma leite, queijo, iogurte. 15 min de sol. Meta calórica diária: $calories kcal.';
  }

  @override
  String get scoreS =>
      'Excelente! Você está alcançando o auge do seu potencial.';

  @override
  String get scoreA =>
      'Indo muito bem! Pequenas melhorias podem te levar ao topo.';

  @override
  String get scoreB =>
      'No caminho certo. Foque um pouco mais em rotinas e nutrição.';

  @override
  String get scoreC =>
      'Há espaço para melhorar. Rotinas regulares farão a diferença.';

  @override
  String get scoreD => 'Alto potencial mas você precisa agir.';

  @override
  String get scoreF =>
      'Comece agora! Um pequeno passo por dia faz uma grande diferença.';

  @override
  String get cmPerYear => 'cm/ano';

  @override
  String get howToDoIt => 'Como fazer';

  @override
  String get musclesTargeted => 'Músculos e ossos trabalhados';

  @override
  String get scientificBasis => 'Base científica';

  @override
  String setXofY(String current, String total) {
    return 'Série $current de $total';
  }

  @override
  String restBeforeSet(String set) {
    return 'Descanso antes da série $set';
  }

  @override
  String get allSetsComplete => 'Todas as séries concluídas!';

  @override
  String get setTimer => 'Temporizador de série';

  @override
  String get setTracker => 'Rastreador de séries';

  @override
  String get builtInTimer => 'Temporizador integrado';

  @override
  String get markComplete => 'Marcar como concluído';

  @override
  String get markIncomplete => 'Marcar como não concluído';

  @override
  String get done => 'Pronto';

  @override
  String get doneExclamation => 'Pronto!';

  @override
  String get start => 'Iniciar';

  @override
  String get pause => 'Pausar';

  @override
  String get resetTimer => 'Reiniciar';

  @override
  String get skipRest => 'Pular descanso';

  @override
  String get restart => 'Recomeçar';

  @override
  String get perSet => 'por série';

  @override
  String get rest => 'DESCANSO';

  @override
  String get reps => 'reps';

  @override
  String get difficultyBeginner => 'Iniciante';

  @override
  String get difficultyIntermediate => 'Intermediário';

  @override
  String get difficultyAdvanced => 'Avançado';

  @override
  String get learnTitle => 'Aprender';

  @override
  String get learnSubtitle => 'Conhecimento científico para o crescimento';

  @override
  String get categoryAll => 'Todos';

  @override
  String get categoryScience => 'Ciência';

  @override
  String get categoryNutrition => 'Nutrição';

  @override
  String get categoryExercise => 'Exercício';

  @override
  String get categorySleep => 'Sono';

  @override
  String get categoryMyths => 'Mitos';

  @override
  String get scientificReferences => 'Referências científicas';

  @override
  String get relatedRoutines => 'Rotinas relacionadas';

  @override
  String get nutritionTitle => 'Nutrição';

  @override
  String get sectionMealPlan => 'Plano alimentar';

  @override
  String get sectionNutrients => 'Nutrientes';

  @override
  String get sectionFoods => 'Alimentos';

  @override
  String todaysPlan(String day) {
    return 'Plano de hoje — $day';
  }

  @override
  String get breakfast => 'Café da manhã';

  @override
  String get lunch => 'Almoço';

  @override
  String get dinner => 'Jantar';

  @override
  String get snacks => 'Lanches';

  @override
  String get searchFoods => 'Buscar alimentos...';

  @override
  String nFoods(String count) {
    return '$count alimentos';
  }

  @override
  String dailyLabel(String amount) {
    return 'Diário: $amount';
  }

  @override
  String get dailyNeedByAge => 'NECESSIDADE DIÁRIA POR IDADE';

  @override
  String agePrefix(String range) {
    return 'Idade $range';
  }

  @override
  String get topFoodSources => 'PRINCIPAIS FONTES ALIMENTARES';

  @override
  String get categoryDairy => 'Laticínios';

  @override
  String get categoryMeatFish => 'Carne e peixe';

  @override
  String get categoryVegetables => 'Vegetais';

  @override
  String get categoryFruits => 'Frutas';

  @override
  String get categoryGrains => 'Grãos e leguminosas';

  @override
  String get categoryNutsSeeds => 'Nozes e sementes';

  @override
  String get weeklyReportTitle => 'Relatório semanal';

  @override
  String get overview => 'Visão geral';

  @override
  String get routinesLabel => 'Rotinas';

  @override
  String get streakLabel => 'Sequência';

  @override
  String get heightLabel => 'Altura';

  @override
  String get dailyScores => 'Pontuações diárias';

  @override
  String get waterToday2 => 'Água hoje';

  @override
  String get sleepToday => 'Sono hoje';

  @override
  String get routineCompletion => 'Conclusão de rotinas';

  @override
  String get xpAndLevel => 'XP e nível';

  @override
  String xpToNextLevel(String xp) {
    return '$xp XP para o próximo nível';
  }

  @override
  String get activeChallenges => 'Desafios ativos';

  @override
  String nOfMCompleted(String n, String m) {
    return '$n/$m concluídos';
  }

  @override
  String get shareYourProgress => 'Compartilhe seu progresso';

  @override
  String get shareComingSoon => 'Recurso de compartilhamento em breve!';

  @override
  String get premiumTest => 'Premium (Teste)';

  @override
  String get premiumActive => 'Ativo';

  @override
  String get premiumFree => 'Grátis';

  @override
  String get weeklyReportMenu => 'Relatório semanal';

  @override
  String get weeklyReportMenuSubtitle => 'Seu resumo de progresso';

  @override
  String get unlockGrowthPotential =>
      'Desbloqueie todo o seu potencial de crescimento';

  @override
  String get featureGrowthAnalysis => 'Análise de crescimento e pontuação';

  @override
  String get featureHeightPrediction => 'Previsão e prognóstico de altura';

  @override
  String get featureAllRoutines => 'Todas as 14 rotinas diárias';

  @override
  String get featureWaterSleep => 'Rastreamento de água e sono';

  @override
  String get featureProgress => 'Progresso e medições';

  @override
  String get featureAchievements => 'Conquistas e sequências';

  @override
  String get planMonthly => 'Mensal';

  @override
  String get planYearly => 'Anual';

  @override
  String get bestValue => 'MELHOR OFERTA';

  @override
  String get premiumLabel => 'Premium';

  @override
  String lvl(String level) {
    return 'NÍV $level';
  }

  @override
  String get levelBeginner => 'Iniciante';

  @override
  String get levelStarter => 'Novato';

  @override
  String get levelCommitted => 'Comprometido';

  @override
  String get levelDedicated => 'Dedicado';

  @override
  String get levelConsistent => 'Consistente';

  @override
  String get levelFocused => 'Focado';

  @override
  String get levelDetermined => 'Determinado';

  @override
  String get levelDisciplined => 'Disciplinado';

  @override
  String get levelStrong => 'Forte';

  @override
  String get levelAdvanced => 'Avançado';

  @override
  String get levelExpert => 'Especialista';

  @override
  String get levelMaster => 'Mestre';

  @override
  String get levelElite => 'Elite';

  @override
  String get levelChampion => 'Campeão';

  @override
  String get levelLegend => 'Lenda';

  @override
  String get levelTitan => 'Titã';

  @override
  String get levelMythic => 'Mítico';

  @override
  String get levelImmortal => 'Imortal';

  @override
  String get levelTranscendent => 'Transcendente';

  @override
  String get levelUltimate => 'Supremo';

  @override
  String get challengeCompleteAllRoutines => 'Completar todas as rotinas';

  @override
  String get challengeCompleteAllRoutinesDesc => 'Terminar cada rotina hoje';

  @override
  String get challengeHydrationHero => 'Herói da hidratação';

  @override
  String get challengeHydrationHeroDesc => 'Atingir a meta diária de água';

  @override
  String get challengeEarlySleeper => 'Dorminhoco cedo';

  @override
  String get challengeEarlySleeperDesc => 'Registrar 8+ horas de sono';

  @override
  String get challengeExerciseTrio => 'Trio de exercícios';

  @override
  String get challengeExerciseTrioDesc => 'Completar 3 rotinas de exercício';

  @override
  String get challengeMorningStretch => 'Alongamento matinal';

  @override
  String get challengeMorningStretchDesc => 'Alongar antes das 9h';

  @override
  String get challenge7DayWarrior => 'Guerreiro de 7 dias';

  @override
  String get challenge7DayWarriorDesc =>
      'Completar todas as rotinas por 7 dias consecutivos';

  @override
  String get challengeGrowthTracker => 'Rastreador de crescimento';

  @override
  String get challengeGrowthTrackerDesc =>
      'Registrar uma medição de altura esta semana';

  @override
  String get challengeHydrationWeek => 'Semana de hidratação';

  @override
  String get challengeHydrationWeekDesc =>
      'Atingir a meta de água 5 dias esta semana';

  @override
  String get challengeFitnessChampion => 'Campeão fitness';

  @override
  String get challengeFitnessChampionDesc =>
      'Completar 15 rotinas de exercício esta semana';

  @override
  String get challengeSleepMaster => 'Mestre do sono';

  @override
  String get challengeSleepMasterDesc =>
      'Registrar 8+ horas de sono por 5 dias';
}
