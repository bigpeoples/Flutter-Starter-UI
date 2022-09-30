import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWBottomNavigationScreen1 extends StatefulWidget {
  static String tag = '/MWBottomNavigationScreen1';

  @override
  MWBottomNavigationScreen1State createState() => MWBottomNavigationScreen1State();
}

class MWBottomNavigationScreen1State extends State<MWBottomNavigationScreen1> {
  int currentIndex1 = 0;
  final example1 = [
    Text('Example 1', style: primaryTextStyle(size: 24)),
    Text('Reels', style: primaryTextStyle(size: 24)),
    Text('New Photo', style: primaryTextStyle(size: 24)),
    Text('Activity', style: primaryTextStyle(size: 24)),
    Text('Profile', style: primaryTextStyle(size: 24)),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(child: example1.elementAt(currentIndex1)),
            15.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bulletText('A bottom navigation bar is usually used in conjunction with a Scaffold.'),
                5.height,
                bulletText('Bottom navigation bar consists of multiple items in the form of text labels, icons, or both.'),
                5.height,
                bulletText('This example consists of icons and label both.'),
                5.height,
                bulletText('Bottom Navigation type is Fixed (Default Type).'),
                5.height,
                bulletText('Use when there are less than five items .'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex1 = index;
          });
        },
        currentIndex: currentIndex1,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
        unselectedItemColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
        backgroundColor: appStore.cardColor,
        iconSize: 30,
        items: [
          //1
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home, color: appPrimaryColor),
            label: 'Home',
            backgroundColor: appBarBackgroundColor,
          ),
          //2
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_rounded),
            activeIcon: Icon(Icons.movie_rounded, color: appPrimaryColor),
            label: 'Reels',
          ),
          //3
          BottomNavigationBarItem(
            icon: Icon(Icons.camera),
            activeIcon: Icon(Icons.camera, color: appPrimaryColor),
            label: 'Gallery',
          ),
          //4
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_rounded),
            activeIcon: Icon(Icons.favorite_rounded, color: appPrimaryColor),
            label: 'Activity',
          ),
          //5
          BottomNavigationBarItem(
            icon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: iconSecondaryColor, width: 1)),
              child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
            ),
            activeIcon: Container(
              decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: iconColorPrimary, width: 1)),
              child: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/profile1.png', height: 30, width: 30).cornerRadiusWithClipRRect(20),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

Widget bulletText(String text) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Text("•  ", style: secondaryTextStyle(size: 14)),
      Text(text, style: secondaryTextStyle(size: 14)).expand(),
    ],
  );
}
