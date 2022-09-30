import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMDashBoardScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMForgotPasswordScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMSignUpScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMImages.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMSignInScreen extends StatefulWidget {
  static String tag = '/TMSignInScreen';

  @override
  TMSignInScreenState createState() => TMSignInScreenState();
}

class TMSignInScreenState extends State<TMSignInScreen> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();

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
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Helio', textDirection: TextDirection.ltr, style: GoogleFonts.pacifico(fontSize: 48)),
            socialButton(context, image: tm_google, socialTitle: "Sign in with google", color: context.cardColor),
            socialButton(context, image: tm_facebook, socialTitle: "Sign in with Facebook", color: tmBlue, textColor: white),
            32.height,
            Container(
              decoration: boxDecorationWithRoundedCorners(
                boxShadow: defaultBoxShadow(),
                backgroundColor: context.cardColor,
              ),
              padding: EdgeInsets.all(16),
              child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                key: _formKey,
                child: Column(
                  children: [
                    AppTextField(
                      textFieldType: TextFieldType.EMAIL,
                      controller: emailController,
                      decoration: TMInputDecoration(context, borderColor: context.dividerColor, hintText: "Email"),
                    ),
                    8.height,
                    AppTextField(
                      textFieldType: TextFieldType.PASSWORD,
                      controller: passWordController,
                      decoration: TMInputDecoration(context, borderColor: context.dividerColor, hintText: "Password"),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        child: Text('Forgot Password?', style: boldTextStyle(size: 14, color: tmSecondaryColor)),
                        onPressed: () {
                          TMForgotPasswordScreen().launch(context);
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            16.height,
            tmButton(
              context,
              width: context.width(),
              value: "Sign In",
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  TMDashBoardScreen().launch(context, isNewTask: true);
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
                      TMSignUpScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Slide);
                    },
                    child: Text('Sign up', style: boldTextStyle()),
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
