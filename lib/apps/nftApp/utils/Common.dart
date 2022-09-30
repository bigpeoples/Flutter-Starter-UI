import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Constants.dart';

import '../../../main.dart';

InputDecoration buildInputDecoration({String? name, Widget? icon, Widget? suffixIcon}) {
  return InputDecoration(
    contentPadding: EdgeInsets.only(left: 16, top: 16, right: 8),
    labelText: name,
    prefixIcon: icon,
    suffixIcon: suffixIcon,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: Colors.grey, width: 0.5)),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: Colors.grey, width: 0.5)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: Colors.grey, width: 0.5)),
  );
}

Widget ContinueWidget({required String img, required String name}) {
  return Container(
    margin: EdgeInsets.only(top: 16),
    alignment: Alignment.center,
    padding: EdgeInsets.all(12),
    decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(16)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(img, height: 25, width: 25, fit: BoxFit.cover),
        SizedBox(width: 16),
        Text(name, style: boldTextStyle()),
      ],
    ),
  );
}

checkDialog({String? title, String? subTitle}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(title!, style: primaryTextStyle()),
      Text(subTitle!, style: boldTextStyle()),
    ],
  );
}

Widget settingWidget({String? name, IconData? icon, IconData? iconData, Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(width: 32),
          Expanded(
            child: Text(name!, style: primaryTextStyle(size: 15)),
          ),
          Icon(iconData),
        ],
      ),
    ),
  );
}

Widget DetailList({String? name, required BuildContext context}) {
  return Container(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.only(top: 8, bottom: 8),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).cardColor),
    child: Row(
      children: [
        Icon(Icons.add_circle_outline_outlined),
        SizedBox(width: 8),
        Expanded(
          child: Text(name!, style: boldTextStyle()),
        ),
        Icon(Icons.attach_email_outlined),
      ],
    ),
  );
}

Widget profileList({IconData? iconData, String? name, Function()? onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(width: 16),
          Text(name!, style: primaryTextStyle()),
        ],
      ),
    ),
  );
}

appBar({bool isBack = false}) {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: appStore.isDarkModeOn ? Colors.white70 : scaffoldColorDark),
    backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
    automaticallyImplyLeading: isBack,
    centerTitle: true,
    brightness: appStore.isDarkModeOn ? Brightness.dark : Brightness.light,
    title: Image.asset(appStore.isDarkModeOn ? 'images/nft/ic_app_logo_dark.png' : 'images/nft/ic_app_logo.png', fit: BoxFit.cover, width: 160),
  );
}

// Bold Text Style
TextStyle boldTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textBoldSizeGlobal,
    color: color,
    fontWeight: weight ?? FontWeight.bold,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}

// Primary Text Style
TextStyle primaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textPrimarySizeGlobal,
    color: color,
    fontWeight: weight ?? FontWeight.normal,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}

// Secondary Text Style
TextStyle secondaryTextStyle({
  int? size,
  Color? color,
  FontWeight? weight,
  String? fontFamily,
  double? letterSpacing,
  FontStyle? fontStyle,
  double? wordSpacing,
  TextDecoration? decoration,
  TextDecorationStyle? textDecorationStyle,
  TextBaseline? textBaseline,
  Color? decorationColor,
  Color? backgroundColor,
  double? height,
}) {
  return TextStyle(
    fontSize: size != null ? size.toDouble() : textSecondarySizeGlobal,
    color: color ?? nftTextSecondaryColor,
    fontWeight: weight ?? FontWeight.normal,
    fontFamily: fontFamily,
    letterSpacing: letterSpacing,
    fontStyle: fontStyle,
    decoration: decoration,
    decorationStyle: textDecorationStyle,
    decorationColor: decorationColor,
    wordSpacing: wordSpacing,
    textBaseline: textBaseline,
    backgroundColor: backgroundColor,
    height: height,
  );
}

Widget profileWidget({String? name, int? maxLines, Widget? iconData, Widget? icon, required BuildContext context, Function()? onTap}) {
  return Container(
    decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
    child: TextFormField(
      onTap: onTap,
      style: primaryTextStyle(),
      maxLines: maxLines ?? 1,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        prefixIcon: iconData,
        suffixIcon: icon,
        border: InputBorder.none,
        hintText: name,
        hintStyle: primaryTextStyle(),
        contentPadding: EdgeInsets.all(16),
      ),
    ),
  );
}

enum PageRouteAnimation { Fade, Scale, Rotate, Slide, SlideBottomTop }

extension GetDurationUtils on Duration {
  ///  await Duration(seconds: 1).delay();
  Future<void> get delay => Future.delayed(this);
}

Route<T> buildPageRoute<T>({Widget? child, PageRouteAnimation? pageRouteAnimation, Duration? duration}) {
  if (pageRouteAnimation != null) {
    if (pageRouteAnimation == PageRouteAnimation.Fade) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) => FadeTransition(opacity: anim, child: child),
        transitionDuration: Duration(milliseconds: 1000),
      );
    } else if (pageRouteAnimation == PageRouteAnimation.Rotate) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) => RotationTransition(child: child, turns: ReverseAnimation(anim)),
        transitionDuration: Duration(milliseconds: 700),
      );
    } else if (pageRouteAnimation == PageRouteAnimation.Scale) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) => ScaleTransition(child: child, scale: anim),
        transitionDuration: Duration(milliseconds: 700),
      );
    } else if (pageRouteAnimation == PageRouteAnimation.Slide) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) => SlideTransition(
          child: child,
          position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0)).animate(anim),
        ),
        transitionDuration: Duration(milliseconds: 500),
      );
    } else if (pageRouteAnimation == PageRouteAnimation.SlideBottomTop) {
      return PageRouteBuilder(
        pageBuilder: (c, a1, a2) => child!,
        transitionsBuilder: (c, anim, a2, child) => SlideTransition(
          child: child,
          position: Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0)).animate(anim),
        ),
        transitionDuration: Duration(milliseconds: 500),
      );
    }
  }
  return MaterialPageRoute<T>(builder: (_) => child!);
}

/// Custom scroll behaviour widget
class SBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

linearGradient() {
  return LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      Color(0xff154698),
      Color(0xff3094E3),
    ],
  );
}

/// Returns MaterialColor from Color
MaterialColor createMaterialColor(Color color) {
  List strengths = <double>[.05];
  Map<int, Color> swatch = <int, Color>{};
  final int r = color.red, g = color.green, b = color.blue;

  for (int i = 1; i < 10; i++) {
    strengths.add(0.1 * i);
  }
  strengths.forEach((strength) {
    final double ds = 0.5 - strength;
    swatch[(strength * 1000).round()] = Color.fromRGBO(
      r + ((ds < 0 ? r : (255 - r)) * ds).round(),
      g + ((ds < 0 ? g : (255 - g)) * ds).round(),
      b + ((ds < 0 ? b : (255 - b)) * ds).round(),
      1,
    );
  });
  return MaterialColor(color.value, swatch);
}

void hideKeyword(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    currentFocus.focusedChild?.unfocus();
  }
}
