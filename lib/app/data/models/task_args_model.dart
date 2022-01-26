import 'package:flutter_task/app/data/enums/submit_type.dart';

class TaskArgs {
  final String? id;
  final String? task;
  final SubmitType? submitType;

  TaskArgs({this.id, this.task, this.submitType});
}
