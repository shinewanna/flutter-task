import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

import 'package:get/get.dart';
import 'package:flutter_task/app/core/utils/app_util.dart';
import 'package:flutter_task/app/routes/app_pages.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppUtil.removeFocus(context),
      child: FlutterLogin(
        title: 'Task',
        onLogin: _signIn,
        onSignup: _signUp,
        onRecoverPassword: _forgotPwd,
        onSubmitAnimationCompleted: () => Get.offNamed(Routes.HOME),
      ),
    );
  }

  Future<String?> _signIn(LoginData loginData) async =>
      await controller.signIn(loginData.name, loginData.password);

  Future<String?> _signUp(SignupData signupData) async =>
      await controller.signUp(signupData.name, signupData.password);

  Future<String?> _forgotPwd(String email) async =>
      await controller.forgotPwd(email);
}
