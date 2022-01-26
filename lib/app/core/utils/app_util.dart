import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:get/get.dart';
import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_task/app/data/models/resp_model.dart';

class AppUtil {
  AppUtil._();

  static bool get isWeb => kIsWeb;

  static bool get isAndroid => Platform.isAndroid;

  static bool get isIOS => Platform.isIOS;

  static String? validate(String? value) =>
      value!.isEmpty ? 'Field can not be empty' : null;

  static Future<void> showLoading({String text = 'Loading...'}) {
    return Get.dialog(
      Material(
        color: Colors.transparent,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(),
            const SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void stopLoading() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }

  static void removeFocus(context) => FocusScope.of(context).unfocus();

  static errSnack(String error, {String title = 'Error'}) {
    AppUtil.stopLoading();
    Get.snackbar(
      title,
      error,
      colorText: Colors.red,
    );
  }

  static snack(String title, {String msg = '', textColor = Colors.green}) {
    AppUtil.stopLoading();
    Get.snackbar(
      title,
      msg,
      colorText: textColor,
    );
  }

  static int getPage(Rx<Resp> resp) =>
      (((resp.value.data as List).length / AppConstant.def.requestLimit) + 1)
          .round();
}
