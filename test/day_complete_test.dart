// Moves done in today's plan count in today's program day, so "Complete
// the day" opens from either tab once every move of the day is ticked.
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/providers/app_provider.dart';

Future<AppProvider> _provider() async {
  SharedPreferences.setMockInitialValues({});
  final p = AppProvider();
  await p.loadData();
  p.setProfile(UserProfile(
    name: 'Test',
    gender: 'male',
    birthDate: '${DateTime.now().year - 16}-03-10',
    currentHeight: 165,
    weight: 55,
    fatherHeight: 178,
    motherHeight: 164,
  ));
  p.setPremium(true);
  return p;
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('a move ticked in today\'s plan ticks it in the program day', () async {
    final p = await _provider();
    final day = p.currentProgramDay;
    final id = p.weeklyPlan.programDay(day).moves.first.routineId;
    expect(p.programChecksFor(day), isNot(contains(id)));
    p.toggleRoutine(id);
    expect(p.programChecksFor(day), contains(id));
    // Unticking it takes it back out.
    p.toggleRoutine(id);
    expect(p.programChecksFor(day), isNot(contains(id)));
  });

  test('every move done from today\'s plan makes the day completable',
      () async {
    final p = await _provider();
    final day = p.currentProgramDay;
    expect(p.canCompleteProgramDay(day), isFalse);
    for (final m in p.weeklyPlan.programDay(day).moves) {
      p.toggleRoutine(m.routineId);
    }
    expect(p.canCompleteProgramDay(day), isTrue);
    expect(p.markProgramDayComplete(day), isTrue);
    expect(p.programDayDoneToday, isTrue);
    expect(p.canCompleteProgramDay(p.currentProgramDay), isFalse);
  });
}
