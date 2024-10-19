

// class UserInfo {
//   String id;
//   String userName;
//   String fullName;
//   String emailAddress;
//   List<String> roles;
//   List<ObjectRight> objectRights;
//   int managerID;
//   String managerEmail;
//   List<int>? storeIDs;
//   String loginID = DateTime.now().toString();
//   //String loginDate: "2024-10-17T14:25:23.4890155+07:00"
//   String loginDate = DateTime.now().toString();

//   //default constructor
//   UserInfo(
//       {required this.id,
//       required this.userName,
//       required this.fullName,
//       required this.emailAddress,
//       required this.roles,
//       required this.objectRights,
      
//       required this.loginDate,
//       required this.loginID,
//       required this.managerEmail,
//       required this.managerID,
//       required this.storeIDs});

//   ///
//   ///constructor from json giup chuyen hoa kq tu BE General Object ve business object
//   ///
//   factory UserInfo.fromJson(Map<String, dynamic> json) {
//     List<ObjectRight> objectRights = [];

//     json['objectRights'].forEach((v) {
//       ObjectRight objectRight = ObjectRight.fromJson(v as Map<String, dynamic>);
//       objectRights.add(objectRight);
//     });

//     List<String> roleList = List<String>.from(json['roles'] as List);
//     //List<String> roleList = (json['rights']as List).map((item) => item as String).toList();

//     List<int>? storeIDs =
//         json['storeIDs'] == '' ? [] : List<int>.from(json['storeIDs'] as List);

//     return UserInfo(
//         id: json["id"] ?? -1,
//         userName: json['userName'] ?? "",
//         fullName: json['fullName'] ?? "",
//         emailAddress: json['emailAddress'] ?? "",
//         roles: roleList,
//         objectRights: objectRights,
//         //ObjectRights.fromJson(json['objectRights'] as Map<String,dynamic>),
        
//         loginDate: json['loginDate'] ?? "",
//         loginID: json['loginID'] ?? "",
//         managerEmail: json['managerEmail'] ?? "",
//         managerID: json['managerID'] ?? -1,
//         storeIDs: storeIDs);
//   }

//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'userName': userName,
//       'fullName': fullName,
//       'emailAddress': emailAddress,
//       //'roles': roles.toString(),
//       //'objectRights': objectRights.toString(),
      
//       'loginDate': loginDate,
//       'managerEmail': managerEmail,
//       'managerID': managerID,
//       //'storeIDs': storeIDs,
//     };
//   }
// }

import 'dart:convert';

class ObjectRight {
  ObjectRight({required this.objectName, required this.rights});

  String objectName;
  List<String> rights;

  factory ObjectRight.fromJson(Map<String, dynamic> json) {
    if (json['rights'] == '') {
      throw Exception('object right is null');
    }
    List<String> rightlist =
        (json['rights'] as List).map((item) => item as String).toList();
    //List<String> categoriesList = List<String>.from(map['categories'] as List);

    return ObjectRight(objectName: json['objectName'], rights: rightlist);
  }
  
  Map<String, dynamic>  toJson()
  {
    return {
        'objectName':objectName,
        'rights':jsonEncode(rights)
    };
  }
}
