import 'package:universalexpensetracker/core/error/exceptions.dart';
import 'package:universalexpensetracker/core/helpers/app_logger.dart';
import 'package:universalexpensetracker/core/storage/hive_local_storage.dart';

abstract class OnboardingLocalDataSource {
  Future<bool> getAppPref();
  Future<void> createAppPref();
}

class OnboardingLocalDataSourceImpl implements OnboardingLocalDataSource {
  final HiveLocalStorage hiveLocalStorage;

  OnboardingLocalDataSourceImpl(this.hiveLocalStorage);
  @override
  Future<void> createAppPref() async {
    try {
      await hiveLocalStorage.add({"pref": true});
    } catch (e, st) {
      AppLogger.error("Failed to create app pref", e, st);
      throw CacheException();
    }
  }

  @override
  Future<bool> getAppPref() async {
    try {
      final rawList = await hiveLocalStorage.getAll();
      if (rawList.isEmpty) {
        return false;
      }
      return rawList.first["pref"] as bool? ?? false;
    } catch (e, st) {
      AppLogger.error("Failed to get app pref", e, st);
      throw CacheException();
    }
  }
}
