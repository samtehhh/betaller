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
  String get geneticGainLabel => 'Ganho Genético';

  @override
  String get lifestyleLabel => 'Estilo de Vida';

  @override
  String get geneticCeilingLabel => 'Limite';

  @override
  String get reachableTargetHeight => 'Sua altura alvo alcançável';

  @override
  String get geneticCeilingProgress => 'Progresso em direção ao teto genético';

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
      'Descobri meu potencial de crescimento com o BeTaller! Experimente também: https://apps.apple.com/app/id6761445065';

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
  String get splashJourneySubtitle => 'Sua jornada começa. 🚀';

  @override
  String get splashPlanSubtitle =>
      'Seu plano personalizado está pronto.\nPronto para descobrir seu potencial de altura?';

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
  String get obPastHeightsTitle => 'Alturas Passadas';

  @override
  String get obPastHeightsSubPart1 =>
      'Insira suas alturas passadas para aumentar a confiança da previsão para ';

  @override
  String get obPastHeightsSubPart2 => ' ou mais.';

  @override
  String obHowTallAtAge(String age) {
    return 'Qual era sua altura aos $age anos?';
  }

  @override
  String get obSkip => 'Pular';

  @override
  String get obNext => 'Próximo';

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
  String get weightLabel => 'Peso';

  @override
  String get dadLabel => 'Pai';

  @override
  String get motherLabel => 'Mãe';

  @override
  String get metricShort => 'Métrico';

  @override
  String get imperialShort => 'Imperial';

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
      'Comece com rotações do pescoço, depois passe para alongamentos de corpo inteiro. Mantenha cada posição por 20-30 segundos sem rebote.';

  @override
  String get formBarHanging =>
      'Segure a barra na largura dos ombros, relaxe completamente o corpo, deixe a gravidade alongar sua coluna. Evite balançar.';

  @override
  String get formCobraStretch =>
      'Deite de bruços, coloque as mãos sob os ombros, empurre lentamente o tronco para cima mantendo os quadris no chão. Olhe para cima.';

  @override
  String get formJumping =>
      'Faça agachamento com salto ou pular corda. Pouse suavemente na ponta dos pés. Descanse 30 segundos entre as séries.';

  @override
  String get formSwimmingBasketball =>
      'Escolha natação (crawl/costas) ou basquete. Foque em saltos, alcances e amplitude total de movimento.';

  @override
  String get formEveningYoga =>
      'Faça poses suaves: cat-cow, posição da criança, cachorro virado para baixo, dobramento para frente. Respire fundo e mantenha cada pose por 30-60 segundos.';

  @override
  String get formSprintIntervals =>
      'Aqueça por 5 minutos, depois corra na velocidade máxima por 30 segundos. Caminhe ou trote por 90 segundos para recuperar. Repita.';

  @override
  String get formHiitWorkout =>
      'Faça exercícios como burpees, mountain climbers e agachamentos com salto na intensidade máxima por 45 segundos, descanse 15 segundos.';

  @override
  String get formSquats =>
      'Fique com os pés na largura dos ombros. Abaixe o corpo até as coxas ficarem paralelas ao chão. Mantenha as costas retas e os joelhos atrás dos dedos dos pés.';

  @override
  String get formDeadliftStretch =>
      'Fique com os pés na largura do quadril, incline nos quadris mantendo as costas retas. Alcance os dedos dos pés, sinta o alongamento nos isquiotibiais e nas costas.';

  @override
  String get formOverheadPress =>
      'Fique ereto, pressione os braços acima da cabeça estendendo completamente. Use pesos leves ou peso corporal. Mantenha o core firme e evite arquear as costas.';

  @override
  String get formSkippingRope =>
      'Salte com os dois pés, pousando suavemente na ponta dos pés. Mantenha os saltos baixos e consistentes. Descanse entre as séries.';

  @override
  String get formPilatesCore =>
      'Faça prancha, dead bug, bird dog, ponte e elevações de perna. Foque no movimento controlado e na respiração.';

  @override
  String get formInversionHang =>
      'Use uma mesa de inversão ou botas de gravidade. Comece com uma leve inclinação e aumente gradualmente. Mantenha as sessões curtas.';

  @override
  String get formProtein =>
      'Distribua a ingestão de proteínas em 3-4 refeições. Inclua ovos, frango, peixe, laticínios e leguminosas.';

  @override
  String get formCalciumVitaminD =>
      'Consuma 3 porções de laticínios diariamente e tome 15 minutos de luz solar para síntese natural de vitamina D.';

  @override
  String get formWater =>
      'Beba água consistentemente ao longo do dia. Carregue uma garrafinha e defina lembretes a cada hora.';

  @override
  String get formAvoidJunk =>
      'Substitua fast food por alimentos integrais. Troque bebidas açucaradas por água. Leia os rótulos e evite ingredientes processados.';

  @override
  String get formZincIntake =>
      'Inclua carne vermelha, sementes de abóbora, grão-de-bico, castanhas e ostras na dieta. Mire em 8-11mg diários.';

  @override
  String get formVitaminDSunlight =>
      'Exponha braços e rosto à luz solar direta por 15 minutos, preferencialmente antes do meio-dia. Não é necessário protetor solar por esta duração.';

  @override
  String get formArginineFoods =>
      'Inclua nozes, sementes, peru, frango, soja e laticínios nas refeições. Melhor consumido antes de dormir.';

  @override
  String get formQualitySleep =>
      'Vá para a cama até as 22h. Mantenha o quarto escuro e fresco. Evite cafeína após as 14h.';

  @override
  String get formNoScreen =>
      'Defina um alarme 1 hora antes de dormir. Guarde todas as telas. Leia um livro ou faça alongamento leve.';

  @override
  String get formSleepEnvironment =>
      'Use cortinas blackout, mantenha o quarto a 18-20°C, remova todas as fontes de luz. Use colchão e travesseiro confortáveis.';

  @override
  String get formPreSleepRoutine =>
      'Comece 30 minutos antes de dormir: diminua as luzes, leia um livro, faça exercícios de respiração, evite atividades estimulantes.';

  @override
  String get formPostureCheck =>
      'Fique ereto com os ombros para trás e para baixo. Ative levemente o core. Imagine um fio puxando você para cima pelo topo da cabeça.';

  @override
  String get formWallStand =>
      'Fique com calcanhares, glúteos, omoplatas e cabeça tocando a parede. Mantenha por 5 minutos. Respire normalmente.';

  @override
  String get formNeckStretches =>
      'Incline a cabeça lentamente para cada lado, para frente e para trás. Mantenha cada direção por 30 segundos. Não force o alongamento.';

  @override
  String get formShoulderRolls =>
      'Role os ombros para frente 15 vezes, depois para trás 15 vezes. Siga com alongamentos de abertura do peito por 20 segundos.';

  @override
  String get sciMorningStretch =>
      'O alongamento matinal descomprime os discos espinais que foram reidratados durante a noite, maximizando a retenção de altura';

  @override
  String get sciBarHanging =>
      'A suspensão descomprime os discos vertebrais usando a gravidade para alongar a coluna, potencialmente adicionando altura temporária';

  @override
  String get sciCobraStretch =>
      'O cobra stretch estende a coluna e abre o peito, contrarrestando a compressão espinal causada pelo ato de sentar';

  @override
  String get sciJumping =>
      'Saltos de alto impacto estimulam as placas de crescimento nas pernas e acionam a liberação de hormônio do crescimento';

  @override
  String get sciSwimmingBasketball =>
      'Natação e basquete envolvem alongamento de corpo inteiro, saltos e alcances que estimulam a atividade das placas de crescimento';

  @override
  String get sciEveningYoga =>
      'O yoga noturno reduz o cortisol que inibe o hormônio do crescimento, e alonga os músculos para recuperação noturna';

  @override
  String get sciSprintIntervals =>
      'A corrida de velocidade aciona uma liberação significativa de hormônio do crescimento';

  @override
  String get sciHiitWorkout =>
      'O exercício de alta intensidade aumenta o HGH em até 450%';

  @override
  String get sciSquats => 'Os agachamentos estimulam as placas de crescimento nas pernas e na coluna';

  @override
  String get sciDeadliftStretch =>
      'A descompressão espinal promove a saúde dos discos vertebrais';

  @override
  String get sciOverheadPress =>
      'O press acima da cabeça alonga a coluna e fortalece os músculos posturais';

  @override
  String get sciSkippingRope =>
      'Os saltos repetitivos estimulam as placas de crescimento nas extremidades inferiores';

  @override
  String get sciPilatesCore =>
      'A força do core apoia o alinhamento espinal e a postura';

  @override
  String get sciInversionHang =>
      'A inversão descomprime os discos espinais, pode adicionar temporariamente 1-2 cm';

  @override
  String get sciProtein =>
      'A proteína fornece aminoácidos essenciais para o crescimento ósseo e muscular, especialmente durante os surtos de crescimento';

  @override
  String get sciCalciumVitaminD =>
      'Cálcio e vitamina D são os principais blocos de construção para densidade óssea e crescimento linear dos ossos';

  @override
  String get sciWater =>
      'A hidratação é essencial para o transporte de nutrientes às placas de crescimento e a saúde da cartilagem articular';

  @override
  String get sciAvoidJunk =>
      'Alimentos processados e açúcar causam inflamação e picos de insulina que suprimem a secreção de hormônio do crescimento';

  @override
  String get sciZincIntake => 'O zinco é essencial para a produção de hormônio do crescimento';

  @override
  String get sciVitaminDSunlight =>
      'A vitamina D é crucial para a absorção de cálcio e crescimento ósseo';

  @override
  String get sciArginineFoods =>
      'A L-Arginina estimula a secreção de hormônio do crescimento';

  @override
  String get sciQualitySleep =>
      '70-80% do hormônio do crescimento diário é liberado durante as fases de sono profundo, especialmente entre 22h e 2h';

  @override
  String get sciNoScreen =>
      'A luz azul das telas suprime a produção de melatonina, atrasando o início do sono e reduzindo a qualidade do sono profundo';

  @override
  String get sciSleepEnvironment =>
      'Ambiente escuro e fresco maximiza melatonina e hormônio do crescimento';

  @override
  String get sciPreSleepRoutine =>
      'Rotina pré-sono consistente melhora a qualidade do sono profundo em 23%';

  @override
  String get sciPostureCheck =>
      'O alinhamento correto da postura pode adicionar imediatamente 2-3 cm à altura aparente e previne a compressão espinal';

  @override
  String get sciWallStand =>
      'Exercícios na parede treinam a memória muscular postural, ajudando a manter o alinhamento espinal adequado ao longo do dia';

  @override
  String get sciNeckStretches =>
      'O alongamento do pescoço alivia a compressão e melhora o alinhamento cervical';

  @override
  String get sciShoulderRolls =>
      'Abrir os ombros corrige a postura para frente, pode adicionar 1-2 cm na aparência';

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
  String get postureTip1 => 'Fique de lado (perfil lateral) para a câmera.';

  @override
  String get postureTip2 => 'Mantenha ~2 metros de distância da lente.';

  @override
  String get postureTip3 => 'Braços relaxados, olhe para frente.';

  @override
  String get postureTip4 => 'Use roupas justas para uma pontuação precisa.';

  @override
  String get postureTip5 => 'Use boa iluminação e um fundo neutro.';

  @override
  String get kyphosisLabel => 'Cifose (parte superior das costas)';

  @override
  String get lordosisLabel => 'Lordose (parte inferior das costas)';

  @override
  String get analyzingPosture => 'ANALISANDO POSTURA';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get termsOfService => 'Termos de Serviço';

  @override
  String version(String ver) {
    return 'Versão $ver';
  }

  @override
  String get rateApp => 'Avaliar BeTaller';

  @override
  String get rateAppSubtitle => 'Sua avaliação nos ajuda a crescer!';

  @override
  String get unitSystem => 'Sistema de unidades';

  @override
  String get unitMetric => 'Métrico (cm, kg)';

  @override
  String get unitImperial => 'Imperial (ft-pol, lbs)';

  @override
  String get healthDisclaimer => 'Aviso de Saúde';

  @override
  String get healthDisclaimerBody =>
      'BeTaller fornece orientações gerais de bem-estar e condicionamento físico. Os resultados variam com base na idade, genética e fatores individuais. Este aplicativo não fornece aconselhamento médico. Os exercícios focam na otimização da postura, saúde espinal e suporte ao hormônio do crescimento por meio de hábitos naturais. Consulte um profissional de saúde antes de iniciar qualquer novo programa de exercícios ou nutrição. As mudanças de altura após o fechamento das placas de crescimento (tipicamente 18-25 anos) são principalmente decorrentes da melhoria da postura.';

  @override
  String get sciSourcePrefix => 'Fonte: ';

  @override
  String get program => 'Programa';

  @override
  String get todaysExercises => 'EXERCÍCIOS DE HOJE';

  @override
  String get dailyNutritionPlan => 'PLANO NUTRICIONAL DIÁRIO';

  @override
  String get testimonial1 =>
      'Não tinha esperança pela idade, mas cresci com BeTaller. Minha confiança nunca foi tão alta.';

  @override
  String get testimonialDuration1 => '4 meses';

  @override
  String get testimonial2 =>
      'Todos diziam que eu não podia mais crescer. Usei BeTaller e surpreendi todos.';

  @override
  String get testimonialDuration2 => '3 meses';

  @override
  String get testimonial3 =>
      'Depois das rotinas, cresci e minha postura melhorou. Todos notaram.';

  @override
  String get testimonialDuration3 => '6 meses';

  @override
  String get testimonial4 =>
      'Ainda estou em fase de crescimento e o efeito do BeTaller é incrível.';

  @override
  String get testimonialDuration4 => '3 meses';

  @override
  String get testimonial5 =>
      'Notei uma diferença real rapidamente. Recomendo totalmente.';

  @override
  String get testimonialDuration5 => '4 meses';

  @override
  String get designedForYou => 'Feito para você';

  @override
  String get designedForYouDesc =>
      'BeTaller foi criado para você alcançar seu limite genético. Cada recurso, para você.';

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
  String get introTag1 => 'PREVISÃO';

  @override
  String get introTag2 => 'CRESCIMENTO';

  @override
  String get introTag3 => 'MONITORAMENTO';

  @override
  String get introTag4 => 'GAMIFICAÇÃO';

  @override
  String get introTag5 => 'COMUNIDADE';

  @override
  String get introTitle1 => 'Descubra seu\npotencial de altura';

  @override
  String get introSubtitle1 =>
      'Deixe-nos calcular seu potencial completo\ncom base em genética, idade e estilo de vida.';

  @override
  String get introTitle2 => 'Um passo mais alto\ntodo dia';

  @override
  String get introSubtitle2 =>
      'Impulsione seu potencial com planos\npersonalizados de exercício e nutrição.';

  @override
  String get introTitle3 => 'Acompanhe cada\ncentímetro';

  @override
  String get introSubtitle3 =>
      'Veja como seu progresso real\nse desenvolve com medições mensais.';

  @override
  String get introTitle4 => 'Suba de nível,\nganhe recompensas';

  @override
  String get introSubtitle4 =>
      'Complete programas de 70 dias,\nganhe XP e desbloqueie novos níveis.';

  @override
  String get introTitle5 => 'Milhares já\ncresceram mais';

  @override
  String get introSubtitle5 =>
      'Junte-se à comunidade de usuários\nque alcançaram seus objetivos.';

  @override
  String get criticalWindow => 'JANELA CRÍTICA';

  @override
  String get heightPotentialFading => 'Seu potencial de altura';

  @override
  String get fadingAway => 'está desaparecendo!';

  @override
  String get painHookDesc =>
      'A cada dia que passa, centímetros são perdidos permanentemente sem os hábitos certos. Mas isso ainda pode ser revertido.';

  @override
  String get painGeneticTitle => 'A genética não é tudo';

  @override
  String get painGeneticDesc =>
      'A genética determina 60% — mas o que você faz determina os outros 40%. BeTaller está aqui exatamente para esses 40%.';

  @override
  String get painGeneticTag => 'Análise';

  @override
  String get painSleepTitle => 'Otimize sua rotina de sono';

  @override
  String get painSleepDesc =>
      'Dormir bem toda noite pode aumentar a produção de hormônio do crescimento em 70%. BeTaller automatiza o monitoramento do sono, você só precisa dormir.';

  @override
  String get painSleepTag => 'Monitoramento';

  @override
  String get painPostureTitle => 'Ganhe centímetros agora com postura';

  @override
  String get painPostureDesc =>
      'A postura correta pode adicionar instantaneamente 1,5–3 cm. A rotina diária de postura do BeTaller estabelece isso em poucas semanas.';

  @override
  String get painPostureTag => 'Postura';

  @override
  String get painExerciseTitle => 'Seu plano de exercícios personalizado está pronto';

  @override
  String get painExerciseDesc =>
      'Alongamentos matinais, suspensão, rotinas para coluna — BeTaller preparou e agendou esses para você. Apenas 8–12 minutos por dia.';

  @override
  String get painExerciseTag => 'Rotinas';

  @override
  String get painNutritionTitle => 'Sua nutrição afeta diretamente o crescimento';

  @override
  String get painNutritionDesc =>
      'Proteína, cálcio, vitamina D — BeTaller lembra você todos os dias quais nutrientes tomar e quando.';

  @override
  String get painNutritionTag => 'Nutrição';

  @override
  String get painTrackingTitle => 'Acompanhe seu crescimento com seus próprios olhos';

  @override
  String get painTrackingDesc =>
      'Medições mensais, fotos de progresso, gráfico de crescimento — veja cada centímetro que você ganha.';

  @override
  String get painTrackingTag => 'Progresso';

  @override
  String get selectYourGender => 'Selecione seu gênero';

  @override
  String get onboardingPredictSubtitle =>
      'Isso será usado para prever seu potencial de altura e criar seu plano personalizado.';

  @override
  String get other => 'Outro';

  @override
  String get whenWereYouBorn => 'Quando você nasceu?';

  @override
  String get heightAndWeight => 'Altura e peso';

  @override
  String get parentsHeight => 'Altura dos pais';

  @override
  String get weeklyWorkout => 'Treino semanal';

  @override
  String get workoutsPerWeek => 'Treinos por semana';

  @override
  String get whatsYourEthnicity => 'Qual é a sua etnia?';

  @override
  String get whiteCaucasian => 'Branco / Caucasiano';

  @override
  String get blackAfricanAmerican => 'Negro / Afro-americano';

  @override
  String get hispanicLatino => 'Hispânico / Latino';

  @override
  String get asian => 'Asiático';

  @override
  String get middleEasternIndigenous => 'Oriente Médio / Indígena';

  @override
  String get dontWantToAnswer => 'Prefiro não responder';

  @override
  String get footSizeLabel => 'Tamanho do pé';

  @override
  String get selectYourSize => 'Selecione seu tamanho';

  @override
  String get whatsYourDreamHeight => 'Qual é a sua altura dos sonhos?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Com base nas suas respostas, calcularemos a probabilidade de atingir essa altura.';

  @override
  String get dreamHeightLabel => 'Altura dos sonhos';

  @override
  String get sleepQuestion => 'Quantas horas você\ndorme por noite?';

  @override
  String get thousandsSucceeded => 'Milhares\ntiveram sucesso';

  @override
  String get youCanToo => 'Você também pode conseguir';

  @override
  String get yearsOld => 'anos';

  @override
  String get verifiedLabel => 'Verificado';

  @override
  String get scientificData => 'DADOS CIENTÍFICOS';

  @override
  String get longTermResults => 'BeTaller cria\nresultados a longo prazo';

  @override
  String get longTermResultsSubtitle =>
      'Muitas pessoas não atingem sua altura máxima devido a maus hábitos.';

  @override
  String get yourFinalHeight => 'Sua altura final';

  @override
  String get badHabitsLegend => 'Maus hábitos';

  @override
  String get optimizedLegend => 'Otimizado';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'A altura pode ser mudada\ncom hábitos';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc => 'O sono ideal estimula\no hormônio do crescimento';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Pode ser ganho com\nmelhoria da postura';

  @override
  String get didYouKnow => 'Você sabia?';

  @override
  String get didYouKnowFact1 => 'Hábitos diários afetam 30% da sua altura';

  @override
  String get didYouKnowFact2 => 'A compressão espinal rouba 1,5-3 cm de altura';

  @override
  String get didYouKnowFact3 => 'A privação do sono reduz o HGH em 70%';

  @override
  String get transformJourneyBegins => 'Sua Jornada de\nTransformação Começa';

  @override
  String get transformJourneySubtitle =>
      'Um programa completo projetado para apoiar\nseu crescimento saudável, passo a passo.';

  @override
  String get week1Label => '1S';

  @override
  String get week1Title => 'Semana 1';

  @override
  String get week1Desc => 'O alinhamento da coluna melhora, postura fica melhor';

  @override
  String get month1Label => '1M';

  @override
  String get month1Title => 'Mês 1';

  @override
  String get month1Desc => 'Primeiros centímetros visíveis, qualidade do sono melhora';

  @override
  String get month3Label => '3M';

  @override
  String get month3Title => 'Mês 3';

  @override
  String get month3Desc => 'Ganho médio +1,5–2,5 cm, desenvolvimento muscular';

  @override
  String get month6Label => '6M';

  @override
  String get month6Title => 'Mês 6';

  @override
  String get month6Desc => 'Alcance o potencial máximo, viva com sua nova altura';

  @override
  String get reachYourGoal => 'Alcance Seu Objetivo';

  @override
  String get journeyBullet1 => 'Desbloqueie seu potencial máximo';

  @override
  String get journeyBullet2 => 'Comece a viver com sua nova altura';

  @override
  String get journeyBullet3 => 'Escreva sua história de sucesso';

  @override
  String get unlockButton => 'Desbloquear Tudo';

  @override
  String get dreamHeightOdds => 'Chances da\naltura dos sonhos';

  @override
  String get growthCompleteLabel => 'Crescimento\ncompleto';

  @override
  String get tallerThanPct => 'Mais alto que 76,7% da sua idade';

  @override
  String get levelNovice => 'Novato';

  @override
  String get levelBuilder => 'Construtor';

  @override
  String get levelGrinder => 'Perseverante';

  @override
  String get levelWarrior => 'Guerreiro';

  @override
  String get levelGodTier => 'Nível Divino';

  @override
  String get levelDesc0 => 'Construa sua base';

  @override
  String get levelDesc1 => 'Acelere o crescimento';

  @override
  String get levelDesc2 => 'Intensifique o treino';

  @override
  String get levelDesc3 => 'Supere seus limites';

  @override
  String get levelDesc4 => 'Sem dor, sem ganho';

  @override
  String get levelDesc5 => 'Mentalidade de campeão';

  @override
  String get levelDesc6 => 'Performance élite';

  @override
  String get levelDesc7 => 'Domine seu corpo';

  @override
  String get levelDesc8 => 'Disciplina lendária';

  @override
  String get levelDesc9 => 'Potencial máximo';

  @override
  String levelLabel(int level) {
    return 'NÍVEL $level';
  }

  @override
  String daysLeftProgram(int days) {
    return '$days dias restantes no programa';
  }

  @override
  String get tapLabel => 'TOQUE';

  @override
  String kcalPer100g(int calories) {
    return '$calories kcal / 100g';
  }

  @override
  String get dayShort => 'Dia';

  @override
  String get legendShort => 'Baixo';

  @override
  String get legendBelowAvg => 'Abaixo da média';

  @override
  String get legendAverage => 'Média';

  @override
  String get legendTall => 'Alto';

  @override
  String get legendVeryTall => 'Muito alto';

  @override
  String get pctBottom5 => '5% inferior';

  @override
  String get pctBottom25 => '25% inferior';

  @override
  String get pctMedian => 'Mediana';

  @override
  String get pctTop25 => '25% superior';

  @override
  String get pctTop5 => '5% superior';

  @override
  String get fallingBehind => 'Você está ficando atrás';
}
