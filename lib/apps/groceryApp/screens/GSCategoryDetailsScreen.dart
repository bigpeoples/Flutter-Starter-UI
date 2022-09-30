import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSCheckOutScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class GSCategoryDetailsScreen extends StatefulWidget {
  static String tag = '/GSCategoryDetailsScreen';
  GSRecommendedModel? categoryDetails;

  GSCategoryDetailsScreen({this.categoryDetails});

  @override
  GSCategoryDetailsScreenState createState() => GSCategoryDetailsScreenState();
}

class GSCategoryDetailsScreenState extends State<GSCategoryDetailsScreen> {
  int ratingNum = 0;
  int counter = 1;

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
      appBar: appBarWidget('', color: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(widget.categoryDetails!.image!, fit: BoxFit.cover, height: 180, width: 180).center(),
                16.height,
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.categoryDetails!.title.validate(), style: boldTextStyle(size: 20)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "\u0024${widget.categoryDetails!.price.validate()}${"/kg"}",
                              style: secondaryTextStyle(decoration: TextDecoration.lineThrough),
                            ),
                            8.width,
                            Text("\u0024${widget.categoryDetails!.price.validate()}${"/kg"}", style: primaryTextStyle())
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                8.height,
                Divider(),
                8.height,
                Text(widget.categoryDetails!.description.validate(), style: primaryTextStyle(size: 14)),
                20.height,
                Text("Review", style: boldTextStyle()),
                16.height,
                Row(
                  children: [
                    RatingBar.builder(
                      initialRating: 5,
                      minRating: 1,
                      itemCount: 5,
                      glow: false,
                      maxRating: 5,
                      itemSize: 20,
                      ignoreGestures: true,
                      itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                      onRatingUpdate: (rating) {
                        ratingNum = rating.toInt();
                        setState(() {});
                      },
                    ),
                    8.width,
                    Text("5.0 from 1.942 users", style: secondaryTextStyle(size: 12)).expand(),
                    Image.asset(
                      gs_next_icon,
                      width: 20,
                      height: 20,
                      color: Colors.grey,
                    ),
                  ],
                ).onTap(() {}),
              ],
            ).paddingAll(16),
          ).expand(),
          Container(
            padding: EdgeInsets.all(20),
            alignment: Alignment.bottomCenter,
            width: context.width(),
            decoration: boxDecorationWithRoundedCorners(
              borderRadius: radiusOnly(topRight: 12, topLeft: 12),
              boxShadow: defaultBoxShadow(),
              backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Total", style: boldTextStyle(size: 20)),
                    8.width,
                    Text("\u0024${widget.categoryDetails!.salePrice.validate()}", style: boldTextStyle(size: 20)).expand(),
                    Row(
                      children: [
                        counter != 1
                            ? commonCacheImageWidget(gs_minus_icon, 20, width: 20).onTap(() {
                                setState(() {
                                  counter--;
                                });
                              })
                            : Container(),
                        16.width,
                        Text('$counter', style: boldTextStyle()),
                        16.width,
                        commonCacheImageWidget(gs_add_icon, 24, width: 24).onTap(() {
                          setState(() {
                            counter++;
                          });
                        }),
                      ],
                    ),
                  ],
                ),
                20.height,
                Text(
                  widget.categoryDetails!.description.validate(),
                  style: secondaryTextStyle(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                30.height,
                gsAppButton(context, "Checkout", () {
                  GSCheckOutScreen().launch(context);
                })
              ],
            ),
          )
        ],
      ),
    );
  }
}
