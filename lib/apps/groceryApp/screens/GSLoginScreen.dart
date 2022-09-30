import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSForgotPasswordScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSMainScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSRegisterScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class GSLoginScreen extends StatefulWidget {
  static String tag = '/GSLoginScreen';

  @override
  GSLoginScreenState createState() => GSLoginScreenState();
}

class GSLoginScreenState extends State<GSLoginScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  FocusNode emailNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldColorDark : Colors.white, statusBarIconBrightness: Brightness.dark);
  }

  @override
  void dispose() {
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldColorDark : Colors.white);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: appBarWidget('', color: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login to continue", style: boldTextStyle(size: 20)),
              16.height,
              Form(
                key: formKey,
                child: Column(
                  children: [
                    AppTextField(
                      controller: emailController,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: inputDecoration(label: "Email Address"),
                      focus: emailNode,
                      nextFocus: passwordNode,
                      keyboardType: TextInputType.text,
                    ),
                    16.height,
                    TextFormField(
                      focusNode: passwordNode,
                      autofocus: false,
                      obscureText: showPassword ? false : true,
                      onFieldSubmitted: (term) {
                        passwordNode.unfocus();
                      },
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        suffixIcon: GestureDetector(
                          onTap: () {
                            showPassword = !showPassword;
                            setState(() {});
                          },
                          child: Icon(showPassword ? Icons.visibility : Icons.visibility_off, color: gs_primary_color),
                        ),
                        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
                        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
                        labelStyle: secondaryTextStyle(size: 14),
                        labelText: "Password",
                      ),
                    ),
                  ],
                ),
              ),
              50.height,
              gsAppButton(
                context,
                'Login',
                () {
                  if (formKey.currentState!.validate()) {}
                  finish(context);
                  GSMainScreen().launch(context);
                },
              ),
              16.height,
              Align(
                alignment: Alignment.centerRight,
                child: Text("Forgot Password?", style: boldTextStyle(color: gs_primary_color, size: 14)).onTap(() {
                  GSForgotPasswordScreen().launch(context);
                }),
              ),
              30.height,
              createRichText(list: [
                TextSpan(text: "Don't have an account? ", style: secondaryTextStyle(size: 16)),
                TextSpan(
                  text: "Register",
                  style: boldTextStyle(color: gs_primary_color, size: 16),
                ),
              ]).center().onTap(() {
                GSRegisterScreen().launch(context);
              }),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
