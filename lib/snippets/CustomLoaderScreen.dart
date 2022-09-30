import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class CustomLoaderScreen extends StatefulWidget {
  static String tag = '/CustomLoaderScreen';

  @override
  CustomLoaderScreenState createState() => CustomLoaderScreenState();
}

class CustomLoaderScreenState extends State<CustomLoaderScreen> {
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
        body: SingleChildScrollView(
          child: Align(
            alignment: Alignment.topCenter,
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 16.0, // gap between adjacent chips
              runSpacing: 16.0, // gap between lines
              children: <Widget>[
                animationWidget(SpinKitRotatingCircle(color: Colors.red)),
                animationWidget(SpinKitRotatingPlain(color: Colors.black)),
                animationWidget(SpinKitChasingDots(color: Colors.blue)),
                animationWidget(SpinKitPumpingHeart(color: Colors.green)),
                animationWidget(SpinKitPulse(color: Colors.purple)),
                animationWidget(SpinKitDoubleBounce(color: Colors.deepPurple)),
                animationWidget(SpinKitWave(color: Colors.orange, type: SpinKitWaveType.start)),
                animationWidget(SpinKitThreeBounce(color: Colors.amberAccent)),
                animationWidget(SpinKitWanderingCubes(color: Colors.blueAccent)),
                animationWidget(SpinKitCircle(color: Colors.brown)),
                animationWidget(SpinKitFadingFour(color: Colors.cyan)),
                animationWidget(SpinKitFadingCube(color: Colors.blueGrey)),
                animationWidget(SpinKitCubeGrid(color: Colors.deepOrangeAccent)),
                animationWidget(SpinKitFadingCube(color: Colors.lightGreenAccent)),
                animationWidget(SpinKitRing(color: Colors.greenAccent)),
                animationWidget(SpinKitDualRing(color: Colors.teal)),
                animationWidget(SpinKitRipple(color: Colors.purple)),
                animationWidget(SpinKitFadingGrid(color: Colors.orangeAccent)),
                animationWidget(SpinKitFadingGrid(color: Colors.green, shape: BoxShape.rectangle)),
                animationWidget(SpinKitHourGlass(color: Colors.deepOrangeAccent)),
              ],
            ),
          ).paddingAll(16),
        ),
      ),
    );
  }

  Widget animationWidget(Widget widget) {
    return Container(
      height: 80,
      width: 80,
      decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), borderRadius: radius(12), backgroundColor: appStore.cardColor),
      child: widget,
    );
  }
}
