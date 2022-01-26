import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/models/task_args_model.dart';
import 'package:get/get.dart';
import 'package:flutter_task/app/data/enums/submit_type.dart';
import 'package:flutter_task/app/routes/app_pages.dart';

class FloatingButton extends Container {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      tooltip: 'Add Tasks',
      onPressed: () => Get.toNamed(
        Routes.ADD_EDIT_TASK,
        arguments: TaskArgs(submitType: SubmitType.add),
      ),
      child: Icon(Icons.add),
    );
  }
}
