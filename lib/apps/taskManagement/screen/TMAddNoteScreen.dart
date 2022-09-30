import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMNotesModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMSplashScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMWidgets.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:simple_time_range_picker/simple_time_range_picker.dart';

class TMAddNoteScreen extends StatefulWidget {
  TMNotesModel? updateData;

  TMAddNoteScreen({this.updateData});

  @override
  TMAddNoteScreenState createState() => TMAddNoteScreenState();
}

class TMAddNoteScreenState extends State<TMAddNoteScreen> {
  final scaffoldKey = GlobalKey<FormState>();
  TMNotesModel data = TMNotesModel();

  bool isAlarm = false;
  bool isUpdate = false;

  TextEditingController addTitleCont = TextEditingController();
  TextEditingController addNoteCont = TextEditingController();
  TextEditingController addPlaceCont = TextEditingController();

  String calenderValue = 'Personal';
  String text = '';

  String priorityValue = 'Critical';
  String title = '';

  TimeRangeValue? datePicker = TimeRangeValue.value(startTime: TimeOfDay.now(), endTime: TimeOfDay.now());

  List<String> priority = ['Critical', 'Important', 'Normal', 'Low'];
  List<String> calender = ['Personal', 'Work', 'Shopping', 'Movies To Watch'];

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    isUpdate = widget.updateData != null;
    if (isUpdate) {
      addTitleCont.text = widget.updateData!.title.validate();

      addNoteCont.text = widget.updateData!.notes.validate();
      calenderValue = widget.updateData!.calender.validate();
      priorityValue = widget.updateData!.priority.validate();
      addPlaceCont.text = widget.updateData!.place.validate();
    }
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            finish(context);
          },
          icon: Icon(Icons.close, color: appStore.isDarkModeOn ? white : scaffoldColorDark, size: 20),
        ),
        title: Text("Add Note", style: boldTextStyle()),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          width: context.width(),
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Title", style: secondaryTextStyle()),
                  0.height,
                  AppTextField(
                    textFieldType: TextFieldType.NAME,
                    controller: addTitleCont,
                    textStyle: boldTextStyle(size: 20),
                    decoration: InputDecoration(
                      hintText: "Title",
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.scaffoldBackgroundColor)),
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.scaffoldBackgroundColor)),
                    ),
                  ),
                ],
              ).paddingAll(16),
              addAndEditNotesWidget(
                context,
                title: 'Place',
                img: 'images/toDoList/tm_location.png',
                noteWidget: AppTextField(
                  textFieldType: TextFieldType.ADDRESS,
                  controller: addPlaceCont,
                  textInputAction: TextInputAction.done,
                  textStyle: boldTextStyle(),
                  decoration: InputDecoration(
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.scaffoldBackgroundColor)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.scaffoldBackgroundColor)),
                  ),
                ),
              ),
              addAndEditNotesWidget(
                context,
                img: 'images/toDoList/tm_clock.png',
                title: 'Time',
                noteWidget: Row(
                  children: [
                    Text('Starts : ${_timeFormated(datePicker!.startTime!)}', style: boldTextStyle()),
                    16.width,
                    Text('Ends : ${_timeFormated(datePicker!.endTime!)}', style: boldTextStyle()),
                  ],
                ),
              ).onTap(
                () {
                  TimeRangePicker.show(
                    context: context,
                    unSelectedEmpty: true,
                    startTime: TimeOfDay(hour: datePicker!.startTime!.hour, minute: datePicker!.startTime!.minute),
                    endTime: TimeOfDay(hour: datePicker!.endTime!.hour, minute: datePicker!.endTime!.minute),
                    onSubmitted: (TimeRangeValue value) {
                      hideKeyboard(context);

                      datePicker = value;
                      setState(() {});
                    },
                  );
                },
              ),
              addAndEditNotesDescriptionWidget(
                context,
                img: 'images/toDoList/tm_notes.png',
                widget: AppTextField(
                  textFieldType: TextFieldType.ADDRESS,
                  controller: addNoteCont,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  minLines: 1,
                  maxLines: 18,
                  textStyle: boldTextStyle(),
                  decoration: InputDecoration(
                    hintText: "Notes",
                    hintStyle: secondaryTextStyle(),
                    focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.scaffoldBackgroundColor)),
                    enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: context.scaffoldBackgroundColor)),
                  ),
                ).expand(),
              ),
              addAndEditNotesWidget(
                context,
                img: 'images/toDoList/tm_flag.png',
                title: 'Priority',
                noteWidget: DropdownButton(
                  value: priorityValue,
                  underline: SizedBox(),
                  isExpanded: true,
                  items: priority.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle()),
                      );
                    },
                  ).toList(),
                  onChanged: (String? value) {
                    hideKeyboard(context);

                    priorityValue = value!;
                    setState(() {});
                  },
                ),
              ),
              addAndEditNotesWidget(
                context,
                title: 'Calender',
                color: Colors.indigo,
                img: 'images/toDoList/tm_calender.png',
                noteWidget: DropdownButton(
                  value: calenderValue,
                  isExpanded: true,
                  underline: SizedBox(),
                  items: calender.map<DropdownMenuItem<String>>(
                    (String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyle()),
                      );
                    },
                  ).toList(),
                  onChanged: (String? value) {
                    hideKeyboard(context);

                    calenderValue = value!;
                    setState(() {});
                  },
                ),
              ),
              addAndEditNotesWidget(
                context,
                img: 'images/toDoList/tm_alarm.png',
                onTap: () {
                  isAlarm = !isAlarm;
                  setState(() {});
                },
                noteWidget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Alarm', style: boldTextStyle()),
                    Transform.scale(
                      scale: 0.8,
                      child: CupertinoSwitch(
                        value: isAlarm,
                        activeColor: tmPrimaryColor,
                        onChanged: (bool value) {
                          isAlarm = !isAlarm;
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),
              16.height,
              tmButton(
                context,
                width: context.width(),
                value: "Add",
                icon: Icons.add,
                color: white,
                onTap: () async {
                  if (addTitleCont.text.isEmpty || addNoteCont.text.isEmpty || addPlaceCont.text.isEmpty) {
                    toast('Please enter title & notes');
                  } else {
                    hideKeyboard(context);
                    data.title = addTitleCont.text;
                    data.calender = calenderValue;
                    data.endTime = datePicker!.endTime!.format(context);
                    data.startTime = datePicker!.startTime!.format(context);
                    data.priority = priorityValue;
                    data.notes = addNoteCont.text;
                    data.place = addPlaceCont.text;

                    if (isUpdate) {
                      tmAppStore.updateNotes(data, widget.updateData!);
                    } else {
                      tmAppStore.addNotes(data);
                    }
                    finish(context);
                  }
                },
              ).paddingSymmetric(horizontal: 16, vertical: 16),
            ],
          ),
        ),
      ),
    );
  }
}

String _timeFormated(TimeOfDay time) {
  if (time == null) return "--:--";
  return "${time.hour}:${time.minute}";
}
