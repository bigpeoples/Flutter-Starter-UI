import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mighty_ui_kit/apps/groceryApp/component/GSCategoryListComponent.dart';
import 'package:mighty_ui_kit/apps/groceryApp/component/GSRecommendedListComponent.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSCategoryListDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSNotificationScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSConstants.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSDataProvider.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class GSDashboardScreen extends StatefulWidget {
  static String tag = '/GSDashboardScreen';

  @override
  GSDashboardScreenState createState() => GSDashboardScreenState();
}

class GSDashboardScreenState extends State<GSDashboardScreen> {
  List<GSSliderModel> sliderList = getSliderList();
  List<GSCategoryModel> categoryList = getCategoryList();
  List<GSRecommendedModel> recommendedList = getRecommendedList();

  int currentIndexPage = 0;
  PageController pageController = PageController(viewportFraction: 0.92, initialPage: 0);

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void dispose() {
    //pageController.dispose();
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
        appBar: AppBar(
          backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
          elevation: 1,
          centerTitle: false,
          automaticallyImplyLeading: false,
          titleSpacing: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(gs_app_logo, height: 40, width: 40, fit: BoxFit.cover),
                  8.width,
                  Text(GSAppName, style: boldTextStyle()),
                ],
              ).paddingLeft(16),
              IconButton(
                icon: Icon(Icons.notifications_none_sharp, color: appStore.isDarkModeOn ? iconSecondaryColor : Colors.black),
                onPressed: () {
                  hideKeyboard(context);
                  GSNotificationScreen().launch(context);
                },
              ),
            ],
          ),
        ),
        body: ListView(
          shrinkWrap: true,
          physics: ClampingScrollPhysics(),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 60,
                  padding: EdgeInsets.only(left: 16, right: 8),
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: radius(8),
                    backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.grey[50]!,
                  ),
                  child: Row(
                    children: [
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search for products",
                          hintStyle: secondaryTextStyle(),
                        ),
                      ).expand(),
                      IconButton(icon: Icon(Icons.search), onPressed: null),
                    ],
                  ),
                ).paddingOnly(left: 16, right: 16, top: 16),
                16.height,
                Container(
                  height: 240,
                  width: context.width(),
                  child: PageView.builder(
                    pageSnapping: false,
                    itemCount: sliderList.length,
                    controller: pageController,
                    onPageChanged: (int index) => setState(() => currentIndexPage = index),
                    itemBuilder: (_, index) {
                      return Image.asset(
                        sliderList[index].image.validate(),
                        fit: BoxFit.cover,
                        //height: 240,
                        width: context.width(),
                      ).cornerRadiusWithClipRRect(4).paddingRight(16);
                    },
                  ),
                ),
                8.height,
                Container(
                  alignment: Alignment.bottomCenter,
                  width: context.width(),
                  child: DotIndicator(
                    currentDotSize: 10,
                    dotSize: 6,
                    pageController: pageController,
                    pages: sliderList,
                    indicatorColor: gs_primary_color,
                    unselectedIndicatorColor: Colors.grey,
                  ),
                ),
                16.height,
                GSCategoryListComponent(categoryList).paddingOnly(left: 16, right: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Recommend for you", style: boldTextStyle()),
                    Text("See More", style: boldTextStyle(color: gs_primary_color, size: 14)).onTap(() {
                      GSCategoryListDetailsScreen().launch(context);
                    })
                  ],
                ).paddingOnly(left: 16, right: 16, top: 16),
                8.height,
                GSRecommendedListComponent(recommendedList),
                8.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Pick's Today", style: boldTextStyle()),
                    Text("See More", style: boldTextStyle(color: gs_primary_color, size: 14)).onTap(() {
                      GSCategoryListDetailsScreen().launch(context);
                    })
                  ],
                ).paddingOnly(left: 16, right: 16),
                8.height,
                GSRecommendedListComponent(recommendedList),
              ],
            ).paddingBottom(16),
          ],
        ),
      ),
    );
  }
}
