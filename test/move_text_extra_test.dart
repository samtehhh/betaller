import 'dart:ui' show Locale;

import 'package:flutter_test/flutter_test.dart';

import 'package:boyuzatma_app/l10n/app_localizations.dart';
import 'package:boyuzatma_app/utils/exercise_guides.dart';
import 'package:boyuzatma_app/utils/exercise_text_extra.dart';
import 'package:boyuzatma_app/utils/localized_data.dart';

const _fakeText = <String, Map<String, List<String>>>{
  'xx': {
    'plank': ['XX title', 'XX desc', '3 x 30 xx'],
  },
  'zh_Hant': {
    'plank': ['HANT title', 'HANT desc'],
  },
};
const _fakeGuides = <String, Map<String, ExerciseGuide>>{
  'xx': {
    'plank': ExerciseGuide(['s1'], ['m1'], 'tip'),
  },
};

void main() {
  group('moveTextKey', () {
    test('zh vs zh_Hant vs others', () {
      expect(moveTextKey(const Locale('zh')), 'zh');
      expect(moveTextKey(const Locale('zh', 'CN')), 'zh');
      expect(
        moveTextKey(
          const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
        ),
        'zh_Hant',
      );
      expect(moveTextKey(const Locale('zh', 'TW')), 'zh_Hant');
      expect(moveTextKey(const Locale('zh', 'HK')), 'zh_Hant');
      expect(moveTextKey(const Locale('zh', 'MO')), 'zh_Hant');
      expect(
        moveTextKey(
          const Locale.fromSubtags(
            languageCode: 'zh',
            scriptCode: 'Hans',
            countryCode: 'TW',
          ),
        ),
        'zh',
      );
      expect(moveTextKey(const Locale('de')), 'de');
      expect(moveTextKey(const Locale('ja')), 'ja');
    });

    test('from AppLocalizations.localeName', () {
      expect(moveTextKeyForName('zh_Hant'), 'zh_Hant');
      expect(moveTextKeyForName('zh_TW'), 'zh_Hant');
      expect(moveTextKeyForName('zh'), 'zh');
      expect(moveTextKeyForName('tr'), 'tr');
      expect(
        moveTextKeyForName(
          lookupAppLocalizations(
            const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
          ).localeName,
        ),
        'zh_Hant',
      );
    });
  });

  group('lookup order', () {
    test('extra entry wins over English', () {
      final l = lookupAppLocalizations(const Locale('ru'));
      // Real app data has no ru row yet; a fake language key is used instead.
      final row = newMoveRow('plank', 'xx', extra: _fakeText)!;
      expect(row, ['XX title', 'XX desc', '3 x 30 xx']);
      expect(
        localizedRoutine(
          l,
          'plank',
          extra: const {
            'ru': {
              'plank': ['RU t', 'RU d'],
            },
          },
        )['title'],
        'RU t',
      );
      expect(exerciseGuide('plank', 'xx', extra: _fakeGuides)!.tip, 'tip');
    });

    test('zh_Hant gets its own row, zh does not', () {
      final hant = lookupAppLocalizations(
        const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant'),
      );
      final zh = lookupAppLocalizations(const Locale('zh'));
      expect(
        localizedRoutine(hant, 'plank', extra: _fakeText)['title'],
        'HANT title',
      );
      expect(
        localizedRoutine(zh, 'plank', extra: _fakeText)['title'],
        kNewMoveText['plank']!['en']![0],
      );
    });

    test('no extra entry: old path (own row, then English)', () {
      final de = lookupAppLocalizations(const Locale('de'));
      final ru = lookupAppLocalizations(const Locale('ru'));
      expect(
        localizedRoutine(de, 'plank', extra: const {})['description'],
        kNewMoveText['plank']!['de']![1],
      );
      expect(
        localizedRoutine(ru, 'plank', extra: const {})['title'],
        kNewMoveText['plank']!['en']![0],
      );
      expect(
        identical(
          exerciseGuide('plank', 'ru', extra: const {}),
          exerciseGuide('plank', 'en', extra: const {}),
        ),
        isTrue,
      );
      expect(exerciseGuide('plank', 'tr', extra: const {}), isNotNull);
      expect(exerciseGuide('no_such_move', 'en', extra: const {}), isNull);
    });

    test('ARB ids keep using ARB even if an extra row exists', () {
      final en = lookupAppLocalizations(const Locale('en'));
      final r = localizedRoutine(
        en,
        'squats',
        extra: const {
          'en': {
            'squats': ['X', 'Y'],
          },
        },
      );
      expect(r['title'], en.routineSquats);
    });

    test('generated file is imported and valid', () {
      expect(kMoveTextExtra, isA<Map<String, Map<String, List<String>>>>());
      expect(kGuidesExtra, isA<Map<String, Map<String, ExerciseGuide>>>());
    });
  });
}
