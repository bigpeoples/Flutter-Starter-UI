import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/components/AppListWidget.dart';
import 'package:mighty_ui_kit/main/utils/AppDataProvider.dart';

class MWTabBarScreen extends StatefulWidget {
  static String tag = '/MWTabBarScreen';

  @override
  MWTabBarScreenState createState() => MWTabBarScreenState();
}

class MWTabBarScreenState extends State<MWTabBarScreen> {
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
    return SafeArea(
      child: Scaffold(
        body: AppListWidget(getTabBarWidgetList()),
      ),
    );
  }
}
