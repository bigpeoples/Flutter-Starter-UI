import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWExpansionPanelScreen extends StatefulWidget {
  static String tag = '/MWExpansionPanelScreen';

  @override
  MWExpansionPanelScreenState createState() => MWExpansionPanelScreenState();
}

class MWExpansionPanelScreenState extends State<MWExpansionPanelScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyStatefulWidget(),
    );
  }
}

class Item {
  Item({
    this.expandedValue,
    this.headerValue,
    this.isExpanded = false,
  });

  String? expandedValue;
  String? headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List.generate(numberOfItems, (int index) {
    return Item(headerValue: 'Item $index', expandedValue: 'This is item number $index');
  });
}

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Item> _data = generateItems(8);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Theme(
          data: Theme.of(context).copyWith(cardColor: appStore.cardColor),
          child: _buildPanel(),
        ),
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      dividerColor: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark,
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(title: Text(item.headerValue!, style: primaryTextStyle()));
          },
          body: ListTile(
            title: Text(item.expandedValue!, style: primaryTextStyle()),
            subtitle: Padding(
              padding: EdgeInsets.only(bottom: 16),
              child: Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry.', style: boldTextStyle()),
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
