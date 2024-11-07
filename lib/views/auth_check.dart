import 'package:flutter/material.dart';
import 'package:qachecklist_login/services/auth_services.dart';
//import 'package:qachecklist_login/services/general.dart';
//import 'package:qachecklist_login/api/models/account_models.dart';
//import 'package:qachecklist_login/views/home_screen.dart';
import 'package:qachecklist_login/views/login_screen.dart';
import 'package:qachecklist_login/widgets/helpers.dart';
//import 'package:qachecklist_login/widgets/qa_home.dart';
//import 'package:qachecklist_login/widgets/rest_home.dart';

//import 'package:qa_checklist_mobile/views/commons/tab_screen.dart';



class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});
 
 


  @override
  Widget build(BuildContext context)   {

    Widget?  activeScreen;
    //AuthService sqlAuthService = AuthService();
    //bool isLogin =false;

    bool isLogin=  AuthService.userInfo!=null;

    if (isLogin) {
      //LoginResult userInfo=AuthService.userInfo!;
      //user_roles role=  user_roles.values.firstWhere((e) => e.toString() == 'user_roles.' + str);
      
      activeScreen= getHomeScreen();
      //default homescreen
      
    } else {
      activeScreen = const LoginScreen();
    }
    return activeScreen;
  }
}
