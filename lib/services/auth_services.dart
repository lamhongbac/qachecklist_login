//import 'dart:convert';

import 'package:qachecklist_login/api/api_services.dart';
import 'package:qachecklist_login/api/models/account_models.dart';
import 'package:qachecklist_login/api/models/general_models.dart';
import 'package:qachecklist_login/services/constants.dart';
import 'package:qachecklist_login/services/user_data_types.dart';
//import 'package:qachecklist_login/models/userinfo.dart';
import 'package:qachecklist_login/utils/secure_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static bool haveLogin = false;
  static LoginResult? userInfo;

  SecureData secureData = SecureData();
  //kiem tra xem user hien tai co phai la QA officer role
  static bool isQaOfficer() {
    return true;
  }

  //kiem tra xem user co phai la restaurant manager role
  static bool isRestaurantManager() {
    return false;
  }

  ///
  ///login = save
  ///logout=delete
  ///
  logout() async {
    if (await secureData.readData(AppConstants.userInfo) != null) {
      await secureData.deleteData(AppConstants.userInfo);
    }
  }

  ///
  // use api to check if email is logined?
  /// check if user is login or not
  ///
  Future<bool> isLogin() async {
    AuthService.userInfo = await getLocalUserInfo();
    return AuthService.userInfo != null;
  }

  ///
  ///get user info
  ///
  Future<LoginResult?> getLocalUserInfo() async {
    Map<String, dynamic>? userInfoJson =
        await secureData.readJson(AppConstants.userInfo);
    if (userInfoJson != null) {
      AuthService.userInfo = LoginResult.fromJson(userInfoJson);
      return AuthService.userInfo;
    } else {
      return null;
    }
  }

  ///
  ///save login result to local
  ///
  saveLocalUserInfo(LoginResult loginResult) async {
    final prefs = await SharedPreferences.getInstance();
    //save userInfo
    await secureData.saveJson(AppConstants.userInfo, loginResult.toJson());
    prefs.setBool(AppConstants.isLogin, true);

    //checking...prefs.getBool('isLogin')
  }

  //
  // kiem tra BE login, if OK save to local
  // also save to AuthService.userInfo
  //
  Future<ApiRequestResult> login(String userName, String password) async {
    ApiRequestResult loginResponse = ApiRequestResult(
        content: null,
        ok: false,
        numOfRow: -1,
        message: "error:  not reach api server");

    LoginRequest loginRequest = LoginRequest(
        keepLogined: false,
        userType: appUserType.UserID.toString(),
        userName: userName,
        password: password);

    ApiService apiService = ApiService();

    try {
      await apiService.login(loginRequest).then((result) {
        loginResponse = result;
        if (loginResponse.ok) {
          //save local
          saveLocalUserInfo(loginResponse.content);
          //save to service for loop check
          AuthService.userInfo = loginResponse.content;
        }
      });
    } on Exception catch (e) {
      throw Exception(e);
    }

    return loginResponse;
  }
}
