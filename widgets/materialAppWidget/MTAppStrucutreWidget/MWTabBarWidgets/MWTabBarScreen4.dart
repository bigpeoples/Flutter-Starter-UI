import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWTabBarScreen4 extends StatefulWidget {
  static String tag = "/MWTabBarScreen4";

  @override
  _MWTabBarScreen4State createState() => _MWTabBarScreen4State();
}

class _MWTabBarScreen4State extends State<MWTabBarScreen4> {
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
        length: 6,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: appStore.cardColor,
            iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
            title: Text('Scrollable Tab', style: boldTextStyle(size: 20)),
            bottom: TabBar(
              onTap: (index) {
                print(index);
              },
              isScrollable: true,
              indicatorColor: Colors.blue,
              labelColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
              labelStyle: boldTextStyle(),
              tabs: [
                Tab(text: "Home"),
                Tab(text: "MarketPlace"),
                Tab(text: "Group"),
                Tab(text: "Watch"),
                Tab(text: "Notifications"),
                Tab(text: "Menu"),
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
                    Text('MarketPlace', style: primaryTextStyle(size: 24)),
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
                    Text('Group', style: primaryTextStyle(size: 24)),
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
                    Text('Watch', style: primaryTextStyle(size: 24)),
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
                    Text('Notifications', style: primaryTextStyle(size: 24)),
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
                    Text('Menu', style: primaryTextStyle(size: 24)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabList({Widget? icon, required String title}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        icon == null ? SizedBox() : icon,
        10.width,
        Text(title, style: TextStyle(color: textPrimaryColor)),
      ],
    );
  }
}
