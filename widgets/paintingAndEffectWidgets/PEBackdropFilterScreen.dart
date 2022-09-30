import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class PEBackdropFilterScreen extends StatefulWidget {
  static String tag = '/PEBackdropFilterScreen';

  @override
  PEBackdropFilterScreenState createState() => PEBackdropFilterScreenState();
}

class PEBackdropFilterScreenState extends State<PEBackdropFilterScreen> {
  double xAxis = 3.0;
  double yAxis = 0.0;
  double opacity = 0;

  Color mSelectedColor = Colors.black;

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
    Widget colorSelectionWidget(Color color) {
      return Container(
        height: 30,
        width: 30,
        decoration: BoxDecoration(color: color, border: Border.all()),
        margin: EdgeInsets.only(right: 16),
        child: Icon(Icons.check, size: 16, color: white).visible(color == mSelectedColor),
      ).onTap(() {
        mSelectedColor = color;

        setState(() {});
      });
    }

    return SafeArea(
      child: Scaffold(
        body: Container(
          child: ListView(
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.all(16),
            children: [
              Container(
                width: 350,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider('https://images.unsplash.com/photo-1575193732883-6fd4bdc71014?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=675&q=80'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: BackdropFilter(filter: ImageFilter.blur(sigmaX: xAxis, sigmaY: yAxis), child: Container(color: mSelectedColor.withOpacity(opacity))),
              ).paddingOnly(top: 25, bottom: 25),
              Column(
                children: [
                  Row(
                    children: [
                      Text('X Axis: ', style: boldTextStyle()),
                      Slider(
                        inactiveColor: textPrimaryColor,
                        activeColor: appPrimaryColor,
                        max: 10,
                        min: 0,
                        value: xAxis,
                        onChanged: (val) {
                          setState(() {
                            xAxis = val;
                          });
                        },
                      ).expand(),
                      Text('Value: ${xAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Y Axis: ', style: boldTextStyle()),
                      Slider(
                        inactiveColor: textPrimaryColor,
                        activeColor: appPrimaryColor,
                        max: 10,
                        min: 0,
                        value: yAxis,
                        onChanged: (val) {
                          setState(() {
                            yAxis = val;
                          });
                        },
                      ).expand(),
                      Text('Value: ${yAxis.toStringAsFixed(2)}', style: primaryTextStyle()),
                    ],
                  ),
                  Row(
                    children: [
                      Text('Opacity : ', style: boldTextStyle()),
                      Slider(
                        inactiveColor: textPrimaryColor,
                        activeColor: appPrimaryColor,
                        max: 1,
                        min: 0,
                        value: opacity,
                        onChanged: (val) {
                          setState(() {
                            opacity = val;
                          });
                        },
                      ).expand(),
                      Text('Value: ${opacity.toStringAsFixed(2)}', style: primaryTextStyle()),
                    ],
                  ),
                  16.height,
                  Wrap(
                    children: [
                      colorSelectionWidget(Colors.black),
                      colorSelectionWidget(Colors.blue),
                      colorSelectionWidget(Colors.redAccent),
                      colorSelectionWidget(Colors.yellowAccent),
                      colorSelectionWidget(Colors.grey),
                      colorSelectionWidget(Colors.green),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
