import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/models/task_model.dart';
import 'package:flutter_task/app/modules/widgets/nth.dart';
import 'package:get/get.dart';

class TaskTile extends Container {
  final Task task;
  final VoidCallback onEdit, onDelete, onComplete;

  TaskTile({
    required this.task,
    required this.onEdit,
    required this.onDelete,
    required this.onComplete,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.task ?? '',
        style: TextStyle(
            fontWeight: FontWeight.w500,
            decoration: task.isCompleted
                ? TextDecoration.lineThrough
                : TextDecoration.none),
      ),
      trailing: DropdownButton<String>(
        underline: Nth(),
        icon: Icon(Icons.edit),
        items: <String>[
          task.isCompleted ? 'Undo' : 'Complete',
          'Edit',
          'Delete'
        ].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          switch (value) {
            case 'Undo':
              onComplete();
              break;
            case 'Complete':
              onComplete();
              break;
            case 'Edit':
              onEdit();
              break;
            case 'Delete':
              Get.defaultDialog(
                title: 'Are you sure to Delete?',
                content: Nth(),
                onConfirm: () {
                  onDelete();
                  Get.back();
                },
                onCancel: () {},
              );
              break;
            default:
              break;
          }
        },
      ),
    );
  }
}
