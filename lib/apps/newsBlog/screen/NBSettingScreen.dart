import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBDataProviders.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class NBSettingScreen extends StatefulWidget {
  @override
  _NBSettingScreenState createState() => _NBSettingScreenState();
}

class _NBSettingScreenState extends State<NBSettingScreen> {
  List<NewsModel> list = settingDataList();

  @override
  Widget build(BuildContext context) {
    List<Category> _dateTimeFormatList = dateTimeFormat();
    Category? selectedFormat;
    return Scaffold(
      appBar: appBarWidget(
        'Settings',
        titleTextStyle: boldTextStyle(),
        color: appStore.isDarkModeOn ? scaffoldSecondaryDark : appBarBackgroundColor,
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Change Time Format', style: primaryTextStyle()),
              DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: selectedFormat,
                  onChanged: (Category? value) {
                    setState(() {
                      selectedFormat = value;
                    });
                  },
                  hint: Text('Select Format', style: secondaryTextStyle()),
                  items: _dateTimeFormatList.map((Category data) {
                    return DropdownMenuItem<Category>(value: data, child: Container(height: 20, child: Text(data.title!)));
                  }).toList(),
                ),
              ),
            ],
          ).paddingAll(16),
          Divider(height: 2, color: grey),
          ...list.map((e) {
            return Column(
              children: [
                Row(
                  children: [
                    e.icon!,
                    16.width,
                    Text(e.title!, style: primaryTextStyle()),
                  ],
                ).paddingOnly(left: 16, top: 16, bottom: 16).onTap(() {
                  e.widget != null ? e.widget!.launch(context) : SizedBox();
                }),
                Divider(height: 2, color: grey)
              ],
            );
          }).toList()
        ],
      ),
    );
  }
}
