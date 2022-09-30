import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSDashboardScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import 'GSWelcomeScreen.dart';

class GSWalkThroughScreen extends StatefulWidget {
  static String tag = '/GSWalkThroughScreen';

  @override
  GSWalkThroughScreenState createState() => GSWalkThroughScreenState();
}

class GSWalkThroughScreenState extends State<GSWalkThroughScreen> with AfterLayoutMixin<GSWalkThroughScreen> {
  PageController pageController = PageController();
  List<Widget> pages = [];
  double? currentPage = 0;
  static const _kDuration = const Duration(milliseconds: 300);
  static const _kCurve = Curves.easeInCubic;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page;
      });
    });
  }

  @override
  void afterFirstLayout(BuildContext context) {
    pages = [
      gsWalkThroughWidget(gs_walk_through1, "Fresh groceries at your doorste\n in the next hour", "FIND FOOD"),
      gsWalkThroughWidget(gs_walk_through2, "Fresh groceries at your doorste\n in the next hour", "ADD ADDRESS"),
      gsWalkThroughWidget(gs_walk_through3, "Fresh groceries at your doorste\n in the next hour", "DELIVERY"),
    ];
    setState(() {});
  }

  @override
  void dispose() {
    //pageController?.dispose();
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
        key: scaffoldKey,
        body: Stack(
          children: [
            PageView(controller: pageController, children: pages.map((e) => e).toList()),
            Align(
              alignment: Alignment.topRight,
              child: Text(
                "Skip".toUpperCase(),
                style: primaryTextStyle(size: 16, color: gs_primary_color),
                textAlign: TextAlign.end,
              ).onTap(() {
                GSDashboardScreen().launch(context);
              }),
            ).paddingOnly(right: 16, top: 16),
            Positioned(
              //  top: context.height() * 0.73,
              bottom: 80,
              left: 0,
              right: 0,
              child: DotIndicator(pageController: pageController, pages: pages, indicatorColor: gs_primary_color, unselectedIndicatorColor: grey),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: gsAppButton(
                context,
                'Next',
                () {
                  if (currentPage == 2) {
                    finish(context);
                    GSWelcomeScreen().launch(context);
                  } else {
                    pageController.nextPage(duration: _kDuration, curve: _kCurve);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
