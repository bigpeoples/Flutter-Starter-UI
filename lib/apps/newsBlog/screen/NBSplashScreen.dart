import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBSignInScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class NBSplashScreen extends StatefulWidget {
  @override
  NBSplashScreenState createState() => NBSplashScreenState();
}

class NBSplashScreenState extends State<NBSplashScreen> {


  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    await 2.seconds.delay;

    finish(context);
    NBSignInScreen().launch(context);
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        'images/newsblog/fireLogo.jpg',
        height: 150,
        width: 150,
        fit: BoxFit.cover,
      ).cornerRadiusWithClipRRect(75).center(),
    );
  }
}
