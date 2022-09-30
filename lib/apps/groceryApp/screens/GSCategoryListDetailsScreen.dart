import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/component/GSCategoryListDetailsComponent.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSDataProvider.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class GSCategoryListDetailsScreen extends StatefulWidget {
  static String tag = '/GSCategoryListDetailsScreen';
  String? categoryName;

  GSCategoryListDetailsScreen({this.categoryName});

  @override
  GSCategoryListDetailsScreenState createState() => GSCategoryListDetailsScreenState();
}

class GSCategoryListDetailsScreenState extends State<GSCategoryListDetailsScreen> {
  List<GSRecommendedModel> categoryDetailsList = getCategoryListDetailsList();

  List<Map<String, String>> filterList = [
    {'title': "Brand"},
    {'title': "Quality"},
  ];
  List<Map<String, String>> sortList = [
    {'title': "Popularity"},
    {'title': "Lowest Price"},
    {'title': "Highest Price"},
  ];

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
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : gs_background,
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
        elevation: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: appStore.isDarkModeOn ? iconSecondaryColor : Colors.black,
              ),
              onPressed: () {
                finish(context);
              },
            ),
            8.width,
            Text(widget.categoryName.validate(), style: boldTextStyle()).expand(),
            IconButton(icon: Icon(Icons.share), onPressed: () {})
          ],
        ),
      ),
      body: SingleChildScrollView(
        //padding: EdgeInsets.all(8),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 6, bottom: 6),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: radius(0),
                boxShadow: defaultBoxShadow(),
                backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.filter_alt, color: Colors.grey),
                      8.width,
                      Text("Filter", style: secondaryTextStyle(size: 16)),
                    ],
                  ).onTap(() {
                    bottomFilterDialog(context, "Filter", filterList);
                  }),
                  Row(
                    children: [
                      Icon(Icons.sort, color: Colors.grey),
                      8.width,
                      Text("Sort", style: secondaryTextStyle(size: 16)),
                    ],
                  ).onTap(() {
                    bottomFilterDialog(context, "Sort", sortList);
                  })
                ],
              ),
            ),
            GSCategoryListDetailsComponent(categoryDetailsList)
          ],
        ),
      ),
    );
  }
}
