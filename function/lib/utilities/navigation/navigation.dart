import 'package:flutter/material.dart';
import 'package:function_system/utilities/navigation/router.dart';

extension Navigation on BuildContext {
  Future<T?> go<T>(Widget router) {
    return Navigator.of(this).push<T>(PageRouteBuilder(
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero,
        pageBuilder: (context, animation, secondaryAnimation) {
          return router;
        }));
  }

  Future<T?> push<T>(Widget router) {
    return Navigator.of(this)
        .push<T>(MaterialPageRoute(builder: (BuildContext context) {
      return router;
    }));
  }

  void replace(Widget router) {
    Navigator.of(this)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return router;
    }));
  }

  void pop<T extends Object?>([ T? result ]) => Navigator.of(this).pop(result);

  void superPop<T extends Object?>([ T? result ]) {
    Navigator.of(this).popUntil((route) => route.isFirst);
  }
}
