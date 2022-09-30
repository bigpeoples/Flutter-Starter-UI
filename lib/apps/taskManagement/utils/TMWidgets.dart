import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

import 'TMColors.dart';

Widget tmButton(BuildContext context, {width: Double, value: String, onTap: Function, IconData? icon, Color? color}) {
  return Container(
    padding: EdgeInsets.all(12),
    width: width,
    decoration: BoxDecoration(
      borderRadius: radius(30),
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [
          appStore.isDarkModeOn ? context.cardColor : tmGreenGradient2,
          appStore.isDarkModeOn ? context.cardColor : tmGreenGradient1,
        ],
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Text(value, style: boldTextStyle(color: white), textAlign: TextAlign.center),
        8.width,
        Icon(Icons.arrow_forward_ios, color: white, size: 14),
      ],
    ),
  ).onTap(() {
    onTap.call();
  }, borderRadius: radius(30));
}

Widget commonCachedNetworkImage(String? url, {double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, bool usePlaceholderIfUrlEmpty = true, double? radius}) {
  if (url!.validate().isEmpty) {
    return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment as Alignment? ?? Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height, width: width, fit: fit, alignment: alignment, radius: radius);
      },
    );
  } else {
    return Image.asset(
      url,
      height: height,
      width: width,
      fit: fit,
      alignment: alignment ?? Alignment.center,
    ).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset(tm_placeholder, height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}

Widget socialButton(BuildContext context, {String? image, String? socialTitle, Color? color, Color? textColor}) {
  return AppButton(
    width: context.width(),
    padding: EdgeInsets.all(20),
    color: color!,
    onTap: () {},
    shapeBorder: RoundedRectangleBorder(
      borderRadius: radius(30),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        commonCachedNetworkImage(image, height: 20, width: 20, fit: BoxFit.cover),
        16.width,
        Text(socialTitle!, style: boldTextStyle(color: textColor, size: 16)),
      ],
    ),
  ).paddingSymmetric(horizontal: 4, vertical: 8);
}

InputDecoration TMInputDecoration(BuildContext context, {String? hintText, Widget? suffix, required Color borderColor}) => InputDecoration(
      hintText: hintText,
      hintStyle: primaryTextStyle(color: grey),
      suffixIcon: suffix,
      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: borderColor)),
    );

Widget noteLeadingWidget(BuildContext context, {required String image, Color? color}) {
  return Container(
    padding: EdgeInsets.all(16),
    decoration: boxDecorationDefault(shape: BoxShape.circle, color: context.cardColor),
    child: Image.asset(image.validate(), height: 20, width: 20, fit: BoxFit.cover, color: color),
  );
}

Widget noteDetailData(BuildContext context, {String? name, String? img, Widget? timeWidget, bool? isCheck = false, Color? color, String? title}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 0, vertical: 8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        noteLeadingWidget(context, image: img.validate(), color: color),
        8.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title.validate(), style: secondaryTextStyle(size: 12)),
            0.height,
            isCheck! ? timeWidget! : Text(name.validate(), style: boldTextStyle()),
          ],
        ).expand()
      ],
    ),
  );
}

Widget noteSearchIcon(BuildContext context, {String? searchImage, Color? color}) {
  return Container(
    padding: EdgeInsets.all(10),
    decoration: boxDecorationDefault(shape: BoxShape.circle),
    child: Image.asset(searchImage.validate(), color: context.iconColor, height: 16, width: 16),
  );
}

Widget addAndEditNotesWidget(BuildContext context, {Widget? noteWidget, String? img, String? title, Color? color, Function()? onTap}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      noteLeadingWidget(context, image: img.validate(), color: color),
      16.width,
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title.validate(), style: secondaryTextStyle(size: 12)),
          noteWidget!,
        ],
      ).expand(),
    ],
  ).paddingAll(8).onTap(onTap);
}

Widget addAndEditNotesDescriptionWidget(BuildContext context, {String? img, Widget? widget}) {
  return Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      noteLeadingWidget(context, image: img!),
      16.width,
      widget!,
    ],
  ).paddingAll(8);
}

Widget noteCheckWidget(BuildContext context, {Color? color, Color? checkIconColor, Function()? onTap}) {
  return Container(
    padding: EdgeInsets.all(2),
    decoration: boxDecorationDefault(shape: BoxShape.circle, color: color),
    child: Icon(Icons.check, size: 20, color: checkIconColor),
  ).onTap(onTap!);
}

Widget noteSwitchWidget({bool? noteSwitchValue, Function? onTap}) {
  return Transform.scale(
    scale: 0.8,
    child: CupertinoSwitch(
      value: noteSwitchValue!,
      activeColor: tmPrimaryColor,
      onChanged: (bool value) {
        onTap!.call(value);
      },
    ),
  );
}
