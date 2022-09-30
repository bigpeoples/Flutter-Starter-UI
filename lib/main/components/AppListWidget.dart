import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:nb_utils/nb_utils.dart';

import 'AppItemWidget.dart';
import 'AppWidgets.dart';

class AppListWidget extends StatelessWidget {
  static String tag = '/AppListWidget';
  final List<AppModel> list;

  AppListWidget(this.list);

  @override
  Widget build(BuildContext context) {
    return list.isEmpty
        ? noDataWidget().center()
        : Wrap(
            runSpacing: 16,
            children: list.asMap().map((i, element) => MapEntry(i, AppItemWidget(data: element, index: i))).values.toList(),
          ).paddingOnly(left: 8, right: 8, bottom: 16);
  }
}
