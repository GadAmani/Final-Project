import 'dart:ui';

import 'package:dating_app/onboarding%20screens/onboardingScreen2.dart';
import 'package:flutter/material.dart';

final Color mainColor = Color(0xFFFFCFEF);
final Color black = Color(0xFF000000);

class Onboardingscreen1 extends StatelessWidget {
  const Onboardingscreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_screen_1.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content
          Column(
            mainAxisAlignment: MainAxisAlignment.end, // Push to bottom
            children: [
              // Title text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'MAKE \n',
                  style: const TextStyle(
                    color: Color(0xFFFFCFEF),
                    fontSize: 60,
                    fontWeight: FontWeight.w900,
                  ),
                  children: const [
                    TextSpan(
                      text: 'THE FIRST\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: 'MOVE',
                    ),
                  ],
                ),
              ),

              // Icon + label
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite, color: mainColor, size: 32),
                    const SizedBox(width: 15),
                    Text(
                      "enchante",
                      style: TextStyle(
                        color: mainColor,
                        decoration: TextDecoration.none,
                        fontSize: 24,
                        fontFamily: 'Proximanova',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),

              // NEXT button
              Padding(
  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
  child: Align(
    alignment: Alignment.centerRight, // Align to left edge
    child: ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () {
                      Navigator.pushReplacementNamed(context, '/onboarding/2'); // ✅ use named route
                    },
      child: const Text(
        "Next",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ),
)
],
          ),
        ],
      ),
    );
  }
}

// Example of the next onboarding screen
