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
import 'package:qachecklist_login/views/qa_checklist_report.dart';
import 'package:qachecklist_login/widgets/helpers.dart';
import 'package:qachecklist_login/widgets/outlet_filter.dart';
import 'package:qachecklist_login/widgets/outlet_item.dart';
import 'package:qachecklist_login/widgets/outlet_wg.dart';
//import 'package:qachecklist_login/widgets/outlet_wg.dart';

class QAOfficerHomeDialog extends ConsumerStatefulWidget {
  QAOfficerHomeDialog({super.key});

  @override
  ConsumerState<QAOfficerHomeDialog> createState() =>
      _QAOfficerHomeDialogState();
}

class _QAOfficerHomeDialogState extends ConsumerState<QAOfficerHomeDialog> {
  List<OutletModel> outlets = [];

  // showMyAlertDialog(
  //     BuildContext context,
  //     String title,
  //     String message,
  //     String cancelButtonText,
  //     String okButtonText,
  //     Function okFunction,
  //     Function cancelFunction) {
  //   // set up the buttons
  //   Widget cancelButton = TextButton(
  //     child: Text(cancelButtonText),
  //     onPressed: () {},
  //   );
  //   Widget continueButton = TextButton(
  //     child: Text(okButtonText),
  //     onPressed: () {},
  //   );

  //   // set up the AlertDialog
  //   AlertDialog alert = AlertDialog(
  //     title: Text(title),
  //     content: Text(message),
  //     actions: [
  //       cancelButton,
  //       continueButton,
  //     ],
  //   );

  //   // show the dialog
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return alert;
  //     },
  //   );
  // }

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
    void addCheck() {
      showSingleAlertDialog(context, 'Check...', 'outletName');
    }

    void cancelFunction() {
      Navigator.pop(context, 'Cancel');
    }

    void qaChecklistReport(OutletModel item) {
      Navigator.of(context).pop();

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const QACheckListReport()));
    }

    
    return Scaffold(
        appBar: AppBar(
          title: const Text('QA Officer Workspace'),
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
        body: Column(
          children: [
            OutletFilterForm(),
            
            const SizedBox(height: 20,),
            
            Expanded(
              child: FutureBuilder(
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return ListView.builder(
                        itemCount: outlets.length,
                        itemBuilder: (context, index) {
                          return CheckListReportItem(
                              outletItem: outlets[index],
                              onCheckOutlet: qaChecklistReport);
                        });
                  } else {
                    return const Center(child: Text('No outlet found...'));
                  }
                },
                future: getOutlets(),
              ),
            ),
          ],
        ));
  }
}
