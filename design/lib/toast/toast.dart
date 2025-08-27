import 'package:design_system/toast/toast_type.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

export 'toast_type.dart';

extension MMateToast on BuildContext {
  void toast(
      String message, {
        double? bottomPadding,
        ToastType toastType = ToastType.normal,
      }) {
    FToast fToast = FToast();
    fToast.init(this);
    final screenWidth = MediaQuery.of(this).size.width;

    FocusManager.instance.primaryFocus?.unfocus();

    final isLightMode =
        MediaQuery.of(this).platformBrightness == Brightness.light;

    fToast.showToast(
      child: Container(
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(this).padding.bottom + (bottomPadding ?? 0.0),
          // left: 16,
          // right: 16,
        ),
        width: screenWidth,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
        decoration: BoxDecoration(
          color: isLightMode ? Color(0xFF333333) : Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (toastType.icon != null) ...[
              Icon(toastType.icon, color: Colors.white,size: 18,),
              SizedBox(width: 10),
            ],
            Text(
              message,
              style: TextStyle(
                color: isLightMode ? Colors.white : Colors.black,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
