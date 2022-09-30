import 'package:mighty_ui_kit/apps/IIumiaCrypto/screens/ICSplashScreen.dart';
import 'package:mighty_ui_kit/apps/VPNApp/screen/VPNSplashScreen.dart';
import 'package:mighty_ui_kit/apps/eCommerce/screens/mainscreens/ECSplashScreen.dart';
import 'package:mighty_ui_kit/apps/eGarden/screen/EGSplashScreen.dart';
import 'package:mighty_ui_kit/apps/eStudy/screen/ESSplashScreen.dart';
import 'package:mighty_ui_kit/apps/finance/screen/FASplashScreen.dart';
import 'package:mighty_ui_kit/apps/fitnessApp/screens/FTSplashScreen.dart';
import 'package:mighty_ui_kit/apps/foodDelivery/screen/FDSplashScreen.dart';
import 'package:mighty_ui_kit/apps/groceryApp/screens/GSSplashScreen.dart';
import 'package:mighty_ui_kit/apps/handyman/screens/HMWalkThroughScreen.dart';
import 'package:mighty_ui_kit/apps/meelaApp/screens/MBSplashScreen.dart';
import 'package:mighty_ui_kit/apps/newsBlog/screen/NBSplashScreen.dart';
import 'package:mighty_ui_kit/apps/nftApp/screen/NFSplashScreen.dart';
import 'package:mighty_ui_kit/apps/rentHouse/screen/RHSplashScreen.dart';
import 'package:mighty_ui_kit/apps/smartHome/screen/HSSplashScreen.dart';
import 'package:mighty_ui_kit/apps/taskManagement/screen/TMSplashScreen.dart';
import 'package:mighty_ui_kit/apps/yogaApp/screens/YGSplashScreen.dart';
import 'package:mighty_ui_kit/main/models/AppModel.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/AppPaginationApi.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/GetListApiWidget.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/PostApiWidget.dart';
import 'package:mighty_ui_kit/snippets/APIIntergration/UpdateApiWidget.dart';
import 'package:mighty_ui_kit/snippets/CropImageScreen.dart';
import 'package:mighty_ui_kit/snippets/CustomLoaderScreen.dart';
import 'package:mighty_ui_kit/snippets/QuickActionScreen.dart';
import 'package:mighty_ui_kit/snippets/SharedPreferenceScreen.dart';
import 'package:mighty_ui_kit/snippets/URLLauncherScreen.dart';
import 'package:mighty_ui_kit/snippets/adMob/AdMobScreen.dart';
import 'package:mighty_ui_kit/snippets/firebaseCRUD/FirebaseCRUDOperation.dart';
import 'package:mighty_ui_kit/snippets/notifications/LocalNotificationScreen.dart';
import 'package:mighty_ui_kit/snippets/notifications/RemoteNotificationScreen.dart';
import 'package:mighty_ui_kit/snippets/notifications/ScheduledNotificationScreen.dart';
import 'package:mighty_ui_kit/snippets/paymentGateway/RazorPaymentGateWayScreen.dart';
import 'package:mighty_ui_kit/snippets/paymentGateway/StripePaymentScreen.dart';
import 'package:mighty_ui_kit/snippets/qrScanner/BarCodeScannerScreen.dart';
import 'package:mighty_ui_kit/snippets/qrScanner/QRCodeScannerScreen.dart';
import 'package:mighty_ui_kit/snippets/shimmer/ShimmerLoadingScreen.dart';
import 'package:mighty_ui_kit/snippets/shimmer/ShimmerPageScreen.dart';
import 'package:mighty_ui_kit/snippets/shimmer/ShimmerPostScreen.dart';
import 'package:mighty_ui_kit/snippets/shimmer/ShimmerSlideUnlockScreen.dart';
import 'package:mighty_ui_kit/snippets/socialLogins/FirebaseRegistrationScreen.dart';
import 'package:mighty_ui_kit/snippets/socialLogins/GoogleSignInScreen.dart';
import 'package:mighty_ui_kit/snippets/socialLogins/LoginWithOTPScreen.dart';
import 'package:mighty_ui_kit/snippets/storyViwer/components/StoriesComponets.dart';
import 'package:mighty_ui_kit/widgets/animationAndMotionWidgets/AMAnimatedBuilderScreen.dart';
import 'package:mighty_ui_kit/widgets/animationAndMotionWidgets/AMAnimatedContainerScreen.dart';
import 'package:mighty_ui_kit/widgets/animationAndMotionWidgets/AMAnimatedCrossFadeScreen.dart';
import 'package:mighty_ui_kit/widgets/animationAndMotionWidgets/AMAnimatedPositionedScreen.dart';
import 'package:mighty_ui_kit/widgets/animationAndMotionWidgets/AMAnimatedSizeScreen.dart';
import 'package:mighty_ui_kit/widgets/animationAndMotionWidgets/AMHeroScreen.dart';
import 'package:mighty_ui_kit/widgets/animationAndMotionWidgets/AMScaleTransitionScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWActionSheetScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWActivityIndicatorScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWAlertDialogScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWButtonScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWContextMenuScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWDialogScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWNavigationBarScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWPickerScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWSegmentedControlScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWSliderScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWSlidingSegmentedControlScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWSwitchScreen.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWTabBarWidgets/CWTabBarScreen1.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWTabBarWidgets/CWTabBarScreen2.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWTabBarWidgets/CWTabBarScreen3.dart';
import 'package:mighty_ui_kit/widgets/cupertinoWidgets/CWTextFieldScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWAppBarScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWBottomNavigationWidgets/MWBottomNavigationScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWBottomNavigationWidgets/MWBottomNavigationScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWBottomNavigationWidgets/MWBottomNavigationScreen3.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWSliverAppBarWidgets/MWSliverAppBarScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWSliverAppBarWidgets/MWSliverAppBarScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWTabBarWidgets/MWTabBarScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWTabBarWidgets/MWTabBarScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWTabBarWidgets/MWTabBarScreen3.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTAppStrucutreWidget/MWTabBarWidgets/MWTabBarScreen4.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTButtonWidget/MWDropDownButtonScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTButtonWidget/MWFloatingActionButtonScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTButtonWidget/MWPopupMenuButtonScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTDialogAlertPanelWidget/MWAlertDialogScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTDialogAlertPanelWidget/MWBottomSheetScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTDialogAlertPanelWidget/MWExpansionPanelScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTDialogAlertPanelWidget/MWSimpleDialogScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/%20MWBannerSliderWidget/MWBannerSliderScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/%20MWBannerSliderWidget/MWBannerSliderScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWAnimatedListWidget/MWAnimatedListScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWAnimatedListWidget/MWAnimatedListScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWCardScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWCategoryMenuWidget/MWCategoryMenuListScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWCategoryMenuWidget/MWCategoryMenuListScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWClipRRectScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWDigitalSignatureWidget/MWDigitalSignatureListScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWDigitalSignatureWidget/MWDigitalSignatureListScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWDrawerWidget/MWDrawerScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWDrawerWidget/MWDrawerScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWDrawerWidget/MWDrawerScreen3.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWGridViewScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWListViewWidget/MWListViewScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWListViewWidget/MWListViewScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWListViewWidget/MWListViewScreen3.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWListViewWidget/MWListViewScreen4.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWListViewWidget/MWListViewScreen5.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWProgressBarScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWSliverTabBarWidget/MWSliverTabBarScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWSliverTabBarWidget/MWSliverTabBarScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWTransformScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWWrapWidget/MWWrapScreen1.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWWrapWidget/MWWrapScreen2.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInformationDisplayWidget/MWWrapWidget/MWWrapScreen3.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInputSelectionWidget/MWCheckboxScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInputSelectionWidget/MWDatetimePickerScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInputSelectionWidget/MWRadioScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInputSelectionWidget/MWSliderScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInputSelectionWidget/MWSwitchScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MTInputSelectionWidget/MWTextFormFieldScreen.dart';
import 'package:mighty_ui_kit/widgets/materialAppWidget/MWRefreshIndicatorScreen.dart';
import 'package:mighty_ui_kit/widgets/paintingAndEffectWidgets/PEBackdropFilterScreen.dart';
import 'package:mighty_ui_kit/widgets/paintingAndEffectWidgets/PETransformScreen.dart';

