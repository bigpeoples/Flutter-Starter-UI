import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/Lipsum.dart' as lipsum;
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class CWTabBarScreen2 extends StatefulWidget {
  static const tag = '/CWTabBarScreen2';

  @override
  CWTabBarScreen2State createState() => CWTabBarScreen2State();
}

class CWTabBarScreen2State extends State<CWTabBarScreen2> {
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
    Widget mPage(var value) {
      return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Text(
              value,
              style: boldTextStyle(),
            )),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 16),
              child: Text(
                lipsum.createParagraph(numSentences: 2),
                style: secondaryTextStyle(),
                textAlign: TextAlign.justify,
              ),
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        body: CupertinoTabScaffold(
          tabBar: CupertinoTabBar(
            backgroundColor: appStore.cardColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.favorite_border), label: 'Favourite'),
              BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
            ],
            activeColor: appPrimaryColor,
            inactiveColor: Colors.grey,
          ),
          tabBuilder: (BuildContext context, int index) {
            switch (index) {
              case 0:
                return mPage("Home");

              case 1:
                return mPage("Favourite");

              case 2:
                return mPage("Cart");

              default:
                return mPage("Profile");
            }
          },
        ),
      ),
    );
  }
}
