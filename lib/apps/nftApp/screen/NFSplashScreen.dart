import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mighty_ui_kit/apps/nftApp/screen/WalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/main.dart';

Color nftTextPrimaryColorGlobal = NftTextPrimaryColor;
Color nfTextSecondaryColorGlobal = nftTextSecondaryColor;

class NFSplashScreen extends StatefulWidget {
  @override
  NFSplashScreenState createState() => NFSplashScreenState();
}

class NFSplashScreenState extends State<NFSplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (_) => WalkThroughScreen()));

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: appStore.isDarkModeOn ? scaffoldColorDark : scaffoldBackgroundColor,
        statusBarBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
        statusBarIconBrightness: appStore.isDarkModeOn ? Brightness.light : Brightness.dark,
      ),
    );
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldBackgroundColor,
      body: Center(
        child: Image.asset('images/nft/ic_logo.png', height: 150, width: 150, fit: BoxFit.contain),
      ),
    );
  }
}
