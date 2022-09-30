import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWBottomNavigationScreen3 extends StatefulWidget {
  static String tag = '/MWBottomNavigationScreen3';

  @override
  MWBottomNavigationScreenState createState() => MWBottomNavigationScreenState();
}

class MWBottomNavigationScreenState extends State<MWBottomNavigationScreen3> {
  int currentIndex3 = 0;

  final example3 = [
    Text('Example 3', style: primaryTextStyle(size: 24)),
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
            example3.elementAt(currentIndex3),
            15.height,
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                bulletText('This example consists of only icons and label but only the selected item shows the label.'),
                5.height,
                bulletText('This example consists of only icons and label but only the selected item shows the label.'),
                5.height,
                bulletText('Bottom Navigation type is shifting.'),
                5.height,
                bulletText('Use when there are less than five items.'),
              ],
            ),
            /*UL(
              children: [
                Text('This example consists of only icons and label but only the selected item shows the label.', style: primaryTextStyle()),
                Text('This example consists of only icons and label but only the selected item shows the label.', style: primaryTextStyle()),
                Text('Bottom Navigation type is shifting.', style: primaryTextStyle()),
                Text('Use when there are less than five items.', style: primaryTextStyle()),
              ],
            ),*/
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: appStore.cardColor,
        ),
        child: BottomNavigationBar(
          onTap: (int index) {
            setState(() {
              currentIndex3 = index;
            });
          },
          currentIndex: currentIndex3,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
          unselectedItemColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
          showSelectedLabels: true,
          showUnselectedLabels: false,
          items: [
            //1
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home.png',
                height: 25,
                width: 25,
                color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
              ),
              activeIcon: Image.asset(
                'images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/home_fill.png',
                height: 25,
                width: 25,
                color: appPrimaryColor,
              ),
              label: 'Home',
            ),
            //2
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel.png',
                height: 25,
                width: 25,
                color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
              ),
              activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/reel_fill.png', height: 25, width: 25, color: appPrimaryColor),
              label: 'Reels',
            ),
            //3
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/gallery.png',
                height: 25,
                width: 25,
                color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
              ),
              activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/gallery_fill.png', height: 25, width: 25, color: appPrimaryColor),
              label: 'Gallery',
            ),
            //4
            BottomNavigationBarItem(
              icon: Image.asset(
                'images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/heart.png',
                height: 25,
                width: 25,
                color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
              ),
              activeIcon: Image.asset('images/widgets/materialWidgets/mwAppStructureWidgets/BottomNavigation/heart_fill.png', height: 25, width: 25, color: appPrimaryColor),
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
