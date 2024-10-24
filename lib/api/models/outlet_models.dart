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
        companyCode = json['CompanyCode'];
        sortProperty = json['SortProperty'];
        sortOrder = json['sortOrder'];
        searchText = json['SearchText'];
        pageIndex = json['PageIndex'];
        pageSize = json['PageSize'];
        cityID = json['CityID'];
        districtID = json['DistrictID'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['CompanyCode'] = companyCode;
        data['SortProperty'] = sortProperty;
        data['sortOrder'] = sortOrder;
        data['SearchText'] = searchText;
        data['PageIndex'] = pageIndex;
        data['PageSize'] = pageSize;
        data['CityID'] = cityID;
        data['DistrictID'] = districtID;
        return data;
    }
}

