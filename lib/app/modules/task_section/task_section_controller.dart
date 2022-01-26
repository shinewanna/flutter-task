import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/core/utils/app_util.dart';
import 'package:flutter_task/app/data/handlers/connectivity_handler.dart';
import 'package:flutter_task/app/data/models/tab_model.dart';
import 'package:flutter_task/app/data/providers/auth_provider.dart';
import 'package:flutter_task/app/data/providers/task_provider.dart';
import 'package:flutter_task/app/modules/completed_tasks/completed_tasks_view.dart';
import 'package:flutter_task/app/modules/tasks/tasks_view.dart';
import 'package:flutter_task/app/routes/app_pages.dart';
import 'package:get/get.dart';

class TaskSectionController extends GetxController {
  DateTime? _pressedTime;
  final index = 0.obs;
  final tabs = [
    FloatingNavbarItem(title: 'Tasks', icon: Icons.home),
    FloatingNavbarItem(title: 'Completed Tasks', icon: Icons.done_all),
  ];
  final views = [
    TabData(
      title: FlutterLogo(),
      view: TasksView(),
    ),
    TabData(
      title: Text('Completed Tasks'),
      view: CompletedTasksView(),
    )
  ];

  void onChangePage(int index) => this.index(index);

  Future<bool> onWillPop() async {
    DateTime now = DateTime.now();
    bool isPressed = _pressedTime == null ||
        now.difference(_pressedTime!) > const Duration(seconds: 3);
    if (isPressed) {
      _pressedTime = now;
      AppUtil.snack('Pressed again to exit.');
      return false;
    }
    return true;
  }

  signOut() async {
    if (await ConnectivityHandler.noInternet()) return;
    AppUtil.showLoading(text: 'Signing Out...');
    Get.find<TaskProvider>(tag: AppConstant.def.all).dispose();
    Get.find<TaskProvider>(tag: AppConstant.def.completed).dispose();
    await Get.find<AuthProvider>().signOut();
    AppUtil.stopLoading();
    Get.offAllNamed(Routes.LOGIN);
  }
}
