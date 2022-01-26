import 'package:flutter_task/app/data/providers/auth_provider.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(
      () => LoginController(),
    );
    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
  }
}
