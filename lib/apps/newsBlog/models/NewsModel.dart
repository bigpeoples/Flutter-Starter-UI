import 'package:flutter/material.dart';

class NewsModel {
  String? img;
  String? subTitle;
  String? title;
  String? timeAgo;
  String? type;
  String? tag;
  bool? saved;
  Widget? icon;
  Widget? widget;

  NewsModel({this.saved, this.img, this.subTitle, this.title, this.timeAgo, this.type, this.tag,this.icon,this.widget});
}

class Category {
  String? title;
  bool? status;

  Category({this.title, this.status});
}

class Channel {
  String? img;
  String? name;
  Widget? newsChannel;

  Channel({this.img, this.name, this.newsChannel});
}
