import 'package:flutter/material.dart';
import 'package:qachecklist_login/api/auth_services.dart';
import 'package:qachecklist_login/views/home_screen.dart';
import 'package:qachecklist_login/views/login_screen.dart';

//import 'package:qa_checklist_mobile/views/commons/tab_screen.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    Widget? activeScreen;
    AuthService sqlAuthService = AuthService();

    if (sqlAuthService.isLogin()) {
      activeScreen = const HomeScreen();
    } else {
      activeScreen = const LoginScreen();
    }
    return activeScreen;
  }
}
