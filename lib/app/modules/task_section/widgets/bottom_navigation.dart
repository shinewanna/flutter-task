import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/task_section/task_section_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_task/app/core/config/app_color.dart';

class BottomNavigation extends GetView<TaskSectionController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => FloatingNavbar(
          items: controller.tabs,
          currentIndex: controller.index.value,
          onTap: controller.onChangePage,
          backgroundColor: AppColor.s,
          selectedItemColor: AppColor.s,
        ));
  }
}
