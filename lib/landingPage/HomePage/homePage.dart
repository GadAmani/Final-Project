import 'package:dating_app/landingPage/MatchesPage/MatchesPage.dart';
import 'package:dating_app/landingPage/ProfilePage/ProfilesPage.dart';
import 'package:dating_app/landingPage/message/MessagePage.dart';
import 'package:flutter/material.dart';

//---------------- UTILS -----------------
class Utils {
  // Main navigator (root)
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey<NavigatorState>();
  // Child navigators for each tab
  static List<GlobalKey<NavigatorState>> tabNavKeys = [
    GlobalKey<NavigatorState>(), // Home
    GlobalKey<NavigatorState>(), // Messages
    GlobalKey<NavigatorState>(), // Matches
    GlobalKey<NavigatorState>(), // Profile
  ];
}

//---------------- PROFILE MODEL -----------------
class Profile {
  String image;
  String name;
  String age;
  String description;
  Profile({
    this.image = '',
    this.name = '',
    this.age = '',
    this.description = '',
  });
}

final List<Profile> profileItems = [
  Profile(
    image: 'assets/profilesImages/man1.jpg',
    name: 'Jack Doe',
    age: '24',
    description: 'I love travelling and hiking',
  ),
  Profile(
    image: 'assets/profilesImages/man2.jpg',
    name: 'Luc Pattirson',
    age: '24',
    description: 'I love cooking and sports',
  ),
  Profile(
    image: 'assets/profilesImages/man3.jpg',
    name: 'John Loes',
    age: '24',
    description: 'I am passionate of flowers',
  ),
  Profile(
    image: 'assets/profilesImages/man4.jpg',
    name: 'Richard Freeman',
    age: '24',
    description: 'I like going to restaurants with good company',
  ),
  Profile(
    image: 'assets/profilesImages/woman1.jpg',
    name: 'Amy Carpenter',
    age: '24',
    description: 'I love painting',
  ),
  Profile(
    image: 'assets/profilesImages/woman2.jpg',
    name: 'Barbie Roberts',
    age: '24',
    description: 'I love travelling and hiking',
  ),
];

//---------------- APP COLORS -----------------
final Color mainColor = Color(0xFFFFCFEF);

//---------------- MAIN HOMEPAGE -----------------
class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0;

  void _onTabSelected(int index) {
    if (_currentIndex == index) {
      // if tapped again → pop to root of that tab
      Utils.tabNavKeys[index].currentState?.popUntil((route) => route.isFirst);
    } else {
      setState(() {
        _currentIndex = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar,
        body: Stack(
          children: List.generate(Utils.tabNavKeys.length, (index) {
            return Offstage(
              offstage: _currentIndex != index,
              child: Navigator(
                key: Utils.tabNavKeys[index],
                onGenerateRoute: (settings) {
                  return MaterialPageRoute(
                    builder: (context) {
                      switch (index) {
                        case 0:
                          return ProfilesList(); // Home
                        case 1:
                          // only show matched profiles
                          return MessagesPage(
                            matchedProfiles: profileItems.take(3).toList(),
                          );

                        case 2:
                          return MatchesPage(
                            likedProfiles: profileItems
                                .skip(2)
                                .take(3)
                                .toList(),
                          );

                        case 3:
                          return ProfilePage();
                        default:
                          return Container();
                      }
                    },
                  );
                },
              ),
            );
          }),
        ),
        bottomNavigationBar: AppBottomBar(
          currentIndex: _currentIndex,
          onTabSelected: _onTabSelected,
        ),
      ),
    );
  }
}

//---------------- PROFILES LIST -----------------
class ProfilesList extends StatelessWidget {
  const ProfilesList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: profileItems.length,
      itemBuilder: (context, index) {
        Profile currentProfile = profileItems[index];

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
                    image: AssetImage(currentProfile.image),
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
                      "${currentProfile.name}, ${currentProfile.age}",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      currentProfile.description,
                      style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    ),
                  ],
                ),
              ),

              // Buttons (Pass & Match)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Pass button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[300],
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Passed on ${currentProfile.name}"),
                          ),
                        );
                      },
                      child: Icon(Icons.close, color: Colors.black, size: 30),
                    ),

                    // Match button
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(20),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              "Matched with ${currentProfile.name}!",
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 30,
                      ),
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

//---------------- CUSTOM APP BAR -----------------
AppBar appBar = AppBar(
  centerTitle: true,
  elevation: 0,
  backgroundColor: Colors.black,
  iconTheme: IconThemeData(color: mainColor),
  title: Row(
    mainAxisSize: MainAxisSize.min,
    children: [Center(child: Icon(Icons.favorite, color: mainColor, size: 40))],
  ),
  actions: const [SizedBox(width: 40, height: 40)],
);

//---------------- CUSTOM BOTTOM BAR -----------------
class AppBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTabSelected;

  const AppBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTabSelected,
  });

  @override
  Widget build(BuildContext context) {
    List<AppBottomBarItem> barItems = [
      AppBottomBarItem(icon: Icons.home, label: 'Home'),
      AppBottomBarItem(icon: Icons.message, label: 'Message'),
      AppBottomBarItem(icon: Icons.favorite, label: 'Match'),
      AppBottomBarItem(icon: Icons.person_outline, label: 'Profile'),
    ];

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset.zero,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(barItems.length, (index) {
          AppBottomBarItem currentBarItem = barItems[index];
          bool isSelected = currentIndex == index;

          if (isSelected) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: mainColor,
              ),
              child: Row(
                children: [
                  Icon(currentBarItem.icon, color: Colors.white),
                  SizedBox(width: 5),
                  Text(
                    currentBarItem.label,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          } else {
            return IconButton(
              icon: Icon(currentBarItem.icon, color: Colors.grey),
              onPressed: () => onTabSelected(index),
            );
          }
        }),
      ),
    );
  }
}

class AppBottomBarItem {
  IconData icon;
  String label;

  AppBottomBarItem({required this.icon, required this.label});
}
