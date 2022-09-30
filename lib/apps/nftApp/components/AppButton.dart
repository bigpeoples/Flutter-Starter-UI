import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class AppButton extends StatefulWidget {
  final Function()? onTap;
  final String? title;
  final String? subtitle;
  final Color? color;
  final Color? textButtonColor;
  final Color? buttonBackColor;

  AppButton({required this.title, required this.onTap, this.color, this.textButtonColor, this.subtitle, this.buttonBackColor});

  @override
  AppButtonState createState() => AppButtonState();
}

class AppButtonState extends State<AppButton> {
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
    return Container(
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: widget.color == null ? linearGradient() : null,
      ),
      width: MediaQuery.of(context).size.width,
      child: TextButton(
        onPressed: widget.onTap,
        style: TextButton.styleFrom(backgroundColor: widget.buttonBackColor, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.subtitle ?? '', style: primaryTextStyle(size: 18)),
            Text(widget.title!, style: boldTextStyle(color: widget.textButtonColor ?? Colors.white, size: 18)),
          ],
        ),
      ),
    );
  }
}
