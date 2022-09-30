import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSWalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSConstants.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:nb_utils/nb_utils.dart';

class GSSplashScreen extends StatefulWidget {
  static String tag = '/GSSplashScreen';

  @override
  GSSplashScreenState createState() => GSSplashScreenState();
}

class GSSplashScreenState extends State<GSSplashScreen> with SingleTickerProviderStateMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    animationController = AnimationController(vsync: this, duration: Duration(seconds: 2));
    animation = CurvedAnimation(parent: animationController, curve: Curves.easeInCubic);

    animationController.forward();

    startTime();
  }

  startTime() async {
    await Future.delayed(Duration(seconds: 3));

    finish(context);
    GSWalkThroughScreen().launch(context);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ScaleTransition(scale: animation, child: Image.asset(gs_app_logo, height: 140, width: 180, fit: BoxFit.cover)),
            8.height,
            Text(GSAppName, style: boldTextStyle(size: 18, color: gs_primary_color)),
          ],
        ).center(),
      ),
    );
  }
}
