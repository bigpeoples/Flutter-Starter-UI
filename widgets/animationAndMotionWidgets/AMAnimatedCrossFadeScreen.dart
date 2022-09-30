import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';

class AMAnimatedCrossFadeScreen extends StatefulWidget {
  static String tag = '/AMAnimatedCrossFadeScreen';

  @override
  AMAnimatedCrossFadeScreenState createState() => AMAnimatedCrossFadeScreenState();
}

class AMAnimatedCrossFadeScreenState extends State<AMAnimatedCrossFadeScreen> {
  CrossFadeState _crossFadeState = CrossFadeState.showFirst;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _crossFadeState = CrossFadeState.showFirst;
      });
    });

    Future.delayed(const Duration(seconds: 3), () async {
      setState(() {
        _crossFadeState = CrossFadeState.showSecond;
      });

      await Future.delayed(Duration(seconds: 3));
      init();
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
          body: Center(
            child: AnimatedCrossFade(
              duration: Duration(seconds: 3),
              firstChild: FlutterLogo(style: FlutterLogoStyle.horizontal, size: 150.0),
              secondChild: Image.asset('images/app/app_icon.png', width: 150, height: 150),
              crossFadeState: _crossFadeState,
            ),
          )),
    );
  }
}
