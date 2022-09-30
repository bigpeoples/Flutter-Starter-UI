import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMSignInScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMForgotPasswordScreen extends StatefulWidget {
  static String tag = '/TMForgotPasswordScreen';

  @override
  TMForgotPasswordScreenState createState() => TMForgotPasswordScreenState();
}

class TMForgotPasswordScreenState extends State<TMForgotPasswordScreen> {
  TextEditingController emailCont = TextEditingController();

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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('images/toDoList/tm_forgotPassword.png', fit: BoxFit.cover, height: 350),
              Text('Forgot Password', style: boldTextStyle()),
              8.height,
              Text('Please enter your email address or phone \nnumber to reset your password', style: secondaryTextStyle(), textAlign: TextAlign.center),
              24.height,
              AppTextField(
                textFieldType: TextFieldType.EMAIL,
                controller: emailCont,
                decoration: TMInputDecoration(context, borderColor: context.dividerColor, hintText: "Email"),
              ).paddingSymmetric(horizontal: 16),
              16.height,
              tmButton(
                context,
                width: context.width(),
                value: "Send",
                onTap: () {
                  TMSignInScreen().launch(context);
                },
              ),
              TextButton(
                  onPressed: () {
                    hideKeyboard(context);
                    finish(context);
                  },
                  child: Text('Cancel', style: secondaryTextStyle(color: grey, size: 14)))
            ],
          ),
        ),
      ).center(),
    );
  }
}
