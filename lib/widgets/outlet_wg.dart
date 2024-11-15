import 'package:flutter/material.dart';
import 'package:qachecklist_login/models/outlets.dart';
import 'package:qachecklist_login/utils/dialog_alert.dart';
import 'package:qachecklist_login/views/qa_checklist_report.dart';

class OutletItem extends StatelessWidget {
  const OutletItem({super.key, required this.outletItem});
  final OutletModel outletItem;
   
  @override
  Widget build(BuildContext context) {
    String outletName=outletItem.name?? 'Undefined Outlet name';

    return  Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
  
        children: [Text(outletName),
        TextButton(onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => ShowDialog(title: outletName,message: 'do you want to check?',)
      ),
      child: const Text('...Checking'),
    )      ]
        //Text(outlets[index].name!)
        ),
        );
  }
}