import 'package:design_system/animate/ink_well.dart';
import 'package:design_system/image/image.dart';
import 'package:design_system/text/text_interface.dart';
import 'package:flutter/material.dart';
import 'package:function_system/utilities/log.dart';
import 'package:function_system/utilities/version_check.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app/style/app_style.dart';

class VersionCheckDialog {
  BuildContext context;

  VersionCheckDialog(this.context);

  Future<bool> show({
    required String appName,
    required Object appLogo,
  }) async {
    final checkedData = await VersionCheck.checkVersion();

    Log.d('''
    앱 업데이트 체크
    canUpdate : ${checkedData.canUpdate}
    currentVersion : ${checkedData.currentVersion}
    newVersion : ${checkedData.newVersion}
    appURL : ${checkedData.appURL}
    errorMessage : ${checkedData.errorMessage}''');

    if (checkedData.canUpdate) {
      await dismiss(
        title: '새로운 버전이 출시되었습니다 \n앱을 업데이트합니다',
        buttonText: '업데이트',
        onTap: () async {
          final appUri = checkedData.appURL != null
              ? Uri.tryParse(checkedData.appURL!)
              : null;

          if (appUri != null && await canLaunchUrl(appUri)) {
            await launchUrl(appUri);
          }
        },
        appName: appName,
        appLogo: appLogo,
      );
      return false;
    } else {
      return true;
    }
  }

  Future<void> dismiss({
    required String title,
    Function()? onTap,
    required String buttonText,
    required String appName,
    required Object appLogo,
  }) async {
    return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return PopScope(
          canPop: false,
          child: Dialog(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            backgroundColor: Colors.white,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MMateImage(
                          height: sp24,
                          appLogo,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                    SizedBox(height: sp16),
                    IndexText(title, textAlign: TextAlign.center),
                    SizedBox(height: sp16),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Material(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(100),
                            child: MMateInkWell(
                              borderRadius: BorderRadius.circular(100),
                              onTap: onTap,
                              child: Container(
                                padding: EdgeInsets.symmetric(vertical: sp16),
                                alignment: Alignment.center,
                                child: IndexText(
                                  buttonText,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
