import 'package:flutter/material.dart';
import 'package:qachecklist_login/models/outlets.dart';

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
        builder: (BuildContext context) => AlertDialog(
          title: const Text('AlertDialog Title'),
          content: const Text('AlertDialog description'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'OK'),
              child: const Text('OK'),
            ),
          ],
        ),
      ),
      child: const Text('Show Dialog'),
    )      ]
        //Text(outlets[index].name!)
        ),
        );
  }
}