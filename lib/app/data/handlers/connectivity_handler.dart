import 'package:connectivity/connectivity.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/core/utils/app_util.dart';

class ConnectivityHandler {
  static Future<bool> noInternet({bool isShowSnack = true}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      if (isShowSnack) {
        AppUtil.errSnack(AppConstant.def.noInternet);
      }
      return true;
    }
    return false;
  }
}
