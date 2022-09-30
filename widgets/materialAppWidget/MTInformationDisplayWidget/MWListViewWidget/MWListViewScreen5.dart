import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/utils/Lipsum.dart' as lipsum;
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class MWListViewScreen5 extends StatefulWidget {
  static const tag = '/MWListViewScreen5';
  final List<String> item = ["Management", "Food", "Cafe", "Travel", "Education", "Finance", "Business", "Yoga & Gym", "Health"];

  @override
  _MWListViewScreen5State createState() => _MWListViewScreen5State();
}

class _MWListViewScreen5State extends State<MWListViewScreen5> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    setState(() {});
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    void reorderData(int oldindex, int newindex) {
      setState(() {
        if (newindex > oldindex) {
          newindex -= 1;
        }
        final items = widget.item.removeAt(oldindex);
        widget.item.insert(newindex, items);
      });
    }

    return SafeArea(
      child: Scaffold(
        body: ReorderableListView(
          children: <Widget>[
            for (final items in widget.item)
              Container(
                key: ValueKey(items),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      title: Text(items, style: boldTextStyle()),
                      leading: Icon(Icons.menu, color: iconSecondaryColor),
                      subtitle: Text(lipsum.createParagraph(numSentences: 1), style: secondaryTextStyle(), maxLines: 1),
                    ),
                    Divider(color: appStore.isDarkModeOn ? appBarBackgroundColor : scaffoldColorDark)
                  ],
                ),
              ),
          ],
          onReorder: reorderData,
        ),
      ),
    );
  }
}
