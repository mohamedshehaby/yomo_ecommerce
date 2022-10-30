import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';

class AuthLogo extends StatelessWidget {
  const AuthLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p24),
      child: SvgPicture.asset(
        ImageAssets.logo,
        width: AppSize.s100,
        height: AppSize.s100,
      ),
    );
  }
}
