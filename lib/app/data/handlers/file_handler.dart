import 'package:path_provider/path_provider.dart';

class FileHandler {
  Future<String> get getPath async =>
      (await getApplicationDocumentsDirectory()).path;
}
