import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'providers/app_provider.dart';
import 'screens/splash_screen.dart';
import 'services/notification_service.dart';
import 'utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting();
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

  // Initialize notifications
  final notifService = NotificationService();
  await notifService.init();
  if (await notifService.isEnabled()) {
    await notifService.scheduleAllNotifications();
  }

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
    final fontFamily = Platform.isIOS ? '.SF Pro Display' : 'Inter';
    final provider = context.watch<AppProvider>();

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
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: provider.locale,
      supportedLocales: const [
        Locale('tr'),
        Locale('en'),
        Locale('de'),
        Locale('fr'),
        Locale('hi'),
        Locale('pt'),
        Locale('es'),
        Locale('it'),
      ],
      builder: (context, child) => ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(overscroll: false),
        child: child!,
      ),
      home: const SplashScreen(),
    );
  }
}
