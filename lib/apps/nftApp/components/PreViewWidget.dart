import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Colors.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';

class PreViewWidget extends StatefulWidget {
  @override
  State<PreViewWidget> createState() => _PreViewWidgetState();
}

class _PreViewWidgetState extends State<PreViewWidget> {
  bool mIsFavorite = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.all(16),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Preview', style: boldTextStyle(size: 20)),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.close),
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset('images/nft/ic_nft6.jpg', height: 300, fit: BoxFit.cover, width: MediaQuery.of(context).size.width),
              ),
              SizedBox(height: 16),
              Text('Silent Color', style: boldTextStyle(size: 20)),
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
                        child: Image.asset('images/nft/ic_nft12.png', height: 35, width: 35, fit: BoxFit.cover),
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
                        Text('Pawel Czerwinski', style: boldTextStyle(size: 14)),
                        SizedBox(height: 4),
                        Text('Creator', style: primaryTextStyle(size: 12)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      mIsFavorite = !mIsFavorite;
                      setState(() {});
                    },
                    child: Icon(mIsFavorite ? Icons.favorite : Icons.favorite_border_outlined, color: nftPrimaryColor),
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
