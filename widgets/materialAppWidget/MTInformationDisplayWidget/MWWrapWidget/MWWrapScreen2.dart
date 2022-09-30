import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWWrapScreen2 extends StatefulWidget {
  @override
  MWWrapScreen2State createState() => MWWrapScreen2State();
}

class MWWrapScreen2State extends State<MWWrapScreen2> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: List.generate(
            dataList.length,
            (index) {
              DataModel data = dataList[index];

              return Container(
                height: context.height() * 0.24,
                width: context.width() * 0.3 - 8,
                decoration: boxDecorationWithRoundedCorners(
                  boxShadow: [BoxShadow(spreadRadius: 0.8, blurRadius: 0.7, color: grey.withOpacity(0.3))],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        commonCacheImageWidget(
                          data.images,
                          context.height() * 0.14,
                          width: context.width() * 0.3 - 8,
                          fit: BoxFit.cover,
                        ).cornerRadiusWithClipRRectOnly(topLeft: 16, topRight: 16),
                        Container(
                          padding: EdgeInsets.all(4),
                          margin: EdgeInsets.only(left: 8, top: 8),
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: paleVioletRed),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.favorite_outline, color: white, size: 20),
                              8.width,
                              Text(data.like.toString(), style: boldTextStyle(color: white, size: 14)),
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 4,
                          child: Container(
                            width: 35,
                            height: 35,
                            child: commonCacheImageWidget(data.userImage, 35, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
                        color: data.bgColor,
                      ),
                      padding: EdgeInsets.only(left: 16, top: 8, bottom: 4),
                      width: context.width(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.name!, style: boldTextStyle(color: white, size: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                          4.height,
                          Text(data.subTitle!, style: secondaryTextStyle(color: white, size: 14), maxLines: 1, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    ).expand(),
                  ],
                ),
              );
            },
          ),
        ).paddingOnly(left: 16, right: 16, bottom: 16),
      ),
    );
  }
}

class DataModel {
  String? images;
  String? userImage;
  String? name;
  String? subTitle;
  Color? bgColor;
  int? like;

  DataModel({this.images, this.name, this.bgColor, this.like, this.subTitle, this.userImage});
}

List<DataModel> dataList = [
  DataModel(
    images: 'https://wallpapercave.com/wp/wp3708216.jpg',
    name: 'Hambur',
    bgColor: indianRed.withOpacity(0.6),
    like: 110,
    subTitle: 'Awesome',
    userImage: 'https://randomuser.me/api/portraits/women/57.jpg',
  ),
  DataModel(
      images: 'https://i.pinimg.com/originals/bd/79/a4/bd79a4d6860ba48f37062ec58c9c073a.jpg', name: 'Steak', bgColor: seaGreen, like: 150, subTitle: 'Nice', userImage: 'https://randomuser.me/api/portraits/men/41.jpg'),
  DataModel(
      images: 'https://cdn.pixabay.com/photo/2017/05/07/08/56/pancakes-2291908__340.jpg',
      name: 'Seafood',
      bgColor: Colors.black54,
      like: 98,
      subTitle: 'fabulous',
      userImage: 'https://randomuser.me/api/portraits/women/66.jpg'),
  DataModel(
      images: 'https://www.halfbakedharvest.com/wp-content/uploads/2020/02/Earl-Grey-Lemon-Ricotta-Pancakes-with-Salted-Maple-Butter-1-700x1050.jpg',
      name: 'Bacon',
      bgColor: tomato,
      like: 110,
      subTitle: 'Awesome',
      userImage: 'https://randomuser.me/api/portraits/men/70.jpg'),
  DataModel(
      images: 'https://image.freepik.com/free-photo/homemade-salad-dark-plate_23-2148537158.jpg',
      name: 'Kebab',
      bgColor: salmon,
      like: 110,
      subTitle: 'Great',
      userImage: 'https://randomuser.me/api/portraits/women/75.jpg'),
  DataModel(
      images: 'https://foodess.com/wp-content/uploads/foodess-img/gingerbread-pancakes-1-11jpg.jpg',
      name: 'Sausage',
      bgColor: orange,
      like: 110,
      subTitle: 'Awesome',
      userImage: 'https://randomuser.me/api/portraits/men/80.jpg'),
];
