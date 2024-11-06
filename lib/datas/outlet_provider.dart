import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qachecklist_login/datas/master_datas.dart';

final outletProvider=Provider((ref){
  return MasterDataService.outletdatas;
});