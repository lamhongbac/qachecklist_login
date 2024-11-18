import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qachecklist_login/datas/master_datas.dart';
import 'package:qachecklist_login/models/outlets.dart';
import 'package:qachecklist_login/services/auth_services.dart';
import 'package:qachecklist_login/views/qa_checklist_report.dart';
import 'package:qachecklist_login/widgets/outlet_filter.dart';
import 'package:qachecklist_login/widgets/outlet_item.dart';

class QaCheck extends ConsumerStatefulWidget {
  const QaCheck({super.key});

  @override
  ConsumerState<QaCheck> createState() => _QaCheckState();
}

class _QaCheckState extends ConsumerState<QaCheck> {
  List<OutletModel> outlets = [];
  void filterOutlet(String text)
    {


    }
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
   void qaChecklistReport(OutletModel item) {
      Navigator.of(context).pop();

      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const QACheckListReport()));
    }
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            OutletFilterForm(searchText: filterOutlet  ),
            
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
        );
  }
}