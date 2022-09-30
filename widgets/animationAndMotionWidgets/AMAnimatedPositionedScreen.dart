import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppImage.dart';
import 'package:nb_utils/nb_utils.dart';

class AMAnimatedPositionedScreen extends StatefulWidget {
  static String tag = '/AMAnimatedPositionedScreen';

  @override
  AMAnimatedPositionedScreenState createState() => AMAnimatedPositionedScreenState();
}

class AMAnimatedPositionedScreenState extends State<AMAnimatedPositionedScreen> {
  double mLeftPosition = 0;
  double mRightPosition = 0;
  double mTopPosition = 0;
  double mBottomPosition = 0;

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
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        body: Container(
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              AnimatedPositioned(
                left: mLeftPosition,
                right: mRightPosition,
                top: mTopPosition,
                bottom: mBottomPosition,
                duration: Duration(milliseconds: 300),
                child: Center(child: Image.asset(appLogo, width: 100, height: 100)),
              ),
              Positioned(
                right: 10,
                child: AppButton(
                  onTap: () {
                    setState(() {
                      mLeftPosition = 120;
                      mRightPosition = 0;
                      mTopPosition = 0;
                      mBottomPosition = 0;
                    });
                  },
                  child: Icon(Icons.keyboard_arrow_right, color: Colors.black),
                ),
              ),
              Positioned(
                bottom: 60,
                child: AppButton(
                  onTap: () {
                    setState(() {
                      mLeftPosition = 0;
                      mRightPosition = 0;
                      mTopPosition = 120;
                      mBottomPosition = 0;
                    });
                  },
                  child: Icon(Icons.keyboard_arrow_down, color: Colors.black),
                ),
              ),
              Positioned(
                left: 10,
                child: AppButton(
                  onTap: () {
                    setState(() {
                      mLeftPosition = 0;
                      mRightPosition = 120;
                      mTopPosition = 0;
                      mBottomPosition = 0;
                    });
                  },
                  child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
                ),
              ),
              Positioned(
                top: 60,
                child: AppButton(
                  onTap: () {
                    setState(() {
                      mLeftPosition = 0;
                      mRightPosition = 0;
                      mTopPosition = 0;
                      mBottomPosition = 120;
                    });
                  },
                  child: Icon(Icons.keyboard_arrow_up, color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
