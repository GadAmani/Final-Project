import 'dart:ui';
import 'package:dating_app/HomePage/homePage.dart';
import 'package:flutter/material.dart';

final Color mainColor = Color(0xFFFFCFEF);
final Color black = Color(0xFF000000);

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [mainColor, black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Card with image
              Expanded(
                flex: 6,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Stack(
                      children: [
                        // Image fills the card
                        Positioned.fill(
                          child: Image.asset(
                            'assets/images/onboarding_screen_4.jpg',
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),

                        // Badge example
                        Positioned(
                          top: 20,
                          left: 20,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Dog Lover",
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Spacer(flex: 1),

              // Text description
              Text(
                "Discover new connections and start your journey now!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 30),

              // Get Started button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Homepage(),
                                ),
                              );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: black,
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}
