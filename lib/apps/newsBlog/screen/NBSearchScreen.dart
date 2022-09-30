import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBNewsDetailsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class NBSearchScreen extends StatefulWidget {
  @override
  _NBSearchScreenState createState() => _NBSearchScreenState();
}

class _NBSearchScreenState extends State<NBSearchScreen> {
  List<NewsModel> list = getBloombergList();

  List<NewsModel> hotPostList = hotPosts();
  List<Channel> newsChannelList = newsChannels();
  bool _visible = false;
  bool _visibleIcon = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldSecondaryDark),
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: _visibleIcon,
              child: Text('Search', style: boldTextStyle()),
            ),
            Expanded(
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Visibility(
                      visible: _visibleIcon,
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            _visible = !_visible;
                            _visibleIcon = !_visibleIcon;
                          });
                        },
                        icon: Icon(Icons.search, color: appStore.isDarkModeOn ? white : black),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: _visible,
                    child: Container(
                      height: 30,
                      child: TextFormField(
                        decoration: InputDecoration(border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
                        keyboardType: TextInputType.text,
                        onEditingComplete: () {
                          setState(() {
                            _visibleIcon = !_visibleIcon;
                            _visible = !_visible;
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Searching...')));
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            16.height,
            Text('World Top Channel', style: boldTextStyle()).paddingOnly(left: 16),
            8.height,
            Container(
              padding: EdgeInsets.only(left: 8, right: 8),
              height: 120,
              child: ListView.builder(
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
                        child: commonCachedNetworkImage(news.img!, fit: BoxFit.cover, height: 70, width: 80),
                      ).cornerRadiusWithClipRRect(35),
                      8.height,
                      Text(news.name!, style: boldTextStyle()),
                    ],
                  ).onTap(() {
                    news.newsChannel!.launch(context);
                  }, highlightColor: white, hoverColor: white).paddingOnly(left: 8, right: 8, top: 8, bottom: 8);
                },
              ),
            ),
            Divider(height: 2, color: grey),
            16.height,
            Text('Popular Tags', style: boldTextStyle()).paddingOnly(left: 16, right: 16),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                ...list.map((e) {
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationRoundedWithShadow(10, backgroundColor: context.cardColor),
                    child: Text(e.title!, style: primaryTextStyle()),
                  );
                }).toList()
              ],
            ).paddingOnly(left: 16, right: 16),
            16.height,
            Divider(height: 2, color: grey),
            16.height,
            Text('Hot Posts', style: boldTextStyle()).paddingOnly(left: 16),
            16.height,
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: hotPostList.map((data) {
                return Container(
                  width: context.width() * 0.5 - 24,
                  child: Column(
                    children: [
                      Hero(
                        tag: data.tag!,
                        child: commonCachedNetworkImage(data.img!, fit: BoxFit.cover, height: 150).cornerRadiusWithClipRRect(10),
                      ),
                      8.height,
                      Text(data.subTitle!, style: boldTextStyle(size: 14), overflow: TextOverflow.ellipsis, maxLines: 2),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(data.type!, style: secondaryTextStyle(color: primaryColor)),
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
                  ),
                ).onTap(() {
                  NBNewsDetailsScreen(data: data).launch(context);
                }, highlightColor: appStore.isDarkModeOn ? black : white, splashColor: white);
              }).toList(),
            ).paddingOnly(left: 16, right: 16),
          ],
        ),
      ),
    );
  }
}
