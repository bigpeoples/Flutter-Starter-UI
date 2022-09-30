import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/screen/ChoiceScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../main.dart';

class CreateAccountScreen extends StatefulWidget {
  @override
  CreateAccountScreenState createState() => CreateAccountScreenState();
}

class CreateAccountScreenState extends State<CreateAccountScreen> {
  bool _showPassword = false;

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
        padding: EdgeInsets.only(left: 16, right: 16, top: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Username', style: primaryTextStyle()),
            SizedBox(height: 16),
            profileWidget(name: 'Username', iconData: Icon(Icons.person_outline_outlined, color: Theme.of(context).iconTheme.color), context: context),
            SizedBox(height: 16),
            Text('Email address', style: primaryTextStyle()),
            SizedBox(height: 16),
            profileWidget(name: 'Email', iconData: Icon(Icons.mail_outline_outlined, color: Theme.of(context).iconTheme.color), context: context),
            SizedBox(height: 16),
            Text('Password', style: primaryTextStyle()),
            SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
              child: TextFormField(
                cursorColor: Theme.of(context).iconTheme.color,
                style: primaryTextStyle(),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.lock_outlined, color: Theme.of(context).iconTheme.color),
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        _showPassword = !_showPassword;
                      });
                    },
                    child: Icon(
                      _showPassword ? Icons.visibility : Icons.visibility_off,
                      color: Theme.of(context).iconTheme.color,
                    ),
                  ),
                  border: InputBorder.none,
                  hintText: 'Password',
                  hintStyle: primaryTextStyle(),
                  contentPadding: EdgeInsets.all(16),
                ),
                obscureText: !_showPassword,
              ),
            ),
            SizedBox(height: 16),
            AppButton(
              title: 'Continue',
              onTap: () {
                hideKeyword(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => ChoiceScreen()));
              },
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Expanded(child: Container(height: 1, color: Colors.grey, width: MediaQuery.of(context).size.width)),
                SizedBox(width: 16),
                Text('OR', style: boldTextStyle()),
                SizedBox(width: 16),
                Expanded(child: Container(height: 1, color: Colors.grey, width: MediaQuery.of(context).size.width)),
              ],
            ),
            SizedBox(height: 4),
            ContinueWidget(name: 'Continue with Apple', img: appStore.isDarkModeOn ? 'images/nft/ic_apple_dark.png' : 'images/nft/ic_apple.png'),
            ContinueWidget(name: 'Continue with Google', img: 'images/nft/ic_google.png'),
            SizedBox(height: 4),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already have an account?', style: primaryTextStyle()),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Sign In', style: boldTextStyle()),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
