import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mighty_ui_kit/main/screens/AppSplashScreen.dart';
import 'package:mighty_ui_kit/main/store/AppStore.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import 'main/screens/AppSplashScreen.dart';

AppStore appStore = AppStore();
FirebaseAuth auth = FirebaseAuth.instance;
RemoteConfig? remoteConfig;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (isMobile) {
    await Firebase.initializeApp().then((value) {
      MobileAds.instance.initialize();
    });
    OneSignal.shared.setAppId(OneSignalId);
  }

  setOrientationPortrait();

  await initialize();
  appStore.toggleDarkMode(value: getBoolAsync(DarkModePref));
  appStore.setLoggedIn(getBoolAsync(IsLoggedInSocialLogin));

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.light,
          fontFamily: GoogleFonts.poppins().fontFamily,
          accentColor: appPrimaryColor,
          indicatorColor: appPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          iconTheme: IconThemeData(color: scaffoldSecondaryDark),
          dialogBackgroundColor: Colors.white,
          dialogTheme: DialogTheme(backgroundColor: Colors.white),
          floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.white),
        ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        darkTheme: ThemeData(
          primaryColor: Colors.white,
          brightness: Brightness.dark,
          fontFamily: GoogleFonts.poppins().fontFamily,
          accentColor: appPrimaryColor,
          indicatorColor: appPrimaryColor,
          scaffoldBackgroundColor: scaffoldColorDark,
          iconTheme: IconThemeData(color: Colors.white),
          dialogBackgroundColor: scaffoldColorDark,
          dialogTheme: DialogTheme(backgroundColor: scaffoldColorDark),
          floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: scaffoldSecondaryDark),
        ).copyWith(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: OpenUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        themeMode: appStore.isDarkModeOn ? ThemeMode.dark : ThemeMode.light,
        home: AppSplashScreen(),
        builder: scrollBehaviour(),
      ),
    );
  }
}
