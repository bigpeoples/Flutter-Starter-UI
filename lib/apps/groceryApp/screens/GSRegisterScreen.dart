import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSVerificationScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class GSRegisterScreen extends StatefulWidget {
  static String tag = '/GSRegisterScreen';

  @override
  GSRegisterScreenState createState() => GSRegisterScreenState();
}

class GSRegisterScreenState extends State<GSRegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  FocusNode emailNode = FocusNode();
  FocusNode firstNameNode = FocusNode();
  FocusNode lastNameNode = FocusNode();
  FocusNode phoneNode = FocusNode();
  FocusNode passwordNode = FocusNode();
  FocusNode confirmPasswordNode = FocusNode();
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
    setStatusBarColor(appStore.isDarkModeOn ? scaffoldColorDark : gs_primary_color, statusBarIconBrightness: Brightness.dark);
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: appBarWidget('', color: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Register", style: boldTextStyle(size: 20)),
            16.height,
            Row(
              children: [
                Container(
                  width: context.width(),
                  height: 50,
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: radius(4),
                    backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.black,
                  ),
                  child: commonCacheImageWidget(gs_apple_icon, 24, width: 24),
                ).expand(),
                8.width,
                Container(
                  width: context.width(),
                  height: 50,
                  decoration: boxDecorationWithRoundedCorners(
                    borderRadius: radius(4),
                    border: Border.all(color: Colors.grey[300]!),
                  ),
                  child: Image.asset(gs_google_icon, height: 24, width: 24),
                ).expand()
              ],
            ),
            16.height,
            Form(
              key: formKey,
              child: Column(
                children: [
                  AppTextField(
                    autoFocus: false,
                    controller: emailController,
                    textFieldType: TextFieldType.EMAIL,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
                      labelText: 'Email Address',
                      labelStyle: secondaryTextStyle(size: 14),
                    ),
                    focus: emailNode,
                    nextFocus: firstNameNode,
                    keyboardType: TextInputType.text,
                  ),
                  16.height,
                  AppTextField(
                    autoFocus: false,
                    controller: firstNameController,
                    textFieldType: TextFieldType.NAME,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
                      labelText: 'First Name',
                      labelStyle: secondaryTextStyle(size: 14),
                    ),
                    focus: firstNameNode,
                    nextFocus: lastNameNode,
                    keyboardType: TextInputType.text,
                  ),
                  16.height,
                  AppTextField(
                    autoFocus: false,
                    controller: lastNameController,
                    textFieldType: TextFieldType.NAME,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
                      labelText: 'Last Name',
                      labelStyle: secondaryTextStyle(size: 14),
                    ),
                    focus: lastNameNode,
                    nextFocus: phoneNode,
                    keyboardType: TextInputType.text,
                  ),
                  20.height,
                  Row(
                    children: [
                      CountryCodePicker(
                        onChanged: print,
                        initialSelection: 'IT',
                        favorite: ['+39', 'FR'],
                        showCountryOnly: false,
                        showOnlyCountryWhenClosed: false,
                        alignLeft: false,
                      ),
                      AppTextField(
                        autoFocus: false,
                        controller: phoneController,
                        textFieldType: TextFieldType.PHONE,
                        focus: phoneNode,
                        nextFocus: passwordNode,
                        textAlign: TextAlign.start,
                        keyboardType: TextInputType.phone,
                        decoration: InputDecoration(
                          enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: grey)),
                          focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
                          hintText: "000 0000 0000",
                          hintStyle: secondaryTextStyle(size: 14),
                        ),
                      ).expand()
                    ],
                  ),
                  16.height,
                  TextFormField(
                    controller: passwordController,
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
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: grey)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
                      labelStyle: secondaryTextStyle(size: 14),
                      labelText: "Password",
                    ),
                    validator: (val) {
                      if (val.isEmptyOrNull) {
                        return "Please enter password";
                      }
                      return null;
                    },
                  ),
                  16.height,
                  TextFormField(
                    controller: confirmPasswordController,
                    focusNode: confirmPasswordNode,
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
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: grey)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
                      labelStyle: secondaryTextStyle(size: 14),
                      labelText: "Confirm Password",
                    ),
                    validator: (val) {
                      if (val.isEmptyOrNull) {
                        return "Please enter confirm password";
                      }
                      if (passwordController.text != confirmPasswordController.text) {
                        return "Password do not match";
                      }
                      return null;
                    },
                  ),
                  50.height,
                  gsAppButton(
                    context,
                    'Create Account',
                    () {
                      GSVerificationScreen().launch(context);
                    },
                  ),
                ],
              ),
            ),
            16.height,
          ],
        ).paddingAll(16),
      ),
    );
  }
}
