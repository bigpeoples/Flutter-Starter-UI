import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'YGDiscountTabFragment.dart';
import 'YGVoucherTabFragment.dart';

class YGCouponScreen extends StatefulWidget {
  const YGCouponScreen({Key? key}) : super(key: key);

  @override
  _YGCouponScreenState createState() => _YGCouponScreenState();
}

class _YGCouponScreenState extends State<YGCouponScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: currentIndex,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: context.scaffoldBackgroundColor,
          iconTheme: IconThemeData(color: context.iconColor),
          centerTitle: true,
          title: TabBar(
            indicatorColor: context.iconColor,
            labelColor: appStore.isDarkModeOn ? Colors.white : scaffoldColorDark,
            indicatorSize: TabBarIndicatorSize.label,
            labelStyle: boldTextStyle(),
            tabs: [
              Tab(text: 'Discounts'),
              Tab(text: 'Vouchers'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            YGDiscountTabFragment(),
            YGVoucherTabFragment(),
          ],
        ),
      ),
    );
  }
}
