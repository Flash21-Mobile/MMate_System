import 'package:design_system/config.dart';
import 'package:design_system/image/image.dart';
import 'package:design_system/utilities/double_tap_to_close.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

import '../text/text_interface.dart';
import '../textfield/index_text_filed.dart';

class LoginDialog {
  final BuildContext context;

  const LoginDialog(this.context);

  Future show({
    final String? title,
    final Object? svgLogo,
    final TextEditingController? controller,
    final String? indexHint,
    final String? hint,
    final Widget? extraContents,
    final TextInputType? keyboardType,
    final TextInputType? subKeyboardType,
    final List<TextInputFormatter>? textInputFormatter,
    final List<TextInputFormatter>? subTextInputFormatter,
    final Function()? onTap,
    final String? buttonText,
    final TextEditingController? subController,
    final String? indexSubHint,
    final String? subHint,
    final bool? subObscureText,
    final Widget? subContent,
  }) async {
    await showGeneralDialog(
        transitionBuilder: (context, animation, secondaryAnimation, child) {
          final curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          );

          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(0, 1),
              end: Offset.zero,
            ).animate(curvedAnimation),
            child: child,
          );
        },
        context: context,
        transitionDuration: const Duration(milliseconds: 700),
        pageBuilder: (_, __, ___) {
          return _LoginDialog(
            title: title,
            svgLogo: svgLogo,
            controller: controller,
            indexHint: indexHint,
            hint: hint,
            extraContents: extraContents,
            keyboardType: keyboardType,
            subKeyboardType: subKeyboardType,
            textInputFormatter: textInputFormatter,
            subTextInputFormatter: subTextInputFormatter,
            onTap: onTap,
            buttonText: buttonText,
            subController: subController,
            indexSubHint: indexSubHint,
            subHint: subHint,
            subObscureText: subObscureText,
            subContent: subContent,
          );
        });
  }
}

class _LoginDialog extends ConsumerStatefulWidget {
  final String? title;
  final Object? svgLogo;
  final TextEditingController? controller;
  final String? indexHint;
  final String? hint;
  final Widget? extraContents;
  final TextInputType? keyboardType;
  final TextInputType? subKeyboardType;
  final List<TextInputFormatter>? textInputFormatter;
  final List<TextInputFormatter>? subTextInputFormatter;
  final Function()? onTap;
  final String? buttonText;
  final TextEditingController? subController;
  final String? indexSubHint;
  final String? subHint;

  final bool? subObscureText;
  final Widget? subContent;

  const _LoginDialog({
    super.key,
    this.title,
    this.svgLogo,
    this.controller,
    this.indexHint,
    this.hint,
    this.extraContents,
    this.keyboardType,
    this.subKeyboardType,
    this.textInputFormatter,
    this.subTextInputFormatter,
    this.onTap,
    this.buttonText,
    this.subController,
    this.indexSubHint,
    this.subHint,
    this.subObscureText,
    this.subContent,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _Widget();
}

class _Widget extends ConsumerState<_LoginDialog> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
            alignment: Alignment.center,
            margin: AppConfig.paddingHorizontal,
            child:
                // backgroundColor: Colors.white,
                SingleChildScrollView(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: AppConfig.borderRadius,
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...widget.svgLogo != null
                        ? [
                            SizedBox(height: AppConfig.paddingIndex / 3),
                            MMateImage(
                              widget.svgLogo!,
                              height: 80,
                              fit: BoxFit.contain,
                            ),
                            SizedBox(height: AppConfig.paddingIndex),
                          ]
                        : [],
                    ...widget.extraContents != null
                        ? [widget.extraContents!, const SizedBox(height: 20)]
                        : [],
                    ...widget.title != null
                        ? [
                            IndexText(
                              widget.title,
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: 15,
                            )
                          ]
                        : [],
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (widget.indexHint != null)
                          IndexTextMin(
                            widget.indexHint,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ...(widget.controller != null)
                            ? [
                                IndexTextField(
                                    padding: AppConfig.padding,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 1,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    hintText: widget.hint,
                                    controller: widget.controller,
                                    keyboardType: widget.keyboardType,
                                    inputFormatters: widget.textInputFormatter),
                                SizedBox(height: 20)
                              ]
                            : [],
                        if (widget.indexSubHint != null)
                          IndexTextMin(
                            widget.indexSubHint,
                            color: Theme.of(context).colorScheme.onTertiary,
                          ),
                        ...(widget.indexSubHint != null ||
                                widget.subController != null)
                            ? [
                                IndexTextField(
                                    padding: AppConfig.padding,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        border: Border.all(
                                            width: 1,
                                            color: Theme.of(context)
                                                .primaryColor)),
                                    hintText: widget.subHint,
                                    controller: widget.subController,
                                    keyboardType: widget.subKeyboardType,
                                    obscureText: widget.subObscureText,
                                    inputFormatters:
                                        widget.subTextInputFormatter),
                                SizedBox(height: 20),
                              ]
                            : [],
                      ],
                    ),
                    Row(mainAxisSize: MainAxisSize.max, children: [
                      Expanded(
                          child: Material(
                              color: Theme.of(context).primaryColor,
                              borderRadius: BorderRadius.circular(100),
                              child: InkWell(
                                  borderRadius: BorderRadius.circular(100),
                                  onTap: widget.onTap,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 15),
                                    alignment: Alignment.center,
                                    child: IndexText(
                                      widget.buttonText,
                                      color: Colors.white,
                                    ),
                                  ))))
                    ]),
                    ...widget.subContent != null
                        ? [
                            const SizedBox(height: 15),
                            widget.subContent!,
                            const SizedBox(height: 5)
                          ]
                        : []
                  ],
                ),
              ),
            )));
  }
}