import '../models/AppModel.dart';
import 'AppConstants.dart';

List<AppModel> getAppsAndWidgets() {
  List<AppModel> list = [];

  list.add(AppModel(title: 'Widgets', description: '148 Flutter Widgets', subKit: getWidgetsList()));
  list.add(AppModel(title: 'Code Snippets', description: 'Ready-made Integrations', subKit: getCodeSnippetsList()));
  list.add(AppModel(title: 'Full App UI', description: '${getFullAppsList().length} Apps', subKit: getFullAppsList(), tag: 'New'));

  return list;
}

List<AppModel> getWidgetsList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Material App", description: "Custom Material App widgets for Good looking design", subKit: getMaterialWidgetList()));
  list.add(AppModel(title: "Cupertino", description: "Awesome cupertino widgets", subKit: getCupertinoWidgetList()));
  list.add(AppModel(title: "Painting and Effect", description: "Awesome effect Widgets", subKit: getPaintingEffectWidgetList()));
  list.add(AppModel(title: "Animation", description: "Awesome Animation Widgets", subKit: getAnimationAndMotionWidgetList()));

  return list;
}

List<AppModel> getAnimationAndMotionWidgetList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Animated Builder", description: "animated builder for build attractive animation", widget: AMAnimatedBuilderScreen()));
  list.add(AppModel(title: "Animated Container", description: "animated container for change color/size,etc.", widget: AMAnimatedContainerScreen()));
  list.add(AppModel(title: "Animated CrossFade", description: "animated crossfade for fade effect of widgets", widget: AMAnimatedCrossFadeScreen()));
  list.add(AppModel(title: "Animated Size", description: "animated size for change size with animation", widget: AMAnimatedSizeScreen()));
  list.add(AppModel(title: "Animated Position", description: "animated position for change widget position with animation", widget: AMAnimatedPositionedScreen()));
  list.add(AppModel(title: "Hero Transition", description: "hero transition for hero widget", widget: AMHeroScreen()));
  list.add(AppModel(title: "Scale Transition", description: "change scale of widgets with animation", widget: AMScaleTransitionScreen()));

  return list;
}

