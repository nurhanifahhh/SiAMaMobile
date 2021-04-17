import 'package:siamauji1/service/constanta.dart';
import 'package:siamauji1/service/apiresponse.dart';
import 'package:siamauji1/service/baseapiservices.dart';

class UserLoginServices {
  static String endpoint = Constanta.baseApiUrl + "/UserLogin/auth.php";

  static Future<ApiResponse> authentication(dynamic requestBody) async {
    ApiResponse apiResponse;
    await BaseApiService.sendPostRequest(endpoint, "", requestBody)
        .then((value) {
      apiResponse = value;
    });
    return apiResponse;
  }
}
