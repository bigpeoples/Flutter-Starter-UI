import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:mighty_ui_kit/main/services/FirebaseUserService.dart';
import 'package:mighty_ui_kit/snippets/firebaseCRUD/model/FBUserModel.dart';
import 'package:nb_utils/nb_utils.dart';

class FirebaseCreate extends StatefulWidget {
  static String tag = '/FirebaseCreate';

  @override
  FirebaseCreateState createState() => FirebaseCreateState();
}

class FirebaseCreateState extends State<FirebaseCreate> {
  final _formKey = GlobalKey<FormState>();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;

  TextEditingController fullName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  FocusNode emailFocus = FocusNode();
  FocusNode passFocus = FocusNode();

  String? documentID;
  FirebaseUserService user = FirebaseUserService();
  bool isShowPwd = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void dispose() {
    fullName.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AppBarScroller(
          title: 'User Registration',
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        AppTextField(
                          controller: fullName,
                          keyboardType: TextInputType.text,
                          textFieldType: TextFieldType.NAME,
                          nextFocus: emailFocus,
                          decoration: inputDecoration(label: 'Full Name'),
                        ),
                        16.height,
                        AppTextField(
                          controller: email,
                          keyboardType: TextInputType.emailAddress,
                          textFieldType: TextFieldType.EMAIL,
                          focus: emailFocus,
                          nextFocus: passFocus,
                          decoration: inputDecoration(label: 'Email'),
                        ),
                        16.height,
                        AppTextField(
                          controller: password,
                          keyboardType: TextInputType.text,
                          textFieldType: TextFieldType.PASSWORD,
                          focus: passFocus,
                          decoration: inputDecoration(label: 'Password'),
                        ),
                        16.height,
                        AppButton(
                          color: appStore.cardColor,
                          onTap: () async {
                            if (_formKey.currentState!.validate()) {
                              hideKeyboard(context);

                              await user.addDocument(FBUserModel(fullName: fullName.text, password: password.text, email: email.text)).then((value) {
                                toast("RegisterUser successfully");
                                fullName.clear();
                                email.clear();
                                password.clear();
                              }).catchError((e) {
                                toast(e.toString());
                              });
                            }
                          },
                          child: Text("Register", style: boldTextStyle()),
                        )
                      ],
                    ),
                  ).paddingAll(16)
                ],
              ),
            ).center(),
          ),
        ),
      ),
    );
  }
}
