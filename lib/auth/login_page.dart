import 'package:dating_app/services/auth_service.dart';
import 'package:dating_app/services/token_service.dart' hide TokenService;
import 'package:flutter/material.dart';
import '../widgets/app_button.dart';
import '../widgets/app_input.dart';

const Color mainColor = Color(0xFFFFCFEF);
const Color black = Color(0xFF000000);

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passwordCtrl = TextEditingController();
  bool loading = false;

  void _login() async {
    FocusScope.of(context).unfocus(); // dismiss keyboard

    final email = emailCtrl.text.trim();
    final password = passwordCtrl.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter email and password')),
      );
      return;
    }

    setState(() => loading = true);

    final result = await AuthService().login(email, password);

    setState(() => loading = false);

    if (result.containsKey('token')) {
      // save token
      await TokenService.saveToken(result['token']);

      // navigate to home
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // show error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(result['error'] ?? 'Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // match SignupPage background
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparent appbar
        elevation: 0, // remove shadow
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: black),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            } else {
              Navigator.pushReplacementNamed(context, '/onboarding/3');
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.favorite, color: mainColor, size: 80), // match SignupPage
            const SizedBox(height: 30),
            Text(
              "Login",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 20),
            AppInput(controller: emailCtrl, hint: "Email"),
            const SizedBox(height: 15),
            AppInput(controller: passwordCtrl, hint: "Password", obscureText: true),
            const SizedBox(height: 20),
            AppButton(
              label: "Login",
              loading: loading,
              onPressed: loading ? null : _login,
              icon: Icons.login,
            ),
          ],
        ),
      ),
    );
  }
}
