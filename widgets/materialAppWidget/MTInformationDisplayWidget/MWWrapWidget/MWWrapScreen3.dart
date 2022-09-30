import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWWrapScreen3 extends StatefulWidget {
  @override
  MWWrapScreen3State createState() => MWWrapScreen3State();
}

class MWWrapScreen3State extends State<MWWrapScreen3> {
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
        child: Container(
          child: Wrap(
            spacing: 16.0,
            runSpacing: 16.0,
            children: List.generate(
              dataList.length,
              (index) {
                DataModel data = dataList[index];
                return Stack(
                  clipBehavior: Clip.hardEdge,
                  children: [
                    Container(
                      height: context.height() * 0.4,
                      width: context.width() * 0.5 - 26,
                      margin: EdgeInsets.only(top: 30),
                      decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(16), backgroundColor: data.bgColor!),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(data.name!, style: boldTextStyle(color: white)),
                          8.height,
                          Text(data.subTitle!, style: secondaryTextStyle(color: white), maxLines: 2, overflow: TextOverflow.ellipsis),
                        ],
                      ).paddingAll(8),
                    ),
                    Container(
                      padding: EdgeInsets.all(12),
                      height: context.height() * 0.34,
                      width: context.width() * 0.5 - 26,
                      child: commonCacheImageWidget(
                        data.images,
                        context.height() * 0.3,
                        width: context.width() * 0.39,
                        fit: BoxFit.cover,
                      ).cornerRadiusWithClipRRect(16),
                    ),
                  ],
                );
              },
            ),
          ).paddingOnly(left: 16, right: 16, bottom: 16),
        ),
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

  DataModel({this.images, this.name, this.bgColor, this.subTitle, this.userImage});
}

List<DataModel> dataList = [
  DataModel(
    images: 'https://i.ytimg.com/vi/0QrbdHhP2Us/maxresdefault.jpg',
    name: 'Hamburger',
    bgColor: indianRed.withOpacity(0.6),
    subTitle: 'Awesome',
    userImage: 'https://randomuser.me/api/portraits/women/57.jpg',
  ),
  DataModel(
      images: 'https://image.freepik.com/free-photo/glad-young-man-resting-cafe-reading-interesting-book-drinking-tea_8353-6242.jpg',
      name: 'Steak',
      bgColor: seaGreen,
      subTitle: 'Nice',
      userImage: 'https://randomuser.me/api/portraits/men/41.jpg'),
  DataModel(
      images: 'https://i.pinimg.com/originals/8a/0f/f1/8a0ff1ed614d724bbcb4ca180203980b.jpg',
      name: 'Seafood',
      bgColor: Colors.black54,
      subTitle: 'fabulous',
      userImage: 'https://randomuser.me/api/portraits/women/66.jpg'),
  DataModel(
      images: 'https://48b6yd3iigex2rv7g41h5sts-wpengine.netdna-ssl.com/wp-content/uploads/2019/08/short-books.jpg',
      name: 'Bacon',
      bgColor: tomato,
      subTitle: 'Awesome',
      userImage: 'https://randomuser.me/api/portraits/men/70.jpg'),
  DataModel(
      images: 'https://images0.westend61.de/0000793444pw/young-man-reading-book-at-home-GIOF02897.jpg', name: 'Kebab', bgColor: salmon, subTitle: 'Great', userImage: 'https://randomuser.me/api/portraits/women/75.jpg'),
  DataModel(images: 'https://image.freepik.com/free-photo/portrait-man-reading-book_23-2148238842.jpg', name: 'Sausage', bgColor: orange, subTitle: 'Awesome', userImage: 'https://randomuser.me/api/portraits/men/80.jpg'),
];
