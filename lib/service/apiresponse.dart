part of '../ui/pages/pages.dart';

ApiResponse apiResponseFromJson(String str) {
  var apiResponse = ApiResponse.fromJson(json.decode(str));
  return apiResponse;
}

String apiResponseToJson(ApiResponse data) => json.encode(data.toJson());

class ApiResponse {
  ApiResponse({
    this.success,
    this.code,
    this.message,
    this.content,
  });

  bool success;
  int code;
  String message;
  dynamic content;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        success: json["success"],
        code: json["code"],
        message: json["message"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "code": code,
        "message": message,
        "content": content,
      };
}
