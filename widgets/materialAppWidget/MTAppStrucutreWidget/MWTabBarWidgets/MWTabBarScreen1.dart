import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../main.dart';

class MWTabBarScreen1 extends StatefulWidget {
  static String tag = "/MWTabBarScreen1";

  @override
  _MWTabBarScreen1State createState() => _MWTabBarScreen1State();
}

class _MWTabBarScreen1State extends State<MWTabBarScreen1> {
  @override
  void initState() {
    super.initState();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
            backgroundColor: appStore.cardColor,
            title: Text(
              'Simple TabBar',
              style: appStore.isDarkModeOn ? boldTextStyle(color: Colors.white, size: 20) : boldTextStyle(color: textPrimaryColor, size: 20),
            ),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              indicatorColor: Colors.blue,
              labelColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
              labelStyle: boldTextStyle(),
              tabs: [
                Tab(text: "Home"),
                Tab(text: "Articles"),
                Tab(text: "User"),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: context.width(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Home', style: primaryTextStyle(size: 24)),
                    15.height,
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: context.width(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Articles', style: primaryTextStyle(size: 24)),
                    15.height,
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                alignment: Alignment.center,
                width: context.width(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('User', style: primaryTextStyle(size: 24)),
                    15.height,
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
