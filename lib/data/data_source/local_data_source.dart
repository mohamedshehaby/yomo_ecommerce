import 'package:yomo_ecommerce/app/app_preferences.dart';
import 'package:yomo_ecommerce/domain/models/app_user.dart';

abstract class LocalDataSource {
  /// [saveUser] to local storage
  Future<void> saveUser(AppUser user);

  /// [getUser] from local storage
  Future<AppUser?> getUser();

  /// [removeUser] from local storage
  Future<void> removeUser();
}

class LocalDataSourceImpl implements LocalDataSource {
  final AppPreferences appPrefs;

  const LocalDataSourceImpl({
    required this.appPrefs,
  });

  @override
  Future<AppUser?> getUser() {
    return appPrefs.getUser();
  }

  @override
  Future<void> saveUser(AppUser user) => appPrefs.saveUser(user);

  @override
  Future<void> removeUser() => appPrefs.removeUser();
}
