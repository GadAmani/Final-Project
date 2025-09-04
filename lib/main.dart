import 'package:dating_app/onboarding%20screens/getstarted.dart';
import 'package:dating_app/onboarding%20screens/onboardingScreen2.dart';
import 'package:dating_app/splash/splashApp.dart';
import 'package:flutter/material.dart';
import 'package:dating_app/services/token_service.dart';

// Import your pages
import 'package:dating_app/auth/login_page.dart';
import 'package:dating_app/Authentification/ui/signup.dart';
import 'package:dating_app/landingPage/HomePage/homePage.dart';
import 'package:dating_app/onboarding%20screens/onboardingScreen1.dart';
import 'package:dating_app/Authentification/Authentification.dart';

const Color mainColor = Color(0xFFFFCFEF);
const Color black = Color(0xFF000000);
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // We don’t check token here anymore → SplashPage will handle it
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Dating App",
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      // ✅ Always start from Splash
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/onboarding/1': (context) => Onboardingscreen1(),
        '/onboarding/2': (context) => Onboardingscreen2(),
        '/onboarding/3': (context) => GetStarted(),

        '/auth-choice': (context) => const Authentification(), // page with SignIn / SignUp options
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const Homepage(),
      },
    );
  }
}
