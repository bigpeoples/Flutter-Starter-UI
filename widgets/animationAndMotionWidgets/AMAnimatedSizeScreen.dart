import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppImage.dart';

class AMAnimatedSizeScreen extends StatefulWidget {
  static String tag = '/AMAnimatedSizeScreen';

  @override
  AMAnimatedSizeScreenState createState() => AMAnimatedSizeScreenState();
}

class AMAnimatedSizeScreenState extends State<AMAnimatedSizeScreen> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await Future.delayed(Duration(seconds: 1));
    _updateSize();
    await Future.delayed(Duration(seconds: 2));
    init();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  double _size = 50.0;
  bool _large = false;

  void _updateSize() {
    setState(() {
      _size = _large ? 250.0 : 100.0;
      _large = !_large;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appStore.isDarkModeOn ? scaffoldColorDark : appBarBackgroundColor,
        body: Center(
          child: GestureDetector(
            onTap: () => _updateSize(),
            child: Container(
              child: AnimatedSize(curve: Curves.linear, vsync: this, duration: Duration(seconds: 1), child: Image.asset(appLogo, width: _size, height: _size)),
            ),
          ),
        ),
      ),
    );
  }
}
