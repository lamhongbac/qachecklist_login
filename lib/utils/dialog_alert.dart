import 'package:flutter/material.dart';
import 'package:qachecklist_login/views/qa_checklist_report.dart';

showAlertDialog(BuildContext context, String title, String message) {

  // set up the button
  Widget okButton = TextButton(
    child: Text("OK"),
    onPressed: () { },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text(title),
    content: Text(message),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

Future<void> _showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: const SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: (){
              Navigator.of(context).pop('Approve');
            },
          ),
        ],
      );
    },
  );
}
class ShowDialog extends StatefulWidget {
  const ShowDialog({super.key, required this.title, required this.message});
  final String title;
  final String message;
  @override
  State<ShowDialog> createState() => _ShowDialogState();
}

class _ShowDialogState extends State<ShowDialog> {
  

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
          title:  Text(widget.title),
          content:  Text(widget.message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) =>const QACheckListReport())),
              child: const Text('OK'),
            ),
          ],
        );
  }
}