import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:permission_handler/permission_handler.dart';

class MMatePermission {
  static Future<bool> photos() async {
    final permission = Permission.photos;

    if (await permission.isLimited) {
      await openAppSettings();
      return await permission.isGranted;
    }

    if (await permission.isPermanentlyDenied) {
      await openAppSettings();
      return await permission.isGranted;
    }

    final status = await permission.request();

    if (status.isGranted) {
      return true;
    } else if (status.isDenied) {}

    return false;
  }

  static Future<bool> location() async {
    final permission = Permission.location;

    if (await permission.isGranted) {
      return true;
    }

    if (await permission.isPermanentlyDenied ||
        await permission.isRestricted ||
        await permission.isLimited) {
      await openAppSettings();
      return await permission.isGranted;
    }

    final status = await permission.request();

    return status.isGranted;
  }

  static Future<bool> cellphone() async {
    final permission = Permission.phone;

    if (await permission.isGranted) {
      return true;
    }

    if (await permission.isPermanentlyDenied ||
        await permission.isRestricted ||
        await permission.isLimited) {
      if (Platform.isAndroid) {
        await Future.microtask(() async {
          await Fluttertoast.showToast(
            msg: '전화 권한을 허용해주세요',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.black87,
            textColor: Colors.white,
            fontSize: 16.0,
          );
        });
      }
      await openAppSettings();
      return await permission.isGranted;
    }

    final status = await permission.request();


    return status.isGranted;
  }
}
