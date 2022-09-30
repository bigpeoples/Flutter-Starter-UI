import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';
import 'package:nb_utils/nb_utils.dart';

class YGDiscountTabFragment extends StatefulWidget {
  const YGDiscountTabFragment({Key? key}) : super(key: key);

  @override
  _YGDiscountTabFragmentState createState() => _YGDiscountTabFragmentState();
}

class _YGDiscountTabFragmentState extends State<YGDiscountTabFragment> {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: 100,
              decoration: boxDecorationWithShadow(backgroundColor: context.scaffoldBackgroundColor),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppTextField(
                    controller: searchController,
                    textFieldType: TextFieldType.OTHER,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                      isCollapsed: true,
                      contentPadding: EdgeInsets.all(8),
                      hintText: 'Coupons',
                      isDense: true,
                      labelStyle: TextStyle(fontSize: 12),
                    ),
                  ).expand(),
                  10.width,
                  Container(
                    height: 37,
                    width: context.width() * .23,
                    decoration: boxDecorationRoundedWithShadow(20, backgroundColor: yg_primaryColor),
                    padding: EdgeInsets.all(8),
                    alignment: Alignment.center,
                    child: Text('Apply', style: primaryTextStyle(color: Colors.white), textAlign: TextAlign.center),
                  ),
                ],
              ),
            ),
            16.height,
            Image.asset(yg_createAccount2, height: 250, fit: BoxFit.cover),
          ],
        ),
      ),
    );
  }
}
