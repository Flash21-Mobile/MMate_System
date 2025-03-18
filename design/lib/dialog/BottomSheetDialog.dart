import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../config.dart';

class BottomSheetDialog {
  final BuildContext context;
  final Widget child;

  const BottomSheetDialog(
      {required this.context,
      required this.child});

  Future show()async {
    await showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        enableDrag: true,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: AppConfig.borderRadiusTop),
        useSafeArea: true,
        builder: (context) {
          return DraggableScrollableSheet(
              snap: true,
              expand: false,
              maxChildSize: 1.0,
              initialChildSize: 0.9,
              minChildSize: 0.89,
              shouldCloseOnMinExtent: true,
              builder: (context, scrollController) => ClipRRect(
                  borderRadius: AppConfig.borderRadiusTop,
                  child: SingleChildScrollView(
                      controller: scrollController,
                      child: Column(children: [
                        child
                      ]))));
        });
  }
}