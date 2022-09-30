import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/AppButton.dart';
import 'package:mighty_ui_kit/apps/nftApp/components/PreViewWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/Common.dart';
import 'package:mighty_ui_kit/apps/nftApp/utils/DataGenerator.dart';

import '../../../../main.dart';

class NCAddFragment extends StatefulWidget {
  @override
  NCAddFragmentState createState() => NCAddFragmentState();
}

class NCAddFragmentState extends State<NCAddFragment> {
  List<NftAppModel> list = getCreatorAddData();

  bool mIsCheck = false;

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
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Upload Artwork', style: boldTextStyle(size: 20)),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.all(32),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                Icon(Icons.image_outlined),
                SizedBox(height: 16),
                Text('Drag and drop or browce a file', style: boldTextStyle(size: 18)),
                SizedBox(height: 4),
                Text('PNG,GIF,WEBP,MP4 or MP3.(Max 1 GB)', style: secondaryTextStyle()),
              ],
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 16),
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.withOpacity(0.8)),
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).cardColor,
                ),
                child: Icon(Icons.file_upload_outlined, color: Colors.grey),
              ),
              Container(
                margin: EdgeInsets.only(right: 16),
                height: 70,
                width: 70,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey.withOpacity(0.8)), borderRadius: BorderRadius.circular(15)),
              ),
            ],
          ),
          SizedBox(height: 16),
          Text('Information', style: boldTextStyle()),
          SizedBox(height: 16),
          Container(
            padding: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(8)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Item name', style: secondaryTextStyle()),
                SizedBox(height: 4),
                Text('Awesome wave', style: boldTextStyle()),
              ],
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
            child: TextField(
              cursorColor: Theme.of(context).iconTheme.color,
              textAlign: TextAlign.left,
              style: primaryTextStyle(),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16),
                border: InputBorder.none,
                hintText: 'Tag',
                hintStyle: primaryTextStyle(),
              ),
            ),
          ),
          SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(8)),
            child: TextField(
              maxLines: 8,
              cursorColor: Theme.of(context).iconTheme.color,
              style: primaryTextStyle(),
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(left: 16, top: 16),
                border: InputBorder.none,
                hintText: 'Description',
                hintStyle: primaryTextStyle(),
              ),
            ),
          ),
          SizedBox(height: 16),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: list.length,
            itemBuilder: (_, index) {
              NftAppModel data = list[index];
              return Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8),
                child: Row(
                  children: [
                    Checkbox(
                      value: data.isCheck,
                      onChanged: (v) {
                        data.isCheck = v!;
                        setState(() {});
                      },
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(data.title!, style: boldTextStyle()),
                          SizedBox(height: 4),
                          Text(data.subTitle!, style: secondaryTextStyle(), maxLines: 2, overflow: TextOverflow.ellipsis),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 16),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              side: BorderSide(color: appStore.isDarkModeOn ? Colors.grey : Colors.black),
              padding: EdgeInsets.all(12),
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) {
                  hideKeyword(context);
                  return PreViewWidget();
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.remove_red_eye_outlined, color: Theme.of(context).iconTheme.color),
                SizedBox(width: 8),
                Text('Preview', style: boldTextStyle()),
              ],
            ),
          ),
          SizedBox(height: 16),
          AppButton(
            title: 'Upload',
            onTap: () {
              //
            },
          )
        ],
      ),
    );
  }
}
