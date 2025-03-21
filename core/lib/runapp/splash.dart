import 'package:core_system/community/provider/board/board_provider.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/di/board/board_repository_provider.dart';
import 'package:function_system/di/utilities/base_url_provider.dart';
import 'package:function_system/utilities/navigation/navigation.dart';

class MmateSplash extends ConsumerStatefulWidget {
  final String title;
  final Widget home;
  final String baseUrl;

  const MmateSplash({
    super.key,
    required this.title,
    required this.home,
    required this.baseUrl,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Widget();
}

class _Widget extends ConsumerState<MmateSplash>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _logoAnimation;
  late Animation<double> _nameAnimation;

  @override
  void initState() {
    super.initState();
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

    onLaunched();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // 현재 모드 감지 (라이트/다크)
    final isDarkMode =
        MediaQuery.of(context).platformBrightness == Brightness.dark;

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness:
          isDarkMode ? Brightness.light : Brightness.dark,
        systemNavigationBarContrastEnforced: false,
    ));

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  }

  Future onLaunched() async {
    final splashAnimation = Future.delayed(
      Duration(milliseconds: 500),
      () => _controller.forward(),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(baseUrlProvider.notifier).state = widget.baseUrl;

      await Future.wait([
        splashAnimation,
        ref.read(boardProvider.notifier).fetchData()
      ]).then((_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.replace(widget.home);
        });
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationHeight = MediaQuery.of(context).padding.bottom;
    final bottomPadding = navigationHeight == 0 ? 48.0 : navigationHeight;

    return Scaffold(
      extendBody: true,
      body: Center(
        child:  Row(
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
                child: Container(width: 70, height: 70, color: Colors.blue),
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
