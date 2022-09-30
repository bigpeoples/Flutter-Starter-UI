import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSOrderProgressDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSConstants.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

Widget gsAppButton(BuildContext context, String title, Function onTap) {
  return AppButton(
    width: context.width(),
    child: Text(title, style: boldTextStyle(color: Colors.white)),
    color: gs_primary_color,
    shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
    onTap: onTap,
  );
}

Widget gsWalkThroughWidget(String image, String title, String subTitle) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image.validate(), height: 220, width: 180, fit: BoxFit.cover),
        60.height,
        Column(
          children: [
            Text(title.validate(), style: boldTextStyle(size: 20), textAlign: TextAlign.center),
            16.height,
            Text(subTitle.validate(), style: secondaryTextStyle(size: 16), textAlign: TextAlign.center),
          ],
        ),
      ],
    ),
  );
}

InputDecoration inputDecoration({String? label}) {
  return InputDecoration(
    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
    labelText: label,
    labelStyle: secondaryTextStyle(size: 14),
  );
}

Widget myOrderWidget({Widget? ratingBar, required List<GSMyOrderModel> orderList, Function? onTap}) {
  return ListView.builder(
    padding: EdgeInsets.only(top: 8),
    shrinkWrap: true,
    physics: NeverScrollableScrollPhysics(),
    itemCount: orderList.length,
    itemBuilder: (context, index) {
      GSMyOrderModel mData = orderList[index];

      return Container(
        padding: EdgeInsets.all(16),
        decoration: boxDecorationWithRoundedCorners(
          boxShadow: defaultBoxShadow(),
          borderRadius: radius(0),
          backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(mData.title!, style: boldTextStyle()),
                    4.height,
                    Text("Delivered on ${mData.date}", style: secondaryTextStyle()),
                    4.height,
                    Container(
                      decoration: boxDecorationWithRoundedCorners(
                          borderRadius: radius(4),
                          backgroundColor: (mData.orderStatus == GSCompleted)
                              ? Colors.green
                              : (mData.orderStatus == GSOnProgress)
                                  ? Colors.orangeAccent
                                  : (mData.orderStatus == GSCancel)
                                      ? Colors.red
                                      : Container() as Color),
                      padding: EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
                      child: Text(
                          (mData.orderStatus == GSCompleted)
                              ? "Completed"
                              : (mData.orderStatus == GSOnProgress)
                                  ? "Delivering"
                                  : (mData.orderStatus == GSCancel)
                                      ? "Canceled"
                                      : Container() as String,
                          style: boldTextStyle(color: Colors.white, size: 12)),
                    ),
                    8.height,
                  ],
                ).expand(),
                Image.asset(mData.image!, height: 80, width: 80, fit: BoxFit.cover)
              ],
            ),
            8.height,
            Divider(),
            ratingBar!
          ],
        ),
      ).onTap(() {
        GSOrderProgressDetailsScreen(orderProgressList: mData).launch(context);
      }).paddingOnly(left: 16, right: 16, top: 8, bottom: 8);
    },
  );
}

Widget cartNotFound() {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(gs_empty_cart, fit: BoxFit.cover, height: 80, width: 80),
        8.height,
        Text("You don't have any order yet.", style: boldTextStyle()),
      ],
    ),
  );
}

class OrderStatusWidget extends StatelessWidget {
  const OrderStatusWidget({
    Key? key,
    this.title,
    this.message,
    this.disabled = false,
  }) : super(key: key);

  final String? title;
  final String? message;
  final bool disabled;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              title!,
              style: boldTextStyle(),
            ),
          ],
        ).paddingLeft(16),
      ],
    );
  }
}

Widget profileWidget(String title, String description) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: boldTextStyle()),
          Text(description, style: secondaryTextStyle()),
        ],
      ),
      Image.asset(gs_next_icon, height: 20, width: 20, fit: BoxFit.cover, color: gs_primary_color)
    ],
  ).paddingOnly(top: 8, bottom: 8, left: 16, right: 16);
}

Widget helpWidget(String title, String image) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title, style: boldTextStyle()),
      Image.asset(image, height: 20, width: 20, color: gs_primary_color),
    ],
  ).paddingAll(16);
}

Widget gsStatusBarWithTitle(BuildContext context, String title) {
  return AppBar(
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
        Text(title, style: boldTextStyle()),
      ],
    ),
  );
}

bottomFilterDialog(BuildContext context, String title, List list, {int tappedIndex = 0}) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16))),
    context: context,
    builder: (BuildContext context) {
      return BottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topRight: Radius.circular(8),
          topLeft: Radius.circular(8),
        )),
        onClosing: () {},
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, setState) => Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(title, style: boldTextStyle(size: 18)),
                      16.height,
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(list.length, (index) {
                          return Container(
                            padding: EdgeInsets.only(top: 8, bottom: 8),
                            child: Row(
                              children: [
                                Text(
                                  list[index]['title'],
                                  style: primaryTextStyle(),
                                ).expand(),
                                tappedIndex == index
                                    ? Image.asset(
                                        gs_next_icon,
                                        color: gs_primary_color,
                                        height: 18,
                                        width: 18,
                                      )
                                    : Container()
                              ],
                            ),
                          ).onTap(() {
                            setState(() {
                              tappedIndex = index;
                            });
                          });
                        }),
                      )
                    ],
                  ).paddingAll(16));
        },
      );
    },
  );
}
