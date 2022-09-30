import 'package:flutter/material.dart';

class NftAppModel {
  String? title;
  String? subTitle;
  String? description;
  String? img;
  String? img1;
  bool isCheck;
  Widget? widget;

  NftAppModel({this.title, this.subTitle, this.img, this.img1, this.description, this.isCheck = false, this.widget});
}
