import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/snippets/adMob/BannerAdPageScreen.dart';
import 'package:nb_utils/nb_utils.dart';

class AdMobScreen extends StatefulWidget {
  static String tag = '/AdMobScreen';

  @override
  AdMobScreenState createState() => AdMobScreenState();
}

class AdMobScreenState extends State<AdMobScreen> {
  static final AdRequest request = AdRequest(
    keywords: <String>['foo', 'bar'],
    contentUrl: 'http://foo.com/bar.html',
    nonPersonalizedAds: true,
  );
  InterstitialAd? myInterstitial;
  RewardedAd? videoAd;

  int coins = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    _createInterstitialAd();
    adMobRewardedAd();
  }

  _createInterstitialAd() {
    InterstitialAd.load(
        adUnitId: kReleaseMode
            ? Platform.isAndroid
                ? 'ca-app-pub-3940256099942544/1033173712'
                : 'ca-app-pub-3940256099942544/4411468910'
            : InterstitialAd.testAdUnitId,
        request: AdRequest(),
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            print('$ad loaded');
            myInterstitial = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            myInterstitial = null;
          },
        ));
  }

  void adMobRewardedAd() {
    RewardedAd.load(
        adUnitId: kReleaseMode
            ? Platform.isAndroid
                ? 'ca-app-pub-8037703403650159/5505039161'
                : 'ca-app-pub-3940256099942544/1712485313'
            : RewardedAd.testAdUnitId,
        request: AdRequest(),
        rewardedAdLoadCallback: RewardedAdLoadCallback(
          onAdLoaded: (RewardedAd ad) {
            print('$ad loaded.');
            videoAd = ad;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('RewardedAd failed to load');
            videoAd = null;
            adMobRewardedAd();
          },
        ));
  }

  void showAdMobRewardedAd({Function? onCall}) {
    if (videoAd == null) {
      onCall!();
      return;
    }
    videoAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (RewardedAd ad) => print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (RewardedAd ad) {
        print('onAdDismissedFullScreenContent.');
        ad.dispose();
        onCall!();
        // adMobRewardedAd();
      },
      onAdFailedToShowFullScreenContent: (RewardedAd ad, AdError error) {
        print('onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        adMobRewardedAd();
      },
    );

    videoAd!.setImmersiveMode(true);

    videoAd!.show(onUserEarnedReward: (AdWithoutView ad, RewardItem reward) {
      print('$ad with reward $RewardItem(${reward.amount}, ${reward.type}');
    });
    videoAd = null;
  }

  void showInterstitialAd() {
    myInterstitial?.show();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: 160,
              child: Text('BannerAd', style: boldTextStyle(size: 14)),
              onTap: () {
                BannerAdPageScreen().launch(context);
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
            ),
            8.height,
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: 160,
              child: Text('InterstitialAd', style: boldTextStyle(size: 14)),
              onTap: () {
                showInterstitialAd();
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
            ),
            8.height,
            AppButton(
              color: appStore.cardColor,
              height: 40,
              width: 160,
              child: Text('Rewarded Ads', style: boldTextStyle(size: 14)),
              onTap: () async {
                showAdMobRewardedAd();
              },
              shapeBorder: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
            30.height,
            Text("You have $coins coins", style: boldTextStyle()),
          ],
        ).center(),
      ),
    );
  }
}
