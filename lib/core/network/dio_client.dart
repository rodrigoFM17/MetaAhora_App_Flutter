
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:meta_ahora/share/model/api_response.dart';

class DioClient {

  static final DioClient _instance = DioClient._internal();

  late final Dio dio;

  DioClient._internal() {

    dio = Dio(BaseOptions(
      baseUrl: "http://192.168.100.34:3000",
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        "Content-Type": "application/json"
      })
    );

    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true
    ));
  }

  static Future<APIResponse<T>?> get<T> ({
    required String path,
    required T Function(dynamic json) fromJsonT
  }) async {
    try {
      final res = await _instance.dio.get(path);

      final json = jsonDecode(jsonEncode(res.data));
      final apiRes = APIResponse.fromJson(
        json, 
        fromJsonT
      );

      return apiRes;
    } catch(e) {
      print("error en el post de dio: $e");
      return null;
    }
  }

  static Future<APIResponse<T>?> post<T>({
    required String path, 
    required Map<String, dynamic> body,
    required T Function(dynamic json) fromJsonT
  }) async {
    try {
      final res = await _instance.dio.post(
        path,
        data: body
      );

      final json = jsonDecode(jsonEncode(res.data));
      final apiRes = APIResponse.fromJson(
        json, 
        fromJsonT
      );

      return apiRes;
    } catch(e) {
      print("error en el post de dio: $e");
      return null;
    }
  }
}