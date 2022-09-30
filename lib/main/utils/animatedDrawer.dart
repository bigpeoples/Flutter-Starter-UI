/*
import 'package:animated_drawer/bloc/generic_bloc.dart';
import 'package:animated_drawer/constants/runtime_variables.dart';
import 'package:animated_drawer/views/first_layer.dart';
import 'package:animated_drawer/views/home_page.dart';
import 'package:animated_drawer/views/third_layer.dart';
import 'package:flutter/material.dart';

class AnimatedDrawer extends StatefulWidget {
  final LinearGradient? backgroundGradient;

  final Color? shadowColor;

  final Widget? menuPageContent;

  final Widget? homePageContent;

  final double? homePageXValue;

  final double? homePageYValue;

  final double? homePageAngle;

  final double? shadowXValue;

  final double? shadowYValue;

  final double? shadowAngle;

  final int? homePageSpeed;

  final int? shadowSpeed;

  final Widget? openIcon;

  final Widget? closeIcon;

  AnimatedDrawer(
      {@required this.backgroundGradient,
      @required this.menuPageContent,
      @required this.homePageContent,
      @required this.shadowColor,
      this.openIcon,
      this.closeIcon,
      this.homePageXValue,
      this.homePageYValue,
      this.homePageAngle,
      this.shadowXValue,
      this.shadowYValue,
      this.shadowAngle,
      this.homePageSpeed,
      this.shadowSpeed});

  @override
  _AnimatedDrawerState createState() => _AnimatedDrawerState();
}

class _AnimatedDrawerState extends State<AnimatedDrawer> {
  @override
  Widget build(BuildContext context) {
    GenericBLOC().initSize(context);
    RuntimeVariables().runTimeSetValues(
        backgroundGradient: widget.backgroundGradient,
        homeX: widget.homePageXValue,
        homeY: widget.homePageYValue,
        homeAngle: widget.homePageAngle,
        homePageSpeed: widget.homePageSpeed,
        shadowX: widget.shadowXValue,
        shadowY: widget.shadowYValue,
        shadowAngle: widget.shadowAngle,
        shadowSpeed: widget.shadowSpeed,
        closeIcon: widget.closeIcon,
        openIcon: widget.openIcon);

    return Scaffold(body: _body());
  }

  Widget _body() {
    return Stack(
      children: [
        FirstLayer(gradient: widget.backgroundGradient),
        Shadow(bgColor: widget.shadowColor),
        ThirdLayer(menu: widget.menuPageContent),
        HomePage(body: widget.homePageContent),
      ],
    );
  }
}
*/
