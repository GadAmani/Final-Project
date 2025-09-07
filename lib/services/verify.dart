import 'dart:convert';
import 'package:dating_app/utilities/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:dating_app/models/user.dart'; // Contains UserLogin & LoginResponse

class VerifyAuthProvider extends ChangeNotifier {
  bool loading = false;
  String errorMessage = "";
  static const _kTokenKey = 'auth_token';
  static const _kUserKey = 'auth_user_json';

  final _storage = const FlutterSecureStorage();

  bool _bootstrapping = true;
  UserLogin? _user;
  String? _token;

  bool get isBootstrapping => _bootstrapping;
  UserLogin? get user => _user;
  String? get token => _token;
  bool get isLoggedIn => _user != null && _token != null;

  void setLoadingState(bool value) {
    loading = value;
    notifyListeners();
  }

  /// Login method using API
  Future<void> login(String emailVal, String passwordVal) async {
    errorMessage = "";
    setLoadingState(true);

    try {
      final uri = Uri.parse('${constants.AppConst.apiBase}/login');
      final res = await http.post(
        uri,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'login': emailVal, 'password': passwordVal}),
      );

      if (res.statusCode != 200) {
        String msg = 'Login failed';
        try {
          msg = jsonDecode(res.body)['message']?.toString() ?? msg;
        } catch (_) {}
        throw Exception(msg);
      }

      final parsed = LoginResponse.fromJson(jsonDecode(res.body));
      await setSession(token: parsed.token, user: parsed.user);
    } catch (error) {
      errorMessage = error.toString().replaceFirst("Exception: ", "");
      print("Login error: $error");
    } finally {
      setLoadingState(false);
    }
  }

  /// Save token & user to storage
  Future<void> setSession({
    required String token,
    required UserLogin user,
  }) async {
    _token = token;
    _user = user;
    await _storage.write(key: _kTokenKey, value: token);
    await _storage.write(
      key: _kUserKey,
      value: jsonEncode(user.toJson()),
    );
    notifyListeners();
  }

  /// Auto-login method when app restarts
  Future<void> bootstrap() async {
    _bootstrapping = true;
    notifyListeners();

    final savedToken = await _storage.read(key: _kTokenKey);
    final savedUserJson = await _storage.read(key: _kUserKey);

    if (savedToken != null && savedUserJson != null) {
      _token = savedToken;
      _user = UserLogin.fromJson(jsonDecode(savedUserJson));
    }

    _bootstrapping = false;
    notifyListeners();
  }

  /// Logout method
  Future<void> logout() async {
    _token = null;
    _user = null;
    await _storage.delete(key: _kTokenKey);
    await _storage.delete(key: _kUserKey);
    notifyListeners();
  }
}
