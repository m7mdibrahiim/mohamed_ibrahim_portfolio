import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/app_localizations.dart';
import 'localization/language_cubit.dart';
import 'router/app_router.dart';
import 'theme/app_theme.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LanguageCubit, Locale>(
      builder: (context, locale) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Mohamed Ibrahim | Flutter Developer',
          locale: locale,
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: AppTheme.dark(locale),
          routerConfig: AppRouter.router,
          builder: (context, child) {
            final isAr = locale.languageCode == 'ar';
            return Directionality(
              textDirection: isAr ? TextDirection.rtl : TextDirection.ltr,
              child: child ?? const SizedBox.shrink(),
            );
          },
        );
      },
    );
  }
}
