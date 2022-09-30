import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMProfileScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class TMCalenderFragment extends StatefulWidget {
  const TMCalenderFragment({Key? key}) : super(key: key);

  @override
  _TMCalenderFragmentState createState() => _TMCalenderFragmentState();
}

class _TMCalenderFragmentState extends State<TMCalenderFragment> {
  List<Color> colorList = [Color(0xFF6E70DA), Color(0xFFFF9495), Color(0xFF67B9CF), Color(0xFF67B9CF)];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(
        '',
        elevation: 0,
        color: context.cardColor,
        actions: [
          GestureDetector(
            onTap: () {
              TMProfileScreen().launch(context, pageRouteAnimation: PageRouteAnimation.Scale);
            },
            child: Container(
              padding: EdgeInsets.all(22),
              margin: EdgeInsets.only(right: 16),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(fit: BoxFit.scaleDown, image: Image.asset('images/toDoList/profile.png').image),
              ),
            ),
          ),
        ],
        backWidget: Icon(Entypo.list, color: context.iconColor),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: SfCalendar(
          view: CalendarView.day,
          selectionDecoration: BoxDecoration(border: Border.all(color: transparentColor, width: 2)),
          dataSource: MeetingDataSource(_getDataSource()),
          allowedViews: <CalendarView>[
            CalendarView.day,
            CalendarView.workWeek,
            CalendarView.week,
            CalendarView.month,
            CalendarView.timelineDay,
            CalendarView.timelineWeek,
            CalendarView.timelineWorkWeek,
            CalendarView.timelineMonth,
            CalendarView.schedule
          ],
          monthViewSettings: MonthViewSettings(appointmentDisplayMode: MonthAppointmentDisplayMode.appointment, showAgenda: true),
          todayHighlightColor: tmPrimaryColor,
          weekNumberStyle: WeekNumberStyle(textStyle: boldTextStyle(size: 20)),
          timeSlotViewSettings: TimeSlotViewSettings(timeIntervalWidth: 100, timelineAppointmentHeight: 100),
        ),
      ),
    );
  }
}

List<Meeting> _getDataSource() {
  final List<Meeting> meetings = <Meeting>[];
  final DateTime today = DateTime.now();
  final DateTime startTime = DateTime(today.year, today.month, today.day, 1, 0, 0);
  final DateTime endTime = startTime.add(const Duration(hours: 1));
  final DateTime clientMeetingStartTime = DateTime(today.year, today.month, today.day, 7, 0, 0);
  final DateTime clientMeetingEndTime = startTime.add(const Duration(hours: 2));
  final DateTime clientMeetingStartTime2 = DateTime(today.year, today.month, today.day, 10, 0, 0);
  final DateTime clientMeetingEndTime2 = startTime.add(const Duration(hours: 1));
  final DateTime clientMeetingStartTime3 = DateTime(today.year, today.month, today.day, 12, 0, 0);
  final DateTime clientMeetingEndTime3 = startTime.add(const Duration(hours: 1));
  final DateTime clientMeetingStartTime4 = DateTime(today.year, today.month, today.day, 8, 0, 0);
  final DateTime clientMeetingEndTime4 = startTime.add(const Duration(hours: 4));
  meetings.add(
    Meeting('WeekEnd HangOut', startTime, endTime, const Color(0xFF6E70DA), false, Icons.watch_later_rounded),
  );
  meetings.add(
    Meeting('Meeting With Client', clientMeetingStartTime, clientMeetingEndTime, const Color(0xFFFF9495), false, Icons.watch_later_rounded),
  );
  meetings.add(
    Meeting('Meet the Deadline of App Design', clientMeetingStartTime2, clientMeetingEndTime2, const Color(0xFF67B9CF), false, Icons.watch_later_rounded),
  );
  meetings.add(
    Meeting('Hangout For RefreshMent', clientMeetingStartTime3, clientMeetingEndTime3, const Color(0xFF67B9CF), false, Icons.watch_later_rounded),
  );
  meetings.add(
    Meeting('Hangout For RefreshMent', clientMeetingStartTime4, clientMeetingEndTime4, const Color(0xFF67B9CF), false, Icons.watch_later_rounded),
  );

  return meetings;
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].background;
  }

  @override
  bool isAllDay(int index) {
    return appointments![index].isAllDay;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay, this.icon);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
  IconData icon;
}
