import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppCommon.dart';
import 'package:nb_utils/nb_utils.dart';

class URLLauncherScreen extends StatefulWidget {
  static String tag = '/URLLauncherScreen';

  @override
  URLLauncherScreenState createState() => URLLauncherScreenState();
}

class URLLauncherScreenState extends State<URLLauncherScreen> {
  String phone = '';
  String email = "john@gmail.com";

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
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            urlLauncherButton("Call", onTap: () {
              launchURL('tel:$phone');
            }),
            urlLauncherButton("Mail", onTap: () {
              launchURL('mailto:$email');
            }),
            urlLauncherButton("SMS", onTap: () {
              launchURL('sms:+39 348 060 888?body=hello%20how are you?');
            }),
            urlLauncherButton("Youtube", onTap: () {
              launchURL('https://www.youtube.com');
            }),
          ],
        ).center(),
      ),
    );
  }

  Widget urlLauncherButton(String title, {Function? onTap}) {
    return AppButton(
      color: appStore.cardColor,
      text: title,
      textStyle: boldTextStyle(),
      onTap: onTap,
      padding: EdgeInsets.only(left: 30, right: 30, top: 8, bottom: 8),
      shapeBorder: dialogShape(),
    ).paddingBottom(8);
  }
}
