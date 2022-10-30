import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yomo_ecommerce/presentation/resources/assets_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: SizedBox(
        width: AppSize.s50,
        height: AppSize.s50,
        child: SvgPicture.asset(ImageAssets.logo),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, AppSize.s60);
}
