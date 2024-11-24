import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qachecklist_login/datas/master_datas.dart';
import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/services/app_constants.dart';
import 'package:qachecklist_login/theme/theme_constants.dart';
import 'package:qachecklist_login/theme/theme_manager.dart';
//import 'package:qachecklist_login/services/outlet_services.dart';
//import 'package:qachecklist_login/api/models/account_models.dart';
import 'package:qachecklist_login/views/appInit.dart';
import 'package:qachecklist_login/views/home_screen.dart';
import 'package:qachecklist_login/views/login_screen.dart';
import 'package:qachecklist_login/views/qa_home.dart';
import 'package:qachecklist_login/views/rest_home.dart';

bool masterDataReady=false;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AuthService authService = AuthService();
  await authService.getLocalUserInfo();
  if (AuthService.userInfo != null) {
    String userID = AuthService.userInfo!.userName;
    MasterDataService masterDataService = MasterDataService();
    masterDataReady = await masterDataService.getMasterData(userID);
  }
  registerErrorHandlers();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((fn) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

ThemeManager _themeManager=ThemeManager();
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 
  // day la cai cach lang nghe su thay doi trong ThemeManager.

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }
  
  //===>
  // day la cach phan ung lai su thay doi cua ThemeManager
  // thuc hien lai haàm build moi khi co thay doi
  //<===
  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appTitle,
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _themeManager.themeMode ,
      
      home: const AppInit(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
        '/qa_home': (context) => QAOfficerHome(),
        '/rest_home': (context) => const RestaurantHome(),
      },
    );
  }
}

void registerErrorHandlers() {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    debugPrint(details.toString());
  };
  // * Handle errors from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    debugPrint(error.toString());
    return true;
  };
  // * Show some error UI when any widget in the app fails to build
  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text('An error occurred'),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
