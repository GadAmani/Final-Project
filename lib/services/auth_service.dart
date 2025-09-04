import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TokenService {
  static const String _tokenKey = "auth_token";

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }
}

class AuthService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: "http://127.0.0.1:8000/api", // Flutter Web on Windows: localhost is fine
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {
        "Content-Type": "application/json",
        "Accept": "application/json",
      },
    ),
  );

  // LOGIN
  Future<Map<String, dynamic>> login(String login, String password) async {
    try {
      final response = await _dio.post(
        "/login",
        data: {
          "login": login, // Can be email or phone
          "password": password,
        },
      );

      if (response.data['token'] != null) {
        await TokenService.saveToken(response.data['token']);
      }

      return {"success": true, "data": response.data};
    } on DioException catch (e) {
      String errorMessage = "Login did not occur";

      if (e.response?.data != null) {
        if (e.response!.data is Map && e.response!.data['error'] != null) {
          errorMessage = e.response!.data['error'];
        } else {
          errorMessage = e.response!.data.toString();
        }
      } else {
        errorMessage = e.message ?? "Unknown error"; // ✅ fixed nullable issue
      }

      return {"success": false, "error": errorMessage};
    }
  }

  // SIGNUP / REGISTER
  Future<Map<String, dynamic>> signup({
    required String name,
    String? email,
    String? phone,
    required String password,
  }) async {
    try {
      final response = await _dio.post(
        "/register", // Laravel route
        data: {
          "name": name,
          "email": email,
          "phone": phone,
          "password": password,
        },
      );

      if (response.data['token'] != null) {
        await TokenService.saveToken(response.data['token']);
      }

      return {"success": true, "data": response.data};
    } on DioException catch (e) {
      String errorMessage = "Signup failed";

      if (e.response?.data != null) {
        if (e.response!.data is Map && e.response!.data['error'] != null) {
          errorMessage = e.response!.data['error'];
        } else {
          errorMessage = e.response!.data.toString();
        }
      } else {
        errorMessage = e.message ?? "Unknown error"; // ✅ fixed nullable issue
      }

      return {"success": false, "error": errorMessage};
    }
  }

  // LOGOUT
  Future<void> logout() async {
    await TokenService.clearToken();
    // Optional: call backend /logout to invalidate JWT
  }
}
