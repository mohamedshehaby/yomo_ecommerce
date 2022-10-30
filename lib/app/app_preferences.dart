import 'package:shared_preferences/shared_preferences.dart';
import 'package:yomo_ecommerce/domain/models/app_user.dart';

String userIdKey = 'userId';
String userEmailKey = 'userEmail';
String userNameKey = 'userName';
String userImageUrlKey = 'userImageUrl';

abstract class AppPreferences {
  /// [saveUser] to app preferences
  Future<void> saveUser(AppUser user);

  /// [getUser] from app preferences
  Future<AppUser?> getUser();

  /// [removeUser] from app preferences
  Future<void> removeUser();
}

class AppPreferencesImpl extends AppPreferences {
  final SharedPreferences prefs;

  AppPreferencesImpl({
    required this.prefs,
  });

  @override
  Future<void> saveUser(AppUser user) async {
    prefs.setString(userIdKey, user.id);
    prefs.setString(userEmailKey, user.email);
    prefs.setString(userNameKey, user.name);
    prefs.setString(userImageUrlKey, user.imageUrl ?? '');
  }

  /// [getUser] from shared preferences
  @override
  Future<AppUser?> getUser() async {
    final id = prefs.getString(userIdKey);
    final email = prefs.getString(userEmailKey);
    final name = prefs.getString(userNameKey);
    final imageUrl = prefs.getString(userImageUrlKey);
    if (id != null && email != null && name != null && imageUrl != null) {
      return AppUser(id: id, name: name, email: email, imageUrl: imageUrl);
    }
    return null;
  }

  @override
  Future<void> removeUser() async {
    prefs.remove(userIdKey);
    prefs.remove(userEmailKey);
    prefs.remove(userNameKey);
    prefs.remove(userImageUrlKey);
  }
}
