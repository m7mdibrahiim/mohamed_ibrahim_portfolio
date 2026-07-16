import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/localization/language_cubit.dart';
import 'app/portfolio_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final languageCubit = LanguageCubit();
  await languageCubit.loadSavedLanguage();

  runApp(
    BlocProvider.value(
      value: languageCubit,
      child: const PortfolioApp(),
    ),
  );
}
