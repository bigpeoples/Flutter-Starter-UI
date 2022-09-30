import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGTrainingWidgetComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';
import 'package:nb_utils/nb_utils.dart';

class YGYogaBasicForBeginnerScreen extends StatefulWidget {
  final String? name;

  YGYogaBasicForBeginnerScreen({this.name});

  @override
  _YGYogaBasicForBeginnerScreenState createState() => _YGYogaBasicForBeginnerScreenState();
}

class _YGYogaBasicForBeginnerScreenState extends State<YGYogaBasicForBeginnerScreen> {
  int currentPosition = 0;
  PageController? pageController;
  double ratingStar = 0;
  double ratingStarLong = 0;
  double ratingSmile = 0;

  Widget commonButton({required String image, required String text, int? number, required Color color}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 35,
          width: 35,
          decoration: boxDecorationWithRoundedCorners(backgroundColor: color),
          child: Image.asset(image, color: Colors.white).paddingAll(8),
        ),
        5.width,
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(text, style: secondaryTextStyle()),
            Text(number.toString(), style: boldTextStyle(size: 14)),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    pageController = PageController(initialPage: currentPosition);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 250.0,
              floating: true,
              pinned: true,
              title: Text(innerBoxIsScrolled ? widget.name! : "", style: boldTextStyle(), maxLines: 1, overflow: TextOverflow.ellipsis),
              backgroundColor: context.scaffoldBackgroundColor,
              iconTheme: IconThemeData(color: context.iconColor),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    PageView.builder(
                      itemCount: homeFragmentList.length,
                      itemBuilder: (context, i) {
                        return Image.asset(homeFragmentList[i].url!, fit: BoxFit.cover);
                      },
                      controller: pageController,
                      onPageChanged: (int page) {
                        currentPosition = page;
                        setState(() {});
                      },
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: DotIndicator(pageController: pageController!, pages: homeFragmentList, indicatorColor: yg_primaryColor).paddingAll(8),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.name!, style: boldTextStyle(size: 22)),
              8.height,
              Text('Keeps Your Body in Shape',
                  style: secondaryTextStyle(
                    size: 14,
                  )),
              8.height,
              Row(
                children: [
                  RatingBar.builder(
                    onRatingUpdate: (val) {},
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemBuilder: (context, _) => Icon(Icons.star, color: Colors.yellow),
                    itemSize: 16,
                    ignoreGestures: true,
                  ),
                  6.width,
                  Text("(286 Reviews)", style: secondaryTextStyle()),
                  24.height,
                ],
              ),
              32.height,
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  commonButton(color: yg_primaryColor, image: yg_level, text: " Level", number: 1),
                  commonButton(color: Colors.indigo, image: yg_week, text: " Weeks", number: 1),
                  commonButton(color: Colors.yellow, image: yg_minutes, text: "Mins ", number: 20),
                  40.width,
                ],
              ),
              16.height,
              Divider(thickness: 1),
              16.height,
              Text(
                'Complete Beginner Should Start here! this bundle will teach you basics yoga poses to fill you with '
                'energy and joy. Hop on your mat and start to build',
                textAlign: TextAlign.center,
                style: secondaryTextStyle(),
              ),
              16.height,
              Text("Schedule", style: boldTextStyle(color: yg_primaryColor, size: 20)),
              YGTrainingWidget(list: yogaBasicForBeginnerList),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(16),
        height: 45,
        decoration: BoxDecoration(borderRadius: radius(20), color: yg_primaryColor),
        width: context.width(),
        alignment: Alignment.center,
        child: Text(
          'add your practise'.toUpperCase(),
          style: boldTextStyle(color: Colors.white),
          textAlign: TextAlign.center,
        ).onTap(() {
          //
        }),
      ),
    );
  }
}
