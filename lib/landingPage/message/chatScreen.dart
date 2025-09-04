import 'package:dating_app/landingPage/HomePage/homePage.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  final Profile profile;

  const ChatScreen({super.key, required this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(profile.image),
            ),
            SizedBox(width: 10),
            Text(profile.name),
          ],
        ),
      ),
      body: Center(
        child: Text("Chat with ${profile.name}"),
      ),
    );
  }
}
