
import 'package:dating_app/Authentification/Authentification.dart';
import 'package:dating_app/splash/splashApp.dart';
import 'package:flutter/material.dart';
const Color mainColor = Color(0xFFFFCFEF);
const Color black = Color(0xFF000000);
Widget _buildSettingItem(IconData icon, String title, BuildContext context) {
  return ListTile(
    leading: Icon(icon, color: mainColor),
    title: Text(title),
    trailing: Icon(Icons.arrow_forward_ios, size: 16),
    onTap: () async {
      if (title == "Logout") {
        // Clear stored auth tokens if needed

        // Navigate to Splash / Login page
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const SplashPage()),
          (route) => false,
        );
      }
    },
  );
}