List<AppModel> getPaintingEffectWidgetList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "BackDrop Filter", description: "Backdrop filter to awesome the effect of filter", widget: PEBackdropFilterScreen()));
  list.add(AppModel(title: "Transform", description: "Transform animation", widget: PETransformScreen()));

  return list;
}

List<AppModel> getCodeSnippetsList() {
  List<AppModel> list = [];

  list.add(AppModel(title: 'Story View', description: 'Integrate Instagram Story Widget', widget: StoriesComponent()));
  list.add(AppModel(title: 'API', description: 'GET, POST API & Pagination Examples', subKit: getAPIList()));
  list.add(AppModel(title: 'Authentication', description: 'Social Logins like Google Sign In', subKit: getSocialLoginList()));
  list.add(AppModel(title: 'Image Cropper', description: 'Crop an image from Gallery or Camera.', widget: CropImageScreen()));
  list.add(AppModel(title: 'Shimmer', description: 'Shimmer is used to add beautiful animations.', subKit: getShimmerList()));
  list.add(AppModel(title: 'Custom Loader', description: 'Different types of Loaders', widget: CustomLoaderScreen()));
  list.add(AppModel(title: 'URL Launcher', description: 'Open URL, Call Dialer, Email App', widget: URLLauncherScreen()));
  list.add(AppModel(title: 'AdMob', description: 'Banner Ad, Interstitial Ad, Reward Ad, ', widget: AdMobScreen()));
  list.add(AppModel(title: 'Payment Gateways', description: 'RazorPay, Stripe', subKit: getPaymentGateWayList()));
  list.add(AppModel(title: 'Notification', description: 'Local, Remote & Scheduled Notification', subKit: getNotificationList()));
  list.add(AppModel(title: 'Firebase CRUD', description: 'Add, Update, Remove & Fetch Firebase Documentation', widget: FirebaseCRUDOperation()));
  list.add(AppModel(title: 'QR and Barcode scanner', description: '', subKit: getQRAndBarcodeScannerList()));
  list.add(AppModel(title: 'Quick Action (Android Only)', description: 'Long Press on App Icon For Demo', widget: QuickActionScreen()));
  list.add(AppModel(title: 'Shared Preference', description: 'Save and Read SharedPreferences', widget: SharedPreferenceScreen()));

  return list;
}

List<AppModel> getQRAndBarcodeScannerList() {
  List<AppModel> list = [];

  list.add(AppModel(title: 'QR Code Scanner', description: '', widget: QRCodeScannerScreen()));
  list.add(AppModel(title: 'Bar Code Scanner', description: '', widget: BarCodeScannerScreen()));

  return list;
}

