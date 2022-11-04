part of '../cart_view.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Lottie.asset(JsonAssets.emptyCart),
          Text(
            AppStrings.emptyCart,
            style:
                Theme.of(context).textTheme.titleLarge?.copyWith(color: ColorManager.darkPrimary),
          )
        ],
      ),
    );
  }
}
