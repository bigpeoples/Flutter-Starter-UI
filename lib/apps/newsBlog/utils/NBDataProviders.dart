import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:mighty_ui_kit/apps/newsBlog/fragment/NBAccountFragment.dart';
import 'package:mighty_ui_kit/apps/newsBlog/fragment/NBCategoryFragment.dart';
import 'package:mighty_ui_kit/apps/newsBlog/models/NewsModel.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBBloombergNewsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBBookMarkedScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBCNNNewsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBFoxNewsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBAboutScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBCNewsScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBSettingScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBSignInScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBPopularCategories.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../main.dart';

void choiceAction(String choice) {
  print('Selected');
}

List<Category> dateTimeFormat() {
  List<Category> _dateTimeFormatList = [
    Category(title: '24 Hours'),
    Category(title: '12 Hours'),
  ];
  return _dateTimeFormatList;
}

List<Channel> newsChannels() {
  List<Channel> newsChannelList = [
    Channel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/bloomBerg1.png', newsChannel: NBBloombergScreen(), name: 'Bloomberg'),
    Channel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/CNN.png', newsChannel: NBCNNNewsScreen(), name: 'CNN'),
    Channel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/Fox.png', newsChannel: NBFoxNewsScreen(), name: 'Fox News'),
    Channel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/NBC.jpg', newsChannel: NBNBCScreen(), name: 'NBC'),
  ];
  return newsChannelList;
}


List<NewsModel> latestNews() {
  List<NewsModel> latestNewsList = [
    NewsModel(
      img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/supernova.jpg',
      subTitle: 'SUPER NOVA: NEW FRUIT SET TO BECOME THE KING OF THE CITRUS WORLD',
      timeAgo: '3m',
      title: 'New York Times',
      type: 'World',
      saved: false,
      tag: 'supernova',
    ),
    NewsModel(
      img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/opioid.jpg',
      subTitle: 'Opioid treatment is used vastly more in states that expands medicaid',
      timeAgo: '3m',
      title: 'Bloomberg',
      type: 'LifeStyle',
      saved: false,
      tag: 'opioid',
    ),
    NewsModel(
      img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/qual.jpg',
      subTitle: 'Qualcomm wins reprieve in F.T.C. antitrust case with appeals court ruling',
      timeAgo: '5m',
      title: 'NBC News',
      type: 'Technology',
      saved: true,
      tag: 'qualcomm',
    ),
  ];
  return latestNewsList;
}

