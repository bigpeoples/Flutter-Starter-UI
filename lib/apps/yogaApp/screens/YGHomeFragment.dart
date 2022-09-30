import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGCourseWidgetComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGProgramWidgetComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'YGEssentialsForBeginnerScreen.dart';
import 'YGSearchScreen.dart';

class YGHomeFragment extends StatefulWidget {
  const YGHomeFragment({Key? key}) : super(key: key);

  @override
  _YGHomeFragmentState createState() => _YGHomeFragmentState();
}

class _YGHomeFragmentState extends State<YGHomeFragment> {
  int currentPosition = 0;
  PageController? pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: currentPosition);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 250.0,
              automaticallyImplyLeading: false,
              title: Text('Exercise', style: primaryTextStyle(size: 22)),
              backgroundColor: context.scaffoldBackgroundColor,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    PageView.builder(
                      itemCount: homeFragmentList.length,
                      itemBuilder: (context, i) {
                        return ClipRRect(child: Image.asset(homeFragmentList[i].url!, fit: BoxFit.cover));
                      },
                      controller: pageController,
                      onPageChanged: (int page) {
                        currentPosition = page;
                        setState(() {});
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DotIndicator(pageController: pageController!, pages: homeFragmentList, indicatorColor: yg_primaryColor),
                    ),
                  ],
                ),
              ),
              actions: [
                Icon(Ionicons.md_search_outline, color: context.iconColor).onTap(() {
                  YGSearchScreen().launch(context);
                }).paddingAll(8),
              ],
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Essentials For Beginner', style: boldTextStyle(size: 18)).paddingSymmetric(horizontal: 16),
                  Text('More', style: secondaryTextStyle()).paddingSymmetric(horizontal: 16, vertical: 4).onTap(
                    () {
                      YGEssentialsForBeginnerScreen().launch(context);
                    },
                  ),
                ],
              ),
              8.height,
              YGCoursesWidgetComponent(list: homeTabList),
              8.height,
              Text('Yoga Programs', style: boldTextStyle(size: 18)).paddingSymmetric(horizontal: 16),
              YGProgramWidgetComponent(list: homeProgramList),
              16.height,
            ],
          ),
        ),
      ),
    );
  }
}
