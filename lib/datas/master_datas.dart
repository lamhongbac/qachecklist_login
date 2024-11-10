import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qachecklist_login/api/models/general_models.dart';
import 'package:qachecklist_login/models/outlets.dart';
import 'package:qachecklist_login/services/outlet_services.dart';

///noi chua master data cua ung dung
///Data se dc cap nhat tu BE thong qua
///init app
///synchronization
class MasterDataService {
  static List<OutletModel> outletdatas = [];

  //
  //qachecklist master data
  //
  Future<bool> getMasterData(String userID) async {
    OutletServices outletServices = OutletServices();
    bool OK=false;
    ApiRequestResult apiRequestResult = await outletServices.getOutlets(userID);
    OK=apiRequestResult.ok;
    if (OK) {
      outletdatas.clear();
      List<dynamic> lists = apiRequestResult.content;
      lists.forEach((e) => outletdatas.add(OutletModel.fromJson((e))));
    }
    return OK;
  }
}
final outletProvider=Provider((ref){
  return MasterDataService.outletdatas;
});
