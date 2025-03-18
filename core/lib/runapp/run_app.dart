import 'package:core_system/runapp/app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme.dart';

Future runMMate(Widget home, {
  required String title,
  required String baseUrl,
  MmateTheme? lightTheme,
  MmateTheme? darkTheme,
  bool isFirebaseEnabled = false,
}) async {
  final currentApp = App(
    title: title,
    lightTheme: lightTheme ?? MmateTheme.light(),
    darkTheme: darkTheme ?? MmateTheme.dark(),
    home: home,
    baseUrl: baseUrl,
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
