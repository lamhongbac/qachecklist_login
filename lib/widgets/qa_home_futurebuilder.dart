//qa_home danh cho QA officer home
//rest_home danh cho Rest Home
//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qachecklist_login/api/models/general_models.dart';
import 'package:qachecklist_login/datas/master_datas.dart';
import 'package:qachecklist_login/models/outlets.dart';
import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/services/outlet_services.dart';
import 'package:qachecklist_login/utils/dialog_alert.dart';
import 'package:qachecklist_login/views/login_screen.dart';
import 'package:qachecklist_login/widgets/helpers.dart';
import 'package:qachecklist_login/widgets/outlet_wg.dart';
//import 'package:qachecklist_login/widgets/outlet_wg.dart';

class QAOfficerHomeFutureBuilder extends ConsumerStatefulWidget {
  QAOfficerHomeFutureBuilder({super.key});

  @override
  ConsumerState<QAOfficerHomeFutureBuilder> createState() =>
      _QAOfficerHomeFutureBuilderState();
}

class _QAOfficerHomeFutureBuilderState
    extends ConsumerState<QAOfficerHomeFutureBuilder> {
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
    void addCheck()
    {
      showSingleAlertDialog(context,'Check...','outletName');
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('QA Officer Build the future'),
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
        body: FutureBuilder(
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                  height: 100,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ListView.builder(
                      itemCount: outlets.length,
                      itemBuilder: (context, index) {
                        return OutletItem(outletItem:outlets[index]) ;
                      }));
            } else {
              return const Center(child: Text('No outlet found...'));
            }
          },
          future: getOutlets(),
        ));
  }
}
