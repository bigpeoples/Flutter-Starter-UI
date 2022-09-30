import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoadingScreen extends StatefulWidget {
  static String tag = '/ShimmerLoadingScreen';

  @override
  ShimmerLoadingScreenState createState() => ShimmerLoadingScreenState();
}

class ShimmerLoadingScreenState extends State<ShimmerLoadingScreen> {
  bool enabled = true;

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
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Shimmer.fromColors(
                baseColor: Colors.grey[600]!,
                highlightColor: Colors.grey[100]!,
                enabled: enabled,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 8,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (_, __) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(width: 50, height: 50, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark).paddingSymmetric(horizontal: 8),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(width: context.width(), height: 8, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark).paddingSymmetric(vertical: 2),
                            Container(width: context.width(), height: 8, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark),
                            Container(width: 40, height: 8, color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark).paddingSymmetric(vertical: 2),
                          ],
                        ).expand()
                      ],
                    ).paddingOnly(left: 16, right: 16, top: 16);
                  },
                ),
              ),
              16.height,
              AppButton(
                color: appStore.cardColor,
                height: 40,
                width: 160,
                child: Text(enabled ? 'Stop' : 'Play', style: boldTextStyle(size: 14)),
                onTap: () {
                  enabled = !enabled;
                  setState(() {});
                },
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
              ).paddingBottom(16),
            ],
          ),
        ),
      ),
    );
  }
}
