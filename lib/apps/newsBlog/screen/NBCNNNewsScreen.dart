import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import 'NBNewsDetailsScreen.dart';

class NBCNNNewsScreen extends StatefulWidget {
  @override
  _NBCNNNewsScreenState createState() => _NBCNNNewsScreenState();
}

class _NBCNNNewsScreenState extends State<NBCNNNewsScreen> {
  bool mISCheck = false;

  List<NewsModel> listCNNNews = newsListCNNBig();
  List<NewsModel> listCNNNewsSmall = newsListCNNSmall();
  int n = 0;
  int i = 1;
  final GlobalKey listCNNKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'CNN News',
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
          children: listCNNNews.map((data) {
            return Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Hero(
                      tag: data.tag!,
                      child: commonCachedNetworkImage(data.img!, fit: BoxFit.cover, height: 250,width: context.width()).cornerRadiusWithClipRRect(10),
                    ),
                    8.height,
                    Text(data.subTitle!, style: boldTextStyle()),
                    8.height,
                    Row(
                      children: [
                        Text(data.type!, style: primaryTextStyle(color: primaryColor)),
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
                ).onTap(() {
                  NBNewsDetailsScreen(data: data).launch(context);
                }),
                Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: listCNNNewsSmall.sublist(n, i).map((data) {
                    if (i == listCNNNewsSmall.length || n == listCNNNewsSmall.length - 1) {
                      i = i;
                      n = n;
                    } else {
                      i++;
                      n++;
                    }
                    return Row(
                      children: [
                        Hero(
                          tag: data.tag!,
                          child: commonCachedNetworkImage(data.img!, fit: BoxFit.cover, height: 120, width: 150).cornerRadiusWithClipRRect(10),
                        ),
                        8.width,
                        Column(
                          children: [
                            Text(data.subTitle!, style: boldTextStyle(size: 15)),
                            Row(
                              children: [
                                Text(data.type!, style: primaryTextStyle(color: primaryColor)),
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
                        8.height,
                      ],
                    ).paddingOnly(bottom: 8).onTap(() {
                      NBNewsDetailsScreen(data: data).launch(context);
                    });
                  }).toList(),
                ),
              ],
            );
          }).toList(),
        ).paddingAll(16),
      ),
    );
  }
}
