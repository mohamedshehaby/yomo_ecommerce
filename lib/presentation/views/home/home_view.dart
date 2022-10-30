import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yomo_ecommerce/app/dependency_injection.dart';
import 'package:yomo_ecommerce/presentation/blocs/category/category_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/products/products_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/widgets/category_section.dart';
import 'package:yomo_ecommerce/presentation/widgets/error/error_screen.dart';
import 'package:yomo_ecommerce/presentation/widgets/loading/custom_card_loading.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryFailureState) {
          return ErrorScreen(
            failure: state.failure,
            tryAgainFn: () => loadCategoriesAgain(context),
          );
        } else if (state is CategorySuccessState) {
          return SingleChildScrollView(
            child: Column(
              children: [
                _buildAllCategoriesSection(state),
                _buildFullCategorySection(state),
              ],
            ),
          );
        }
        return const CustomCardLoading();
      },
    );
  }

  Padding _buildAllCategoriesSection(CategorySuccessState state) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p8, horizontal: AppPadding.p4),
            child: Text(
              AppStrings.whatDoYouWantToBuy,
              style: getBoldTextStyle(color: Colors.black, fontSize: FontSize.s18),
              textAlign: TextAlign.start,
            ),
          ),
          SizedBox(
            height: AppSize.s100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => _goToProductsView(context, state.categories[index].name),
                  child: Card(
                    child: Container(
                      width: AppSize.s100,
                      padding: const EdgeInsets.all(AppPadding.p8),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            child: SvgPicture.network(
                              state.categories[index].imageUrl,
                              width: AppSize.s50,
                              height: AppSize.s50,
                              theme: const SvgTheme(currentColor: Colors.black),
                            ),
                          ),
                          Text(
                            state.categories[index].name,
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Wrap _buildFullCategorySection(CategorySuccessState state) {
    return Wrap(
      children: state.categories.map((category) {
        return BlocProvider(
          create: (context) => ProductsBloc(repository: instance())
            ..add(
              ProductStarted(
                productNum: AppConstants.sectionProductsNum,
                categoryName: category.name,
              ),
            ),
          child: CategorySection(
            category: category,
          ),
        );
      }).toList(),
    );
  }

  _goToProductsView(BuildContext context, String categoryName) {
    Navigator.of(context).pushNamed(Routes.productsRoute, arguments: categoryName);
  }

  loadCategoriesAgain(BuildContext context) {
    context.read<CategoryBloc>().add(CategoryStarted());
  }
}
