import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/utils/AppWidget.dart';
import 'package:mighty_ui_kit/main/utils/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class CWDialogScreen extends StatefulWidget {
  static String tag = '/CWDialogScreen';

  @override
  CWDialogScreenState createState() => CWDialogScreenState();
}

class CWDialogScreenState extends State<CWDialogScreen> {
  List<AppModel> example = [
    AppModel(title: 'Simple Dialog'),
    AppModel(title: 'Review Dialog'),
  ];

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
      body: SafeArea(
        child: ListView.builder(
          itemCount: example.length,
          itemBuilder: (BuildContext context, index) {
            return ExampleItemWidget(
              example[index],
              onTap: () {
                if (index == 0) {
                  showDialog(
                    context: context,
                    builder: (_) => CupertinoAlertDialog(
                      title: Text("Cupertino Dialog", style: boldTextStyle(size: 16)).paddingBottom(6),
                      content: Text("Hey! I'm Coflutter!", style: primaryTextStyle(size: 16)).paddingBottom(6),
                      actions: <Widget>[
                        TextButton(
                          child: Text('Close me!', style: primaryTextStyle()),
                          onPressed: () {
                            finish(context);
                          },
                        )
                      ],
                    ),
                  );
                } else if (index == 1) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) => CupertinoAlertDialog(
                      title: Text('Rating', style: boldTextStyle(size: 16)).paddingOnly(bottom: 8),
                      content: Column(
                        children: [
                          RatingBar(
                            initialRating: 5,
                            minRating: 1,
                            itemSize: 20,
                            direction: Axis.horizontal,
                            itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                            itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
                            onRatingUpdate: (rating) {},
                          ),
                        ],
                      ),
                      actions: [
                        CupertinoDialogAction(
                          child: Text("Cancel", style: secondaryTextStyle()),
                          onPressed: () {
                            finish(context);
                          },
                        ),
                        CupertinoDialogAction(
                          child: Text('Submit'),
                          onPressed: () {
                            toast('Submit');
                            finish(context);
                          },
                        )
                      ],
                    ),
                  );
                }
              },
            );
          },
        ),
      ),
    );
  }
}
