import 'package:design_system/config.dart';
import 'package:design_system/textfield/index_text_field_animate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../text/text_interface.dart';

class IndexTextField extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Widget();

  final String? indexText;
  final Color? indexColor;

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

  final IndexTextFieldAnimate? animate;
  final FontWeight? fontWeight;

  const IndexTextField({
    super.key,
    this.indexText,
    this.indexColor,
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
    this.fontSize = 16,
    this.color,
    this.onChanged,
    this.maxLength,
    this.readOnly = false,
    this.showCounter = false,
    this.textAlignVertical = TextAlignVertical.center,
    this.animate,
  });
}

class _Widget extends State<IndexTextField> {
  double opacity = 0.0;
  bool indexFocus = false;
  bool viewSub = false;

  @override
  void initState() {
    super.initState();
    updateText();

    widget.controller?.addListener(updateText);
    widget.focusNode?.addListener(updateFocus);
  }

  @override
  void dispose() {
    widget.controller?.removeListener(updateText);
    widget.focusNode?.removeListener(updateFocus);
    super.dispose();
  }

  void updateText() {
    if (widget.animate != null) {
      if (widget.controller?.text.length == 0 ||
          widget.controller?.text.length == 1) {
        setState(() {
          opacity = (widget.controller?.text.isNotEmpty ?? false) ? 1.0 : 0.0;
        });
      }
      if ((widget.controller?.text.length ?? 0) > 0) {
        Future.delayed(Duration(milliseconds: 300)).then((_) {
          setState(() {
            viewSub = true;
          });
        });
      }
    }
  }

  void updateFocus() {
    if (widget.animate != null) {
      if (widget.focusNode?.hasFocus ?? false) {
        if (!indexFocus) {
          setState(() => indexFocus = true);
        }
      } else {
        if (indexFocus) {
          setState(() => indexFocus = false);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.transparent,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          if (widget.indexText != null) ...[
            IndexText(widget.indexText,
                color: widget.indexColor ?? Theme
                    .of(context)
                    .hintColor),
            SizedBox(height: 5),
          ],
          if (widget.animate != null) ...[
            AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 150),
              child: IndexTextMin(
                fontWeight: FontWeight.w500,
                widget.hintText,
                color: indexFocus
                    ? widget.indexColor ?? Theme
                    .of(context)
                    .colorScheme
                    .primary
                    : Theme
                    .of(context)
                    .colorScheme
                    .onTertiary,
              ),
            ),
            SizedBox(height: AppConfig.paddingIndex / 3)
          ],
          Container(
              width: widget.width,
              height: widget.height,
              decoration: widget.decoration,
              child: TextFormField(
                focusNode: widget.focusNode,
                maxLength: widget.maxLength,
                expands: widget.height != null ? true : false,
                readOnly: widget.readOnly,
                textAlignVertical: widget.textAlignVertical,
                maxLengthEnforcement: widget.maxLengthEnforcement,
                obscureText: widget.obscureText ?? false,
                inputFormatters: [
                  ...?widget.inputFormatters,
                  if (!widget.multilineEnable)
                    FilteringTextInputFormatter.deny(RegExp(r'\n')),
                ],
                canRequestFocus: true,
                onChanged: widget.onChanged,
                textInputAction: widget.textInputAction ??
                    (widget.multilineEnable
                        ? TextInputAction.newline
                        : TextInputAction.done),
                maxLines: widget.height != null
                    ? null
                    : widget.multilineEnable
                    ? null
                    : 1,
                keyboardType: widget.keyboardType ??
                    (widget.multilineEnable ? TextInputType.multiline : null),
                controller: widget.controller,
                style: TextStyle(
                    fontSize: widget.fontSize,
                    color: widget.color,
                    fontWeight: widget.fontWeight),
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  counterText: widget.showCounter ? null : '',
                  filled: true,
                  hintStyle: TextStyle(
                      fontSize: widget.fontSize,
                      color: Theme
                          .of(context)
                          .hintColor),
                  fillColor: Colors.transparent,
                  isDense: true,
                  contentPadding: widget.padding,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none, // 동그란 테두리
                ),
              )),
          if (widget.animate != null) ...[
            Container(
              height: 1.23,
              width: double.infinity,
              margin: EdgeInsets.only(top: 5),
              color: indexFocus
                  ? widget.indexColor ?? Theme
                  .of(context)
                  .colorScheme
                  .primary
                  : Theme
                  .of(context)
                  .colorScheme
                  .tertiary,
            ),
            if( widget.animate!.subText.isNotEmpty)
              ClipRect(
                  child: AnimatedSlide(
                    offset: viewSub ? Offset(0, 0) : Offset(0, -1),
                    duration: Duration(milliseconds: 150),
                    child: IndexTextMin(
                      widget.animate!.subText,
                      color: widget.indexColor ??
                          Theme
                              .of(context)
                              .colorScheme
                              .onTertiary,
                    ),
                  )),
          ]
        ]));
  }
}
