import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/app/dependency_injection.dart';
import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/cart/cart_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/routes_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/theme_manager.dart';

class MyApp extends StatelessWidget {
  /// Static [_instance] to be accessed from any where
  // and Still be one instance
  static const _instance = MyApp._internal();

  // Factory to return the _instance with the name MyApp
  factory MyApp() => _instance;

  // Named Private Constructor
  const MyApp._internal();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartBloc()..add(CartStarted()),
        ),
        BlocProvider(
          create: (context) => AuthBloc(repository: instance())..add(AuthStarted()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splashRoute,
        onGenerateRoute: RoutesGenerator.getRoute,
        theme: getAppTheme(),
      ),
    );
  }
}
