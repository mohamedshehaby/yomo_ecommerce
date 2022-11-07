part of '../orders_view.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          Icons.insert_chart,
          size: AppSize.s50,
          color: ColorManager.primary.withAlpha(90),
        ),
        Text(AppStrings.noOrdersYet, style: Theme.of(context).textTheme.titleSmall),
      ],
    );
  }
}
