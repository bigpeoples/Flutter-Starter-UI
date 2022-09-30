import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/main/utils/fancyDrawer.dart';
import 'package:nb_utils/nb_utils.dart';

// ignore: must_be_immutable
class MWDrawerScreen1 extends StatefulWidget {
  bool? showAppbar;

  MWDrawerScreen1({this.showAppbar = false});

  @override
  MWDrawerScreen2State createState() => MWDrawerScreen2State();
}

class MWDrawerScreen2State extends State<MWDrawerScreen1> with SingleTickerProviderStateMixin {
  FancyDrawerController? _controller;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isDrawerOpen = false;

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    _controller = FancyDrawerController(vsync: this, duration: Duration(milliseconds: 250))
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    // _controller?.dispose();
    super.dispose();
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: FancyDrawerWrapper(
        backgroundColor: Colors.white,
        controller: _controller,
        drawerItems: <Widget>[
          Text("Go to home", style: TextStyle(fontSize: 18, color: Colors.purple.shade700, fontWeight: FontWeight.bold)),
          Text("About us", style: TextStyle(fontSize: 18, color: Colors.purple.shade700, fontWeight: FontWeight.bold)),
          Text("Our products", style: TextStyle(fontSize: 18, color: Colors.purple.shade700, fontWeight: FontWeight.bold)),
          Text("Support us", style: TextStyle(fontSize: 18, color: Colors.purple.shade700, fontWeight: FontWeight.bold)),
          Text("Log out", style: TextStyle(fontSize: 18, color: Colors.purple.shade700, fontWeight: FontWeight.bold)),
        ],
        child: Scaffold(
          appBar: AppBar(
            elevation: 4.0,
            title: Text("Fancy Drawer", style: boldTextStyle(color: black, size: 18)),
            backgroundColor: Colors.white,
            leading: IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                isDrawerOpen = !isDrawerOpen;
                if (isDrawerOpen)
                  _controller?.open();
                else
                  _controller?.close();
                setState(() {});
              },
            ),
          ),
          body: commonCacheImageWidget(
            'https://images.unsplash.com/photo-1553105659-d918b253f0f2?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80',
            context.height(),
            width: context.width(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
