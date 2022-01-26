import 'package:flutter_task/app/core/config/secret_constant.dart';

class AppConstant {
  AppConstant._();

  static final firebase = _FirebaseConstant();
  static final def = _DefaultConstant();
  static final url = _UrlConstant();
  static final secret = SecretConstant();
}

class _FirebaseConstant {
  final accountId = 'accountId';
  final task = 'task';
  final isCompleted = 'isCompleted';
  final createdAt = 'createdAt';
}

class _DefaultConstant {
  final appName = 'Flutter Task';
  final noInternet = 'No Internet';
  final requestLimit = 10;
  final all = 'all';
  final completed = 'completed';
}

class _UrlConstant {
  final base = 'https://dummyapi.io/data/v1/';
  final user = 'user';
}
