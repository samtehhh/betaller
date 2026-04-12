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
  String get noData => 'SEM DADOS';

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

  @override
  String get performanceDashboard => 'PAINEL DE DESEMPENHO';

  @override
  String get tierA => 'NÍVEL A';

  @override
  String get tierB => 'NÍVEL B';

  @override
  String get tierC => 'NÍVEL C';

  @override
  String get tierD => 'NÍVEL D';

  @override
  String get tierE => 'NÍVEL E';

  @override
  String get maxTierReached => 'NÍVEL MÁXIMO ATINGIDO';

  @override
  String nextTierHint(String tier, String pts) {
    return 'Próximo: $tier · +$pts pts necessários';
  }

  @override
  String get premiumBadge => 'Premium';

  @override
  String get manageRoutines => 'Gerenciar rotinas';

  @override
  String get manageRoutinesSubtitle =>
      'Mostrar ou ocultar rotinas da sua lista diária';

  @override
  String nVisibleOfTotal(String visible, String total) {
    return '$visible de $total ativas';
  }

  @override
  String get showAll => 'Mostrar tudo';

  @override
  String get hideAll => 'Ocultar tudo';

  @override
  String get heightAnalysis => 'Análise de Altura';

  @override
  String get heightVsPopulation => 'Sua Posição na População Global';

  @override
  String get globalAveragesTable => 'Médias Globais por Idade';

  @override
  String get standingTall => 'Estatura Alta';

  @override
  String get standingAboveAverage => 'Acima da Média';

  @override
  String get standingBelowAverage => 'Abaixo da Média';

  @override
  String get standingShort => 'Abaixo dos Pares';

  @override
  String get yourHeightStanding => 'SUA POSIÇÃO DE ALTURA';

  @override
  String get yourHeight => 'Você';

  @override
  String peerAvg(int age) {
    return 'Média $age anos';
  }

  @override
  String get aboveAvg => 'Acima da méd.';

  @override
  String get belowAvg => 'Abaixo da méd.';

  @override
  String get whoDataSource => 'Referência Global OMS 2007';

  @override
  String get percentileShort5 => 'P5';

  @override
  String get percentileShort50 => 'P50';

  @override
  String get percentileShort95 => 'P95';

  @override
  String get youLabel => 'Você';

  @override
  String get avgHeightLabel => 'MÉD';

  @override
  String get percentileLabel => 'PCT';

  @override
  String get diffLabel => 'DIF';

  @override
  String get whoSourceNote =>
      'Fonte: Referência de crescimento OMS 2007 e estimativas globais NCD-RisC. Os percentis são médias globais e podem variar por país.';

  @override
  String get quickPhotos => 'Fotos';

  @override
  String get quickPosture => 'Postura';

  @override
  String get quickWellness => 'Bem-estar';

  @override
  String get quickRecipes => 'Receitas';

  @override
  String get wellnessTitle => 'Rastreador de Bem-estar';

  @override
  String get wellnessHeader => 'BEM-ESTAR';

  @override
  String get wellnessSubtitle => 'Acompanhe fatores que afetam seu crescimento';

  @override
  String get caffeineToday => 'Cafeína hoje';

  @override
  String get withinLimits => 'Dentro dos limites saudáveis';

  @override
  String get approachingLimit => 'Aproximando-se do limite';

  @override
  String get overLimit => 'Acima do limite — afeta o HGH';

  @override
  String get resetToday => 'Reiniciar hoje';

  @override
  String get stressToday => 'Estresse hoje';

  @override
  String get stressVeryCalmLabel => 'Muito calmo — ótimo para crescimento';

  @override
  String get stressCalmLabel => 'Calmo';

  @override
  String get stressNeutralLabel => 'Neutro';

  @override
  String get stressStressedLabel => 'Estressado';

  @override
  String get stressVeryStressedLabel =>
      'Muito estressado — cortisol bloqueia HGH';

  @override
  String get stressTapToLog => 'Toque para registrar como você se sente';

  @override
  String get todaysJournal => 'Diário de hoje';

  @override
  String get journalNoNote => '(sem nota)';

  @override
  String get journalEdit => 'Editar';

  @override
  String get journalHowWasToday => 'Como foi hoje?';

  @override
  String get journalSaved => 'Diário salvo · +5 XP';

  @override
  String get journalSaveEntry => 'Salvar';

  @override
  String get weeklyInsight => 'Análise semanal';

  @override
  String get weeklyInsightCaffeine => 'CAFEÍNA';

  @override
  String get weeklyInsightStress => 'ESTRESSE';

  @override
  String get weeklyInsightMood => 'HUMOR';

  @override
  String get wellnessInfoTitle => 'Por que o bem-estar importa';

  @override
  String get wellnessInfoBody =>
      'A cafeína interfere no sono profundo, quando a maior parte do hormônio do crescimento (HGH) é liberada. O estresse crônico eleva o cortisol, que suprime diretamente o HGH. Manter um diário ajuda a manter hábitos que apoiam o crescimento.';

  @override
  String get wellnessInfoGotIt => 'Entendi';

  @override
  String get insightCaffeineHigh =>
      'Sua cafeína está alta esta semana. Tente reduzir para melhor sono e HGH.';

  @override
  String get insightStressHigh =>
      'O estresse está elevado esta semana. Considere exercícios de respiração — cortisol bloqueia o crescimento.';

  @override
  String get insightMoodLow =>
      'O humor está baixo ultimamente. Sol, sono e exercício leve ajudam.';

  @override
  String get insightGreat =>
      'Ótimo equilíbrio esta semana. Seu bem-estar apoia o crescimento ideal.';

  @override
  String get insightDefault =>
      'Seu bem-estar está no caminho certo. Continue registrando para análises mais profundas.';

  @override
  String get insightNeedMoreData =>
      'Registre por mais alguns dias para ver análises.';

  @override
  String get progressPhotosTitle => 'Fotos de progresso';

  @override
  String get progressPhotosHeader => 'FOTOS DE PROGRESSO';

  @override
  String get progressPhotosSubtitle => 'Acompanhe sua jornada visual';

  @override
  String get addProgressPhoto => 'Adicionar foto';

  @override
  String get captureJourney => 'Capture sua jornada visual';

  @override
  String get takePhoto => 'Tirar foto';

  @override
  String get chooseFromLibrary => 'Escolher da galeria';

  @override
  String get deletePhotoTitle => 'Excluir foto?';

  @override
  String get deletePhotoBody =>
      'Esta foto será removida da sua linha do tempo de progresso.';

  @override
  String get timelineTab => 'Linha do tempo';

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
      other: 'dias',
      one: 'dia',
    );
    return '$_temp0';
  }

  @override
  String get cmGained => 'cm ganhos';

  @override
  String get firstPhotoMessage =>
      'Tire sua primeira foto para começar a acompanhar seu progresso visual.';

  @override
  String get takeFirstPhoto => 'Primeira foto';

  @override
  String get beforeAfter => 'ANTES / DEPOIS';

  @override
  String get beforeLabel => 'ANTES';

  @override
  String get afterLabel => 'DEPOIS';

  @override
  String get yourHeightDialog => 'Sua altura';

  @override
  String get heightDialogMessage =>
      'Digite sua altura atual em cm para esta foto';

  @override
  String get postureAnalysisTitle => 'Análise postural';

  @override
  String get postureCoachHeader => 'COACH DE POSTURA';

  @override
  String get postureCoachSubtitle => 'Pontuação postural com IA';

  @override
  String get latestScore => 'ÚLTIMA PONTUAÇÃO';

  @override
  String get latestAnalysis => 'ÚLTIMA ANÁLISE';

  @override
  String get headPosition => 'Posição da cabeça';

  @override
  String get progressLabel => 'PROGRESSO';

  @override
  String get choosePhotoSource => 'Escolher fonte da foto';

  @override
  String get sideProfileHint => 'Perfil lateral, corpo inteiro no quadro';

  @override
  String get howToTakePhoto => 'COMO TIRAR A FOTO';

  @override
  String get takePosturePhoto => 'Foto de postura';

  @override
  String get postureExcellent => 'Excelente';

  @override
  String get postureGood => 'Bom';

  @override
  String get postureNeedsWork => 'Precisa melhorar';

  @override
  String get posturePoor => 'Fraco';

  @override
  String get recommendedExercises => 'EXERCÍCIOS RECOMENDADOS';

  @override
  String get postureWallStand => 'Postura na parede';

  @override
  String get postureWallStandDesc =>
      'Fique de costas para a parede por 2 minutos diários.';

  @override
  String get postureChestOpener => 'Abertura de peito';

  @override
  String get postureChestOpenerDesc =>
      'Abre os peitorais tensos que puxam os ombros para frente.';

  @override
  String get postureChinTucks => 'Retração de queixo';

  @override
  String get postureChinTucksDesc =>
      'Corrige a postura de cabeça para frente — 3×10 repetições.';

  @override
  String get postureDeadbug => 'Deadbug';

  @override
  String get postureDeadbugDesc =>
      'Fortalece o core profundo para controle da lordose.';

  @override
  String get recipesTitle => 'Receitas';

  @override
  String get recipesHeader => 'RECEITAS';

  @override
  String get recipesSubtitle => 'Alimente seu crescimento';

  @override
  String get recipesCategoryAll => 'Todas';

  @override
  String get recipesCategoryBreakfast => 'Café da manhã';

  @override
  String get recipesCategoryLunch => 'Almoço';

  @override
  String get recipesCategoryDinner => 'Jantar';

  @override
  String get recipesCategorySnack => 'Lanche';

  @override
  String get recipesGoalAll => 'Todos';

  @override
  String get recipesGoalProtein => 'Alto em proteína';

  @override
  String get recipesGoalCalcium => 'Cálcio';

  @override
  String get recipesGoalOmega3 => 'Ômega-3';

  @override
  String get recipesGoalIron => 'Ferro';

  @override
  String get recipesNoMatch => 'Nenhuma receita corresponde a estes filtros';

  @override
  String get recipesIngredients => 'Ingredientes';

  @override
  String get recipesInstructions => 'Instruções';

  @override
  String get recipesClose => 'FECHAR';

  @override
  String get recipesAboutTitle => 'Sobre as receitas';

  @override
  String get recipesAboutBody =>
      'Receitas selecionadas para alimentar seu crescimento. Filtre por tipo de refeição ou objetivo nutricional para encontrar a opção perfeita.';

  @override
  String get animHintSpinalDecomp => 'Descompressão espinhal';

  @override
  String get animHintGravityReversal => 'Reversão da gravidade';

  @override
  String get animHintImpactBones => 'Carga de impacto ósseo';

  @override
  String get animHintHighImpact => 'Carga óssea de alto impacto';

  @override
  String get animHintMetabolicBurst => 'Treino metabólico intenso';

  @override
  String get animHintFullBodyStretch => 'Alongamento corporal de despertar';

  @override
  String get animHintSpinalExtension => 'Extensão espinhal';

  @override
  String get animHintCervicalDecomp => 'Descompressão cervical';

  @override
  String get animHintShoulderMobility => 'Mobilidade dos ombros';

  @override
  String get animHintFullBodyMotion => 'Movimento corporal completo';

  @override
  String get animHintPosteriorChain => 'Alongamento cadeia posterior';

  @override
  String get animHintMuscleGrowth => 'Combustível de crescimento muscular';

  @override
  String get animHintBoneDensity => 'Suporte de densidade óssea';

  @override
  String get animHintSpinalDisc => 'Hidratação dos discos espinhais';

  @override
  String get animHintCleanNutrition => 'Nutrição limpa';

  @override
  String get animHintIgf1 => 'Otimização IGF-1';

  @override
  String get animHintHghAmino => 'Precursor amino HGH';

  @override
  String get animHintCalciumAbsorption => 'Absorção de cálcio';

  @override
  String get animHintSpinalAlignment => 'Alinhamento espinhal';

  @override
  String get animHintPostureCorrection => 'Correção postural';

  @override
  String get animHintMindBody => 'Equilíbrio mente-corpo';

  @override
  String get animHintCoreStability => 'Estabilidade do core';

  @override
  String get animHintLegPower => 'Potência das pernas e pico de HGH';

  @override
  String get animHintVerticalPower => 'Potência vertical';

  @override
  String get animHintHghSurge => 'Treino pico HGH';

  @override
  String get animHintPeakHgh => 'Janela de liberação máxima de HGH';

  @override
  String get animHintMelatonin => 'Otimização da melatonina';

  @override
  String get animHintDeepSleep => 'Configuração do sono profundo';

  @override
  String get animHintSleepOpt => 'Otimização do sono';

  @override
  String get animHintExercise => 'Exercício';

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
  String get muscleSpine => 'Coluna';

  @override
  String get muscleLegs => 'Pernas';

  @override
  String get muscleBack => 'Costas';

  @override
  String get muscleShoulders => 'Ombros';

  @override
  String get muscleArms => 'Braços';

  @override
  String get muscleCore => 'Abdômen';

  @override
  String get muscleChest => 'Peito';

  @override
  String get muscleCalves => 'Panturrilhas';

  @override
  String get muscleFullBody => 'Corpo inteiro';

  @override
  String get muscleHips => 'Quadris';

  @override
  String get muscleBones => 'Ossos';

  @override
  String get muscleMuscles => 'Músculos';

  @override
  String get muscleNeck => 'Pescoço';

  @override
  String get muscleUpperSpine => 'Coluna sup.';

  @override
  String get muscleUpperBack => 'Costas altas';

  @override
  String get createRoutine => 'Criar rotina';

  @override
  String get createRoutineTitle => 'Criar rotina personalizada';

  @override
  String get createRoutineSubtitle => 'Crie sua própria rotina diária';

  @override
  String get routineIcon => 'Ícone';

  @override
  String get routineTitleField => 'Título';

  @override
  String get routineDescField => 'Descrição';

  @override
  String get routineDescHint => 'Resumo curto da rotina';

  @override
  String get routineCategoryField => 'Categoria';

  @override
  String get routineDifficultyField => 'Dificuldade';

  @override
  String get routineDurationField => 'Duração';

  @override
  String get routineSetsRepsField => 'Séries x Repetições';

  @override
  String get routineFormField => 'Instruções';

  @override
  String get routineFormHint => 'Opcional — como realizar esta rotina';

  @override
  String get diffBeginner => 'Iniciante';

  @override
  String get diffIntermediate => 'Intermediário';

  @override
  String get diffAdvanced => 'Avançado';

  @override
  String get catExercise => 'Exercício';

  @override
  String get catNutrition => 'Nutrição';

  @override
  String get catSleep => 'Sono';

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

  @override
  String get greetingAllDone => 'Ótimo trabalho! 🎯';

  @override
  String get greetingAllDoneSub => 'Você completou as tarefas de hoje.';

  @override
  String greetingStreak30(int streak) {
    return 'Sequência de $streak dias — nível lendário.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'Sequência de $streak dias — continue.';
  }

  @override
  String greetingStreak3(int streak) {
    return '$streak dias seguidos. A maioria desiste. Você não.';
  }

  @override
  String get greetingMorning => 'Bom dia. Novo dia, nova chance.';

  @override
  String get greetingAfternoon => 'Hoje é ótimo para começar sua sequência.';

  @override
  String get greetingEvening => 'Complete tarefas, inicie sua sequência.';

  @override
  String get todayCompleted => 'Hoje concluído ✓';

  @override
  String get todayGoals => 'Metas de hoje';

  @override
  String get challengesLabel => 'Desafios';

  @override
  String get dailyChallengesLabel => 'DESAFIOS DIÁRIOS';

  @override
  String get expiresTonight => 'Expira esta noite';

  @override
  String get allChallengesCompleted => 'Todos concluídos ✓';

  @override
  String get challengesLoading => 'Novos desafios em breve.';

  @override
  String get challengesLoadingTitle => 'Desafios diários';

  @override
  String get behindPace => 'Atrasado';

  @override
  String get growthTracking => 'Rastreio de crescimento';

  @override
  String get growthEmptyFirst => 'Registre sua primeira altura.';

  @override
  String get growthEmptySecond => '2ª medição para ver o gráfico.';

  @override
  String get growthSectionLabel => 'CRESCIMENTO';

  @override
  String get generalPerformance => 'DESEMPENHO GERAL';

  @override
  String get exploreLabel => 'EXPLORAR';

  @override
  String get explorePosture => 'Análise postural';

  @override
  String get explorePostureSub => 'Análise e dicas de postura';

  @override
  String get explorePhotos => 'Fotos de progresso';

  @override
  String get explorePhotosSub => 'Acompanhe transformação com fotos';

  @override
  String get exploreNutrition => 'Nutrição';

  @override
  String get exploreNutritionSub => 'Guia de proteínas, cálcio e vitaminas';

  @override
  String get exploreHealth => 'Saúde';

  @override
  String get exploreHealthSub => 'Rastreio de estresse, cafeína e bem-estar';

  @override
  String get exploreRecipes => 'Receitas de crescimento';

  @override
  String get exploreRecipesSub => 'Receitas que apoiam o crescimento';

  @override
  String get educationLabel => 'EDUCAÇÃO';

  @override
  String get educationTitle => 'Ciência do\ncrescimento';

  @override
  String get educationSubtitle => 'Conteúdo especializado, pesquisas e guias';

  @override
  String get aiAnalysisLabel => 'ANÁLISE IA';

  @override
  String get peerCompareLabel => 'COMPARAR COM PARES';

  @override
  String peerCompareText(int topPct) {
    return 'Você está no Top $topPct% dos seus pares';
  }

  @override
  String get notifWaterTitle => '💧 Não esqueça de beber!';

  @override
  String get notifWaterBody => 'Meta atingida? Beba mais um copo!';

  @override
  String get notifMorningTitle => '🌅 Bom dia! Exercício';

  @override
  String get notifMorningBody => 'Alongamentos matinais! 10 min.';

  @override
  String get notifRoutineTitle => '🔥 Complete rotinas!';

  @override
  String get notifRoutineBody => 'Verifique antes do dia acabar.';

  @override
  String get notifProteinTitle => '🥚 Dia de proteína!';

  @override
  String get notifProteinBody => 'Semana forte! Proteína em cada refeição.';

  @override
  String get notifNewWeekTitle => '✨ Nova semana!';

  @override
  String get notifNewWeekBody => 'Não pule rotinas. Pequenos passos!';

  @override
  String get notifSleepTitle => '😴 Hora de dormir!';

  @override
  String get notifSleepBody => 'Hormônio de crescimento pico entre 22h-2h.';

  @override
  String get notifPostureTitle => '🧍 Postura!';

  @override
  String get notifPostureBody => 'Costas retas, ombros para trás. 2-3 cm!';

  @override
  String get notifVitaminDTitle => '☀️ Vitamina D!';

  @override
  String get notifVitaminDBody => '15 min de sol!';

  @override
  String get notifMidweekTitle => '✨ Metade da semana!';

  @override
  String get notifMidweekBody => 'Continue!';

  @override
  String get notifScreenTitle => '📵 Telas desligadas!';

  @override
  String get notifScreenBody => 'Sem telas 1h antes de dormir.';

  @override
  String get notifJumpTitle => '🦘 Hora de pular!';

  @override
  String get notifJumpBody => 'Saltos estimulam placas de crescimento. 3 x 20!';

  @override
  String get notifCalciumTitle => '🥛 Cálcio!';

  @override
  String get notifCalciumBody => 'Leite ou iogurte. Cálcio essencial!';

  @override
  String get notifPostureCheckTitle => '🧍 Postura!';

  @override
  String get notifPostureCheckBody => 'Não incline o pescoço no celular!';

  @override
  String get notifWeekendTitle => '✨ Motivação fim de semana';

  @override
  String get notifWeekendBody => 'Não pule rotinas no fim de semana!';

  @override
  String get notifWeeklyProgressTitle => '📊 Progresso semanal';

  @override
  String get notifWeeklyProgressBody => 'Confira o gráfico!';

  @override
  String get notifMeasureTitle => '📏 Medição semanal!';

  @override
  String get notifMeasureBody => 'Meça-se! Manhã é mais precisa.';

  @override
  String get notifEarlySleepTitle => '😴 Durma cedo!';

  @override
  String get notifEarlySleepBody => 'Amanhã é segunda! Pelo menos 8 horas.';

  @override
  String get notifStreak3Title => '🔥 Sequência de 3 dias!';

  @override
  String get notifStreak3Body => 'Ótimo! Continue até 7!';

  @override
  String get notifStreak7Title => '🏆 1 semana!';

  @override
  String get notifStreak7Body => 'Incrível! 7 dias consecutivos!';

  @override
  String get notifStreak14Title => '⭐ 2 semanas!';

  @override
  String get notifStreak14Body => '14 dias disciplina!';

  @override
  String get notifStreak30Title => '👑 1 mês!';

  @override
  String get notifStreak30Body => '30 dias! Você é campeão!';

  @override
  String get notifStreak60Title => '🌟 60 dias!';

  @override
  String get notifStreak60Body => '60 dias! Conquista incrível.';

  @override
  String get notifStreak100Title => '💎 100 DIAS! LENDÁRIO!';

  @override
  String get notifStreak100Body => '100 dias! Você é uma lenda.';

  @override
  String get notifStreakRiskTitle => '⚠️ Não perca sua sequência!';

  @override
  String notifStreakRiskBody(int streak) {
    return 'Sua sequência de $streak dias está em risco!';
  }

  @override
  String get paywallStat1 => 'cm — potencial bloqueado';

  @override
  String get paywallTitle1 => 'Quantos cm você\npode crescer?';

  @override
  String get paywallBullet1a => 'Teto genético calculado, quer ver?';

  @override
  String get paywallBullet1b => 'Como seu estilo de vida afeta?';

  @override
  String get paywallBullet1c => 'Seu roteiro personalizado espera';

  @override
  String get paywallStat2 => 'rotina personalizada pronta';

  @override
  String get paywallTitle2 => 'Seu plano\nestá pronto';

  @override
  String get paywallBullet2a => '8 min toda manhã';

  @override
  String get paywallBullet2b => 'Sono, nutrição, água — tudo monitorado';

  @override
  String get paywallBullet2c => 'Um passo a mais todo dia';

  @override
  String get paywallStat3 => 'gráficos em tempo real';

  @override
  String get paywallTitle3 => 'Acompanhe seu\ncrescimento';

  @override
  String get paywallBullet3a => 'Medições mensais';

  @override
  String get paywallBullet3b => '2 cm agora com análise postural';

  @override
  String get paywallBullet3c => 'Fotos progresso — verá a diferença';

  @override
  String get paywallStat4 => 'programa diário — subindo';

  @override
  String get paywallTitle4 => 'Mais forte\na cada dia';

  @override
  String get paywallBullet4a => 'XP, níveis — hábitos = jogo';

  @override
  String get paywallBullet4b => 'Quem atingiu a meta passou por aqui';

  @override
  String get paywallBullet4c => 'Comece — primeira semana grátis';

  @override
  String get paywallRestore => 'Nenhuma compra encontrada';

  @override
  String get paywallRestoreNotFound => 'Nenhuma compra encontrada';

  @override
  String get paywallRestoreLabel => 'Restaurar compras';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallBestValue => 'Melhor valor';

  @override
  String get paywallMonthly => 'Mensal';

  @override
  String get paywallFreeTrial => '3 dias grátis';

  @override
  String get paywallLoadError => 'Não foi possível carregar';

  @override
  String get paywallCta => 'Teste grátis';

  @override
  String get paywallCtaAlt => 'Continuar';

  @override
  String get paywallTrialDisclaimer =>
      '3 dias grátis · renovação auto · cancele quando quiser';

  @override
  String get paywallYearlyDisclaimer =>
      'Renovação anual auto · cancele quando quiser';

  @override
  String get paywallTester => 'Tester';

  @override
  String get introTag1 => 'PREDICTION';

  @override
  String get introTag2 => 'GROWTH';

  @override
  String get introTag3 => 'TRACKING';

  @override
  String get introTag4 => 'GAMIFICATION';

  @override
  String get introTag5 => 'COMMUNITY';

  @override
  String get introTitle1 => 'Discover your\nheight potential';

  @override
  String get introSubtitle1 =>
      'Let us calculate your full potential\nbased on genetics, age, and lifestyle.';

  @override
  String get introTitle2 => 'One step taller\nevery day';

  @override
  String get introSubtitle2 =>
      'Push your potential with personalized\nexercise and nutrition plans.';

  @override
  String get introTitle3 => 'Track every\ncentimeter';

  @override
  String get introSubtitle3 =>
      'See how your real progress\ndevelops with monthly measurements.';

  @override
  String get introTitle4 => 'Level up,\nearn rewards';

  @override
  String get introSubtitle4 =>
      'Complete 70-day programs,\nearn XP, and unlock new levels.';

  @override
  String get introTitle5 => 'Thousands already\ngrew taller';

  @override
  String get introSubtitle5 =>
      'Join the community of users\nwho reached their goals.';

  @override
  String get criticalWindow => 'CRITICAL WINDOW';

  @override
  String get heightPotentialFading => 'Your height potential';

  @override
  String get fadingAway => 'is fading away!';

  @override
  String get painHookDesc =>
      'Every passing day, centimeters are permanently lost without the right habits. But this can still be reversed.';

  @override
  String get painGeneticTitle => 'Genetics isn\'t everything';

  @override
  String get painGeneticDesc =>
      'Genetics determines 60% — but what you do determines the other 40%. BeTaller is here for exactly that 40%.';

  @override
  String get painGeneticTag => 'Analysis';

  @override
  String get painSleepTitle => 'Optimize your sleep routine';

  @override
  String get painSleepDesc =>
      'Proper sleep every night can boost growth hormone production by 70%. BeTaller automates sleep tracking, you just sleep.';

  @override
  String get painSleepTag => 'Tracking';

  @override
  String get painPostureTitle => 'Gain centimeters now with posture';

  @override
  String get painPostureDesc =>
      'Correct posture can instantly add 1.5–3 cm. BeTaller\'s daily posture routine establishes this in a few weeks.';

  @override
  String get painPostureTag => 'Posture';

  @override
  String get painExerciseTitle => 'Your custom exercise plan is ready';

  @override
  String get painExerciseDesc =>
      'Morning stretches, hanging, spine routines — BeTaller prepared and scheduled these for you. Just 8–12 minutes a day.';

  @override
  String get painExerciseTag => 'Routines';

  @override
  String get painNutritionTitle => 'Your nutrition directly affects growth';

  @override
  String get painNutritionDesc =>
      'Protein, calcium, vitamin D — BeTaller reminds you every day which nutrients to take and when.';

  @override
  String get painNutritionTag => 'Nutrition';

  @override
  String get painTrackingTitle => 'Track your growth with your own eyes';

  @override
  String get painTrackingDesc =>
      'Monthly measurements, progress photos, growth chart — see every centimeter you gain.';

  @override
  String get painTrackingTag => 'Progress';

  @override
  String get selectYourGender => 'Select your gender';

  @override
  String get onboardingPredictSubtitle =>
      'This will be used to predict your height potential & create your custom plan.';

  @override
  String get other => 'Other';

  @override
  String get whenWereYouBorn => 'When were you born?';

  @override
  String get heightAndWeight => 'Height & weight';

  @override
  String get parentsHeight => 'Parents height';

  @override
  String get weeklyWorkout => 'Weekly workout';

  @override
  String get workoutsPerWeek => 'Workouts per week';

  @override
  String get whatsYourEthnicity => 'What\'s your ethnicity?';

  @override
  String get whiteCaucasian => 'White / Caucasian';

  @override
  String get blackAfricanAmerican => 'Black / African American';

  @override
  String get hispanicLatino => 'Hispanic / Latino';

  @override
  String get asian => 'Asian';

  @override
  String get middleEasternIndigenous => 'Middle Eastern / Indigenous';

  @override
  String get dontWantToAnswer => 'I don\'t want to answer';

  @override
  String get footSizeLabel => 'Foot size';

  @override
  String get selectYourSize => 'Select your size';

  @override
  String get whatsYourDreamHeight => 'What\'s your dream height?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Based on your input, we\'ll calculate the likelihood of achieving this height.';

  @override
  String get dreamHeightLabel => 'Dream height';

  @override
  String get sleepQuestion => 'How many hours do\nyou sleep each night?';

  @override
  String get thousandsSucceeded => 'Thousands\nSucceeded';

  @override
  String get youCanToo => 'You can do it too';

  @override
  String get yearsOld => 'years old';

  @override
  String get verifiedLabel => 'Verified';

  @override
  String get scientificData => 'SCIENTIFIC DATA';

  @override
  String get longTermResults => 'BeTaller creates\nlong-term results';

  @override
  String get longTermResultsSubtitle =>
      'Many people don\'t reach their ultimate height due to bad habits.';

  @override
  String get yourFinalHeight => 'Your final height';

  @override
  String get badHabitsLegend => 'Bad habits';

  @override
  String get optimizedLegend => 'Optimized';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'Height can be changed\nwith habits';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc => 'Ideal sleep boosts\ngrowth hormone';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Can be gained with\nposture improvement';

  @override
  String get didYouKnow => 'Did you know?';

  @override
  String get didYouKnowFact1 => 'Daily habits affect 30% of your height';

  @override
  String get didYouKnowFact2 => 'Spinal compression steals 1.5-3 cm of height';

  @override
  String get didYouKnowFact3 => 'Sleep deprivation reduces HGH by 70%';

  @override
  String get transformJourneyBegins => 'Your Transformation\nJourney Begins';

  @override
  String get transformJourneySubtitle =>
      'A scientifically proven program will\ntake you to your goal step by step.';

  @override
  String get week1Label => '1W';

  @override
  String get week1Title => 'Week 1';

  @override
  String get week1Desc => 'Spine alignment improves, posture gets better';

  @override
  String get month1Label => '1M';

  @override
  String get month1Title => 'Month 1';

  @override
  String get month1Desc => 'First visible centimeters, sleep quality improves';

  @override
  String get month3Label => '3M';

  @override
  String get month3Title => 'Month 3';

  @override
  String get month3Desc => 'Average +1.5–2.5 cm gain, muscle development';

  @override
  String get month6Label => '6M';

  @override
  String get month6Title => 'Month 6';

  @override
  String get month6Desc => 'Reach maximum potential, live with your new height';

  @override
  String get reachYourGoal => 'Reach Your Goal';

  @override
  String get journeyBullet1 => 'Unlock your maximum potential';

  @override
  String get journeyBullet2 => 'Start living with your new height';

  @override
  String get journeyBullet3 => 'Write your success story';

  @override
  String get unlockButton => 'Unlock All';

  @override
  String get dreamHeightOdds => 'Dream height\nodds';

  @override
  String get growthCompleteLabel => 'Growth\ncomplete';

  @override
  String get tallerThanPct => 'Taller than 76.7% of your age';
}
