part of '../product_details_view.dart';

class ProductImage extends StatelessWidget {
  final String productImage;
  const ProductImage({super.key, required this.productImage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / AppSize.s2,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(productImage)),
      ),
    );
  }
}
