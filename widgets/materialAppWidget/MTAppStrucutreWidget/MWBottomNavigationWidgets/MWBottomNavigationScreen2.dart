import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWBottomNavigationScreen2 extends StatefulWidget {
  static String tag = '/MWBottomNavigationScreen2';

  @override
  MWBottomNavigationScreen2State createState() => MWBottomNavigationScreen2State();
}

class MWBottomNavigationScreen2State extends State<MWBottomNavigationScreen2> {
  int currentIndex2 = 0;
  final example2 = [
    Text('Example 2', style: primaryTextStyle(size: 24)),
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
        width: context.width(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            example2.elementAt(currentIndex2),
            15.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bulletText('This example consists of only icons selected items changes it colors.'),
                5.height,
                bulletText('Bottom Navigation type is Fixed(Default Type).'),
                5.height,
                bulletText('Use when there are less than five items.'),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex2 = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: appStore.cardColor,
        unselectedItemColor: iconSecondaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: currentIndex2,
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
