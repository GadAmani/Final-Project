
import 'package:dating_app/Authentification/Authentification.dart';
import 'package:flutter/material.dart';
final Color mainColor = Color(0xFFFFCFEF);
final Color black = Color(0xFF000000);

// ignore: camel_case_types
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.of(
        context,
      ).push(MaterialPageRoute(builder: (context) => Authentification()));
    });
   
    
    return Container(
      decoration: BoxDecoration(
        
          gradient: LinearGradient(
            colors: [
              mainColor, // Pinkish red
              black, // Lighter orange-pink
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
      ),
      child: Stack(
          children: [
           Align(
            alignment: Alignment.center,
            child: Icon(Icons.favorite, color: Colors.white, size: 90),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: 80),
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