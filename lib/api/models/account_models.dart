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
  LoginResult? loginResult;  
  

  //default constructor
  LoginResponse({ required this.loginResult,              
      required super.ok, required super.message});

  ///
  ///constructor from json giup chuyen hoa kq tu BE General Object ve business object
  ///
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
        loginResult: json["loginResult"] ?? "",          
        ok: json["ok"] ?? false,
        message: json["message"] ?? "");
  }

  //jwtData = jsonDecode(json["jwtData"])
  @override
  fromJson(Map<String, dynamic> json) {
    loginResult = json["loginResult"] ?? "";
       
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
  int id;
  String userName;
  String fullName;
  String emailAddress;
  List<String> roles;
  List<ObjectRight> objectRights;
  String appID;
  String companyID;
  String managerID;
  String managerEmail;
  List<int> ?storeIDs;
  String loginID =DateTime.now().toString();
  //String loginDate: "2024-10-17T14:25:23.4890155+07:00"
  String loginDate=DateTime.now().toString();

  //default constructor
  LoginResult({ 
      required this.id,
      required this.userName,
      required this.fullName,
      required this.emailAddress,
      required this.roles,
      required this.objectRights,    
      required this.appID,
      required this.companyID,
      required this.loginDate,
      required this.loginID,
      required this.managerEmail,
      required this.managerID,
      required this.storeIDs        
      });
      

  ///
  ///constructor from json giup chuyen hoa kq tu BE General Object ve business object
  ///
  factory LoginResult.fromJson(Map<String, dynamic> json) {   
    
    List<ObjectRight> objectRights=[];

    json['objectRights'].forEach((v){
      ObjectRight objectRight=  ObjectRight.fromJson(v as Map<String,dynamic>);
      objectRights.add(objectRight);
    });
              
    return LoginResult(
       id:json["id"]??-1,
       userName:json['userName']??"",
       fullName:json['fullName']??"",
       emailAddress:json['emailAddress']??"",
       roles:json['roles']??[],
       objectRights:objectRights,
       //ObjectRights.fromJson(json['objectRights'] as Map<String,dynamic>),    
       appID:json['appID']??-1,
       companyID:json['companyID']??-1,
       loginDate:json['loginDate']??"",
       loginID:json['loginID']??"",
       managerEmail:json['managerEmail']??"",
       managerID:json['managerID']??-1,
       storeIDs:json['storeIDs']??[]
                         
    );
  }
}
class ObjectRights
{
  ObjectRights({required this.rights});
  List<ObjectRight> rights=[];
  //fromJson()
factory ObjectRights.fromJson(Map<String, dynamic> json) {
    return ObjectRights(
        rights: json["rights"] ?? []          
    );
  }
}  
  
// mô tả tập right trên 1 object
class ObjectRight
{
 ObjectRight({ required this.objectName, required this.rights});

  String objectName;
  List<String> rights;
  
  factory  ObjectRight.fromJson(Map<String, dynamic> json) {
    Map<String,dynamic> _rights=json['rights'] as Map<String,dynamic>;
    
    //decode
    var obj_rights=_rights['rights'];

    return ObjectRight(objectName: json['objectName'],
    rights:obj_rights);
  }
}