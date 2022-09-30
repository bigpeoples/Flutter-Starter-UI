import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSRecommendationDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSDataProvider.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

import 'GSCheckOutScreen.dart';

class GSCartScreen extends StatefulWidget {
  static String tag = '/GSCartScreen';

  @override
  GSCartScreenState createState() => GSCartScreenState();
}

class GSCartScreenState extends State<GSCartScreen> {
  List<GSRecommendedModel> recommendedList = getRecommendedList();
  int totalCount = 0;
  int totalAmount = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    calculate();
  }

  calculate() async {
    totalAmount = 0;
    recommendedList.forEach((element) {
      setState(() {
        totalAmount += ((element.salePrice.validate()) * (element.qty.validate())).toInt();
      });
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white,
        elevation: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        title: Text("Cart", style: boldTextStyle()),
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: ListView.separated(
              separatorBuilder: (_, i) => Divider(),
              shrinkWrap: true,
              reverse: true,
              physics: ClampingScrollPhysics(),
              itemCount: recommendedList.length,
              padding: EdgeInsets.all(16),
              itemBuilder: (_, index) {
                GSRecommendedModel mData = recommendedList[index];
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.asset(mData.image.validate(), fit: BoxFit.cover, height: 80, width: 80),
                        30.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(mData.title.validate(), style: boldTextStyle(), maxLines: 1),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "\u0024${mData.price.validate()}",
                                  style: secondaryTextStyle(decoration: TextDecoration.lineThrough),
                                ),
                                8.width,
                                Text("\u0024${mData.salePrice.validate()}", style: primaryTextStyle()),
                              ],
                            ),
                            10.height,
                            Row(
                              children: [
                                commonCacheImageWidget(gs_minus_icon, 20, width: 20).onTap(() {
                                  setState(() {
                                    var gtyData = mData.qty.validate();
                                    if (gtyData <= 1) return;
                                    var qty = gtyData - 1;
                                    mData.qty = qty;
                                    calculate();
                                  });
                                }),
                                16.width,
                                Row(
                                  children: [
                                    Text(mData.qty.toString(), style: boldTextStyle()),
                                  ],
                                ),
                                16.width,
                                commonCacheImageWidget(gs_add_icon, 20, width: 20).onTap(() {
                                  setState(() {
                                    totalCount = mData.qty! + 1;
                                    mData.qty = totalCount;
                                    calculate();
                                  });
                                }),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ).onTap(() {
                  GSRecommendationDetailsScreen(recommendedDetails: mData).launch(context);
                });
              },
            ),
          ).expand(),
          AppButton(
            width: context.width(),
            child: Row(
              children: [
                Text("Proceed to checkout", style: secondaryTextStyle(color: Colors.white)).expand(),
                Row(
                  children: [
                    Row(
                      children: [
                        Text("Total:", style: boldTextStyle(color: Colors.white)),
                        8.width,
                        Text("\u0024$totalAmount", style: boldTextStyle(color: Colors.white)),
                      ],
                    ),
                    8.width,
                    Image.asset(gs_next_icon, width: 20, height: 20, color: Colors.white),
                  ],
                )
              ],
            ),
            color: gs_primary_color,
            shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
            onTap: () {
              GSCheckOutScreen().launch(context);
            },
          ),
        ],
      ),
    );
  }
}
