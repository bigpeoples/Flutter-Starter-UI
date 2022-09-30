import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';
import 'package:nb_utils/nb_utils.dart';

import 'YGSettingScreen.dart';

class YGProfileFragment extends StatefulWidget {
  const YGProfileFragment({Key? key}) : super(key: key);

  @override
  _YGProfileFragmentState createState() => _YGProfileFragmentState();
}

class _YGProfileFragmentState extends State<YGProfileFragment> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        'Profile',
        showBack: false,
        elevation: 0,
        color: Colors.transparent,
        textColor: yg_primaryColor,
        actions: [
          IconButton(
              icon: Icon(Icons.settings, color: context.iconColor),
              onPressed: () {
                YGSettingScreen().launch(context);
              })
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(yg_food),
                  radius: 32,
                ),
                // Image.asset(yg_food, height: 120, width: 120, fit: BoxFit.cover).cornerRadiusWithClipRRect(60),
                16.width,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Carly Mary', style: boldTextStyle(size: 18)),
                    8.height,
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('1208', style: boldTextStyle(size: 14)),
                            Text('Followers',
                                style: secondaryTextStyle(
                                  size: 12,
                                )),
                          ],
                        ),
                        20.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('380', style: boldTextStyle(size: 14)),
                            Text('Followers',
                                style: secondaryTextStyle(
                                  size: 12,
                                )),
                          ],
                        ),
                      ],
                    ),
                    8.height,
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Level 1"),
                        2.height,
                        Container(
                          width: 170,
                          height: 6,
                          child: LinearProgressIndicator(
                            backgroundColor: Colors.black12,
                            valueColor: AlwaysStoppedAnimation(yg_primaryColor),
                            value: .5,
                          ).cornerRadiusWithClipRRect(8),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ).paddingAll(12),
            Divider(thickness: 3),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              separatorBuilder: (context, index) => Divider(height: 0),
              itemCount: profileDataList.length,
              itemBuilder: (context, index) {
                return SettingItemWidget(
                  onTap: () {
                    if (profileDataList[index].page != null) profileDataList[index].page.launch(context);
                  },
                  title: profileDataList[index].text.toString(),
                  leading: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(color: profileDataList[index].color, borderRadius: BorderRadius.circular(8)),
                    padding: EdgeInsets.all(8),
                    child: Image.asset(profileDataList[index].url.toString(), color: Colors.white),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: context.iconColor,
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
