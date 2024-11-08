import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qachecklist_login/api/models/question_model.dart';

class QACheckListNotifier extends StateNotifier<List<QuestionGroupItem>>{
  QACheckListNotifier():super([]);
  
  void qaCLProviderfunction(QuestionGroupItem questionGroup)
  {
    bool isExistItem=state.contains(questionGroup);

    if (isExistItem)
    {
      //loai tru item ra khoi danh sach state
        state=state.where((m)=>m.id!=questionGroup.id).toList();
    }
    else
    {
      //neu kg co ghep vao = cach lay full danh sach , item
      state=[...state,questionGroup];
    }
  }
} 

final qaChecklistProvider=
StateNotifierProvider<QACheckListNotifier,List<QuestionGroupItem>>((ref){
  return QACheckListNotifier();
});