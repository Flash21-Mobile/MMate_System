import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' as developer;

import 'package:flutter/services.dart';

import 'package:flutter/foundation.dart';

class Log {
  static void d(dynamic message) {
    _log('DEBUG', message);
  }

  static void i(dynamic message) {
    _log('INFO', message);
  }

  static void w(dynamic message) {
    _log('WARNING', message);
  }

  static void e(dynamic message) {
    _log('ERROR', message);
  }

  static void _log(String level, dynamic message) {
    if (!kDebugMode) return;

    final timestamp = DateTime.now().toIso8601String();
    final location = _getCallerLocation();

    // ignore: avoid_print
    _print('[$timestamp][$level] $message\n➡️ $location');


  }

  static void _print(String text) {
    final pattern = RegExp('.{1,800}'); // 800자 단위로 끊음
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  static String _getCallerLocation() {
    final trace = StackTrace.current.toString().split('\n');

    // 0: this function (_getCallerLocation)
    // 1: _log()
    // 2: Logger.debug()/info()/warning()/error()
    // 3: actual caller
    // 따라서 trace[3]이 우리가 원하는 실제 호출 위치
    if (trace.length > 3) {
      return trace[3].trim();
    }

    return 'Unknown Location';
  }
}