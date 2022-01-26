import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/providers/auth_provider.dart';
import 'package:flutter_task/app/data/providers/task_provider.dart';
import 'package:flutter_task/app/modules/completed_tasks/completed_tasks_binding.dart';
import 'package:flutter_task/app/modules/tasks/tasks_binding.dart';
import 'package:get/get.dart';

import 'task_section_controller.dart';

class TaskSectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TaskSectionController>(
      () => TaskSectionController(),
    );
    Get.lazyPut<TaskProvider>(
      () => TaskProvider(),
      tag: AppConstant.def.all,
    );
    Get.lazyPut<TaskProvider>(
      () => TaskProvider(),
      tag: AppConstant.def.completed,
    );
    Get.lazyPut<AuthProvider>(
      () => AuthProvider(),
    );
    TasksBinding().dependencies();
    CompletedTasksBinding().dependencies();
  }
}
