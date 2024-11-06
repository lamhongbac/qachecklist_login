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
  void getMasterData() async {
    OutletServices outletServices = OutletServices();

    ApiRequestResult apiRequestResult = await outletServices.getOutlets('all');

    if (apiRequestResult.ok) {
      outletdatas.clear();
      List<dynamic> lists = apiRequestResult.content;
      lists.forEach((e) => outletdatas.add(OutletModel.fromJson((e))));
    }
    
  }
}
