import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../main.dart';


class ForgotPasswordScreen extends StatefulWidget {
  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            profileWidget(
                name: 'Email',
                iconData: Icon(Icons.mail_outline_outlined, color: Theme.of(context).iconTheme.color),
                icon: Icon(Icons.visibility_off_outlined, color: Theme.of(context).iconTheme.color),
                context: context),
            SizedBox(height: 16),
            AppButton(
              title: 'Send your Password',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
