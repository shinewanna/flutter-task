import 'package:hive/hive.dart';
import 'package:flutter_task/app/core/config/app_constant.dart';

class CacheProvider {
  CacheProvider._();
  static var box = Hive.box(cache);

  static const cache = 'cache';
  static const myId = 'myId';
  static const email = 'email';

  static Future<void> open(path) {
    Hive.init(path);
    return Hive.openBox(CacheProvider.cache);
  }

  static Future<void> clear() => box.clear();
}

extension StringExt on String? {
  static var box = Hive.box(CacheProvider.cache);

  Future<void> setValue(value) => box.put(this, value);

  getValue({defaultValue}) => box.get(this, defaultValue: defaultValue);

  bool get isEmptyOrNull => this == null || this!.isEmpty;

  String get toUpperCaseTheFirstChar {
    if (this == null) return '';
    String value = this!;
    String result = value[0].toUpperCase();
    result += value.substring(1);
    return result;
  }
}

extension ListExt on List? {
  bool get isCanLoadMore => (this!.length % AppConstant.def.requestLimit) == 0;
}
