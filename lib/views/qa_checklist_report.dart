import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QACheckListReport extends StatefulWidget {
  const QACheckListReport({super.key});

  @override
  State<QACheckListReport> createState() => _QACheckListReportState();
}

class _QACheckListReportState extends State<QACheckListReport> {
  @override
  Widget build(BuildContext context) {
    return  Container(
       child: Column(children: [
         Text('QA Checklist report',
          style: Theme.of(context).textTheme.titleLarge),
        const SizedBox(height: 30,),
        Expanded(
            child: SizedBox(
              height: 100,
              child: Center(
                child: Text(
                  'QA Checklist report',
                 style: Theme.of(context).textTheme.bodyMedium
                ),
              ),
             
             
            ),
          ),

        ]),
    );
  }
} 