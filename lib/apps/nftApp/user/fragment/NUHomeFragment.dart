import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/NftCardWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/PlackDialogWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/DetailScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class NUHomeFragment extends StatefulWidget {
  @override
  NUHomeFragmentState createState() => NUHomeFragmentState();
}

class NUHomeFragmentState extends State<NUHomeFragment> {
  List<NftAppModel> list = getUserHome();
  List<NftAppModel> list1 = getUserHomeData();
  List<NftAppModel> hotList = getHotData();
  List<NftAppModel> hotCollection = getCollectionData();

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              children: [
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Discover, collect, and sell', style: boldTextStyle(size: 18)),
                      SizedBox(height: 16),
                      Text('Your  Digital  Art', style: boldTextStyle(size: 26)),
                    ],
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    cursorColor: Colors.grey,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: appStore.isDarkModeOn ? Colors.white : null),
                      suffixIcon: Icon(Icons.keyboard_voice_outlined, color: appStore.isDarkModeOn ? Colors.white : null),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(top: 14),
                      hintText: 'Search, items,collection,and accounts',
                      hintStyle: primaryTextStyle(),
                    ),
                  ),
                ),
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
                        hideKeyword(context);
                        Navigator.push(context, buildPageRoute(child: DetailScreen(img: data.img), pageRouteAnimation: PageRouteAnimation.SlideBottomTop));
                      },
                      child: NftCardWidget(
                        appModel: data,
                        title: data.title,
                        img: data.img,
                        img1: data.img1,
                        description: data.description,
                        subTitle: data.subTitle,
                        btnSubtitle: 'Sold For ',
                        buttonText: '2.00 ETH',
                        color: appStore.isDarkModeOn ? null : Theme.of(context).cardColor,
                        textButtonColor: appStore.isDarkModeOn ? Colors.white : Colors.black,
                        btnBackColor: Theme.of(context).cardColor,
                      ),
                    );
                  },
                ),
                SizedBox(height: 8),
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
                ),
                SizedBox(height: 22),
                Row(
                  children: [
                    Container(height: 10, width: 10, decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red)),
                    SizedBox(width: 8),
                    Text('Live auctions', style: boldTextStyle(size: 20)),
                  ],
                ),
                SizedBox(height: 16),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: list1.length,
                  shrinkWrap: true,
                  itemBuilder: (_, index) {
                    NftAppModel data = list1[index];

                    return InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        hideKeyword(context);
                        Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(img: data.img)));
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.asset(data.img!, height: 300, fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
                                  ),
                                  SizedBox(height: 16),
                                  Text(data.title!, style: boldTextStyle(size: 20)),
                                  SizedBox(height: 8),
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Stack(
                                        alignment: Alignment.topRight,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(25),
                                            child: Image.asset(data.img1!, height: 35, width: 35, fit: BoxFit.cover),
                                          ),
                                          Container(
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                                          )
                                        ],
                                      ),
                                      SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(data.subTitle!, style: boldTextStyle(size: 14)),
                                            SizedBox(height: 4),
                                            Text(data.description!, style: secondaryTextStyle(size: 12)),
                                          ],
                                        ),
                                      ),
                                      Icon(Icons.favorite_border_outlined)
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Container(
                            padding: EdgeInsets.all(12),
                            margin: EdgeInsets.only(bottom: 16),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(30), color: Theme.of(context).cardColor),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(height: 10, width: 10, decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle)),
                                        SizedBox(width: 4),
                                        Text('Current bid', style: secondaryTextStyle()),
                                      ],
                                    ),
                                    SizedBox(height: 4),
                                    Row(
                                      children: [
                                        SizedBox(width: 14),
                                        Text('2.00 ETH', style: boldTextStyle()),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Ending in', style: secondaryTextStyle()),
                                    SizedBox(height: 4),
                                    Text('27 m 30s', style: boldTextStyle()),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Icon(Icons.star_rate_outlined, color: Color(0xffFFAC33)),
                    SizedBox(width: 8),
                    Text('Hot bid', style: boldTextStyle(size: 20)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            height: 210,
            child: ListView.builder(
              padding: EdgeInsets.only(right: 8, left: 8),
              itemCount: hotList.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (_, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 8, right: 8),
                  child: InkWell(
                    onTap: () {
                      hideKeyword(context);
                      Navigator.push(context, buildPageRoute(child: DetailScreen(img: hotList[index].img), pageRouteAnimation: PageRouteAnimation.SlideBottomTop));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(hotList[index].img!, fit: BoxFit.cover, height: 200, width: MediaQuery.of(context).size.width / 2 - 24),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.only(left: 16),
            child: Row(
              children: [
                Icon(Icons.star_rate_outlined, color: Color(0xffFFAC33)),
                SizedBox(width: 8),
                Text('Hot Collection', style: boldTextStyle(size: 20)),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Wrap(
                runSpacing: 16,
                spacing: 16,
                children: hotCollection.map((e) {
                  return InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      hideKeyword(context);
                      Navigator.push(context, buildPageRoute(child: DetailScreen(img: e.img), pageRouteAnimation: PageRouteAnimation.SlideBottomTop));
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(e.img!, fit: BoxFit.cover, height: 200, width: MediaQuery.of(context).size.width / 2 - 24),
                    ),
                  );
                }).toList()),
          )
        ],
      ),
    );
  }
}
