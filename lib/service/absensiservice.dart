part of '../ui/pages/pages.dart';

class AbsensiServices {
  static String endpoint = Constanta.baseApiUrl + "/AdminLogin/auth.php";
  static String endpoint2 = Constanta.baseApiUrl + "/AdminLogin/insert.php";
  static String endpoint3 = Constanta.baseApiUrl + "/AdminLogin/update.php";
  static String endpoint4 = Constanta.baseApiUrl + "/AdminLogin/delete.php";
  static String endpoint5 =
      Constanta.baseApiUrl + "/AdminLogin/resetpassword.php";
  static String endpoint6 =
      Constanta.baseApiUrl + "/AdminLogin/sendemailverification.php";
  static String endpoint7 = Constanta.baseApiUrl + "/AdminLogin/read.php";

  static Future<ApiResponse> authentication(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> getAdminLogin(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint7, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> insertData(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint2, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> updateData(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint3, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
