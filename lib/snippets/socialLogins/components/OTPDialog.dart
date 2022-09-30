import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';
import '../OtpSignInScreen.dart';

class OTPDialog extends StatefulWidget {
  static String tag = '/OTPDialog';
  final String verificationId;

  OTPDialog(this.verificationId);

  @override
  OTPDialogState createState() => OTPDialogState();
}

class OTPDialogState extends State<OTPDialog> {
  TextEditingController codeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  Future<void> submit() async {
    if (codeController.text.trim().isNotEmpty) {
      AuthCredential credential = PhoneAuthProvider.credential(verificationId: widget.verificationId, smsCode: codeController.text.trim());

      await auth.signInWithCredential(credential).then((result) {
        OtpSignInScreen(user: result.user).launch(context);
        codeController.clear();
      }).catchError((e) {
        return e;
      });
    } else {
      toast('Please enter OTP');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Enter OTP you received on your number', style: boldTextStyle()),
          30.height,
          AppTextField(
            controller: codeController,
            textFieldType: TextFieldType.PHONE,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.grey[200]!)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.grey[300]!)),
              filled: true,
              fillColor: Colors.grey[100],
              hintText: 'OTP',
            ),
            autoFocus: true,
            onFieldSubmitted: (s) {
              submit();
            },
          ),
          30.height,
          AppButton(
            onTap: () {
              submit();
            },
            text: 'Confirm',
            color: Colors.blue,
            width: context.width(),
          )
        ],
      ),
    );
  }
}
