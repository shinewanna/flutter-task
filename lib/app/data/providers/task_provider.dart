import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_task/app/data/models/task_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';
import 'package:flutter_task/app/core/utils/app_util.dart';
import 'package:flutter_task/app/data/enums/msg_state.dart';
import 'package:flutter_task/app/data/models/resp_model.dart';
import 'package:flutter_task/app/data/providers/cache_provider.dart';

class TaskProvider extends GetxController {
  final _taskCol =
      FirebaseFirestore.instance.collection(AppConstant.firebase.task);
  final _allTask = <List<Task>>[];
  DocumentSnapshot? _lastDocument;
  bool _hasMore = true;

  Future<void> addTasks(List<String> tasks) async {
    AppUtil.showLoading(text: 'Uploading...');
    for (var task in tasks) {
      final taskOb = Task(
        accountId: CacheProvider.myId.getValue(),
        email: CacheProvider.email.getValue(),
        task: task,
        createdAt: DateTime.now().millisecondsSinceEpoch,
      );
      await _taskCol.add(taskOb.toJson());
    }
    AppUtil.stopLoading();
    await Future.delayed(Duration(milliseconds: 50));
  }

  Future<void> editTask(String id, String task) async {
    AppUtil.showLoading(text: 'Uploading...');
    await _taskCol.doc(id).update({
      AppConstant.firebase.task: task,
      AppConstant.firebase.createdAt: DateTime.now().millisecondsSinceEpoch,
    });
    AppUtil.stopLoading();
    await Future.delayed(Duration(milliseconds: 50));
  }

  void getTasks({
    required Function onData,
    required Function onNoMore,
    bool isCompleted = false,
  }) async {
    var query = _taskCol
        .orderBy(AppConstant.firebase.createdAt, descending: true)
        .limit(AppConstant.def.taskLimit)
        .where(
          AppConstant.firebase.accountId,
          isEqualTo: CacheProvider.myId.getValue(),
        );

    if (isCompleted) {
      query =
          query.where(isCompleted, isEqualTo: AppConstant.firebase.isCompleted);
    }

    try {
      if (_lastDocument != null) {
        query = query.startAfterDocument(_lastDocument!);
      }

      // If there's no more users then bail out of the function
      if (!_hasMore) {
        onNoMore();
        return;
      }

      final currentRequestIndex = _allTask.length;

      query.snapshots().listen((snapshot) {
        if (snapshot.docs.isNotEmpty) {
          final users = snapshot.docs
              .map((snapshot) => Task.fromFirestore(snapshot))
              .toList();

          final pageExists = currentRequestIndex < _allTask.length;

          if (pageExists) {
            _allTask[currentRequestIndex] = users;
          } else {
            _allTask.add(users);
          }
          final allTask = _allTask.fold<List<Task>>(<Task>[],
              (initialValue, pageItems) => initialValue..addAll(pageItems));
          //* Update UI
          onData(Resp(data: allTask, message: MsgState.data));
          // Save the last document from the results only,
          // if it's the current last page
          if (currentRequestIndex == _allTask.length - 1) {
            _lastDocument = snapshot.docs.last;
          }

          // Determine if there's more users to request
          _hasMore = users.length == AppConstant.def.taskLimit;
        } else {
          if (_allTask.isNotEmpty && _allTask.length != 1) {
            onNoMore();
          } else {
            //* Update UI, pass Empty List
            onData(Resp(data: <Task>[], message: MsgState.data));
          }
        }
      });
    } catch (e) {
      //* Show error
      AppUtil.errSnack(e.toString());
    }
  }

  deleteTask(String id) => _taskCol.doc(id).delete();
}
