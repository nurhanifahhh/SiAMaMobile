part of '../ui/pages/pages.dart';

class CourseServices {
  static String endpoint = Constanta.baseApiUrl + "/Course/auth.php";
  static String endpoint2 = Constanta.baseApiUrl + "/Course/insert.php";
  static String endpoint3 = Constanta.baseApiUrl + "/Course/update.php";
  static String endpoint4 = Constanta.baseApiUrl + "/Course/delete.php";
  static String endpoint5 = Constanta.baseApiUrl + "/Course/read.php";
  static String endpoint6 = Constanta.baseApiUrl + "/Course/readcourse.php";

  static Future<ApiResponse> authentication(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
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

  static Future<ApiResponse> getCourse(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint5, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }

  static Future<ApiResponse> getAllCourse(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint6, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
