import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/NftCardWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/DetailScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class NUAddFragment extends StatefulWidget {
  @override
  NUAddFragmentState createState() => NUAddFragmentState();
}

class NUAddFragmentState extends State<NUAddFragment> {
  List<String> typeList = ['All items', 'Game', 'Video', 'Animation', 'Photography'];
  List<String> createList = ['ETH', 'WETH', '0xBTC', '1337', '1MT'];
  List<NftAppModel> list = getNUAddData();

  int typeIndex = 0;
  int createIndex = 0;
  double sliderValue = 50.0;

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
                    cursorColor: Theme.of(context).iconTheme.color,
                    style: primaryTextStyle(),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 14),
                      border: InputBorder.none,
                      hintText: 'Openart',
                      hintStyle: primaryTextStyle(),
                      prefixIcon: Icon(Icons.search, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
                      suffixIcon: Icon(Icons.mic_none, color: appStore.isDarkModeOn ? Colors.white : Colors.black),
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
          Text('Type', style: primaryTextStyle(size: 20)),
          SizedBox(height: 16),
          Wrap(
            runSpacing: 16,
            spacing: 16,
            children: typeList.map((e) {
              return InkWell(
                onTap: () {
                  typeIndex = typeList.indexOf(e);
                  setState(() {});
                },
                borderRadius: BorderRadius.circular(16),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: typeIndex == typeList.indexOf(e) ? linearGradient() : null,
                    borderRadius: BorderRadius.circular(16),
                    color: typeIndex == typeList.indexOf(e) ? nftPrimaryColor : Theme.of(context).cardColor,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    e,
                    style: primaryTextStyle(
                      color: appStore.isDarkModeOn
                          ? null
                          : typeIndex == typeList.indexOf(e)
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text('Price range', style: primaryTextStyle(size: 20)),
          SizedBox(height: 16),
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              width: 100,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: Colors.grey.withOpacity(0.3)),
              child: Text('${sliderValue.toInt()} ETH', style: boldTextStyle(size: 20)),
            ),
          ),
          Slider(
            activeColor: nftPrimaryColor,
            min: 0,
            max: 100,
            value: sliderValue,
            onChanged: (value) {
              sliderValue = value;
              setState(() {});
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('0.01 ETH', style: secondaryTextStyle()),
              Text('100 ETH', style: secondaryTextStyle()),
            ],
          ),
          SizedBox(height: 16),
          Text('Onsale in', style: primaryTextStyle(size: 20)),
          SizedBox(height: 16),
          Wrap(
            children: createList.map((e) {
              return InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  createIndex = createList.indexOf(e);
                  setState(() {});
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  padding: EdgeInsets.all(8),
                  width: 80,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: createIndex == createList.indexOf(e) ? nftPrimaryColor : Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(16),
                    gradient: createIndex == createList.indexOf(e) ? linearGradient() : null,
                  ),
                  child: Text(
                    e,
                    style: primaryTextStyle(
                      color: appStore.isDarkModeOn
                          ? null
                          : createIndex == createList.indexOf(e)
                              ? Colors.white
                              : Colors.black,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          SizedBox(height: 16),
          Text('Creator', style: primaryTextStyle(size: 20)),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(16)),
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Verified only', style: primaryTextStyle()),
                Icon(Icons.expand_more_outlined),
              ],
            ),
          ),
          SizedBox(height: 16),
          Divider(height: 1, color: Colors.grey),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), border: Border.all(color: Colors.grey)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.close),
                SizedBox(width: 8),
                Text('Rest all filter', style: primaryTextStyle()),
              ],
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
                  Navigator.push(context, MaterialPageRoute(builder: (_) => DetailScreen(img: data.img)));
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
        ],
      ),
    );
  }
}
