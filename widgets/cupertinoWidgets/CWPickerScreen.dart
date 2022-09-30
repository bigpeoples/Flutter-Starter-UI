import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:nb_utils/nb_utils.dart';

class CWPickerScreen extends StatefulWidget {
  static String tag = '/CWPickerScreen';

  @override
  CWPickerScreenState createState() => CWPickerScreenState();
}

class CWPickerScreenState extends State<CWPickerScreen> {
  List<AppModel> example = [
    AppModel(title: 'Cupertino Date Picker'),
    AppModel(title: 'Cupertino Time Picker'),
    AppModel(title: 'Cupertino Picker'),
  ];

  List countryName = [
    "Afghanistan",
    "Albania",
    "Algeria",
    "Andorra",
    "Angola",
    "Antigua and Barbuda",
    "Argentina",
    "Armenia",
    "Bangladesh",
    "Brazil",
    "Colombia",
    "Denmark",
    "Estonia",
    "France",
    "Guinea-Bissau",
    "Holy See",
    "India",
    "Japan"
  ];

  String? selectedValue;
  String? time;
  String? date;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    time = 'Please Select Time';
    date = 'Please select Date';
    selectedValue = 'Please select value';
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
            itemCount: example.length,
            itemBuilder: (BuildContext context, index) {
              return ExampleItemWidget(example[index], onTap: () {
                if (index == 0) {
                  dateBottomSheet(context);
                } else if (index == 1) {
                  timeBottomSheet(context);
                } else if (index == 2) {
                  pickerBottomSheet(context);
                }
              });
            }),
      ),
    );
  }

  Future<void> timeBottomSheet(context) async {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext e) {
        return Container(
          color: appStore.cardColor,
          height: 250,
          child: Column(
            children: [
              Container(
                color: appStore.cardColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cancel', style: appStore.isDarkModeOn ? primaryTextStyle(size: 18) : primaryTextStyle(size: 18)).onTap(() {
                      finish(context);
                      toast('Please select time');
                      setState(() {});
                    }),
                    Text('Done', style: appStore.isDarkModeOn ? primaryTextStyle(size: 18) : primaryTextStyle(size: 18)).onTap(() {
                      finish(context, time);
                      toast(time!.isNotEmpty ? time : 'Please select time');
                    })
                  ],
                ).paddingAll(8.0),
              ),
              Container(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: appStore.isDarkModeOn ? primaryTextStyle(size: 20) : primaryTextStyle(size: 20))),
                  child: CupertinoDatePicker(
                    backgroundColor: appStore.cardColor,
                    minimumDate: today,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.time,
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime dateTime) {
                      var timeFormat = DateFormat('HH:mm a');
                      String formattedDate = timeFormat.format(dateTime);
                      time = formattedDate;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> dateBottomSheet(context) async {
    var now = DateTime.now();
    var today = DateTime(now.year, now.month, now.day);

    await showModalBottomSheet(
      context: context,
      builder: (BuildContext e) {
        return Container(
          color: appStore.cardColor,
          height: 245,
          child: Column(
            children: [
              Container(
                color: appStore.cardColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Cancel',
                      style: appStore.isDarkModeOn ? boldTextStyle() : boldTextStyle(),
                    ).onTap(
                      () {
                        finish(context);
                        date = today as String;
                        setState(() {});
                      },
                    ),
                    Text(
                      'Done',
                      style: appStore.isDarkModeOn ? boldTextStyle() : boldTextStyle(),
                    ).onTap(
                      () {
                        finish(context, date);
                        toast(date.toString());
                      },
                    ),
                  ],
                ).paddingOnly(top: 8, left: 8, right: 8, bottom: 8),
              ),
              Container(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(textTheme: CupertinoTextThemeData(dateTimePickerTextStyle: appStore.isDarkModeOn ? primaryTextStyle() : primaryTextStyle(size: 20))),
                  child: CupertinoDatePicker(
                    backgroundColor: appStore.cardColor,
                    minimumDate: today,
                    minuteInterval: 1,
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (var dateTime) {
                      var dateFormat = new DateFormat('dd-MM-yyyy');
                      String formattedDate = dateFormat.format(dateTime);
                      print(formattedDate);
                      date = formattedDate;
                      setState(() {});
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<void> pickerBottomSheet(context) async {
    await showModalBottomSheet(
      context: context,
      builder: (BuildContext e) {
        return Container(
          color: appStore.cardColor,
          height: 250,
          child: Column(
            children: [
              Container(
                color: appStore.cardColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cancel', style: appStore.isDarkModeOn ? primaryTextStyle(size: 18) : primaryTextStyle(size: 18)).onTap(
                      () {
                        finish(context);
                        toast('Please select value');
                        setState(() {});
                      },
                    ),
                    Text('Done', style: appStore.isDarkModeOn ? primaryTextStyle(size: 18) : primaryTextStyle(size: 18)).onTap(
                      () {
                        finish(context);
                        toast(selectedValue!.isNotEmpty ? selectedValue : 'Please select value');
                      },
                    )
                  ],
                ).paddingAll(8.0),
              ),
              Container(
                height: 200,
                child: CupertinoTheme(
                  data: CupertinoThemeData(
                    textTheme: CupertinoTextThemeData(
                      pickerTextStyle: primaryTextStyle(),
                    ),
                  ),
                  child: CupertinoPicker(
                    backgroundColor: appStore.cardColor,
                    itemExtent: 30,
                    children: countryName.map((e) {
                      return Text(e, style: appStore.isDarkModeOn ? primaryTextStyle(size: 20) : primaryTextStyle(size: 20));
                    }).toList(),
                    onSelectedItemChanged: (int val) {
                      selectedValue = countryName[val];
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
