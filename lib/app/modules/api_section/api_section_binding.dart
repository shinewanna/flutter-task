import 'package:get/get.dart';

import 'api_section_controller.dart';

class ApiSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiSectionController>(
      () => ApiSectionController(),
    );
  }
}
