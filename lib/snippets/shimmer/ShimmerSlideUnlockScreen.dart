import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/snippets/utills/SNImages.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerSlideUnlockScreen extends StatefulWidget {
  static String tag = '/ShimmerSlideUnlockScreen';

  @override
  ShimmerSlideUnlockScreenState createState() => ShimmerSlideUnlockScreenState();
}

class ShimmerSlideUnlockScreenState extends State<ShimmerSlideUnlockScreen> {
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
        body: Stack(
          clipBehavior: Clip.hardEdge,
          children: <Widget>[
            commonCacheImageWidget(SN_home_bg, context.height(), fit: BoxFit.cover),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(alignment: Alignment.center, child: Text("2:26", style: primaryTextStyle(color: white, size: 28))),
                10.height,
                Text("Friday, 30 December", style: primaryTextStyle(color: white, size: 20))
              ],
            ).paddingBottom(30),
            Column(
              mainAxisAlignment: MainAxisAlignment.end, // start at end/bottom of column
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Shimmer.fromColors(
                  child: Center(child: Text(">>Swipe to unlock", style: primaryTextStyle(size: 30, weight: FontWeight.bold))),
                  baseColor: Colors.grey,
                  highlightColor: white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
