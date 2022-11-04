import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';
import 'package:yomo_ecommerce/presentation/widgets/add_or_modify_cart.dart';

part 'widgets/bottom_navbar.dart';
part 'widgets/product_description.dart';
part 'widgets/product_image.dart';
part 'widgets/product_info.dart';

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
              ProductImage(productImage: product.imageUrl),
              ProductInfo(product: product),
              ProductDescription(productDescription: product.description),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavbar(product: product),
    );
  }
}
