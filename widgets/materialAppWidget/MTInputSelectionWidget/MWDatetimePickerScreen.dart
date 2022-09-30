import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWDatetimePickerScreen extends StatefulWidget {
  static String tag = '/MWDatetimePickerScreen';

  @override
  MWDatetimePickerScreenState createState() => MWDatetimePickerScreenState();
}

class MWDatetimePickerScreenState extends State<MWDatetimePickerScreen> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
      helpText: 'Select your Booking date',
      cancelText: 'Not Now',
      confirmText: "Book",
      fieldLabelText: 'Booking Date',
      fieldHintText: 'Month/Date/Year',
      errorFormatText: 'Enter valid date',
      errorInvalidText: 'Enter date in valid range',
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );

    if (picked != null && picked != selectedDate) {
      print(picked);
      selectedDate = picked;

      setState(() {});
    }
  }

  Future<Null> selectTime(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(context: context, initialTime: selectedTime);

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: appStore.cardColor,
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: radius(defaultRadius),
                ),
                child: ListTile(
                  onTap: () {
                    selectDate(context);
                  },
                  title: Text('Select your Booking date', style: appStore.isDarkModeOn ? secondaryTextStyle() : primaryTextStyle()),
                  subtitle: Text("${selectedDate.toLocal()}".split(' ')[0], style: appStore.isDarkModeOn ? secondaryTextStyle() : secondaryTextStyle()),
                  trailing: IconButton(
                    icon: Icon(Icons.date_range, color: iconSecondaryColor),
                    onPressed: () {
                      selectDate(context);
                    },
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: appStore.cardColor,
                  border: Border.all(color: Theme.of(context).dividerColor),
                  borderRadius: radius(defaultRadius),
                ),
                child: ListTile(
                  onTap: () {
                    selectTime(context);
                  },
                  title: Text('Select your checking time', style: appStore.isDarkModeOn ? secondaryTextStyle() : primaryTextStyle()),
                  subtitle: Text(
                    "${selectedTime.hour < 10 ? "0${selectedTime.hour}" : "${selectedTime.hour}"} : ${selectedTime.minute < 10 ? "0${selectedTime.minute}" : "${selectedTime.minute}"} ${selectedTime.period != DayPeriod.am ? 'PM' : 'AM'}   ",
                    style: appStore.isDarkModeOn ? secondaryTextStyle() : secondaryTextStyle(),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.date_range, color: iconSecondaryColor),
                    onPressed: () {
                      selectTime(context);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
