import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/model/AppListinModel.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/network/rest_apis.dart';
import 'package:nb_utils/nb_utils.dart';

class PaginationApiWidget extends StatefulWidget {
  @override
  PaginationApiWidgetState createState() => PaginationApiWidgetState();
}

class PaginationApiWidgetState extends State<PaginationApiWidget> {
  List<UserData> data = [];

  bool isLoading = false;
  bool isLastPage = false;

  bool load = false;
  int page = 1;

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
    return Scaffold(
      body: Container(
        child: NotificationListener(
          onNotification: (ScrollNotification scrollInfo) {
            if (scrollInfo is ScrollEndNotification) {
              if (!isLastPage && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                page++;
                load = true;
                isLoading = true;
                setState(() {});
              }
            }
            return isLastPage;
          },
          child: FutureBuilder<AppListingModel>(
            future: getUserList(page),
            builder: (_, snap) {
              if (snap.hasData) {
                isLastPage = snap.data!.data!.length != 6;

                if (page == 1) data.clear();
                if (page == snap.data!.page) {
                  data.addAll(snap.data!.data!);
                  load = false;
                }

                return Column(
                  children: [
                    ListView.builder(
                      itemCount: data.length,
                      padding: EdgeInsets.all(8),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var getListData = data[index];

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
                    ).expand(),
                    Loader().visible(load)
                  ],
                );
              }
              return snapWidgetHelper(snap);
            },
          ),
        ),
      ),
    );
  }
}
