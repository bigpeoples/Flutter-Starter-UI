import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/DarkModeWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/EditProfileScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/ViewAllNotificationScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class NUProfileFragment extends StatefulWidget {
  @override
  NUProfileFragmentState createState() => NUProfileFragmentState();
}

class NUProfileFragmentState extends State<NUProfileFragment> {
  List<NftAppModel> list = getNotificationData();

  bool mIsCheck = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 260,
            child: Stack(
              children: [
                Image.asset('images/nft/ic_profile.png', height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Image.asset('images/nft/ic_person.png', height: 120),
                      SizedBox(height: 8),
                      Text('Gift Habeshaw', style: boldTextStyle(size: 18)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('150', style: boldTextStyle(size: 20)),
                  SizedBox(height: 4),
                  Text('Following', style: boldTextStyle()),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('2024', style: boldTextStyle(size: 20)),
                  SizedBox(height: 4),
                  Text('Followers', style: boldTextStyle()),
                ],
              ),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  Navigator.push(context, buildPageRoute(child: EditProfileScreen(), pageRouteAnimation: PageRouteAnimation.SlideBottomTop));
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Theme.of(context).cardColor,
                  ),
                  child: Icon(Icons.edit_outlined),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                settingWidget(name: 'Contact@OpenArt.design', icon: Icons.mail_outline, iconData: Icons.chevron_right),
                settingWidget(name: 'Linked', icon: Icons.credit_card, iconData: Icons.chevron_right),
                settingWidget(name: 'OpenArt.design', icon: Icons.link, iconData: Icons.chevron_right),
                settingWidget(
                  name: 'Notification',
                  icon: Icons.notifications_outlined,
                  iconData: Icons.chevron_right,
                  onTap: () {
                    getNotification(context);
                  },
                ),
                settingWidget(
                  name: 'Person',
                  icon: Icons.person_outline,
                  iconData: Icons.chevron_right,
                  onTap: () {
                    getProfileData(context);
                  },
                ),
                DarkModeWidget(),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(side: BorderSide(color: appStore.isDarkModeOn ? Colors.white : Colors.black)),
                      onPressed: () {
                        mIsCheck = !mIsCheck;
                        setState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(mIsCheck ? Icons.favorite : Icons.favorite_border, color: nftPrimaryColor),
                          SizedBox(width: 8),
                          Text('Follow', style: boldTextStyle()),
                        ],
                      ),
                    ),
                    SizedBox(width: 16),
                    Icon(Icons.arrow_circle_up, size: 30)
                  ],
                ),
                SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> getNotification(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Notification', style: boldTextStyle()),
                SizedBox(height: 8),
                ListView.separated(
                  separatorBuilder: (_, index) {
                    return Divider(color: Colors.grey, thickness: 1);
                  },
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: list.length,
                  itemBuilder: (_, index) {
                    NftAppModel data = list[index];

                    return Column(
                      children: [
                        Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.asset(data.img!, fit: BoxFit.cover, height: 50, width: 50),
                            ),
                            SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(data.title!, style: boldTextStyle(), maxLines: 1),
                                  SizedBox(height: 4),
                                  Text(data.subTitle!, style: secondaryTextStyle()),
                                  SizedBox(height: 4),
                                  Text(data.description!, style: secondaryTextStyle()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: 8),
                AppButton(
                  title: 'View all',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context, buildPageRoute(child: ViewAllNotificationScreen(), pageRouteAnimation: PageRouteAnimation.SlideBottomTop));
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<void> getProfileData(BuildContext context) {
  return showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        contentPadding: EdgeInsets.all(16),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Image.asset('images/nft/ic_person.png', fit: BoxFit.cover, height: 50, width: 50),
                SizedBox(width: 8),
                Column(
                  children: [
                    Text('Gift Habeshaw', style: boldTextStyle()),
                    SizedBox(height: 4),
                    Text('52fhgyeyf854fhj', style: secondaryTextStyle()),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: appStore.isDarkModeOn ? scaffoldSecondaryDark : containerBackgroundColor, borderRadius: BorderRadius.circular(16)),
              padding: EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor,
                    ),
                    child: Column(
                      children: [
                        Icon(Icons.account_balance_wallet_outlined),
                      ],
                    ),
                  ),
                  SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text('Balance', style: secondaryTextStyle()),
                      SizedBox(height: 4),
                      Text('5.000 ETH', style: boldTextStyle()),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 16),
            profileList(name: 'My account', iconData: Icons.person_outline),
            profileList(name: 'My items', iconData: Icons.image_outlined),
            profileList(name: 'My invoice', iconData: Icons.receipt_long_outlined),
            profileList(
              name: 'Sign out',
              iconData: Icons.logout_outlined,
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    },
  );
}
