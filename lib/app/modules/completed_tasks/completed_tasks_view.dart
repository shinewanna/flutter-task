import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'completed_tasks_controller.dart';

class CompletedTasksView extends GetView<CompletedTasksController> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'TasksView is working',
        style: TextStyle(fontSize: 20),
      ),
    );
  }
}
