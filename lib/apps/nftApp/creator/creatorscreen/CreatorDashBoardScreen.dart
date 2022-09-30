import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/fragment/NCAddFragment.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/fragment/NCHomeFragment.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/fragment/NCProfileFragment.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/fragment/NCSearchFragment.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../../main.dart';

class CreatorDashBoardScreen extends StatefulWidget {
  @override
  CreatorDashBoardScreenState createState() => CreatorDashBoardScreenState();
}

class CreatorDashBoardScreenState extends State<CreatorDashBoardScreen> {
  int currentPage = 0;

  List<Widget> page = [
    NCHomeFragment(),
    NCAddFragment(),
    NCSearchFragment(),
    NCProfileFragment(),
  ];

  @override
  void initState() {
    super.initState();
    init();
  }

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
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.control_point), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined), label: '')
        ],
        currentIndex: currentPage,
        onTap: (value) {
          currentPage = value;
          setState(() {});
        },
      ),
    );
  }
}
