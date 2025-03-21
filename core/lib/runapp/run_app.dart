import 'package:core_system/runapp/splash.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import '../theme.dart';

Future runMMate(
  Widget home, {
  required String baseUrl,
  String title = '',
  MmateTheme? lightTheme,
  MmateTheme? darkTheme,
  bool isFirebaseEnabled = false,
}) async {

  final currentApp = MaterialApp(
    title: title,
    theme: (lightTheme ?? MmateTheme.light()).themeData(),
    darkTheme: (darkTheme ?? MmateTheme.dark()).themeData(),
    localizationsDelegates: [
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ],
    supportedLocales: const [
      Locale('ko', 'KR'),
    ],
    themeMode: ThemeMode.system,
    home: MmateSplash(
      title: title,
      home: home,
      baseUrl: baseUrl,
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
