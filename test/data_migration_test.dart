import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:boyuzatma_app/providers/app_provider.dart';

/// A blob in the shape 1.6.2 / 1.6.3 write: no schemaVersion, photo paths
/// absolute under an older app container.
Map<String, dynamic> _legacyBlob({
  String oldDocs = '/var/mobile/Containers/Data/Application/OLD-UUID/Documents',
}) => {
  'profile': {
    'name': 'Ece',
    'gender': 'female',
    'birthDate': '2010-04-02',
    'currentHeight': 158.0,
    'weight': 47.0,
    'fatherHeight': 180.0,
    'motherHeight': 165.0,
    'createdAt': '2026-05-01T10:00:00.000',
  },
  'heightRecords': [
    {'date': '2026-05-01', 'height': 158.0},
    {'date': '2026-06-01', 'height': 159.1},
  ],
  'streak': 4,
  'bestStreak': 9,
  'isPremium': true,
  'totalXP': 1240,
  'progressPhotos': [
    {
      'id': 'p1',
      'date': '2026-06-01',
      'path': '$oldDocs/progress_photos/photo_1.jpg',
      'height': 159.1,
    },
  ],
  // Written by some other build; this one does not know it.
  'futureField': {'keep': 'me'},
};

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late Directory docs;

  setUp(() {
    docs = Directory.systemTemp.createTempSync('betaller_docs');
    addTearDown(() {
      if (docs.existsSync()) docs.deleteSync(recursive: true);
    });
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
          const MethodChannel('plugins.flutter.io/path_provider'),
          (call) async => call.method == 'getApplicationDocumentsDirectory'
              ? docs.path
              : null,
        );
  });

  Future<Map<String, dynamic>> stored() async {
    final prefs = await SharedPreferences.getInstance();
    return jsonDecode(prefs.getString('glowup_app_data')!)
        as Map<String, dynamic>;
  }

  test('an older blob loads intact, keeps premium and unknown keys', () async {
    SharedPreferences.setMockInitialValues({
      'glowup_app_data': jsonEncode(_legacyBlob()),
    });
    final p = AppProvider();
    await p.loadData();

    expect(p.profile?.name, 'Ece');
    expect(p.heightRecords.map((r) => r.height), [158.0, 159.1]);
    expect(p.isPremium, isTrue);
    expect(p.streak, 4);
    expect(p.totalXP, 1240);

    final out = await stored();
    expect(out['schemaVersion'], AppProvider.schemaVersion);
    expect(out['futureField'], {'keep': 'me'});
    expect(out['isPremium'], isTrue);
  });

  test('the pre-migration blob is backed up exactly once', () async {
    final original = jsonEncode(_legacyBlob());
    SharedPreferences.setMockInitialValues({'glowup_app_data': original});
    await AppProvider().loadData();
    final prefs = await SharedPreferences.getInstance();
    expect(prefs.getString('glowup_app_data_backup_v2'), original);

    // A second launch is already on the current schema: no new backup, and
    // the first one is untouched.
    await AppProvider().loadData();
    expect(prefs.getString('glowup_app_data_backup_v2'), original);
    expect(
      prefs.getKeys().where((k) => k.startsWith('glowup_app_data_backup')),
      hasLength(1),
    );
  });

  test('photo paths follow the app container to its new location', () async {
    SharedPreferences.setMockInitialValues({
      'glowup_app_data': jsonEncode(_legacyBlob()),
    });
    final p = AppProvider();
    await p.loadData();
    final photo = p.progressPhotos.single;
    expect(photo['relPath'], 'progress_photos/photo_1.jpg');
    expect(photo['path'], '${docs.path}/progress_photos/photo_1.jpg');
  });

  test('one bad record costs that record, not the launch', () async {
    final blob = _legacyBlob()
      ..['heightRecords'] = [
        {'date': '2026-05-01', 'height': 158.0},
        {'date': '2026-05-15'}, // no height
        'garbage',
        {'date': '2026-06-01', 'height': 159.1},
      ]
      ..['streak'] =
          'four' // wrong type
      ..['caffeineByDate'] = 'nope';
    SharedPreferences.setMockInitialValues({
      'glowup_app_data': jsonEncode(blob),
    });
    final p = AppProvider();
    await p.loadData();
    expect(p.heightRecords.map((r) => r.height), [158.0, 159.1]);
    expect(p.profile?.name, 'Ece');
    expect(p.isPremium, isTrue);
    expect(p.streak, 0);
  });

  test(
    'an unreadable blob is preserved before anything overwrites it',
    () async {
      SharedPreferences.setMockInitialValues({'glowup_app_data': '{not json'});
      final p = AppProvider();
      await p.loadData(); // must not throw
      final prefs = await SharedPreferences.getInstance();
      expect(prefs.getString('glowup_app_data_corrupt'), '{not json');
    },
  );

  test('relFromAbsolute', () {
    expect(
      AppProvider.relFromAbsolute('/x/Documents/posture_photos/a.jpg'),
      'posture_photos/a.jpg',
    );
    expect(AppProvider.relFromAbsolute('relative.jpg'), isNull);
  });
}
