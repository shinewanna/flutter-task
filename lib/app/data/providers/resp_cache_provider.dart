import 'package:hive/hive.dart';

class RespCacheProvider {
  static final users = 'users';

  Future<bool> isExists({required String boxName}) async {
    final box = await Hive.openBox(boxName);
    final length = box.length;
    return length != 0;
  }

  setValues<T>(List<T> items, String boxName) async {
    final box = await _getBox(boxName);
    await box.clear();
    box.addAll(items);
  }

  Future<List<T>> getValues<T>(String boxName) async {
    final items = <T>[];
    final box = await _getBox(boxName);
    final length = box.length;
    for (int i = 0; i < length; i++) {
      items.add(box.getAt(i));
    }
    return items;
  }

  Future<Box> _getBox(String boxName) async {
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box(boxName);
    } else {
      return await Hive.openBox(boxName);
    }
  }
}
