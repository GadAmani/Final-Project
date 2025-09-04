import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:kawi_go/models/user_test.dart';
import 'package:provider/provider.dart';

import 'package:kawi_go/utilities/constants/constants.dart' as constants;

class VerifyAuthProvider extends ChangeNotifier {
  bool loading = false;
  bool showSnackBar = false;
  String errorMessage = "";
  static const _kTokenKey = 'auth_token';
  static const _kUserKey = 'auth_user_json';

  final _storage = const FlutterSecureStorage();

  bool _bootstrapping = true;
  UserLoginClass? _user;
  String? _token;

  bool get isBootstrapping => _bootstrapping;
  UserLoginClass? get user => _user;
  String? get token => _token;
  bool get isLoggedIn => _user != null && _token != null;

void setLoadingState(bool value){
loading = value;
    notifyListeners();
}
 Future<void> login(String emailVal, String passwordVal) async {
  errorMessage = "";
  setLoadingState(true);
  print("===> email : $emailVal");
  print("===> pass: $passwordVal");

  try {
    final uri = Uri.parse('${constants.AppConst.apiBase}/login');
print("===== $uri");
    final res = await http.post(
      uri,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'login': emailVal, 'password': passwordVal}),
    );
    print("=====>>>> RES: $res");

    if (res.statusCode != 200) {
      String msg = 'Login failed';
      try {
        msg = jsonDecode(res.body)['message']?.toString() ?? msg;
    print("=====>>>> MSG: $msg");
      } catch (_) {}
      throw Exception(msg);
    }

    final parsed = UserLogin.fromJson(jsonDecode(res.body));
    if (parsed.user == null || parsed.token == null) {
      throw Exception('Invalid response from server.');
    }

    await setSession(token: parsed.token!, user: parsed.user!);
  } catch (error) {
    errorMessage = error.toString().replaceFirst("Exception: ", "");
     print("=====>>>> ERR: $error");
  } finally {
    setLoadingState(false);
  }
}

  Future<void> setSession({
    required String token,
    required UserLoginClass user,
  }) async {
    _token = token;
    _user = user;
    await _storage.write(key: _kTokenKey, value: token);
    await _storage.write(
      key: _kUserKey,
      value: jsonEncode({
        'id': user.id,
        'name': user.name,
        'email': user.email,
        'role': user.role,
        'status': user.status,
        'phone': user.phone,
        'address': user.address,
        'image': user.image,
        'created_at': user.createdAt?.toIso8601String(),
        'updated_at': user.updatedAt?.toIso8601String(),
      }),
    );
    notifyListeners();
  }