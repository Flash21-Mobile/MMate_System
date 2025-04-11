import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:function_system/domain/account/account_entity.dart';
import 'package:function_system/utilities/exception/exceoption.dart';
import 'package:restart_app/restart_app.dart';

import '../provider/login_viewmodel.dart';

extension GetMyAccountOnRef on Ref {
  AccountEntity getMyAccount({bool onErrorRestart = true}) {
    final result = watch(loginViewmodelProvider);

    if (result.data == null) {
      if (onErrorRestart) {
        Restart.restartApp();
      }
      throw MMateException.noDataOnMyAccount;
    }

    return result.data!;
  }
}

extension GetMyAccountOnWidgetRef on WidgetRef {
  AccountEntity getMyAccount({bool onErrorRestart = true}) {

    final result = watch(loginViewmodelProvider);
    if ( result.data == null) {
      if (onErrorRestart) {
        Restart.restartApp();
      }
      throw MMateException.noDataOnMyAccount;
    }

    return result.data!;
  }
}
