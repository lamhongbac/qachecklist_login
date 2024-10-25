/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
import 'package:qachecklist_login/api/models/general_models.dart';

class OutletRequestModel  {
    String? companyCode;
    String? sortProperty;
    String? sortOrder;
    String? searchText;
    int? pageIndex;
    String? pageSize;
    int? cityID;
    int? districtID;

    OutletRequestModel({this.companyCode, this.sortProperty, this.sortOrder, this.searchText, this.pageIndex, this.pageSize, this.cityID, this.districtID}); 

    OutletRequestModel.fromJson(Map<String, dynamic> json) {
        companyCode = json['companyCode'];
        sortProperty = json['sortProperty'];
        sortOrder = json['sortOrder'];
        searchText = json['searchText'];
        pageIndex = json['pageIndex'];
        pageSize = json['pageSize'];
        cityID = json['cityID'];
        districtID = json['districtID'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['companyCode'] = companyCode;
        data['sortProperty'] = sortProperty;
        data['sortOrder'] = sortOrder;
        data['searchText'] = searchText;
        data['pageIndex'] = pageIndex;
        data['pageSize'] = pageSize;
        data['cityID'] = cityID;
        data['districtID'] = districtID;
        return data;
    }
}

