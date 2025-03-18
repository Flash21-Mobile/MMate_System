import 'package:core_system/runapp/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../theme.dart';

class App extends ConsumerWidget {
  final String title;
  final MmateTheme lightTheme;
  final MmateTheme darkTheme;
  final Widget home;
  final String baseUrl;
  final Future Function(WidgetRef)? initState;

  const App({
    super.key,
    required this.title,
    required this.lightTheme,
    required this.darkTheme,
    required this.home,
    required this.baseUrl,
    this.initState,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: title,
      theme: lightTheme.themeData(),
      darkTheme: darkTheme.themeData(),
      themeMode: ThemeMode.system,
      home: MmateSplash(
        title: title,
        home: home,
        baseUrl: baseUrl,
      ),
    );
  }
}
