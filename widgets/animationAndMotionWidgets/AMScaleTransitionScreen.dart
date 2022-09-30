import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';

class AMScaleTransitionScreen extends StatefulWidget {
  static String tag = '/AMScaleTransitionScreen';

  @override
  AMScaleTransitionScreenState createState() => AMScaleTransitionScreenState();
}

class AMScaleTransitionScreenState extends State<AMScaleTransitionScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _controller = AnimationController(duration: const Duration(milliseconds: 2000), vsync: this, value: 0.1);

    _animation = CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);

    _controller.forward();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        body: Center(
          child: ScaleTransition(scale: _animation, alignment: Alignment.center, child: Image.asset('images/app/app_icon.jpg', height: 200, width: 200, fit: BoxFit.cover)),
        ),
      ),
    );
  }
}
