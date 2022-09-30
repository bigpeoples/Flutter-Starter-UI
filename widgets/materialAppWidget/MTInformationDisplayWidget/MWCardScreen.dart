import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/Lipsum.dart' as lipsum;
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWCardScreen extends StatefulWidget {
  static String tag = '/MWCardScreen';

  @override
  MWCardScreenState createState() => MWCardScreenState();
}

class MWCardScreenState extends State<MWCardScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            getCard1(),
            getCard2(),
            getCard3(),
            getCard4(),
            getCard5(),
            getCard6(),
            getCard7(),
            getCard8(),
          ],
        ),
      ),
    );
  }

  Widget getCard1() {
    return Card(
      margin: EdgeInsets.all(16),
      color: appBarBackgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: commonCacheImageWidget('https://biniblog.localbini.com/wp-content/uploads/2019/02/green.jpg', 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(lipsum.createWord(numWords: 2), style: boldTextStyle(size: 20, color: textPrimaryColor)),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Text(lipsum.createParagraph(numSentences: 1), style: secondaryTextStyle(size: 16, color: textSecondaryColor)),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard2() {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16),
      color: appBarBackgroundColor,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
      child: InkWell(
        borderRadius: BorderRadius.all(Radius.circular(16)),
        onTap: () {},
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(16), topRight: Radius.circular(16)),
                child: commonCacheImageWidget('https://i.redd.it/4eoh6dh4riz21.jpg', 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fitWidth),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.bookmark, color: iconSecondaryColor, size: 28),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.favorite, color: iconSecondaryColor, size: 28),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(Icons.share, color: iconSecondaryColor, size: 28),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getCard3() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Card(
            color: Colors.deepOrangeAccent,
            shadowColor: Colors.deepOrangeAccent,
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            margin: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Activity", style: boldTextStyle(size: 16, color: Colors.white)),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Image.asset(
                    'images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/run.png',
                    color: Colors.white,
                    fit: BoxFit.cover,
                    alignment: Alignment.bottomRight,
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Card(
            margin: EdgeInsets.only(top: 16, bottom: 16, right: 16),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16))),
            child: InkWell(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              onTap: () {
                //
              },
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 8),
                      child: Text(lipsum.createWord(numWords: 9), maxLines: 2, overflow: TextOverflow.ellipsis, style: primaryTextStyle()),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Feb 27, 2020', style: secondaryTextStyle()),
                          Icon(Icons.date_range, color: iconSecondaryColor),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget getCard4() {
    return Card();
  }

  Widget getCard5() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: boxDecorationWithRoundedCorners(
        boxShadow: [BoxShadow(spreadRadius: 0.8, blurRadius: 0.7, color: grey.withOpacity(0.3))],
        borderRadius: BorderRadius.only(topRight: Radius.circular(16), topLeft: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          commonCacheImageWidget(
            'https://media.istockphoto.com/photos/handsome-african-american-man-in-blank-black-tshirt-standing-against-picture-id1011172576?k=6&m=1011172576&s=612x612&w=0&h=GbqHpASNKzdaRPgJv_G3l9kmrNWcZyhzZhTzjC1QLnQ=',
            250,
            width: context.width(),
            fit: BoxFit.cover,
          ).cornerRadiusWithClipRRectOnly(topLeft: 16, topRight: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$ 19.99', style: boldTextStyle(color: gray, size: 20)),
              Row(
                children: [
                  Icon(Icons.favorite, color: Colors.red),
                  8.width,
                  Text('123', style: boldTextStyle(color: black)),
                ],
              ),
            ],
          ).paddingOnly(left: 16, right: 16, top: 8),
          Text('Muscale Fit Trutleneck Tshirt', style: primaryTextStyle(color: black)).paddingOnly(left: 16, bottom: 16),
        ],
      ),
    );
  }

  Widget getCard6() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              width: 150,
              height: 110,
              decoration: boxDecorationWithRoundedCorners(
                boxShadow: [BoxShadow(spreadRadius: 0.8, blurRadius: 0.7, color: grey.withOpacity(0.3))],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  20.height,
                  Text('Like Image', style: boldTextStyle()),
                  8.height,
                  Text('Like/Unlike', style: secondaryTextStyle(color: gray)),
                ],
              ),
            ).cornerRadiusWithClipRRect(16),
            Positioned(
              top: 0,
              left: 32,
              child: commonCacheImageWidget(
                'images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/widget_card7.png',
                50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ).expand(),
        Stack(
          children: [
            Container(
              margin: EdgeInsets.all(16),
              width: 150,
              height: 110,
              decoration: boxDecorationWithRoundedCorners(boxShadow: [BoxShadow(spreadRadius: 0.8, blurRadius: 0.7, color: grey.withOpacity(0.3))]),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  20.height,
                  Text('Pinterest', style: boldTextStyle()),
                  8.height,
                  Text('Download Image', style: secondaryTextStyle(color: gray)),
                ],
              ),
            ).cornerRadiusWithClipRRect(16),
            Positioned(
              top: 0,
              left: 32,
              child: commonCacheImageWidget(
                'images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/widget_card8.png',
                50,
                width: 50,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget getCard7() {
    return Container(
      margin: EdgeInsets.all(16),
      decoration: boxDecorationWithRoundedCorners(boxShadow: [BoxShadow(spreadRadius: 0.8, blurRadius: 0.7, color: grey.withOpacity(0.3))], borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              commonCacheImageWidget(
                'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/whm060119foodflash-001-1562770762.jpg',
                220,
                width: context.width(),
                fit: BoxFit.cover,
              ).cornerRadiusWithClipRRectOnly(topLeft: 16, topRight: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: white),
                    child: Text('Open', style: boldTextStyle(color: black, size: 14)),
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: white),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.redAccent, size: 20),
                        8.width,
                        Text('4.5', style: boldTextStyle(color: black, size: 14)),
                      ],
                    ),
                  )
                ],
              ).paddingSymmetric(horizontal: 16, vertical: 8),
            ],
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)), color: gray.withOpacity(0.5)),
            width: context.width(),
            child: Column(
              children: [
                Text('Happy Jones', style: boldTextStyle()).paddingOnly(left: 16, right: 16, top: 8),
                4.height,
                Text('Muscale Fit', style: secondaryTextStyle()).paddingOnly(left: 16, bottom: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget getCard8() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Stack(
          children: [
            commonCacheImageWidget(
              'https://i.pinimg.com/originals/96/e4/c1/96e4c1ac9f84d835bb402cd71c91ce32.jpg',
              80,
              width: 150,
              fit: BoxFit.cover,
            ).cornerRadiusWithClipRRect(16),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  20.height,
                  Text('Current Limit', style: boldTextStyle(color: white), textAlign: TextAlign.center),
                  8.height,
                  Text('\$1260.50', style: secondaryTextStyle(color: white), textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        ),
        Stack(
          children: [
            commonCacheImageWidget('images/widgets/materialWidgets/mwInformationDisplayWidgets/cards/widget_card9.jpg', 80, width: 150, fit: BoxFit.cover).cornerRadiusWithClipRRect(16),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  20.height,
                  Text('Payment Due', style: boldTextStyle(color: white), textAlign: TextAlign.center),
                  8.height,
                  Text('\250.50', style: secondaryTextStyle(color: white), textAlign: TextAlign.center),
                ],
              ),
            ),
          ],
        )
      ],
    ).paddingOnly(left: 16, right: 16, bottom: 16);
  }
}
