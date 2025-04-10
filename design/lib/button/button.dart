import 'package:design_system/animate/ink_well.dart';
import 'package:design_system/button/button_data.dart';
import 'package:design_system/config.dart';
import 'package:design_system/image/image.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';

import 'button_status.dart';

class MMateButton extends StatelessWidget {
  final MMateButtonData data;

  const MMateButton(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return MMateInkWell(
      onTap: data.onTap,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: switch (data.status) {
            MMateButtonStatus.enable =>
            Theme.of(context).colorScheme.primary,
            MMateButtonStatus.secondary =>
            Theme.of(context).colorScheme.secondary,
            MMateButtonStatus.tertiary =>
            Theme.of(context).colorScheme.tertiary,
          },
        ),
        padding: EdgeInsets.all(AppConfig.paddingIndex / 3 * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (data.svgIcon != null) ...[
              MMateImage(
                data.svgIcon,
                width: 16,
                height: 16,
                color: Theme.of(context).colorScheme.onSecondary,
              ),
              SizedBox(width: AppConfig.paddingIndex / 2),
            ],
            IndexText(
              data.data,
              color: switch (data.status) {
                MMateButtonStatus.enable =>
                Theme.of(context).colorScheme.onPrimary,
                MMateButtonStatus.secondary =>
                Theme.of(context).colorScheme.onSecondary,
                MMateButtonStatus.tertiary =>
                Theme.of(context).colorScheme.onTertiary,
              },
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
      ),
    );
  }
}