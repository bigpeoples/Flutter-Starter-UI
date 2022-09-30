import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGProgramCourseComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class YGEssentialsForBeginnerScreen extends StatefulWidget {
  const YGEssentialsForBeginnerScreen({Key? key}) : super(key: key);

  @override
  _YGEssentialsForBeginnerScreenState createState() => _YGEssentialsForBeginnerScreenState();
}

class _YGEssentialsForBeginnerScreenState extends State<YGEssentialsForBeginnerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Essentials For Beginners', center: true, showBack: true, color: context.scaffoldBackgroundColor),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Programs', style: boldTextStyle(size: 22)),
            YGProgramCourseWidget(list: homeTabList),
          ],
        ),
      ),
    );
  }
}
