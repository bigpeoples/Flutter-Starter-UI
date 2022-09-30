import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/main/screens/DashboardScreen.dart';
import 'package:mighty_ui_kit/main/services/BannerServices.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

class AppSplashScreen extends StatefulWidget {
  static String tag = '/AppSplashScreen';

  @override
  AppSplashScreenState createState() => AppSplashScreenState();
}

class AppSplashScreenState extends State<AppSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setUpRemoteConfig().catchError((e) {
      return e;
    });
    await Future.delayed(Duration(seconds: 2));

    defaultBlurRadius = 10.0;
    defaultSpreadRadius = 0.5;

    DashboardScreen().launch(context, isNewTask: true, pageRouteAnimation: PageRouteAnimation.Fade);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('images/app/app_icon.png', height: 130, width: 130).center(),
            Text(MainAppName, style: boldTextStyle(size: 20)),
          ],
        ).center(),
      ),
    );
  }
}
