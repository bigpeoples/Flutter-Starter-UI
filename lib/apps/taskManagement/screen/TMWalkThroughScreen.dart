import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'TMSignInScreen.dart';

class TMWalkThroughScreen extends StatefulWidget {
  static String tag = '/TMWalkThroughScreen';

  @override
  TMWalkThroughScreenState createState() => TMWalkThroughScreenState();
}

class TMWalkThroughScreenState extends State<TMWalkThroughScreen> {
  int currentPosition = 0;

  PageController pageController = PageController();

  List<TMIntroModel> mList = tmGetIntroList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    afterBuildCreated(() {
      setStatusBarColor(context.scaffoldBackgroundColor);
    });
  }

  @override
  void dispose() {
    pageController.dispose();
    // setStatusBarColor(context.scaffoldBackgroundColor);
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
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView.builder(
              itemCount: mList.length,
              itemBuilder: (context, i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    commonCacheImageWidget(mList[i].img!, 200, fit: BoxFit.cover),
                    32.height,
                    Text(mList[currentPosition].title!, style: boldTextStyle()),
                    Text(mList[currentPosition].description!, style: secondaryTextStyle(), textAlign: TextAlign.center).paddingAll(16),
                  ],
                );
              },
              controller: pageController,
              onPageChanged: (int page) {
                currentPosition = page;
                setState(() {});
              },
            ),
            Stack(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DotIndicator(
                      pageController: pageController,
                      indicatorColor: appStore.isDarkModeOn ? white : tmPrimaryColor,
                      unselectedIndicatorColor: appStore.isDarkModeOn ? context.cardColor : grey.withOpacity(0.4),
                      currentBoxShape: BoxShape.circle,
                      boxShape: BoxShape.circle,
                      currentDotSize: 10,
                      dotSize: 10,
                      pages: mList,
                    ),
                    TextButton(
                      child: Text("Next", style: secondaryTextStyle(size: 18)),
                      onPressed: () {
                        pageController.nextPage(duration: Duration(milliseconds: 1000), curve: Curves.linearToEaseOut);
                      },
                    )
                  ],
                ).paddingOnly(bottom: 16, left: 16, right: 16).visible(currentPosition < 2),
                tmButton(
                  context,
                  width: context.width(),
                  value: "Get Started",
                  onTap: () {
                    if (currentPosition == 2) {
                      TMSignInScreen().launch(context);
                    }
                  },
                ).paddingOnly(left: 16, right: 16, bottom: 32).visible(currentPosition == 2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
