import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/providers/task_provider.dart';
import 'package:get/get.dart';

import 'tasks_controller.dart';

class TasksBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TasksController>(
      () => TasksController(),
    );
    Get.lazyPut<TaskProvider>(
      () => TaskProvider(),
      tag: AppConstant.def.all,
    );
    Get.lazyPut<TaskProvider>(
      () => TaskProvider(),
      tag: AppConstant.def.completed,
    );
  }
}
