import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/screen/SignInScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DotsIndicator.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/dots_decorator.dart';

import '../../../main.dart';


class WalkThroughScreen extends StatefulWidget {
  @override
  WalkThroughScreenState createState() => WalkThroughScreenState();
}

class WalkThroughScreenState extends State<WalkThroughScreen> {
  PageController pageController = PageController();

  List<NftAppModel> list = getWalkThroughtData();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldBackgroundColor,
      body: Stack(
        children: [
          PageView.builder(
            onPageChanged: (v) {
              currentPage = v;
              setState(() {});
            },
            controller: pageController,
            itemCount: list.length,
            itemBuilder: (_, index) {
              currentPage = index;
              NftAppModel data = list[index];
              return Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.asset(data.img!, fit: BoxFit.cover, height: 200, width: 200),
                    ),
                    SizedBox(height: 16),
                    Text(data.title!, style: boldTextStyle(size: 18)),
                    SizedBox(height: 16),
                    Text(data.subTitle!, textAlign: TextAlign.center, style: secondaryTextStyle()),
                  ],
                ),
              );
            },
          ),
          Positioned(
            bottom: 16,
            right: 0,
            left: 0,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  DotsIndicator(
                    dotsCount: list.length,
                    position: currentPage.toDouble(),
                    onTap: (index) {
                      setState(() {
                        currentPage = index.toInt();
                      });
                    },
                    decorator: DotsDecorator(
                      color: Colors.grey, // Inactive color
                      activeColor: nftPrimaryColor,
                    ),
                  ),
                  SizedBox(height: 16),
                  AppButton(
                    title: currentPage != 2 ? 'Next' : 'Get Started',
                    onTap: () async {
                      if (currentPage == 2) {
                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => SignInScreen()));
                      } else {
                        pageController.animateToPage(currentPage + 1, duration: Duration(milliseconds: 300), curve: Curves.linear);
                      }
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
