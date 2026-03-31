import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'providers/app_provider.dart';
import 'screens/main_screen.dart';
import 'screens/onboarding_screen.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('tr', null);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    statusBarBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.scaffold,
    systemNavigationBarIconBrightness: Brightness.light,
  ));

  final appProvider = AppProvider();
  await appProvider.loadData();

  runApp(
    ChangeNotifierProvider.value(
      value: appProvider,
      child: const BeTallerApp(),
    ),
  );
}

class BeTallerApp extends StatelessWidget {
  const BeTallerApp({super.key});

  @override
  Widget build(BuildContext context) {
    // iOS: SF Pro (sistem fontu), Android: Inter (SF Pro klonu)
    final fontFamily = Platform.isIOS ? '.SF Pro Display' : 'Inter';

    return MaterialApp(
      title: 'BeTaller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: AppColors.scaffold,
        colorScheme: const ColorScheme.dark(
          primary: AppColors.primary,
          secondary: AppColors.primaryLight,
          surface: AppColors.surfaceDark,
          error: AppColors.error,
        ),
        useMaterial3: true,
        fontFamily: fontFamily,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          foregroundColor: Colors.white,
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        splashColor: Colors.white10,
        highlightColor: Colors.white10,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('tr', 'TR'),
      supportedLocales: const [
        Locale('tr', 'TR'),
        Locale('en', 'US'),
      ],
      home: Consumer<AppProvider>(
        builder: (context, provider, _) {
          if (provider.profile == null) {
            return const OnboardingScreen();
          }
          return const MainScreen();
        },
      ),
    );
  }
}
