import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWAlertDialogScreen extends StatefulWidget {
  static String tag = '/MWAlertDialogScreen';

  @override
  MWAlertDialogScreenState createState() => MWAlertDialogScreenState();
}

class MWAlertDialogScreenState extends State<MWAlertDialogScreen> {
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

  List<AppModel> example = [
    AppModel(title: 'Simple Alert Dialog'),
    AppModel(title: 'Confirmation Alert Dialog with Action Button'),
    AppModel(title: 'Alert Dialog with Shape'),
    AppModel(title: 'Warning Alert Dialog'),
  ];

  @override
  Widget build(BuildContext context) {
    AlertDialog mAlertItem1 = AlertDialog(
      backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
      title: Text("Alert Title", style: boldTextStyle(color: appStore.isDarkModeOn ? appBarBackgroundColor : textPrimaryColor)),
      content: Text("Alert Message", style: secondaryTextStyle(color: appStore.isDarkModeOn ? gray : textSecondaryColor)),
      actions: [],
    );

    AlertDialog mAlertItem2 = AlertDialog(
      backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
      title: Text("Confirmation", style: boldTextStyle(color: appStore.isDarkModeOn ? appBarBackgroundColor : textPrimaryColor)),
      content: Text("Are you sure you want to logout?", style: secondaryTextStyle(color: appStore.isDarkModeOn ? gray : textSecondaryColor)),
      actions: [
        TextButton(
          child: Text("Yes", style: primaryTextStyle(color: appPrimaryColor)),
          onPressed: () {
            finish(context);
          },
        ),
        TextButton(
          child: Text("No", style: primaryTextStyle(color: appPrimaryColor)),
          onPressed: () {
            finish(context);
          },
        ),
      ],
    );

    AlertDialog mAlertItem3 = AlertDialog(
      backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hold On", style: boldTextStyle(color: appStore.isDarkModeOn ? appBarBackgroundColor : textPrimaryColor)),
          16.height,
          Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: secondaryTextStyle(color: appStore.isDarkModeOn ? gray : textSecondaryColor)),
          16.height,
          GestureDetector(
            onTap: () {
              finish(context);
            },
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: boxDecoration(bgColor: appPrimaryColor, radius: 10),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text("Ok", style: primaryTextStyle(color: Colors.white)),
              ),
            ),
          )
        ],
      ),
      contentPadding: EdgeInsets.fromLTRB(16, 16, 16, 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50), bottomLeft: Radius.circular(50))),
    );

    AlertDialog mAlertItem4 = AlertDialog(
      backgroundColor: appStore.isDarkModeOn ? appStore.cardColor : appBarBackgroundColor,
      content: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(height: 120, color: appPrimaryColor),
                Column(
                  children: [
                    Icon(Icons.warning, color: white, size: 32),
                    8.height,
                    Text('OOPs...', textAlign: TextAlign.center, style: boldTextStyle(color: white, size: 18)),
                  ],
                )
              ],
            ),
            30.height,
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Text("Something Went Wrong", style: secondaryTextStyle()),
            ),
            16.height,
            GestureDetector(
              onTap: () {
                finish(context);
              },
              child: Container(
                decoration: boxDecoration(bgColor: appPrimaryColor, radius: 10),
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text("Try again", style: primaryTextStyle(color: Colors.white)),
              ),
            ),
            16.height,
          ],
        ),
      ),
      contentPadding: EdgeInsets.all(0),
    );

    return Scaffold(
      body: ListView.builder(
        itemCount: example.length,
        itemBuilder: (BuildContext context, index) {
          return ExampleItemWidget(example[index], onTap: () {
            if (index == 0) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return mAlertItem1;
                },
              );
            } else if (index == 1) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return mAlertItem2;
                },
              );
            } else if (index == 2) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return mAlertItem3;
                },
              );
            } else if (index == 3) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return mAlertItem4;
                },
              );
            }
          });
        },
      ),
    );
  }
}
