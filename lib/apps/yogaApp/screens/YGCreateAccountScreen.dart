import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGConnectEmailAddressScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGCommonButton.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';
import 'package:nb_utils/nb_utils.dart';

class YGCreateAccountScreen extends StatefulWidget {
  const YGCreateAccountScreen({Key? key}) : super(key: key);

  @override
  _YGCreateAccountScreenState createState() => _YGCreateAccountScreenState();
}

class _YGCreateAccountScreenState extends State<YGCreateAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('', showBack: true, elevation: 0, color: context.scaffoldBackgroundColor),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: [
            Image.asset(yg_createAccount2, fit: BoxFit.fill, height: 300, width: 300),
            10.height,
            Text('Change starts here', style: boldTextStyle(size: 24, color: yg_primaryColor)),
            8.height,
            Text('Save your progress to access your personal training program', style: primaryTextStyle(), textAlign: TextAlign.center),
            16.height,
            commonButton(
              title: 'EMAIL',
              color: yg_primaryColor,
              textColor: Colors.white,
              context: context,
              dara: YGConnectEmailAddressScreen(),
              imgColor: Colors.white,
              image: yg_email,
            ),
            commonButton(
              title: 'FACEBOOK',
              color: yg_FacebookColor,
              textColor: Colors.white,
              context: context,
              dara: YGConnectEmailAddressScreen(),
              image: yg_facebook,
              imgColor: Colors.white,
            ),
            commonButton(
              title: 'GOOGLE',
              color: Colors.white,
              textColor: Colors.black,
              context: context,
              image: yg_google,
              dara: YGConnectEmailAddressScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
