//qa_home danh cho QA officer home
//rest_home danh cho Rest Home
//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:qachecklist_login/datas/master_datas.dart';

import 'package:qachecklist_login/services/auth_services.dart';

import 'package:qachecklist_login/views/login_screen.dart';

//import 'package:qachecklist_login/widgets/outlet_wg.dart';

class QAOfficerHomeProvider extends ConsumerStatefulWidget  {
  const QAOfficerHomeProvider({super.key});

  @override
  ConsumerState<QAOfficerHomeProvider> createState() => _QAOfficerHomeProviderState();
  
}

class _QAOfficerHomeProviderState extends ConsumerState<QAOfficerHomeProvider> {
  
  

  

  signOut(BuildContext context) async {
    AuthService authService = AuthService();
    await authService.logout();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (contex) => const LoginScreen()));
  }

  @override
  void initState() {    
    super.initState();
    //getOutlets();
  }
  @override
  Widget build(BuildContext context) {
   final outlets=ref.watch(outletProvider);

    Widget? activeWg;
    if (outlets.length==0)
    {
        activeWg=const Center(
            child: Text('No outlet found...'));
    }
    else
    {
        activeWg=Container(
              height: 100,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child:ListView.builder(
                itemCount: outlets.length,
                itemBuilder: (context, index) 
                {return Text(outlets[index].name!);} ));
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('QA Officer Home Screen  apply Data provider'),
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
          //getOutlets();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.logout_rounded),
       
      ),
      body: activeWg
        



     
      );
    
  }
}
