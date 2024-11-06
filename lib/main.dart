import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  AuthService authService = AuthService();
  await authService.getLocalUserInfo();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((fn) {
    //OutletServices outletService=OutletServices();
    ////await authService.logout();
    //await outletService.getLocalData();
    const ProviderScope(
      child: MyApp()
    );
  });
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
        '/qa_home': (context) => QAOfficerHome(),
        '/rest_home': (context) => const RestaurantHome(),
      },
    );
  }
}
