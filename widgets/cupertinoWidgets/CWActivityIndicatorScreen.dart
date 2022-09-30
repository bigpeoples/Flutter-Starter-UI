import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';

class CWActivityIndicatorScreen extends StatefulWidget {
  static String tag = '/CWActivityIndicatorScreen';

  @override
  CWActivityIndicatorScreenState createState() => CWActivityIndicatorScreenState();
}

class CWActivityIndicatorScreenState extends State<CWActivityIndicatorScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Theme(
          data: appStore.isDarkModeOn ? ThemeData.dark() : ThemeData.light(),
          child: CupertinoActivityIndicator(
            animating: true,
            radius: 20,
          ),
        ),
      ),
    );
  }
}
