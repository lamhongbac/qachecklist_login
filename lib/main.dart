import 'package:flutter/material.dart';
import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/services/app_constants.dart';
import 'package:qachecklist_login/services/outlet_services.dart';
//import 'package:qachecklist_login/api/models/account_models.dart';
import 'package:qachecklist_login/views/auth_check.dart';
import 'package:qachecklist_login/views/home_screen.dart';
import 'package:qachecklist_login/views/login_screen.dart';
import 'package:qachecklist_login/widgets/qa_home.dart';
import 'package:qachecklist_login/widgets/rest_home.dart';


void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  OutletServices outletService=OutletServices();
  AuthService authService=AuthService();
  await authService.logout();
  await authService.getLocalUserInfo();
  //await outletService.getLocalData();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: ThemeData(
     
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AuthCheck(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/qa_home': (context) => const QAOfficerHome(),
        '/rest_home': (context) => const RestaurantHome(),
      },
    );
  }
}

