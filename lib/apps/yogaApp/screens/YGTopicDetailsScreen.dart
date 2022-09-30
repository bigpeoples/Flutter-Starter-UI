import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGDataProvider.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:nb_utils/nb_utils.dart';

class YGTopicDetailsScreen extends StatefulWidget {
  final String? text;
  final String? url;

  YGTopicDetailsScreen({this.text, this.url});

  @override
  _YGTopicDetailsScreenState createState() => _YGTopicDetailsScreenState();
}

class _YGTopicDetailsScreenState extends State<YGTopicDetailsScreen> {
  bool isLike = false;
  int like = 430;
  TextEditingController commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget('Topic Details', showBack: true, center: true, color: context.scaffoldBackgroundColor),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(yg_food, height: 200, width: MediaQuery.of(context).size.width, fit: BoxFit.fill),
            16.height,
            Text(widget.text!, style: boldTextStyle(size: 20, color: yg_primaryColor)).center(),
            Text('Healthy and clean', style: boldTextStyle()).center(),
            16.height,
            Text(
              'Make Easy And Testy Dinner for busy Weeknights.'
              'Check out the 5 Recipes options below',
              style: primaryTextStyle(),
            ).paddingAll(12),
            Image.asset(widget.url!, height: 250, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
            Text("Stored in the Freezer and you've got a fresh Food", style: primaryTextStyle()).paddingAll(12),
            Image.network(yg_dietFood, height: 250, width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
            Text(
              "Swap the stock with some bone broth (i like bonafide Provisional,which, surprise surprise, is also stored in the freezer)"
              " and you've got a perfect customizable gut-healing meal",
              style: TextStyle(fontSize: 16),
            ).paddingAll(12),
            Divider(thickness: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                isLike
                    ? Icon(Icons.favorite_border, color: Colors.grey)
                    : Icon(Icons.favorite, color: Colors.red).onTap(() {
                        isLike = !isLike;
                        isLike ? like-- : like++;
                        setState(() {});
                      }),
                5.width,
                Text(like.toString(), style: secondaryTextStyle()),
                20.width,
                Icon(
                  MaterialCommunityIcons.comment_processing,
                  color: iconColorSecondary,
                ),
                5.width,
                Text('70', style: secondaryTextStyle()),
                20.width,
                Icon(
                  Icons.share,
                  color: iconColorSecondary,
                ),
              ],
            ).paddingAll(8),
            Divider(thickness: 3),
            Text('Comments', style: boldTextStyle(size: 18)).paddingAll(12),
            Column(
              children: List.generate(
                commentList.length,
                (index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        commentList[index].profileImage!,
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ).cornerRadiusWithClipRRect(25).paddingAll(4),
                      8.width,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          15.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(commentList[index].name!, style: boldTextStyle()),
                              Text(commentList[index].date!, style: secondaryTextStyle()),
                            ],
                          ),
                          10.height,
                          Text(commentList[index].text!, style: secondaryTextStyle()),
                          15.height,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(
                              commentList[index].image!.length,
                              (i) {
                                return Image.asset(
                                  commentList[index].image![i].image!,
                                  height: 90,
                                  width: context.width() * .23,
                                  fit: BoxFit.cover,
                                ).cornerRadiusWithClipRRect(8);
                              },
                            ),
                          ),
                          30.height,
                        ],
                      ).expand(),
                    ],
                  );
                },
              ),
            ).paddingAll(12)
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: boxDecorationWithShadow(backgroundColor: context.scaffoldBackgroundColor),
        padding: EdgeInsets.all(16),
        child: Row(
          children: [
            AppTextField(
              controller: commentController,
              textFieldType: TextFieldType.OTHER,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                isCollapsed: true,
                filled: true,
                fillColor: Colors.black12,
                contentPadding: EdgeInsets.all(8),
                hintText: 'Add a comment...',
                isDense: true,
                labelStyle: secondaryTextStyle(),
              ),
            ).expand(),
            10.width,
            Container(
              height: 35,
              width: 35,
              child: Icon(Icons.send, size: 18),
              decoration: boxDecorationRoundedWithShadow(20, backgroundColor: yg_primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
