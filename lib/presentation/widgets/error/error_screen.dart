import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';

class ErrorScreen extends StatelessWidget {
  final Failure failure;
  final Function tryAgainFn;
  const ErrorScreen({super.key, required this.failure, required this.tryAgainFn});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 2,
          child: Lottie.asset(JsonAssets.error),
        ),
        Text(
          failure.title,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red),
        ),
        Text(
          failure.message,
          style: Theme.of(context).textTheme.titleSmall?.copyWith(color: ColorManager.lightPrimary),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: AppSize.s50,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36),
          child:
              ElevatedButton(onPressed: () => tryAgainFn(), child: const Text(AppStrings.tryAgain)),
        )
      ],
    );
  }
}
