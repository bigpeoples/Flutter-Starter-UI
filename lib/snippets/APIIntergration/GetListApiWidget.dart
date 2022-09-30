import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/model/AppListinModel.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/network/rest_apis.dart';
import 'package:nb_utils/nb_utils.dart';

class GetListApiWidget extends StatefulWidget {
  @override
  GetListApiWidgetState createState() => GetListApiWidgetState();
}

class GetListApiWidgetState extends State<GetListApiWidget> {
  int page = 1;

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
    return Scaffold(
      body: Container(
        child: FutureBuilder<AppListingModel>(
          future: getUserList(page),
          builder: (_, snap) {
            if (snap.hasData) {
              return ListView.builder(
                itemCount: snap.data!.data!.length,
                padding: EdgeInsets.all(8),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  var getListData = snap.data!.data![index];
                  return Container(
                    padding: EdgeInsets.all(8),
                    decoration: boxDecorationWithRoundedCorners(boxShadow: defaultBoxShadow(), backgroundColor: appStore.cardColor),
                    margin: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: boxDecorationWithShadow(
                            decorationImage: DecorationImage(image: Image.network(getListData.avatar.validate()).image, fit: BoxFit.cover),
                            boxShape: BoxShape.circle,
                          ),
                        ),
                        16.width,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(getListData.email.validate(), style: boldTextStyle(size: 16)),
                            8.height,
                            Text(getListData.firstName.validate(), style: primaryTextStyle(size: 14)),
                            8.height,
                            Text(getListData.lastName.validate(), style: secondaryTextStyle(size: 12)),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              );
            }
            return snapWidgetHelper(snap);
          },
        ),
      ),
    );
  }
}
