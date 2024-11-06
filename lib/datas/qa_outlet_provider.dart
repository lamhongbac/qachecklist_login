import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qachecklist_login/models/outlets.dart';


///cach dung
/// In consummer : khai bao final qaOutletProvider=ref.watch(QAOutletNotifier)
/// 
class QAOutletNotifier extends StateNotifier<List<OutletModel>>
{
  QAOutletNotifier():super([]);
  void toggleOutlet(OutletModel outlet) 
  {
    final containOutlet=state.contains(outlet);
    if (containOutlet){
      state=state.where((o)=>o.id==outlet.id).toList();
    }
    else{
      state=[...state,outlet];
    }
  }
}


final qaOutletProvider = StateNotifierProvider<QAOutletNotifier,List<OutletModel>>((ref) {
  return QAOutletNotifier();

});