import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/enums/submit_type.dart';
import 'package:flutter_task/app/data/handlers/connectivity_handler.dart';
import 'package:flutter_task/app/data/models/task_args_model.dart';
import 'package:flutter_task/app/data/providers/task_provider.dart';
import 'package:get/get.dart';

class AddEditTaskController extends GetxController {
  final _taskProvider = Get.find<TaskProvider>();
  final _tasks = <TextEditingController>[TextEditingController()].obs;
  final formKey = GlobalKey<FormState>();
  TaskArgs? taskArgs;

  List<TextEditingController> get tasks => _tasks;

  addTask() => _tasks.add(TextEditingController());

  removeTask(int index) => _tasks.removeAt(index);

  //* If edit we need id to update
  submitTask() async {
    if (await _checkConnectivityAndValidate()) {
      return;
    }
    if (taskArgs!.id != null) {
      editTask();
    } else {
      addTasks();
    }
  }

  editTask() async {
    await _taskProvider.editTask(taskArgs!.id!, _tasks[0].text);
    Get.back();
  }

  addTasks() async {
    await _taskProvider.addTasks(_tasks.map((e) => e.text).toList());
    Get.back();
  }

  Future<bool> _checkConnectivityAndValidate() async =>
      await ConnectivityHandler.noInternet() ||
      !formKey.currentState!.validate();

  //* Updating each textfield for show and hide delete icon purpose
  onTextFieldChange(int index) => update([index]);

  @override
  void onInit() {
    super.onInit();
    taskArgs = Get.arguments as TaskArgs;
    if (taskArgs!.submitType == SubmitType.edit) {
      _tasks[0].text = taskArgs!.task ?? '';
    }
  }
}
