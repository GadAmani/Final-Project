import 'package:dating_app/Authentification/Authentification.dart';
import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: appBar, //AppBar
        body: Column(
          children: [
            Expanded(child: ProfilesList()),
            AppBottomBar(),
          ],
        ),
      ),
    );
  }
}

//--------------------------------CLASSES-------------------------------

// class of the profiles

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
    description: 'I llike going to restaurants with good company',
  ),
  Profile(
    image: 'assets/profilesImages/woman1.jpg',
    name: 'Amy carpenter',
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

//--------------Widgets-----------------

//-----------------------------PROFILE LIST---------------------------
class ProfilesList extends StatelessWidget {
  const ProfilesList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      // ignore: sized_box_for_whitespace
      child: Container(
        height: 250,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: profileItems.length,
          itemBuilder: (context, index) {
            Profile currentProfile = profileItems[index];

            return Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(20),
              margin: EdgeInsets.all(10),
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                image: DecorationImage(
                  image: AssetImage(currentProfile.image),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${currentProfile.name}, ${currentProfile.age} ",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 5),
                  Text(
                    currentProfile.description,
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class AppBottomBar extends StatefulWidget {
  const AppBottomBar({super.key});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  @override
  Widget build(BuildContext context) {
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

          Widget barItemWidget;

          if (currentBarItem.isSelected) {
            barItemWidget = Container(
              padding: EdgeInsets.only(left: 15, top: 5, bottom: 5, right: 15),
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
          }
          else{
            barItemWidget = IconButton( icon: Icon(currentBarItem.icon, color: Colors.grey,),onPressed: (){
              setState(() {
  barItems.forEach((AppBottomBarItem item) {
    item.isSelected = item == currentBarItem;
  });
});
            });
          }
          return barItemWidget;
        }),
      ),
    );
  }
}

//appbar
AppBar appBar = AppBar(
  centerTitle: true,
  elevation: 0,
  backgroundColor: Colors.black,
  iconTheme: IconThemeData(color: mainColor),
  title: Row(
    mainAxisSize: MainAxisSize.min,
    children: [Center(child: Icon(Icons.favorite, color: mainColor, size: 40))],
  ), //Center
  actions: const [SizedBox(width: 40, height: 40)],
);

class AppBottomBarItem {
  IconData? icon;
  bool isSelected;
  String label;

  AppBottomBarItem({this.icon, this.label = '', this.isSelected = false});
}

List<AppBottomBarItem> barItems = [
  AppBottomBarItem(icon: Icons.home, label: 'Home', isSelected: true),
  AppBottomBarItem(icon: Icons.explore, label: 'Explore', isSelected: false),
  AppBottomBarItem(icon: Icons.favorite, label: 'Match', isSelected: false),
  AppBottomBarItem(
    icon: Icons.person_outline,
    label: 'Profile',
    isSelected: true,
  ),
];
