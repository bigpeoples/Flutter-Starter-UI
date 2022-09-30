import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class YGFriendsScreen extends StatefulWidget {
  const YGFriendsScreen({Key? key}) : super(key: key);

  @override
  _YGFriendsScreenState createState() => _YGFriendsScreenState();
}

class _YGFriendsScreenState extends State<YGFriendsScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Friend', showBack: true, color: context.scaffoldBackgroundColor, center: true),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: friendList.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: boxDecorationRoundedWithShadow(8, backgroundColor: context.cardColor),
            child: Row(
              children: [
                Image.asset(friendList[index].image!, height: 55, width: 55, fit: BoxFit.cover).cornerRadiusWithClipRRect(26),
                8.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(friendList[index].name!, style: boldTextStyle()),
                    Text(friendList[index].subtext!, style: secondaryTextStyle(size: 12)),
                  ],
                ).expand(),
                Container(
                  height: 30,
                  width: context.width() * 0.23,
                  decoration: boxDecorationRoundedWithShadow(16, backgroundColor: friendList[index].like! ? Colors.white : yg_primaryColor),
                  padding: EdgeInsets.all(4),
                  alignment: Alignment.center,
                  child: Text(
                    friendList[index].like! ? 'Following' : "Follow",
                    style: primaryTextStyle(color: friendList[index].like! ? yg_primaryColor : Colors.white),
                  ).onTap(
                    () {
                      friendList[index].like = !friendList[index].like!;
                      setState(() {});
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ).paddingAll(8),
    );
  }
}
