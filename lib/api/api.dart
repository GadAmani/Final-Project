import 'package:dio/dio.dart';

class DioClient {
  static Dio dio = Dio(
    BaseOptions(
      baseUrl: "http://127.0.0.1:8000/api", // Your Laravel backend
      connectTimeout: const Duration(seconds: 5),  // ✅ fixed
      receiveTimeout: const Duration(seconds: 3),  // ✅ fixed
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );
}
