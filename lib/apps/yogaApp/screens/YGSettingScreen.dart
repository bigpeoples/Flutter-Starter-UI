import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGDashBordScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class YGSettingScreen extends StatefulWidget {
  const YGSettingScreen({Key? key}) : super(key: key);

  @override
  _YGSettingScreenState createState() => _YGSettingScreenState();
}

class _YGSettingScreenState extends State<YGSettingScreen> {
  showAlertDialog(BuildContext context) {
    Widget cancelButton = Text("Cancel", style: boldTextStyle()).onTap(() {
      finish(context);
    });
    Widget okButton = Text("Ok", style: boldTextStyle()).onTap(() {
      YGDashBordScreen().launch(context, isNewTask: true);
    });
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      content: Text("Are you sure want to logout?", style: boldTextStyle()),
      actions: [
        cancelButton,
        8.width,
        okButton,
        8.width,
      ],
    );
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  @override
  void dispose() {
    super.dispose();
    setStatusBarColor(Colors.transparent);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Settings', center: true, showBack: true, color: context.scaffoldBackgroundColor),
      body: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        separatorBuilder: (context, index) => Divider(height: 0),
        itemCount: settingDataList.length,
        itemBuilder: (context, index) {
          return SettingItemWidget(
            onTap: () {
              if (settingDataList[index].page != null) settingDataList[index].page.launch(context);
            },
            // padding: EdgeInsets.zero,
            title: settingDataList[index].text.toString(),
            leading: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(color: settingDataList[index].color, borderRadius: BorderRadius.circular(8)),
              padding: EdgeInsets.all(8),
              child: Image.asset(settingDataList[index].url.toString(), color: Colors.white),
            ),
            trailing: Icon(Icons.arrow_forward_ios, size: 20, color: context.iconColor),
          );
        },
      ),
      bottomNavigationBar: MaterialButton(
        height: 45,
        color: yg_primaryColor,
        child: Text('Logout'.toUpperCase(), style: primaryTextStyle(color: white)),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        onPressed: () {
          showAlertDialog(context);
        },
      ).paddingAll(16),
    );
  }
}
