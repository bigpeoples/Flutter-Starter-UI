import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class NBBookMarkedScreen extends StatefulWidget {
  @override
  _NBBookMarkedScreenState createState() => _NBBookMarkedScreenState();
}

class _NBBookMarkedScreenState extends State<NBBookMarkedScreen> {
  List<NewsModel> bookMarkedNewsList = bookMarks();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Your Bookmarks', titleTextStyle: boldTextStyle(), color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              padding: EdgeInsets.only(top: 8, bottom: 8),
              shrinkWrap: true,
              itemCount: bookMarkedNewsList.length,
              itemBuilder: ((_, index) {
                NewsModel data = bookMarkedNewsList[index];

                return Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        commonCachedNetworkImage(data.img!, height: 100, width: 130, fit: BoxFit.cover).cornerRadiusWithClipRRect(10),
                        8.width,
                        Text(data.subTitle!, maxLines: 3, overflow: TextOverflow.ellipsis, style: boldTextStyle()).expand()
                      ],
                    ).paddingOnly(left: 16, right: 16, top: 8, bottom: 8).onTap(() {
                      NBNewsDetailsScreen(data: data).launch(context);
                    }, splashColor: white, highlightColor: white),
                    Divider(height: 2, color: grey)
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
