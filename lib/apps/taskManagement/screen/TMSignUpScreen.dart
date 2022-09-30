import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMImages.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import 'TMDashBoardScreen.dart';

class TMSignUpScreen extends StatefulWidget {
  static String tag = '/TMSignInScreen';

  @override
  TMSignUpScreenState createState() => TMSignUpScreenState();
}

class TMSignUpScreenState extends State<TMSignUpScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(
      appStore.isDarkModeOn ? context.scaffoldBackgroundColor : white,
      statusBarBrightness: Brightness.dark,
    );
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
        padding: EdgeInsets.only(right: 16, left: 16, bottom: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            32.height,
            Text(
              'Helio',
              style: GoogleFonts.pacifico(fontSize: 48),
            ),
            socialButton(
              context,
              image: tm_google,
              socialTitle: "Sign up with Gmail",
              color: context.cardColor,
            ),
            socialButton(
              context,
              image: tm_facebook,
              socialTitle: "Sign up with Facebook",
              color: tmBlue,
              textColor: white,
            ),
            32.height,
            Container(
              decoration: boxDecorationWithRoundedCorners(
                boxShadow: defaultBoxShadow(),
                backgroundColor: context.cardColor,
              ),
              padding: EdgeInsets.all(16),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  children: [
                    AppTextField(
                      controller: userNameController,
                      textFieldType: TextFieldType.NAME,
                      decoration: TMInputDecoration(context, hintText: "Username", borderColor: context.dividerColor),
                    ),
                    8.height,
                    AppTextField(
                      controller: emailController,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: TMInputDecoration(context, hintText: "Email", borderColor: context.dividerColor),
                    ),
                    8.height,
                    AppTextField(
                      controller: passwordController,
                      textFieldType: TextFieldType.PASSWORD,
                      decoration: TMInputDecoration(context, hintText: "Password", borderColor: context.dividerColor),
                    )
                  ],
                ),
              ),
            ),
            16.height,
            tmButton(
              context,
              width: context.width(),
              value: "Sign up",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  TMDashBoardScreen().launch(context);
                }
              },
            ),
            16.height,
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?", style: secondaryTextStyle(size: 14)),
                  0.width,
                  TextButton(
                    onPressed: () {
                      finish(context);
                    },
                    child: Text('Sign In', style: boldTextStyle()),
                  )
                ],
              ),
            ),
          ],
        ),
      ).center(),
    );
  }
}
