import 'package:flutter/material.dart';
import 'package:flutter_task/app/core/utils/output.dart';
import 'package:flutter_task/app/data/enums/submit_type.dart';
import 'package:flutter_task/app/data/models/task_args_model.dart';
import 'package:flutter_task/app/data/models/task_model.dart';
import 'package:flutter_task/app/data/providers/cache_provider.dart';
import 'package:flutter_task/app/modules/widgets/task_tile.dart';
import 'package:flutter_task/app/routes/app_pages.dart';

import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'completed_tasks_controller.dart';

class CompletedTasksView extends GetView<CompletedTasksController> {
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Output(
        controller.resp.value,
        onData: (List<Task> data) => SmartRefresher(
          controller: controller.refreshController,
          enablePullDown: false,
          enablePullUp: data.isCanLoadMore,
          onLoading: () => controller.getCompletedTasks(),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              final task = data[index];
              return TaskTile(
                task: task,
                onEdit: () => Get.toNamed(
                  Routes.ADD_EDIT_TASK,
                  arguments: TaskArgs(
                    id: task.id,
                    task: task.task,
                    submitType: SubmitType.edit,
                  ),
                ),
                onDelete: () => controller.deleteTask(task.id!),
                onComplete: () =>
                    controller.completeOrUndoTask(task.id!, !task.isCompleted),
              );
            },
            separatorBuilder: (BuildContext context, int index) => Divider(),
            itemCount: data.length,
          ),
        ),
      ),
    );
  }
}
