
import 'package:qachecklist_login/services/constants.dart';


abstract class BaseApiResponse {
  BaseApiResponse({required this.ok, required this.message});

  bool ok ; //flag de biet status la error or success
  String message ;//= "api is not response"; //dung de thong bao error or info

  void fromJson(Map<String, dynamic> json);
}
abstract class BaseApiRequest {
  int companyID = ApiConstants.companyID;
  int appID = ApiConstants.appID;
  Object toJson();
  // Object fromJson(Map<String, dynamic> json);
}
class ApiRequestResult {
  //properties
  bool ok;
  String message;
  int numOfRow;
  dynamic content;

  //constructor

  ApiRequestResult({
    required this.ok,
    required this.message,
    required this.numOfRow,
    required this.content,
  });

  ///
  ///method constructor biến 1 json thành object
  ///
  factory ApiRequestResult.fromJson(Map<String, dynamic> json) => ApiRequestResult(
      ok: json["ok"] ?? false,
      message: json["message"] ?? "",
      numOfRow: json["numOfRow"] ?? -1,
      content: json["content"] );
}