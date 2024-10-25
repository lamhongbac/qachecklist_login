/* 
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/ 
class OutletModel {
    int? id;
    String? number;
    String? name;
    String? description;
    int? branchId;
    int? brandId;
    int? regionId;
    int? cityId;
    int? districtId;
    String? address;
    String? email;
    String? tel;
    String? website;
    String? tags;
    String? nps;
    String? latitude;
    String? longitude;
    String? openTime;
    String? closeTime;
    String? parking;
    String? picture;
    String? merchantId;
    String? floorId;
    String? categoryId;
    String? isActive;
    String? images;
    String? about;
    String? icon;
    String? priority;
    String? createdBy;
    String? createdOn;
    String? modifiedBy;
    String? modifiedOn;
    bool? isDeleted;
    bool? isFranchise;
    String? enDescription;
    String? enAddress;
    String? enName;
    int? groupId;

    OutletModel({this.id, this.number, this.name, this.description, this.branchId, this.brandId, this.regionId, this.cityId, this.districtId, this.address, this.email, this.tel, this.website, this.tags, this.nps, this.latitude, this.longitude, this.openTime, this.closeTime, this.parking, this.picture, this.merchantId, this.floorId, this.categoryId, this.isActive, this.images, this.about, this.icon, this.priority, this.createdBy, this.createdOn, this.modifiedBy, this.modifiedOn, this.isDeleted, this.isFranchise, this.enDescription, this.enAddress, this.enName, this.groupId}); 

    OutletModel.fromJson(Map<String, dynamic> json) {
        id = json['id'];
        number = json['number'];
        name = json['name'];
        description = json['description'];
        branchId = json['branchId'];
        brandId = json['brandId'];
        regionId = json['regionId'];
        cityId = json['cityId'];
        districtId = json['districtId'];
        address = json['address'];
        email = json['email'];
        tel = json['tel'];
        website = json['website'];
        tags = json['tags'];
        nps = json['nps'];
        latitude = json['latitude'];
        longitude = json['longitude'];
        openTime = json['openTime'];
        closeTime = json['closeTime'];
        parking = json['parking'];
        picture = json['picture'];
        merchantId = json['merchantId'];
        floorId = json['floorId'];
        categoryId = json['categoryId'];
        isActive = json['isActive'];
        images = json['images'];
        about = json['about'];
        icon = json['icon'];
        priority = json['priority'];
        createdBy = json['createdBy'];
        createdOn = json['createdOn'];
        modifiedBy = json['modifiedBy'];
        modifiedOn = json['modifiedOn'];
        isDeleted = json['isDeleted'];
        isFranchise = json['isFranchise'];
        enDescription = json['enDescription'];
        enAddress = json['enAddress'];
        enName = json['enName'];
        groupId = json['groupId'];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> data = Map<String, dynamic>();
        data['id'] = id;
        data['number'] = number;
        data['name'] = name;
        data['description'] = description;
        data['branchId'] = branchId;
        data['brandId'] = brandId;
        data['regionId'] = regionId;
        data['cityId'] = cityId;
        data['districtId'] = districtId;
        data['address'] = address;
        data['email'] = email;
        data['tel'] = tel;
        data['website'] = website;
        data['tags'] = tags;
        data['nps'] = nps;
        data['latitude'] = latitude;
        data['longitude'] = longitude;
        data['openTime'] = openTime;
        data['closeTime'] = closeTime;
        data['parking'] = parking;
        data['picture'] = picture;
        data['merchantId'] = merchantId;
        data['floorId'] = floorId;
        data['categoryId'] = categoryId;
        data['isActive'] = isActive;
        data['images'] = images;
        data['about'] = about;
        data['icon'] = icon;
        data['priority'] = priority;
        data['createdBy'] = createdBy;
        data['createdOn'] = createdOn;
        data['modifiedBy'] = modifiedBy;
        data['modifiedOn'] = modifiedOn;
        data['isDeleted'] = isDeleted;
        data['isFranchise'] = isFranchise;
        data['enDescription'] = enDescription;
        data['enAddress'] = enAddress;
        data['enName'] = enName;
        data['groupId'] = groupId;
        return data;
    }
}

