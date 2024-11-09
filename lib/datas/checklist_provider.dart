import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qachecklist_login/api/models/question_model.dart';

///
/// doi tuong state dai dien cho danh sach hien tai
/// NGuyen tac la kg modify tren state, ma phai tao state moi= state cu +- them item
/// ...state: là all item in state
class QACheckListNotifier extends StateNotifier<List<QuestionGroupItem>>{
  QACheckListNotifier():super([]);
  
  void toogleQuestionGroupItem(QuestionGroupItem questionGroupItem)
  {
    bool isExistItem=state.contains(questionGroupItem);

    if (isExistItem)
    {
      //loai tru item ra khoi danh sach state
        state=state.where((m)=>m.id!=questionGroupItem.id).toList();
    }
    else
    {
      //neu kg co ghep questionGroup vao = cach lay full danh sach , item
      state=[...state,questionGroupItem];
    }
  }
} 

final qaChecklistProvider=
StateNotifierProvider<QACheckListNotifier,List<QuestionGroupItem>>((ref){
  return QACheckListNotifier();
});