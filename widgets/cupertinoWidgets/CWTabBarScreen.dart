import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/components/AppItemWidget.dart';
import 'package:mighty_ui_kit/main/utils/AppDataProvider.dart';

class CWTabBarScreen extends StatefulWidget {
  static String tag = '/CWTabBarScreen';

  @override
  CWTabBarScreenState createState() => CWTabBarScreenState();
}

class CWTabBarScreenState extends State<CWTabBarScreen> {
  var getCupertinoTabBarData = getCupertinoTabBarList();

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
    return Scaffold(
      body: ListView.builder(
        itemCount: getCupertinoTabBarData.length,
        itemBuilder: (BuildContext context, index) {
          return AppItemWidget(data: getCupertinoTabBarData[index], onTap: () => getCupertinoTabBarData[index].widget, index: index);
        },
      ),
    );
  }
}
