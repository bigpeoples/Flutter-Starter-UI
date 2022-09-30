import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSColors.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSImages.dart';
import 'package:mighty_ui_kit/apps/groceryApp/utils/GSWidgets.dart';
import 'package:nb_utils/nb_utils.dart';

class GSEditProfileScreen extends StatefulWidget {
  static String tag = '/GSEditProfileScreen';

  @override
  GSEditProfileScreenState createState() => GSEditProfileScreenState();
}

class GSEditProfileScreenState extends State<GSEditProfileScreen> {
  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  FocusNode nameNode = FocusNode();
  FocusNode emailNode = FocusNode();
  FocusNode dateOfBirthNode = FocusNode();
  FocusNode phoneNode = FocusNode();

  DateTime? _date;
  String value = '';

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  Future<void> selectDate(BuildContext context) async {
    DateTime? _datePicker = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1947),
      lastDate: DateTime(2030),
    );
    if (_datePicker != null && _datePicker != _date) {
      _date = _datePicker;
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: gsStatusBarWithTitle(context, "Personal Info") as PreferredSizeWidget?,
      body: Stack(
        children: [
          ListView(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      gs_user,
                      width: 110,
                      height: 110,
                      fit: BoxFit.fill,
                    ).cornerRadiusWithClipRRect(60).center(),
                    16.height,
                    AppTextField(
                      autoFocus: false,
                      controller: nameController,
                      textFieldType: TextFieldType.NAME,
                      decoration: inputDecoration(label: "Name"),
                      focus: nameNode,
                      nextFocus: emailNode,
                      keyboardType: TextInputType.text,
                    ),
                    16.height,
                    AppTextField(
                      autoFocus: false,
                      controller: emailController,
                      textFieldType: TextFieldType.EMAIL,
                      decoration: inputDecoration(label: "Email Address"),
                      focus: emailNode,
                      keyboardType: TextInputType.text,
                    ),
                    16.height,
                    TextFormField(
                      textAlign: TextAlign.start,
                      controller: dateOfBirthController,
                      autofocus: false,
                      showCursor: false,
                      keyboardType: TextInputType.number,
                      decoration: inputDecoration(label: "Date of Birth"),
                      onTap: () async {
                        hideKeyboard(context);
                        await selectDate(context);
                        dateOfBirthController.text = _date!.day.toString();
                        dateOfBirthController.text = _date!.month.toString();
                        dateOfBirthController.text = _date!.year.toString();
                        value = dateOfBirthController.text = _date!.day.toString() + "/" + _date!.month.toString() + "/" + _date!.year.toString();
                        setState(() {});
                      },
                    ),
                    20.height,
                    Row(
                      children: [
                        CountryCodePicker(
                          onChanged: print,
                          initialSelection: 'IT',
                          favorite: ['+39', 'FR'],
                          showCountryOnly: false,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                        ),
                        AppTextField(
                          autoFocus: false,
                          controller: phoneController,
                          textFieldType: TextFieldType.PHONE,
                          focus: phoneNode,
                          textAlign: TextAlign.start,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: grey)),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: gs_primary_color)),
                            hintText: "000 0000 0000",
                            hintStyle: secondaryTextStyle(size: 14),
                          ),
                        ).expand()
                      ],
                    ),
                  ],
                ).paddingAll(16),
              ),
            ],
          ),
          Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: gsAppButton(
              context,
              'Save',
              () {
                if (formKey.currentState!.validate()) {
                  finish(context);
                }
              },
            ),
          ),
        ],
      ).withHeight(context.height()),
    ).paddingOnly(top: 16);
  }
}
