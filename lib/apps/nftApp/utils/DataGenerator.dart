import 'package:mighty_ui_kit/apps/nftApp/model/NftAppModel.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/AllCreatorScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/CollectedWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/CreatedWidget.dart';
import 'package:mighty_ui_kit/apps/nftApp/user/userscreen/FeatureCreatorScreen.dart';

import '../../../main.dart';

List<NftAppModel> getWalkThroughtData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(
      title: 'Create Collects Timeless ArtWorks',
      subTitle: 'Browse and build your collection of the world\'s most cutting-edge digits art',
      img: appStore.isDarkModeOn ? 'images/nft/ic_dark_walkThrought_1.png' : 'images/nft/ic_walkThrought_1.png'));
  list.add(NftAppModel(
      title: 'It\s all about scarcity',
      subTitle: 'Art is minted as an NFT and comes as limited editions, making them extremely valuable.',
      img: appStore.isDarkModeOn ? 'images/nft/ic_dark_walkThrought_2.png' : 'images/nft/ic_walkThrought_2.png'));
  list.add(NftAppModel(
      title: 'Create Collects Timeless ArtWorks',
      subTitle: 'Browse and build your collection of the world\'s most cutting-edge digits art',
      img: appStore.isDarkModeOn ? 'images/nft/ic_dark_walkThrought_3.png' : 'images/nft/ic_walkThrought_3.png'));
  return list;
}

List<NftAppModel> getCreatorAddData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(title: 'Sale this item', subTitle: 'you receive bids on this items', isCheck: true));
  list.add(NftAppModel(title: 'Instant sale price', subTitle: 'Enter the price for which the items will be instantly sold', isCheck: true));
  list.add(NftAppModel(title: 'Unlock once purchased', subTitle: 'Content will be unlock after sucessfully transaction', isCheck: false));
  list.add(NftAppModel(title: 'Add to collection', subTitle: 'Choose an exiting or create a new one', isCheck: true));
  return list;
}

List<NftAppModel> getServiceData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(title: 'I am at least 13 year old'));
  list.add(NftAppModel(title: 'I agree terms of service'));
  return list;
}

List<NftAppModel> getDetailData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(img: 'images/nft/ic_nft4.jpg', title: 'Auction won by David', subTitle: 'June 04,2021 at 12:00am', description: 'Sold for 1.50 ETH'));
  list.add(NftAppModel(img: 'images/nft/ic_nft5.jpg', title: 'Bid place by @pawel09', subTitle: 'June 06,2021 at 12:00am', description: '1.50 ETH'));
  list.add(NftAppModel(img: 'images/nft/ic_nft6.jpg', title: 'Listing by @han152', subTitle: 'June 07,2021 at 12:00am', description: '1.50 ETH'));
  list.add(NftAppModel(img: 'images/nft/ic_nft7.jpg', title: 'Bid place by @pawel09', subTitle: 'June 08,2021 at 12:00am', description: '1.00 ETH'));
  return list;
}

List<NftAppModel> getDisCoverList() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(title: 'Feature Creator', widget: FeatureCreatorScreen()));
  list.add(NftAppModel(title: 'All Creator', widget: AllCreatorScreen()));
  return list;
}

List<NftAppModel> getCreatorData() {
  List<NftAppModel> list = [];
  list.add(
    NftAppModel(
      img: 'images/nft/ic_profile.png',
      img1: 'images/nft/ic_person.png',
      title: 'Kennedy Yanko',
      description: 'Kennedy Yanko is an artist working in found metal and paint skin. Her methods reflect a dual abstract expressionist-surr…',
      subTitle: '2024',
    ),
  );
  list.add(
    NftAppModel(
      img: 'images/nft/ic_holly.png',
      img1: 'images/nft/ic_data.png',
      title: 'Holly Herndon',
      description: 'A family of artists in Ethiopia making art in the style of tizita- nostalgia and longing for the past.Addis Ababa …',
      subTitle: '1024',
    ),
  );

  list.add(
    NftAppModel(
      img: 'images/nft/ic_janif.png',
      img1: 'images/nft/ic_avatar.png',
      title: 'Addie Wagenknecht',
      description: 'Addie Wagenknecht and Aiala Hernando. Documentation of the End of the Worlds.',
      subTitle: '1099',
    ),
  );
  list.add(
    NftAppModel(
      img: 'images/nft/ic_data.png',
      img1: 'images/nft/ic_round.png',
      title: 'Jennifer Mehigan',
      description: 'LOW POLY GODDESS / Jennifer Mehigan is an interdisciplinary artist whose work engages with abstract manifestations of de…',
      subTitle: '1899',
    ),
  );
  return list;
}

