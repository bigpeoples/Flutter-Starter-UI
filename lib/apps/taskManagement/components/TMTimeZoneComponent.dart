import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/taskManagement/utils/TMColors.dart';
import 'package:nb_utils/nb_utils.dart';

class TMTimeZoneComponent extends StatelessWidget {
  const TMTimeZoneComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16),
      width: context.width(),
      decoration: boxDecorationDefault(color: context.cardColor),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Central Time', style: boldTextStyle(size: 20)),
                    Text('Us & Canada', style: secondaryTextStyle()),
                  ],
                ),
                16.height,
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('20 February', style: secondaryTextStyle()),
                    Spacer(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('03:00', style: boldTextStyle(size: 18)),
                        Text('CST & UTC-6', style: secondaryTextStyle()),
                      ],
                    ),
                    26.width,
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: -24,
            top: -24,
            child: Icon(Icons.watch_later, color: tmPrimaryColor, size: 110),
          )
        ],
      ),
    );
  }
}
