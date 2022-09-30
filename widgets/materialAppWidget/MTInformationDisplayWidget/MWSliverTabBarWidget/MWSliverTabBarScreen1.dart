import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWSliverTabBarScreen1 extends StatefulWidget {
  @override
  MWSliverTabBarScreen1State createState() => MWSliverTabBarScreen1State();
}

class MWSliverTabBarScreen1State extends State<MWSliverTabBarScreen1> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  ScrollController? _scrollViewController;

  List<String> items = [];
  List<Color> colors = [Colors.red, Colors.green, Colors.yellow, Colors.purple, Colors.blue, Colors.amber, Colors.cyan, Colors.pink];
  Random random = new Random();

  Color getRandomColor() {
    return colors.elementAt(random.nextInt(colors.length));
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
    _scrollViewController = ScrollController();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
    _scrollViewController?.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: NestedScrollView(
        controller: _scrollViewController,
        headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              floating: true,
              pinned: true,
              snap: true,
              expandedHeight: 70,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(child: Text("Chats")),
                  Tab(child: Text("Colors")),
                ],
                controller: _tabController,
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            ListView.builder(
              itemCount: 15,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.all(8),
                  margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: defaultBoxShadow(),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        child: commonCacheImageWidget('https://randomuser.me/api/portraits/men/66.jpg', 45, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                      ),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Smit', style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                          4.height,
                          Text('Rruga Reshit Collaku, Nr.4,Tirana', style: secondaryTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ).expand(),
                    ],
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 20,

              itemBuilder: (BuildContext context, int index) {
                Color color = getRandomColor();
                return Container(
                  height: 150.0,
                  color: color,
                  child: Text("Row $index", style: boldTextStyle(color: white)).center(),
                );
              },
              //physics: NeverScrollableScrollPhysics(),
            ),
          ],
        ),
      ),
    );
  }
}
