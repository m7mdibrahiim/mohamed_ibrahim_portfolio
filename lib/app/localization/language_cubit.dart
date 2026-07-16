import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCubit extends Cubit<Locale> {
  LanguageCubit({Locale initialLocale = const Locale('en')})
      : super(
          initialLocale.languageCode == 'ar'
              ? const Locale('ar')
              : const Locale('en'),
        );

  static const _languageKey = 'portfolio_language_code';

  Future<void> loadSavedLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    final savedCode = prefs.getString(_languageKey);
    if (savedCode == 'ar') {
      emit(const Locale('ar'));
    } else {
      emit(const Locale('en'));
    }
  }

  Future<void> setLanguage(Locale locale) async {
    final safeLocale = locale.languageCode == 'ar' ? const Locale('ar') : const Locale('en');
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, safeLocale.languageCode);
    emit(safeLocale);
  }

  Future<void> toggleLanguage() async {
    await setLanguage(state.languageCode == 'ar' ? const Locale('en') : const Locale('ar'));
  }
}