List<NftAppModel> getAllCreatorData() {
  List<NftAppModel> list = [];
  list.add(
    NftAppModel(
      img: 'images/nft/ic_nft4.jpg',
      img1: 'images/nft/ic_person.png',
      title: 'Kennedy Yanko',
      description: 'Kennedy Yanko is an artist working in found metal and paint skin. Her methods reflect a dual abstract expressionist-surr…',
      subTitle: '2024',
    ),
  );
  list.add(
    NftAppModel(
      img: 'images/nft/ic_nft5.jpg',
      img1: 'images/nft/ic_data.png',
      title: 'Holly Herndon',
      description: 'A family of artists in Ethiopia making art in the style of tizita- nostalgia and longing for the past.Addis Ababa …',
      subTitle: '1024',
    ),
  );

  list.add(
    NftAppModel(
      img: 'images/nft/ic_nft6.jpg',
      img1: 'images/nft/ic_avatar.png',
      title: 'Addie Wagenknecht',
      description: 'Addie Wagenknecht and Aiala Hernando. Documentation of the End of the Worlds.',
      subTitle: '1099',
    ),
  );
  list.add(
    NftAppModel(
      img: 'images/nft/ic_nft7.jpg',
      img1: 'images/nft/ic_round.png',
      title: 'Jennifer Mehigan',
      description: 'LOW POLY GODDESS / Jennifer Mehigan is an interdisciplinary artist whose work engages with abstract manifestations of de…',
      subTitle: '1899',
    ),
  );
  return list;
}

List<NftAppModel> getCreatorList() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(title: 'Created', widget: CreatedWidget()));
  list.add(NftAppModel(title: 'Collected', widget: CollectedWidget()));
  return list;
}

List<NftAppModel> getNotificationData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(img: 'images/nft/ic_nft4.jpg', title: 'ETH received', subTitle: '1.05 ETH received', description: '1 day ago'));
  list.add(NftAppModel(img: 'images/nft/ic_nft5.jpg', title: 'Upload success', subTitle: 'ready to sell', description: '2 day ago'));
  list.add(NftAppModel(img: 'images/nft/ic_nft6.jpg', title: 'Eric follow your collection', subTitle: 'Supper wave collection', description: '5 day ago'));
  list.add(NftAppModel(img: 'images/nft/ic_nft7.jpg', title: 'ETH received', subTitle: '1.05 ETH received', description: '4 day ago'));

  return list;
}

List<NftAppModel> getPeopleList() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(title: 'M', subTitle: 'Microart', description: '@art'));
  list.add(NftAppModel(title: 'F', subTitle: 'Marbella the Frechine', description: '@frenchies'));
  list.add(NftAppModel(title: 'N', subTitle: 'Microart', description: '@art'));
  list.add(NftAppModel(title: 'A', subTitle: 'Oliver', description: '@oliver'));
  list.add(NftAppModel(title: 'H', subTitle: 'Frechine', description: '@frenchies'));
  list.add(NftAppModel(title: 'K', subTitle: 'Oliver', description: '@art'));

  return list;
}

List<NftAppModel> getItemSearchList() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(img: 'images/nft/ic_nft4.jpg', title: 'Epic: Fight(1/4) (2009)', subTitle: '@lovetherobot'));
  list.add(NftAppModel(img: 'images/nft/ic_nft5.jpg', title: 'Chamomile LTR (2021)', subTitle: '@lovetherobot'));
  list.add(NftAppModel(img: 'images/nft/ic_nft6.jpg', title: 'Bliss (2021)', subTitle: '@lovetherobot'));
  list.add(NftAppModel(img: 'images/nft/ic_nft7.jpg', title: 'Epic: Fight(1/4) (2009)', subTitle: '@lovetherobot'));
  list.add(NftAppModel(img: 'images/nft/ic_nft11.jpg', title: 'Epic: Fight(1/4) (2009)', subTitle: '@lovetherobot'));
  list.add(NftAppModel(img: 'images/nft/ic_nft1.jpg', title: 'Chamomile LTR (2021)', subTitle: '@lovetherobot'));
  list.add(NftAppModel(img: 'images/nft/ic_nft10.png', title: 'Bliss (2021)', subTitle: '@lovetherobot'));
  list.add(NftAppModel(img: 'images/nft/ic_nft7.jpg', title: 'Epic: Fight(1/4) (2009)', subTitle: '@lovetherobot'));

  return list;
}

