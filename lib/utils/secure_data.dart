import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureData {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  writeData(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String> readData(String key) async {
    String value = await secureStorage.read(key: key) ?? 'NoData';
    return value;
  }

  deleteData(String key) async {
    await secureStorage.delete(key: key);
  }

  //convert ve map truoc khi goi ham
  saveJson(String key, Map<String, dynamic> data) async {
    String sdata = json.encode(data);
    await writeData(key, sdata);
  }

  //
   Future<Map<String, dynamic>> readJson(String key) async {
    String sdata = await secureStorage.read(key: key) ?? "{data:'nodata'}";
    return json.decode(sdata) as Map<String, dynamic>;
  }
}
