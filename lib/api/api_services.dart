import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:qachecklist_login/api/constants.dart';
import 'package:qachecklist_login/api/models/account_models.dart';
import 'package:qachecklist_login/api/models/general_models.dart';

///
/// response: la response  tu api request
/// apiResponse: body cua response (bo data object)
/// loginResponse: la content cua apiResponse 
/// JwtData: la 1 thuoc tinh ben trong login response
///
class ApiService {
  ///
  ///
  ///
  Future<ApiRequestResult> generalRequest(String requestUrl, BaseApiRequest request) async {
    //
    var url = Uri.parse(requestUrl);
    ApiRequestResult boDataProcessResult;
    //
    try {
      //response la ket qua tra ve  tu 1 api request 
      final response = await http.post(url,
          headers: {
            "Accept": "application/json",
            "content-type": "application/json"
          },
          body: request.toJson());

      //co the viet lai doan code nay them vao cac case error code khac nhau tra ve message khac nhau
      if (response.statusCode == 200 || response.statusCode == 400) {        
        //apiResponse: body cua api response
        boDataProcessResult = ApiRequestResult.fromJson(
          jsonDecode(response.body ) as Map<String, dynamic>);
        //ok...          
        return boDataProcessResult;
      } else {
        throw Exception('Request api has error code: ${response.statusCode}');
      }
    } catch (exception) {      
      throw Exception(exception);
    }
  }

  ///
  ///01.Api Login
  ///BE: kiem tra va ghi nhan current login
  ///BE: can có bảng ghi nhận ve thong tin login
  ///LoginResponse: ket qua của login
  ///co the  la thanh cong hay that bai
  ///
  Future<LoginResponse> login(LoginRequest request) async {
    LoginResponse loginResponse= LoginResponse(
            loginResult:null,
            ok: false, 
            message: 'undefined message');

    String loginUrl = ApiConstants.mobLoginRequestUrl;
    try {
      await generalRequest(loginUrl, request).then((boDataProcessResult) {
        
        loginResponse.message=boDataProcessResult.message;
        loginResponse.ok=boDataProcessResult.ok;

        if (boDataProcessResult.ok) {         
          Map<String,dynamic> jcontent= boDataProcessResult.content as Map<String,dynamic> ;      
          LoginResult loginResult=LoginResult.fromJson(jcontent) ;
          //Map<String,dynamic> json_objectRights=loginResult.objectRights as Map<String,dynamic> ;      
          //List<ObjectRight> objectRights=ObjectRights.fromJson(json_objectRights);

          loginResponse.loginResult=loginResult;          
        } 
       
      });      
      
    } catch (e) 
    {
      throw Exception(e);
    }
    
    // return LoginResponse(
    //     jwtData:JwtData(accessToken: "", refreshToken: ""),
    //     ok: false, 
    //     loginDate:DateTime.now().toString(),
    //     message: 'general error message');
    
    return loginResponse;
    
  }
  //==> end login
  ///02.Api Logout
  ///BE: kiem tra va ghi nhan logout
  ///

  ///03. IsLogin?
  /// Kiem tra Device+User tren BE va ghi nhan device is login or Not
}