List<AppModel> getNotificationList() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'Local Notification', description: '', widget: LocalNotificationScreen()));
  list.add(AppModel(title: 'Remote Notification', description: '', widget: RemoteNotificationScreen()));
  list.add(AppModel(title: 'Scheduled Notification', description: '', widget: ScheduledNotificationScreen()));

  return list;
}

List<AppModel> getSocialLoginList() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'Login with Google', description: '', widget: GoogleSignInScreen()));
  list.add(AppModel(title: 'Login with Firebase Cloud FireStore', description: '', widget: FirebaseRegistrationScreen()));
  list.add(AppModel(title: 'Login with OTP', description: '', widget: LoginWithOTPScreen()));

  return list;
}

List<AppModel> getFullAppsList() {
  List<AppModel> list = [];

  list.add(AppModel(title: 'NFTs', description: 'Non Fungible Token App', widget: NFSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp, tag: 'New'));
  list.add(AppModel(title: 'To-Do', description: 'Task Management App', widget: TMSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'EStudy', description: 'Online Learning App', widget: ESSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'IIumia Crypto', description: 'IIumia Crypto Coin', widget: ICSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'ECommerce', description: 'We’re in Business to Improve Lives', widget: ECSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'News Blog', description: 'Improve news knowledge', widget: NBSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'Fitness App', description: 'Improve your Fitness Today', widget: FTSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'Yoga', description: 'Learnt Yoga Online', widget: YGSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'Finance', description: 'Premium Finance Mobile App UI Kit', widget: FASplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'Food Delivery', description: 'The Best Shopping app for all your grocery.', widget: FDSplashScreen(), isDarkModeSupported: false, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'Grocery', description: 'The Best Shopping app for all your grocery.', widget: GSSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'eGarden', description: 'Garden Shopping App', widget: EGSplashScreen(), isDarkModeSupported: false, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'Handy Man', description: 'Home Service partner App', widget: HMWalkThroughScreen(), isDarkModeSupported: false, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'Smart Home', description: 'Control your smart home devices', widget: HSSplashScreen(), isDarkModeSupported: false, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'Rent House', description: 'Use your smartphone to search rent home, apartment for rent nearby you.', widget: RHSplashScreen(), isDarkModeSupported: false, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'VPN', description: 'Make your network secure and private', widget: VPNSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));
  list.add(AppModel(title: 'Meela Bank', description: 'Control your smart home devices', widget: MBSplashScreen(), isDarkModeSupported: true, themeType: ThemeTypeFullApp));

  return list;
}

List<AppModel> getShimmerList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Shimmer Loading", description: "", widget: ShimmerLoadingScreen()));
  list.add(AppModel(title: "Shimmer Unlock", description: "", widget: ShimmerSlideUnlockScreen()));
  list.add(AppModel(title: "Shimmer Page", description: "", widget: ShimmerPageScreen()));
  list.add(AppModel(title: "Shimmer Post", description: "", widget: ShimmerPostScreen()));

  return list;
}

List<AppModel> getAPIList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "GET", description: "", widget: GetListApiWidget()));
  list.add(AppModel(title: "POST", description: "", widget: PostApiWidget()));
  list.add(AppModel(title: "Update", description: "", widget: UpdateApiWidget()));
  list.add(AppModel(title: "Pagination", description: "", widget: PaginationApiWidget()));

  return list;
}

List<AppModel> getMaterialWidgetList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "App Structures", description: "different types of app structure", subKit: getAppStructureWidgetList()));
  list.add(AppModel(title: "Buttons", description: "custom designed button ", subKit: getButtonWidgetList()));
  list.add(AppModel(title: "Inputs and Selections", description: "checkbox, radio, slider, much more", subKit: getInputAndSelectionWidget()));
  list.add(AppModel(title: "Dialogs, Alerts and Panels", description: "dialogs for show messages", subKit: getDialogAlertAndPanelWidget()));
  list.add(AppModel(title: "Information Display", description: "card, chips, etc.", subKit: getInformationDisplayWidget()));

  return list;
}

List<AppModel> getAppStructureWidgetList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Appbar", description: "Different type of app bar with/without action", widget: MWAppBarScreen()));
  list.add(AppModel(title: "Bottom Navigation Bar", description: "add bottom navigation with fixed/shifting type", subKit: getBottomNavigationWidgetList()));
  list.add(AppModel(title: "Sliver Appbar", description: "collapsible Appbar with list view", subKit: getSliverAppBarWidgetList()));
  list.add(AppModel(title: "Tab Bar", description: "Awesome Tab Bar with/without scrolling", subKit: getTabBarWidgetList()));

  return list;
}

