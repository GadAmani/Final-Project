import 'package:flutter/material.dart';

final Color mainColor = Color(0xFFFFCFEF);
final Color black = Color(0xFF000000);

class Authentification extends StatelessWidget {
  const Authentification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            
            Column(
              children: [
                SizedBox(height: 40),
                Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.favorite, color: Colors.white, size: 30),
                      Text("Enchante", style: TextStyle(color: Colors.white, fontSize: 18),),
                    ],
                  ),
                ),
                SizedBox(height: 25,),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.white, // Specify default text color
                      fontSize: 42, // Optional: specify font size
                    ),
                    children: [
                      TextSpan(
                        text: "It Starts ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      
                      TextSpan(text: "with\n    a "),
                      TextSpan(
                        text: "Swipe",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Column(
              children: [

                RichText(textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                      color: Colors.white, // Specify default text color
                      fontSize: 18, // Optional: specify font size
                    ),
                  children: [
                      TextSpan(
                        
                        text: "By tapping ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      
                      TextSpan(text: "create account ",style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(text: "or ",),
                      TextSpan(
                        text: "Sign in ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                        
                      ),
                      TextSpan(text: " you agree to our Terms",),
                      TextSpan(text: "Learn how we process your data in our Privacy Policy and Cookies",),
                    ]
                )),
                // Text(
                //   textAlign: TextAlign.center,
                //   'By tapping "create account" or "Sign in", you agree to our Terms. Learn how we process your data in our Privacy Policy and Cookies',
                //   style: TextStyle(color: Colors.white, fontSize: 23, ),
                // ),
                SizedBox(height: 20,),
                SizedBox(
                  width: 500,
                  child: ElevatedButton(
                    
                    onPressed: () {
                      // Add your button action here
                      print('Create Account button pressed');
                    },
                    child: Text('Create Account'),
                  ),
                ), 
                SizedBox(height: 20,),

                SizedBox(
                  width: 500,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your button action here
                      print('Signin Account button pressed');
                    },
                    child: Text('Sign in'),
                  ),
                ),
                SizedBox(height: 40,),
                Text("Trouble signing in ?",style: TextStyle(color: Colors.white,fontSize: 20),),
                SizedBox(height: 10,),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
