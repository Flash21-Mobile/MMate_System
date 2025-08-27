import 'package:core_system/splash/splash.dart';
import 'package:flutter/material.dart';
import 'package:function_system/utilities/navigation/navigation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class MMateSplash extends HookConsumerWidget {
  final String appLogoPath;
  final String title;
  final Widget home;
  final String baseUrl;

  final Iterable<Future<void>> Function(WidgetRef ref)? onSplashCreated;
  final Iterable<Future<void>> Function(WidgetRef ref)? onSplash;
  final Future<bool> Function(WidgetRef ref)? canIntentNext;

  const MMateSplash({
    super.key,
    required this.appLogoPath,
    required this.title,
    required this.home,
    required this.baseUrl,
    required this.onSplashCreated,
    required this.onSplash,
    required this.canIntentNext,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        await Future.wait([...?onSplashCreated?.call(ref)]);

        context.replace(Splash(
            appLogoPath: appLogoPath,
            title: title,
            home: home,
            baseUrl: baseUrl,
            onSplash: onSplash,
            canIntentNext: canIntentNext));
      });

      return null;
    }, []);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
    );
  }
}
