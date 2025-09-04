import 'package:dating_app/Authentification/ui/signup/signup_email_page.dart';
import 'package:dating_app/Authentification/ui/signup/signup_phone_page.dart';
import 'package:flutter/material.dart';

const Color mainColor = Color(0xFFFFCFEF);
const Color black = Color(0xFF000000);

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // match LoginPage background
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparent appbar
        elevation: 0, // no shadow
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // App title or logo
            const Icon(Icons.favorite, color: mainColor, size: 80),
            const SizedBox(height: 30),

            // Signup with Email
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: mainColor,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.email, color: Colors.white),
                label: const Text(
                  "Sign up with Email",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupEmailPage()),
                  );
                },
              ),
            ),
            const SizedBox(height: 15),

            // Signup with Phone
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.phone, color: Colors.white),
                label: const Text(
                  "Sign up with Phone",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignupPhonePage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
