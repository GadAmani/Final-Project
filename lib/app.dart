// import 'package:dating_app/Authentification/Authentification.dart';
import 'package:dating_app/landingPage/HomePage/homePage.dart';
import 'package:dating_app/onboarding%20screens/getstarted.dart';
import 'package:dating_app/onboarding%20screens/onboardingScreen1.dart';
import 'package:dating_app/onboarding%20screens/onboardingScreen2.dart';

import 'package:dating_app/splash/splashApp.dart';
// import 'package:dating_app/splash/splashApp.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      
      home: Homepage(),
    );
  }
}
