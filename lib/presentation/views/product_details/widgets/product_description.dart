part of '../product_details_view.dart';

class ProductDescription extends StatelessWidget {
  final String productDescription;

  const ProductDescription({super.key, required this.productDescription});

  @override
  Widget build(BuildContext context) {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        collapseIcon: Icons.arrow_downward,
        expandIcon: Icons.arrow_upward,
        useInkWell: false,
        iconPadding: EdgeInsets.only(right: AppPadding.p12),
      ),
      header: Text(
        AppStrings.productDescription,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      expanded: Text(
        productDescription,
        softWrap: true,
        maxLines: AppSize.s1.toInt(),
        overflow: TextOverflow.ellipsis,
      ),
      collapsed: Text(
        productDescription,
        softWrap: true,
      ),
    );
  }
}
