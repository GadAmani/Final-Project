import 'package:dating_app/landingPage/HomePage/homePage.dart';
import 'package:dating_app/landingPage/message/chatScreen.dart';
import 'package:flutter/material.dart';

class MessagesPage extends StatelessWidget {
  final List<Profile> matchedProfiles;

  const MessagesPage({super.key, required this.matchedProfiles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: matchedProfiles.length,
      itemBuilder: (context, index) {
        Profile profile = matchedProfiles[index];

        return ListTile(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
          leading: CircleAvatar(
            radius: 28,
            backgroundImage: AssetImage(profile.image),
          ),
          title: Text(
            profile.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          onTap: () {
            // Navigate to a chat screen for this profile
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ChatScreen(profile: profile),
              ),
            );
          },
        );
      },
    );
  }
}
