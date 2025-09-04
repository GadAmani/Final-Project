import 'package:dating_app/splash/splashApp.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Top profile header
              Container(
                color: Colors.purple,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    // Profile image
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage("assets/images/profileImage.jpg"),
                    ),
                    const SizedBox(height: 10),

                    // Name, age, location
                    Text(
                      "Sophia, 24",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "📍 New York, USA",
                      style: TextStyle(color: Colors.white70),
                    ),

                    const SizedBox(height: 10),

                    // Premium Badge
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.star, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text("Premium", style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Buttons: Edit Profile + Upgrade
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.purple,
                          ),
                          icon: Icon(Icons.edit),
                          label: Text("Edit Profile"),
                          onPressed: () {},
                        ),
                        const SizedBox(width: 10),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.pink,
                          ),
                          icon: Icon(Icons.upgrade, color: Colors.white),
                          label: Text("Upgrade", style: TextStyle(color: Colors.white)),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Bio Section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("About Me", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Text(
                      "I love traveling 🌍, coffee ☕, and good conversations. Looking for someone who shares the same energy ✨.",
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              Divider(),

              // Interests
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Interests", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Wrap(
                      spacing: 10,
                      children: [
                        Chip(label: Text("🎵 Music")),
                        Chip(label: Text("🍕 Foodie")),
                        Chip(label: Text("🏞 Hiking")),
                        Chip(label: Text("🎮 Gaming")),
                        Chip(label: Text("📚 Reading")),
                      ],
                    ),
                  ],
                ),
              ),

              Divider(),

              // Settings section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _buildSettingItem(Icons.lock, "Privacy Settings"),
                    _buildSettingItem(Icons.notifications, "Notification Settings"),
                    _buildSettingItem(Icons.security, "Account Security"),
                    _buildSettingItem(Icons.help, "Help & Support"),
                    _buildSettingItem(Icons.logout, "Logout"),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: mainColor),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {},
    );
  }
}
