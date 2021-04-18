// part of 'serviceapi.dart';
part of '../ui/pages/pages.dart';

class BaseApiService {
  static Future<ApiResponse> sendPostRequest(
      String url, String authToken, var requestBody) async {
    final response = await http.post(url,
        body: requestBody, headers: {"content-type": "application/json"});
    if (response.statusCode == 200) {
      final String responseString = response.body;
      return apiResponseFromJson(responseString);
    } else {
      return null;
    }
  }
}
