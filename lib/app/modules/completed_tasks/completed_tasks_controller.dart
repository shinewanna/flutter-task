import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/models/resp_model.dart';
import 'package:flutter_task/app/data/providers/task_provider.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class CompletedTasksController extends GetxController {
  final _taskProvider = Get.find<TaskProvider>(tag: AppConstant.def.completed);
  final resp = Resp().obs;
  final refreshController = RefreshController();

  deleteTask(String id) => _taskProvider.deleteTask(id);

  completeOrUndoTask(String id, bool value) =>
      _taskProvider.completeOrUndoTask(id, value);

  getCompletedTasks() {
    _taskProvider.getTasks(
        isCompleted: true,
        onData: (Resp data) {
          resp.value = data;
          refreshController.loadComplete();
        },
        onNoMore: () {
          refreshController.loadNoData();
        });
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    getCompletedTasks();
  }
}
