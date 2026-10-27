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
  String get disciplineTitle => 'Disciplina';

  @override
  String get disciplineProgramTitle => 'Programa de disciplina';

  @override
  String disciplineJourneyDay(int done, int total) {
    return '$done/$total dias';
  }

  @override
  String get disciplineCompleteDay => 'Concluir o dia';

  @override
  String disciplineDayN(int n) {
    return 'Dia $n';
  }

  @override
  String get disciplineLevels => 'Níveis';

  @override
  String get disciplineLevelDone => 'Concluído';

  @override
  String get disciplineLocked => 'Bloqueado';

  @override
  String get disciplineTodayIs => 'Hoje';

  @override
  String get disciplineToday => 'Hoje';

  @override
  String get disciplineTodayPlan => 'Plano de hoje';

  @override
  String get disciplineWeek => 'Esta semana';

  @override
  String get disciplineMonth => 'Este mês';

  @override
  String get disciplineLevel => 'Nível de disciplina';

  @override
  String disciplineStreakDays(int days) {
    return '$days dias seguidos';
  }

  @override
  String disciplineToNext(int days) {
    return '$days dias para o próximo nível';
  }

  @override
  String get disciplineMaxTier => 'Nível máximo atingido';

  @override
  String get disciplineTierSpark => 'Faísca';

  @override
  String get disciplineTierSteady => 'Constante';

  @override
  String get disciplineTierSharp => 'Afiado';

  @override
  String get disciplineTierSolid => 'Sólido';

  @override
  String get disciplineTierRelentless => 'Incansável';

  @override
  String get disciplineTierUnbroken => 'Inabalável';

  @override
  String get disciplineTierLegend => 'Lenda';

  @override
  String get goalPerfectDays => 'Dias com o plano completo';

  @override
  String get goalWorkouts => 'Treinos';

  @override
  String get goalMeasurement => 'Medição de altura';

  @override
  String get goalPhoto => 'Foto de progresso';

  @override
  String get goalPostureCheck => 'Verificação de postura';

  @override
  String get disciplineAllDone => 'Dia concluído';

  @override
  String disciplineDayProgress(int done, int total) {
    return '$done/$total concluído';
  }

  @override
  String get navProgress => 'Progresso';

  @override
  String get trackingSection => 'Suas ferramentas de acompanhamento';

  @override
  String get photosBenefit =>
      'Antes e depois, lado a lado. Veja a mudança em vez de ler sobre ela.';

  @override
  String get postureBenefit =>
      'Cabeça, ombros e lombar. Ficar ereto mostra até 2-3 cm a mais da sua altura real.';

  @override
  String get reportBenefit =>
      'Avalie sua semana dia a dia e veja onde ela escorregou.';

  @override
  String get photosCta => 'Adicionar foto';

  @override
  String get postureCta => 'Analisar';

  @override
  String get reportCta => 'Abrir relatório';

  @override
  String get toolStateReady => 'Pronto';

  @override
  String get photosSummaryEmpty => 'Adicione sua primeira foto';

  @override
  String photosSummaryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count fotos',
      one: '$count foto',
    );
    return '$_temp0';
  }

  @override
  String get postureSummaryEmpty => 'Ainda sem análise';

  @override
  String postureSummaryScore(int score) {
    return '$score/100 postura';
  }

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
  String remaining(String cm, String unit) {
    return '+$cm $unit restantes';
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
  String get waterGoalReached => 'Objetivo diário atingido';

  @override
  String waterRemaining(String amount) {
    return 'Faltam $amount';
  }

  @override
  String get undo => 'Desfazer';

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
  String get bodyFactsTitle => 'O teu corpo';

  @override
  String get dailyNeedsTitle => 'Os teus objetivos diários';

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
  String get growthRemaining => 'Ainda pela frente';

  @override
  String get growthBreakdown => 'De onde vêm esses centímetros';

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
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return 'Melhor: $_temp0';
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
  String get reminderNextLabel => 'Próximo lembrete';

  @override
  String get reminderManageHint => 'Gerencie seus lembretes';

  @override
  String get reminderOffCta => 'Ativar notificações';

  @override
  String get stateOn => 'Ativado';

  @override
  String get stateOff => 'Desativado';

  @override
  String get reminderMasterTitle => 'Notificações';

  @override
  String reminderActiveCount(int count) {
    return '$count lembretes ativos';
  }

  @override
  String get reminderBuiltIn => 'Lembretes integrados';

  @override
  String get reminderYourOwn => 'Seus próprios lembretes';

  @override
  String get reminderAdd => 'Adicionar lembrete';

  @override
  String get reminderDays => 'Dias';

  @override
  String get reminderEveryDay => 'Todos os dias';

  @override
  String get reminderLabelHint => 'Do que você quer ser lembrado?';

  @override
  String get reminderEmptyHint =>
      'Adicione os seus: treino, vitaminas, alongamento, o que você precisar.';

  @override
  String get reminderCustom => 'Lembrete';

  @override
  String get reminderCustomBody => 'Chegou a hora que você definiu.';

  @override
  String get reminderExercise => 'Exercício';

  @override
  String get reminderNutrition => 'Nutrição';

  @override
  String get reminderWater => 'Água';

  @override
  String get reminderPosture => 'Postura';

  @override
  String get reminderRoutine => 'Rotina diária';

  @override
  String get reminderSleep => 'Sono';

  @override
  String get reminderMeasurement => 'Medição de altura';

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
  String get profileGroupSupport => 'Suporte';

  @override
  String get profileGroupAccount => 'Conta';

  @override
  String get profileGroupApp => 'App';

  @override
  String get profileGroupDanger => 'Zona de perigo';

  @override
  String profileMemberSince(String date) {
    return 'Desde $date';
  }

  @override
  String get profileYourJourney => 'O teu percurso';

  @override
  String get profileTotalGrowth => 'Total';

  @override
  String get currentStreak => 'Sequência Atual';

  @override
  String get bestStreakLabel => 'Melhor Sequência';

  @override
  String get achievementLabel => 'Conquista';

  @override
  String get achievements => 'Conquistas';

  @override
  String get achievementUnlockedTitle => '🏆 Conquista desbloqueada!';

  @override
  String get reminderTapHint =>
      'Toque em um lembrete para mudar o horário e os dias';

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
  String get analysisDataReceivedTitle => 'Dados recebidos';

  @override
  String get analysisDataReceivedSubtitle => 'Sua análise está começando...';

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
  String growthPotential(String cm, String unit) {
    return '+$cm $unit de potencial de crescimento';
  }

  @override
  String get heightAt21 => 'aos 21 anos';

  @override
  String confidenceLevel(String pct) {
    return '$pct% nível de confiança';
  }

  @override
  String heightRange(String min, String max, String unit) {
    return 'Faixa de $min - $max $unit';
  }

  @override
  String get currentLabel => 'ATUAL';

  @override
  String get predictedLabel => 'PREVISTO';

  @override
  String get yearlyPredictions => 'Previsões Anuais';

  @override
  String get tipMorningMeasure =>
      'Meça sua altura de manhã. A pressão nos discos faz você perder um pouco de altura ao longo do dia, então a medida mais precisa é a da manhã.';

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
  String get routineSquats => 'Agachamento livre';

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
  String get routineDailyCalories => 'Meta calórica diária';

  @override
  String get routineDailyCaloriesDesc =>
      'Bata sua meta diária de calorias. Comer de menos atrasa o crescimento.';

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
  String get achieveCommitment => 'Determinação';

  @override
  String get achieveCommitmentDesc =>
      'Insira todos os seus dados, explore o app por completo e comece a usá-lo';

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
      'Suas alturas passadas deixam sua previsão mais precisa.';

  @override
  String get obPastHeightsSubPart2 => ' ';

  @override
  String obHowTallAtAge(String age) {
    return 'Qual era sua altura aos $age anos?';
  }

  @override
  String get obSkip => 'Pular';

  @override
  String get obNext => 'Próximo';

  @override
  String get obSkipAll => 'Pular tudo';

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
  String get sectionSupplements => 'Suplementos';

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
  String get weeklyScoreLabel => 'Pontuação da semana';

  @override
  String get weeklyDailyCompletion => 'Dia a dia';

  @override
  String get weeklyHabits => 'Hábitos';

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
  String get heightVsPopulation => 'Sua Posição na Curva de Crescimento CDC';

  @override
  String get globalAveragesTable => 'Altura Média por Idade (CDC)';

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
  String get bellCurveCaption => 'Como a altura se distribui na sua idade';

  @override
  String get bellShorterThanYou => 'mais baixos que você';

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
  String get whoDataSource => 'Curvas de crescimento CDC dos EUA';

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
      'Fonte: curvas de crescimento CDC 2000 dos EUA (estatura por idade, de 2 a 20 anos). Os percentis comparam você com a população dos EUA e podem variar por país.';

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
  String get overLimit => 'Acima do limite, afeta o HGH';

  @override
  String get resetToday => 'Reiniciar hoje';

  @override
  String get stressToday => 'Estresse hoje';

  @override
  String get stressVeryCalmLabel => 'Muito calmo, ótimo para o crescimento';

  @override
  String get stressCalmLabel => 'Calmo';

  @override
  String get stressNeutralLabel => 'Neutro';

  @override
  String get stressStressedLabel => 'Estressado';

  @override
  String get stressVeryStressedLabel =>
      'Muito estressado, o cortisol bloqueia o HGH';

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
      'Seu estresse está alto esta semana. Experimente exercícios de respiração: o cortisol bloqueia o crescimento.';

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
  String photoGainInDays(String cm, int days, String unit) {
    return '$cm $unit em $days dias';
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
  String cmGained(String unit) {
    return '$unit ganhos';
  }

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
  String get heightDialogMessage => 'Digite sua altura atual para esta foto';

  @override
  String get postureAnalysisTitle => 'Análise postural';

  @override
  String get postureCoachHeader => 'COACH DE POSTURA';

  @override
  String get postureCoachSubtitle => 'Autoavaliação com sua foto de perfil';

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
  String get recipeDiffEasy => 'Fácil';

  @override
  String get recipeDiffMedium => 'Média';

  @override
  String get recipeDiffHard => 'Difícil';

  @override
  String get recipesFilterType => 'TIPO';

  @override
  String get recipesFilterNutrient => 'RICO EM';

  @override
  String get recipesGoalVitaminD => 'Vitamina D';

  @override
  String get recipesGoalZinc => 'Zinco';

  @override
  String get recipesGoalMagnesium => 'Magnésio';

  @override
  String recipesCountLabel(int count) {
    return '$count receitas';
  }

  @override
  String get recipeIngredients => 'Ingredientes';

  @override
  String get recipeSteps => 'Preparação';

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
      'Distribua a proteína em 3-4 refeições. Inclua ovos, frango, peixe, laticínios e leguminosas.';

  @override
  String get formCalciumVitaminD =>
      'Consuma 3 porções de laticínios por dia e pegue 15 minutos de sol para seu corpo produzir vitamina D.';

  @override
  String get formWater =>
      'Beba água com regularidade ao longo do dia. Leve uma garrafa com você e coloque lembretes de hora em hora.';

  @override
  String get formAvoidJunk =>
      'Troque o fast food por alimentos naturais. Substitua bebidas açucaradas por água. Leia os rótulos e evite ingredientes processados.';

  @override
  String get formZincIntake =>
      'Inclua carne vermelha, sementes de abóbora, grão-de-bico, castanha-de-caju e ostras na sua dieta. A meta é 8-11 mg por dia.';

  @override
  String get formVitaminDSunlight =>
      'Exponha braços e rosto ao sol direto por 15 minutos, de preferência antes do meio-dia. Para esse tempo curto, não precisa de protetor solar.';

  @override
  String get formArginineFoods =>
      'Inclua castanhas, sementes, peru, frango, soja e laticínios nas suas refeições. O ideal é antes de dormir.';

  @override
  String get formDailyCalories =>
      'Distribua suas calorias em 3-5 refeições e não pule o café da manhã. Prefira alimentos naturais a calorias vazias.';

  @override
  String get formQualitySleep =>
      'Vá para a cama até as 22h. Deixe o quarto escuro e fresco. Nada de cafeína depois das 14h.';

  @override
  String get formNoScreen =>
      'Coloque um alarme 1 hora antes de dormir. Guarde todas as telas. Leia um livro ou faça alongamentos leves no lugar.';

  @override
  String get formSleepEnvironment =>
      'Use cortinas blackout, mantenha o quarto entre 18 e 20 °C e apague todas as luzes. Durma em um colchão e um travesseiro confortáveis.';

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
      'Alongar de manhã descomprime os discos da coluna, que se reidratam durante a noite, e ajuda você a manter sua altura ao longo do dia';

  @override
  String get sciBarHanging =>
      'Ficar pendurado descomprime os discos da coluna porque a gravidade alonga a coluna, e pode dar um pouco de altura temporária';

  @override
  String get sciCobraStretch =>
      'A cobra alonga a coluna e abre o peito, compensando a compressão de ficar muito tempo sentado';

  @override
  String get sciJumping =>
      'Saltos de impacto estimulam as placas de crescimento das pernas e a liberação do hormônio do crescimento';

  @override
  String get sciSwimmingBasketball =>
      'Natação e basquete juntam alongar, saltar e alcançar com o corpo todo, o que estimula as placas de crescimento';

  @override
  String get sciEveningYoga =>
      'A ioga à noite reduz o cortisol, que freia o hormônio do crescimento, e alonga os músculos para a recuperação noturna';

  @override
  String get sciSprintIntervals =>
      'Os tiros de corrida provocam uma liberação forte de hormônio do crescimento';

  @override
  String get sciHiitWorkout =>
      'O exercício de alta intensidade pode aumentar o hormônio do crescimento em até 450%';

  @override
  String get sciSquats =>
      'O agachamento estimula as placas de crescimento das pernas e da coluna';

  @override
  String get sciDeadliftStretch =>
      'Descomprimir a coluna favorece a saúde dos discos vertebrais';

  @override
  String get sciOverheadPress =>
      'Empurrar acima da cabeça alonga a coluna e fortalece os músculos da postura';

  @override
  String get sciSkippingRope =>
      'Saltos repetidos estimulam as placas de crescimento das pernas';

  @override
  String get sciPilatesCore =>
      'Um core forte sustenta o alinhamento da coluna e sua postura';

  @override
  String get sciInversionHang =>
      'A inversão descomprime os discos da coluna e pode somar 1-2 cm temporariamente';

  @override
  String get sciProtein =>
      'A proteína fornece os aminoácidos que ossos e músculos precisam para crescer, principalmente nos estirões';

  @override
  String get sciCalciumVitaminD =>
      'Cálcio e vitamina D são a base da densidade óssea e do crescimento dos ossos em comprimento';

  @override
  String get sciWater =>
      'Se hidratar bem leva nutrientes às placas de crescimento e mantém saudável a cartilagem das articulações';

  @override
  String get sciAvoidJunk =>
      'Ultraprocessados e açúcar causam inflamação e picos de insulina que freiam a secreção do hormônio do crescimento';

  @override
  String get sciZincIntake =>
      'O zinco é essencial para a produção do hormônio do crescimento';

  @override
  String get sciVitaminDSunlight =>
      'A vitamina D é essencial para absorver o cálcio e para o crescimento dos ossos';

  @override
  String get sciArginineFoods =>
      'A L-arginina estimula a secreção do hormônio do crescimento';

  @override
  String get sciDailyCalories =>
      'Um déficit calórico prolongado reduz o IGF-1 e enfraquece os picos do hormônio do crescimento, o que atrasa diretamente o crescimento linear na adolescência';

  @override
  String get sciQualitySleep =>
      '70-80% do hormônio do crescimento do dia é liberado no sono profundo, principalmente entre 22h e 2h';

  @override
  String get sciNoScreen =>
      'A luz azul das telas freia a melatonina, atrasa a hora de pegar no sono e piora o sono profundo';

  @override
  String get sciSleepEnvironment =>
      'Um quarto escuro e fresco favorece a melatonina e o hormônio do crescimento';

  @override
  String get sciPreSleepRoutine =>
      'Uma rotina constante antes de dormir melhora a qualidade do sono profundo em 23%';

  @override
  String get sciPostureCheck =>
      'Uma boa postura pode fazer você parecer 2-3 cm mais alto na hora e evita a compressão da coluna';

  @override
  String get sciWallStand =>
      'Ficar encostado na parede treina a memória muscular da sua postura para manter a coluna alinhada o dia todo';

  @override
  String get sciNeckStretches =>
      'Os alongamentos de pescoço aliviam a compressão e melhoram o alinhamento cervical';

  @override
  String get sciShoulderRolls =>
      'Abrir os ombros corrige a postura curvada para frente e pode fazer você parecer 1-2 cm mais alto';

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
  String get routineFormHint => 'Opcional: como fazer esta rotina';

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
  String get kyphosisLabel => 'Cifose (costas superiores)';

  @override
  String get lordosisLabel => 'Lordose (costas inferiores)';

  @override
  String get analyzingPosture => 'ANALYZING POSTURE';

  @override
  String get privacyPolicy => 'Política de Privacidade';

  @override
  String get termsOfService => 'Termos de Serviço';

  @override
  String version(String ver) {
    return 'Versão $ver';
  }

  @override
  String get rateApp => 'Rate BeTaller';

  @override
  String get rateAppSubtitle => 'Your review helps us grow!';

  @override
  String get unitSystem => 'Sistema de unidades';

  @override
  String get unitMetric => 'Métrico (cm, kg)';

  @override
  String get unitImperial => 'Imperial (ft-in, lbs)';

  @override
  String get healthDisclaimer => 'Health Disclaimer';

  @override
  String get healthDisclaimerBody =>
      'BeTaller provides general wellness and fitness guidance. Results vary based on age, genetics, and individual factors. This app does not provide medical advice. Exercises focus on posture optimization, spinal health, and growth hormone support through natural habits. Consult a healthcare professional before starting any new exercise or nutrition program. Height changes after growth plate closure (typically 18-25) are primarily from posture improvement.';

  @override
  String routineProteinAmountDesc(int grams) {
    return 'Consome hoje pelo menos ${grams}g de proteína — calculado com base no teu peso.';
  }

  @override
  String routineWaterAmountDesc(String liters) {
    return 'Bebe hoje pelo menos ${liters}L de água — calculado com base no teu peso.';
  }

  @override
  String routineCalorieAmountDesc(int kcal) {
    return 'Procura consumir hoje cerca de $kcal kcal para apoiar o crescimento.';
  }

  @override
  String routineVitaminDAmountDesc(int iu) {
    return 'Consome hoje $iu UI de vitamina D — através do sol, alimentos ou um suplemento.';
  }

  @override
  String routineZincAmountDesc(int mg) {
    return 'Consome hoje ${mg}mg de zinco para apoiar a produção de hormona do crescimento.';
  }

  @override
  String get nutritionSupplementsTitle => 'SUPLEMENTOS';

  @override
  String get nutritionSupplementsDisclaimer =>
      'Um apoio opcional, não substitui a alimentação. Fala com um médico antes de começar qualquer suplemento, especialmente se tiveres menos de 18 anos.';

  @override
  String get supplementVitaminDName => 'Vitamina D3';

  @override
  String get supplementVitaminDDose => '3.000 UI';

  @override
  String get supplementVitaminDBenefit =>
      'Melhora a absorção de cálcio para a densidade óssea e a saúde das cartilagens de crescimento';

  @override
  String get supplementZincName => 'Zinco';

  @override
  String get supplementZincDose => '8-11mg';

  @override
  String get supplementZincBenefit =>
      'Um mineral essencial para a produção do hormônio do crescimento';

  @override
  String get supplementMagnesiumName => 'Magnésio';

  @override
  String get supplementMagnesiumDose => '300-400mg';

  @override
  String get supplementMagnesiumBenefit =>
      'Ajuda na fase de sono profundo, quando a maior parte do hormônio do crescimento é liberada';

  @override
  String get supplementCalciumName => 'Cálcio';

  @override
  String get supplementCalciumDose => '1.000-1.300mg';

  @override
  String get supplementCalciumBenefit =>
      'A base da densidade óssea e das cartilagens de crescimento';

  @override
  String get supplementOmega3Name => 'Ómega-3';

  @override
  String get supplementOmega3Dose => '1.000mg';

  @override
  String get supplementOmega3Benefit =>
      'Reduz a inflamação e apoia o bom funcionamento das cartilagens de crescimento';

  @override
  String get supplementCollagenName => 'Colagénio + Vitamina C';

  @override
  String get supplementCollagenDose => '10g + 500mg';

  @override
  String get supplementCollagenBenefit =>
      'A vitamina C ajuda seu corpo a usar o colágeno para formar cartilagem e matriz óssea';

  @override
  String get sciSourcePrefix => 'Source: ';

  @override
  String get program => 'Programa';

  @override
  String get todaysExercises => 'EXERCÍCIOS DE HOJE';

  @override
  String get dailyNutritionPlan => 'PLANO NUTRICIONAL DIÁRIO';

  @override
  String get nutritionGoalsComplete =>
      '🎉 Todas as metas nutricionais concluídas!';

  @override
  String get nutritionGoalsIncomplete =>
      'Completa as tuas metas nutricionais para um crescimento ideal';

  @override
  String get postureDetectingAlignment =>
      'A detetar o alinhamento da coluna...';

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
    return 'Sequência de $streak dias. Nível lendário.';
  }

  @override
  String greetingStreak7(int streak) {
    return 'Sequência de $streak dias. Continue assim.';
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
  String get analysisBalance => 'Seu equilíbrio';

  @override
  String get analysisWeakest => 'Seu ponto mais fraco';

  @override
  String get analysisPrediction => 'Previsão de altura';

  @override
  String get analysisComparison => 'Comparação';

  @override
  String get analysisGrowth => 'Estado de crescimento';

  @override
  String get analysisWeakestHint =>
      'É aqui que você sobe a pontuação mais rápido.';

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
  String get aiAnalysisLabel => 'ANÁLISE DE CRESCIMENTO';

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
  String get paywallPromoCode => 'Tem um código promocional?';

  @override
  String get paywallHeightUnit => 'altura alvo';

  @override
  String get paywallHeightTitle => 'Quantos cm você ainda pode crescer?';

  @override
  String get paywallHeightDesc =>
      'Analisamos sua genética, seu estilo de vida e sua postura e traçamos a previsão ano a ano. Nada é fixo: cada passo atualiza o resultado.';

  @override
  String get paywallGrowthUnit => 'neste ano';

  @override
  String get paywallGrowthTitle => 'Acompanhamos seu crescimento com você';

  @override
  String get paywallGrowthDesc =>
      'Cada medição entra no gráfico na hora. Você vê o progresso mês a mês, centímetro a centímetro.';

  @override
  String get paywallPostureUnit => 'pontuação postural';

  @override
  String get paywallPostureTitle => 'Sua postura é a chave das rotinas';

  @override
  String get paywallPostureDesc =>
      'Uma checagem rápida de 3 perguntas sobre cabeça, ombros e lombar, com os exercícios certos para corrigir cada um.';

  @override
  String get paywallReportUnit => 'rotinas concluídas';

  @override
  String get paywallReportTitle => 'Avaliamos você toda semana';

  @override
  String get paywallReportDesc =>
      'Água, sono, rotinas e sequência em uma tela só. Toda semana apontamos seus pontos fortes e as falhas.';

  @override
  String get paywallNutritionUnit => 'refeições por dia';

  @override
  String get paywallNutritionTitle => 'Seu plano alimentar está pronto';

  @override
  String get paywallNutritionDesc =>
      'Do café da manhã ao jantar, um plano diário completo com proteína, cálcio, zinco e vitamina D já calculados.';

  @override
  String get paywallScoreUnit => 'Pontuação BeTaller';

  @override
  String get paywallScoreTitle => 'O sistema que sempre te leva adiante';

  @override
  String get paywallScoreDesc =>
      'Genética, crescimento, nutrição, sono e disciplina se juntam em uma única pontuação. Quando ela cai, você vê onde melhorar.';

  @override
  String get paywallPhotosUnit => 'diferença visível';

  @override
  String get paywallPhotosTitle => 'Prove sua mudança com fotos';

  @override
  String get paywallPhotosDesc =>
      'As comparações antes e depois se criam sozinhas, e a foto de cada mês fica junta na sua linha do tempo.';

  @override
  String get paywallReportStat => '82%';

  @override
  String get journeyIntroTitle => 'Vamos começar em três passos';

  @override
  String get journeyIntroSubtitle =>
      'Configuramos o BeTaller juntos. O próximo passo espera por você.';

  @override
  String get journeyStep1Title => 'Coleta dos seus dados';

  @override
  String get journeyStep1Desc =>
      'Pegamos sua altura, idade e estilo de vida e calculamos seu potencial.';

  @override
  String get journeyStep2Title => 'Tour pelo app';

  @override
  String get journeyStep2Desc =>
      'Passamos por cada recurso: para que serve e como usar.';

  @override
  String get journeyStep3Title => 'Uso no dia a dia';

  @override
  String get journeyStep3Desc =>
      'Você toca a sua rotina e nós acompanhamos o seu progresso.';

  @override
  String get journeyNow => 'AGORA';

  @override
  String get journeyDone => 'FEITO';

  @override
  String get journeySoon => 'EM BREVE';

  @override
  String get tourHomeStreakTitle => 'A Sua Sequência';

  @override
  String get tourHomeStreakDesc =>
      'Cresce enquanto você mantém a disciplina. Perca um dia e ela zera.';

  @override
  String get tourHomeXpTitle => 'O Seu Nível';

  @override
  String get tourHomeXpDesc =>
      'Sobe com o XP que você ganha mantendo a disciplina. Não saia dos trilhos!';

  @override
  String get tourHomeGoalsTitle => 'Metas de Hoje';

  @override
  String get tourHomeGoalsDesc =>
      'Mostra as suas rotinas, tarefas e meta de água do dia num relance.';

  @override
  String get tourHomeTrackTitle => 'Acompanhamento de Água e Sono';

  @override
  String get tourHomeTrackDesc =>
      'Registre sua água e seu sono do dia aqui mesmo, em segundos.';

  @override
  String get tourPlanTabsTitle =>
      'Três Separadores: Hoje, Disciplina, Nutrição';

  @override
  String get tourPlanTabsDesc =>
      'A sua rotina diária, o seu programa semanal e o seu plano de nutrição estão todos aqui.';

  @override
  String get tourPlanLevelTitle => 'O Seu Nível de Disciplina';

  @override
  String get tourPlanLevelDesc =>
      'Mostra com que consistência completa as suas rotinas. Suba de nível para melhores resultados.';

  @override
  String get tourPlanTodayTitle => 'Plano de Hoje';

  @override
  String get tourPlanTodayDesc =>
      'Marque aqui as suas rotinas diárias para aumentar a sua sequência.';

  @override
  String get tourPlanTodayListTitle => 'As Suas Rotinas de Hoje';

  @override
  String get tourPlanTodayListDesc =>
      'Marque cada uma conforme for fazendo. Toque em uma rotina para ver os detalhes.';

  @override
  String get tourPlanWeekGoalsTitle => 'Esta Semana';

  @override
  String get tourPlanWeekGoalsDesc =>
      'Dias perfeitos, treinos e a medição pedida esta semana, incluindo a obrigatória.';

  @override
  String get tourPlanMonthGoalsTitle => 'Este Mês';

  @override
  String get tourPlanMonthGoalsDesc =>
      'Foto de progresso, checagem de postura e as medições deste mês: as que você não deve pular.';

  @override
  String get tourProgressHeightTitle => 'A Sua Altura Atual';

  @override
  String get tourProgressHeightDesc =>
      'Mostra a sua altura atual e o seu ganho total. Adicione uma nova medição a partir daqui.';

  @override
  String get tourProgressPhotosTitle => 'Fotos de Progresso';

  @override
  String get tourProgressPhotosDesc =>
      'Acompanhe a sua transformação visualmente com fotos tiradas regularmente.';

  @override
  String get tourProgressPostureTitle => 'Análise de Postura';

  @override
  String get tourProgressPostureDesc =>
      'Analise a sua postura a partir de uma foto e descubra no que trabalhar.';

  @override
  String get tourAnalysisScoreTitle => 'A Sua Pontuação BeTaller';

  @override
  String get tourAnalysisScoreDesc =>
      'A sua pontuação geral, calculada a partir da genética, velocidade, nutrição e sono.';

  @override
  String get tourAnalysisPredictionTitle => 'A Sua Previsão de Altura';

  @override
  String get tourAnalysisPredictionDesc =>
      'Mostra a sua altura final prevista e a sua trajetória ano a ano.';

  @override
  String get tourAnalysisPeerTitle => 'Compare-se com Seus Pares';

  @override
  String get tourAnalysisPeerDesc =>
      'Veja a sua posição no ranking e compare-se com outros da sua idade.';

  @override
  String get tourHomeGoalsRoutinesTitle => 'As Suas Rotinas';

  @override
  String get tourHomeGoalsRoutinesDesc =>
      'Veja quantas rotinas de exercício ainda precisa de completar hoje.';

  @override
  String get tourHomeGoalsChallengesTitle => 'As Suas Tarefas';

  @override
  String get tourHomeGoalsChallengesDesc =>
      'Acompanhe o progresso dos seus desafios ativos aqui mesmo.';

  @override
  String get tourHomeGoalsWaterTitle => 'A Sua Meta de Água';

  @override
  String get tourHomeGoalsWaterDesc =>
      'Veja o quão perto está da sua meta diária de água.';

  @override
  String get tourHomeReminderTitle => 'O Seu Próximo Lembrete';

  @override
  String get tourHomeReminderDesc =>
      'Veja quando chega o seu próximo lembrete e edite-o a partir daqui.';

  @override
  String get tourHomeChallengesTitle => 'Os Seus Desafios';

  @override
  String get tourHomeChallengesDesc =>
      'Complete os desafios ativos para ganhar XP extra.';

  @override
  String get tourHomeGrowthTitle => 'O Seu Estado de Crescimento';

  @override
  String get tourHomeGrowthDesc =>
      'Veja a diferença entre sua medição total e a mais recente, e quantas você já registrou.';

  @override
  String get tourHomeExploreTitle => 'Explorar';

  @override
  String get tourHomeExploreDesc =>
      'Guias de nutrição, receitas de crescimento e muito mais esperam por si aqui.';

  @override
  String get tourPlanProgramHeaderTitle => 'O Seu Programa de 70 Dias';

  @override
  String get tourPlanProgramHeaderDesc =>
      'Veja o seu progresso geral, o seu nível atual e o dia neste anel.';

  @override
  String get tourPlanProgramLevelsTitle => 'Níveis';

  @override
  String get tourPlanProgramLevelsDesc =>
      'Veja em qual dos 10 níveis está e quais ainda estão bloqueados.';

  @override
  String get tourPlanNutritionHeaderTitle => 'O Seu Progresso Nutricional';

  @override
  String get tourPlanNutritionHeaderDesc =>
      'Acompanhe quantas das suas rotinas nutricionais diárias já completou.';

  @override
  String get tourPlanNutritionFirstTitle => 'Rotinas de Nutrição';

  @override
  String get tourPlanNutritionFirstDesc =>
      'Marque os hábitos nutricionais que apoiam o seu crescimento.';

  @override
  String get tourProgressChartTitle => 'Curva de Crescimento';

  @override
  String get tourProgressChartDesc =>
      'Veja as suas medições anteriores num gráfico e entenda para onde está a ir.';

  @override
  String get tourProgressReportTitle => 'Relatório Semanal';

  @override
  String get tourProgressReportDesc =>
      'Consulte o relatório que resume o progresso da sua semana.';

  @override
  String get tourProgressHistoryTitle => 'O Seu Histórico de Medições';

  @override
  String get tourProgressHistoryDesc =>
      'Veja todas as medições de altura que você registrou em uma linha do tempo.';

  @override
  String get tourAnalysisRadarTitle => 'O Seu Gráfico de Equilíbrio';

  @override
  String get tourAnalysisRadarDesc =>
      'Veja o seu equilíbrio de genética, velocidade de crescimento, nutrição, sono e disciplina num gráfico radar, e descubra o seu ponto mais fraco.';

  @override
  String get tourAnalysisDailyNeedsTitle => 'As Suas Necessidades Diárias';

  @override
  String get tourAnalysisDailyNeedsDesc =>
      'Veja as suas necessidades diárias de proteína, calorias, sono e água, ajustadas à sua altura e peso.';

  @override
  String get journeyDataDoneTitle => 'Primeiro passo concluído';

  @override
  String get journeyDataDoneSubtitle =>
      'Já temos seus dados e seu potencial. Agora vem o tour pelo app.';

  @override
  String get journeyContinue => 'Continuar';

  @override
  String get journeyEnterApp => 'Entrar no app';

  @override
  String get journeyProgressLabel => 'Começo';

  @override
  String get journeyTourDoneTitle => 'Bem-vindo ao BeTaller!';

  @override
  String get journeyTourDoneSubtitle =>
      'Você concluiu as três etapas. Agora é a sua vez: comece sua jornada completando sua primeira rotina.';

  @override
  String get journeyViewPlansButton => 'Ver planos para começar';

  @override
  String get paywallRestoreLabel => 'Restaurar compras';

  @override
  String get paywallYearly => 'Anual';

  @override
  String get paywallBestValue => 'Melhor valor';

  @override
  String paywallSavePercent(String percent) {
    return 'ECONOMIZE $percent%';
  }

  @override
  String paywallPerWeek(String price) {
    return '$price/semana';
  }

  @override
  String paywallPerMonth(String price) {
    return '$price/mês';
  }

  @override
  String paywallPerYear(String price) {
    return '$price/ano';
  }

  @override
  String get paywallMonthly => 'Mensal';

  @override
  String get paywallWeekly => 'Semanal';

  @override
  String get paywallFreeTrial => '3 dias grátis';

  @override
  String get paywallLoadError => 'Não foi possível carregar';

  @override
  String get paywallCtaAlt => 'Continuar';

  @override
  String get paywallTrialDisclaimer =>
      '3 dias grátis · renovação auto · cancele quando quiser';

  @override
  String get paywallYearlyDisclaimer =>
      'Renovação anual auto · cancele quando quiser';

  @override
  String paywallTrialThenWeekly(String days, String price) {
    return '$days dias grátis, depois $price/semana · cancele quando quiser';
  }

  @override
  String paywallTrialThenMonthly(String days, String price) {
    return '$days dias grátis, depois $price/mês · cancele quando quiser';
  }

  @override
  String paywallTrialThenYearly(String days, String price) {
    return '$days dias grátis, depois $price/ano · cancele quando quiser';
  }

  @override
  String get paywallRenewsWeekly =>
      'Renovação semanal auto · cancele quando quiser';

  @override
  String get paywallRenewsMonthly =>
      'Renovação mensal auto · cancele quando quiser';

  @override
  String get resultCardTitle => 'Sua altura adulta estimada';

  @override
  String resultRange(String min, String max) {
    return 'Faixa provável: de $min a $max';
  }

  @override
  String resultPercentile(String percent) {
    return 'Você supera $percent% das pessoas da sua idade';
  }

  @override
  String resultGrowthLeft(String amount) {
    return 'Crescimento restante estimado: $amount';
  }

  @override
  String get resultFootnote =>
      'Estimativa baseada na altura dos seus pais e em curvas de crescimento. Não é aconselhamento médico.';

  @override
  String get postureCheckTitle => 'Checagem rápida de postura';

  @override
  String get postureCheckIntro =>
      'Fique com os calcanhares, o quadril e as escápulas encostados na parede e responda a três perguntas. Sua pontuação vem das suas respostas; a foto fica salva para comparar o antes e o depois.';

  @override
  String get postureQHead =>
      'A parte de trás da sua cabeça encosta na parede sem levantar o queixo?';

  @override
  String get postureQHeadA1 => 'Sim, sem esforço';

  @override
  String get postureQHeadA2 => 'Só se eu forçar para trás';

  @override
  String get postureQHeadA3 => 'Não, fica um espaço';

  @override
  String get postureQShoulders =>
      'Na sua foto de perfil, onde estão seus ombros em relação às orelhas?';

  @override
  String get postureQShouldersA1 => 'Alinhados com as orelhas';

  @override
  String get postureQShouldersA2 => 'Um pouco à frente';

  @override
  String get postureQShouldersA3 => 'Claramente curvados para frente';

  @override
  String get postureQLowerBack =>
      'Passe uma mão atrás da lombar. Quanto espaço existe?';

  @override
  String get postureQLowerBackA1 => 'Cabe só uma mão reta';

  @override
  String get postureQLowerBackA2 => 'Nenhum espaço';

  @override
  String get postureQLowerBackA3 => 'Cabe um punho';

  @override
  String get postureCheckSave => 'Ver minha pontuação';

  @override
  String get postureCheckNote => 'Uma autoavaliação, não uma avaliação médica.';

  @override
  String get paywallTester => 'Tester';

  @override
  String get introTag1 => 'PREVISÃO';

  @override
  String get introTag2 => 'CRESCIMENTO';

  @override
  String get introTag3 => 'ACOMPANHAMENTO';

  @override
  String get introTag4 => 'GAMIFICAÇÃO';

  @override
  String get introTag5 => 'COMUNIDADE';

  @override
  String get introTitle1 => 'Descobre o teu\npotencial de altura';

  @override
  String get introSubtitle1 =>
      'Vamos calcular o teu potencial total\ncom base na genética, idade e estilo de vida.';

  @override
  String get introTitle2 => 'Um centímetro a mais\nem cada dia';

  @override
  String get introSubtitle2 =>
      'Potencia o teu crescimento com planos\npersonalizados de exercício e nutrição.';

  @override
  String get introTitle3 => 'Acompanha cada\ncentímetro';

  @override
  String get introSubtitle3 =>
      'Vê como o teu progresso real evolui\ncom medições mensais.';

  @override
  String get introTitle4 => 'Sobe de nível,\nganha recompensas';

  @override
  String get introSubtitle4 =>
      'Completa programas de 70 dias,\nganha XP e desbloqueia novos níveis.';

  @override
  String get introTitle5 => 'Milhares já\ncresceram';

  @override
  String get introSubtitle5 =>
      'Junta-te à comunidade de utilizadores\nque alcançaram o seu objetivo.';

  @override
  String get criticalWindow => 'JANELA CRÍTICA';

  @override
  String get heightPotentialFading => 'Os fatos sobre o seu';

  @override
  String get fadingAway => 'potencial de altura..';

  @override
  String get painHookDesc =>
      'A cada dia que passa sem os hábitos certos, perdem-se centímetros de forma permanente. Mas isto ainda pode ser revertido.';

  @override
  String get painGeneticTitle => 'A genética não é tudo';

  @override
  String get painGeneticDesc =>
      'A genética determina 60%, os outros 40% dependem de você. O BeTaller existe exatamente para esses 40%.';

  @override
  String get painGeneticTag => 'Análise';

  @override
  String get painSleepTitle => 'Otimize sua rotina de sono';

  @override
  String get painSleepDesc =>
      'Dormir bem todas as noites pode aumentar a produção do hormônio do crescimento em 70%. O BeTaller automatiza o acompanhamento do sono, você só precisa dormir.';

  @override
  String get painSleepTag => 'Acompanhamento';

  @override
  String get painPostureTitle => 'Ganhe centímetros já com a postura';

  @override
  String get painPostureDesc =>
      'Uma postura correta pode adicionar instantaneamente 1,5-3 cm. A rotina diária de postura do BeTaller estabelece isso em poucas semanas.';

  @override
  String get painPostureTag => 'Postura';

  @override
  String get painExerciseTitle =>
      'Seu plano de exercícios personalizado está pronto';

  @override
  String get painExerciseDesc =>
      'Alongamentos matinais, suspensão, rotinas para a coluna: o BeTaller preparou e programou tudo para você. Só 8-12 minutos por dia.';

  @override
  String get painExerciseTag => 'Rotinas';

  @override
  String get painNutritionTitle =>
      'Sua alimentação afeta diretamente o crescimento';

  @override
  String get painNutritionDesc =>
      'Proteína, cálcio, vitamina D: o BeTaller lembra você todos os dias de quais nutrientes tomar e quando.';

  @override
  String get painNutritionTag => 'Nutrição';

  @override
  String get painTrackingTitle =>
      'Acompanhe seu crescimento com os próprios olhos';

  @override
  String get painTrackingDesc =>
      'Medições mensais, fotos de progresso, gráfico de crescimento: veja cada centímetro ganho.';

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
  String get middleEasternIndigenous => 'Médio Oriente / Indígena';

  @override
  String get dontWantToAnswer => 'Prefiro não responder';

  @override
  String get footSizeLabel => 'Número de calçado';

  @override
  String get selectYourSize => 'Selecione seu número';

  @override
  String get whatsYourDreamHeight => 'Qual é a sua altura dos sonhos?';

  @override
  String get dreamHeightCalcSubtitle =>
      'Com base nos seus dados, vamos calcular a chance de você alcançar essa altura.';

  @override
  String get dreamHeightLabel => 'Altura ideal';

  @override
  String get sleepQuestion => 'Quantas horas\ndormes por noite?';

  @override
  String get thousandsSucceeded => 'Milhares já\nconseguiram';

  @override
  String get youCanToo => 'Tu também consegues';

  @override
  String get yearsOld => 'anos';

  @override
  String get verifiedLabel => 'Verificado';

  @override
  String get scientificData => 'DADOS CIENTÍFICOS';

  @override
  String get longTermResults => 'O BeTaller cria\nresultados duradouros';

  @override
  String get longTermResultsSubtitle =>
      'Muitas pessoas não alcançam a sua altura máxima devido a maus hábitos.';

  @override
  String get yourFinalHeight => 'A tua altura final';

  @override
  String get badHabitsLegend => 'Maus hábitos';

  @override
  String get optimizedLegend => 'Otimizado';

  @override
  String get chartFact1Pct => '30%';

  @override
  String get chartFact1Desc => 'A altura pode mudar\ncom os hábitos';

  @override
  String get chartFact2Pct => '9-10h';

  @override
  String get chartFact2Desc =>
      'O sono ideal estimula a\nhormona do crescimento';

  @override
  String get chartFact3Pct => '3 cm';

  @override
  String get chartFact3Desc => 'Podem ser ganhos ao\nmelhorar a postura';

  @override
  String get didYouKnow => 'Sabias que...?';

  @override
  String get didYouKnowFact1 =>
      'Os hábitos diários influenciam 30% da tua altura';

  @override
  String get didYouKnowFact2 =>
      'A compressão da coluna rouba-te 1,5-3 cm de altura';

  @override
  String get didYouKnowFact3 => 'A falta de sono reduz a HGH em 70%';

  @override
  String get transformJourneyBegins => 'A tua transformação\ncomeça agora';

  @override
  String get transformJourneySubtitle =>
      'Um programa completo desenhado para apoiar\no teu crescimento saudável, passo a passo.';

  @override
  String get week1Label => '1S';

  @override
  String get week1Title => 'Semana 1';

  @override
  String get week1Desc =>
      'O alinhamento da coluna melhora, a postura fica melhor';

  @override
  String get month1Label => '1M';

  @override
  String get month1Title => 'Mês 1';

  @override
  String get month1Desc =>
      'Primeiros centímetros visíveis, melhor qualidade de sono';

  @override
  String get month3Label => '3M';

  @override
  String get month3Title => 'Mês 3';

  @override
  String get month3Desc =>
      'Ganho médio de +1,5–2,5 cm, desenvolvimento muscular';

  @override
  String get month6Label => '6M';

  @override
  String get month6Title => 'Mês 6';

  @override
  String get month6Desc =>
      'Alcança o teu potencial máximo, vive com a tua nova altura';

  @override
  String get reachYourGoal => 'Alcança o teu objetivo';

  @override
  String get journeyBullet1 => 'Desbloqueia o teu potencial máximo';

  @override
  String get journeyBullet2 => 'Começa a viver com a tua nova altura';

  @override
  String get journeyBullet3 => 'Escreve a tua história de sucesso';

  @override
  String get unlockButton => 'Desbloquear tudo';

  @override
  String get dreamHeightOdds => 'Probabilidades da tua\naltura ideal';

  @override
  String get growthCompleteLabel => 'Crescimento\nconcluído';

  @override
  String get tallerThanPct => 'Mais alto do que 76,7% na tua idade';

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
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: 'Faltam $days dias',
      one: 'Falta $days dia',
    );
    return '$_temp0 no programa';
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

  @override
  String readTimeMinutes(int minutes) {
    return '$minutes min de leitura';
  }

  @override
  String get inThisArticle => 'Neste artigo';

  @override
  String get nextArticle => 'Próximo artigo';

  @override
  String get purchaseUnavailable =>
      'Não foi possível concluir a compra. Tente novamente.';

  @override
  String get viewPlan => 'Ver plano';

  @override
  String get viewPlanSubtitle => 'Veja os detalhes da sua assinatura';

  @override
  String predictionConfidenceHint(String percent) {
    return 'Cada medição adicionada leva a previsão a $percent%';
  }

  @override
  String get paywallSlideHomeTitle => 'Seu dia, em uma tela';

  @override
  String get paywallSlideHomeCaption =>
      'Rotinas, água, sono: três anéis para fechar.';

  @override
  String get paywallSlideProgressTitle => 'Veja cada centímetro';

  @override
  String get paywallSlideProgressCaption => 'Cada medição entra logo na curva.';

  @override
  String get paywallSlideAnalysisTitle => 'Cinco métricas, uma forma';

  @override
  String get paywallSlideAnalysisCaption =>
      'O radar aponta seu ponto mais fraco.';

  @override
  String get paywallSlidePotentialTitle => 'Conheça seu potencial';

  @override
  String get paywallSlidePotentialCaption =>
      'Veja onde você está entre os da sua idade.';

  @override
  String get paywallSlideDisciplineTitle => 'Não quebres a sequência';

  @override
  String get paywallSlideDisciplineCaption => 'Cada dia sobe o teu nível.';

  @override
  String get paywallSlideRemindersTitle => 'Lembrado na hora certa';

  @override
  String get paywallSlideRemindersCaption =>
      'Defina os horários, o app cuida do resto.';

  @override
  String get paywallSlidePostureTitle => 'Corrija sua postura';

  @override
  String get paywallSlidePostureCaption =>
      'Uma foto de perfil, uma autoavaliação rápida, uma rotina clara.';

  @override
  String paywallTrialHeadline(String days) {
    return '$days DIAS GRÁTIS';
  }

  @override
  String paywallTrialThen(String price) {
    return 'Depois $price · cancela quando quiseres';
  }

  @override
  String paywallYearlyBilled(String price) {
    return '$price / ano · cancela quando quiseres';
  }

  @override
  String get obBedtimeTitle => 'A que horas costumas dormir?';

  @override
  String get obBedtimeSubtitle =>
      'Seu lembrete de sono vai seguir este horário.';

  @override
  String get obWorkoutTimeTitle => 'A que horas treinas?';

  @override
  String get obWorkoutTimeSubtitle => 'Para o lembrete chegar na hora certa.';

  @override
  String get obMealsTitle => 'Quantas refeições por dia?';

  @override
  String get obMealsSubtitle =>
      'Toque em um horário para ajustar à sua rotina.';

  @override
  String obMealsCount(String count) {
    return '$count refeições';
  }

  @override
  String obMealLabel(String n) {
    return 'Refeição $n';
  }

  @override
  String get obProteinTitle => 'Quantos gramas de proteína por dia?';

  @override
  String get obProteinSubtitle =>
      'Um valor aproximado chega para montar o plano.';

  @override
  String get obCaloriesTitle => 'Quantas calorias por dia?';

  @override
  String get obCaloriesSubtitle => 'Uma estimativa serve; afinamos depois.';

  @override
  String get obNotSure => 'Não tenho a certeza';

  @override
  String get silNow => 'AGORA';

  @override
  String get silPotential => 'POTENCIAL';

  @override
  String get chartMeasured => 'Suas medidas';

  @override
  String chartPotential(String height) {
    return 'Potencial $height';
  }

  @override
  String chartDream(String height) {
    return 'Sua meta $height';
  }

  @override
  String get targetsTitle => 'Hoje, para você';

  @override
  String get targetsSubtitle => 'Calculado pela sua idade, peso e treino.';

  @override
  String get targetProtein => 'Proteína';

  @override
  String get targetCalcium => 'Cálcio';

  @override
  String get targetVitaminD => 'Vitamina D';

  @override
  String get targetWater => 'Água';

  @override
  String get targetSleep => 'Sono';

  @override
  String get targetMove => 'Treino';

  @override
  String targetPerMeal(String g) {
    return '$g g por refeição';
  }

  @override
  String get unitHours => 'h';

  @override
  String get unitMinutes => 'min';

  @override
  String get planStrength => 'Força';

  @override
  String get planJump => 'Saltos e sprints';

  @override
  String get planMobility => 'Alongamento';

  @override
  String get planSport => 'Esporte';

  @override
  String get planPosture => 'Postura';

  @override
  String get planRest => 'Descanso';

  @override
  String planWeekTitle(int days) {
    return 'Sua semana: $days dias de treino';
  }

  @override
  String get planPreviewTitle => 'Seu plano está pronto';

  @override
  String planPreviewTraining(int days) {
    return '$days dias de treino por semana, pensados para crescer';
  }

  @override
  String planPreviewProtein(int grams) {
    return '$grams g de proteína por dia, divididos nas refeições';
  }

  @override
  String planPreviewSleep(String hours) {
    return '$hours horas de sono, com lembrete da hora de dormir';
  }

  @override
  String nTrainTitle(String plan, int minutes) {
    return 'Hoje: $plan · $minutes min';
  }

  @override
  String get nRestTitle => 'Hoje é dia de descanso';

  @override
  String get nRestBody =>
      'Dez minutos de alongamento bastam. Recuperar faz parte do plano.';

  @override
  String nProteinTitle(int grams) {
    return 'Sua meta de proteína hoje: $grams g';
  }

  @override
  String nProteinBody(int grams) {
    return 'Cerca de $grams g por refeição: ovos, iogurte, frango, lentilha.';
  }

  @override
  String nWaterTitle(String liters) {
    return 'Meta de água: $liters';
  }

  @override
  String get nWaterBody => 'Um copo agora e você segue na meta de hoje.';

  @override
  String get nSleepTitle => 'Hora de dormir';

  @override
  String nSleepBody(String hours) {
    return 'Sua meta: $hours horas. Telas desligadas, luz baixa.';
  }

  @override
  String nMeasureBody(String potential) {
    return 'Seu potencial: $potential. Meça de manhã e veja seu gráfico avançar.';
  }

  @override
  String get nTrialDay1Title => 'Seu plano está esperando';

  @override
  String nTrialDay1Body(String plan, int minutes) {
    return 'Hoje: $plan, $minutes min. Registre sua altura para começar o gráfico.';
  }

  @override
  String get nTrialEndTitle => 'Seu teste grátis termina amanhã';

  @override
  String nTrialEndBody(String price) {
    return 'Depois continua por $price. Seu plano e progresso ficam salvos de qualquer forma.';
  }

  @override
  String get trophyContinue => 'Continuar';

  @override
  String get guideSteps => 'Passo a passo';

  @override
  String get guideMistakes => 'Erros comuns';

  @override
  String get guideTip => 'Dica';

  @override
  String get homeHeroTitle => 'Sua altura e seu potencial';

  @override
  String homeHeroGap(String cm) {
    return 'Ainda há $cm pela frente';
  }

  @override
  String get anSubtitle => 'Sua pontuação, o que a move e para onde você vai';

  @override
  String get anScoreLabel => 'Pontuação BeTaller';

  @override
  String get anTierStarting => 'Início';

  @override
  String get anTierBuilding => 'Construindo';

  @override
  String get anTierRising => 'Subindo';

  @override
  String get anTierStrong => 'Forte';

  @override
  String get anTierPeak => 'Topo';

  @override
  String anTrendUp(int n) {
    return '+$n vs semana passada';
  }

  @override
  String anTrendDown(int n) {
    return '-$n vs semana passada';
  }

  @override
  String get anTrendFlat => 'Igual à semana passada';

  @override
  String get anTrendFirst => 'Sua tendência semanal começa na próxima semana';

  @override
  String anNextTier(int n, String tier) {
    return '$n pontos para $tier';
  }

  @override
  String get anTopTier => 'Nível máximo. Mantenha';

  @override
  String anCoverage(int n, int total) {
    return 'Baseado em $n de $total sinais';
  }

  @override
  String get anNoScoreTitle => 'Ainda não há dados suficientes';

  @override
  String get anNoScoreBody =>
      'Registre hoje seu sono, um pouco de água ou um treino e sua primeira pontuação aparece.';

  @override
  String get anFastestWin => 'Ganho mais rápido';

  @override
  String get anBreakdownTitle => 'O que forma sua pontuação';

  @override
  String get anBreakdownHint =>
      'Cada sinal vale de 0 a 100 com base nos seus dados. A porcentagem é o quanto ele conta.';

  @override
  String anWeight(int n) {
    return '$n%';
  }

  @override
  String get anNoData => 'Ainda sem dados';

  @override
  String get anNotCounted => 'Não conta';

  @override
  String get anFTraining => 'Treino';

  @override
  String get anFConsistency => 'Constância';

  @override
  String get anFSleep => 'Sono';

  @override
  String get anFHydration => 'Hidratação';

  @override
  String get anFNutrition => 'Nutrição';

  @override
  String get anFPosture => 'Postura';

  @override
  String get anFMeasuring => 'Medição';

  @override
  String get anFGrowth => 'Velocidade de crescimento';

  @override
  String get anFHeadroom => 'Margem de crescimento';

  @override
  String anBTraining(int done, int planned) {
    return '$done de $planned dias de treino planejados nos últimos 7 dias';
  }

  @override
  String get anBTrainingNone =>
      'Conta os dias em que você treina em relação ao seu plano semanal.';

  @override
  String anBConsistency(int streak, int active, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      streak,
      locale: localeName,
      other: '$streak dias',
      one: '$streak dia',
    );
    return 'Sequência de $_temp0, $active de $days dias com metade do plano feito';
  }

  @override
  String get anBConsistencyNone =>
      'Conta sua sequência e os dias em que você faz pelo menos metade do plano.';

  @override
  String anBSleep(String hours, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days noites registradas',
      one: '$days noite registrada',
    );
    return '$hours h por noite em média, meta $target h, $_temp0';
  }

  @override
  String get anBSleepNone => 'Nenhum sono registrado nos últimos 7 dias.';

  @override
  String anBHydration(String litres, String target, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias registrados',
      one: '$days dia registrado',
    );
    return '$litres por dia em média, meta $target, $_temp0';
  }

  @override
  String get anBHydrationNone => 'Nenhuma água registrada nos últimos 7 dias.';

  @override
  String anBNutrition(int done, int planned) {
    return '$done de $planned hábitos de nutrição feitos nos últimos 7 dias';
  }

  @override
  String get anBNutritionNone =>
      'Conta os hábitos de proteína, cálcio, zinco e vitamina D do seu plano.';

  @override
  String anBPosture(int raw, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return 'Autoteste na parede $raw/90, há $_temp0';
  }

  @override
  String anBPostureToday(int raw) {
    return 'Autoteste na parede $raw/90, hoje';
  }

  @override
  String get anBPostureNone => 'Ainda não há autoteste de postura.';

  @override
  String anBMeasuring(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return 'Última medição há $_temp0';
  }

  @override
  String get anBMeasuringToday => 'Medido hoje';

  @override
  String get anBMeasuringNone => 'Ainda sem medições.';

  @override
  String anBGrowth(String v, String e) {
    return '$v por ano, típico na sua idade $e';
  }

  @override
  String get anBGrowthNone =>
      'Precisa de duas medições com pelo menos 30 dias de intervalo.';

  @override
  String get anBGrowthAdult =>
      'As placas de crescimento costumam fechar até os 21, então a velocidade de crescimento não conta para você.';

  @override
  String anBHeadroom(String cm) {
    return '$cm entre hoje e o seu potencial';
  }

  @override
  String get anATraining => 'Comece o treino de hoje';

  @override
  String get anAConsistency => 'Termine metade do plano de hoje';

  @override
  String get anASleepLog => 'Registre o sono da noite passada';

  @override
  String anASleep(String target) {
    return 'Durma $target h esta noite';
  }

  @override
  String get anAHydrationLog => 'Registre um copo de água';

  @override
  String anAHydration(String left) {
    return 'Beba mais $left hoje';
  }

  @override
  String get anAHydrationDone => 'Meta batida hoje. Amanhã de novo';

  @override
  String get anANutrition => 'Marque os hábitos de nutrição de hoje';

  @override
  String get anAPostureFirst => 'Faça o autoteste de postura de 1 minuto';

  @override
  String get anAPostureRedo => 'Refaça seu autoteste de postura';

  @override
  String get anAPostureKeep => 'Mantenha a rotina diária de postura';

  @override
  String get anAMeasure => 'Meça sua altura agora';

  @override
  String get anAMeasureKeep => 'Meça de novo na próxima semana';

  @override
  String anAGrowthWait(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return 'Meça de novo em $_temp0';
  }

  @override
  String get anAGrowth => 'Meça a cada 2 semanas para acompanhar';

  @override
  String get anAHeadroom => 'Veja seu potencial';

  @override
  String get anPotentialTitle => 'Seu potencial';

  @override
  String get anPotentialLabel => 'Altura adulta prevista';

  @override
  String anPotentialToGo(String cm) {
    return 'faltam +$cm';
  }

  @override
  String get anPotentialReached => 'Você chegou à sua altura prevista';

  @override
  String get anPotentialNote => 'O mesmo número em todo o app. Ele só sobe.';

  @override
  String anDreamLine(String h) {
    return 'Sua meta: $h';
  }

  @override
  String get anSourcesTitle => 'De onde vêm os centímetros';

  @override
  String get anSourcesGenes => 'Genes e idade';

  @override
  String get anSourcesHabits => 'Sono, comida, treino';

  @override
  String get anSourcesPosture => 'Postura';

  @override
  String get anPctTitle => 'Altura para a sua idade';

  @override
  String anPctValue(int p) {
    return 'Mais alto que $p% das pessoas da sua idade';
  }

  @override
  String get anPctBasis =>
      'Curvas de crescimento CDC dos EUA, mesma idade e sexo';

  @override
  String get anPctMore => 'Comparação completa';

  @override
  String get anNeedsBasis => 'Calculado pela sua idade, peso e treino';

  @override
  String get anCalcium => 'Cálcio';

  @override
  String get anVitaminD => 'Vitamina D';

  @override
  String get anMovement => 'Movimento';

  @override
  String get anUnitMin => 'min';

  @override
  String get anUnitHours => 'h';

  @override
  String get anPerDay => 'por dia';

  @override
  String get anPerNight => 'por noite';

  @override
  String get anUnlockScoreTitle => 'Sua pontuação BeTaller completa';

  @override
  String get anUnlockScoreBody =>
      'A pontuação, os nove sinais por trás e o que fazer em seguida.';

  @override
  String get anUnlockSourcesTitle => 'Veja de onde vêm seus centímetros';

  @override
  String get anUnlockNeedsTitle =>
      'Suas necessidades diárias, calculadas para você';

  @override
  String get anUnlockCta => 'Desbloquear';

  @override
  String get anFlowResultTitle => 'Salvo no seu gráfico';

  @override
  String get anFlowResultBody =>
      'Suas alturas passadas agora estão na mesma curva das suas medições e do seu potencial.';

  @override
  String get anFlowOpenAnalysis => 'Abra sua análise';

  @override
  String anTopPct(int p) {
    return 'TOP $p%';
  }

  @override
  String get anNeedsTitle => 'Suas necessidades diárias';

  @override
  String get pgUnlockPro => 'Desbloquear com o Pro';

  @override
  String get pgPhotosLockedTitle => 'Veja sua transformação';

  @override
  String get pgPhotosLockedBody =>
      'Salve uma foto com sua altura a cada duas semanas e compare duas delas com um controle deslizante.';

  @override
  String get pgTransformationTitle => 'Sua transformação';

  @override
  String get pgHeightChange => 'diferença de altura';

  @override
  String get pgDaysApart => 'dias de diferença';

  @override
  String pgCompareMeaningGrew(String delta, int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return '$delta entre estas duas fotos, tiradas com $_temp0 de diferença.';
  }

  @override
  String pgCompareMeaningSame(int days) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return 'Mesma altura, com $_temp0 de diferença. Postura e forma mudam primeiro, a altura vem ao longo dos meses.';
  }

  @override
  String get pgModeSlider => 'Deslizador';

  @override
  String get pgModeSideBySide => 'Lado a lado';

  @override
  String get pgDragToReveal => 'Arraste para comparar';

  @override
  String get pgOnePhotoTitle => 'Sua foto do antes está salva';

  @override
  String pgOnePhotoBody(String date) {
    return 'Tire a próxima em $date na mesma pose para ver sua primeira comparação.';
  }

  @override
  String get pgEmptyTitle => 'Comece sua transformação';

  @override
  String get pgEmptyBody =>
      'Uma foto a cada duas semanas, mesma pose, mesmo lugar, com sua altura. Em alguns meses você desliza entre o dia 1 e hoje.';

  @override
  String get pgTakeFirstPhoto => 'Tire sua primeira foto';

  @override
  String get pgPhotoDueNow => 'Hora de uma foto nova';

  @override
  String pgNextPhotoOn(String date) {
    return 'Próxima foto $date';
  }

  @override
  String pgDayN(int n) {
    return 'Dia $n';
  }

  @override
  String get pgNewPhoto => 'Nova foto';

  @override
  String get pgGuideTitle => 'A mesma pose, sempre';

  @override
  String get pgGuideSubtitle =>
      'As fotos só se comparam bem quando são tiradas do mesmo jeito.';

  @override
  String get pgGuideGhost =>
      'Sua última foto aparece clarinha. Alinhe-se com ela.';

  @override
  String get pgGuideStep1 => 'Fique a 2 m, celular na altura do peito';

  @override
  String get pgGuideStep2 =>
      'De frente para a câmera, pés juntos, braços soltos';

  @override
  String get pgGuideStep3 => 'Mesmo lugar, mesma luz, roupa justa';

  @override
  String get pgGuideDistance => '2 m';

  @override
  String get pgChestHeight => 'altura do peito';

  @override
  String get pgTakePhoto => 'Tirar foto';

  @override
  String get pgFromGallery => 'Escolher da galeria';

  @override
  String get pgChoosePhoto => 'Escolha uma foto';

  @override
  String get pgPostureTitle => 'Checagem de postura';

  @override
  String get pgPostureLockedTitle => 'Descubra seus pontos fracos';

  @override
  String get pgPostureLockedBody =>
      'Avalie cabeça, ombros e lombar, receba dois exercícios para cada um e acompanhe sua pontuação semana a semana.';

  @override
  String get pgAreaHead => 'Cabeça';

  @override
  String get pgAreaShoulders => 'Ombros';

  @override
  String get pgAreaLowerBack => 'Lombar';

  @override
  String get pgHeadMeaning0 =>
      'Sua cabeça está bem em cima dos ombros. Mantenha assim com um ajuste rápido por dia.';

  @override
  String get pgHeadMeaning1 =>
      'Sua cabeça vai para a frente quando você relaxa. Muito comum com muito tempo de celular, e melhora rápido.';

  @override
  String get pgHeadMeaning2 =>
      'Sua cabeça fica à frente dos ombros. Corrija isso primeiro: faz você parecer mais baixo em toda foto.';

  @override
  String get pgShouldersMeaning0 =>
      'Ombros alinhados com as orelhas. A parte alta das costas está fazendo o trabalho dela.';

  @override
  String get pgShouldersMeaning1 =>
      'Ombros um pouco para a frente. O peito tenso puxa eles para dentro; abrir o peito traz de volta.';

  @override
  String get pgShouldersMeaning2 =>
      'Ombros curvados. A parte alta das costas se curva para a frente e tira altura da sua postura.';

  @override
  String get pgLowerBackMeaning0 =>
      'Uma curva neutra. Quadril e abdômen seguram sua coluna onde ela deve ficar.';

  @override
  String get pgLowerBackMeaning1 =>
      'Lombar reta. Extensão leve e mobilidade trazem de volta a curva natural.';

  @override
  String get pgLowerBackMeaning2 =>
      'Um arco forte. Os flexores do quadril tensos inclinam a pelve para a frente; alongar e fortalecer o abdômen equilibra.';

  @override
  String get pgLegacyMeaning =>
      'Salvo por uma versão antiga sem estas perguntas. Refaça a checagem para receber dicas desta área.';

  @override
  String get pgHowItWorks => 'Como a checagem funciona';

  @override
  String get pgYourPosture => 'Sua postura';

  @override
  String pgCheckedOn(String date) {
    return 'Feita em $date';
  }

  @override
  String get pgOutOf100 => 'de 100';

  @override
  String get pgAllAreasGood => 'As três áreas estão boas. Mantenha assim.';

  @override
  String pgStartWith(String area) {
    return 'Comece por: $area';
  }

  @override
  String pgVsLastCheck(String delta) {
    return '$delta vs. a última';
  }

  @override
  String get pgStatusGood => 'Bom';

  @override
  String get pgStatusFair => 'Pode melhorar';

  @override
  String get pgStatusFix => 'Corrija primeiro';

  @override
  String get pgKeepItWith => 'Para manter';

  @override
  String get pgFixItWith => 'Para corrigir';

  @override
  String get pgRetakeNow => 'Hora da checagem semanal';

  @override
  String pgRetakeIn(int n) {
    String _temp0 = intl.Intl.pluralLogic(
      n,
      locale: localeName,
      other: 'Próxima checagem em $n dias',
      one: 'Próxima checagem amanhã',
    );
    return '$_temp0';
  }

  @override
  String get pgRetakeBodyDue =>
      'Mesma parede, mesmas três perguntas. A checagem semanal mostra se os exercícios estão funcionando.';

  @override
  String pgRetakeBodyWait(String date) {
    return 'Faça os exercícios acima até $date e depois refaça a checagem para ver se funcionaram.';
  }

  @override
  String get pgRetakeCheck => 'Refazer checagem';

  @override
  String get pgRetakeAnyway => 'Refazer agora';

  @override
  String get pgHistoryTitle => 'Suas pontuações';

  @override
  String pgSinceFirst(String delta) {
    return '$delta desde a primeira';
  }

  @override
  String get pgHistoryOne =>
      'Esta é sua primeira checagem. Refaça em 7 dias e sua evolução começa aqui.';

  @override
  String get pgPostureIntroTitle => 'O quanto você fica reto?';

  @override
  String get pgPostureIntroBody =>
      'Três perguntas encostado na parede, cerca de um minuto. Você recebe uma pontuação e dois exercícios para cada ponto fraco.';

  @override
  String get pgPostureStep1 =>
      'Fique com calcanhares, quadril e escápulas encostados na parede.';

  @override
  String get pgPostureStep2 =>
      'Tire uma foto de lado, corpo inteiro no quadro, para comparar depois.';

  @override
  String get pgPostureStep3 =>
      'Responda três perguntas com sinceridade. Sua pontuação vem das suas respostas.';

  @override
  String get pgPostureStep4 =>
      'Refaça uma vez por semana, no mesmo horário do dia.';

  @override
  String get pgStartCheck => 'Começar checagem';

  @override
  String pgWeekRange(String start, String end) {
    return 'De $start a $end';
  }

  @override
  String get pgGradeGreat => 'Semana de campeão';

  @override
  String get pgGradeGood => 'Semana sólida';

  @override
  String get pgGradeOk => 'Pegando ritmo';

  @override
  String get pgGradeStart => 'Um novo começo';

  @override
  String get pgTopWeek => 'Semana top';

  @override
  String pgVsLastWeek(String delta) {
    return '$delta vs. semana passada';
  }

  @override
  String get pgDaysCompleted => 'dias com o plano completo';

  @override
  String get pgDayStreak => 'dias seguidos';

  @override
  String pgBestDay(String day) {
    return 'Melhor: $day';
  }

  @override
  String get pgNextWeekFocus => 'Foco da próxima semana';

  @override
  String pgFocusPlan(int n, int done) {
    return 'Complete o plano inteiro em $n dias. Nesta semana foram $done.';
  }

  @override
  String pgFocusWorkouts(int n, int done) {
    return 'Encaixe $n treinos. Nesta semana você fez $done.';
  }

  @override
  String get pgFocusMeasure =>
      'Meça sua altura uma vez, de manhã, descalço, no mesmo lugar. É assim que você vê a mudança real.';

  @override
  String pgFocusKeepDay(String day) {
    return 'Todas as metas batidas. Agora faça de $day um dia completo também.';
  }

  @override
  String get pgFocusKeep =>
      'Todas as metas batidas e todo dia completo. Mesmo plano, mesmo ritmo.';

  @override
  String get pgHeightThisWeek => 'Altura nesta semana';

  @override
  String pgHeightNow(String height) {
    return 'Agora $height';
  }

  @override
  String get pgNoMeasurementWeek => 'Nenhuma medida nesta semana ainda';

  @override
  String get pgFirstMeasurement => 'Sua primeira medida';

  @override
  String pgStartedAt(String height) {
    return 'Início $height';
  }

  @override
  String pgPotentialAt(String height) {
    return 'Potencial $height';
  }

  @override
  String pgToPotential(String cm) {
    return 'Faltam $cm para seu potencial estimado.';
  }

  @override
  String get pgPotentialReached =>
      'Você está no seu potencial estimado. O trabalho de postura ainda pode somar ao que você mostra.';

  @override
  String get pgHabitsToday => 'Registrado hoje';

  @override
  String plWorkoutMeta(int moves, int minutes) {
    return '$moves exercícios · $minutes min';
  }

  @override
  String plDoneCount(int done, int total) {
    return '$done/$total feitos';
  }

  @override
  String get plStartWorkout => 'Começar treino';

  @override
  String get plContinueWorkout => 'Continuar treino';

  @override
  String get plWorkoutDoneToday => 'Treino de hoje feito';

  @override
  String get plTraining => 'Treino';

  @override
  String get plHabits => 'Hábitos diários';

  @override
  String get plRestDayNote =>
      'Dia leve: um flow curto de yoga te deixa solto para amanhã.';

  @override
  String plDoseReps(int sets, int reps) {
    return '$sets x $reps repetições';
  }

  @override
  String plDoseSeconds(int sets, int seconds) {
    return '$sets x $seconds s';
  }

  @override
  String plDoseSecondsSide(int sets, int seconds) {
    return '$sets x $seconds s cada lado';
  }

  @override
  String plDoseMinutes(int minutes) {
    return '$minutes min';
  }

  @override
  String plHabitProtein(int grams) {
    return '$grams g divididos nas refeições';
  }

  @override
  String plHabitWater(String liters) {
    return '$liters ao longo do dia';
  }

  @override
  String plHabitSleep(String hours) {
    return '$hours h esta noite';
  }

  @override
  String get plYourRoutines => 'Suas rotinas';

  @override
  String get plNewRoutine => 'Nova rotina';

  @override
  String get plCustomEmpty => 'Crie sua própria rotina e marque aqui todo dia.';

  @override
  String plDeleteRoutineQ(String name) {
    return 'Excluir \"$name\"?';
  }

  @override
  String get plHoldToDelete => 'Segure uma rotina para excluí-la.';

  @override
  String plSetOf(int current, int total) {
    return 'Série $current de $total';
  }

  @override
  String get plRest => 'Descanso';

  @override
  String get plStartSet => 'Começar série';

  @override
  String get plSetDone => 'Série feita';

  @override
  String get plSkipRest => 'Pular descanso';

  @override
  String get plNextMove => 'Próximo exercício';

  @override
  String get plSkipMove => 'Pular';

  @override
  String plUpNext(String name) {
    return 'A seguir: $name';
  }

  @override
  String get plLastMove => 'Último exercício';

  @override
  String get plWorkoutComplete => 'Treino concluído';

  @override
  String plWorkoutSummary(int moves, int minutes) {
    return '$moves exercícios em cerca de $minutes min. Cada treino conta.';
  }

  @override
  String get plEachSide => 'Cada lado';

  @override
  String get plMoveDone => 'Exercício feito';

  @override
  String plRepsBig(int reps) {
    return '$reps repetições';
  }

  @override
  String get plSessionHint =>
      'Vá no seu ritmo e toque em feito quando terminar.';

  @override
  String plProgramDayOf(int day, int total) {
    return 'Dia $day de $total';
  }

  @override
  String get plTodayStep => 'O passo de hoje';

  @override
  String get plTickToComplete => 'Marque cada exercício para concluir o dia';

  @override
  String plNextDayTomorrow(int day) {
    return 'O dia $day abre amanhã. Descansar também faz parte de crescer.';
  }

  @override
  String plNextLevelIn(int days, int level) {
    String _temp0 = intl.Intl.pluralLogic(
      days,
      locale: localeName,
      other: '$days dias',
      one: '$days dia',
    );
    return '$_temp0 para o nível $level';
  }

  @override
  String get plProgramFinished =>
      'Os 70 dias feitos. Você terminou o programa.';

  @override
  String plDayCompleteToast(int day) {
    return 'Dia $day concluído';
  }

  @override
  String get plLevelWeek => 'A semana deste nível';

  @override
  String get plProgressionTitle => 'Como fica mais difícil';

  @override
  String get plNow => 'Agora';

  @override
  String plLevelN(int n) {
    return 'Nv $n';
  }

  @override
  String get plUnlockProgram => 'Desbloquear o programa de 70 dias';

  @override
  String get plProgramPitch =>
      '10 níveis, um por semana. Cada um soma segundos às sustentações, repetições aos saltos e uma série quando você estiver pronto.';

  @override
  String plDayLocked(int day) {
    return 'Termine o dia $day primeiro';
  }

  @override
  String plCurrentDay(int day) {
    return 'Dia $day';
  }

  @override
  String get plTodaysTargets => 'Suas metas de hoje';

  @override
  String get plTargetsBasis => 'Calculadas pela sua idade, peso e treino';

  @override
  String plProteinSplit(int meals, int grams) {
    return '$meals refeições x $grams g';
  }

  @override
  String get plZinc => 'Zinco';

  @override
  String get plMagnesium => 'Magnésio';

  @override
  String get plEnergy => 'Energia';

  @override
  String get plChecklist => 'Sua lista de hoje';

  @override
  String plCheckProtein(int grams) {
    return 'Proteína $grams g';
  }

  @override
  String plCheckCalcium(String mg) {
    return 'Cálcio $mg mg';
  }

  @override
  String plCheckVitaminD(String iu) {
    return 'Vitamina D $iu UI';
  }

  @override
  String plCheckWater(String liters) {
    return 'Água $liters';
  }

  @override
  String plFromMeals(String amount) {
    return '$amount das refeições marcadas';
  }

  @override
  String get plVitaminDNote =>
      '15 min de sol do meio-dia nos braços e rosto, ou um suplemento aprovado pelo seu médico';

  @override
  String plWaterLogged(String liters) {
    return '$liters registrados até agora';
  }

  @override
  String get plMealPlan => 'Seu plano de refeições';

  @override
  String get plMealPlanSub =>
      'Comida de verdade, gramas de verdade, ajustados às suas metas';

  @override
  String get plSnack => 'Lanche';

  @override
  String plMealSum(int protein, String calcium, String kcal) {
    return '$protein g proteína · $calcium mg cálcio · $kcal kcal';
  }

  @override
  String plMealGoal(int grams) {
    return 'meta $grams g';
  }

  @override
  String get plMarkEaten => 'Marcar como comido';

  @override
  String get plEaten => 'Comido';

  @override
  String get plPlanTotal => 'Total do dia';

  @override
  String plFillEnergy(String planKcal, String kcal) {
    return 'Essas refeições dão cerca de $planKcal das suas $kcal kcal. Complete com frutas, legumes, pão ou arroz.';
  }

  @override
  String get plWeeklyMenu => 'Cardápio da semana';

  @override
  String get plWeeklyMenuSub =>
      'Um prato diferente a cada dia, as mesmas metas';

  @override
  String get plUnlockMenu => 'Desbloquear o cardápio completo da semana';

  @override
  String get plRecipes => 'Receitas';

  @override
  String get plRecipesSub => 'Pratos rápidos ricos em proteína';

  @override
  String get plNutritionGuide => 'Guia de nutrição';

  @override
  String get plNutritionGuideSub => 'Nutrientes, alimentos, suplementos';

  @override
  String plPieces(int n) {
    return '$n un.';
  }

  @override
  String get plFoodOats => 'Aveia';

  @override
  String get plFoodMilk => 'Leite';

  @override
  String get plFoodBanana => 'Banana';

  @override
  String get plFoodWalnuts => 'Nozes';

  @override
  String get plFoodGreekYogurt => 'Iogurte grego';

  @override
  String get plFoodYogurt => 'Iogurte natural';

  @override
  String get plFoodEggs => 'Ovos';

  @override
  String get plFoodBread => 'Pão integral';

  @override
  String get plFoodWhiteCheese => 'Queijo feta';

  @override
  String get plFoodHardCheese => 'Queijo curado';

  @override
  String get plFoodSalad => 'Salada de tomate e pepino';

  @override
  String get plFoodOrange => 'Laranja';

  @override
  String get plFoodPeanutButter => 'Pasta de amendoim';

  @override
  String get plFoodSpinach => 'Espinafre';

  @override
  String get plFoodCottageCheese => 'Queijo cottage';

  @override
  String get plFoodChicken => 'Peito de frango';

  @override
  String get plFoodBulgur => 'Triguilho';

  @override
  String get plFoodAyran => 'Ayran (bebida de iogurte)';

  @override
  String get plFoodTuna => 'Atum em lata';

  @override
  String get plFoodPasta => 'Macarrão';

  @override
  String get plFoodBeef => 'Carne magra';

  @override
  String get plFoodRice => 'Arroz';

  @override
  String get plFoodChickpeas => 'Grão-de-bico';

  @override
  String get plFoodSalmon => 'Salmão';

  @override
  String get plFoodBroccoli => 'Brócolis';

  @override
  String get plFoodPotato => 'Batatas';

  @override
  String get plFoodLentils => 'Lentilhas';

  @override
  String get plFoodSardines => 'Sardinhas';

  @override
  String get plFoodAlmonds => 'Amêndoas';

  @override
  String get plFoodKefir => 'Kefir';

  @override
  String get plFoodPumpkinSeeds => 'Sementes de abóbora';

  @override
  String get wtCoffee => 'Café';

  @override
  String get wtTea => 'Chá';

  @override
  String get wtCola => 'Refri';

  @override
  String get wtEnergyDrink => 'Energético';

  @override
  String get crCustomBadge => 'Própria';

  @override
  String get crNameHint => 'ex.: Alongamento energético da manhã';

  @override
  String get crDoseHint => 'ex.: 3x10 repetições ou 3x30 segundos';

  @override
  String get paywallLifetime => 'Vitalício';

  @override
  String paywallOnce(String price) {
    return '$price pagamento único';
  }

  @override
  String get paywallLifetimeBadge => 'Sem assinatura';

  @override
  String get paywallLifetimeDisclaimer =>
      'Pagamento único · sem assinatura, nada é renovado';

  @override
  String get pwSlidePotentialTitle => 'Descubra seu potencial';

  @override
  String get pwSlidePotentialCaption =>
      'Calculado pela sua idade, sua altura e a altura dos seus pais.';

  @override
  String get pwSlideTodayTitle => 'Um plano para cada dia';

  @override
  String get pwSlideTodayCaption =>
      'Treinos curtos todo dia, com guias em vídeo.';

  @override
  String get pwSlideProgramTitle => '70 dias, 10 níveis';

  @override
  String get pwSlideProgramCaption =>
      'A cada semana os exercícios ficam um pouco mais difíceis.';

  @override
  String get pwSlideNutritionTitle => 'Coma para crescer';

  @override
  String get pwSlideNutritionCaption =>
      'Suas metas diárias de proteína, cálcio e vitamina D.';

  @override
  String get pwSlideChartTitle => 'Veja sua curva subir';

  @override
  String get pwSlideChartCaption =>
      'Cada medida entra no caminho até o seu potencial.';

  @override
  String get pwSlideScoreTitle => 'Uma nota para seus hábitos';

  @override
  String get pwSlideScoreCaption => 'Veja qual hábito melhorar primeiro.';

  @override
  String get pwSlidePostureTitle => 'Endireite a postura hoje';

  @override
  String get pwSlidePostureCaption =>
      'Uma checagem rápida da postura e os exercícios para corrigi-la.';

  @override
  String get pwExample => 'Exemplo';

  @override
  String pwYouLine(String now, String potential) {
    return 'Você: $now → potencial $potential';
  }

  @override
  String pwExampleLine(String now, String potential) {
    return 'Exemplo: $now → potencial $potential';
  }

  @override
  String get tv3NewEyebrow => 'Novidades';

  @override
  String get tv3NewTitle => 'O BeTaller ganhou uma grande atualização';

  @override
  String get tv3NewDesc =>
      'Novo plano, novo programa, novo visual. Veja o que mudou.';

  @override
  String get tv3PotentialTitle => 'Este é o seu potencial';

  @override
  String get tv3PotentialDesc =>
      'Sua altura hoje ao lado da que você pode alcançar. O plano fecha a diferença.';

  @override
  String get tv3TodayTitle => 'Seu plano de hoje';

  @override
  String tv3TodayDesc(String button) {
    return 'Um treino curto feito para hoje. Toque em $button e acompanhe.';
  }

  @override
  String get tv3ProgramTitle => '70 dias de Disciplina';

  @override
  String get tv3ProgramDesc =>
      'Um passo por dia ao longo de 10 níveis. Cada dia se apoia no anterior.';

  @override
  String get tv3NutritionTitle => 'Suas metas do dia';

  @override
  String get tv3NutritionDesc =>
      'Proteína, cálcio, vitamina D e água, calculados para o seu corpo.';

  @override
  String get tv3ChartTitle => 'Acompanhe sua curva';

  @override
  String get tv3ChartDesc =>
      'Meça a cada uma ou duas semanas e veja sua linha subir rumo ao seu potencial.';

  @override
  String get tv3ScoreTitle => 'Sua pontuação BeTaller';

  @override
  String get tv3ScoreDesc =>
      'Um número para ver como você está indo. Melhore primeiro sua área mais fraca.';

  @override
  String get tv3Next => 'Próximo';

  @override
  String get tv3ShowMe => 'Me mostre';

  @override
  String get tv3Done => 'Vamos lá';

  @override
  String get obWhyTitle => 'Por que você quer ganhar altura?';

  @override
  String get obWhySubtitle =>
      'Escolha tudo o que combina com você. Seu plano começa pelo seu motivo.';

  @override
  String get obWhyConfidence => 'Ter mais confiança em mim';

  @override
  String get obWhyImpression => 'Causar uma primeira impressão melhor';

  @override
  String get obWhySports => 'Ir melhor nos esportes';

  @override
  String get obWhyClothes => 'A roupa cair melhor';

  @override
  String get obWhyPhotos => 'Sair melhor nas fotos';

  @override
  String get obWhyPotential => 'Só quero saber meu potencial';

  @override
  String get obTriedTitle => 'Você já testou outros apps de altura?';

  @override
  String get obTriedSubtitle =>
      'Não tem resposta errada. Isso ajuda a mostrar o que muda aqui.';

  @override
  String get obTriedStopped => 'Sim, mas parei';

  @override
  String get obTriedStill => 'Sim, ainda uso um';

  @override
  String get obTriedFirst => 'Não, este é o primeiro';

  @override
  String get obTriedStoppedTitle => 'Só um número não te faz avançar';

  @override
  String get obTriedStoppedBody =>
      'A maioria dos apps te dá um número. O BeTaller transforma isso num plano diário pra você ir marcando, com lembretes nos seus horários.';

  @override
  String get obTriedStillTitle => 'Fique com o que funciona pra você';

  @override
  String get obTriedStillBody =>
      'O BeTaller adiciona a parte do dia a dia: um plano feito com as suas respostas pra você marcar passo a passo.';

  @override
  String get obTriedFirstTitle => 'Um bom lugar pra começar';

  @override
  String get obTriedFirstBody =>
      'Aqui você não vai receber só um número. O BeTaller transforma suas respostas num plano diário pra ir marcando.';

  @override
  String get obTriedCardTitle => 'O que você marca todo dia';

  @override
  String get obTriedItem1 => 'Um treino curto, escolhido pra sua semana';

  @override
  String get obTriedItem2 => 'Sua meta de proteína';

  @override
  String get obTriedItem3 => 'Dormir na hora certa';

  @override
  String get obBlockTitle => 'O que te atrapalha?';

  @override
  String get obBlockSubtitle =>
      'Escolha tudo o que vale pra você. Seu plano se adapta a isso.';

  @override
  String get obBlockForget => 'Eu esqueço';

  @override
  String get obBlockTime => 'Falta tempo';

  @override
  String get obBlockExercises => 'Não sei quais exercícios fazer';

  @override
  String get obBlockMotivation => 'Perco a motivação';

  @override
  String get obBlockBedtime => 'Durmo tarde';

  @override
  String get obBlockMeals => 'Pulo refeições';

  @override
  String get obFirstTitle =>
      'Qual a primeira coisa que você vai fazer quando ganhar altura?';

  @override
  String get obFirstSubtitle =>
      'Imagine. É pra isso que você está se esforçando.';

  @override
  String get obFirstWardrobe => 'Renovar o guarda-roupa';

  @override
  String get obFirstMuscle => 'Ganhar músculo';

  @override
  String get obFirstPhotos => 'Postar mais fotos';

  @override
  String get obFirstTeam => 'Fazer teste pra um time';

  @override
  String get obFirstFeelGood => 'Nada de especial, só me sentir bem';

  @override
  String get obBuiltChip => 'Feito pra você';

  @override
  String get obBuiltTitle => 'Seu plano, feito sob medida';

  @override
  String get obBuiltReason => 'Seu motivo';

  @override
  String get obBuiltGoal => 'Meta';

  @override
  String get obBuiltWhen => 'Quando chegar lá';

  @override
  String get obBuiltBlockers => 'O que te atrapalha, resolvido';

  @override
  String get obFixForget => 'Lembretes nos horários que você escolheu';

  @override
  String get obFixTime => 'Sessões curtas, a maioria com uns 15 minutos';

  @override
  String get obFixExercises => 'Exercícios guiados por vídeo, passo a passo';

  @override
  String get obFixMotivation => 'Sequências e níveis pra você não parar';

  @override
  String get obFixBedtime => 'Uma meta de sono e um lembrete antes de dormir';

  @override
  String get obFixMeals => 'Uma meta de proteína e um plano de refeições';

  @override
  String get obNotifTitle => 'O BeTaller te lembra na hora que importa';

  @override
  String get obNotifSubtitle =>
      'Nos horários que você informou. Dá pra mudar quando quiser.';

  @override
  String get obNotifWorkout => 'Treino';

  @override
  String obNotifWorkoutDetail(String time) {
    return '30 min antes do seu treino das $time';
  }

  @override
  String get obNotifMeal => 'Refeição e proteína';

  @override
  String obNotifMealDetail(String time) {
    return 'Na sua refeição das $time';
  }

  @override
  String get obNotifWater => 'Água';

  @override
  String get obNotifWaterDetail => 'Uma pausa pra água à tarde';

  @override
  String get obNotifSleep => 'Hora de desacelerar';

  @override
  String obNotifSleepDetail(String time) {
    return 'Uma hora antes de dormir, às $time';
  }

  @override
  String get obNotifAllow => 'Ativar lembretes';

  @override
  String get obNotifNotNow => 'Agora não';

  @override
  String get obNotifNow => 'agora';

  @override
  String get ftOneFree => '1 grátis';

  @override
  String get ftFreeToday => 'Grátis hoje';

  @override
  String get ftContinuePro => 'Continuar com o Pro';

  @override
  String get ftNotNow => 'Agora não';

  @override
  String get ftOutWorkoutTitle => 'Você já usou seu treino grátis';

  @override
  String get ftOutWorkoutBody =>
      'Mantenha sua sequência com o Pro: um treino guiado todo dia, cada exercício cronometrado pra você.';

  @override
  String get ftOutDayTitle => 'Seu primeiro dia grátis acabou';

  @override
  String get ftOutDayBody =>
      'Seu plano, suas metas e seu progresso continuam aqui pra ler. Mantenha sua sequência com o Pro: marque seu plano e registre água e sono todo dia.';

  @override
  String get ftOutPostureTitle =>
      'Você já usou sua avaliação de postura grátis';

  @override
  String get ftOutPostureBody =>
      'Seu resultado fica aqui. Refaça toda semana com o Pro e veja sua postura melhorar.';

  @override
  String get ftOutPhotosTitle => 'Você já usou sua comparação de fotos grátis';

  @override
  String get ftOutPhotosBody =>
      'Esse par continua seu. Adicione mais fotos e compare as que quiser com o Pro.';

  @override
  String get ftOutReportTitle => 'Você já usou seu relatório semanal grátis';

  @override
  String get ftOutReportBody =>
      'Receba seu resumo completo toda semana com o Pro: cada dia avaliado, suas metas e uma coisa pra melhorar.';

  @override
  String get ftOutScoreTitle =>
      'Você já viu o detalhamento grátis da sua pontuação';

  @override
  String get ftOutScoreBody =>
      'Sua pontuação continua na tela. Veja todo dia com o Pro o que a forma e o que fazer em seguida.';

  @override
  String get ftOutArticleTitle => 'Você já leu seu artigo grátis';

  @override
  String get ftOutArticleBody =>
      'Esse artigo continua aberto pra você. Leia a biblioteca inteira com o Pro.';

  @override
  String get ftWhyWorkout => 'Treinos guiados fazem parte do Pro';

  @override
  String get ftWhyPlan => 'Marcar seu plano faz parte do Pro';

  @override
  String get ftWhyProgram => 'O programa de 70 dias faz parte do Pro';

  @override
  String get ftWhyWater => 'Registrar água todo dia faz parte do Pro';

  @override
  String get ftWhySleep => 'Registrar o sono todo dia faz parte do Pro';

  @override
  String get ftWhyNutrition => 'Seu plano de nutrição diário faz parte do Pro';

  @override
  String get ftWhyPosture =>
      'As avaliações de postura semanais fazem parte do Pro';

  @override
  String get ftWhyPhotos => 'As comparações de fotos fazem parte do Pro';

  @override
  String get ftWhyReport => 'Seu relatório semanal faz parte do Pro';

  @override
  String get ftWhyScore => 'O detalhamento da sua pontuação faz parte do Pro';

  @override
  String get ftWhyArticle => 'A biblioteca completa faz parte do Pro';

  @override
  String get ftPlanLocked =>
      'Seu plano continua aqui pra ler. Marcar faz parte do Pro.';

  @override
  String get ftNutritionLocked =>
      'Suas metas e refeições continuam aqui pra ler. Marcar faz parte do Pro.';

  @override
  String get ftPreviewTag => 'Prévia';

  @override
  String get ftPreviewTitle => 'Essa foi sua prévia';

  @override
  String get ftPreviewBody =>
      'O resto deste treino faz parte do Pro. Veja o que vem a seguir:';

  @override
  String get ftFreeWorkoutUsed =>
      'Esse foi seu treino guiado grátis. Com o Pro, tem um todo dia.';

  @override
  String get ftScoreLockedTitle => 'O que forma sua pontuação';

  @override
  String get ftScoreLockedBody =>
      'Cada parte da sua pontuação, no que ela se baseia e a próxima coisa a fazer.';

  @override
  String get ftReportLockedTitle => 'Sua semana completa';

  @override
  String get ftReportLockedBody =>
      'Cada dia avaliado pelo seu plano, suas metas, sua altura e um foco pra próxima semana.';

  @override
  String get ftPhotosLockedTitle => 'Compare estas duas';

  @override
  String get ftPhotosLockedBody =>
      'Você já usou sua comparação grátis. Com o Pro, deslize entre duas fotos quaisquer.';

  @override
  String get ftArticleFreeLine =>
      'Seu primeiro artigo é grátis. Escolha o que quiser.';

  @override
  String get plFinishWorkout => 'Finalizar';

  @override
  String get obTriedMostApps => 'A maioria dos apps';

  @override
  String get obTriedThatsIt => 'Um número, e só.';

  @override
  String get obTriedPlanLabel => 'Seu dia no BeTaller';

  @override
  String get obTriedProteinSub => 'Dividido entre suas refeições';

  @override
  String get obTriedSleepSub => 'Um lembrete antes de dormir';

  @override
  String get obTriedFeatVideo => 'Exercícios com vídeo';

  @override
  String get obTriedFeatReminders => 'Lembretes nos seus horários';

  @override
  String get obTriedFeatStreaks => 'Sequências e níveis';

  @override
  String get obBedtimeUnknown => 'Não sei, varia';

  @override
  String obBedtimeUnknownHint(String time) {
    return 'Sugerimos $time, pelo sono que você precisa na sua idade. Você pode mudar quando quiser.';
  }

  @override
  String get obWorkoutTimeUnknown => 'Não sei, não tenho um horário fixo';

  @override
  String obWorkoutTimeUnknownHint(String time) {
    return 'Por enquanto vamos usar $time. Você pode mudar quando quiser.';
  }

  @override
  String obNotifSleepDetailSuggested(String time) {
    return 'Sugestão: dormir por volta das $time. Mude quando quiser.';
  }

  @override
  String obNotifWorkoutDetailSuggested(String time) {
    return 'Sugestão: treinar por volta das $time. Mude quando quiser.';
  }

  @override
  String get obNotifSubtitleSuggested =>
      'Nos horários que você deu, com uma sugestão onde você não sabia. Você pode mudar quando quiser.';

  @override
  String get plFoodBrownRice => 'Arroz integral';

  @override
  String get unitHeightTitle => 'Unidade de altura';

  @override
  String get unitWeightTitle => 'Unidade de peso';

  @override
  String get unitWaterTitle => 'Unidade de água';

  @override
  String get unitOptCm => 'Centímetros';

  @override
  String get unitOptFtIn => 'Pés e polegadas';

  @override
  String get unitOptKg => 'Quilogramas';

  @override
  String get unitOptLb => 'Libras';

  @override
  String get unitOptStLb => 'Stones e libras';

  @override
  String get unitOptLiters => 'Litros';

  @override
  String get unitOptFlOz => 'Onças líquidas';

  @override
  String achieveGrowthImp(String amount) {
    return '$amount de crescimento';
  }

  @override
  String achieveGrowthImpDesc(String amount) {
    return 'Registre $amount de crescimento total';
  }

  @override
  String get postureBenefitIn =>
      'Cabeça, ombros e lombar. Ficar ereto mostra até cerca de 1 polegada a mais da sua altura real.';

  @override
  String get notifPostureBodyIn =>
      'Costas retas, ombros para trás. Cerca de 1 polegada!';

  @override
  String get painPostureDescIn =>
      'Uma postura correta pode adicionar instantaneamente até cerca de 1 polegada. A rotina diária de postura do BeTaller estabelece isso em poucas semanas.';

  @override
  String get routinePostureDescIn =>
      'Mantenha as costas retas, ombros para trás. Verifique a cada hora. Boa postura = cerca de 1 polegada de diferença.';

  @override
  String get sciPostureCheckIn =>
      'Uma boa postura pode fazer você parecer cerca de 1 polegada mais alto na hora e evita a compressão da coluna';

  @override
  String get routineProteinDescLb =>
      'Ovos, frango, peixe, laticínios. Pelo menos 0,7 g de proteína por lb de peso corporal por dia.';

  @override
  String pwPersonalTitle(String height) {
    return 'Seu plano para chegar a $height está pronto';
  }

  @override
  String get pwPersonalEstimate =>
      'Potencial estimado pelas suas respostas, não uma garantia';

  @override
  String pwPersonalReason(String reason) {
    return 'Seu motivo: $reason';
  }

  @override
  String pwPersonalBedtime(String time) {
    return 'Um lembrete antes de dormir às $time';
  }

  @override
  String get obParentUnknown => 'Não sei';

  @override
  String get obParentUnknownHint =>
      'Vamos usar a altura média de um adulto. É menos preciso, e você pode adicionar no seu perfil quando quiser.';

  @override
  String get obEthnicityWhy =>
      'Usado só para estimar a altura do pai ou da mãe que você não sabe.';

  @override
  String get resultNoParentNote =>
      'Estimado sem a altura de um dos seus pais, então é menos preciso. Adicione no seu perfil quando quiser.';

  @override
  String get resultNoParentsNote =>
      'Estimado sem a altura dos seus pais, então é menos preciso. Adicione no seu perfil quando quiser.';

  @override
  String get resultFootnoteEstimated =>
      'Estimativa baseada em curvas de crescimento e alturas médias de adultos. Não é aconselhamento médico.';

  @override
  String get obBudgetChip => 'PREÇO JUSTO';

  @override
  String get obBudgetTitle =>
      'BeTaller tem um preço pensado para cada jovem que quer crescer';

  @override
  String get obBudgetDesc =>
      'Sua altura não deveria depender de quanto dinheiro você tem. Por isso o preço é definido para cada país.';

  @override
  String obBudgetWeek(String price) {
    return 'Uma semana de Pro aqui: $price';
  }

  @override
  String get obBudgetLocalTitle => 'Preço para o seu país';

  @override
  String get obBudgetLocalDesc =>
      'Não convertido do dólar: ajustado aos orçamentos de onde você mora.';

  @override
  String get obBudgetWeekTitle => 'Comece com apenas uma semana';

  @override
  String get obBudgetWeekDesc =>
      'Sem um grande pagamento inicial. Cancele quando quiser nos ajustes do seu ID Apple.';

  @override
  String get obBudgetAllTitle => 'Tudo em um só plano';

  @override
  String get obBudgetAllDesc =>
      'Treinos, sono, nutrição, postura e relatórios de progresso.';

  @override
  String get obRateTitle => 'O BeTaller foi criado para te ajudar de verdade';

  @override
  String get obRateDesc =>
      'Se você gostou da nossa atenção pessoal e da nossa honestidade, ficaríamos muito felizes com a sua avaliação.';

  @override
  String get obRateCta => 'Avaliar o BeTaller';

  @override
  String get obRateLater => 'Talvez depois';
}
