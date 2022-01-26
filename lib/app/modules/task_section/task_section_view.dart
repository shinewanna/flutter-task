import 'package:flutter/material.dart';
import 'package:flutter_task/app/modules/task_section/widgets/bottom_navigation.dart';
import 'package:flutter_task/app/modules/task_section/widgets/floating_button.dart';
import 'package:flutter_task/app/modules/widgets/connectivity_label.dart';
import 'package:flutter_task/app/modules/widgets/nth.dart';

import 'package:get/get.dart';

import 'task_section_controller.dart';

class TaskSectionView extends GetView<TaskSectionController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => controller.views[controller.index.value].title),
        actions: [
          IconButton(
            tooltip: 'Sign Out',
            onPressed: () => Get.defaultDialog(
              title: 'Are you sure to Sign Out?',
              content: Nth(),
              onCancel: () {},
              onConfirm: controller.signOut,
            ),
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          ConnectivityLabel(),
          Expanded(
            child: Obx(() => controller.views[controller.index.value].view),
          ),
        ],
      ),
      floatingActionButton: FloatingButton(),
      bottomNavigationBar: BottomNavigation(),
    );
  }
}
