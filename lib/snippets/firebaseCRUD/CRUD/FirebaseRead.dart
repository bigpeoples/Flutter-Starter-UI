import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:mighty_ui_kit/main/services/FirebaseUserService.dart';
import 'package:mighty_ui_kit/snippets/firebaseCRUD/CRUD/FirebaseUpdateDelete.dart';
import 'package:nb_utils/nb_utils.dart';

class FirebaseRead extends StatefulWidget {
  static String tag = '/FirebaseReadUpdateDelete';

  @override
  FirebaseReadState createState() => FirebaseReadState();
}

class FirebaseReadState extends State<FirebaseRead> {
  FirebaseUserService user = FirebaseUserService();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FocusNode passFocus = FocusNode();

  bool isShowPwd = true;
  final _formKey = GlobalKey<FormState>();

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

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppBarScroller(
          title: 'Login User',
          child: SingleChildScrollView(
            child: Column(
              children: [
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      16.height,
                      AppTextField(
                        controller: email,
                        nextFocus: passFocus,
                        decoration: inputDecoration(label: 'Email'),
                        textFieldType: TextFieldType.EMAIL,
                      ),
                      16.height,
                      AppTextField(
                        controller: password,
                        focus: passFocus,
                        decoration: inputDecoration(label: 'Password'),
                        textFieldType: TextFieldType.PASSWORD,
                      ),
                    ],
                  ),
                ).paddingAll(16),
                AppButton(
                  color: appStore.cardColor,
                  onTap: () async {
                    if (_formKey.currentState!.validate()) {
                      await user.loginUser(email.text, password.text).then((value) {
                        FirebaseUpdateDelete(user: value).launch(context);
                        email.clear();
                        password.clear();
                      }).catchError((error) {
                        toast(error);
                      });
                    }
                  },
                  child: Text("Login", style: boldTextStyle()),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
