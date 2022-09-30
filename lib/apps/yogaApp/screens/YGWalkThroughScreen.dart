import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'YGCreateAccountScreen.dart';

class YGWalkThroughScreen extends StatefulWidget {
  const YGWalkThroughScreen({Key? key}) : super(key: key);

  @override
  _YGWalkThroughScreenState createState() => _YGWalkThroughScreenState();
}

class _YGWalkThroughScreenState extends State<YGWalkThroughScreen> {
  int currentPosition = 0;
  PageController pageController = PageController();
  bool isDarkMode = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    setStatusBarColor(Colors.transparent);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: context.height() * .9,
            width: context.width(),
            child: Stack(
              children: [
                PageView.builder(
                  itemCount: walkThroughList.length,
                  itemBuilder: (context, i) {
                    return Column(
                      children: [
                        commonCacheImageWidget(walkThroughList[i].url, context.height() * 0.5, fit: BoxFit.cover),
                        24.height,
                        Text(walkThroughList[currentPosition].text, style: boldTextStyle(size: 24)),
                        Text(walkThroughList[currentPosition].subtext, style: secondaryTextStyle(), textAlign: TextAlign.center).paddingAll(16),
                      ],
                    );
                  },
                  controller: pageController,
                  onPageChanged: (int page) {
                    currentPosition = page;
                    setState(() {});
                  },
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: DotIndicator(
                    pageController: pageController,
                    pages: walkThroughList,
                    indicatorColor: yg_primaryColor,
                    unselectedIndicatorColor: appStore.isDarkModeOn ? Colors.grey : Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: MaterialButton(
        height: 45,
        color: yg_primaryColor,
        child: Text('create account'.toUpperCase(), style: primaryTextStyle(color: white)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed: () {
          finish(context);
          YGCreateAccountScreen().launch(context);
        },
      ).paddingAll(16),
    );
  }
}
