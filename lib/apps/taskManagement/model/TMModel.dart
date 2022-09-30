import 'package:flutter/material.dart';

class TMCategoryModel {
  Color? color1;
  Color? color2;
  String? title;
  String? subTitle;
  IconData? icon;
  String? time;
  bool? isCheckList;
  double? percentage;
  String? progressStatus;
  String? date;
  List<TMIntroModel>? sublist;
  bool? isWidget;
  String? img;
  Widget ? screen;
  bool? mISCheck;
  Widget ? deviceComponent;

  TMCategoryModel({
    this.title,
    this.color1,
    this.color2,
    this.icon,
    this.time,
    this.isCheckList = false,
    this.percentage,
    this.progressStatus,
    this.date,
    this.sublist,
    this.isWidget =false,
    this.img,
    this.subTitle,
    this.screen,
    this.mISCheck = false,
    this.deviceComponent,
  });
}

class TMIntroModel {
  String? title;
  String? description;
  Color? color;
  String? img;
  String? description2;
  bool? tIsCheck;
  IconData? icon;

  TMIntroModel({this.title, this.color, this.description, this.img, this.description2,this.tIsCheck= false,this.icon});
}

