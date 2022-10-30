import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/resources/assets_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/color_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late Timer _timer;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primary,
      body: Center(child: Image.asset(ImageAssets.splashLogo)),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  void initState() {
    super.initState();
    _timer = Timer(
      const Duration(seconds: 1),
      () => Navigator.of(context).pushNamedAndRemoveUntil(Routes.loginRoute, (_) => false),
    );
  }
}
