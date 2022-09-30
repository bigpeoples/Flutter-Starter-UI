import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSCategoryDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

// ignore: must_be_immutable
class GSCategoryListDetailsComponent extends StatefulWidget {
  static String tag = '/GSCategoryListDetailsComponent';
  List<GSRecommendedModel> categoryDetailsList;

  GSCategoryListDetailsComponent(this.categoryDetailsList);

  @override
  GSCategoryListDetailsComponentState createState() => GSCategoryListDetailsComponentState();
}

class GSCategoryListDetailsComponentState extends State<GSCategoryListDetailsComponent> {
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
    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      children: widget.categoryDetailsList
          .map(
            (mData) => Container(
              margin: EdgeInsets.only(left: 8, right: 8, top: 16),
              padding: EdgeInsets.all(8),
              decoration: boxDecorationWithRoundedCorners(
                borderRadius: radius(0),
                backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
              ),
              width: context.width() * 0.44,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(mData.image.validate(), fit: BoxFit.cover, height: 120, width: 120).center(),
                  16.height,
                  Text(
                    mData.description!,
                    style: boldTextStyle(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text("${mData.quantity.validate()}/pack", style: secondaryTextStyle()),
                  12.height,
                  Row(
                    children: [
                      Text("\u0024${mData.salePrice.validate()}", style: secondaryTextStyle(decoration: TextDecoration.lineThrough, size: 16)),
                      8.width,
                      Container(
                        decoration: boxDecorationWithRoundedCorners(
                          borderRadius: radius(4),
                          backgroundColor: gs_primary_color.withOpacity(0.20),
                        ),
                        padding: EdgeInsets.only(left: 14, right: 14),
                        child: Text("Save ${mData.offer.validate()}", style: secondaryTextStyle(color: gs_primary_color)).visible(!mData.offer.isEmptyOrNull),
                      )
                    ],
                  ),
                  Text("\u0024${mData.price.validate()}", style: primaryTextStyle(color: Colors.orangeAccent, size: 18)),
                ],
              ),
            ).onTap(() {
              GSCategoryDetailsScreen(categoryDetails: mData).launch(context);
            }),
          )
          .toList(),
    );
  }
}
