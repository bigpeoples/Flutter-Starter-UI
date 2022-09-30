import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/fragment/NBAccountFragment.dart';
import 'package:mighty_ui_kit/apps/newsBlog/fragment/NBBookmarkFragment.dart';
import 'package:mighty_ui_kit/apps/newsBlog/fragment/NBCategoryFragment.dart';
import 'package:mighty_ui_kit/apps/newsBlog/fragment/NBHomeFragment.dart';
import 'package:mighty_ui_kit/apps/newsBlog/utils/Colors.dart';
import 'package:nb_utils/nb_utils.dart';

class NBDashboardScreen extends StatefulWidget {
  @override
  _NBDashboardScreenState createState() => _NBDashboardScreenState();
}

class _NBDashboardScreenState extends State<NBDashboardScreen> {
  int _selectedIndex = 0;
  List<Widget> _widgetOptions = <Widget>[
    NBHomeFragment(),
    NBCategoryFragment(),
    NBBookmarkFragment(),
    NBAccountFragment(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(AntDesign.appstore1),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
