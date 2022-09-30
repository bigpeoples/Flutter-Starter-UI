import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:awesome_notifications/awesome_notifications.dart' as Utils show DateUtils;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

class ScheduledNotificationScreen extends StatefulWidget {
  static String tag = '/ScheduledNotificationScreen';

  @override
  ScheduledNotificationScreenState createState() => ScheduledNotificationScreenState();
}

class ScheduledNotificationScreenState extends State<ScheduledNotificationScreen> {
  final globalScaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? _pickedDate;
  TimeOfDay? _pickedTime;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    AwesomeNotifications().initialize(
      'resource://drawable/app_icon',
      [
        NotificationChannel(
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF4C76EA),
          ledColor: Colors.white,
        ),
        NotificationChannel(
            channelKey: 'badge_channel',
            channelName: 'Badge indicator notifications',
            channelDescription: 'Notification channel to activate badge indicator',
            channelShowBadge: true,
            defaultColor: Color(0xFF4C76EA),
            ledColor: Colors.yellow),
      ],
    );

    AwesomeNotifications().listScheduledNotifications().then((value) {
      log(value.length);
    });
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: globalScaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              16.height,
              AppButton(
                color: appStore.cardColor,
                height: 40,
                width: context.width(),
                shapeBorder: RoundedRectangleBorder(borderRadius: radius(10)),
                child: Text("Schedule Notification", style: boldTextStyle(size: 14)),
                onTap: () async {
                  if (await pickScheduleDate(context)) {
                    toast('Notification Scheduled at ${DateFormat('hh:mm a').format(_pickedDate!)}');
                    showNotificationAtScheduleCron(8, _pickedDate!);
                  }
                },
              ).center().paddingOnly(left: 20, right: 20),
              16.height,
              Text('List of Scheduled Notifications', style: secondaryTextStyle()).paddingLeft(16),
              20.height,
              FutureBuilder<List<NotificationModel>>(
                future: AwesomeNotifications().listScheduledNotifications(),
                builder: (_, snap) {
                  if (snap.hasData) {
                    if (snap.data!.isNotEmpty) {
                      return ListView.builder(
                        itemCount: snap.data!.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        padding: EdgeInsets.all(8),
                        itemBuilder: (_, index) {
                          NotificationModel data = snap.data![index];

                          return Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(data.content!.title.validate(), style: boldTextStyle()),
                                4.height,
                                Text(DateFormat('dd/MM/yyyy hh:mm a').format(DateTime.parse(data.content!.displayedDate!)), style: secondaryTextStyle()),
                              ],
                            ),
                            padding: EdgeInsets.all(8),
                          );
                        },
                      );
                    } else {
                      return Text('No data', style: primaryTextStyle()).center();
                    }
                  }
                  return snapWidgetHelper(snap);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> pickScheduleDate(BuildContext context) async {
    TimeOfDay? timeOfDay;

    DateTime? newDate = await showDatePicker(
      context: context,
      initialDate: _pickedDate ?? DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        Duration(days: 365),
      ),
    );

    if (newDate != null) {
      timeOfDay = await showTimePicker(
        context: context,
        initialTime: _pickedTime ?? TimeOfDay.now(),
      );

      if (timeOfDay != null && (_pickedDate != newDate || _pickedTime != timeOfDay)) {
        setState(() {
          _pickedTime = timeOfDay;
          _pickedDate = DateTime(newDate.year, newDate.month, newDate.day, timeOfDay!.hour, timeOfDay.minute);
        });
        return true;
      }
      return false;
    }

    return false;
  }

  Future<void> showNotificationAtScheduleCron(int id, DateTime scheduleTime) async {
    //ToDo Update Latest Library Code
    AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'basic_channel',
        title: 'Schedule Notification title',
        body: 'This notification was schedule to shows at ',
        payload: {'uuid': 'uuid-test'},
        autoDismissible: false,
      ),
      /* schedule: NotificationSchedule(
        crontabSchedule: CronHelper.instance.atDate(scheduleTime.toUtc(), initialSecond: 0),
      ),*/
    );
  }
}
