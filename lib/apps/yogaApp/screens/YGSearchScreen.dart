import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/components/YGProgramCourseComponent.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:nb_utils/nb_utils.dart';

class YGSearchScreen extends StatefulWidget {
  @override
  _YGSearchScreenState createState() => _YGSearchScreenState();
}

class _YGSearchScreenState extends State<YGSearchScreen> {
  TextEditingController searchController = TextEditingController();

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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: context.scaffoldBackgroundColor,
        leading: BackButton(color: context.iconColor),
        title: Row(
          children: [
            Container(
              height: 35,
              child: AppTextField(
                controller: searchController,
                textFieldType: TextFieldType.OTHER,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                  isDense: true,
                  contentPadding: EdgeInsets.only(top: 6),
                  isCollapsed: true,
                  prefixIcon: Icon(Icons.search),
                  hintText: "Workshop,program/Session",
                  hintStyle: TextStyle(color: context.iconColor, fontSize: 16),
                ),
              ),
            ).expand(),
            10.width,
            Text("Cancel", style: TextStyle(color: Colors.red, fontSize: 16)).onTap(() {
              searchController.clear();
            }),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Hot Searches", style: boldTextStyle(size: 20)),
            16.height,
            Wrap(
              runSpacing: 12,
              spacing: 10,
              children: List.generate(
                searchList.length,
                (index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width * 0.28,
                    decoration: boxDecorationWithRoundedCorners(
                      backgroundColor: searchList[index].isLike! ? Colors.white : yg_primaryColor,
                      boxShadow: defaultBoxShadow(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      searchList[index].text!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: searchList[index].isLike! ? Colors.black : Colors.white),
                    ),
                  ).onTap(
                    () {
                      searchList[index].isLike = !searchList[index].isLike!;
                      setState(() {});
                    },
                  );
                },
              ),
            ).center(),
            16.height,
            Text("Popular Courses", style: boldTextStyle(size: 20)),
            YGProgramCourseWidget(list: homeTabList),
          ],
        ),
      ),
    );
  }
}
