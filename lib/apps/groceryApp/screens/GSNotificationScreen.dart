import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/model/GSModel.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSDataProvider.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class GSNotificationScreen extends StatefulWidget {
  static String tag = '/GSNotificationScreen';

  @override
  GSNotificationScreenState createState() => GSNotificationScreenState();
}

class GSNotificationScreenState extends State<GSNotificationScreen> {
  List<GSNotificationModel> notificationList = getNotificationList();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: gsStatusBarWithTitle(context, "Notification") as PreferredSizeWidget?,
      body: ListView.separated(
        separatorBuilder: (_, i) => Divider(),
        shrinkWrap: true,
        reverse: true,
        physics: ClampingScrollPhysics(),
        itemCount: notificationList.length,
        padding: EdgeInsets.all(16),
        itemBuilder: (_, index) {
          GSNotificationModel mData = notificationList[index];
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(mData.heading!, style: boldTextStyle(size: 12, color: Colors.orangeAccent)),
              8.height,
              Text(mData.title!, style: primaryTextStyle()),
              4.height,
              Text(mData.subTitle!, style: secondaryTextStyle()),
            ],
          );
        },
      ),
    );
  }
}
