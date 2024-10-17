import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureData {
  static FlutterSecureStorage secureStorage=const FlutterSecureStorage();
 static writeData(String key, String value) async
  {
    await secureStorage.write(key: key, value: value);

  }
 static Future<String> readData(String key ) async
  {
    String value=  await secureStorage.read(key: key)??'NoData';
    return value;
    
  }
  static deleteData(String key) async
  {
    await secureStorage.delete(key: key);
    
  }
}