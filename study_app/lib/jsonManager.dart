import 'dart:io';
import 'package:path_provider/path_provider.dart';

class JsonManager {
  Future<List<String>> getJsonFileNames() async {
    Directory directory = await getApplicationDocumentsDirectory();
    List<String> jsonFiles = [];

    if (await directory.exists()) {
      List<FileSystemEntity> files = directory.listSync();

      for (var file in files) {
        if (file is File && file.path.endsWith('.json')) {
          jsonFiles.add(file.path);
        }
      }
    }

    return jsonFiles;
  }
}
