import 'package:flutter/material.dart';
import 'package:mighty_ui_kit/apps/smartHome/model/HSModel.dart';
import 'package:mighty_ui_kit/main/utils/AppColors.dart';
import 'package:mighty_ui_kit/main/utils/AppConstants.dart';
import 'package:mobx/mobx.dart';
import 'package:nb_utils/nb_utils.dart';

part 'AppStore.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isDarkModeOn = false;

  @observable
  bool isLoggedIn = false;

  @observable
  Color cardColor = Colors.white;

  @observable
  List<HSDeviceModel?> favDeviceList = ObservableList<HSDeviceModel?>();

  @observable
  List<HSUserProfileModel> hsUserProfileList = ObservableList<HSUserProfileModel>();

  @action
  void addToMyItems(HSDeviceModel? data) {
    favDeviceList.add(data);
  }

  @action
  void removeToMyItems(HSDeviceModel? data) {
    favDeviceList.remove(data);
  }

  @action
  void hsAddProfileItems(HSUserProfileModel data) {
    hsUserProfileList.add(data);
  }

  @action
  void setLoggedIn(bool val) {
    isLoggedIn = val;
  }

  @action
  Future<void> toggleDarkMode({bool? value}) async {
    isDarkModeOn = value.validate(value: !isDarkModeOn);

    if (isDarkModeOn) {
      textPrimaryColorGlobal = whiteColor;
      textSecondaryColorGlobal = Colors.white54;

      cardColor = scaffoldSecondaryDark;

      shadowColorGlobal = Colors.white12;
      setStatusBarColor(cardColor, statusBarIconBrightness: Brightness.light);

      defaultLoaderBgColorGlobal = Colors.black;
    } else {
      textPrimaryColorGlobal = textPrimaryColor;
      textSecondaryColorGlobal = textSecondaryColor;

      cardColor = Colors.white;

      shadowColorGlobal = Colors.black12;
      setStatusBarColor(Colors.white, statusBarIconBrightness: Brightness.dark);

      defaultLoaderBgColorGlobal = Colors.white;
    }

    setValue(DarkModePref, isDarkModeOn);
  }
}
