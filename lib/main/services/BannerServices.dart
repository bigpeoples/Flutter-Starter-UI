import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mighty_ui_kit/main.dart';
import 'package:nb_utils/nb_utils.dart';

Future<RemoteConfig> setUpRemoteConfig() async {
  if (isMobile) {
    final RemoteConfig remoteConfigInstance = RemoteConfig.instance;

    remoteConfigInstance.setConfigSettings(RemoteConfigSettings(fetchTimeout: Duration.zero, minimumFetchInterval: Duration.zero));
    await remoteConfigInstance.fetch();
    await remoteConfigInstance.fetchAndActivate();

    remoteConfig = remoteConfigInstance;
    return remoteConfigInstance;
  } else {
    throw '';
  }
}
