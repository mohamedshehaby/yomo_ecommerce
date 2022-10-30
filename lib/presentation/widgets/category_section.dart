import 'package:card_loading/card_loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/domain/models/category.dart';
import 'package:yomo_ecommerce/presentation/blocs/products/products_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/font_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/routes_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/strings_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/styles_manager.dart';
import 'package:yomo_ecommerce/presentation/resources/values_manager.dart';
import 'package:yomo_ecommerce/presentation/widgets/product_card.dart';

class CategorySection extends StatelessWidget {
  final Category category;

  const CategorySection({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                category.name,
                style: getBoldTextStyle(color: Colors.black, fontSize: FontSize.s18),
              ),
              TextButton(
                onPressed: () => _goToProductsView(context),
                child: Text(
                  AppStrings.seeAll,
                  style: getBoldTextStyle(color: Colors.black),
                ),
              )
            ],
          ),
          SizedBox(
            height: AppSize.s280,
            child: BlocBuilder<ProductsBloc, ProductsState>(
              builder: (context, state) {
                if (state is ProductsLoadingState) {
                  return const CardLoading(
                    height: AppSize.s100,
                    borderRadius: BorderRadius.all(Radius.circular(AppSize.s10)),
                    margin: EdgeInsets.only(bottom: AppMargin.m10),
                  );
                } else if (state is ProductsSuccessState) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: state.products.length,
                    itemBuilder: (context, index) {
                      return ProductCard(product: state.products[index]);
                    },
                  );
                }
                return const Text('');
              },
            ),
          ),
        ],
      ),
    );
  }

  _goToProductsView(BuildContext context) {
    Navigator.of(context).pushNamed(Routes.productsRoute, arguments: category.name);
  }
}
