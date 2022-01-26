import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/data/models/resp_model.dart';
import 'package:flutter_task/app/data/providers/task_provider.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TasksController extends GetxController {
  final _tweetProvider = Get.find<TaskProvider>(tag: AppConstant.def.all);
  final resp = Resp().obs;
  final refreshController = RefreshController();

  void deleteTask(String id) => _tweetProvider.deleteTask(id);

  void getTasks() {
    _tweetProvider.getTasks(onData: (Resp data) {
      resp.value = data;
      refreshController.loadComplete();
    }, onNoMore: () {
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
    getTasks();
  }
}
