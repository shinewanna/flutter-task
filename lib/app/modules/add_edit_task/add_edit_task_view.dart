import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/utils/app_util.dart';
import 'package:flutter_task/app/data/enums/submit_type.dart';
import 'package:flutter_task/app/data/providers/cache_provider.dart';
import 'package:flutter_task/app/modules/add_edit_task/widgets/floating_button.dart';
import 'package:flutter_task/app/modules/add_edit_task/widgets/task_form.dart';
import 'package:flutter_task/app/modules/widgets/custom_button.dart';

import 'package:get/get.dart';

import 'add_edit_task_controller.dart';

class AddEditTaskView extends GetView<AddEditTaskController> {
  @override
  Widget build(BuildContext context) {
    final title = controller.taskArgs!.submitType!.name.toUpperCaseTheFirstChar;
    var buttonLabel =
        controller.taskArgs!.submitType! == SubmitType.add ? 'Add' : 'Update';
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: [
          CustomButton(
            buttonLabel: buttonLabel,
            onTap: () {
              AppUtil.removeFocus(context);
              controller.submitTask();
            },
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () => AppUtil.removeFocus(context),
        child: Obx(
          () => Form(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                itemCount: controller.tasks.length,
                itemBuilder: (_, index) => TaskForm(
                  task: controller.tasks[index],
                  index: index,
                ),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton:
          FloatingButton(submitType: controller.taskArgs!.submitType),
    );
  }
}
