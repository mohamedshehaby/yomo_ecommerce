import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';

import 'package:yomo_ecommerce/presentation/widgets/add_or_modify_cart.dart';

class ProductDetailsView extends StatelessWidget {
  final Product product;
  const ProductDetailsView({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: AppSize.s0,
        backgroundColor: Colors.white,
        elevation: AppSize.s0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildProductImage(context),
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
              _buildProductDescription(context),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p4, vertical: AppPadding.p2),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: AppSize.s150,
                height: AppSize.s50,
                child: AddOrModifyCart(
                  product: product,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.favorite_border,
                  color: Colors.pink,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductDescription(BuildContext context) {
    return ExpandablePanel(
      theme: const ExpandableThemeData(
        useInkWell: false,
        iconPadding: EdgeInsets.only(right: AppPadding.p12),
      ),
      header: Text(
        AppStrings.productDescription,
        style: Theme.of(context).textTheme.titleMedium,
      ),
      collapsed: Text(
        product.description,
        softWrap: true,
        maxLines: AppSize.s1.toInt(),
        overflow: TextOverflow.ellipsis,
      ),
      expanded: Text(
        product.description,
        softWrap: true,
      ),
    );
  }

  Container _buildProductImage(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: AppPadding.p4),
      width: double.infinity,
      height: MediaQuery.of(context).size.height / AppSize.s2,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(product.imageUrl)),
      ),
    );
  }
}
