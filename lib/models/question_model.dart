// phan biet : danh sach cau hoi
// chung dung de build 1 check list, va cho ra doi 1 checklist report
// ex: ta co cau hoi Q="khu vuc khach hang co sach se?"
// cau hoi do se dan den 1 data CL, co cac thanh phan Question, Ketqua, Hinh anh, notes,..vv


class CLQuestionItem {
  CLQuestionItem({required this.id, required this.itemText, required this.points});

  final int id;
  final String itemText;
  final int points;
}

// danh sach question=> load tu CLSD tuong ung
//dung de build checkList
class QuestionGroupItem {
  QuestionGroupItem({required this.questionGroupId,required this.id, required this.itemText, required this.questions});
  final int questionGroupId;
  final int id;
  final String itemText;
  List<CLQuestionItem> questions ;
}

enum CheckResut { passed, notPassed, NA }

class CheckListReport {
  CheckListReport({required this.checklistItems});
  List<CheckListReportQuestion> checklistItems = [];
}

//
//khi build giao dien se can cu vao cau truc DL question va subQuestion de build len Checklist Report
// Day la 1 CheckList trong ds cac checklist cua CheckListReport
//
class CheckListReportQuestion {
  CheckListReportQuestion(
      {required this.id,
      required this.questionItems,
      required this.questionText});
  final int id;
  final String questionText;
  final List<CheckListReportQuestionItem> questionItems;
}

class CheckListReportQuestionItem {
  CheckListReportQuestionItem(
      {required this.checkListReportQuestionId,
      required this.checkListItemText,
      required this.result});
  int checkListReportQuestionId; //lien ket den parent

  final String checkListItemText;
  CheckResut result;
  //String? image: co the to chuc roi ra: image, notes,..vv
}
