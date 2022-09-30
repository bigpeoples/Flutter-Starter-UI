import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGFAQModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGFilterModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGFriendsModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGGoalModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGHealthyTipsModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGHomeFragmentModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGProfileModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGProfileTopicModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGSearchModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGSettingsModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGTanningTabFragmentModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGTopicDetailModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGWalkThroughModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/model/YGYogabasicforbeginnerModel.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGAccountScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGCouponScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGFAQScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGFriendsScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGProfileScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGColors.dart';
import 'package:mighty_ui_kit/apps/yogaApp/utils/YGImages.dart';

List walkThroughList = [
  YGWalkThroughModel(
      url: yg_bodyStretch,
      text: 'Your Yoga',
      subtext: "Lorem ipsum, or lipsum as it is sometimes known, is"
          " dummy text used in laying out print,"
          " graphic or web designs. The passage is attributed to an unknown"),
  YGWalkThroughModel(
      url: yg_meditation,
      text: 'Your Healthy',
      subtext: "Lorem ipsum, or lipsum as it is sometimes known, is"
          " dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown"),
  YGWalkThroughModel(
      url: yg_food,
      text: 'Learning to Relax',
      subtext: "Lorem ipsum, or lipsum as it is sometimes known, is dummy "
          "text used in laying out print, graphic or web designs. The passage is attributed to an unknown")
];

List<YGHomeDataModel> homeFragmentList = [
  YGHomeDataModel(url: yg_meditation),
  YGHomeDataModel(url: yg_bodyStretch),
  YGHomeDataModel(url: yg_exerciseImage3),
];

List<YGHomeTabDataModel> homeTabList = [
  YGHomeTabDataModel(url: yg_meditation, text: "Easy Yoga For Complete Beginners", subtitle: "Level 1"),
  YGHomeTabDataModel(url: yg_exerciseImage2, text: "Yoga Basics For Beginner", subtitle: "Level 1"),
  YGHomeTabDataModel(url: yg_exerciseImage3, text: "12 Most known Yoga For beginner", subtitle: "Level 1"),
  YGHomeTabDataModel(url: yg_exerciseImage2, text: "Yoga Basics For Beginner", subtitle: "Level 1"),
];

List<YGHomeProgramModel> homeProgramList = [
  YGHomeProgramModel(url: yg_trainingImage1, subtitle: "TRIYOGA BASICS FLOW", text: "Level 1"),
  YGHomeProgramModel(url: yg_trainingImage2, subtitle: "TRIYOGA BASICS FLOW", text: "Level 1"),
  YGHomeProgramModel(url: yg_trainingImage3, subtitle: "TRIYOGA BASICS FLOW", text: "Level 1"),
  YGHomeProgramModel(url: yg_trainingImage4, subtitle: "TRIYOGA BASICS FLOW", text: "Level 1"),
];

List<YGTrainingTabFragment> trainingTabList = [
  YGTrainingTabFragment(url: yg_meditation, text: "7 Day Core Strength Building", subtitle: "Level 2"),
  YGTrainingTabFragment(url: yg_exerciseImage2, text: "Strength building ", subtitle: "Level 2"),
  YGTrainingTabFragment(url: yg_exerciseImage3, text: "7 Day Core Strength Building", subtitle: "Level 2"),
];

List<YGTrainingModel> trainingFragmentList = [
  YGTrainingModel(url: yg_trainingImage1, subtitle: "30 DAY YOGA CHALLENGE", text: "Level 2"),
  YGTrainingModel(url: yg_trainingImage2, subtitle: "VINYASA FLOW FOR YOGA", text: "Level 2"),
  YGTrainingModel(url: yg_trainingImage3, subtitle: "30 DAY YOGA CHALLENGE", text: "Level 2"),
  YGTrainingModel(url: yg_trainingImage4, subtitle: "30 DAY YOGA CHALLENGE", text: "Level 2"),
];

