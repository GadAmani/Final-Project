import 'dart:convert';
import 'package:dating_app/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class LogoutService extends ChangeNotifier {
  bool loading = false;
  String errorMessage = "";
  static const _kTokenKey = 'auth_token';
  final _storage = const FlutterSecureStorage();

  void setLoadingState(bool value) {
    loading = value;
    notifyListeners();
  }

  /// Logout method calling backend API
  Future<void> logout() async {
    errorMessage = "";
    setLoadingState(true);

    try {
      final token = await _storage.read(key: _kTokenKey);
      if (token == null) {
        throw Exception("No token found. You are already logged out.");
      }

      final uri = Uri.parse('${constants.AppConst.apiBase}/logout');
      final res = await http.post(
        uri,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (res.statusCode != 200) {
        String msg = 'Logout failed';
        try {
          msg = jsonDecode(res.body)['message']?.toString() ?? msg;
        } catch (_) {}
        throw Exception(msg);
      }

      // Clear token from secure storage
      await _storage.delete(key: _kTokenKey);
      notifyListeners();
    } catch (error) {
      errorMessage = error.toString().replaceFirst("Exception: ", "");
      print("Logout error: $error");
    } finally {
      setLoadingState(false);
    }
  }
}
