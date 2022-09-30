import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/creator/creatorscreen/PriceScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

class StepperThirdWidget extends StatefulWidget {
  @override
  StepperThirdWidgetState createState() => StepperThirdWidgetState();
}

class StepperThirdWidgetState extends State<StepperThirdWidget> {
  List<NftAppModel> list = getServiceData();

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Terms of services', style: boldTextStyle(size: 20)),
        SizedBox(height: 8),
        Text(
          'Please take a few minutes to read and understand Stacks terms of service. To continue, you need to accepted the terms of service by checking the boxes.',
          style: primaryTextStyle(),
        ),
        SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          itemCount: list.length,
          itemBuilder: (_, index) {
            NftAppModel data = list[index];

            return Row(
              children: [
                Checkbox(
                  activeColor: nftPrimaryColor,
                  value: data.isCheck,
                  onChanged: (v) {
                    data.isCheck = v!;
                    setState(() {});
                  },
                ),
                SizedBox(width: 4),
                Text(data.title!, style: primaryTextStyle())
              ],
            );
          },
        ),
        SizedBox(height: 16),
        AppButton(
          title: 'Let\'s go',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (_) => PriceScreen()));
          },
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
