import 'package:get/get.dart';

import 'package:flutter_task/app/data/providers/cache_provider.dart';
import 'package:flutter_task/app/modules/add_edit_task/add_edit_task_binding.dart';
import 'package:flutter_task/app/modules/add_edit_task/add_edit_task_view.dart';
import 'package:flutter_task/app/modules/api_section/api_section_binding.dart';
import 'package:flutter_task/app/modules/api_section/api_section_view.dart';
import 'package:flutter_task/app/modules/completed_tasks/completed_tasks_binding.dart';
import 'package:flutter_task/app/modules/completed_tasks/completed_tasks_view.dart';
import 'package:flutter_task/app/modules/home/home_binding.dart';
import 'package:flutter_task/app/modules/home/home_view.dart';
import 'package:flutter_task/app/modules/login/login_binding.dart';
import 'package:flutter_task/app/modules/login/login_view.dart';
import 'package:flutter_task/app/modules/task_section/task_section_binding.dart';
import 'package:flutter_task/app/modules/task_section/task_section_view.dart';
import 'package:flutter_task/app/modules/tasks/tasks_binding.dart';
import 'package:flutter_task/app/modules/tasks/tasks_view.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.TASKS,
      page: () => TasksView(),
      binding: TasksBinding(),
    ),
    GetPage(
      name: _Paths.COMPLETED_TASKS,
      page: () => CompletedTasksView(),
      binding: CompletedTasksBinding(),
    ),
    GetPage(
      name: _Paths.API_SECTION,
      page: () => ApiSectionView(),
      binding: ApiSectionBinding(),
    ),
    GetPage(
      name: _Paths.TASK_SECTION,
      page: () => TaskSectionView(),
      binding: TaskSectionBinding(),
    ),
    GetPage(
      name: _Paths.ADD_EDIT_TASK,
      page: () => AddEditTaskView(),
      binding: AddEditTaskBinding(),
    ),
  ];
}
