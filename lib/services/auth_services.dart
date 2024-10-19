//import 'dart:convert';

import 'package:qachecklist_login/api/api_services.dart';
import 'package:qachecklist_login/api/models/account_models.dart';
import 'package:qachecklist_login/api/models/general_models.dart';
import 'package:qachecklist_login/models/userinfo.dart';
import 'package:qachecklist_login/utils/secure_data.dart';

class AuthService {
  
  static bool haveLogin=false;
  static UserInfo? userInfo;

  SecureData secureData=SecureData();
  static bool IsQAOfficer()
  {
    return true;
  }
  static bool IsRestaurantManager()
  {
    return false;
  }
  logout()
  {
    secureData.deleteData("isLogin");
    secureData.deleteData("loginInfo");
    
  }
  //
  //use api to check if email is logined?
  //
  Future<bool> isLogin() async {
    String isLogin= await secureData.readData("isLogin");
    if(isLogin=="true")
    {
      AuthService.haveLogin=true;
      AuthService.userInfo=await getLocalUserInfo();
    }
    return isLogin=="true";
  }
  Future<UserInfo> getLocalUserInfo() async
  {
    Map<String,dynamic> userInfoJson=await secureData.readJson("userInfo");
    return UserInfo.fromJson(userInfoJson);
  }
   saveLocalUserInfo(LoginResult loginResult)
  {
    Map<String,dynamic> userInfoJson={

    };
    secureData.saveJson("userInfo", userInfoJson);
  }
  //
  //
  //
  Future<ApiRequestResult> login(String userName, String password) async {
    ApiRequestResult loginResponse=    ApiRequestResult(
         content:null,
         ok: false,
         numOfRow: -1,         
         message: "error:  not reach api server");

    LoginRequest loginRequest = LoginRequest(
        keepLogined: false,
        userType: 'UserID',
        userName: userName,
        password: password);

    ApiService apiService = ApiService();

    try {
      await apiService.login(loginRequest).then((result) {
        loginResponse= result;
        if(loginResponse.ok)
        {
          Map<String,dynamic> loginData=
          (loginResponse.content as LoginResult).toJson() ;
          
          secureData.writeData("isLogin", "true");
          secureData.saveJson("loginInfo", loginData);
       
        }
      });
    } on Exception catch (e) {
      
      throw Exception(e);
    }

    return loginResponse;
    
  }
}