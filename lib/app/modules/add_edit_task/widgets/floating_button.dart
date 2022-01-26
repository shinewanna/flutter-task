import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/enums/submit_type.dart';
import 'package:flutter_task/app/modules/add_edit_task/add_edit_task_controller.dart';
import 'package:flutter_task/app/modules/widgets/nth.dart';
import 'package:get/get.dart';

class FloatingButton extends GetView<AddEditTaskController> {
  final SubmitType? submitType;

  FloatingButton({this.submitType});
  @override
  Widget build(BuildContext context) {
    return submitType == SubmitType.add
        ? FloatingActionButton(
            onPressed: controller.addTask,
            child: Icon(Icons.add),
          )
        : Nth();
  }
}
