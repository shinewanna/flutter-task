import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? id;
  String? accountId;
  String? task;
  bool isCompleted;
  int? createdAt;

  Task(
      {this.id,
      this.accountId,
      this.task,
      this.isCompleted = false,
      this.createdAt});

  factory Task.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      accountId: data['accountId'],
      task: data['task'],
      isCompleted: data['isCompleted'],
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accountId'] = accountId;
    data['task'] = task;
    data['isCompleted'] = isCompleted;
    data['createdAt'] = createdAt;
    return data;
  }
}
