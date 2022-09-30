import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

import '../../../main.dart';

class WalletAlertDialogWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Connect wallet', style: boldTextStyle(size: 20)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
          Image.asset('images/nft/ic_server.png', height: 100, width: 100, fit: BoxFit.cover),
          SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: [
                TextSpan(text: 'By connecting your wallet, you agree to ', style: secondaryTextStyle()),
                TextSpan(text: ' Terms of Service', style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.grey)),
                TextSpan(text: ' and our', style: secondaryTextStyle()),
                TextSpan(text: ' Privacy Policy', style: secondaryTextStyle(color: appStore.isDarkModeOn ? Colors.white : Colors.grey)),
              ],
            ),
          ),
          SizedBox(height: 16),
          AppButton(
            title: 'Connect wallet',
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(height: 16),
          Text('Learn more about wallets', style: secondaryTextStyle())
        ],
      ),
    );
  }
}
