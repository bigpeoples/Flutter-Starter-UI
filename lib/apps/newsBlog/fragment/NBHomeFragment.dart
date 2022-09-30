import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/component/NBDrawerWidget.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBLatestNewsList.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBLifeTabNewsList.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBSearchScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBTravelTabNewsList.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBWorldTabNews.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class NBHomeFragment extends StatefulWidget {
  @override
  _NBHomeFragmentState createState() => _NBHomeFragmentState();
}

class _NBHomeFragmentState extends State<NBHomeFragment> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        key: _drawerKey,
        appBar: AppBar(
          backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
          elevation: 5,
          title: Text('Welcome', style: boldTextStyle(size: 22)),
          actions: [
            IconButton(
              onPressed: () {
                NBSearchScreen().launch(context);
              },
              icon: Icon(Icons.search, color: appStore.isDarkModeOn ? white : black),
            ).paddingOnly(right: 16),
          ],
          leading: IconButton(
            icon: Icon(Entypo.menu, color: appStore.isDarkModeOn ? white : black),
            onPressed: () {
              setState(() {
                _drawerKey.currentState!.openDrawer();
              });
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          ),
          bottom: TabBar(
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: primaryColor,
            unselectedLabelColor: appStore.isDarkModeOn ? white : black,
            indicatorColor: primaryColor,
            tabs: [
              Tab(text: "Latest"),
              Tab(text: "World"),
              Tab(text: "Travel"),
              Tab(text: "Life"),
            ],
          ),
        ),
        drawer: NBDrawerWidget(),
        body: TabBarView(
          children: [
            NBLatestNewsList(),
            NBWorldTabNewsList(),
            NBTravelTabNewsList(),
            NBLifeTabList(),
          ],
        ),
      ),
    );
  }
}
