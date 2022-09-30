import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';
import 'package:nb_utils/nb_utils.dart';

class YGAccountScreen extends StatefulWidget {
  @override
  _YGAccountScreenState createState() => _YGAccountScreenState();
}

class _YGAccountScreenState extends State<YGAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Edit Profile', center: true, showBack: true, color: context.scaffoldBackgroundColor),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(yg_food, height: 120, width: 120, fit: BoxFit.cover).cornerRadiusWithClipRRect(60),
          16.height,
          Text("Edit Picture", style: secondaryTextStyle(color: Colors.blue)),
          16.height,
          userDetail(text: 'Name : ', value: "Carly Mary"),
          8.height,
          Divider(),
          8.height,
          userDetail(text: "Email Id: ", value: "carlymary@gmail.com"),
          8.height,
          Divider(),
          8.height,
          userDetail(text: "Phone No: ", value: "1234567890")
        ],
      ).paddingAll(16),
    );
  }

  Widget userDetail({required String text, required String value}) {
    return Row(
      children: [
        Text(text, style: boldTextStyle()),
        Text(value, style: secondaryTextStyle()),
      ],
    );
  }
}
