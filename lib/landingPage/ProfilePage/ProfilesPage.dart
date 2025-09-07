import 'package:dating_app/onboarding%20screens/getstarted.dart';
import 'package:dating_app/onboarding%20screens/onboardingScreen2.dart';
import 'package:dating_app/services/logout_service.dart';
import 'package:dating_app/services/verify.dart';
import 'package:dating_app/splash/splashApp.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

const Color mainColor = Colors.purple; // adjust your main color

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
                color: mainColor,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage(
                        "assets/images/profileImage.jpg",
                      ),
                    ),
                    const SizedBox(height: 10),
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
                      padding: EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          Icon(Icons.star, color: Colors.white, size: 16),
                          SizedBox(width: 4),
                          Text(
                            "Premium",
                            style: TextStyle(color: Colors.white),
                          ),
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
                            foregroundColor: mainColor,
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
                          label: Text(
                            "Upgrade",
                            style: TextStyle(color: Colors.white),
                          ),
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
                    Text(
                      "About Me",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    Text(
                      "Interests",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
                    _buildSettingItem(
                      icon: Icons.lock,
                      title: "Privacy Settings",
                      onPressed: () {},
                    ),
                    _buildSettingItem(
                      icon: Icons.notifications,
                      title: "Notification Settings",
                      onPressed: () {},
                    ),
                    _buildSettingItem(
                      icon: Icons.security,
                      title: "Account Security",
                      onPressed: () {},
                    ),
                    _buildSettingItem(
                      icon: Icons.help,
                      title: "Help & Support",
                      onPressed: () {},
                    ),
                    // Logout button with Consumer for reactive loading
                    Consumer<LogoutService>(
                      builder: (context, logoutService, _) {
                        return _buildSettingItem(
                          icon: Icons.logout,
                          title: "Logout",
                          loading: logoutService.loading,
                          onTap: () => _logout(context),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Reusable button for settings
  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onPressed,
    bool loading = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: mainColor,
          minimumSize: Size(double.infinity, 50),
          elevation: 3,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        icon: loading
            ? SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: mainColor,
                ),
              )
            : Icon(icon),
        label: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: TextStyle(fontSize: 16)),
            Icon(Icons.arrow_forward_ios, size: 16),
          ],
        ),
        onPressed: loading ? null : onPressed,
      ),
    );
  }
}

Future<void> _logout(BuildContext context) async {
    final confirm = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Are you sure?'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: const Text('Cancel')),
          FilledButton(onPressed: () => Navigator.pop(context, true), child: const Text('Log out')),
        ],
      ),
    ) ?? false;

    if (!confirm) return;

    await context.read<VerifyAuthProvider>().clear();
    if (!context.mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, '/login', (r) => false);
  }
