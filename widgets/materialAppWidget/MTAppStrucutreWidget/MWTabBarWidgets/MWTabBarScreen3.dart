import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWTabBarScreen3 extends StatefulWidget {
  static String tag = "/MWTabBarScreen3";

  @override
  _MWTabBarScreen3State createState() => _MWTabBarScreen3State();
}

class _MWTabBarScreen3State extends State<MWTabBarScreen3> with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 6);
    _tabController!.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.cardColor,
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
        title: Text(
          'TabBar with Icon',
          style: boldTextStyle(size: 20),
        ),
        bottom: TabBar(
          controller: _tabController,
          onTap: (index) {
            print(index);
          },
          indicatorColor: Colors.blue,
          tabs: [
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/home.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 0 ? iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/marketplace.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 1 ? iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/group.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 2 ? iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/video.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 3 ? iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/notification.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 4 ? iconSecondaryColor : Colors.blue,
            )),
            Tab(
                icon: Image.asset(
              'images/widgets/materialWidgets/mwAppStructureWidgets/TabBar/list.png',
              height: 25,
              width: 25,
              color: _tabController!.index != 5 ? iconSecondaryColor : Colors.blue,
            )),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
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
                Text(
                  'Home',
                  style: primaryTextStyle(size: 24),
                ),
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                Text(
                  'Marketplace',
                  style: primaryTextStyle(size: 24),
                ),
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                Text(
                  'Groups',
                  style: primaryTextStyle(size: 24),
                ),
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                Text(
                  'Watch',
                  style: primaryTextStyle(size: 24),
                ),
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                Text(
                  'Notifications',
                  style: primaryTextStyle(size: 24),
                ),
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
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
                Text(
                  'Menu',
                  style: primaryTextStyle(size: 24),
                ),
                15.height,
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
