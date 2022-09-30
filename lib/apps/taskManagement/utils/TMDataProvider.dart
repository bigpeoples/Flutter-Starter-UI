import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/model/TMModel.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';

List<TMIntroModel> tmGetIntroList() {
  List<TMIntroModel> list = [];
  list.add(TMIntroModel(
    title: "Multiple Devices",
    description: 'Please enter your email address or phone \nnumber for reset your password',
    img: 'images/toDoList/tm_deviceOnboarding.png',
  ));
  list.add(TMIntroModel(
    title: "Grate Reminder",
    description: 'Please enter your email address or phone \nnumber for reset your password',
    img: 'images/toDoList/tm_reminderOnBoarding.png',
  ));
  list.add(TMIntroModel(
    title: "Time Saving & Productive",
    description: 'Please enter your email address or phone \nnumber for reset your password',
    img: 'images/toDoList/tm_prouductiveOnBoarding.png',
  ));
  return list;
}

List<TMCategoryModel> tmGetCategoryList() {
  List<TMCategoryModel> list = [];
  list.add(TMCategoryModel(title: "Personal", color1: Color(0XFF66a6ff), color2: Color(0XFF89f7fe)));
  list.add(TMCategoryModel(title: "Work", color1: Color(0XFF84fab0), color2: Color(0XFF8fd3f4)));
  list.add(TMCategoryModel(title: "Shopping", color1: Color(0XFFff9a9e), color2: Color(0XFFfad0c4)));
  list.add(TMCategoryModel(title: "Movies to watch", color1: Color(0XFF667eea), color2: Color(0XFF764ba2)));
  return list;
}

List<TMCategoryModel> toDoList() {
  List<TMCategoryModel> list = [];
  list.add(TMCategoryModel(title: 'Meeting with client', icon: Icons.check, time: '06:58 PM'));
  list.add(TMCategoryModel(title: 'Take my pet to veteran', icon: Icons.check, time: '04:04 AM'));
  list.add(TMCategoryModel(title: 'Call CEO for meeting', icon: Icons.check, time: '07:12 PM'));
  list.add(TMCategoryModel(title: 'Meeting the deadline of app design', icon: Icons.check, time: '07:33AM'));
  list.add(TMCategoryModel(title: 'Buy a macBook', icon: Icons.check, time: '08:11PM'));
  list.add(TMCategoryModel(title: 'Hangout with refreshment', icon: Icons.check, time: '10:06 AM'));
  return list;
}

List<TMCategoryModel> recentlyCompletedList() {
  List<TMCategoryModel> list = [];
  list.add(TMCategoryModel(title: 'Sunday', percentage: 25.0, progressStatus: 'Completed : 4'));
  list.add(TMCategoryModel(title: 'Monday', percentage: 30.0, progressStatus: 'Completed : 2'));
  list.add(TMCategoryModel(title: 'Tuesday', percentage: 40.0, progressStatus: 'Completed : 4'));
  list.add(TMCategoryModel(title: 'Wednesday', percentage: 38.0, progressStatus: 'Completed : 0'));
  list.add(TMCategoryModel(title: 'Thursday', percentage: 25.0, progressStatus: 'Completed : 1'));
  list.add(TMCategoryModel(title: 'Friday', percentage: 48.0, progressStatus: 'Completed : 0'));
  list.add(TMCategoryModel(title: 'Saturday', percentage: 30.0, progressStatus: 'Completed : 2'));

  return list;
}

List<TMCategoryModel> toDuesList() {
  List<TMCategoryModel> list = [];
  list.add(TMCategoryModel(title: 'Meeting with client', icon: Icons.check, date: '13 Nov'));
  list.add(TMCategoryModel(title: 'Take my pet to veteran', icon: Icons.check, date: '04 Sep'));
  list.add(TMCategoryModel(title: 'Call CEO for meeting', icon: Icons.check, date: '30 Nov'));
  list.add(TMCategoryModel(title: 'Meeting the deadline of app design', icon: Icons.check, date: '07 Apr'));
  list.add(TMCategoryModel(title: 'Buy a macBook', icon: Icons.check, date: '06 Sep'));
  list.add(TMCategoryModel(title: 'Hangout with refreshment', icon: Icons.check, date: '11 Sep'));
  return list;
}

List<TMCategoryModel> toMoviesList() {
  List<TMCategoryModel> list = [];
  list.add(TMCategoryModel(title: 'jumanji', icon: Icons.check));
  list.add(TMCategoryModel(title: 'Mission Impossible', icon: Icons.check));
  list.add(TMCategoryModel(title: 'jurassic Park', icon: Icons.check));
  list.add(TMCategoryModel(title: 'Mortal Combat', icon: Icons.check));
  list.add(TMCategoryModel(title: 'GodFather', icon: Icons.check));
  return list;
}

