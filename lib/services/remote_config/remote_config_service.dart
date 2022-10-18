import 'package:firebase_remote_config/firebase_remote_config.dart';

import '../../configs/environment.dart';

const String _env = 'env';

RemoteConfigService rc = RemoteConfigService();

//Switch Firebase app configuration to active sendme firebase app.
class RemoteConfigService {
  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  RemoteConfigService();

  String get devEnv => _remoteConfig.getString(_env);

  Future<void> initialise() async {
    try {
      await _remoteConfig.setConfigSettings(RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 5),
          minimumFetchInterval: Environment.environment == 'staging'
              ? const Duration(seconds: 1)
              : const Duration(minutes: 1)));

      await fetchAndActivate();
    } catch (e) {
      throw Exception(e);
    }
  }

  Future fetchAndActivate() async {
    await _remoteConfig.ensureInitialized();
    final isActivated = await _remoteConfig.fetchAndActivate();

    //Sanity to make sure if runs
    if (isActivated) {
    } else {}
  }
}
