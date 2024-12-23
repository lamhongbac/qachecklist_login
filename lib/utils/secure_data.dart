import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureData {
  FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  writeData(String key, String value) async {
    await secureStorage.write(key: key, value: value);
  }

  Future<String?> readData(String key) async {
    String? value = await secureStorage.read(key: key);
    return value;
  }

  deleteData(String key) async {
    await secureStorage.delete(key: key);
  }

  //convert ve map truoc khi goi ham
  Future<bool> saveJson(String key, Map<String, dynamic> data) async {
    bool result = false;
    try {
      //convert data to string
      String sdata = json.encode(data);
      await writeData(key, sdata);

      //check if data can be restore to origin data type
      //Map<String, dynamic> testData = json.decode(sdata);
      result = true;
      return result;
    } on Exception catch (e) {
      rethrow;
    }
  }

  //
  Future<Map<String, dynamic>?> readJson(String key) async {
    String? sdata = await secureStorage.read(key: key);
    if (sdata != null) {
      return json.decode(sdata) as Map<String, dynamic>;
    } else {
      return null;
    }
  }
}
