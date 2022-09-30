import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBDashboardScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

class NBSignInScreen extends StatefulWidget {
  @override
  _NBSignInScreenState createState() => _NBSignInScreenState();
}

class _NBSignInScreenState extends State<NBSignInScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              32.height,
              Container(
                padding: EdgeInsets.all(8),
                height: 90,
                width: 90,
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(45),
                  boxShadow: [
                    BoxShadow(color: black),
                  ],
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/newsblog/fireLogo.jpg'),
                ),
              ),
              8.height,
              Text('Sector', style: boldTextStyle(size: 20)),
              4.height,
              Text('news', style: primaryTextStyle()),
              24.height,
              AppTextField(textFieldType: TextFieldType.EMAIL, decoration: buildInputDecoration('Email')),
              16.height,
              AppTextField(textFieldType: TextFieldType.PASSWORD, decoration: buildInputDecoration('password')),
              16.height,
              Row(
                children: [
                  AppButton(
                      color: appStore.isDarkModeOn ? cardDarkColor: blackColor.withOpacity(0.7),
                      text: 'Sign up',
                      textStyle: boldTextStyle(color: white),
                      onTap: () {
                        finish(context);
                        NBSignUpScreen().launch(context);
                      }).expand(),
                  8.width,
                  AppButton(
                      color: primaryColor,
                      text: 'Sign in',
                      textStyle: boldTextStyle(color: white),
                      onTap: () {
                        finish(context);
                        NBDashboardScreen().launch(context);
                      }).expand(),
                ],
              ),
              16.height,
              Text('Forgot password?', style: primaryTextStyle(color: primaryColor)),
              32.height,
              Text('Or sign in with social networks ', style: primaryTextStyle()),
              16.height,
              Row(
                children: [
                  socialList(icon: Icon(AntDesign.twitter)),
                  socialList(icon: Icon(AntDesign.google)),
                  socialList(icon: Icon(AntDesign.facebook_square)),
                ],
              ),
              32.height,
              AppButton(
                width: context.width(),
                text: 'Sign up',
                textStyle: boldTextStyle(color: white),
                color: primaryColor,
                onTap: () {
                      finish(context);
                     NBSignUpScreen().launch(context);
                },
              ),
            ],
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
