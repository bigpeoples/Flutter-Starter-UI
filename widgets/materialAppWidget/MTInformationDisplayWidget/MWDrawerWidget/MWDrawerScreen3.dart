import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MWDrawerScreen3 extends StatefulWidget {
  @override
  MWDrawerScreen4State createState() => MWDrawerScreen4State();
}

class MWDrawerScreen4State extends State<MWDrawerScreen3> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  // int _count = 0;

  /* void _incrementCount() {
    setState(() {
      _count++;
    });
  }*/

  @override
  void initState() {
    super.initState();
    init();
  }

  Future<void> init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0XFF4E5B81),
        leading: Icon(Icons.menu, color: white).onTap(() {
          _scaffoldKey.currentState!.openDrawer();
        }),
        title: Text("Wave Drawer", style: boldTextStyle(color: white, size: 18)),
      ),
      /* drawer: WaveDrawer(
        // backgroundColor: Color(0xFF15202B).withOpacity(0.7),
        backgroundColor: Color(0xFF8ABAFF).withOpacity(0.7),
        boundaryColor: white,
        boundaryWidth: 4.0,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Stack(
                children: [
                  Image.network(
                    'https://assets.wallpapersin4k.org/uploads/2017/04/Wallpapers-Bicycle-13.jpg',
                    fit: BoxFit.cover,
                    width: context.width(),
                    height: 200,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      commonCacheImageWidget('https://randomuser.me/api/portraits/men/41.jpg', 45, fit: BoxFit.cover).cornerRadiusWithClipRRect(30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Smit Jhon', style: boldTextStyle(color: white)),
                          8.height,
                          Text('smit@gmail.com', style: secondaryTextStyle(color: white)),
                        ],
                      ),
                    ],
                  ).paddingAll(16)
                ],
              ),
            ),
            ListTile(
              title: Text('Item 1', style: boldTextStyle(color: white)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2', style: boldTextStyle(color: white)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 3', style: boldTextStyle(color: white)),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),*/
      //floatingActionButton: FloatingActionButton(child: Center(child: Icon(Icons.add, color: black)), onPressed: () => _incrementCount()),
      body: Container(color: Color(0XFF27314F)),
    );
  }
}
