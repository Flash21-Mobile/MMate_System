import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../text/text_interface.dart';

class IndexTextField extends StatelessWidget {
  final String? indexText;
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

  const IndexTextField({
    super.key,
    this.indexText,
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
    this.fontSize = 16,
    this.color,
    this.onChanged,
    this.maxLength,
    this.readOnly = false,
    this.showCounter = false,
    this.textAlignVertical = TextAlignVertical.center,
  });

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ...indexText != null
          ? [
              IndexText(indexText, color: Theme.of(context).hintColor),
              SizedBox(height: 5),
            ]
          : [],
      Container(
          width: width,
          height: height,
          decoration: decoration,
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
            style: TextStyle(fontSize: fontSize, color: color),
            decoration: InputDecoration(
              hintText: hintText,
              counterText: showCounter ? null : '',
              filled: true,
              hintStyle: TextStyle(
                  fontSize: fontSize, color: Theme.of(context).hintColor),
              fillColor: Colors.transparent,
              isDense: true,
              contentPadding: padding,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.transparent)), // 동그란 테두리
            ),
          )),
    ]);
  }
}
