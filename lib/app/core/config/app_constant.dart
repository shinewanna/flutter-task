import 'package:print_color/print_color.dart';

class AppConstant {
  AppConstant._();

  static final firebase = _FirebaseConstant();
  static final def = _DefaultConstant();
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
  final taskLimit = 10;
  final all = 'all';
  final completed = 'completed';

  _DefaultConstant() {
    Print.magenta('Default Created');
  }
}
