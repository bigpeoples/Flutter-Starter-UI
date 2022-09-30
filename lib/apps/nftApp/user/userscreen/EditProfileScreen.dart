import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../../main.dart';


class EditProfileScreen extends StatefulWidget {
  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends State<EditProfileScreen> {
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
    return Scaffold(
      backgroundColor: appStore.isDarkModeOn ? scaffoldSecondaryDark : scaffoldBackgroundColor,
      appBar: appBar(isBack: true),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 260,
              child: Stack(
                children: [
                  Image.asset('images/nft/ic_profile.png', height: 200, width: MediaQuery.of(context).size.width,fit: BoxFit.cover),
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
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Enter your details', style: primaryTextStyle(size: 18)),
                  SizedBox(height: 16),
                  profileWidget(name: 'Name', context: context),
                  SizedBox(height: 16),
                  profileWidget(name: 'Username', context: context),
                  SizedBox(height: 16),
                  profileWidget(name: 'Email', context: context),
                  SizedBox(height: 16),
                  Text('Add your email address to receive notifications about your activity on Foundation. This will not be shown on your profile.', style: secondaryTextStyle()),
                  SizedBox(height: 16),
                  Text('Enter your bio', style: primaryTextStyle(size: 18)),
                  SizedBox(height: 16),
                  profileWidget(name: 'Enter your bio here', maxLines: 3, context: context),
                  SizedBox(height: 16),
                  Text('Upload a profile image', style: primaryTextStyle(size: 18)),
                  SizedBox(height: 16),
                  Container(
                    padding: EdgeInsets.all(32),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(16)),
                    child: Column(
                      children: [
                        Icon(Icons.image_outlined),
                        SizedBox(height: 16),
                        Text('Drag and drop or browce a file', style: boldTextStyle(size: 18)),
                        SizedBox(height: 4),
                        Text('PNG,GIF,WEBP,MP4 or MP3.(Max 1 GB)', style: secondaryTextStyle()),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Text('Verify your profile', style: primaryTextStyle(size: 18)),
                  SizedBox(height: 16),
                  Text('Show the Foundation community that your profile is authentic.', style: secondaryTextStyle()),
                  SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          side: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                          )),
                      onPressed: () {
                        //
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/nft/ic_twitter.png', fit: BoxFit.cover, height: 30, width: 30),
                          SizedBox(width: 8),
                          Text('Verify via Twitter', style: boldTextStyle()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                          padding: EdgeInsets.only(top: 8, bottom: 8),
                          side: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                          )),
                      onPressed: () {
                        //
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/nft/ic_instagram.jpg', fit: BoxFit.cover, height: 30, width: 30),
                          SizedBox(width: 8),
                          Text('Verify via Instagram', style: boldTextStyle()),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  AppButton(
                    title: 'Save',
                    onTap: () {
                      //
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
