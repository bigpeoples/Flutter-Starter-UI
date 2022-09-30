import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/Lipsum.dart' as lipsum;
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class CWTabBarScreen1 extends StatefulWidget {
  static const tag = '/CWTabBarScreen1';

  @override
  CWTabBarScreen1State createState() => CWTabBarScreen1State();
}

class CWTabBarScreen1State extends State<CWTabBarScreen1> {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text(
              value,
              style: boldTextStyle(),
            ).paddingOnly(left: 16),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16),
              child: Text(
                lipsum.createParagraph(numSentences: 3),
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
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_border),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
              ),
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
