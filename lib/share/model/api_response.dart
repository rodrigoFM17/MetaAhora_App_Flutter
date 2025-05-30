
class APIResponse {

  final String message;
  final dynamic data;
  final bool success;

  APIResponse({
    required this.message,
    required this.data,
    required this.success
  });

  factory APIResponse.fromJson(Map<String, dynamic> json) {
    return APIResponse(
      message: json["message"], 
      data: json["data"], 
      success: json['success']
    );
  }


}