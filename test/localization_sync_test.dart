import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('English and Arabic ARB localization keys match', () {
    final en = jsonDecode(File('lib/l10n/app_en.arb').readAsStringSync())
        as Map<String, dynamic>;
    final ar = jsonDecode(File('lib/l10n/app_ar.arb').readAsStringSync())
        as Map<String, dynamic>;

    final enKeys = en.keys.where((key) => !key.startsWith('@')).toSet();
    final arKeys = ar.keys.where((key) => !key.startsWith('@')).toSet();
    expect(arKeys, enKeys);
  });

  test('old project count is absent from public localization files', () {
    for (final path in <String>[
      'lib/l10n/app_en.arb',
      'lib/l10n/app_ar.arb',
      'lib/app/localization/app_localizations.dart',
    ]) {
      final text = File(path).readAsStringSync();
      expect(text.contains('10' '+' ' Projects'), isFalse, reason: path);
      expect(text.contains('+' '10 مشاريع'), isFalse, reason: path);
    }
  });
}
