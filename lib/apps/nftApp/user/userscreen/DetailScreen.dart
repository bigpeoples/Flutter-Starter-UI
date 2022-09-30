import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/PlackDialogWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/DiscoverDetailScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class DetailScreen extends StatefulWidget {
  final String? img;
  final bool isNext;

  DetailScreen({this.img, this.isNext = true});

  @override
  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
  List<NftAppModel> list = getDetailData();

  List<String> data = ['color', 'circle', 'black', 'art'];

  bool mIsCheck = false;

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
        padding: EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(widget.img!, fit: BoxFit.cover, width: MediaQuery.of(context).size.width, height: 400),
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text('Silent Color', style: boldTextStyle(size: 20)),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(50),
                  onTap: () {
                    mIsCheck = !mIsCheck;
                    setState(() {});
                  },
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
                    child: Icon(mIsCheck ? Icons.favorite_outline : Icons.favorite, color: nftPrimaryColor),
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(color: Theme.of(context).cardColor, shape: BoxShape.circle),
                  child: Icon(Icons.arrow_circle_up_outlined),
                )
              ],
            ),
            SizedBox(height: 8),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(16)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(color: Color(0xffFFAD00), shape: BoxShape.circle),
                    child: Text('H', style: boldTextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 8),
                  Text('@openart', style: boldTextStyle()),
                ],
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Together with my design team, we designed this futuristic Cyberyacht concept artwork. We wanted to create something that has not been created yet, so we started to collect ideas of how we imagine the Cyberyacht could look like in the future.',
              style: secondaryTextStyle(),
            ),
            SizedBox(height: 16),
            Row(
              children: data.map((e) {
                return Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), border: Border.all(color: Colors.grey)),
                  margin: EdgeInsets.only(right: 8),
                  padding: EdgeInsets.all(8),
                  child: Text('#$e', style: secondaryTextStyle()),
                );
              }).toList(),
            ),
            SizedBox(height: 16),
            DetailList(name: 'View on Etherscan', context: context),
            DetailList(name: 'View on IPFS', context: context),
            DetailList(name: 'View IPFS Metadata', context: context),
            SizedBox(height: 16),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Current Bid', style: primaryTextStyle()),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text('0.50 ETH', style: boldTextStyle(size: 18)),
                      SizedBox(width: 8),
                      Text('\$2,689.73', style: secondaryTextStyle()),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Once a bid has been placed and the reserve price has been met, a 24 hour auction for this artwork will begin.', style: secondaryTextStyle()),
                  SizedBox(height: 16),
                  AppButton(
                    title: 'Place a bid',
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) {
                          return PlackDialogWidget();
                        },
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: 16),
            Text('Activity', style: boldTextStyle(size: 18)),
            ListView.builder(
              padding: EdgeInsets.only(top: 8, bottom: 8),
              shrinkWrap: true,
              itemCount: list.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                NftAppModel data = list[index];

                return Padding(
                  padding: EdgeInsets.only(top: 8, bottom: 8),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () {
                      if (widget.isNext) {
                        Navigator.push(context, buildPageRoute(child: DiscoverDetailScreen(), pageRouteAnimation: PageRouteAnimation.Slide));
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: Theme.of(context).cardColor),
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.asset(data.img!, fit: BoxFit.cover, height: 50, width: 50),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.title!, style: boldTextStyle(size: 14)),
                                SizedBox(height: 4),
                                Text(data.subTitle!, style: secondaryTextStyle()),
                                SizedBox(height: 4),
                                Row(
                                  children: [
                                    Text(data.description!, style: boldTextStyle(size: 15)),
                                    SizedBox(width: 8),
                                    Text('\$2,683.73', style: secondaryTextStyle()),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Icon(Icons.post_add_outlined),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
