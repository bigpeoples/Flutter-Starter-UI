import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:nb_utils/nb_utils.dart';

///
/// Note: whenever start SharedPreferences implement at that time first add await initialize(); in you Perform that dart file.
///

class SharedPreferenceScreen extends StatefulWidget {
  @override
  _SharedPreferenceScreenState createState() => _SharedPreferenceScreenState();
}

class _SharedPreferenceScreenState extends State<SharedPreferenceScreen> {
  TextEditingController controllerString = TextEditingController();
  TextEditingController controllerInt = TextEditingController();
  TextEditingController controllerBool = TextEditingController();

  FocusNode focusNodeString = FocusNode();
  FocusNode focusNodeInt = FocusNode();

  bool isShow = false;
  bool isSwitched = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    focusNodeString.dispose();
    focusNodeInt.dispose();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  void saveData() async {
    if (controllerInt.text.trim().isDigit()) {
      await setValue(IntExampleSharedPref, controllerInt.text.toInt());
    } else {
      await setValue(IntExampleSharedPref, 0);
    }

    await setValue(StringExampleSharedPref, controllerString.text);
    await setValue(BoolExampleSharedPref, isSwitched);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Save Data', textAlign: TextAlign.center, style: boldTextStyle(size: 18)),
            20.height,
            Text('String', style: secondaryTextStyle()),
            4.height,
            AppTextField(
              controller: controllerString,
              textFieldType: TextFieldType.NAME,
              decoration: InputDecoration(
                hintText: 'Enter String',
                hintStyle: secondaryTextStyle(),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: grey, width: 0.5)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0.5)),
              ),
              nextFocus: focusNodeInt,
              autoFocus: true,
            ),
            24.height,
            Text('Integer', style: secondaryTextStyle()),
            4.height,
            AppTextField(
              controller: controllerInt,
              textFieldType: TextFieldType.PHONE,
              focus: focusNodeInt,
              decoration: InputDecoration(
                hintText: 'Enter Number',
                hintStyle: secondaryTextStyle(),
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: grey, width: 0.5)),
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey, width: 0.5)),
              ),
            ),
            24.height,
            Row(
              children: [
                Text('Bool', style: secondaryTextStyle()),
                16.width,
                Switch(
                  value: isSwitched,
                  activeTrackColor: Colors.grey.withOpacity(0.5),
                  activeColor: Colors.blueAccent,
                  onChanged: (value) {
                    isSwitched = value;
                    setState(() {});
                  },
                ),
              ],
            ),
            16.height,
            AppButton(
              color: appStore.cardColor,
              text: 'Save',
              textStyle: boldTextStyle(),
              width: context.width(),
              onTap: () {
                saveData();

                isShow = true;
                setState(() {});

                FocusScopeNode currentFocus = FocusScope.of(context);

                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.unfocus();
                }
              },
            ).center(),
            30.height,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Load Data', textAlign: TextAlign.center, style: boldTextStyle(size: 18)),
                16.height,
                Row(
                  children: [
                    Text('String Value : ', style: secondaryTextStyle(size: 16)),
                    Text(getStringAsync(StringExampleSharedPref), style: primaryTextStyle(size: 16)),
                  ],
                ).visible(getStringAsync(StringExampleSharedPref).isNotEmpty),
                8.height,
                Row(
                  children: [
                    Text('Integer Value : ', style: secondaryTextStyle(size: 16)),
                    Text(getIntAsync(IntExampleSharedPref).toString(), style: primaryTextStyle(size: 16)),
                  ],
                ).visible(getIntAsync(IntExampleSharedPref) != 0),
                8.height,
                Row(
                  children: [
                    Text('Bool Value : ', style: secondaryTextStyle(size: 16)),
                    Text(getBoolAsync(BoolExampleSharedPref).toString(), style: primaryTextStyle(size: 16)),
                  ],
                ),
              ],
            ).visible(isShow),
          ],
        ).paddingAll(16),
      ),
    );
  }
}
