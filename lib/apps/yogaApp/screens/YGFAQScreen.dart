import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGFAQModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';
import 'package:nb_utils/nb_utils.dart';

import 'YGFilterScreen.dart';

class YGFAQScreen extends StatefulWidget {
  const YGFAQScreen({Key? key}) : super(key: key);

  @override
  _YGFAQScreenState createState() => _YGFAQScreenState();
}

class _YGFAQScreenState extends State<YGFAQScreen> {
  @override
  void initState() {
    super.initState();
  }

  Widget faqWidget({required List<YGFAQDataModel> list}) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Row(
          children: [
            Container(
              height: 30,
              width: 30,
              decoration: boxDecorationRoundedWithShadow(16, backgroundColor: yg_primaryColor),
              padding: EdgeInsets.all(8),
              child: Image.asset(yg_faq, color: Colors.white),
            ),
            16.width,
            Text(list[index].text!, style: boldTextStyle(size: 14)).expand(),
          ],
        ).paddingAll(8);
      },
    ).paddingOnly(left: 8, right: 8);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.scaffoldBackgroundColor,
      appBar: appBarWidget('FAQ', showBack: true, color: context.scaffoldBackgroundColor, center: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 70,
              color: Colors.black12,
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 8, right: 8, top: 16),
              child: Text(
                  'Dear Yoga Continue,Our FAQ section can help'
                  ' you find the answer you want faster',
                  style: secondaryTextStyle(),
                  textAlign: TextAlign.center),
            ),
            Text('Most Frequently Asked:', style: boldTextStyle()).paddingAll(16),
            faqWidget(list: faqList),
            Divider(thickness: 3),
            Text('Most Frequently Asked:', style: boldTextStyle()).paddingAll(16),
            faqWidget(list: faqDataList),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(16),
        height: 45,
        decoration: boxDecorationRoundedWithShadow(20, backgroundColor: yg_primaryColor),
        width: context.width(),
        alignment: Alignment.center,
        child: Text('FAQ'.toUpperCase(), style: boldTextStyle()),
      ).onTap(
        () {
          YGFilterScreen().launch(context);
        },
      ),
    );
  }
}
