///
/// chua cac constants lien quan den api
/// 
/// 
class ApiConstants {
  static const appID = 3;
  static const companyID = 3;
  static const companyCode = "INDINING";
  static const isLogin="isLogin";

  static const String loginRequestUrl =
    'http://203.113.174.190:8004/api/Account/Login';
  static const String outletRequestUrl =    
    "http://203.113.174.190:8004/api/Outlet/GetOutletsByPage";

    static const String mobLoginRequestUrl=
    'http://203.113.174.190:8004/api/app/MobileAccount/MobLogin';
    
}
class AppConstants{
  
  static const userInfo='userInfo';

  static const appTitle="Login Function Demo";
  static const isLogin="isLogin";
}