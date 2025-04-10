import 'package:design_system/config.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

extension MMateToast on BuildContext {
  void toast(String message, {double? bottomPadding}) {
    FToast fToast = FToast();
    fToast.init(this);
    final screenWidth = MediaQuery.of(this).size.width;

    FocusManager.instance.primaryFocus?.unfocus();

    fToast.showToast(
      child: Container(
          margin: EdgeInsets.only(
            bottom: AppConfig.paddingIndex +
                MediaQuery.of(this).padding.bottom +
                (bottomPadding ?? 0.0),
            left: AppConfig.paddingIndex,
            right: AppConfig.paddingIndex,
          ),
          width: screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          decoration: BoxDecoration(
            color: Color(0xFF333333),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            IndexTextMin(
              message,
              color: Colors.white,
            ),
          ])),
    );
  }

  void warningToast(String message, {double? bottomPadding}) {
    FToast fToast = FToast();
    fToast.init(this);
    final screenWidth = MediaQuery.of(this).size.width;

    FocusManager.instance.primaryFocus?.unfocus();


    fToast.showToast(
      child: Container(
          margin: EdgeInsets.only(
            bottom: AppConfig.paddingIndex +
                MediaQuery.of(this).padding.bottom +
                (bottomPadding ?? 0.0),
            left: AppConfig.paddingIndex,
            right: AppConfig.paddingIndex,
          ),
          width: screenWidth,
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8.0),
          decoration: BoxDecoration(
            color: Color(0xFF333333),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child:
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Icon(
              Icons.cancel_rounded,
              color: Colors.white,
            ),
            SizedBox(width: 12),
            IndexTextMin(
              message,
              color: Colors.white,
            ),
          ])),
    );
  }
}