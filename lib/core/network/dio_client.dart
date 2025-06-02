
import 'package:dio/dio.dart';

class DioClient {

  static final DioClient _instance = DioClient._internal();

  late final Dio dio;

  DioClient._internal() {

    dio = Dio(BaseOptions(
      baseUrl: "http://192.168.100.93:3000",
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

  static DioClient get instance => _instance;
}