import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/components/AppStackLoader.dart';
import 'package:mighty_ui_kit/main/services/LoginService.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

class GoogleSignInScreen extends StatefulWidget {
  static String tag = '/GoogleSignInScreen';

  @override
  GoogleSignInScreenState createState() => GoogleSignInScreenState();
}

final GoogleSignIn googleSignIn = GoogleSignIn();

class GoogleSignInScreenState extends State<GoogleSignInScreen> {
  bool mIsLoading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return AppStackLoader(
      visible: mIsLoading,
      child: Column(
        children: [
          16.height,
          getBoolAsync(IsLoggedInSocialLogin)
              ? Column(
                  children: [
                    Image.network(
                      getStringAsync('photo'),
                      fit: BoxFit.cover,
                      height: 100,
                    ).cornerRadiusWithClipRRect(50),
                    16.height,
                    Text(getStringAsync('name'), style: primaryTextStyle()),
                    4.height,
                    Text(getStringAsync('email'), style: secondaryTextStyle()),
                  ],
                )
              : SizedBox(),
          16.height,
          AppButton(
            onTap: () async {
              if (getBoolAsync(IsLoggedInSocialLogin)) {
                await logout();

                setState(() {});
              } else {
                login();
              }
            },
            text: getBoolAsync(IsLoggedInSocialLogin) ? 'Sign Out' : 'Sign In',
            textStyle: primaryTextStyle(),
            color: appStore.cardColor,
          ),
        ],
      ).center(),
    );
  }

  Future<void> login() async {
    mIsLoading = true;
    setState(() {});

    await signInWithGoogle().then((value) {
      //
    }).catchError((e) {
      toast(e);
    });

    mIsLoading = false;
    setState(() {});
  }
}