List<YGSkilledDataModel> skilledList = [
  YGSkilledDataModel(url: yg_meditation, text: "7 Day Core Strength Building", subtitle: "Level 2"),
  YGSkilledDataModel(url: yg_exerciseImage2, text: "Strength building", subtitle: "Level 2"),
  YGSkilledDataModel(url: yg_exerciseImage3, text: "7 Day Core Strength Building", subtitle: "Level 2"),
  YGSkilledDataModel(url: yg_exerciseImage1, text: "Strength building  Exercise for beginners", subtitle: "Level 2"),
  YGSkilledDataModel(url: yg_exerciseImage2, text: "7 Day Core Strength Building", subtitle: "Level 2"),
  YGSkilledDataModel(url: yg_exerciseImage1, text: "Strength building  Exercise for beginners", subtitle: "Level 2"),
];

List<YGHealthDataModel> healthyTipsDataList = [
  YGHealthDataModel(url: yg_meditation, text: "Weight Lose"),
  YGHealthDataModel(url: yg_nutrition, text: "Nutrition"),
  YGHealthDataModel(url: yg_healthYoga, text: "Weight Lose"),
  YGHealthDataModel(url: yg_nutrition, text: "Nutrition"),
];

List<HealthTopicDataModel> healthTopicDataList = [
  HealthTopicDataModel(url: yg_nutrition, text: "5 Easy Weeknight Dinners", like: 415, comment: 29, isLike: true),
  HealthTopicDataModel(url: yg_healthYoga, text: "15 Minute Yoga for Beginners", like: 321, comment: 29, isLike: true),
  HealthTopicDataModel(url: yg_nutrition, text: "5 Easy Weeknight Dinners", like: 415, comment: 29, isLike: true),
  HealthTopicDataModel(url: yg_healthYoga, text: "15 Minute Yoga for Beginners", like: 321, comment: 29, isLike: true),
  HealthTopicDataModel(url: yg_nutrition, text: "5 Easy Weeknight Dinners", like: 415, comment: 29, isLike: true),
  HealthTopicDataModel(url: yg_healthYoga, text: "15 Minute Yoga for Beginners", like: 321, comment: 29, isLike: true),
  HealthTopicDataModel(url: yg_nutrition, text: "5 Easy Weeknight Dinners", like: 415, comment: 29, isLike: true),
  HealthTopicDataModel(url: yg_healthYoga, text: "15 Minute Yoga for Beginners", like: 321, comment: 29, isLike: true),
];

List<YGGoalDataModel> goalDataList = [
  YGGoalDataModel(url: yg_meditation, text: "Easy Yoga For Neck & Back", subtext: "1 days ago", label: "Day 03"),
  YGGoalDataModel(url: yg_bodyStretch, text: "Easy Yoga For Body Stretches", subtext: "2 days ago", label: "Day 02"),
  YGGoalDataModel(url: yg_exerciseImage2, text: "Easy Yoga For Strength", subtext: "3 days ago", label: "Day 01"),
];
List<YGGoalDataModel> goalImageList = [
  YGGoalDataModel(url: yg_goalImg),
  YGGoalDataModel(url: yg_goalImg2),
  YGGoalDataModel(url: yg_strength),
];

List<YGProfileDataModel> profileDataList = [
  YGProfileDataModel(url: yg_addPerson, text: "Invite Friends", color: Colors.yellow, page: YGFriendsScreen()),
  YGProfileDataModel(url: yg_test, text: "Ability Test", color: yg_primaryColor),
  YGProfileDataModel(url: yg_topics, text: "My Topics", color: Colors.lightBlueAccent, page: YGProfileScreen()),
  YGProfileDataModel(url: yg_download, text: "Downloads Management", color: Colors.lightBlue),
  YGProfileDataModel(url: yg_coupons, text: "Coupons", color: Colors.deepPurpleAccent, page: YGCouponScreen()),
  YGProfileDataModel(url: yg_faq, text: "FAQ & Feedback", color: yg_primaryColor, page: YGFAQScreen()),
  YGProfileDataModel(url: yg_gift, text: "Give The Gift of Daily Yoga", color: Colors.orange[300]),
];

