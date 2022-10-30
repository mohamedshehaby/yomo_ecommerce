import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:yomo_ecommerce/presentation/blocs/products/products_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/assets_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/constants_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';
import 'package:yomo_ecommerce/presentation/widgets/error/error_screen.dart';
import 'package:yomo_ecommerce/presentation/widgets/product_card.dart';

class ProductsView extends StatelessWidget {
  final String categoryName;

  const ProductsView({super.key, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: Text(categoryName),
      ),
      body: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          if (state is ProductsFailureState) {
            return ErrorScreen(
              failure: state.failure,
              tryAgainFn: () => loadProductsAgain(context),
            );
          } else if (state is ProductsSuccessState) {
            return RefreshIndicator(
              onRefresh: () => loadProductsAgain(context),
              child: GridView.builder(
                itemCount: state.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: AppConstants.crossAxisCount,
                  mainAxisExtent: AppSize.s300,
                ),
                itemBuilder: (context, index) {
                  return ProductCard(product: state.products[index]);
                },
              ),
            );
          }
          return Center(
            child: Lottie.asset(JsonAssets.loading),
          );
        },
      ),
    );
  }

  loadProductsAgain(BuildContext context) {
    context.read<ProductsBloc>().add(ProductStarted(categoryName: categoryName));
  }
}
