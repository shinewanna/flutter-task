import 'package:cloud_firestore/cloud_firestore.dart';

class Task {
  String? id;
  String? accountId;
  String? email;
  String? task;
  bool? isCompleted;
  int? createdAt;

  Task(
      {this.id,
      this.accountId,
      this.email,
      this.task,
      this.isCompleted,
      this.createdAt});

  factory Task.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return Task(
      id: doc.id,
      accountId: data['accountId'],
      email: data['email'],
      task: data['task'],
      isCompleted: data['isCompleted'] ?? false,
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['accountId'] = accountId;
    data['email'] = email;
    data['task'] = task;
    data['isCompleted'] = isCompleted;
    data['createdAt'] = createdAt;
    return data;
  }
}
