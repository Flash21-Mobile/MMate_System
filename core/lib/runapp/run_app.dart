import 'package:core_system/app/theme/_app_theme_data.dart';
import 'package:core_system/splash/splash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

Future runMMate(
  Widget home, {
  required String baseUrl,
  String title = '',
  String appLogoPath = '',
  ThemeData? theme,
  ThemeData? darkTheme,
  bool isFirebaseEnabled = false,
  Iterable<Future> Function(WidgetRef ref)? onSplash,
  Future<bool> Function(WidgetRef ref)? canIntentNext,
}) async {
  final currentApp = MaterialApp(
    title: title,
    theme: theme ?? AppThemeData.light,
    darkTheme: darkTheme ?? AppThemeData.dark,
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('ko', 'KR'),
    ],
    themeMode: ThemeMode.system,
    home: MMateSplash(
      appLogoPath: appLogoPath,
      title: title,
      home: home,
      baseUrl: baseUrl,
      onSplash: onSplash,
      canIntentNext: canIntentNext,
    ),
  );

  if (isFirebaseEnabled) {
    WidgetsFlutterBinding.ensureInitialized();
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      sound: true,
    );
    await messaging.setAutoInitEnabled(true);
  }

  runApp(ProviderScope(child: currentApp));
}
