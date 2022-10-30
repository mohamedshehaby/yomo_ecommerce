import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:yomo_ecommerce/app/app_preferences.dart';
import 'package:yomo_ecommerce/data/data_source/local_data_source.dart';
import 'package:yomo_ecommerce/data/data_source/remote_data_source.dart';
import 'package:yomo_ecommerce/data/network/network_info.dart';
import 'package:yomo_ecommerce/data/repository_impl/repository_impl.dart';
import 'package:yomo_ecommerce/domain/repository/repository.dart';

final instance = GetIt.I;

// App Module where we put all generic dependencies
Future<void> initAppModule() async {
// Shared Preferences instance
  final sharedPreferences = await SharedPreferences.getInstance();
  instance.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

// App Preferences instance
  instance.registerLazySingleton<AppPreferences>(
    () => AppPreferencesImpl(prefs: instance<SharedPreferences>()),
  );

// Remote Data Source instance
  instance.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl());

// Local Data Source instance
  instance.registerLazySingleton<LocalDataSource>(
    () => LocalDataSourceImpl(appPrefs: instance<AppPreferences>()),
  );

// Network Info instance
// No need for adding InternetConnectionChecker cause it is singleton by default
  instance.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(InternetConnectionChecker()));

  // Repository Instance
  instance.registerLazySingleton<Repository>(
    () => RepositoryImpl(
      remoteDataSource: instance(),
      localDataSource: instance(),
      networkInfo: instance(),
    ),
  );
}
