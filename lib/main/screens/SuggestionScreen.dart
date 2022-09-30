import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mighty_ui_kit/main/components/AppBarScoller.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/main/screens/AddSuggestionScreen.dart';
import 'package:mighty_ui_kit/main/services/SuggestionService.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class SuggestionScreen extends StatefulWidget {
  static String tag = '/SuggestionScreen';

  @override
  SuggestionScreenState createState() => SuggestionScreenState();
}

class SuggestionScreenState extends State<SuggestionScreen> {
  SuggestionService suggestion = SuggestionService();

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
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await AddSuggestionScreen().launch(context);
          },
          child: Icon(Icons.add, color: appPrimaryColor),
        ),
        body: AppBarScroller(
          title: 'Suggestions',
          child: StreamBuilder<List<SuggestionModel>>(
            stream: suggestion.suggestionList(),
            builder: (context, snapshots) {
              if (snapshots.hasData) {
                if (snapshots.data!.isEmpty) return Text('No suggestions found', style: secondaryTextStyle()).center();

                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshots.data!.length,
                  padding: EdgeInsets.only(bottom: 80, top: 16, left: 8, right: 8),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            child: Text(
                              snapshots.data![index].name![0].toUpperCase(),
                              style: boldTextStyle(color: appPrimaryColor),
                            ).center(),
                            decoration: boxDecorationWithShadow(
                              boxShape: BoxShape.circle,
                              border: Border.all(color: appPrimaryColor),
                              spreadRadius: 0,
                              blurRadius: 0,
                              backgroundColor: Colors.white.withOpacity(0.2),
                            ),
                          ),
                          16.width,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshots.data![index].name!, style: secondaryTextStyle()),
                              2.height,
                              Text(snapshots.data![index].feedback!, style: primaryTextStyle()),
                            ],
                          ).expand()
                        ],
                      ),
                    );
                  },
                );
              }

              return snapWidgetHelper(snapshots);
            },
          ),
        ),
      ),
    );
  }
}