List<NewsModel> nbcNewsList() {
  List<NewsModel> listNBCNews = [
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/puppies.jpg', subTitle: "Optimism may hold secret to longer life, study suggests", type: 'World', timeAgo: '8m', saved: true, tag: 'Optimism'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/leaves.jpg', subTitle: "The Minsk street that's gone to industrial center to cultural lab ", type: 'World', saved: false, timeAgo: '9m', tag: 'street'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/citySunset.jpg', subTitle: "I craved stability and wasn't getting from modelling", timeAgo: '7m', saved: true, type: 'LifeStyle', tag: 'opioid'),
    NewsModel(tag: 'retreat', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/portugal.jpg', subTitle: "On the crest of wave:Portugal's new eco holiday retreat", saved: true, type: 'Travel', timeAgo: '3m '),
    NewsModel(tag: 'fun places', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/russia.jpg', subTitle: "Russian leave:fun places to stay on four routes to the Russia", saved: false, type: 'Travel', timeAgo: '12m '),
  ];
  return listNBCNews;
}

List<NewsModel> travelTabVertical() {
  List<NewsModel> travelTabNewsVertical = [
    NewsModel(tag: 'hurricane', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/city.jpg', subTitle: 'Who gets to label next storm or hurricane in the alphabetic sequence', saved: true, type: 'Travel', timeAgo: '4m'),
    NewsModel(tag: 'SeaBlack', saved: false, img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i5.jpg', subTitle: 'Why tourists are flocking to the black sea ', type: 'Travel', timeAgo: '5m '),
  ];
  return travelTabNewsVertical;
}

List<NewsModel> travelTabHorizontal() {
  List<NewsModel> travelTabNewsHorizontal = [
    NewsModel(tag: 'Perfect', saved: true, img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i8.jpg', subTitle: 'Sanya in 6 days:Our selection for perfect trip', type: 'Travel', timeAgo: '10m'),
    NewsModel(tag: 'icebergs', saved: false, img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/mountain.jpg', subTitle: "From ice hotels to icebergs: unmissable Canada adventures", type: 'Travel', timeAgo: '8m'),
    NewsModel(tag: 'four route', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/russia.jpg', saved: false, subTitle: "Russian leave:fun places to stay on four routes to the Russia", type: 'Travel', timeAgo: '12m'),
    NewsModel(tag: 'retreat', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/portugal.jpg', subTitle: "On the crest of wave:Portugal's new eco holiday retreat", type: 'Travel', saved: true, timeAgo: '3m'),
  ];
  return travelTabNewsHorizontal;
}

List<NewsModel> lifeTab() {
  List<NewsModel> lifeTabList = [
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i3.jpg', subTitle: 'A chance to bond on a perilous hiking trail in Iceland', timeAgo: '3m', type: 'Health', saved: true, tag: 'Hiking'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i6.jpg', subTitle: "The modern uniform of brand have become negative", timeAgo: '7m', type: 'Lifestyle', saved: false, tag: '-ve'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/opioid.jpg', subTitle: 'Opioid treatment is used vastly more in states that expands medicaid', timeAgo: '3m', type: 'LifeStyle', saved: false, tag: 'opioid'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/c1.jpg', subTitle: 'Physical activity:Why plants are treatment for depression and anxiety', timeAgo: '3m', type: 'Health', saved: false, tag: 'Depression'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/citySunset.jpg', subTitle: "I craved stability and wasn't getting from modelling", timeAgo: '7m', type: 'LifeStyle', saved: true, tag: 'City'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/car.jpg', subTitle: "Cheating men's face shapes can give it away, study suggests ", timeAgo: '6m', type: 'Lifestyle', saved: true, tag: 'face'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/home.jpg', subTitle: 'Bring the outside in: How to style your home to make the most of nature', timeAgo: '14m', type: 'Lifestyle', saved: false, tag: 'style'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/dog.jpg', subTitle: "Why sexually transmitted infections can't shake their stigma", timeAgo: '3m', type: 'Health', saved: false, tag: 'infection'),
  ];
  return lifeTabList;
}

List<NewsModel> worldTabVertical() {
  List<NewsModel> worldTabNewsVertical = [
    NewsModel(
        img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/supernova.jpg',
        subTitle: 'SUPER NOVA: NEW FRUIT SET TO BECOME THE KING OF THE CITRUS WORLD',
        timeAgo: '3m',
        title: 'New York Times',
        type: 'World',
        saved: false,
        tag: 'supernova'),
    NewsModel(tag: 'Belarus', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/village.jpg', subTitle: 'Step back in time and experience middle age villages in Belarus', type: 'World', saved: false, timeAgo: '10m'),
  ];
  return worldTabNewsVertical;
}

List<NewsModel> worldTabHorizontal() {
  List<NewsModel> worldTabNewsHorizontal = [
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i7.jpg', subTitle: 'Lions escape from kruger park South Africa', timeAgo: 'World', type: '6m', saved: true, tag: 'Lions'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/puppies.jpg', subTitle: "Optimism may hold secret to longer life, study suggests", timeAgo: 'World', type: '8m', saved: true, tag: 'Optimism'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/leaves.jpg', subTitle: "The Minsk street that's gone to industrial center to cultural lab ", timeAgo: 'World', type: '9m', saved: false, tag: 'street'),
  ];
  return worldTabNewsHorizontal;
}

List<NewsModel> hotPosts() {
  List<NewsModel> hotPostList = [
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i4.jpg', subTitle: 'How China uses LinkedIn to recruit spies abroad', timeAgo: '1m', title: 'New York Times', type: 'Politics', saved: false, tag: 'China'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i3.jpg', subTitle: 'A chance to bond on a perilous hiking trail in Iceland', timeAgo: '3m', type: 'Health', saved: true, tag: 'Hiking'),
    NewsModel(tag: 'SeaBlack', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i5.jpg', subTitle: 'Why tourists are flocking to the black sea ', type: 'Travel', saved: false, timeAgo: '5m'),
    NewsModel(tag: 'Perfect', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i8.jpg', subTitle: 'Sanya in 6 days:Our selection for perfect trip', type: 'Travel', saved: true, timeAgo: '10m'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i7.jpg', subTitle: 'Lions escape from kruger park South Africa', timeAgo: 'World', type: '6m', saved: true, tag: 'Lions'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i6.jpg', subTitle: "The uniform of brand have become '-ve'", timeAgo: '7m', type: 'Lifestyle', saved: false, tag: '-ve'),
  ];
  return hotPostList;
}

List<Category> categoryList() {
  List<Category> category = [
    Category(title: 'For You', status: false),
    Category(title: 'Health', status: true),
    Category(title: 'Latest', status: false),
    Category(title: 'Popular', status: true),
    Category(title: 'World', status: false),
    Category(title: 'Technology', status: false),
    Category(title: 'Lifestyle', status: true),
    Category(title: 'Business', status: true),
    Category(title: 'Travel', status: false),
    Category(title: 'Sports', status: true),
    Category(title: 'E-Commerce', status: false),
    Category(title: 'Movies', status: true),
    Category(title: 'Car', status: true),
  ];
  return category;
}

List<NewsModel> newsListCNNSmall() {
  List<NewsModel> listCNNNewsSmall = [
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/car.jpg', subTitle: "Cheating men's face shapes can give it away, study suggests ", timeAgo: '6m', type: 'Lifestyle', saved: true, tag: 'face'),
    NewsModel(tag: 'icebergs', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/mountain.jpg', subTitle: "From ice hotels to icebergs: unmissable Canada adventures", type: 'Travel', saved: false, timeAgo: '8m'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/dog.jpg', subTitle: "Why sexually transmitted infections can't shake their stigma", timeAgo: '3m', type: 'Health', saved: false, tag: 'infection'),
  ];
  return listCNNNewsSmall;
}

List<NewsModel> newsListCNNBig() {
  List<NewsModel> listCNNNewsBig = [
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/c1.jpg', subTitle: 'Physical activity:Why plants are treatment for depression and anxiety', timeAgo: '3m', type: 'Health', saved: false, tag: 'Depression'),
    NewsModel(
      tag: 'hurricane',
      img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/city.jpg',
      subTitle: 'Who gets to label next storm or hurricane in the alphabetic sequence',
      type: 'Travel',
      timeAgo: '4m',
      saved: true,
    ),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/home.jpg', subTitle: 'Bring the outside in: How to style your home to make the most of nature', timeAgo: '14m', type: 'Lifestyle', saved: false, tag: 'style'),
  ];
  return listCNNNewsBig;
}

List<NewsModel> bookMarkNews() {
  List<NewsModel> bookmarkNews = [
    NewsModel(
      tag: 'FB',
      img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/gadgets.jpg',
      title: 'New York Times',
      subTitle: 'Facebook preparing new app to maintain pressure on snapchat',
      type: 'Travel',
      timeAgo: '3m',
      saved: false,
    ),
    NewsModel(
      tag: 'sane',
      img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/house1.jpg',
      title: 'The Washington Post',
      subTitle: "Michael Pinter's dream day would be buying new house in the morning and selling it the sane afternoon",
      type: 'Real Estate',
      timeAgo: '4m',
      saved: false,
    ),
    NewsModel(
      tag: 'mental health',
      img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/garden.jpg',
      title: 'NBC News',
      subTitle: 'Gardening help our mental health.We should do more',
      type: 'Life Style',
      timeAgo: '8m',
      saved: true,
    )
  ];
  return bookmarkNews;
}

List<NewsModel> bookMarks() {
  List<NewsModel> bookMarkedNewsList = [
    NewsModel(
      tag: 'hurricane',
      img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/city.jpg',
      subTitle: 'Who gets to label next storm or hurricane in the alphabetic sequence',
      type: 'Travel',
      timeAgo: '4m',
      saved: true,
    ),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/car.jpg', subTitle: "Cheating men's face shapes can give it away, study suggests ", timeAgo: '6m', type: 'Lifestyle', saved: true, tag: 'face'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i7.jpg', subTitle: 'Lions escape from kruger park South Africa', timeAgo: 'World', type: '6m', saved: true, tag: 'Lions'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i3.jpg', subTitle: 'A chance to bond on a perilous hiking trail in Iceland', timeAgo: '3m', type: 'Health', saved: true, tag: 'Hiking'),
    NewsModel(
      tag: 'mental health',
      img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/garden.jpg',
      title: 'NBC News',
      subTitle: 'Gardening help our mental health.We should do more',
      type: 'Life Style',
      timeAgo: '8m',
      saved: true,
    ),
    NewsModel(
        img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/qual.jpg',
        subTitle: 'Qualcomm wins reprieve in F.T.C. antitrust case with appeals court ruling',
        timeAgo: '5m',
        title: 'NBC News',
        type: 'Technology',
        saved: true,
        tag: 'qualcomm'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/puppies.jpg', subTitle: "Optimism may hold secret to longer life, study suggests", type: 'World', timeAgo: '8m', saved: true, tag: 'Optimism'),
    NewsModel(tag: 'retreat', img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/portugal.jpg', subTitle: "On the crest of wave:Portugal's new eco holiday retreat", saved: true, type: 'Travel', timeAgo: '3m '),
    NewsModel(tag: 'Perfect', saved: true, img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/i8.jpg', subTitle: 'Sanya in 6 days:Our selection for perfect trip', type: 'Travel', timeAgo: '10m'),
    NewsModel(img: 'https://meetmighty.com//codecanyon/mightyuikit/NewsBlog1/citySunset.jpg', subTitle: "I craved stability and wasn't getting from modelling", timeAgo: '7m', type: 'LifeStyle', saved: true, tag: 'City'),
  ];
  return bookMarkedNewsList;
}

List<NewsModel> drawerList() {
  List<NewsModel> list = [];
  list.add(NewsModel(icon: Icon(Icons.home, color: appStore.isDarkModeOn? white: black), title: 'Home'));
  list.add(NewsModel(icon: Icon(Feather.user, color: appStore.isDarkModeOn? white: black), widget: NBAccountFragment(), title: 'Profile'));
  list.add(NewsModel(icon: Icon(AntDesign.appstore1, color: appStore.isDarkModeOn? white: black), widget: NBCategoryFragment(), title: 'Categories'));
  list.add(NewsModel(icon: Icon(Icons.settings, color: appStore.isDarkModeOn? white: black), widget: NBSettingScreen(), title: 'Settings'));
  list.add(NewsModel(icon: Icon(AntDesign.logout, color: appStore.isDarkModeOn? white: black), widget: NBSignInScreen(), title: 'Log Out'));
  list.add(NewsModel(icon: Icon(AntDesign.infocirlceo, color: appStore.isDarkModeOn? white: black), widget: NBAboutScreen(), title: 'About'));

  return list;
}

List<NewsModel> settingList() {
  List<NewsModel> list = [];
  list.add(NewsModel(title: 'Email', subTitle: 'boltrogers@gmail.com'));
  list.add(NewsModel(title: 'Full Name', subTitle: 'gojous@gmail.com'));
  list.add(NewsModel(title: 'Favourite channels', subTitle: '12'));
  list.add(NewsModel(title: 'Bookmarks', subTitle: '294', widget: NBBookMarkedScreen()));
  list.add(NewsModel(title: 'Popular Categories', subTitle: '7', widget: NBPopularCategories()));
  list.add(NewsModel(title: 'Newsletters'));
  list.add(NewsModel(title: 'Setting', widget: NBSettingScreen()));
  list.add(NewsModel(title: 'Logout'));

  return list;
}

List<NewsModel> settingDataList() {
  List<NewsModel> list = [];
  list.add(NewsModel(title: 'Data Usage', icon: Icon(MaterialIcons.data_usage,color: appStore.isDarkModeOn ? white : black)));
  list.add(NewsModel(title: 'Privacy Setting', icon: Icon(Feather.lock,color: appStore.isDarkModeOn ? white : black)));
  list.add(NewsModel(title: 'Ads', icon:  Icon(Entypo.megaphone,color: appStore.isDarkModeOn ? white : black)));
  list.add(NewsModel(title: 'Security', icon: Icon(Ionicons.shield_checkmark_outline,color: appStore.isDarkModeOn ? white : black)));
  list.add(NewsModel(title: 'About', icon: Icon(Octicons.issue_opened,color: appStore.isDarkModeOn ? white : black),widget: NBAboutScreen()));


  return list;
}

List<NewsModel>  getBloombergList(){
  List<NewsModel> list = [];
  list.add(NewsModel(title: '#plant'));
  list.add(NewsModel(title: '#today'));
  list.add(NewsModel(title: '#trump'));
  list.add(NewsModel(title: '#rock'));
  list.add(NewsModel(title: '#sports'));
  list.add(NewsModel(title: '#blocmberg'));
  list.add(NewsModel(title: '#music'));
  list.add(NewsModel(title: '#number'));
  list.add(NewsModel(title: '#calls'));

  return list;
}