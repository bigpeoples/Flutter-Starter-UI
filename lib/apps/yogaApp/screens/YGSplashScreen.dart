import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGWalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';
import 'package:nb_utils/nb_utils.dart';

class YGSplashScreen extends StatefulWidget {
  const YGSplashScreen({Key? key}) : super(key: key);

  @override
  _YGSplashScreenState createState() => _YGSplashScreenState();
}

class _YGSplashScreenState extends State<YGSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await 2.seconds.delay;
    finish(context);
    YGWalkThroughScreen().launch(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            yg_logoImage,
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          ),
          Image.asset(yoga_neckStretch, fit: BoxFit.fill, height: 300, width: 300),
          Text(
            'Get fitter,stronger and embrace a healthier lifestyle',
            style: primaryTextStyle(),
            textAlign: TextAlign.center,
          ).paddingAll(16),
        ],
      ).center(),
    );
  }
}
