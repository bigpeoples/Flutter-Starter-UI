import 'package:flutter/material.dart';

class MWSliverTabBarScreen2 extends StatefulWidget {
  @override
  MWSliverTabBarScreenState createState() => MWSliverTabBarScreenState();
}

class MWSliverTabBarScreenState extends State<MWSliverTabBarScreen2> with SingleTickerProviderStateMixin {
  TabController? controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 3, vsync: this);
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            snap: true,
            expandedHeight: 70,
            automaticallyImplyLeading: false,
            floating: true,
            bottom: TabBar(
              tabs: [
                Tab(text: 'Tab 1'),
                Tab(text: 'Tab 2'),
                Tab(text: 'Tab 3'),
              ],
              controller: controller,
            ),
          ),
          // SliverList(
          SliverFillRemaining(
            child: TabBarView(
              controller: controller,
              children: <Widget>[
                Center(child: Text("Tab one")),
                Center(child: Text("Tab two")),
                Center(child: Text("Tab three")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
