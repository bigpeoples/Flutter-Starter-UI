import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:nb_utils/nb_utils.dart';

import 'YGDashBordScreen.dart';

class YGConnectEmailAddressScreen extends StatefulWidget {
  const YGConnectEmailAddressScreen({Key? key}) : super(key: key);

  @override
  _YGConnectEmailAddressScreenState createState() => _YGConnectEmailAddressScreenState();
}

class _YGConnectEmailAddressScreenState extends State<YGConnectEmailAddressScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
      appBar: appBarWidget(
        '',
        elevation: 0,
        color: Colors.transparent,
        backWidget: Icon(Icons.clear, color: context.iconColor).onTap(() {
          finish(context);
        }),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Connect Email Address', style: boldTextStyle(size: 24, color: yg_primaryColor)),
            16.height,
            Text('Its recommended to connect your email address for us to better protect your information', style: primaryTextStyle()),
            16.height,
            AppTextField(
              controller: emailController,
              textFieldType: TextFieldType.EMAIL,
              autoFocus: true,
              decoration: InputDecoration(labelText: 'Your Email', labelStyle: TextStyle(fontSize: 18)),
            ),
            16.height,
            AppTextField(
              controller: passwordController,
              textFieldType: TextFieldType.PASSWORD,
              decoration: InputDecoration(labelText: 'Your Password', labelStyle: TextStyle(fontSize: 18)),
            ),
            42.height,
            MaterialButton(
              height: 45,
              minWidth: context.width(),
              color: yg_primaryColor,
              child: Text('confirm'.toUpperCase(), style: primaryTextStyle(color: white)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
              onPressed: () {
                YGDashBordScreen().launch(context);
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: Text('Skip', style: boldTextStyle(), textAlign: TextAlign.end).onTap(
        () {
          YGDashBordScreen().launch(context);
        },
      ).paddingOnly(right: 22, bottom: 22),
    );
  }
}
