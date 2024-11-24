import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:qachecklist_login/api/api_services.dart';
import 'package:qachecklist_login/models/general_models.dart';
import 'package:qachecklist_login/models/outlet_models.dart';
import 'package:qachecklist_login/models/outlets.dart';
//import 'package:qachecklist_login/models/outlets.dart';
import 'package:qachecklist_login/services/app_constants.dart';
//import 'package:qachecklist_login/utils/local_file.dart';

class OutletServices {
  static List<OutletModel> outletDatas = [];
  //read json data to outletDatas
  getLocalData() async {
    String jsonString = await rootBundle.loadString("assets/quiz.json");
    final jsonResponse = jsonDecode(jsonString); //Map string, dynamic
    //Iterable l = json.decode(response.body);
    OutletServices.outletDatas = List<OutletModel>.from(
        jsonResponse.map((model) => OutletModel.fromJson(model)));
  }

  ///lay ve ds outlet can cu vao login userID
  Future<ApiRequestResult> getOutlets(String userID) async {
    ApiRequestResult outletResponse = ApiRequestResult(
        content: null,
        ok: false,
        numOfRow: -1,
        message: "error:  not reach api server");

    OutletRequestModel requestModel = OutletRequestModel.fromJson({
      'companyCode': AppConstants.companyCode,
      'sortProperty': AppConstants.sortProperty,
      'sortOrder': AppConstants.sortOrder,
      'searchText': AppConstants.searchText,
      'pageIndex': AppConstants.pageIndex,
      'pageSize': "100",
      'cityID': AppConstants.cityID,
      'districtID': AppConstants.districtID
    });
    ApiService apiService = ApiService();
    outletResponse = await apiService.getOutletRequest(requestModel);
    if (outletResponse.ok)
    {
      //LocalFileManager localFileManager=LocalFileManager();      
      //localFileManager.saveLocalFile(AppConstants.appSettingsFileName, jsonEncode(outletResponse.content), true);

    }
    return outletResponse;
  }
}
