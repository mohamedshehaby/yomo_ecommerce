part of '../product_details_view.dart';

class ProductInfo extends StatelessWidget {
  final Product product;
  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Text(
            product.category,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ),
        Text(
          product.name,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              Text(
                AppStrings.price,
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '\$${product.price}',
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Row(
            children: [
              Text(
                'Items Left: ',
                style: Theme.of(context).textTheme.labelSmall,
              ),
              Text(
                '${product.quantity}',
                style: Theme.of(context).textTheme.labelLarge,
              )
            ],
          ),
        ),
      ],
    );
  }
}
