import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class NBAccountFragment extends StatefulWidget {
  @override
  _NBAccountFragmentState createState() => _NBAccountFragmentState();
}

class _NBAccountFragmentState extends State<NBAccountFragment> {
  List<NewsModel> list = settingList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Account', center: true, showBack: false, color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor, actions: [
        Icon(Icons.edit, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldSecondaryDark).paddingOnly(right: 16),
      ]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            16.height,
            Container(
              padding: EdgeInsets.all(8),
              height: 120,
              width: 120,
              decoration: boxDecorationRoundedWithShadow(60),
              child: commonCachedNetworkImage('https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/gs.jpg',fit: BoxFit.cover,height: 100,width: 100).cornerRadiusWithClipRRect(50)
            ),
            16.height,
            Text('Goujou Satoru', style: boldTextStyle()),
            8.height,
            Text('@gojousatoru', style: primaryTextStyle()),
            16.height,
            AppButton(
              width: context.width(),
              text: 'Get Premium - 9.99/-',
              textStyle: boldTextStyle(color: white),
              color: primaryColor,
              onTap: () {},
            ).paddingOnly(left: 16, right: 16),
            8.height,
            ...list.map((e) {
              return SettingItemWidget(
                onTap: () {
                  e.widget != null ? e.widget.launch(context) : SizedBox();
                },
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 12, top: 12),
                title: e.title!,
                titleTextStyle: primaryTextStyle(),
                trailing: Row(
                  children: [
                    e.subTitle != null ? Text(e.subTitle!, style: secondaryTextStyle()) : SizedBox(),
                    8.width,
                    Icon(Icons.arrow_forward_ios, size: 16),
                  ],
                ),
              );
            }).toList(),
          ],
        ).paddingOnly(bottom: 16),
      ),
    );
  }
}
