import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class NBNBCScreen extends StatefulWidget {
  @override
  _NBNBCScreenState createState() => _NBNBCScreenState();
}

class _NBNBCScreenState extends State<NBNBCScreen> {
  bool mISCheck = false;

  List<NewsModel> listNBCNews = nbcNewsList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'NBC News',
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
          children: [
            Column(
              children: [
                commonCachedNetworkImage(
                  'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/village.jpg',
                  fit: BoxFit.cover,
                  height: context.height() * 0.3,
                  width: context.width(),
                ).cornerRadiusWithClipRRect(10),
                16.height,
                Text('Step back in time and experience middle age villages in Belarus', style: boldTextStyle()),
                16.height,
                Row(
                  children: [
                    Text('World', style: primaryTextStyle(color: primaryColor)),
                    8.width,
                    Icon(Icons.circle, size: 5, color: grey),
                    8.width,
                    Text('1m ', style: secondaryTextStyle()).expand(),
                    Icon(AntDesign.ellipsis1),
                  ],
                ),
              ],
            ).paddingOnly(left: 16, right: 16),
            16.height,
            ...listNBCNews.map((data) {
              return Column(
                children: [
                  Divider(height: 2, color: grey),
                  8.height,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: data.tag!,
                        child: commonCachedNetworkImage(data.img!, height: 130, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                      ),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.subTitle!, style: boldTextStyle(size: 14)),
                          16.height,
                          Row(
                            children: [
                              Text(data.type!, style: primaryTextStyle(color: primaryColor), overflow: TextOverflow.ellipsis, maxLines: 3),
                              8.width,
                              Icon(Icons.circle, size: 5, color: grey),
                              8.width,
                              Text(data.timeAgo!, style: secondaryTextStyle()).expand(),
                              PopupMenuButton(
                                onSelected: choiceAction,
                                icon: Icon(AntDesign.ellipsis1),
                                itemBuilder: (BuildContext context) {
                                  return PopUp.choices.map((String choice) {
                                    return PopupMenuItem(value: choice, child: Text(choice));
                                  }).toList();
                                },
                              ),
                            ],
                          ),
                        ],
                      ).expand(),
                    ],
                  ).onTap(() {
                    NBNewsDetailsScreen(data: data).launch(context);
                  }).paddingOnly(left: 16, right: 16),
                  8.height,
                ],
              );
            }).toList()
          ],
        ).paddingOnly(top: 16, bottom: 16),
      ),
    );
  }
}