List<YGYogaBasicForBeginnerDataModel> yogaBasicForBeginnerList = [
  YGYogaBasicForBeginnerDataModel(url: yg_splash, text: "Easy Yoga For Strength", subtext: "11 min", label: "Day 01"),
  YGYogaBasicForBeginnerDataModel(url: yg_bodyStretch, text: "Easy Yoga For Body Stretches", subtext: "15 min", label: "Day 02"),
  YGYogaBasicForBeginnerDataModel(url: yg_meditation, text: "Easy Yoga For Neck & Back", subtext: "10 min", label: "Day 03"),
  YGYogaBasicForBeginnerDataModel(url: yg_splash, text: "Easy Yoga For Flexibility", subtext: "15 min", label: "Day 04"),
  YGYogaBasicForBeginnerDataModel(url: yg_bodyStretch, text: "Easy Yoga For SpinalFlow", subtext: "11 min", label: "Day 05"),
  YGYogaBasicForBeginnerDataModel(url: yg_meditation, text: "Easy Yoga For Neck & Back", subtext: "10 min", label: "Day 06"),
  YGYogaBasicForBeginnerDataModel(url: yg_splash, text: "Easy Yoga For Flexibility", subtext: "15 min", label: "Day 07"),
];

List<YGFriendDataModel> friendList = [
  YGFriendDataModel(image: yg_splash, name: "LeDae Anderson", subtext: "Germany", like: false),
  YGFriendDataModel(image: yg_meditation, name: "Priscilla", subtext: "Chicago,USA", like: false),
  YGFriendDataModel(image: yg_food, name: "Dextrad", subtext: "Chicago,USA", like: false),
  YGFriendDataModel(image: yg_meditation, name: "Elaineelaine", subtext: "Germany", like: false),
  YGFriendDataModel(image: yg_food, name: "Elaineelaine", subtext: "Germany", like: false),
  YGFriendDataModel(image: yg_meditation, name: "Dextrad", subtext: "Chicago,USA", like: false),
  YGFriendDataModel(image: yg_splash, name: "LeDae Anderson", subtext: "Germany", like: false),
  YGFriendDataModel(image: yg_meditation, name: "Priscilla", subtext: "Chicago,USA", like: false),
  YGFriendDataModel(image: yg_splash, name: "Dextrad", subtext: "Chicago,USA", like: false),
];

List<YGSettingDataModel> settingDataList = [
  YGSettingDataModel(url: yg_account, text: "Account", color: yg_primaryColor, data: " ", page: YGAccountScreen()),
  YGSettingDataModel(url: yg_notification, text: "Notification", color: Colors.yellow[800], data: " "),
  YGSettingDataModel(url: yg_privacy, text: "Privacy", color: Colors.lightBlueAccent, data: " "),
  YGSettingDataModel(url: yg_clearCache, text: "Clear Cache", color: Colors.pinkAccent, data: "16.36 M"),
  YGSettingDataModel(url: yg_language, text: "Language", color: Colors.blueAccent, data: " "),
  YGSettingDataModel(url: yg_gift, text: "Rate Us", color: Colors.cyan, data: " "),
  YGSettingDataModel(url: yg_about, text: "About", color: yg_primaryColor, data: " "),
];

List<YGSearchDataModel> searchList = [
  YGSearchDataModel(text: "Flexibility", isLike: true),
  YGSearchDataModel(text: "Back pain", isLike: true),
  YGSearchDataModel(text: "Abs", isLike: true),
  YGSearchDataModel(text: "Sleep", isLike: true),
  YGSearchDataModel(text: "Neck", isLike: true),
  YGSearchDataModel(text: "Health", isLike: true),
  YGSearchDataModel(text: "Begin Yoga", isLike: true),
  YGSearchDataModel(text: "For man", isLike: true),
  YGSearchDataModel(text: "More Flexibility", isLike: true),
];

List<YGFAQDataModel> faqList = [
  YGFAQDataModel(text: "What is pro Silver or Gold?"),
  YGFAQDataModel(text: "How to Cancel prosubscription/free trial?"),
  YGFAQDataModel(text: "What is pro Silver or Gold?"),
  YGFAQDataModel(text: "Why i cant't Load/open Video/audio Successfully?"),
  YGFAQDataModel(text: "App Support"),
  YGFAQDataModel(text: "Account & Profile Setting"),
];

List<YGFAQDataModel> faqDataList = [
  YGFAQDataModel(text: "App Support"),
  YGFAQDataModel(text: "Account & Profile Setting"),
  YGFAQDataModel(text: "Subsciption and bring refund "),
  YGFAQDataModel(text: "Account & Profile Setting"),
];

