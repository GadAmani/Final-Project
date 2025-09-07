import 'package:dating_app/services/logout_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Services
import 'package:dating_app/services/verify.dart';

// Pages
import 'package:dating_app/splash/splashApp.dart';
import 'package:dating_app/Authentification/Authentification.dart';
import 'package:dating_app/auth/login_page.dart';
import 'package:dating_app/Authentification/ui/signup.dart';
import 'package:dating_app/landingPage/HomePage/homePage.dart';
import 'package:dating_app/onboarding%20screens/getstarted.dart';
import 'package:dating_app/onboarding%20screens/onboardingScreen1.dart';
import 'package:dating_app/onboarding%20screens/onboardingScreen2.dart';

const Color mainColor = Color(0xFFFFCFEF);
const Color black = Color(0xFF000000);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize provider and restore session
  final verifyProvider = VerifyAuthProvider();
  await verifyProvider.bootstrap();

  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => verifyProvider,),
      ChangeNotifierProvider(create: (_) => LogoutService()),
    ],
    child: const MyApp(),
    ),);
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
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashPage(),
        '/onboarding/1': (context) => Onboardingscreen1(),
        '/onboarding/2': (context) => Onboardingscreen2(),
        '/onboarding/3': (context) => GetStarted(),
        '/auth-choice': (context) => const Authentification(),
        '/login': (context) => const LoginPage(),
        '/signup': (context) => const SignupPage(),
        '/home': (context) => const Homepage(),
      },
    );
  }
}
