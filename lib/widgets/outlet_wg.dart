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
        TextButton(onPressed: (){}, child: const Icon(Icons.add))        ]
        //Text(outlets[index].name!)
        ),
        );
  }
}