import 'package:dating_app/landingPage/HomePage/homePage.dart';
import 'package:flutter/material.dart';

class MatchesPage extends StatelessWidget {
  final List<Profile> likedProfiles;

  const MatchesPage({super.key, required this.likedProfiles});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: likedProfiles.length,
      itemBuilder: (context, index) {
        Profile profile = likedProfiles[index];

        return Card(
          margin: EdgeInsets.only(bottom: 20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          clipBehavior: Clip.hardEdge,
          elevation: 5,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile image
              Container(
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(profile.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Name + age + description
              Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${profile.name}, ${profile.age}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      profile.description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              // Action buttons (Pass & Match)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // ❌ Pass button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("You rejected ${profile.name}")),
                        );
                      },
                      child: Icon(Icons.close, color: Colors.black, size: 30),
                    ),

                    // ❤️ Match button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("You matched with ${profile.name}!")),
                        );
                      },
                      child: Icon(Icons.favorite, color: Colors.white, size: 30),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
