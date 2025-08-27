import 'package:core_system/splash/provider/login_viewmodel.dart';
import 'package:design_system/config.dart';
import 'package:design_system/dialog/login_dialog.dart';
import 'package:design_system/image/image.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/utilities/base_url_provider.dart';
import 'package:function_system/utilities/log.dart';
import 'package:function_system/utilities/navigation/navigation.dart';
import 'package:design_system/utilities/inputformatter/phone_input_formatter.dart';

class Splash extends ConsumerStatefulWidget {
  final String appLogoPath;
  final String title;
  final Widget home;
  final String baseUrl;

  final Iterable<Future<void>> Function(WidgetRef ref)? onSplash;
  final Future<bool> Function(WidgetRef ref)? canIntentNext;

  const Splash({
    super.key,
    required this.appLogoPath,
    required this.title,
    required this.home,
    required this.baseUrl,
    required this.onSplash,
    required this.canIntentNext,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Widget();
}

class _Widget extends ConsumerState<Splash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _nameAnimation;

  @override
  void initState() {
    super.initState();

    _onSplashCreated();

    _controller = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );

    _logoAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _nameAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  Future<void> _onSplashCreated() async {
    await Future.microtask(() async {
      ref.read(baseUrlProvider.notifier).state = widget.baseUrl;
      await ref.read(loginViewmodelProvider.future);
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    SystemChrome.setSystemUIOverlayStyle(AppConfig.systemStyle(context));
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  Future launchSplash(
    Iterable<Future> futures, {
    Widget? next,
  }) async {
    final splashAnimation = Future.delayed(
      Duration(milliseconds: 500),
      () => widget.title.isEmpty ? null : _controller.forward(),
    );

    await Future.wait([splashAnimation, ...futures]).then((_) async {
      final canIntentNext = await widget.canIntentNext?.call(ref);
      if (mounted) {
        if (canIntentNext ?? true) {
          context.replace(next ?? widget.home);
        } else {
          loginPopUp();
        }
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future loginPopUp() async {
    final cellphoneController = TextEditingController();
    final nameController = TextEditingController();

    // final cellphone

    await LoginDialog(context).show(
        svgLogo: widget.appLogoPath,
        controller: cellphoneController,
        textInputFormatter: [
          FilteringTextInputFormatter.digitsOnly,
          PhoneInputFormatter(),
        ],
        indexHint: '전화번호',
        hint: '전화번호를 입력해주세요',
        indexSubHint: '이름',
        subHint: '이름을 입력해주세요',
        subController: nameController,
        buttonText: '로그인',
        onTap: () {
          ref
              .read(loginViewmodelProvider.notifier)
              .login(cellphoneController.text);

          context.pop();
        });
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(loginViewmodelProvider, (previous, next) {
      if (next.hasValue) {
        launchSplash([...?widget.onSplash?.call(ref)]);
      } else if (next.isLoading == false && next.hasError) {
        loginPopUp();
      }
    });

    final navigationHeight = MediaQuery.of(context).padding.bottom;
    final bottomPadding = navigationHeight == 0 ? 48.0 : navigationHeight;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      extendBody: true,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedBuilder(
              animation: _logoAnimation,
              builder: (context, child) {
                return Padding(
                  padding: EdgeInsets.only(right: 10 * _logoAnimation.value),
                  child: child,
                );
              },
              child: MMateImage(
                widget.appLogoPath,
                width: 150,
                height: 150,
              ),
            ),
            ClipRect(
              child: AnimatedBuilder(
                animation: _nameAnimation,
                builder: (context, child) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    widthFactor: _nameAnimation.value,
                    child: child,
                  );
                },
                child: IndexTextThumb(
                  widget.title, // 이름 텍스트
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
