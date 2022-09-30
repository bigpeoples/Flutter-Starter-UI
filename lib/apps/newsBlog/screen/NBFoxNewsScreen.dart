import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class NBFoxNewsScreen extends StatefulWidget {
  @override
  _NBFoxNewsScreenState createState() => _NBFoxNewsScreenState();
}

class _NBFoxNewsScreenState extends State<NBFoxNewsScreen> {
  List<NewsModel> list = getBloombergList();

  bool mISCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Fox News',
        titleTextStyle: boldTextStyle(),
        color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
        actions: [
          Row(
            children: [
              Icon(mISCheck ? Icons.bookmark : Icons.bookmark_border, color: appStore.isDarkModeOn ? white : black).onTap(() {
                mISCheck = !mISCheck;
                setState(() {});
              }),
              16.width,
              Icon(Icons.search, color: appStore.isDarkModeOn ? white : black),
            ],
          ).paddingOnly(right: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            commonCachedNetworkImage('https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/man.jpg', fit: BoxFit.cover, height: context.height() * 0.3, width: context.width()).cornerRadiusWithClipRRect(10),
            16.height,
            Text('Consumers hit by online and phone problems as deadline looms', style: boldTextStyle()),
            16.height,
            Row(
              children: [
                Text('Business', style: primaryTextStyle(color: primaryColor)),
                8.width,
                Icon(Icons.circle, size: 5, color: grey),
                8.width,
                Text('1m ', style: secondaryTextStyle()).expand(),
                Icon(AntDesign.ellipsis1),
              ],
            ),
            16.height,
            Text('Santander apologies for IT glitch', style: boldTextStyle()),
            16.height,
            Text(
              'Consumers making last-minute claims for missold payment protection insurance have had to deal with crashing website',
              style: primaryTextStyle(),
            ),
            16.height,
            Text('The final deadline for making a claim', style: boldTextStyle()),
            16.height,
            Text(
              'While the final deadline for making a claim is 11.59PM on Thursday.Several banks had problems with their websites,with some potential applicants confronted with"internal server error" messages.The glitches were blamed on exceptionally high web traffic.',
              style: secondaryTextStyle(),
            ),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(10, backgroundColor: context.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('“That huge demand is causing even major bank systems to creek.”', style: boldTextStyle(size: 14)),
                  8.height,
                  Text('- Justice DY Chandrachud', style: secondaryTextStyle()),
                ],
              ).paddingAll(16),
            ),
            16.height,
            Text(
              'Customers of several bank have reported waiting times.The Bank replied:This is due to the high call volume.Please try again later.',
              style: primaryTextStyle(),
            ),
            16.height,
            Text("Why isn't PPI number working!", style: boldTextStyle()),
            16.height,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                commonCachedNetworkImage('https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/PPI.jpg', height: 100, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                8.width,
                Text(
                  "On twitter one customer asked Royal Bank pf Scotland: Why can't I get through your PPI line or your support?",
                  style: secondaryTextStyle(),
                ).expand(),
              ],
            ),
            16.height,
            Text(
              "This is due to high call volumes.The obvious first advice is to take tome,be prepared and be patient",
              style: secondaryTextStyle(),
            ),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ...list.map((e) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationRoundedWithShadow(10, backgroundColor: context.cardColor),
                    child: Text(e.title!, style: boldTextStyle()),
                  );
                }).toList()
              ],
            ),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
