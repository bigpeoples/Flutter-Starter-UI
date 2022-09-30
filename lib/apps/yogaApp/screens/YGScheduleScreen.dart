import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class YGScheduleScreen extends StatefulWidget {
  final String? url;
  final String? text;

  YGScheduleScreen({this.url, this.text});

  @override
  _YGScheduleScreenState createState() => _YGScheduleScreenState();
}

class _YGScheduleScreenState extends State<YGScheduleScreen> {
  bool isFullScreen = false;

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            children: [
              Image.asset(widget.url!, fit: BoxFit.cover, height: isFullScreen ? context.height() * .45 : context.height() * .75),
              Positioned(
                top: 60,
                right: 20,
                child: Container(
                  width: 55,
                  padding: EdgeInsets.all(4),
                  decoration: boxDecorationRoundedWithShadow(20, backgroundColor: appStore.isDarkModeOn ? yg_primaryColor : white),
                  child: Text(DateFormat("mm:ss").format(DateTime.now()),
                      style: boldTextStyle(
                        size: 14,
                      ),
                      textAlign: TextAlign.center),
                ),
              ),
              Positioned(
                top: 45,
                child: IconButton(
                  icon: Icon(Icons.close_sharp),
                  onPressed: () {
                    finish(context);
                  },
                ),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Icon(isFullScreen ? SimpleLineIcons.size_fullscreen : MaterialIcons.fullscreen_exit, size: 22).onTap(
                  () {
                    isFullScreen = !isFullScreen;
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: boxDecorationWithRoundedCorners(
                  backgroundColor: Colors.white,
                  border: Border.all(width: .1),
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                child: Icon(Icons.play_arrow, color: yg_primaryColor, size: 37),
              ),
              8.width,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.text!),
                  8.height,
                  Container(
                    width: 200,
                    height: 6,
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.black12,
                      valueColor: AlwaysStoppedAnimation(yg_primaryColor),
                      value: .5,
                    ).cornerRadiusWithClipRRect(10),
                  ),
                  8.height,
                  Text(DateFormat("mm:ss").format(DateTime.now())),
                ],
              ),
            ],
          ),
          20.height,
        ],
      ),
    );
  }
}
