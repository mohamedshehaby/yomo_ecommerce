import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/app/dependency_injection.dart';
import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/cart/cart_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/category/category_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/views/cart/cart_view.dart';
import 'package:yomo_ecommerce/presentation/views/home/home_view.dart';
import 'package:yomo_ecommerce/presentation/views/orders/orders_view.dart';
import 'package:yomo_ecommerce/presentation/views/profile/profile_view.dart';
import 'package:yomo_ecommerce/presentation/widgets/custom_app_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            BlocProvider(
              create: (context) => CategoryBloc(
                repository: instance(),
              )..add(CategoryStarted()),
              child: const HomeView(),
            ),
            const CartView(),
            const OrdersView(),
            const ProfileView()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            inactiveColor: ColorManager.grey1,
            activeColor: ColorManager.primary,
            title: const Text(AppStrings.home),
            icon: const Icon(
              Icons.home,
            ),
          ),
          BottomNavyBarItem(
            inactiveColor: ColorManager.grey1,
            activeColor: ColorManager.primary,
            title: const Text(AppStrings.cart),
            icon: const Icon(Icons.shopping_bag),
          ),
          BottomNavyBarItem(
            inactiveColor: ColorManager.grey1,
            activeColor: ColorManager.primary,
            title: const Text(AppStrings.orders),
            icon: const Icon(Icons.article_outlined),
          ),
          BottomNavyBarItem(
            inactiveColor: ColorManager.grey1,
            activeColor: ColorManager.primary,
            title: const Text(AppStrings.profile),
            icon: const Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    context.read<CartBloc>().add(CartStarted(userId: context.read<AuthBloc>().state.user?.id));
    _pageController = PageController();
  }
}
