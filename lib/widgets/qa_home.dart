//qa_home danh cho QA officer home
//rest_home danh cho Rest Home
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qachecklist_login/api/models/general_models.dart';
import 'package:qachecklist_login/models/outlets.dart';

import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/services/outlet_services.dart';
import 'package:qachecklist_login/views/login_screen.dart';
import 'package:qachecklist_login/widgets/outlet_wg.dart';

class QAOfficerHome extends StatefulWidget {
  QAOfficerHome({super.key});

  @override
  State<QAOfficerHome> createState() => _QAOfficerHomeState();
}

class _QAOfficerHomeState extends State<QAOfficerHome> {
  List<OutletModel> outlets = [];
  getOutlets() async {
    OutletServices outletServices = OutletServices();
    if (AuthService.userInfo != null) {
      String userID = AuthService.userInfo!.userName;
      ApiRequestResult apiRequestResult =await outletServices.getOutlets(userID);

      if (apiRequestResult.ok) {
        setState(() {
          List<dynamic> lists=apiRequestResult.content;
          lists.forEach((e) => outlets.add(OutletModel.fromJson((e))));

          print(outlets.length);

        });
      } else {
        //info
         print('no outlet find');

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
    Widget? activeWg;
    if (outlets.isEmpty) {
      activeWg =  Container(
        child:const Text('No outlet'),
      );
    } else {
      activeWg = ListView.builder(
        itemCount: outlets.length,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            padding: const EdgeInsets.symmetric(vertical: 10),
            child:Text(outlets[index].name!) );
        },
      );
    }
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
      body: activeWg
      );
    
  }
}
