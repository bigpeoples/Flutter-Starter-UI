import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/network/rest_apis.dart';
import 'package:nb_utils/nb_utils.dart';

class PostApiWidget extends StatefulWidget {
  @override
  PostApiWidgetState createState() => PostApiWidgetState();
}

class PostApiWidgetState extends State<PostApiWidget> {
  var formKey = GlobalKey<FormState>();

  TextEditingController nameCont = TextEditingController();
  TextEditingController jobCont = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode jobFocusNode = FocusNode();

  String? id = '';
  String? createdAt = '';

  bool mIsLoading = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  Future<void> saveData() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      mIsLoading = true;
      setState(() {});

      Map req = {
        "name": nameCont.text,
        "job": jobCont.text,
      };
      await createEmployee(req).then((value) {
        id = value['id'];
        createdAt = value['createdAt'];
        setState(() {});
        toast("Create User Successfully ");
      }).catchError((e) {
        toast(e.toString());
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    jobFocusNode.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppTextField(
                controller: nameCont,
                focus: nameFocusNode,
                nextFocus: jobFocusNode,
                textFieldType: TextFieldType.NAME,
                decoration: inputDecoration(label: 'Enter Name'),
              ),
              16.height,
              AppTextField(
                controller: jobCont,
                focus: jobFocusNode,
                textFieldType: TextFieldType.NAME,
                decoration: inputDecoration(label: 'Enter Job'),
              ),
              16.height,
              AppButton(
                color: appStore.cardColor,
                textStyle: boldTextStyle(),
                onTap: () async {
                  hideKeyboard(context);
                  await saveData();

                  nameCont.clear();
                  jobCont.clear();

                  mIsLoading = false;
                  setState(() {});
                },
                text: 'Send',
              ),
              24.height,
              Text(createdAt!, style: primaryTextStyle()).visible(createdAt!.isNotEmpty),
              Text('Loading..', style: primaryTextStyle()).visible(mIsLoading),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
