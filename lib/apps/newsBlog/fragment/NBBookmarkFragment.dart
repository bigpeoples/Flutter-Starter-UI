import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/component/NBBooKMarksWidget.dart';
import 'package:mighty_ui_kit/apps/newsBlog/component/NBBookMarkPostWidget.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class NBBookmarkFragment extends StatefulWidget {
  @override
  _NBBookmarkFragmentState createState() => _NBBookmarkFragmentState();
}

class _NBBookmarkFragmentState extends State<NBBookmarkFragment> {
  final GlobalKey _bookmarkKey = GlobalKey();

  List<NewsModel> bookmarkNews = bookMarkNews();

  List<Channel> newsChannelList = newsChannels();
  List<Widget> bookMarkList = [];

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Bookmarks', style: boldTextStyle(size: 22)).paddingOnly(left: 16, right: 16),
              16.height,
              Divider(color: grey),
              Container(
                height: 120,
                child: ListView.builder(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: newsChannelList.length,
                  itemBuilder: (_, index) {
                    Channel news = newsChannelList[index];

                    return Column(
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: boxDecorationRoundedWithShadow(35, backgroundColor: context.cardColor),
                          child: commonCachedNetworkImage(news.img!, fit: BoxFit.cover, height: 80, width: 75).cornerRadiusWithClipRRect(35),
                        ),
                        8.height,
                        Text(news.name!, style: primaryTextStyle()),
                      ],
                    ).onTap(() {
                      news.newsChannel!.launch(context);
                    }, highlightColor: appStore.isDarkModeOn ? black : white, splashColor: white).paddingOnly(left: 8, right: 8, top: 8);
                  },
                ),
              ),
              Divider(color: grey),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Bloomberg', style: primaryTextStyle()),
                  16.height,
                  Text(
                    'Study shows millennial in east Midland have seen biggest shortfall in earnings growth from previous generation.',
                    style: boldTextStyle(),
                  ),
                  Row(
                    children: [
                      Text('Business', style: primaryTextStyle(color: primaryColor)),
                      8.width,
                      Icon(Icons.circle, size: 5, color: grey),
                      8.width,
                      Text('3m Ago', style: secondaryTextStyle()).expand(),
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
              ).paddingOnly(left: 16, right: 16),
              Divider(color: grey, height: 30),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                key: _bookmarkKey,
                itemCount: bookmarkNews.length,
                itemBuilder: (_, index) {
                  NewsModel data = bookmarkNews[index];

                  if (index % 2 == 0) {
                    return NBBookMarkPostWidget(newsData: data);
                  } else {
                    return NBBooKMarksWidget(newsData: data);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
