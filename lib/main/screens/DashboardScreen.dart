import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mighty_ui_kit/main/components/AppBannerWidget.dart';
import 'package:mighty_ui_kit/main/components/AppListWidget.dart';
import 'package:mighty_ui_kit/main/components/AppSettingsWidget.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:mighty_ui_kit/main/utils/AppDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../main.dart';

class DashboardScreen extends StatefulWidget {
  static String tag = '/DashboardScreen';

  @override
  DashboardScreenState createState() => DashboardScreenState();
}

class DashboardScreenState extends State<DashboardScreen> with SingleTickerProviderStateMixin {
  ScrollController scrollController = ScrollController();
  AnimationController? animationController;
  late Animation animation;

  bool showSecondWidget = false;

  @override
  void initState() {
    super.initState();

    init();
  }

  Future<void> init() async {
    animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 400), value: 0.0, upperBound: 0.29, lowerBound: 0.0)..reverse();
    animation = CurvedAnimation(parent: animationController!, curve: Curves.ease);
    animationController!.forward();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  void dispose() {
    scrollController.dispose();
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (_) => Scaffold(
          appBar: appBarWidget(MainAppName,titleTextStyle: boldTextStyle(size: 24),elevation: 0,showBack: false,color: appStore.cardColor),
          body: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppBannerWidget(),
                Text("Apps & Widgets", style: secondaryTextStyle(size: 16)).paddingAll(16),
                AppListWidget(getAppsAndWidgets()),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("App Settings", style: secondaryTextStyle(size: 16)).paddingOnly(left: 16, right: 16, bottom: 16, top: 16),
                    IconButton(
                      onPressed: () async {
                        setState(() {
                          showSecondWidget = !showSecondWidget;
                          showSecondWidget ? animationController!.reverse() : animationController!.forward();
                        });
                        if (!showSecondWidget) {
                          await Future.delayed(Duration(milliseconds: 440));
                          scrollController.animToBottom();
                        }
                      },
                      icon: RotationTransition(turns: animation as Animation<double>, child: Icon(Icons.arrow_upward_rounded)),
                    ).paddingRight(16),
                  ],
                ),
                AnimatedCrossFade(
                  firstChild: AppSettingsWidget(),
                  secondChild: Container(),
                  duration: Duration(milliseconds: 400),
                  crossFadeState: showSecondWidget ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