List<NftAppModel> getUserHomeData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(title: 'Silent Color', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft2.jpg', img1: 'images/nft/ic_nft6.jpg'));
  list.add(NftAppModel(title: 'George', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft4.jpg', img1: 'images/nft/ic_nft11.jpg'));
  list.add(NftAppModel(title: 'Ocean', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft9.jpg', img1: 'images/nft/ic_nft8.jpg'));
  return list;
}

List<NftAppModel> getCreatorHomeData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(title: 'Silent Color', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft4.jpg', img1: 'images/nft/ic_nft12.png'));
  list.add(NftAppModel(title: 'George', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft5.jpg', img1: 'images/nft/ic_nft11.jpg'));
  list.add(NftAppModel(title: 'Ocean', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft7.jpg', img1: 'images/nft/ic_nft1.jpg'));
  list.add(NftAppModel(title: 'Silent Color', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft1.jpg', img1: 'images/nft/ic_nft12.png'));
  list.add(NftAppModel(title: 'George', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft2.jpg', img1: 'images/nft/ic_nft11.jpg'));
  list.add(NftAppModel(title: 'Ocean', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft3.jpg', img1: 'images/nft/ic_nft1.jpg'));
  return list;
}

List<NftAppModel> getNUAddData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(title: 'Silent Color', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft4.jpg', img1: 'images/nft/ic_nft12.png'));
  list.add(NftAppModel(title: 'George', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft5.jpg', img1: 'images/nft/ic_nft11.jpg'));
  list.add(NftAppModel(title: 'Ocean', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft7.jpg', img1: 'images/nft/ic_nft1.jpg'));
  list.add(NftAppModel(title: 'Silent Color', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft1.jpg', img1: 'images/nft/ic_nft12.png'));
  list.add(NftAppModel(title: 'George', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft2.jpg', img1: 'images/nft/ic_nft11.jpg'));
  list.add(NftAppModel(title: 'Ocean', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft3.jpg', img1: 'images/nft/ic_nft1.jpg'));
  return list;
}

List<NftAppModel> getUserHome() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(title: 'Silent Color', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft5.jpg', img1: 'images/nft/ic_nft12.png'));
  list.add(NftAppModel(title: 'George', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft8.jpg', img1: 'images/nft/ic_nft11.jpg'));
  list.add(NftAppModel(title: 'Ocean', subTitle: 'Pawel Czerwinski', description: 'Creator', img: 'images/nft/ic_nft12.png', img1: 'images/nft/ic_nft1.jpg'));
  return list;
}

List<NftAppModel> getHotData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(img: 'images/nft/ic_nft4.jpg'));
  list.add(NftAppModel(img: 'images/nft/ic_nft5.jpg'));
  list.add(NftAppModel(img: 'images/nft/ic_nft6.jpg'));
  list.add(NftAppModel(img: 'images/nft/ic_nft7.jpg'));
  list.add(NftAppModel(img: 'images/nft/ic_nft8.jpg'));
  list.add(NftAppModel(img: 'images/nft/ic_nft9.jpg'));

  return list;
}

List<NftAppModel> getCollectionData() {
  List<NftAppModel> list = [];
  list.add(NftAppModel(img: 'images/nft/ic_nft11.jpg'));
  list.add(NftAppModel(img: 'images/nft/ic_nft1.jpg'));
  list.add(NftAppModel(img: 'images/nft/ic_nft10.png'));
  list.add(NftAppModel(img: 'images/nft/ic_nft7.jpg'));
  list.add(NftAppModel(img: 'images/nft/ic_nft8.jpg'));
  list.add(NftAppModel(img: 'images/nft/ic_nft9.jpg'));

  return list;
}
