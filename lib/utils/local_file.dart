import 'dart:io';
//import 'dart:ui';

import 'package:path_provider/path_provider.dart';

class LocalFileManager {
  Future<String> get _localAppPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<String> get _localTempPath async {
    final directory = await getTemporaryDirectory();
    return directory.path;
  }

  ///Read content from file
  ///return String
  Future<String> readlocalFile(String fileName, bool isTemp) async {
    String contents = "";
    var path = await _localTempPath;
    if (!isTemp) {
      path = await _localAppPath;
    }
    String filePath = '${path}/$fileName';
    File(filePath).readAsString().then((String result) {
      contents = result;
    });
    return contents;
  }

  Future<File> saveLocalFile(
      String fileName, String contents, bool isTemp) async {
    String contents = "";
    var path = await _localTempPath;
    if (!isTemp) {
      path = await _localAppPath;
    }
    String filePath = '${path}/$fileName';
    Future<File> file = File(filePath).writeAsString(contents);
    return file;
  }
}
