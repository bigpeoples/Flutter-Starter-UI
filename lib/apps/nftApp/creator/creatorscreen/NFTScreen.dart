import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AlertDialogWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/NftCardWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class NFTScreen extends StatefulWidget {
  @override
  NFTScreenState createState() => NFTScreenState();
}

class NFTScreenState extends State<NFTScreen> {
  List<NftAppModel> list = getUserHome();

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
      appBar: appBar(isBack: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            Center(
              child: Image.asset('images/nft/ic_server.png', height: 250, width: 250),
            ),
            Text('Your NFT\n has been listed!', textAlign: TextAlign.center, style: boldTextStyle(size: 25)),
            SizedBox(height: 16),
            Text('Your NFT has been successfully listed on our marketplace.', textAlign: TextAlign.center, style: primaryTextStyle()),
            SizedBox(height: 16),
            NftCardWidget(
              appModel: list.first,
              title: 'Silent Color',
              subTitle: 'Pawel Czerwinski',
              description: 'Creator',
              img: 'images/nft/ic_nft6.jpg',
              img1: 'images/nft/ic_nft4.jpg',
              buttonText: 'Reserve price 2.00 ETH',
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialogWidget();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
