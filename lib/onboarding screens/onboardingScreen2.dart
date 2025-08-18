import 'package:dating_app/onboarding%20screens/onboardingScreen1.dart';
import 'package:dating_app/onboarding%20screens/onboardingScreen3.dart';
import 'package:flutter/material.dart';

final Color mainColor = Color(0xFFFFCFEF);
final Color black = Color(0xFF000000);

class Onboardingscreen2 extends StatelessWidget {
  const Onboardingscreen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onboarding_screen_2.jpg',
              fit: BoxFit.cover,
            ),
          ),

          // Foreground content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Push to bottom
            children: [
              SizedBox(width: 0),
              // Title text
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'IT STARTS ',
                  style: const TextStyle(
                    color: Color(0xFFFFCFEF),
                    fontSize: 45,
                    fontWeight: FontWeight.w900,
                  ),
                  children: const [
                    TextSpan(
                      text: 'WITH\n',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(text: 'A SWIPE'),
                  ],
                ),
              ),

              // Icon + label
              Container(
                margin: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Row(
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
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 30,
                      ),
                      child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Onboardingscreen1(),
                                ),
                              );
                            },
                            child: const Text(
                              "Previous",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        
                          // Align to left edge
                          ElevatedButton(
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const OnboardingScreen(),
                                ),
                              );
                            },
                            child: const Text(
                              "Next",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // NEXT button
            ],
          ),
        ],
      ),
    );
  }
}
