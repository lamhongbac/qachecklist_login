import 'package:flutter/material.dart';
import 'package:qachecklist_login/api/auth_services.dart';
//import 'package:qachecklist_login/api/models/account_models.dart';
import 'package:qachecklist_login/views/auth_check.dart';
import 'package:qachecklist_login/views/home_screen.dart';
import 'package:qachecklist_login/views/login_screen.dart';


void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();

  AuthService authService=AuthService();

  await authService.isLogin().then((result){
    AuthService.haveLogin=result;
    //get user Info....
    //AuthService.userInfo=null;

  });


  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QA CheckList Login Demo',
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthCheck(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}

