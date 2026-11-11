import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/models/user_profile.dart';
import 'package:boyuzatma_app/services/notification_service.dart';

ReminderContext _context({String name = 'Samet', List<String>? meals}) =>
    ReminderContext(
      profile: UserProfile(
        name: name,
        gender: 'male',
        birthDate: '2009-06-01',
        currentHeight: 170,
        weight: 60,
        fatherHeight: 178,
        motherHeight: 164,
        mealTimes: meals ?? const ['08:00', '13:00', '19:00'],
      ),
      weeklyWorkout: '3-5',
      potential: '',
      height: '',
      habitGain: '',
    );

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final l = lookupAppLocalizations(const Locale('tr'));
  final service = NotificationService();

  test('the meal reminder names the meal, the protein and the calcium', () {
    final (title, body) = service.personalCopyFor(
      'nutrition',
      DateTime.monday,
      _context(),
      l,
    );
    // Three meals: the reminder sits on the second.
    expect(title, 'Samet, 2. öğün saatin geldi.');
    expect(body, matches(RegExp(r'^\d+ g protein ve \d+ mg kalsiyum\. ')));
    expect(body, endsWith('Bu öğünü kesinlikle atlama.'));
  });

  test('without a name the reminders still read as sentences', () {
    final c = _context(name: 'User');
    for (final category in ['nutrition', 'water', 'posture', 'sleep']) {
      final (title, body) = service.personalCopyFor(
        category,
        DateTime.monday,
        c,
        l,
      );
      for (final text in [title, body]) {
        expect(text.trim(), isNotEmpty);
        expect(text.startsWith(','), isFalse, reason: '$category: $text');
        expect(text.contains('User'), isFalse, reason: '$category: $text');
        expect(text.contains('{'), isFalse, reason: '$category: $text');
      }
    }
  });

  test('a training day counts its moves and minutes, a rest day does not', () {
    final (title, body) = service.personalCopyFor(
      'exercise',
      DateTime.monday,
      _context(),
      l,
    );
    expect(title, l.nPmTrainTitle);
    expect(body, matches(RegExp(r'Bugün \d+ egzersiz, ortalama \d+ dakika\.')));
    // 0-2 workouts a week: Sunday is the rest day.
    final rest = service.personalCopyFor(
      'exercise',
      DateTime.sunday,
      ReminderContext(
        profile: _context().profile,
        weeklyWorkout: '',
        potential: '',
        height: '',
        habitGain: '',
      ),
      l,
    );
    expect(rest.$1, l.nRestTitle);
  });

  test('every language has the Pro reminders with their placeholders', () {
    for (final locale in AppLocalizations.supportedLocales) {
      final ll = lookupAppLocalizations(locale);
      expect(ll.nPmMealTitle('Ada', 2), contains('Ada'));
      expect(ll.nPmMealTitle('Ada', 2), contains('2'));
      expect(ll.nPmMealBody(43, 800), allOf(contains('43'), contains('800')));
      expect(ll.nPmWaterBody('Ada', '2.6 L'), contains('2.6 L'));
      expect(ll.nPmTrainBody(6, 25), allOf(contains('6'), contains('25')));
      expect(ll.nPmSleepTitle('Ada'), contains('Ada'));
    }
  });
}
