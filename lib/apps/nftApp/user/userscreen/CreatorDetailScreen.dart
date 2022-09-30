import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class CreatorDetailScreen extends StatefulWidget {
  final String? img;
  final String? img1;

  CreatorDetailScreen({this.img, this.img1});

  @override
  CreatorDetailScreenState createState() => CreatorDetailScreenState();
}

class CreatorDetailScreenState extends State<CreatorDetailScreen> {
  List<NftAppModel> list1 = getCreatorList();

  List<String> list = ['@openart', '@openart.design', 'openart.design'];

  int index = 0;

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
        child: Column(
          children: [
            Container(
              height: 260,
              child: Stack(
                children: [
                  Image.asset(widget.img!, height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(60),
                          child: Image.asset(widget.img1!, height: 120, width: 120, fit: BoxFit.cover),
                        ),
                        SizedBox(height: 8),
                        Text('Kennedy Yanko', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('150', style: boldTextStyle(size: 20)),
                          SizedBox(height: 4),
                          Text('Following', style: boldTextStyle(color: Color(0xff555555))),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('2024', style: boldTextStyle(size: 20)),
                          SizedBox(height: 4),
                          Text('Following', style: boldTextStyle(color: Color(0xff555555))),
                        ],
                      ),
                      OutlinedButton(
                        style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey)),
                        onPressed: () {
                          //
                        },
                        child: Text('Follow', style: boldTextStyle()),
                      )
                    ],
                  ),
                  SizedBox(height: 16),
                  Text('Followed by', style: primaryTextStyle(size: 18)),
                  SizedBox(height: 16),
                  Text(
                    'Trevor Jackson is a multi-disciplinary artist exploring analog + digital realms since 1988. Collaborators inc Apple, BMW, Comme Des Garçons, ICA, NTS, Sonos, Stone Island, Tate Modern + Warp.',
                    style: secondaryTextStyle(),
                  ),
                  SizedBox(height: 16),
                  Text('Member since 2021', style: primaryTextStyle()),
                  SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 16,
                    children: list.map((e) {
                      return Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(color: Colors.grey.withOpacity(0.2), borderRadius: BorderRadius.circular(8)),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.link_outlined),
                            Text(e, style: boldTextStyle()),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: list1.map((e) {
                      return InkWell(
                        highlightColor: Colors.transparent,
                        splashColor: Colors.transparent,
                        onTap: () {
                          index = list1.indexOf(e);
                          setState(() {});
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: index == list1.indexOf(e) ? linearGradient() : null,
                              borderRadius: BorderRadius.circular(8),
                              color: appStore.isDarkModeOn
                                  ? Theme.of(context).cardColor
                                  : index == list1.indexOf(e)
                                      ? nftPrimaryColor
                                      : containerBackgroundColor),
                          padding: EdgeInsets.all(8),
                          margin: EdgeInsets.only(right: 8),
                          child: Text(
                            e.title!,
                            style: boldTextStyle(
                                color: appStore.isDarkModeOn
                                    ? Colors.white
                                    : index == list1.indexOf(e)
                                        ? Colors.white
                                        : Colors.black),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  Container(child: list1[index].widget!)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
