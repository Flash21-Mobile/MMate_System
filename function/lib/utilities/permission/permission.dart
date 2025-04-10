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
    } else if (status.isDenied) {

    }

    return false;
  }
}