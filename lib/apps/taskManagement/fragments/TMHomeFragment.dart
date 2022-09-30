import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/taskManagement/components/TMPlanListComponent.dart';
import 'package:mighty_ui_kit/apps/taskManagement/components/TMUpCommingComponent.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMNotesModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMAddNoteScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMDetailScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMDueScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMHistoryScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMMoviesScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMSearchScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMSplashScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMDataProvider.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class TMHomeFragment extends StatefulWidget {
  const TMHomeFragment({Key? key}) : super(key: key);

  @override
  _TMHomeFragmentState createState() => _TMHomeFragmentState();
}

class _TMHomeFragmentState extends State<TMHomeFragment> {
  int selectedIndex = 0;
  List<TMCategoryModel> mPlanList = tmGetCategoryList();

  @override
  void initState() {
    super.initState();
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.scaffoldBackgroundColor,
        appBar: appBarWidget(
          '',
          color: context.cardColor,
          backWidget: Icon(Entypo.list, color: context.iconColor),
          elevation: 0,
          actions: [
            GestureDetector(
                onTap: () {
                  TMSearchScreen().launch(context);
                },
                child: noteSearchIcon(context, searchImage: 'images/toDoList/tm_searchIcon.png').paddingOnly(right: 16))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              Text('Hey Shourav', style: secondaryTextStyle(size: 20, color: grey)).paddingSymmetric(horizontal: 16),
              4.height,
              Text("what's  your  plan?", style: boldTextStyle(size: 24)).paddingSymmetric(horizontal: 16),
              HorizontalList(
                itemCount: mPlanList.length,
                padding: EdgeInsets.all(16),
                itemBuilder: (_, index) {
                  return TMPlanListComponent(index: index);
                },
              ),
              16.height,
              Text("Upcoming To-do's", style: boldTextStyle()).paddingOnly(left: 20, right: 20),
              16.height,
              Observer(
                builder: (_) {
                  if (tmAppStore.notesList.length == 0)
                    return Text("No Upcoming To-do's", style: secondaryTextStyle()).center();
                  else
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: tmAppStore.notesList.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        TMNotesModel data = tmAppStore.notesList[index];
                        return TMUpComingComponent(
                          data: data,
                          onEditClicked: () async {
                            TMAddNoteScreen(updateData: data).launch(context);
                          },
                          onDeleteClicked: () async {
                            tmAppStore.removeNotes(data);
                          },
                          onTapped: () {
                            TMDetailScreen(data: data).launch(context);
                          },
                        );
                      },
                    );
                },
              ),
              16.height,
              SettingItemWidget(
                title: "Due's",
                trailing: Icon(Icons.keyboard_arrow_right, size: 16),
                onTap: () {
                  TMDueScreen().launch(context);
                },
              ),
              Divider(height: 0),
              SettingItemWidget(
                title: "Notes",
                trailing: Icon(Icons.keyboard_arrow_right, size: 16),
                onTap: () {
                  TMMoviesScreen().launch(context);
                },
              ),
              Divider(height: 0),
              SettingItemWidget(
                title: "History",
                trailing: Icon(Icons.keyboard_arrow_right, size: 16),
                onTap: () {
                  TMHistoryScreen().launch(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
