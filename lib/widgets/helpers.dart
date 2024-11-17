
import 'package:flutter/material.dart';
import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/views/home_screen.dart';
import 'package:qachecklist_login/widgets/qa_home_dialog.dart';
//import 'package:qachecklist_login/widgets/qa_home.dart';
import 'package:qachecklist_login/widgets/qa_home_futurebuilder.dart';
import 'package:qachecklist_login/widgets/qa_home_provider.dart';
import 'package:qachecklist_login/widgets/rest_home.dart';

Widget addVerticalSpace(double height) {
  return SizedBox(
    height: height,
  );
}

Widget addHorizontalSpace(double width) {
  return SizedBox(
    width: width,
  );
}
//show info
void showInfoMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
//show warning: can viet lai ham nay
void showWarningMessage(String message, BuildContext context) {
  ScaffoldMessenger.of(context).clearSnackBars();
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
}
Widget getHomeScreen() {
  // return SizedBox(
  //   width: width,
  // );

      Widget activeScreen=const HomeScreen();

      if(AuthService.isQaOfficer())
      {
        activeScreen =  QAOfficerHomeDialog();
      }
      else{
        if(AuthService.isRestaurantManager())
        {
          activeScreen = const RestaurantHome();
        }
      }
    
    return activeScreen;
}