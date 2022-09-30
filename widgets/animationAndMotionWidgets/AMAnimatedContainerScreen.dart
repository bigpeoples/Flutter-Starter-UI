import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class AMAnimatedContainerScreen extends StatelessWidget {
  static String tag = '/AMAnimatedContainerScreen';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AnimatedContainerDemo(),
          ),
        ),
      ),
    );
  }
}

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> with TickerProviderStateMixin {
  late AnimationController _controller;
  bool selected = false;
  bool mShapeSelected = false;
  bool mProgressSelected = false;
  bool mBorder = false;
  var mValue = 0.0;

  @override
  void initState() {
    super.initState();
    init();
  }

  var mColorPrimary = appPrimaryColor;
  final mDividerColor = Color(0xFFDADADA);

  init() async {
    _controller = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    )..repeat();

    _controller.addListener(() {
      setState(() {
        //mColorPrimary = mDividerColor;
        _controller.forward();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Change color and border",
            style: boldTextStyle(),
          ).paddingBottom(16),
          AnimatedBuilder(
              animation: _controller,
              builder: (BuildContext context, Widget? child) {
                return AnimatedContainer(
                  color: mColorPrimary,
                  duration: Duration(seconds: 2),
                  child: Container(
                    width: 100,
                    height: 100,
                  ),
                );
              }).center(),
          30.height,
          GestureDetector(
            onTap: () {
              setState(() {
                mBorder = !mBorder;
              });
            },
            child: AnimatedContainer(
              duration: Duration(seconds: 2),
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                border: Border.all(
                  color: Colors.grey,
                  width: mBorder ? 6.0 : 0.0,
                ),
              ),
              child: Container(
                width: 100,
                height: 100,
              ),
            ),
          ).center(),
          16.height,
          Text(
            "Shape",
            style: boldTextStyle(),
          ).paddingBottom(16),
          GestureDetector(
            onTap: () {
              setState(() {
                mShapeSelected = !mShapeSelected;
              });
            },
            child: AnimatedContainer(
              width: mShapeSelected ? 350.0 : 100.0,
              height: mShapeSelected ? 150.0 : 100.0,
              color: mShapeSelected ? Colors.red : Colors.green,
              alignment: mShapeSelected ? Alignment.center : AlignmentDirectional.topCenter,
              duration: Duration(seconds: 2),
              curve: Curves.fastOutSlowIn,
              child: Container(),
            ).cornerRadiusWithClipRRect(mShapeSelected ? 64 : 0),
          ).center(),
          18.height,
          Text(
            "Progress",
            style: boldTextStyle(),
          ).paddingBottom(16),
          GestureDetector(
            onTap: () {
              setState(() {
                mProgressSelected = !mProgressSelected;
              });
            },
            child: AnimatedContainer(
              width: mProgressSelected ? MediaQuery.of(context).size.width : 100.0,
              height: 10,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: mProgressSelected ? Alignment.topLeft : Alignment.topRight,
              duration: Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              child: Container(),
            ),
          ).center(),
        ],
      ),
    );
  }
}
