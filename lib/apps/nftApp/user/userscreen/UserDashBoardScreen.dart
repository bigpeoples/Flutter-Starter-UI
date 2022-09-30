import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/fragment/NUAddFragment.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/fragment/NUHomeFragment.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/fragment/NUProfileFragment.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/fragment/NUSearchFragment.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/main.dart';

class UserDashBoardScreen extends StatefulWidget {
  @override
  UserDashBoardScreenState createState() => UserDashBoardScreenState();
}

class UserDashBoardScreenState extends State<UserDashBoardScreen> {
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  List<Widget> page = [
    NUHomeFragment(),
    NUAddFragment(),
    NUSearchFragment(),
    NUProfileFragment(),
  ];

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldBackgroundColor,
      appBar: appBar(),
      body: page[currentPage],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: nftPrimaryColor,
        showUnselectedLabels: false,
        showSelectedLabels: false,
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.control_point), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: '')
        ],
        onTap: (value) {
          currentPage = value;
          setState(() {});
        },
      ),
    );
  }
}
