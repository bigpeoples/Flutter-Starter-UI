import 'dart:io';

import 'package:flutter/foundation.dart' as Foundation;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

class BannerAdPageScreen extends StatefulWidget {
  static String tag = '/BannerAdPageScreen';

  @override
  BannerAdPageScreenState createState() => BannerAdPageScreenState();
}

class BannerAdPageScreenState extends State<BannerAdPageScreen> {
  late BannerAd myBanner;

  BannerAd buildBannerAd() {
    return BannerAd(
      adUnitId: kReleaseMode
          ? Platform.isAndroid
              ? 'ca-app-pub-3940256099942544/6300978111'
              : 'ca-app-pub-3940256099942544/2934735716'
          : BannerAd.testAdUnitId,
      size: AdSize.banner,
      request: AdRequest(),
      listener: BannerAdListener(),
    )..load();
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
//
  }

  @override
  void dispose() {
//
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBarScroller(
        title: 'Banner Ad',
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(),
              Text('BannerAd Page', style: boldTextStyle(size: 16, color: black)),
              Container(
                width: context.width(),
                height: AdSize.banner.height.toDouble(),
                child: AdWidget(
                  ad: BannerAd(
                    adUnitId: kReleaseMode
                        ? Platform.isAndroid
                            ? 'ca-app-pub-3940256099942544/6300978111'
                            : 'ca-app-pub-3940256099942544/2934735716'
                        : BannerAd.testAdUnitId,
                    size: AdSize.banner,
                    request: AdRequest(),
                    listener: BannerAdListener(),
                  )..load(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
