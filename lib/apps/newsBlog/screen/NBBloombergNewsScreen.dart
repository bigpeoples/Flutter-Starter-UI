import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class NBBloombergScreen extends StatefulWidget {
  @override
  _NBBloombergScreenState createState() => _NBBloombergScreenState();
}

class _NBBloombergScreenState extends State<NBBloombergScreen> {
  List<NewsModel> list = getBloombergList();
  bool mISCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Bloomberg',
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
            commonCachedNetworkImage('https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/Sterlite.jpeg', fit: BoxFit.cover, height: 220, width: context.width()).cornerRadiusWithClipRRect(10),
            16.height,
            Text('Tuticorin’s Sterlite Plant To Reopen For Oxygen Production After Supreme Court Go Ahead', style: boldTextStyle()),
            16.height,
            Row(
              children: [
                Text('World', style: primaryTextStyle(color: primaryColor)),
                8.width,
                Icon(Icons.circle, size: 5, color: grey),
                8.width,
                Text('1m Ago', style: secondaryTextStyle()).expand(),
                Icon(AntDesign.ellipsis1),
              ],
            ),
            16.height,
            Text('Plant Openning soon', style: boldTextStyle()),
            16.height,
            Text('The Supreme Court on Tuesday allowed the controversy-ridden Vedanta Sterlite copper plant in Thoothukudi, Tamil Nadu to reopen its oxygen production unit on a stand-alone basis.',
                style: primaryTextStyle()),
            16.height,
            Text(
                '“We have to step in when we feel so and we need to protect the lives of people,” Justice DY Chandrachud told the Centre. The top court clarified that its suo motu cognizance of the crisis caused by the second wave of pandemic is to supplement high court hearings. “In times of crisis, the Supreme Court cannot be a mute spectator,” Justice said.',
                style: primaryTextStyle()),
            16.height,
            Container(
              decoration: boxDecorationRoundedWithShadow(10, backgroundColor: context.cardColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('“The plant shall be operated & only produce oxygen & for no other purpose”', style: boldTextStyle(size: 14)),
                  8.height,
                  Text('- Justice DY Chandrachud', style: secondaryTextStyle()),
                ],
              ).paddingAll(16),
            ),
            16.height,
            Text("Plant was closed in 2018!", style: boldTextStyle()),
            16.height,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                commonCachedNetworkImage('https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/Sterlite2.jpeg', fit: BoxFit.cover, height: 150, width: 150).cornerRadiusWithClipRRect(10),
                8.width,
                Text("Tamil Nadu had shut down the Thoothukudi copper plant in May 2018 over environmental concerns, following a massive protest where 13 agitators were killed in police firing in the southern district.",
                        style: secondaryTextStyle())
                    .expand(),
              ],
            ),
            16.height,
            Text(
                "However, in view of the grave situation caused by the deadly coronavirus second wave, the Tamil Nadu government on Monday permitted Vedanta to operate its Sterlite plant for the next four months only for the production of medical oxygen. The government asserted that Tamil Nadu should get priority in the oxygen being produced there and it shall be taken to other states only after meeting its requirements.However, in view of the grave situation caused by the deadly coronavirus second wave, the Tamil Nadu government on Monday permitted Vedanta to operate its Sterlite plant for the next four months only for the production of medical oxygen. The government asserted that Tamil Nadu should get priority in the oxygen being produced there and it shall be taken to other states only after meeting its requirements.",
                style: secondaryTextStyle()),
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
