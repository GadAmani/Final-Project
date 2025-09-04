import 'package:flutter/material.dart';
import 'package:dating_app/services/token_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final Color mainColor = Color(0xFFFFCFEF);
final Color black = Color(0xFF000000);

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _checkAuth();
  }

  Future<void> _checkAuth() async {
    await Future.delayed(const Duration(seconds: 2)); // splash delay

    // Read token and onboarding flag
    String? token = await TokenService.getToken();
    final prefs = await SharedPreferences.getInstance();
    bool seenOnboarding = prefs.getBool("onboarding_seen") ?? false;

    if (!mounted) return;

    if (!seenOnboarding) {
      // ✅ First time → show onboarding
      Navigator.pushReplacementNamed(context, '/onboarding/1');
    } else if (token != null && token.isNotEmpty) {
      // ✅ Already logged in → go home
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      // ✅ Seen onboarding but no token → go to login/signup choice
      Navigator.pushReplacementNamed(context, '/auth-choice');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            mainColor,
            black,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          const Align(
            alignment: Alignment.center,
            child: Icon(Icons.favorite, color: Colors.white, size: 90),
          ),
          const Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 80),
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
