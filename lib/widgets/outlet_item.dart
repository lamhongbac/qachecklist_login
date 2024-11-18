import 'package:flutter/material.dart';
import 'package:qachecklist_login/models/outlets.dart';
import 'package:qachecklist_login/widgets/outlet_wg.dart';

class CheckListReportItem extends StatelessWidget {
  const CheckListReportItem(
      {super.key, required this.outletItem, required this.onCheckOutlet});

  final OutletModel outletItem;
  final Function(OutletModel item) onCheckOutlet;
  @override
  Widget build(BuildContext context) {
    String createdDate = outletItem.createdOn ?? '16 Nov 2024';
    String outletName = outletItem.name ?? 'No name';
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: Row(children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [Text(outletName), Text(createdDate)],
          ),
        )),
        SizedBox(
          width: 80,
          child: OutlinedButton(
              child: Text('+'),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: Text(
                              "Checking $outletName!"),
                          content: SizedBox(
                            height: 100,
                            child: Form(
                              
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        hintText: 'Enter a staff name :',
                                      ),
                                      // The validator receives the text that the user has entered.
                                      // and return error message
                                      //
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Please enter some text';
                                        }

                                        return null;
                                      },
                                    ),
                                  ),
                                  
                                  
                                ],
                              ),
                            ),
                          ),
                          actions: [
                            
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context, 'Cancel');
                                },
                                child: Column(children: [
                                  Icon(Icons.cancel),
                                  Text("Cancel")
                                ])),
                                SizedBox(width: 30,),
                            ElevatedButton(
                                onPressed: () {
                                  onCheckOutlet(outletItem);
                                },
                                child: Column(children: [
                                  Icon(Icons.start),
                                  Text("Start")
                                ]))
                          ],
                        ));
              }),
        ),
      ]),
    );
  }
}
