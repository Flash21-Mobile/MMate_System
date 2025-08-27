import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

import 'dart:convert';
import 'dart:io';
import 'dart:math' as math;

import 'package:http/http.dart' as http;
import 'package:package_info_plus/package_info_plus.dart';

class VersionCheck {
  static Future<AppCheckerResult> checkVersion() async {
    try {
      final packageInfo = await PackageInfo.fromPlatform();
      final currentVersion = packageInfo.version;
      final packageName = packageInfo.packageName;

      String? storeVersion;
      String? appURL;

      if (Platform.isIOS) {
        final url =
            Uri.parse('https://itunes.apple.com/lookup?bundleId=$packageName');
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final jsonData = json.decode(response.body);
          if ((jsonData['resultCount'] ?? 0) > 0) {
            final result = jsonData['results'][0];
            storeVersion = result['version'];
            appURL = result['trackViewUrl'];
          } else {
            return AppCheckerResult(
                currentVersion, null, null, '앱스토어에서 앱을 찾을 수 없습니다.');
          }
        } else {
          return AppCheckerResult(currentVersion, null, null, 'iOS 버전 요청 실패');
        }
      } else if (Platform.isAndroid) {
        final url = Uri.parse(
            'https://play.google.com/store/apps/details?id=$packageName&hl=ko');
        final response = await http.get(url);

        if (response.statusCode == 200) {
          final html = response.body;

          final versionRegExp = RegExp(r',\[\[\["([0-9,.]*)"]],');
          final match = versionRegExp.firstMatch(html);

          if (match != null) {
            storeVersion = match.group(1)?.trim();
            appURL =
                'https://play.google.com/store/apps/details?id=$packageName';
          } else {
            return AppCheckerResult(currentVersion, null, null,
                '버전을 찾을 수 없습니다 (HTML 구조 변경?): ${html}');
          }
        } else {
          return AppCheckerResult(currentVersion, null, null, '플레이스토어 요청 실패');
        }
      } else {
        return AppCheckerResult(currentVersion, null, null, '지원하지 않는 플랫폼');
      }

      return AppCheckerResult(currentVersion, storeVersion, appURL, null);
    } catch (e) {
      return AppCheckerResult('unknown', null, null, e.toString());
    }
  }
}

class AppCheckerResult {
  final String currentVersion;
  final String? newVersion;
  final String? appURL;
  final String? errorMessage;

  AppCheckerResult(
    this.currentVersion,
    this.newVersion,
    this.appURL,
    this.errorMessage,
  );

  bool get canUpdate =>
      _shouldUpdate(currentVersion, newVersion ?? currentVersion);

  bool _shouldUpdate(String versionA, String versionB) {
    final versionNumbersA =
        versionA.split('.').map((e) => int.tryParse(e) ?? 0).toList();
    final versionNumbersB =
        versionB.split('.').map((e) => int.tryParse(e) ?? 0).toList();

    final int versionASize = versionNumbersA.length;
    final int versionBSize = versionNumbersB.length;
    final int maxSize = math.max(versionASize, versionBSize);

    for (int i = 0; i < maxSize; i++) {
      if ((i < versionASize ? versionNumbersA[i] : 0) >
          (i < versionBSize ? versionNumbersB[i] : 0)) {
        return false;
      } else if ((i < versionASize ? versionNumbersA[i] : 0) <
          (i < versionBSize ? versionNumbersB[i] : 0)) {
        return true;
      }
    }
    return false;
  }

  @override
  String toString() {
    return '현재 버전: $currentVersion\n새 버전: $newVersion\n앱 URL: $appURL\n업데이트 가능: $canUpdate\n오류: $errorMessage';
  }
}
