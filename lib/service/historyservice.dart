part of '../ui/pages/pages.dart';

class HistoryServices {
  static String endpoint = Constanta.baseApiUrl + "/history/readabsen.php";

  static Future<ApiResponse> getHistory(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
