import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMNotesModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMProfileScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TMDetailScreen extends StatefulWidget {
  static String tag = '/TMDetailScreen';
  TMNotesModel? data;

  TMDetailScreen({this.data});

  @override
  TMDetailScreenState createState() => TMDetailScreenState();
}

class TMDetailScreenState extends State<TMDetailScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Detail',
        color: appStore.isDarkModeOn ? scaffoldColorDark : white,
        elevation: 0,
        center: true,
        actions: [
          Container(
            width: 50,
            height: 50,
            child: Image.asset('images/toDoList/profile.png', fit: BoxFit.cover),
          ).cornerRadiusWithClipRRect(16).onTap(
            () {
              TMProfileScreen().launch(context);
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Title", style: secondaryTextStyle()),
            Text(widget.data!.title.validate(), style: boldTextStyle(size: 22)),
            16.height,
            noteDetailData(context, title: 'Place', name: widget.data!.place.validate(), img: 'images/toDoList/tm_location.png'),
            noteDetailData(
              context,
              img: 'images/toDoList/tm_clock.png',
              isCheck: true,
              title: 'Time',
              timeWidget: Row(
                children: [
                  Text('Starts: ${widget.data!.startTime}', style: boldTextStyle()),
                  16.width,
                  Text('Ends: ${widget.data!.endTime.validate()}', style: boldTextStyle()),
                ],
              ),
            ),
            noteDetailData(context, img: 'images/toDoList/tm_notes.png', title: 'Notes', name: widget.data!.notes),
            noteDetailData(context, title: 'Priority', name: widget.data!.priority, img: 'images/toDoList/tm_flag.png'),
            noteDetailData(context, name: widget.data!.calender, title: "Calender", img: 'images/toDoList/tm_calender.png', color: Colors.indigo),
          ],
        ),
      ),
    );
  }
}
