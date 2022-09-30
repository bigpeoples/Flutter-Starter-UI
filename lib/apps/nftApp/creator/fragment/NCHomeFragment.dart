import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/NftCardWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/DetailScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class NCHomeFragment extends StatefulWidget {
  @override
  NCHomeFragmentState createState() => NCHomeFragmentState();
}

class NCHomeFragmentState extends State<NCHomeFragment> {
  List<NftAppModel> list = getCreatorHomeData();

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
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('My Items', style: boldTextStyle(size: 20)),
          SizedBox(height: 16),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              NftAppModel data = list[index];

              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(context, buildPageRoute(child: DetailScreen(img: data.img, isNext: false), pageRouteAnimation: PageRouteAnimation.SlideBottomTop));
                },
                child: NftCardWidget(
                  appModel: data,
                  title: data.title,
                  img: data.img,
                  img1: data.img1,
                  description: data.description,
                  subTitle: data.subTitle,
                  buttonText: 'Sold For 2.00 ETH',
                  color: appStore.isDarkModeOn ? null : Theme.of(context).cardColor,
                  textButtonColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
                  btnBackColor: Theme.of(context).cardColor,
                ),
              );
            },
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                primary: nftPrimaryColor,
                side: BorderSide(color: appStore.isDarkModeOn ? Colors.grey : Colors.black),
                padding: EdgeInsets.all(12),
              ),
              onPressed: () {
                //
              },
              child: Text('Load more', style: boldTextStyle()),
            ),
          )
        ],
      ),
    );
  }
}