List<TMCategoryModel> toFinishedList() {
  List<TMCategoryModel> list = [];
  list.add(TMCategoryModel(title: ' Swasank Redemption', icon: Icons.check));
  list.add(TMCategoryModel(title: 'Romeo & juliet', icon: Icons.check));
  list.add(TMCategoryModel(title: 'Talk to Pamela and Betty', icon: Icons.check));

  return list;
}

List<TMCategoryModel> toHistoryList() {
  List<TMCategoryModel> list = [];
  list.add(
    TMCategoryModel(
      title: 'Urgent',
      sublist: [
        TMIntroModel(icon: Icons.check, title: 'Meeting with client', description: '11 Jun'),
        TMIntroModel(icon: Icons.check, title: 'Take my pet to veteran', description: '27 Mar'),
        TMIntroModel(icon: Icons.check, title: 'Call CEO for meeting', description: '13 Feb'),
        TMIntroModel(icon: Icons.check, title: 'Meeting deadLine with app design ', description: '16 jan')
      ],
    ),
  );
  list.add(
    TMCategoryModel(
      title: 'Work',
      sublist: [
        TMIntroModel(icon: Icons.check, title: 'Meeting with client', description: '31 Mar'),
        TMIntroModel(icon: Icons.check, title: 'Take my pet to veteran', description: '05 jul'),
        TMIntroModel(icon: Icons.check, title: 'Call CEO for meeting', description: '01 Mar'),
      ],
    ),
  );
  list.add(
    TMCategoryModel(
      title: 'Personal',
      sublist: [
        TMIntroModel(icon: Icons.check, title: 'Meeting with client', description: '14 Feb'),
        TMIntroModel(icon: Icons.check, title: 'Take my pet to veteran', description: '03 Nov'),
      ],
    ),
  );
  list.add(
    TMCategoryModel(
      title: 'Personal',
      sublist: [
        TMIntroModel(icon: Icons.check, title: 'Meeting with client', description: '18 Mar'),
      ],
    ),
  );
  return list;
}

List<TMCategoryModel> tmSelectLanguageList() {
  List<TMCategoryModel> list = [];
  list.add(TMCategoryModel(title: 'English'));
  list.add(TMCategoryModel(title: 'Albanian'));
  list.add(TMCategoryModel(title: 'Arabic(OverView)'));
  list.add(TMCategoryModel(title: 'Armenian'));
  list.add(TMCategoryModel(title: 'Bengali'));
  list.add(TMCategoryModel(title: 'Bulgarian'));
  list.add(TMCategoryModel(title: 'Burmese'));
  list.add(TMCategoryModel(title: 'Danish'));
  list.add(TMCategoryModel(title: 'Greek'));
  list.add(TMCategoryModel(title: 'HaWaiian'));
  list.add(TMCategoryModel(title: 'Hungarian'));
  list.add(TMCategoryModel(title: 'Italian'));
  list.add(TMCategoryModel(title: 'Japanese'));

  return list;
}

List<TMCategoryModel> tmTimeZoneList() {
  List<TMCategoryModel> list = [];
  list.add(TMCategoryModel(title: 'Eastern Day light Time', subTitle: 'Usa GMT-4'));
  list.add(TMCategoryModel(title: 'Central Day light Time', subTitle: 'Chicago GMT-5'));
  list.add(TMCategoryModel(title: 'Mountain Day light Time', subTitle: 'Denver GMT-6'));
  list.add(TMCategoryModel(title: 'Mountain Standard Time', subTitle: 'Phoenix GMT-7'));
  list.add(TMCategoryModel(title: 'Pacific Day Light Time Time', subTitle: 'Los Angeles GMT-7'));

  return list;
}

List<TMCategoryModel> tmThemeList() {
  List<TMCategoryModel> list = [];
  list.add(
    TMCategoryModel(color1: tmPrimaryColor, color2: tmSecondaryColor, title: 'ColorFul'),
  );
  list.add(
    TMCategoryModel(color1: theme1ContainerColor, color2: theme2ContainerColor, title: 'Neutral'),
  );
  list.add(
    TMCategoryModel(color1: theme3ContainerColor, color2: theme4ContainerColor, title: 'Red'),
  );
  list.add(
    TMCategoryModel(color1: theme5ContainerColor, color2: theme6ContainerColor, title: 'Blue'),
  );
  list.add(
    TMCategoryModel(color1: theme7ContainerColor, color2: theme8ContainerColor, title: 'Pink'),
  );
  return list;
}
