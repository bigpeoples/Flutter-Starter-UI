import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mighty_ui_kit/apps/taskManagement/store/TMAppStore.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import 'TMWalkThroughScreen.dart';

TMAppStore tmAppStore = TMAppStore();

class TMSplashScreen extends StatefulWidget {
  static String tag = '/TMSplashScreen';

  @override
  TMSplashScreenState createState() => TMSplashScreenState();
}

class TMSplashScreenState extends State<TMSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    setStatusBarColor(Colors.transparent);
    await 2.seconds.delay;
    finish(context);
    TMWalkThroughScreen().launch(context);
  }

  @override
  void dispose() {
    // setStatusBarColor(context.scaffoldBackgroundColor);

    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        decoration: boxDecorationWithRoundedCorners(
          borderRadius: radius(0),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5],
            colors: [
              appStore.isDarkModeOn ? context.scaffoldBackgroundColor : tmPrimaryColor,
              appStore.isDarkModeOn ? context.scaffoldBackgroundColor : tmSecondaryColor,
            ],
          ),
        ),
        child: Text('Helio', style: GoogleFonts.pacifico(fontSize: 48, color: white)),
      ),
    );
  }
}