List<AppModel> getBottomNavigationWidgetList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "With Icon and Label", description: "", widget: MWBottomNavigationScreen1()));
  list.add(AppModel(title: "With Custom Image", description: "", widget: MWBottomNavigationScreen2()));
  list.add(AppModel(title: "With Shifting Label", description: "", widget: MWBottomNavigationScreen3()));

  return list;
}

List<AppModel> getSliverAppBarWidgetList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Sliver AppBar with ListView", description: "", widget: MWSliverAppBarScreen1()));
  list.add(AppModel(title: "Parallax Sliver AppBar", description: "", widget: MWSliverAppBarScreen2()));

  return list;
}

List<AppModel> getTabBarWidgetList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Simple Tab Bar", description: "", widget: MWTabBarScreen1(), isContainsScaffold: true));
  list.add(AppModel(title: "Title with icon tab", description: "", widget: MWTabBarScreen2(), isContainsScaffold: true));
  list.add(AppModel(title: "Icon tab", description: "", widget: MWTabBarScreen3(), isContainsScaffold: true));
  list.add(AppModel(title: "Scrollable Tab", description: "", widget: MWTabBarScreen4(), isContainsScaffold: true));

  return list;
}

List<AppModel> getButtonWidgetList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Drop Down Button", description: "", widget: MWDropDownButtonScreen()));
  list.add(AppModel(title: "Floating Action Button", description: "", widget: MWFloatingActionButtonScreen()));
  list.add(AppModel(title: "Popup Menu Button", description: "", widget: MWPopupMenuButtonScreen()));

  return list;
}

List<AppModel> getInputAndSelectionWidget() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Check Box", description: "", widget: MWCheckboxScreen()));
  list.add(AppModel(title: "DateTime Picker", description: "", widget: MWDatetimePickerScreen()));
  list.add(AppModel(title: "Radio", description: "", widget: MWRadioScreen()));
  list.add(AppModel(title: "Slider", description: "", widget: MWSliderScreen()));
  list.add(AppModel(title: "Switch", description: "", widget: MWSwitchScreen()));
  list.add(AppModel(title: "TextFormField", description: "", widget: MWTextFormFieldScreen()));

  return list;
}

List<AppModel> getDialogAlertAndPanelWidget() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Alert Dialog", description: "", widget: MWAlertDialogScreen()));
  list.add(AppModel(title: "Bottom sheet", description: "", widget: MWBottomSheetScreen()));
  list.add(AppModel(title: "Expansion Panel", description: "", widget: MWExpansionPanelScreen()));
  list.add(AppModel(title: "Simple Dialog", description: "", widget: MWSimpleDialogScreen()));

  return list;
}

List<AppModel> getInformationDisplayWidget() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Card", description: "", widget: MWCardScreen()));
  // list.add(AppModel(title: "Chip", description: "", widget: MWChipScreen()));
  list.add(AppModel(title: "Progress Bar", description: "", widget: MWProgressBarScreen()));
  list.add(AppModel(title: "Grid View", description: "", widget: MWGridViewScreen()));
  list.add(AppModel(title: "List View", description: "", subKit: getListViewListWidget()));
  list.add(AppModel(title: "Wrap", description: "", subKit: getWrapWidget()));
  list.add(AppModel(title: "ClipRRect", description: "", widget: MWClipRRectScreen()));
  list.add(AppModel(title: "Drawer", description: "", subKit: getDrawerWidget()));
  list.add(AppModel(title: "Animated List", description: "", subKit: getAnimatedListWidget()));
  list.add(AppModel(title: "Refresh Indicator", description: "", widget: MWRefreshIndicatorScreen()));
  list.add(AppModel(title: "Category Menu", description: "", subKit: getCategoryMenuWidget()));
  list.add(AppModel(title: "Sliver TabBar", description: "", subKit: getsSliverTabBarListWidget()));
  list.add(AppModel(title: "Digital Signature", description: "", subKit: getDigitalSignatureList()));
  list.add(AppModel(title: "Banner Slider", description: "", subKit: getBannerSliderList()));
  list.add(AppModel(title: "Transform Image", description: "", widget: MWTransformScreen(), isContainsScaffold: true));

  return list;
}

