import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:nb_utils/nb_utils.dart';

class OtpSignInScreen extends StatefulWidget {
  static String tag = '/OtpSignInScreen';

  final User? user;

  OtpSignInScreen({this.user});

  @override
  OtpSignInScreenState createState() => OtpSignInScreenState();
}

class OtpSignInScreenState extends State<OtpSignInScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarScroller(
        title: '',
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Logged in successfully", style: secondaryTextStyle(color: Colors.lightBlue, size: 32)),
            16.height,
            Text("${widget.user!.phoneNumber}", style: primaryTextStyle(color: Colors.grey)),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
