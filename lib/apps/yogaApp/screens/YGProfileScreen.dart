import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class YGProfileScreen extends StatefulWidget {
  @override
  _YGProfileScreenState createState() => _YGProfileScreenState();
}

class _YGProfileScreenState extends State<YGProfileScreen> {
  int like = 430;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 270.0,
              leading: BackButton(
                color: context.iconColor,
              ),
              floating: true,
              pinned: true,
              title: Text(
                innerBoxIsScrolled ? "Carly Mary" : "",
                style: boldTextStyle(),
              ),
              // backgroundColor: context.scaffoldBackgroundColor,
              backgroundColor: appStore.isDarkModeOn ? context.scaffoldBackgroundColor : Colors.white,

              iconTheme: IconThemeData(color: innerBoxIsScrolled ? Colors.black : Colors.white),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Image.asset(yg_exerciseImage2, fit: BoxFit.cover, height: 220, width: context.width()).cornerRadiusWithClipRRect(defaultRadius),
                    Positioned(
                      bottom: 95,
                      right: 20,
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("1,208", style: boldTextStyle(size: 18)),
                              Text('Followers', style: secondaryTextStyle(size: 12)),
                            ],
                          ).onTap(() {
                            //
                          }),
                          20.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text("380", style: boldTextStyle(size: 18)),
                              Text('Following', style: secondaryTextStyle(size: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 50,
                      left: 8,
                      child: Container(
                        height: 95,
                        width: 95,
                        margin: EdgeInsets.all(4),
                        decoration: boxDecorationWithRoundedCorners(
                          decorationImage: DecorationImage(image: AssetImage(yg_food), fit: BoxFit.cover),
                          borderRadius: BorderRadius.all(Radius.circular(55)),
                        ),
                      ),
                    ),
                    Positioned(bottom: 30, left: 14, child: Text('Carly Mary', style: boldTextStyle(size: 16))),
                    Positioned(
                        bottom: 15,
                        left: 14,
                        child: Text('123455|Germany',
                            style: secondaryTextStyle(
                              size: 12,
                            ))),
                  ],
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: List.generate(
              topicList.length,
              (i) {
                return Column(
                  children: [
                    Row(
                      children: [
                        Image.asset(yg_food, height: 50, width: 50, fit: BoxFit.cover).cornerRadiusWithClipRRect(25),
                        8.width,
                        Text('Carly Mary', style: boldTextStyle(size: 14)).expand(),
                        Text(topicList[i].date!, style: secondaryTextStyle())
                      ],
                    ),
                    Text(
                      topicList[i].text!,
                      style: secondaryTextStyle(),
                    ),
                    10.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        topicList[i].image!.length,
                        (index) {
                          return Image.asset(
                            topicList[i].image![index].image!,
                            height: 90,
                            width: MediaQuery.of(context).size.width * .28,
                            fit: BoxFit.cover,
                          ).cornerRadiusWithClipRRect(10);
                        },
                      ),
                    ),
                    16.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        topicList[i].like!
                            ? Icon(Icons.favorite_border, color: Colors.grey)
                            : Icon(Icons.favorite, color: Colors.red).onTap(() {
                                topicList[i].like = !topicList[i].like!;
                                topicList[i].like! ? like-- : like++;
                                setState(() {});
                              }),
                        5.width,
                        Text(like.toString(), style: secondaryTextStyle()),
                        10.width,
                        Icon(
                          MaterialCommunityIcons.comment_processing,
                          color: iconColorSecondary,
                        ),
                        5.width,
                        Text('70', style: secondaryTextStyle()),
                      ],
                    ),
                    10.height,
                    Divider(thickness: 3),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(16),
        height: 45,
        decoration: BoxDecoration(borderRadius: radius(20), color: yg_primaryColor),
        width: context.width(),
        child: Text('create your Topics'.toUpperCase(), style: boldTextStyle(color: Colors.white)).center().onTap(
          () {
            //
          },
        ),
      ),
    );
  }
}
