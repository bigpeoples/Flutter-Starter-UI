import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class MWWrapScreen1 extends StatefulWidget {
  @override
  MWWrapScreen1State createState() => MWWrapScreen1State();
}

class MWWrapScreen1State extends State<MWWrapScreen1> {
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
        padding: EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          children: List.generate(
            dataList.length,
            (index) => Container(
              decoration: boxDecorationWithRoundedCorners(borderRadius: BorderRadius.circular(16), backgroundColor: dataList[index].bgColor!),
              child: Column(
                children: [
                  commonCacheImageWidget(
                    dataList[index].images,
                    200,
                    width: (context.width() * 0.5 - 26),
                    fit: BoxFit.cover,
                  ).cornerRadiusWithClipRRectOnly(bottomLeft: 16, bottomRight: 16),
                  Container(
                    width: (context.width() * 0.5 - 26),
                    padding: EdgeInsets.all(16),
                    child: Text(dataList[index].name!, style: boldTextStyle(color: white), textAlign: TextAlign.center),
                  )
                ],
              ).cornerRadiusWithClipRRect(16),
            ),
          ),
        ),
      ),
    );
  }
}

class DataModel {
  String? images;
  String? name;
  Color? bgColor;

  DataModel({this.images, this.name, this.bgColor});
}

List<DataModel> dataList = [
  DataModel(images: 'https://img.freepik.com/free-photo/muscular-arab-man-training-modern-gym_151355-7426.jpg?size=626&ext=jpg', name: 'Jack', bgColor: gray),
  DataModel(images: 'https://static.toiimg.com/thumb/msid-78118340,imgsize-896783,width-800,height-600,resizemode-75/78118340.jpg', name: 'David', bgColor: Colors.blue),
  DataModel(images: 'https://www.fnbbuzz.com/wp-content/uploads/2019/09/gym-owner.jpg', name: 'Jhon', bgColor: orange),
  DataModel(images: 'https://www.axisbank.com/images/default-source/progress-with-us_new/home-gym.jpg', name: 'Smit', bgColor: salmon),
  DataModel(images: 'https://freedesignfile.com/upload/2016/10/Strong-male-gym-workout-biceps-HD-picture.jpg', name: 'Hayden', bgColor: tomato),
  DataModel(images: 'https://runningmagazine.ca/wp-content/uploads/2020/07/Screen-Shot-2020-07-19-at-4.10.38-PM-1200x675.jpg', name: 'Angelina', bgColor: Colors.black54),
];
