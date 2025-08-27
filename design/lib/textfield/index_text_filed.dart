import 'package:design_system/config.dart';
import 'package:design_system/textfield/index_text_field_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../text/text_interface.dart';

class IndexTextField extends HookWidget {


  final TextEditingController? controller;
  final bool multilineEnable;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final String? hintText;
  final bool readOnly;
  final double? height;
  final double? width;
  final BoxDecoration? decoration;
  final EdgeInsets? padding;
  final double fontSize;
  final Color? color;
  final FocusNode? focusNode;
  final Function(String)? onChanged;
  final int? maxLength;
  final MaxLengthEnforcement? maxLengthEnforcement;
  final bool showCounter;
  final TextAlignVertical textAlignVertical;

  final FontWeight? fontWeight;

  const IndexTextField({
    super.key,
    this.controller,
    this.padding = const EdgeInsets.all(0),
    this.multilineEnable = false,
    this.width,
    this.height,
    this.inputFormatters,
    this.decoration,
    this.keyboardType,
    this.obscureText,
    this.hintText,
    this.maxLengthEnforcement,
    this.focusNode,
    this.textInputAction,
    this.fontWeight,
    this.fontSize = 14,
    this.color,
    this.onChanged,
    this.maxLength,
    this.readOnly = false,
    this.showCounter = false,
    this.textAlignVertical = TextAlignVertical.center,
  });


  @override
  Widget build(BuildContext context) {
    final opacity = useState(0.0);
    final indexFocus = useState(false);
    final viewSub = useState(false);


    return Material(
        color: Colors.transparent,
        child:
          Container(
              width: width,
              height: height,
              decoration: decoration,
              alignment: Alignment.center,
              child: TextFormField(
                focusNode: focusNode,
                maxLength: maxLength,
                expands: height != null ? true : false,
                readOnly: readOnly,
                textAlignVertical: textAlignVertical,
                maxLengthEnforcement: maxLengthEnforcement,
                obscureText: obscureText ?? false,
                inputFormatters: [
                  ...?inputFormatters,
                  if (!multilineEnable)
                    FilteringTextInputFormatter.deny(RegExp(r'\n')),
                ],
                canRequestFocus: true,
                onChanged: onChanged,
                textInputAction: textInputAction ??
                    (multilineEnable
                        ? TextInputAction.newline
                        : TextInputAction.done),
                maxLines: height != null
                    ? null
                    : multilineEnable
                        ? null
                        : 1,
                keyboardType: keyboardType ??
                    (multilineEnable ? TextInputType.multiline : null),
                controller: controller,
                style: TextStyle(
                    fontSize: fontSize,
                    color: color,
                    fontWeight: fontWeight),
                decoration: InputDecoration(
                  hintText: hintText,
                  counterText: showCounter ? null : '',
                  filled: true,
                  hintStyle: TextStyle(
                      fontSize: fontSize,
                      color: Theme.of(context).hintColor),
                  fillColor: Colors.transparent,
                  isDense: true,
                  contentPadding: padding,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none, // 동그란 테두리
                ),
              )),
    );
  }
}
