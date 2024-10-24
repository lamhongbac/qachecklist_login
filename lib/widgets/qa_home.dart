//qa_home danh cho QA officer home
//rest_home danh cho Rest Home
import 'package:flutter/material.dart';
import 'package:qachecklist_login/api/models/general_models.dart';
import 'package:qachecklist_login/models/outlets.dart';

import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/services/outlet_services.dart';
import 'package:qachecklist_login/views/login_screen.dart';

class QAOfficerHome extends StatefulWidget {
  const QAOfficerHome({super.key});
  //List<OutletModel> outlets;

  @override
  State<QAOfficerHome> createState() => _QAOfficerHomeState();
}

class _QAOfficerHomeState extends State<QAOfficerHome> {

  Future<List<OutletModel>?> getOutlets() async {
    OutletServices outletServices = OutletServices();
    if (AuthService.userInfo!=null) {
      String userID = AuthService.userInfo!.userName;
      ApiRequestResult apiRequestResult =await outletServices.getOutlets(userID);
      if (apiRequestResult.ok) {
        setState(() {
          //widget.outlets=apiRequestResult.content;
        });
        

      } else {
        //info
      }
      return null;
    }
  }

  signOut(BuildContext context) async {
    AuthService authService = AuthService();
    await authService.logout();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (contex) => const LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QA Officer Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'logout of App',
            onPressed: () {
              // handle the press
              signOut(context);
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getOutlets();
        },
        child: Icon(Icons.logout_rounded),
        backgroundColor: Colors.green,
      ),
      body: const Center(child: Text('Home screen')),
    );
  }
}
