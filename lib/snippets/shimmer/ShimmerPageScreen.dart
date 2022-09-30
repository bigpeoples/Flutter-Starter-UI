import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/snippets/shimmer/component/DataListComponent.dart';
import 'package:mighty_ui_kit/snippets/shimmer/component/ShimmerListComponent.dart';

class ShimmerPageScreen extends StatefulWidget {
  static String tag = '/ShimmerPageScreen';

  @override
  ShimmerPageScreenState createState() => ShimmerPageScreenState();
}

class ShimmerPageScreenState extends State<ShimmerPageScreen> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {}

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    Timer timer = Timer(Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });
    return SafeArea(
      child: Scaffold(body: isLoading ? ShimmerListComponent() : DataListComponent(timer)),
    );
  }
}
