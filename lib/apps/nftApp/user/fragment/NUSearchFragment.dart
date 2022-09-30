import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/DetailScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class NUSearchFragment extends StatefulWidget {
  @override
  NUSearchFragmentState createState() => NUSearchFragmentState();
}

class NUSearchFragmentState extends State<NUSearchFragment> {
  List<NftAppModel> list = getPeopleList();
  List<NftAppModel> list1 = getItemSearchList();

  List<Color> colorData = [
    Colors.green,
    Colors.red,
    Colors.pink,
    Colors.blue,
    Colors.lightGreen,
    Colors.brown,
  ];

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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardColor,
                  ),
                  child: TextFormField(
                    style: primaryTextStyle(),
                    cursorColor: appStore.isDarkModeOn ? Colors.white : null,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 14),
                      border: InputBorder.none,
                      hintText: 'Openart',
                      hintStyle: primaryTextStyle(),
                      prefixIcon: Icon(Icons.search, color: appStore.isDarkModeOn ? Colors.white : null),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 4),
              Expanded(
                child: TextButton(
                  onPressed: () {
                    //
                  },
                  child: Text('Cancel', style: boldTextStyle()),
                ),
              )
            ],
          ),
          SizedBox(height: 16),
          Text('People', style: primaryTextStyle(size: 20)),
          ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (_, index) {
              NftAppModel data = list[index];

              return Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 8, right: 8),
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(shape: BoxShape.circle, color: colorData[index]),
                    child: Text(data.title!, style: boldTextStyle(color: Colors.white, size: 20)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(data.subTitle!, style: boldTextStyle()),
                      SizedBox(height: 4),
                      Text(data.description!, style: secondaryTextStyle(size: 16)),
                    ],
                  ),
                ],
              );
            },
          ),
          SizedBox(height: 16),
          Text('Items', style: primaryTextStyle(size: 20)),
          SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: list1.length,
            itemBuilder: (_, index) {
              NftAppModel data = list1[index];

              return Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    hideKeyword(context);
                    Navigator.push(context, buildPageRoute(child: DetailScreen(img: data.img), pageRouteAnimation: PageRouteAnimation.SlideBottomTop));
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(data.img!, height: 55, width: 55, fit: BoxFit.cover),
                      ),
                      SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title!, style: boldTextStyle()),
                          SizedBox(height: 4),
                          Text(data.subTitle!, style: secondaryTextStyle(size: 16)),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
