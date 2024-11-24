import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qachecklist_login/datas/master_datas.dart';
import 'package:qachecklist_login/models/outlets.dart';
import 'package:qachecklist_login/services/auth_services.dart';
//import 'package:qachecklist_login/services/general.dart';
//import 'package:qachecklist_login/api/models/account_models.dart';
//import 'package:qachecklist_login/views/home_screen.dart';
import 'package:qachecklist_login/views/login_screen.dart';
import 'package:qachecklist_login/views/splash.dart';
import 'package:qachecklist_login/widgets/helpers.dart';
//import 'package:qachecklist_login/widgets/qa_home.dart';
//import 'package:qachecklist_login/widgets/rest_home.dart';

//import 'package:qa_checklist_mobile/views/commons/tab_screen.dart';

/// ===>
/// Buoc nay app se thuc hien cac viec sau
/// 1 load Data from Backend
/// 2 load splash screen trong thoi gian load data from BE
/// 3 sau khi load xong kiem tra tinh trang login
/// 4 Load login screen or Home screen
/// <====

class AppInit extends ConsumerStatefulWidget {
  const AppInit({super.key});

  @override
  ConsumerState<AppInit> createState() => _AppInitState();
}

class _AppInitState extends ConsumerState<AppInit> {
   List<OutletModel> outlets = [];

  Future<List<OutletModel>> getOutlets() async {
    outlets = ref.watch(outletProvider);

    if (outlets.isEmpty) {
      if (AuthService.userInfo != null) {
        String userID = AuthService.userInfo!.userName;
        MasterDataService masterDataService = MasterDataService();
        await masterDataService.getMasterData(userID);
      }
    }
    outlets = ref.watch(outletProvider);
    return outlets;
  }
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
    return FutureBuilder(
      builder:(context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
                    return SplashScreen();}
                    else
                    {
                      return activeScreen!; 
                    }

      },
      future: getOutlets(),

    );
  }
}
