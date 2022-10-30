import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () =>
          Navigator.of(context).pushNamedAndRemoveUntil(Routes.mainRoute, (_) => false),
      child: const Text(AppStrings.skip),
    );
  }
}
