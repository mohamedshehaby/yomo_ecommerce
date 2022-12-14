import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/app/dependency_injection.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';
import 'package:yomo_ecommerce/presentation/blocs/products/products_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/checkout/checkout_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/login/login_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/signup/signup_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';
import 'package:yomo_ecommerce/presentation/views/auth/login/login_view.dart';
import 'package:yomo_ecommerce/presentation/views/auth/signup/signup_view.dart';
import 'package:yomo_ecommerce/presentation/views/checkout/checkout_view.dart';
import 'package:yomo_ecommerce/presentation/views/home/home_view.dart';
import 'package:yomo_ecommerce/presentation/views/main/main_view.dart';
import 'package:yomo_ecommerce/presentation/views/product_details/product_details_view.dart';
import 'package:yomo_ecommerce/presentation/views/products/products_view.dart';
import 'package:yomo_ecommerce/presentation/views/splash/splash_view.dart';

import '../../domain/models/user_order.dart';
import '../views/order_details/order_details.dart';

class Routes {
  static const String splashRoute = '/splash';
  static const String loginRoute = '/login';
  static const String signupRoute = '/signup';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String mainRoute = '/main';
  static const String homeRoute = '/home';
  static const String checkoutRoute = '/checkout';
  static const String productsRoute = '/products';
  static const String productDetailsRoute = '/product-details';
  static const String orderDetailsRoute = '/order-details';
}

class RoutesGenerator {
  static Route getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.homeRoute:
        return MaterialPageRoute(builder: (_) => const HomeView());
      case Routes.productsRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => ProductsBloc(repository: instance())
              ..add(
                ProductStarted(
                  categoryName: settings.arguments as String,
                ),
              ),
            child: ProductsView(categoryName: settings.arguments as String),
          ),
        );
      case Routes.productDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsView(
            product: settings.arguments as Product,
          ),
        );
      case Routes.loginRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginView(),
          ),
        );
      case Routes.signupRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => SignupBloc(),
            child: const SignupView(),
          ),
        );
      case Routes.checkoutRoute:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => CheckoutBloc(),
            child: const CheckoutView(),
          ),
        );
      case Routes.orderDetailsRoute:
        return MaterialPageRoute(
          builder: (_) {
            return OrderDetails(
              order: settings.arguments as UserOrder,
            );
          },
        );

      default:
        return _unKnownRoute();
    }
  }

  static Route _unKnownRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text(AppStrings.noRouteFound),
          ),
          body: const Center(child: Text(AppStrings.noRouteFound)),
        );
      },
    );
  }
}
