import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class PopUp {
  static const String save = 'Save';
  static const String delete = 'Delete';
  static const List<String> choices = <String>[
    save,
    delete,
  ];
}

InputDecoration buildInputDecoration(String name, {Widget? prefixIcon}) {
  return InputDecoration(
    prefixIcon: prefixIcon,
    hintText: name,
    hintStyle: primaryTextStyle(),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: grey, width: 0.5)),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide(color: grey, width: 0.5)),
  );
}

Widget socialList({Widget? icon}) {
  return Container(
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: grey)),
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.only(left: 32, right: 32, top: 12, bottom: 12),
    child: icon,
  ).expand();
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
    return Image.asset(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset('images/newsblog/placeholder.jpg', height: height, width: width, fit: fit ?? BoxFit.cover, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
