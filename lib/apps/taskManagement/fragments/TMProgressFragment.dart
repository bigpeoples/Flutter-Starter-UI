import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/taskManagement/components/TMChartComponent.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMProfileScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class TMProgressFragment extends StatefulWidget {
  const TMProgressFragment({Key? key}) : super(key: key);

  @override
  _TMProgressFragmentState createState() => _TMProgressFragmentState();
}

class _TMProgressFragmentState extends State<TMProgressFragment> {
  List<TMCategoryModel> progressList = recentlyCompletedList();

  Widget completedTaskWidget(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: boxDecorationDefault(borderRadius: radius(), color: context.cardColor),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('GOALS', style: boldTextStyle()),
              8.height,
              Text('Completed Tasks', style: secondaryTextStyle()),
              8.height,
              Text('26/55', style: boldTextStyle(size: 24)),
            ],
          ),
        ],
      ),
    );
  }

  Widget recentCompletedListWidget(TMCategoryModel data, BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(data.title.validate(), style: primaryTextStyle()),
          8.height,
          Row(
            children: [
              Container(
                child: SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbShape: SliderComponentShape.noOverlay,
                    overlayShape: SliderComponentShape.noOverlay,
                  ),
                  child: Slider(
                    min: 0,
                    max: 60,
                    activeColor: tmPrimaryColor,
                    value: data.percentage!.toDouble(),
                    onChanged: (value) {
                      data.percentage = value;
                    },
                  ),
                ),
              ).expand(),
              8.width,
              Text(data.progressStatus.validate(), style: secondaryTextStyle()),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        '',
        color: context.cardColor,
        backWidget: Icon(
          Entypo.list,
          color: context.iconColor,
        ),
        elevation: 0,
        actions: [
          GestureDetector(
            onTap: () {
              TMProfileScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
            },
            child: Container(
              padding: EdgeInsets.all(22),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.scaleDown,
                  image: Image.asset('images/toDoList/profile.png').image,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              completedTaskWidget(context),
              16.height,
              TMChartComponent(),
              16.height,
              Container(
                decoration: boxDecorationDefault(color: context.cardColor),
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Recently Completed', style: boldTextStyle(size: 18)),
                    8.height,
                    ListView.builder(
                      itemCount: progressList.length,
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (_, int index) {
                        TMCategoryModel data = progressList[index];
                        return recentCompletedListWidget(data, context);
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
