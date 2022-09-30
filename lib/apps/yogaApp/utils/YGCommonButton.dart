import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

Widget commonButton({required String title, required String image, Color? color, Color? textColor, Widget? dara, Color? imgColor, BuildContext? context}) {
  return Container(
    margin: EdgeInsets.all(8),
    child: MaterialButton(
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 20, width: 20, color: imgColor),
            6.width,
            Text(title, style: boldTextStyle(color: textColor, size: 16)),
          ],
        ),
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        color: color,
        onPressed: () {
          dara.launch(context!);
        }),
  );
}

class MyBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => ClampingScrollPhysics();
}

Widget cachedImage(String url, {double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, bool usePlaceholderIfUrlEmpty = true, double? radius}) {
  if (url.validate().isEmpty) {
    return placeHolderWidget(height: height!, width: width!, fit: fit!, alignment: alignment, radius: radius);
  } else if (url.validate().startsWith('http')) {
    return CachedNetworkImage(
      imageUrl: url,
      height: height,
      width: width,
      fit: fit,
      alignment: Alignment.center,
      errorWidget: (_, s, d) {
        return placeHolderWidget(height: height!, width: width!, fit: fit!, alignment: alignment!, radius: radius);
      },
      placeholder: (_, s) {
        if (!usePlaceholderIfUrlEmpty) return SizedBox();
        return placeHolderWidget(height: height!, width: width!, fit: fit!, alignment: alignment!, radius: radius);
      },
    );
  } else {
    return Image.asset(url, height: height, width: width, fit: fit, alignment: alignment ?? Alignment.center).cornerRadiusWithClipRRect(radius ?? defaultRadius);
  }
}

Widget placeHolderWidget({double? height, double? width, BoxFit? fit, AlignmentGeometry? alignment, double? radius}) {
  return Image.asset(
    'assets/placeholder.jpg',
    height: height,
    width: width,
    fit: fit ?? BoxFit.cover,
    alignment: alignment ?? Alignment.center,
  ).cornerRadiusWithClipRRect(radius ?? defaultRadius);
}
