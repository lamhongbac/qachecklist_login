import 'package:flutter/material.dart';
import 'package:qachecklist_login/services/user_data_types.dart';
import 'package:qachecklist_login/views/qa_check.dart';
import 'package:qachecklist_login/views/qa_checklist_report.dart';
import 'package:qachecklist_login/views/qa_review.dart';
import 'package:qachecklist_login/views/settings.dart';
import 'package:qachecklist_login/widgets/app_drawer.dart';
import 'package:qachecklist_login/views/qa_home_dialog.dart';

class QAOfficerWorkspace extends StatefulWidget {
  const QAOfficerWorkspace({super.key});

  @override
  State<QAOfficerWorkspace> createState() => _QAOfficerWorkspaceState();
}

class _QAOfficerWorkspaceState extends State<QAOfficerWorkspace> {
  int _selectPageIndex = 0;
  Widget activePage = QAOfficerHomeDialog();
  String _title = "QA Checklist report";

  @override
  Widget build(BuildContext context) {
    if (_selectPageIndex == 0) {
      activePage = const QAOfficerHomeDialog();
      _title = "QA Checklist report";
    }
    if (_selectPageIndex == 1) {
      activePage = const ReviewCheckList();
      _title = "Review Action Plan";
    }

    void selectPage(int index) {
      setState(() {
        _selectPageIndex = index;
      });
    }

    void selectFunction(appFunctions function) {
      Navigator.of(context).pop();

      switch (function) {
        case appFunctions.settings:
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>const Settings()));
          //do st
          break;
        case appFunctions.reports:
          //do st: open workspace with index=0
          break;
        case appFunctions.dashboard:
          //do st
          break;
        case appFunctions.reviewActionPlan:
          //do st: open workspace with index=1
          break;
        case appFunctions.reviewResult:
          //do st
          break;
        case appFunctions.checklistReport:
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=>const QACheckListReport()));
          break;
      }
    }

    //
    return Scaffold(
      appBar: AppBar(
        title: Text(_title),
      ),
      body: activePage,
      drawer: MainDrawer(onSelectedFunction: selectFunction),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectPageIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.check), label: 'CheckList Report'),
          BottomNavigationBarItem(
              icon: Icon(Icons.reviews), label: 'Review Action Plan'),
        ],
        onTap: (currentIndex) {
          selectPage(currentIndex);
        },
      ),
    );
  }
}
