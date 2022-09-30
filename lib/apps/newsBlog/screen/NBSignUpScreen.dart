import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBSignInScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/NBWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class NBSignUpScreen extends StatefulWidget {
  @override
  _NBSignUpScreenState createState() => _NBSignUpScreenState();
}

class _NBSignUpScreenState extends State<NBSignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              32.height,
              Column(
                children: [
                  Text('Sign up', style: boldTextStyle(size: 22)),
                  16.height,
                  AppTextField(textFieldType: TextFieldType.NAME, decoration: buildInputDecoration('Name')),
                  16.height,
                  AppTextField(textFieldType: TextFieldType.EMAIL, decoration: buildInputDecoration('Email')),
                  16.height,
                  AppTextField(textFieldType: TextFieldType.PASSWORD, decoration: buildInputDecoration('Password')),
                  16.height,
                  AppButton(
                    width: context.width(),
                    color: primaryColor,
                    text: 'Create an account',
                    textStyle: boldTextStyle(color: white),
                    onTap: () {
                      finish(context);
                      NBSignInScreen().launch(context);
                    },
                  ),
                  16.height,
                  Text('By signing up you agree to our', style: primaryTextStyle()),
                  Text('Terms and Condition Of Use', style: secondaryTextStyle(color: primaryColor)),
                ],
              ),
              32.height,
              Text('Or sign in with social networks ', style: primaryTextStyle()),
              16.height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  socialList(icon: Icon(AntDesign.twitter)),
                  socialList(icon: Icon(AntDesign.google)),
                  socialList(icon: Icon(AntDesign.facebook_square)),
                ],
              ),
              24.height,
              AppButton(
                width: context.width(),
                color: primaryColor,
                text: 'I have an account',
                textStyle: boldTextStyle(color: white),
                onTap: () {
                  finish(context);
                  NBSignInScreen().launch(context);
                },
              ),
            ],
          ).paddingOnly(left: 16, right: 16),
        ),
      ),
    );
  }
}
