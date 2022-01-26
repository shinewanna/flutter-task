import 'package:flutter_task/app/core/utils/dependency_injection.dart';
import 'package:flutter_task/app/data/providers/auth_provider.dart';
import 'package:get/get.dart';

import 'task_section_controller.dart';

class TaskSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskSectionController>(
      () => TaskSectionController(),
    );
    //* we inject in TaskSectionBinding, after logout and relogin, we have to inject again to get controller,
    //* because we use lazyput for memory performace
    DependencyInjection.inject();
  }
}
