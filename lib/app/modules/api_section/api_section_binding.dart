import 'package:flutter_task/app/core/utils/dependency_injection.dart';
import 'package:flutter_task/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

import 'api_section_controller.dart';

class ApiSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiSectionController>(
      () => ApiSectionController(),
    );
    Get.lazyPut<UserRepository>(
      () => UserRepository(),
    );
    DependencyInjection.injectDio();
  }
}
