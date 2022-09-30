import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class DiscoverDetailScreen extends StatefulWidget {
  @override
  DiscoverDetailScreenState createState() => DiscoverDetailScreenState();
}

class DiscoverDetailScreenState extends State<DiscoverDetailScreen> {
  List<NftAppModel> list = getDisCoverList();

  int index = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldBackgroundColor,
      appBar: appBar(isBack: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text('Discover creator', style: boldTextStyle(size: 20)),
                  SizedBox(height: 16),
                  Text('Follow at least five creator \nto build your feed...', style: primaryTextStyle(), textAlign: TextAlign.center),
                ],
              ),
            ),
            SizedBox(height: 16),
            Row(
              children: list.map((e) {
                return InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    index = list.indexOf(e);
                    setState(() {});
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 8),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: index == list.indexOf(e) ? nftPrimaryColor : Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(16),
                      gradient: index == list.indexOf(e) ? linearGradient() : null,
                    ),
                    child: Text(
                      e.title!,
                      style: primaryTextStyle(
                          color: appStore.isDarkModeOn
                              ? null
                              : index == list.indexOf(e)
                                  ? Colors.white
                                  : Colors.black),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            Container(child: list[index].widget)
          ],
        ),
      ),
    );
  }
}