List<AppModel> getListViewListWidget() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'Vertical ListView', widget: MWListViewScreen1()));
  list.add(AppModel(title: 'List Wheel ScrollView', widget: MWListViewScreen2()));
  list.add(AppModel(title: 'Horizontal ListView', widget: MWListViewScreen3()));
  list.add(AppModel(title: 'Bouncing Scroll ListView', widget: MWListViewScreen4()));
  list.add(AppModel(title: 'ReOrder Scroll ListView', widget: MWListViewScreen5()));

  return list;
}

List<AppModel> getWrapWidget() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'Wrap 1', widget: MWWrapScreen1()));
  list.add(AppModel(title: 'Wrap 2', widget: MWWrapScreen2()));
  list.add(AppModel(title: 'Wrap 3', widget: MWWrapScreen3()));

  return list;
}

List<AppModel> getAnimatedListWidget() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'List 1', widget: MWAnimatedListScreen1()));
  list.add(AppModel(title: 'List 2', widget: MWAnimatedListScreen2()));

  return list;
}

List<AppModel> getBannerSliderList() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'Banner Slider 1 ', widget: MWBannerSliderScreen1()));
  list.add(AppModel(title: 'Banner Slider 2', widget: MWBannerSliderScreen2()));

  return list;
}

List<AppModel> getDigitalSignatureList() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'Simple Digital Signature', widget: MWDigitalSignatureListScreen1()));
  list.add(AppModel(title: 'Color Digital Signature', widget: MWDigitalSignatureListScreen2()));

  return list;
}

List<AppModel> getCategoryMenuWidget() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'Category Menu 1', widget: MWCategoryMenuListScreen1()));
  list.add(AppModel(title: 'Category Menu 2', widget: MWCategoryMenuListScreen2()));

  return list;
}

List<AppModel> getsSliverTabBarListWidget() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'Sliver TabBar 1', widget: MWSliverTabBarScreen1()));
  list.add(AppModel(title: 'Sliver TabBar 2', widget: MWSliverTabBarScreen2()));

  return list;
}

List<AppModel> getDrawerWidget() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'Drawer 1', widget: MWDrawerScreen1(), isContainsScaffold: true));
  list.add(AppModel(title: 'Drawer 2', widget: MWDrawerScreen2(), isContainsScaffold: true, themeType: ThemeTypeComingSoon));
  list.add(AppModel(title: 'Drawer 3', widget: MWDrawerScreen3(), isContainsScaffold: true, themeType: ThemeTypeComingSoon));

  return list;
}

List<AppModel> getCupertinoWidgetList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Action Sheet", description: "", widget: CWActionSheetScreen()));
  list.add(AppModel(title: "Activity Indicator", description: "", widget: CWActivityIndicatorScreen()));
  list.add(AppModel(title: "Alert Dialog", description: "", widget: CWAlertDialogScreen()));
  list.add(AppModel(title: "Button", description: "", widget: CWButtonScreen()));
  list.add(AppModel(title: "Context Menu", description: "", widget: CWContextMenuScreen()));
  list.add(AppModel(title: "Dialog", description: "", widget: CWDialogScreen()));
  list.add(AppModel(title: "Navigation Bar", description: "", widget: CWNavigationBarScreen()));
  list.add(AppModel(title: "Picker", description: "", widget: CWPickerScreen()));
  list.add(AppModel(title: "Segment Control", description: "", widget: CWSegmentedControlScreen()));
  list.add(AppModel(title: "Sliding Segment Control", description: "", widget: CWSlidingSegmentedControlScreen()));
  list.add(AppModel(title: "Slider", description: "", widget: CWSliderScreen()));
  list.add(AppModel(title: "Switch", description: "", widget: CWSwitchScreen()));
  list.add(AppModel(title: "TabBar", description: "", subKit: getCupertinoTabBarList()));
  list.add(AppModel(title: "TextField", description: "", widget: CWTextFieldScreen()));

  return list;
}

List<AppModel> getCupertinoTabBarList() {
  List<AppModel> list = [];
  list.add(AppModel(title: 'TabBar with Icon', widget: CWTabBarScreen1()));
  list.add(AppModel(title: 'TabBar with Label', widget: CWTabBarScreen2()));
  list.add(AppModel(title: 'TabBar with Custom Widget', widget: CWTabBarScreen3()));
  return list;
}

List<AppModel> getPaymentGateWayList() {
  List<AppModel> list = [];

  list.add(AppModel(title: "Razor Pay", description: "", widget: RazorPaymentGateWayScreen()));
  list.add(AppModel(title: "Stripe", description: "", widget: StripePaymentScreen()));

  return list;
}
