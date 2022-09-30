import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppImage.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class PETransformScreen extends StatefulWidget {
  static String tag = '/PETransformScreen';

  @override
  PETransformScreenState createState() => PETransformScreenState();
}

class PETransformScreenState extends State<PETransformScreen> {
  int rotateValue = 0;
  double scaleValue = 1;
  double offsetX = 0;

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
          padding: EdgeInsets.all(16),
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Transform Scale', style: boldTextStyle()).paddingBottom(35),
              Transform.scale(
                scale: scaleValue,
                transformHitTests: false,
                child: Icon(Icons.favorite_rounded, size: 100, color: Colors.red),
              ).center(),
              Text('Value : ${scaleValue.toStringAsFixed(2)}', style: primaryTextStyle()).center().paddingTop(35),
              Slider(
                activeColor: Colors.red,
                inactiveColor: textPrimaryColor,
                max: 1.5,
                min: 0.5,
                value: scaleValue,
                onChanged: (val) {
                  setState(() {
                    scaleValue = val;
                  });
                },
              ),
              Text('Transform Translate', style: boldTextStyle()).paddingBottom(20),
              AnimatedSwitcher(
                duration: Duration(seconds: 1),
                switchInCurve: Curves.bounceInOut,
                child: Transform.translate(
                  offset: Offset(offsetX, 0.0),
                  child: commonCacheImageWidget(offsetX > 50 ? sun : moon, 200, width: 200),
                ),
              ),
              Text('Value : ${offsetX.toStringAsFixed(2)}', style: primaryTextStyle()).center().paddingTop(25),
              Slider(
                activeColor: offsetX > 50 ? Colors.orange : Colors.grey,
                inactiveColor: textPrimaryColor,
                max: 100,
                min: 0,
                value: offsetX,
                onChanged: (val) {
                  setState(() {
                    offsetX = val;
                  });
                },
              ),
              Text('Transform Rotate', style: boldTextStyle()).paddingBottom(20),
              20.height,
              Transform.rotate(angle: rotateValue.toDouble(), child: commonCacheImageWidget(rotateValue > 7 ? emoji2 : emoji1, 120.0, width: 120.0, fit: BoxFit.cover)).center(),
              Text('Value : ${rotateValue.toStringAsFixed(2)}', style: primaryTextStyle()).center().paddingTop(25),
              Slider(
                inactiveColor: textPrimaryColor,
                activeColor: Colors.amber,
                max: 15,
                min: 0,
                value: rotateValue.toDouble(),
                onChanged: (val) {
                  setState(() {
                    rotateValue = val.toInt();
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
