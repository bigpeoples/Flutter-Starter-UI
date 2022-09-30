import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

List<Color> getCommonColors() {
  List<Color> list = [];

  list.add(Color(0xFFE07C24));
  list.add(Color(0xFF4958b8));
  list.add(Color(0xFF1C8D73));
  list.add(Color(0xFFFF6666));
  list.add(Color(0xFFA77B06));
  list.add(Color(0xFF6A1B4D));

  return list;
}

List<String> abstractIconsList() {
  List<String> list = [];

  for (var i = 1; i <= 30; i++) {
    list.add('images/app/abstract_icons/$i.png');
  }

  return list;
}

Future<void> launchURL(String url, {bool forceWebView = false}) async {
  await launch(url, enableJavaScript: true, forceWebView: forceWebView).catchError((e) {
    throw '$url is not valid';
  });
}
