import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class AppStackLoader extends StatelessWidget {
  static String tag = '/AppStackLoader';
  final bool? visible;
  final Widget? child;

  AppStackLoader({this.visible, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: [
          child!,
          Loader().visible(visible.validate()),
        ],
      ),
    );
  }
}
