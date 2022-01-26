import 'package:get/get.dart';
import 'package:flutter_task/app/data/providers/auth_provider.dart';

class LoginController extends GetxController {
  final _authProvider = Get.put(AuthProvider());

  Future<String?> signUp(
    String? email,
    String? password,
  ) async =>
      _authProvider.signUp(email, password);

  Future<String?> signIn(
    String email,
    String password,
  ) async =>
      _authProvider.signIn(email, password);

  Future<String?> forgotPwd(String email) async =>
      _authProvider.forgotPwd(email);
}
