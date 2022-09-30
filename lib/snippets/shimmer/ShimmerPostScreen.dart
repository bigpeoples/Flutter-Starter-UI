import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerPostScreen extends StatefulWidget {
  static String tag = '/ShimmerPostScreen';

  @override
  ShimmerPostScreenState createState() => ShimmerPostScreenState();
}

class ShimmerPostScreenState extends State<ShimmerPostScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView.separated(
          separatorBuilder: (BuildContext context, int index) => Divider(),
          itemCount: 6,
          itemBuilder: (BuildContext context, int index) {
            return Shimmer.fromColors(
              highlightColor: white,
              baseColor: Colors.grey[600]!,
              child: shimmerLayout(),
            );
          },
        ).paddingAll(16),
      ),
    );
  }

  Widget shimmerLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(height: 40, width: 40, decoration: BoxDecoration(shape: BoxShape.circle, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark)),
            10.width,
            Container(width: context.width() * 0.7, height: 10, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark).expand(),
            5.width,
            Container(height: 10, width: 20, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
          ],
        ),
        10.height,
        Container(height: 180, width: context.width(), color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark)
      ],
    );
  }
}
