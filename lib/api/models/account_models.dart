import 'dart:convert';
import 'package:qachecklist_login/api/models/general_models.dart';

///
///Class chua thong tin login request
///keep login co the chua lam den
///
class LoginRequest extends BaseApiRequest {
  bool keepLogined;
  String userType;
  String userName;
  String password;

  LoginRequest(
      {required this.keepLogined,
      required this.userType,
      required this.userName,
      required this.password});

  ///
  ///hàm to Json convert object to Json , giup cho viec goi api
  ///
  @override
  Object toJson() {
    return json.encode({
      'appID': appID, 
      'companyID': companyID,
      'keepLogined': keepLogined,
      'userType': userType.trim(),
      'userName': userName.trim(),
      'password': password.trim(),
    });
  }
  
}

///
///Class chua thong tin KQ login tra ve tu BE
///
///
class LoginResponse extends BaseApiResponse {
  JwtData jwtData;  
  String loginDate;

  //default constructor
  LoginResponse({ 
      required this.jwtData,
      required this.loginDate,            
      required super.ok, required super.message});

  ///
  ///constructor from json giup chuyen hoa kq tu BE General Object ve business object
  ///
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        loginDate: json["loginDate"] ?? "",
        jwtData: json["jwtData"] ,        
        ok: json["ok"] ?? false,
        message: json["message"] ?? "");
  }

  //jwtData = jsonDecode(json["jwtData"])
  @override
  fromJson(Map<String, dynamic> json) {
    loginDate = json["loginDate"] ?? "";
    jwtData = json["jwtData"] ;    
    ok = json["ok"] ?? false;
    message = json["message"] ?? "";
  }
}

///
///
class JwtData
{
  JwtData({
    required this.accessToken, 
    required this.refreshToken
  });

  String accessToken;
  String refreshToken;
  factory JwtData.fromJson(Map<String, dynamic> json) => 
  JwtData(
      accessToken: json["accessToken"] ?? "",
      refreshToken: json["refreshToken"] ?? "");    
}
///
///
class LoginResult {

  dynamic jwtData;  
  String loginDate=DateTime.now().toString();

  //default constructor
  LoginResult({ 
      required this.jwtData,
      required this.loginDate,      
      });
      

  ///
  ///constructor from json giup chuyen hoa kq tu BE General Object ve business object
  ///
  factory LoginResult.fromJson(Map<String, dynamic> json) {             
    return LoginResult(
        loginDate: json["loginDate"] ?? "",
        jwtData: json["jwtData"]                 
    );
  }
}

class MobLoginResult {
  int id;
  String userName;
  String fullName;
  String emailAddress;
  List<String> roles;
  //List<ObjectRight> objectRights
  List<ObjectRight> objectRights;
  String loginDate=DateTime.now().toString();

  //default constructor
  MobLoginResult({ required this.id,
  required this.userName,
  required this.fullName,
  required this.emailAddress,
  required this.roles,
  //List<ObjectRight> objectRights
 required this.objectRights,
  required this.loginDate
      });
      

  ///
  ///constructor from json giup chuyen hoa kq tu BE General Object ve business object
  ///
  factory MobLoginResult.fromJson(Map<String, dynamic> json) {

    return MobLoginResult(
        id: json["id"] ?? -1,
        userName: json["userName"] ?? "",
        fullName: json["fullName"] ?? "",
        emailAddress: json["emailAddress"] ?? "",
        roles: json["roles"] ?? [],        
        objectRights: json["objectRights"] ?? [],
        loginDate: json["loginDate"] ?? DateTime.now().toString()        
    );
    
  }
}
class ObjectRights
{
  ObjectRights({required this.rights});
  List<ObjectRight> rights=[];
}  
  
// mô tả tập right trên 1 object
class ObjectRight
{
 ObjectRight({ required this.objectName, required this.rights});

  String objectName;
  List<String> rights;
}