List<YGTypeData> typeList = [
  YGTypeData(text: 'Session', isLike: true),
  YGTypeData(text: 'Program', isLike: true),
  YGTypeData(text: 'Workshop', isLike: true),
];

List<YGTypeData> levelList = [
  YGTypeData(text: 'Level 1', isLike: true),
  YGTypeData(text: 'Level 1-2', isLike: true),
  YGTypeData(text: 'Level 2', isLike: true),
  YGTypeData(text: 'Level 2-3', isLike: true),
  YGTypeData(text: 'Level 3', isLike: true),
];

List<YGTypeData> durationList = [
  YGTypeData(text: '0-10 min', isLike: true),
  YGTypeData(text: '10-20 min', isLike: true),
  YGTypeData(text: '20-30 min', isLike: true),
  YGTypeData(text: '30-45 min', isLike: true),
  YGTypeData(text: '45-60 min', isLike: true),
  YGTypeData(text: '>60 min', isLike: true),
];

List<YGTypeData> focusList = [
  YGTypeData(text: '0-10 min', isLike: true),
  YGTypeData(text: '10-20 min', isLike: true),
  YGTypeData(text: '20-30 min', isLike: true),
  YGTypeData(text: '30-45 min', isLike: true),
  YGTypeData(text: '45-60 min', isLike: true),
  YGTypeData(text: '>60 min', isLike: true),
];

List<YGTypeData> bodyPartList = [
  YGTypeData(text: "Flexibility", isLike: true),
  YGTypeData(text: "Back pain", isLike: true),
  YGTypeData(text: "Immunity system", isLike: true),
  YGTypeData(text: "Digestion", isLike: true),
  YGTypeData(text: "skin rejuvenation", isLike: true),
  YGTypeData(text: "Strength", isLike: true),
  YGTypeData(text: "Neck", isLike: true),
  YGTypeData(text: "Health", isLike: true),
  YGTypeData(text: "Pain Relief", isLike: true),
  YGTypeData(text: "45 Essential Control", isLike: true),
];

List<YGCommentDataModel> commentList = [
  YGCommentDataModel(
    image: imageList,
    text: "My husband made lemon chicken Tuesday night Delicious...",
    profileImage: yg_food,
    date: '10-03-2020',
    name: "LeDee Anderson",
  ),
  YGCommentDataModel(text: "Good Morning Guys...I've been long time ago Last time...But i have use this app for My daily practice", profileImage: yg_splash, date: '29-12-2020', name: "SaharaZs", image: imageDataList),
];
List<YGImageData> imageList = [YGImageData(image: yg_meditation), YGImageData(image: yg_nutrition), YGImageData(image: yg_neckBack)];
List<YGImageData> imageDataList = [
  YGImageData(image: yg_neckBack),
  YGImageData(image: yg_exerciseImage2),
  YGImageData(image: yg_meditation),
];

List<YGTopicDataModel> topicList = [
  YGTopicDataModel(text: "Good Morning Guys...I've been long time ago Last time...But i have use this app for My daily practice", image: profileImageList, date: '29-12-2020', like: true),
  YGTopicDataModel(text: "", image: profile2ImageList, date: '10-03-2020', like: true),
  YGTopicDataModel(text: "Good Morning Guys...I've been long time ago Last time...But i have use this app for My daily practice", image: profile3ImageList, date: '29-12-2020', like: true),
  YGTopicDataModel(text: "", image: profile4ImageList, date: '10-03-2020', like: true),
];
List<YGPostImage> profileImageList = [
  YGPostImage(image: yg_exerciseImage2),
  YGPostImage(image: yg_bodyStretch),
  YGPostImage(image: yg_strength),
];

List<YGPostImage> profile2ImageList = [
  YGPostImage(image: yg_splash),
  YGPostImage(image: yg_meditation),
  YGPostImage(
    image: yg_exerciseImage3,
  ),
];
List<YGPostImage> profile3ImageList = [
  YGPostImage(image: yg_exerciseImage2),
  YGPostImage(image: yg_bodyStretch),
  YGPostImage(image: yg_strength),
];
List<YGPostImage> profile4ImageList = [
  YGPostImage(image: yg_splash),
  YGPostImage(image: yg_meditation),
  YGPostImage(image: yg_exerciseImage3),
];
