import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class NftCardWidget extends StatefulWidget {
  final String? img;
  final String? title;
  final String? img1;
  final String? subTitle;
  final String? description;
  final String? buttonText;
  final Color? color;
  final Function()? onTap;
  final NftAppModel appModel;
  final String? btnSubtitle;

  final Color? textButtonColor;
  final Color? btnBackColor;

  NftCardWidget({
    this.img,
    this.title,
    this.img1,
    this.subTitle,
    this.description,
    this.buttonText,
    this.onTap,
    this.textButtonColor,
    this.color,
    required this.appModel,
    this.btnSubtitle,
    this.btnBackColor,
  });

  @override
  State<NftCardWidget> createState() => _NftCardWidgetState();
}

class _NftCardWidgetState extends State<NftCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(16)),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(widget.img!, height: 300, fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
                ),
                SizedBox(height: 16),
                Text(widget.title!, style: boldTextStyle(size: 20)),
                SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.topRight,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(25),
                          child: Image.asset(widget.img1!, height: 35, width: 35, fit: BoxFit.cover),
                        ),
                        Container(
                          height: 10,
                          width: 10,
                          decoration: BoxDecoration(color: Colors.green, shape: BoxShape.circle),
                        )
                      ],
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.subTitle!, style: boldTextStyle(size: 14)),
                          SizedBox(height: 4),
                          Text(widget.description!, style: secondaryTextStyle(size: 12)),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        widget.appModel.isCheck = !widget.appModel.isCheck;
                        setState(() {});
                      },
                      child: Icon(widget.appModel.isCheck ? Icons.favorite_border_outlined : Icons.favorite, color: nftPrimaryColor),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        AppButton(
          title: widget.buttonText!,
          onTap: widget.onTap,
          color: widget.color,
          subtitle: widget.btnSubtitle,
          textButtonColor: widget.textButtonColor ?? Colors.white,
          buttonBackColor: widget.btnBackColor,
        ),
        SizedBox(height: 16),
      ],
    );
  }
}
