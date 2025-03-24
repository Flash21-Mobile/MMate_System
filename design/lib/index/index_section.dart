import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';

class IndexSection extends StatelessWidget {
  final String data;
  final String indexText;
  final Widget? indexIcon;
  final List<Widget> actionButton;

  const IndexSection(
    this.data, {
    super.key,
    required this.indexText,
    this.indexIcon,
    this.actionButton = const [],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
          IndexTextMin(indexText, color: Theme.of(context).colorScheme.onTertiary),

          Spacer(),
          ...actionButton
        ]),
        Row(children: [IndexText(data,fontWeight: FontWeight.w500,)]),
      ],
    );
  }
}
