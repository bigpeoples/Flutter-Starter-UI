import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGGoalFragment.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGHomeFragment.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'YGHealthyTipsFragment.dart';
import 'YGProfileFragment.dart';
import 'YGTranningFragment.dart';

class YGDashBordScreen extends StatefulWidget {
  const YGDashBordScreen({Key? key}) : super(key: key);

  @override
  _YGDashBordScreenState createState() => _YGDashBordScreenState();
}

class _YGDashBordScreenState extends State<YGDashBordScreen> {
  int currentPosition = 0;

  List<Widget> widgetsOption = <Widget>[
    YGHomeFragment(),
    YGTrainingFragment(),
    YGHealthyTipsFragment(),
    YGGoalFragment(),
    YGProfileFragment(),
  ];

  @override
  void initState() {
    super.initState();
    setStatusBarColor(Colors.transparent);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widgetsOption.elementAt(currentPosition),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPosition,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              MaterialCommunityIcons.home,
              color: iconColorSecondary,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Ionicons.md_play,
                color: iconColorSecondary,
              ),
              label: 'Training'),
          BottomNavigationBarItem(icon: Icon(Icons.library_books_rounded, color: iconColorSecondary), label: 'HealthTips'),
          BottomNavigationBarItem(
            icon: Icon(Icons.add, color: iconColorSecondary),
            label: 'Goal',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person_sharp, color: iconColorSecondary), label: 'Profile'),
        ],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: context.iconColor,
        selectedLabelStyle: TextStyle(color: yg_primaryColor),
        // unselectedItemColor: Colors.black38,
        unselectedLabelStyle: TextStyle(color: yg_primaryColor),
        showUnselectedLabels: true,
        onTap: (index) {
          currentPosition = index;
          setState(() {});
        },
      ),
    );
  }
}
