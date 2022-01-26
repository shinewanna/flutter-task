import 'package:flutter_task/app/modules/completed_tasks/completed_tasks_binding.dart';
import 'package:flutter_task/app/modules/tasks/tasks_binding.dart';

class DependencyInjection {
  DependencyInjection.inject() {
    TasksBinding().dependencies();
    CompletedTasksBinding().dependencies();
  }
}
