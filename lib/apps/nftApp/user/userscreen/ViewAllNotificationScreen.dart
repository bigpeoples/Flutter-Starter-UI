import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class ViewAllNotificationScreen extends StatefulWidget {
  @override
  ViewAllNotificationScreenState createState() => ViewAllNotificationScreenState();
}

class ViewAllNotificationScreenState extends State<ViewAllNotificationScreen> {
  List<NftAppModel> list = getNotificationData();

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
      body: ListView.separated(
        separatorBuilder: (_, index) {
          return Divider(color: Colors.grey, thickness: 1);
        },
        padding: EdgeInsets.all(16),
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: list.length,
        itemBuilder: (_, index) {
          print(list.length - 1);
          NftAppModel data = list[index];

          return Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(data.img!, fit: BoxFit.cover, height: 50, width: 50),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(data.title!, style: boldTextStyle(), maxLines: 1),
                        SizedBox(height: 4),
                        Text(data.subTitle!, style: secondaryTextStyle()),
                        SizedBox(height: 4),
                        Text(data.description!, style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
