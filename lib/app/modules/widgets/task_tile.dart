import 'package:flutter/material.dart';
import 'package:flutter_task/app/data/models/task_model.dart';
import 'package:flutter_task/app/modules/widgets/nth.dart';
import 'package:get/get.dart';

class TaskTile extends Container {
  final Task task;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  TaskTile({required this.task, this.onEdit, this.onDelete});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        task.task ?? '',
        style: Theme.of(context).textTheme.bodyText1,
      ),
      trailing: Row(
        children: [
          // Checkbox(
          //   onChanged: (value) {
          //     task.isCompleted = value;
          //   },
          //   activeColor: Theme.of(context).primaryColor,
          //   value: false,
          // ),
          DropdownButton<String>(
            underline: Nth(),
            icon: Icon(Icons.edit),
            items: <String>['Edit', 'Delete'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (value) {
              switch (value) {
                case 'Edit':
                  onEdit!();
                  break;
                case 'Delete':
                  Get.defaultDialog(
                    title: 'Are you sure to Delete?',
                    content: Nth(),
                    onConfirm: () {
                      onDelete!();
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
        ],
      ),
    );
  }
}
