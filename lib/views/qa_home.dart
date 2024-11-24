//qa_home danh cho QA officer home
//rest_home danh cho Rest Home
//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:qachecklist_login/models/general_models.dart';
import 'package:qachecklist_login/models/outlets.dart';

import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/services/outlet_services.dart';
import 'package:qachecklist_login/views/login_screen.dart';
import 'package:qachecklist_login/widgets/helpers.dart';
//import 'package:qachecklist_login/widgets/outlet_wg.dart';

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

          //print(outlets.length);

        });
      } else {
        //info
        
         showInfoMessage('no outlet find',context);

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
  void initState() {    
    super.initState();
    getOutlets();
  }
  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
        title: const Text('QA Officer Home Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout_rounded),
            tooltip: 'Logout...',
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
        backgroundColor: Colors.green,
        child: const Icon(Icons.logout_rounded),
       
      ),
      body: FutureBuilder(builder: (context, snapshot)  {
        if (snapshot.connectionState == ConnectionState.done) 
        {
          return Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child:ListView.builder(
                itemCount: outlets.length,
                itemBuilder: (context, index) 
                {return Text(outlets[index].name!);} ));
        }
        else
        {
          return const Center(
            child: Text('No outlet found...'));
        }



      },future: getOutlets(),)
      );
    
  }
}