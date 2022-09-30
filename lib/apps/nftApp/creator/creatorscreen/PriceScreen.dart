import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/creatorscreen/AuctionScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/creatorscreen/FixedPriceScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../../main.dart';

class PriceScreen extends StatefulWidget {
  @override
  PriceScreenState createState() => PriceScreenState();
}

class PriceScreenState extends State<PriceScreen> {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(color: appStore.isDarkModeOn ? scaffoldColorDark : Colors.white70),
          backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : Colors.white,
          brightness: appStore.isDarkModeOn ? Brightness.dark : Brightness.light,
          centerTitle: true,
          title: Image.asset(appStore.isDarkModeOn ? 'images/nft/ic_app_logo_dark.png' : 'images/nft/ic_app_logo.png', fit: BoxFit.cover, width: 150),
          bottom: TabBar(
            padding: EdgeInsets.only(left: 8, right: 8),
            tabs: [
              Tab(child: Text('Fixed price', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black))),
              Tab(child: Text('Auction', style: boldTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.black))),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            FixedPriceScreen(),
            AuctionScreen(),
          ],
        ),
      ),
    );
  }
}
