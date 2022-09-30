import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/services/BannerServices.dart';
import 'package:mighty_ui_kit/main/utils/AppCommon.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class AppBannerWidget extends StatefulWidget {
  static String tag = '/AppBannerWidget';

  @override
  AppBannerWidgetState createState() => AppBannerWidgetState();
}

class AppBannerWidgetState extends State<AppBannerWidget> {
  PageController? _pageController;
  int initPageIndex = 0;

  List<AppModel> list = [];

  Timer? timer;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _pageController = PageController(initialPage: initPageIndex);

    if (remoteConfig != null) {
      loadBanners();
    } else {
      remoteConfig = await setUpRemoteConfig().then((value) {
        loadBanners();
      });
    }
  }

  Future<void> loadBanners() async {
    if (remoteConfig!.getString('banner_json').validate().isNotEmpty) {
      Iterable res = jsonDecode(remoteConfig!.getString('banner_json'));
      list.addAll(res.map((e) => AppModel.fromJson(e)));

      setState(() {});

      if (list.validate().isNotEmpty) {
        timer = Timer.periodic(Duration(seconds: 5), (Timer timer) {
          if (initPageIndex + 1 < 3) {
            initPageIndex += 1;
          } else {
            initPageIndex = 0;
          }
          _pageController?.animateToPage(initPageIndex, duration: Duration(milliseconds: 1000), curve: Curves.easeInOutQuad);
        });
      }
    }
  }

  @override
  void dispose() {
    _pageController?.dispose();
    timer?.cancel();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? SizedBox()
        : Container(
            height: 250,
            child: Stack(
              children: [
                PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    initPageIndex = index;
                    setState(() {});
                  },
                  children: list.map((data) {
                    return Container(
                      child: Stack(
                        children: [
                          commonCacheImageWidget(data.image.validate(), context.width(), fit: BoxFit.cover, width: context.width()),
                          Positioned(
                            child: Observer(
                              builder: (_) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                                decoration: BoxDecoration(color: appStore.cardColor, borderRadius: radius(4)),
                                child: Text(data.title.validate(), style: boldTextStyle()),
                              ),
                            ),
                            bottom: 8,
                            left: 8,
                          ),
                        ],
                      ),
                    ).onTap(() {
                      if (data.bannerLink.validate().isNotEmpty) {
                        launchURL(data.bannerLink!, forceWebView: true);
                      }
                    });
                  }).toList(),
                ).visible(list.isNotEmpty),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.transparent),
                    child: IconButton(
                      icon: Icon(Icons.arrow_forward_ios_rounded, color: Colors.black),
                      onPressed: () {
                        if (initPageIndex > list.length) {
                          _pageController!.animateToPage(++initPageIndex, duration: Duration(milliseconds: 1000), curve: Curves.easeInOutQuad);
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.transparent, borderRadius: BorderRadius.circular(32)),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
                      onPressed: () {
                        if (initPageIndex > 0) {
                          _pageController!.animateToPage(--initPageIndex, duration: Duration(milliseconds: 1000), curve: Curves.easeInOutQuad);
                          setState(() {});
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
