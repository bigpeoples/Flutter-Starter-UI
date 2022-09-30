import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/DarkModeWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/EditProfileScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class NCProfileFragment extends StatefulWidget {
  @override
  NCProfileFragmentState createState() => NCProfileFragmentState();
}

class NCProfileFragmentState extends State<NCProfileFragment> {
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
                Image.asset('images/nft/ic_nft7.jpg', height: 200, fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    children: [
                      Image.asset('images/nft/ic_person.png', height: 120),
                      SizedBox(height: 8),
                      Text('Gift Habeshaw', style: boldTextStyle()),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 8),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(8),
              onTap: () {
                Navigator.push(context, buildPageRoute(child: EditProfileScreen(), pageRouteAnimation: PageRouteAnimation.SlideBottomTop));
              },
              child: Container(
                margin: EdgeInsets.only(right: 16),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Theme.of(context).cardColor,
                ),
                child: Icon(Icons.edit_outlined),
              ),
            ),
          ),
          SizedBox(height: 8),
          Container(
            margin: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
            child: Column(
              children: [
                settingWidget(name: 'Contact@OpenArt.design', icon: Icons.mail_outline, iconData: Icons.chevron_right),
                settingWidget(name: 'Linked', icon: Icons.credit_card, iconData: Icons.chevron_right),
                settingWidget(name: '(+60) 264 859 62', icon: Icons.phone, iconData: Icons.chevron_right),
                settingWidget(name: 'OpenArt.design', icon: Icons.link, iconData: Icons.chevron_right),
                DarkModeWidget(),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(side: BorderSide(color: Colors.grey), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
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
}
