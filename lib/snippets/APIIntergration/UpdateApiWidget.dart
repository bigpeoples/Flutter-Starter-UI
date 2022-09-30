import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/network/rest_apis.dart';
import 'package:nb_utils/nb_utils.dart';

class UpdateApiWidget extends StatefulWidget {
  @override
  UpdateApiWidgetState createState() => UpdateApiWidgetState();
}

class UpdateApiWidgetState extends State<UpdateApiWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController jobController = TextEditingController();

  FocusNode nameFocusNode = FocusNode();
  FocusNode jobFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    nameFocusNode.dispose();
    jobFocusNode.dispose();
  }

  void saveData() async {
    if (nameController.text.isNotEmpty && jobController.text.isNotEmpty) {
      Map req = {
        "name": nameController.text,
        "job": jobController.text,
      };

      await updateUser(req).then((value) async {
        await setValue('title', nameController.text);
        await setValue('job', jobController.text);
        toast("Update User Successfully");

        nameController.clear();
        jobController.clear();

        setState(() {});
      }).catchError((e) {
        log(e);
        toast(e.toString());
      });
    } else {
      toast('Both fields required');
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Update for User ID 2', style: boldTextStyle()),
              16.height,
              Text('Name : ' + getStringAsync('title'), style: secondaryTextStyle()).visible(getStringAsync('title').trim().isNotEmpty),
              8.height,
              Text('Job Title : ' + getStringAsync('job'), style: secondaryTextStyle()).visible(getStringAsync('job').trim().isNotEmpty),
              16.height,
              AppTextField(
                controller: nameController,
                focus: nameFocusNode,
                textFieldType: TextFieldType.NAME,
                textInputAction: TextInputAction.next,
                nextFocus: jobFocusNode,
                decoration: inputDecoration(label: 'Enter Name'),
              ),
              16.height,
              AppTextField(
                controller: jobController,
                focus: jobFocusNode,
                textFieldType: TextFieldType.NAME,
                decoration: inputDecoration(label: 'Enter Job Title'),
              ),
              30.height,
              AppButton(
                text: 'Update Data',
                textStyle: boldTextStyle(),
                color: appStore.cardColor,
                onTap: () {
                  saveData();
                  hideKeyboard(context);
                },
              ),
            ],
          ).paddingAll(16),
        ),
      ),
    );
  }
}
