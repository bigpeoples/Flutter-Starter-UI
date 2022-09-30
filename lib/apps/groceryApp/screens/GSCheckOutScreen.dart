import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSPaymentScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'GSSuccessfulOrderScreen.dart';

class GSCheckOutScreen extends StatefulWidget {
  static String tag = '/GSCheckOutScreen';

  @override
  GSCheckOutScreenState createState() => GSCheckOutScreenState();
}

class GSCheckOutScreenState extends State<GSCheckOutScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  Widget rowWidget(IconData icon, String title) {
    return Row(
      children: [
        Icon(icon, color: gs_primary_color),
        8.width,
        Text(title, style: primaryTextStyle()).expand(),
        Icon(Icons.navigate_next_outlined, color: gs_primary_color),
      ],
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : gs_background,
      appBar: gsStatusBarWithTitle(context, "Checkout") as PreferredSizeWidget?,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SingleChildScrollView(
            physics: ClampingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Destination", style: secondaryTextStyle(size: 16)).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(16),
                  color: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(gs_map_img, fit: BoxFit.cover, height: 90, width: 90),
                      16.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("8618 Hickory Avenue Newington, CT 06111", style: primaryTextStyle(size: 14)),
                          4.height,
                          Text("(254)544545645", style: primaryTextStyle(size: 14)),
                        ],
                      ).expand()
                    ],
                  ),
                ),
                8.height,
                Text("Pick up time", style: secondaryTextStyle(size: 16)).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
                8.height,
                Container(
                  color: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Column(
                    children: [rowWidget(Icons.schedule, DateFormat('EEE, d MMM yyyy - kk:mm').format(DateTime.now())).onTap(() {}), 30.height, rowWidget(Icons.watch, "Pick Up Time 30-40 Min").onTap(() {})],
                  ),
                ),
                8.height,
                Text("Total", style: secondaryTextStyle(size: 16)).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
                8.height,
                Container(
                  color: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                  padding: EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text("Total", style: boldTextStyle()).expand(),
                      Text("\u0024${"0.78"}", style: boldTextStyle()),
                    ],
                  ),
                ),
                8.height,
                Text("Payment Method", style: secondaryTextStyle(size: 16)).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
                8.height,
                Container(
                  color: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                  padding: EdgeInsets.all(16),
                  child: rowWidget(Icons.payment, "Add Payment Method").onTap(() {
                    GSPaymentScreen().launch(context);
                  }),
                ),
                8.height,
                Text("Promo Code", style: secondaryTextStyle(size: 16)).paddingOnly(left: 16, right: 16, top: 8, bottom: 8),
                8.height,
                Container(
                  padding: EdgeInsets.all(16),
                  color: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
                  child: Row(
                    children: [
                      Image.asset(gs_coupon, height: 24, width: 24, color: gs_primary_color),
                      8.width,
                      Text("Add Promo Code", style: primaryTextStyle()).expand(),
                      Icon(Icons.navigate_next_outlined, color: gs_primary_color),
                    ],
                  ),
                ),
              ],
            ),
          ).expand(),
          gsAppButton(context, "Place Order", () {
            GSSuccessfulOrderScreen().launch(context);
          })
        ],
      ),
    );
  }
}
