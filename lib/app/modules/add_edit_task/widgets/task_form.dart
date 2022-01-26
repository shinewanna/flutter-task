import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/config/app_color.dart';
import 'package:flutter_task/app/modules/add_edit_task/add_edit_task_controller.dart';
import 'package:flutter_task/app/modules/widgets/custom_textfield.dart';
import 'package:flutter_task/app/modules/widgets/nth.dart';
import 'package:get/get.dart';

class TaskForm extends GetView<AddEditTaskController> {
  final TextEditingController task;
  final int index;

  const TaskForm({required this.task, required this.index});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AddEditTaskController>(
      id: index,
      init: AddEditTaskController(),
      builder: (_) => CustomTextField(
        controller: task,
        hint: 'Add Task',
        onChanged: (_) => controller.onTextFieldChange(index),
        maxLength: 280,
        autoFocus: index == 0,
        trailing: task.text.isEmpty
            ? IconButton(
                onPressed: () => controller.removeTask(index),
                icon: Icon(
                  Icons.delete,
                  color: AppColor.g,
                ),
              )
            : Nth(),
      ),
    );
  }
}
