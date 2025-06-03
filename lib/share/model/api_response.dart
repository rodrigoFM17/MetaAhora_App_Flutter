
class APIResponse<T> {

  final String message;
  final T? data;
  final bool success;

  APIResponse({
    required this.message,
    required this.data,
    required this.success
  });

  factory APIResponse.fromJson(Map<String, dynamic> json, T Function(dynamic json) fromJsonT) {
    return APIResponse(
      message: json["message"], 
      data: json["data"] != null ? fromJsonT(json["data"]) : null, 
      success: json['success']
    );
  }


}