import 'package:flutter_task/app/data/providers/task_provider.dart';
import 'package:get/get.dart';

import 'add_edit_task_controller.dart';

class AddEditTaskBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddEditTaskController>(
      () => AddEditTaskController(),
    );
    Get.lazyPut<TaskProvider>(
      () => TaskProvider(),
    );
  }
}
