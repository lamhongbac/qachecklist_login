import 'package:qachecklist_login/api/api_services.dart';
import 'package:qachecklist_login/api/models/account_models.dart';
import 'package:qachecklist_login/utils/secure_data.dart';

class AuthService {
  //
  //use api to check if email is logined?
  //
  bool isLogin()  {
    String isLogin="";
     SecureData.readData("islogin").then((data){
        isLogin=data;
    });
    return isLogin=="true";
  }

  //
  //
  //
  Future<LoginResponse> login(String userName, String password) async {
    LoginResponse loginResponse=    LoginResponse(
         loginResult:null,
         ok: false,
         message: "api unknown error");

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
          SecureData.writeData("isLogin", "true");
        }
      });
    } on Exception catch (e) {
      
      throw Exception(e);
    }

    return loginResponse;
    
  }
}