import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class MWListViewScreen2 extends StatefulWidget {
  static const tag = '/MWListViewScreen2';

  @override
  _MWListViewScreen2State createState() => _MWListViewScreen2State();
}

class _MWListViewScreen2State extends State<MWListViewScreen2> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListWheelScrollView.useDelegate(
          physics: FixedExtentScrollPhysics(),
          itemExtent: 75.0,
          childDelegate: ListWheelChildBuilderDelegate(builder: (BuildContext context, int index) {
            if (index < 0 || index > 30) {
              return null;
            }
            return ListTile(
              leading: CircleAvatar(backgroundImage: NetworkImage(dataList[index].images!), radius: 30.0),
              title: Text(
                dataList[index].name!,
                style: boldTextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text(
                dataList[index].address!,
                style: primaryTextStyle(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }),
        ),
      ),
    );
  }
}

class DataModel {
  String? images;
  String? name;
  String? address;

  DataModel({
    this.images,
    this.name,
    this.address,
  });
}

List<DataModel> dataList = [
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/41.jpg',
    name: 'Smith',
    address: 'Zone Industrielle Ain Romana, BP 51 Bis Mouzaia',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/53.jpg',
    name: 'Steave',
    address: 'Rruga Reshit Collaku, Nr.4,Tirana',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/57.jpg',
    name: 'Selena',
    address: '0065,17/5 Metsarentsi Str,Yerevan',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/66.jpg',
    name: 'Allan',
    address: 'Av Callao 892,Recoleta',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/66.jpg',
    name: 'daisy',
    address: 'Alte Poststrasse 83,HAFNERBACH',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/68.jpg',
    name: 'Michel',
    address: '39-41, BEYUK GALA STR, P.O. Box: AZ1004,Baku',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/70.jpg',
    name: 'kallen',
    address: 'P.O. Box 494, Christ Church,Barbados',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/72.jpg',
    name: 'harddy',
    address: '28/A, Kakrail VIP Road, Dhaka',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/2.jpg',
    name: 'Ruby',
    address: 'P.O. Box 5211, Manama',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/75.jpg',
    name: 'dino',
    address: 'Октябрьский 5 Пер., дом 7, Барановичи',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/75.jpg',
    name: 'jenny',
    address: 'N. 3, Street 323, Sangkat Boeung Kak II,Phnom Penh',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/77.jpg',
    name: 'jack',
    address: '28/A, Kakrail VIP Road, Dhaka',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/78.jpg',
    name: 'morgan',
    address: 'Rosh Pinaz. H. R Ind. Park Rosh Pina',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/80.jpg',
    name: 'jackie',
    address: 'Piazza Mercato 47,Scalera',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/80.jpg',
    name: 'amily',
    address: 'Bd Vge - Pres Manut Africaine, 01 BP 5647,Abidjan',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/25.jpg',
    name: 'Michel',
    address: '39-41, BEYUK GALA STR, P.O. Box: AZ1004,Baku',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/26.jpg',
    name: 'jenny',
    address: 'N. 3, Street 323, Sangkat Boeung Kak II,Phnom Penh',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/28.jpg',
    name: 'Ruby',
    address: 'P.O. Box 5211, Manama',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/28.jpg',
    name: 'morgan',
    address: 'Rosh Pinaz. H. R Ind. Park Rosh Pina',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/30.jpg',
    name: 'jackie',
    address: 'Piazza Mercato 47,Scalera',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/30.jpg',
    name: 'Ruby',
    address: 'P.O. Box 5211, Manama',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/32.jpg',
    name: 'Ruby',
    address: 'P.O. Box 5211, Manama',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/34.jpg',
    name: 'jackie',
    address: 'Piazza Mercato 47,Scalera',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/36.jpg',
    name: 'morgan',
    address: 'Rosh Pinaz. H. R Ind. Park Rosh Pina',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/38.jpg',
    name: 'Smith',
    address: 'Zone Industrielle Ain Romana, BP 51 Bis Mouzaia',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/40.jpg',
    name: 'amily',
    address: 'Bd Vge - Pres Manut Africaine, 01 BP 5647,Abidjan',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/42.jpg',
    name: 'jenny',
    address: 'N. 3, Street 323, Sangkat Boeung Kak II,Phnom Penh',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/42.jpg',
    name: 'Smith',
    address: 'Zone Industrielle Ain Romana, BP 51 Bis Mouzaia',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/44.jpg',
    name: 'kallen',
    address: 'P.O. Box 494, Christ Church,Barbados',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/46.jpg',
    name: 'Smith',
    address: 'Zone Industrielle Ain Romana, BP 51 Bis Mouzaia',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/12.jpg',
    name: 'jackie',
    address: 'Piazza Mercato 47,Scalera',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/12.jpg',
    name: 'morgan',
    address: 'Rosh Pinaz. H. R Ind. Park Rosh Pina',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/13.jpg',
    name: 'Ruby',
    address: 'P.O. Box 5211, Manama',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/14.jpg',
    name: 'jackie',
    address: 'Piazza Mercato 47,Scalera',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/14.jpg',
    name: 'amily',
    address: 'Bd Vge - Pres Manut Africaine, 01 BP 5647,Abidjan',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/15.jpg',
    name: 'jenny',
    address: 'N. 3, Street 323, Sangkat Boeung Kak II,Phnom Penh',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/16.jpg',
    name: 'jorddy',
    address: 'N. 3, Street 323, Sangkat Boeung Kak II,Phnom Penh',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/16.jpg',
    name: 'jackie',
    address: 'Piazza Mercato 47,Scalera',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/17.jpg',
    name: 'morgan',
    address: 'Rosh Pinaz. H. R Ind. Park Rosh Pina',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/18.jpg',
    name: 'kallen',
    address: 'P.O. Box 494, Christ Church,Barbados',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/18.jpg',
    name: 'amily',
    address: 'Bd Vge - Pres Manut Africaine, 01 BP 5647,Abidjan',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/19.jpg',
    name: 'jorddy',
    address: 'N. 3, Street 323, Sangkat Boeung Kak II,Phnom Penh',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/20.jpg',
    name: 'kallen',
    address: 'P.O. Box 494, Christ Church,Barbados',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/women/20.jpg',
    name: 'lessy',
    address: 'Rruga Reshit Collaku, Nr.4,Tirana',
  ),
  DataModel(
    images: 'https://randomuser.me/api/portraits/men/21.jpg',
    name: 'Smith',
    address: 'Zone Industrielle Ain Romana, BP 51 Bis Mouzaia',
  ),
];
