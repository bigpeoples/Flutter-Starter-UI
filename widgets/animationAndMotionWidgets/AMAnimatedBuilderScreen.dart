import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppImage.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class AMAnimatedBuilderScreen extends StatefulWidget {
  static String tag = '/AMAnimatedBuilderScreen';

  @override
  AMAnimatedBuilderScreenState createState() => AMAnimatedBuilderScreenState();
}

class AMAnimatedBuilderScreenState extends State<AMAnimatedBuilderScreen> with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation favouriteAnimation;
  Animation? flipAnimation;
  AnimationController? arrowAnimationController, favouriteAnimationController;
  int num = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    flipAnimation = Tween(end: 1.0, begin: 0.0).animate(CurvedAnimation(parent: controller, curve: Curves.linear));

    favouriteAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1200))..repeat();
    favouriteAnimation = Tween(begin: 80.0, end: 100.0).animate(CurvedAnimation(curve: Curves.bounceOut, parent: favouriteAnimationController!));

    favouriteAnimationController!.addStatusListener((AnimationStatus status) {
      if (status == AnimationStatus.completed) {
        favouriteAnimationController!.repeat();
      }
    });
    Timer.periodic(Duration(milliseconds: 1500), (timer) {
      num == 0
          ? num = 1
          : num == 1
              ? num = 2
              : num = 0;
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    arrowAnimationController?.dispose();
    favouriteAnimationController?.dispose();
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
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        body: Container(
          margin: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Rotate Animation", style: boldTextStyle()).paddingBottom(16),
                30.height,
                AnimatedBuilder(
                  animation: controller,
                  builder: (BuildContext context, Widget? child) {
                    return Transform(
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.005)
                        ..rotateY(2 * math.pi * controller.value),
                      alignment: Alignment.center,
                      child: Container(
                        decoration: boxDecoration(
                            radius: 8,
                            bgColor: num == 0
                                ? Colors.green
                                : num == 1
                                    ? Colors.pink
                                    : Colors.teal),
                        height: 150,
                        width: 150,
                      ),
                    );
                  },
                ).center(),
                60.height,
                AnimatedBuilder(
                  animation: controller,
                  child: Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16))),
                    width: 150,
                    height: 150,
                    child: Image.asset(appLogo),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: controller.value - math.pi / 12.0,
                      child: child,
                    );
                  },
                ).center(),
                30.height,
                Text("Favourite Animation", style: boldTextStyle()).paddingBottom(16),
                16.height,
                AnimatedBuilder(
                  animation: favouriteAnimationController!,
                  builder: (context, child) {
                    return Icon(Icons.favorite, color: Colors.red, size: favouriteAnimation.value);
                  },
                ).center(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
