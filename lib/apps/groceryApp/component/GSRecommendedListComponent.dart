import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSRecommendationDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class GSRecommendedListComponent extends StatefulWidget {
  static String tag = '/GSRecommendedListComponent';
  List<GSRecommendedModel> recommendedList;

  GSRecommendedListComponent(this.recommendedList);

  @override
  GSRecommendedListComponentState createState() => GSRecommendedListComponentState();
}

class GSRecommendedListComponentState extends State<GSRecommendedListComponent> {
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
    return SizedBox(
      height: 260,
      child: ListView.builder(
        padding: EdgeInsets.only(right: 16),
        shrinkWrap: true,
        physics: ClampingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: widget.recommendedList.length,
        itemBuilder: (context, index) {
          GSRecommendedModel mData = widget.recommendedList[index];
          return Container(
            width: 200,
            padding: EdgeInsets.all(8),
            margin: EdgeInsets.only(top: 12, bottom: 12),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radius(8),
              backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
              boxShadow: defaultBoxShadow(),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Image.asset(mData.image.validate(), fit: BoxFit.cover, height: 120, width: 120).center(),
                    Container(
                      padding: EdgeInsets.only(left: 12, right: 12, top: 4, bottom: 4),
                      decoration: boxDecorationWithRoundedCorners(borderRadius: radius(4), backgroundColor: Colors.orangeAccent),
                      child: Text(mData.offer.validate(), style: boldTextStyle(size: 12, color: Colors.white)),
                    ).visible(!mData.offer.isEmptyOrNull),
                  ],
                ),
                8.height,
                Row(
                  children: [
                    Text("\u0024${mData.price.validate()}", style: boldTextStyle(color: gs_primary_color, size: 18)),
                    8.width,
                    Text("\u0024${mData.salePrice.validate()}", style: secondaryTextStyle(size: 16, decoration: TextDecoration.lineThrough)),
                  ],
                ),
                4.height,
                Text(mData.title.validate(), style: secondaryTextStyle(), maxLines: 1),
                Text(mData.quantity!, style: secondaryTextStyle(size: 16))
              ],
            ),
          ).onTap(() {
            GSRecommendationDetailsScreen(recommendedDetails: mData).launch(context);
          }).paddingOnly(left: 16);
        },
      ),
    );
  }
}
