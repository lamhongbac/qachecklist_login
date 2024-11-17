import 'package:flutter/material.dart';
import 'package:qachecklist_login/models/outlets.dart';
import 'package:qachecklist_login/widgets/outlet_wg.dart';

class CheckListReportItem extends StatelessWidget {
  const CheckListReportItem({super.key, required this.outletItem, required this.onCheckOutlet});

  final OutletModel outletItem;
  final Function(OutletModel item) onCheckOutlet;
  @override
  Widget build(BuildContext context) {
    String createdDate=outletItem.createdOn??'16 Nov 2024';
    String outletName=outletItem.name?? 'No name';
    return Row(children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            width: 250,
                            child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start ,
                              children: [
                                Text(outletName),
                                Text(createdDate)
                              ],
                            )),

                          OutlinedButton(
                              child: Text('+'),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (context) => AlertDialog(
                                        title: Text("QA Checking..."),
                                          content: Text("Checking on restaurant:  "+outletName!),
                                          actions: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(
                                                      context, 'Cancel');
                                                },
                                                child: Column(children: [
                                                  Icon(Icons.cancel),
                                                  Text("Cancel")
                                                ])),
                                            ElevatedButton(
                                                onPressed: ()
                                                {
                                                  onCheckOutlet(outletItem);
                                                  }, 
                                                child: Column(children: [
                                                  Icon(Icons.approval),
                                                  Text("OK")
                                                ]))
                                          ],
                                        ));
                              }),
                        ]);
  }
}