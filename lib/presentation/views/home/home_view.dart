import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yomo_ecommerce/app/dependency_injection.dart';
import 'package:yomo_ecommerce/domain/models/category.dart';
import 'package:yomo_ecommerce/presentation/blocs/category/category_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/products/products_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/views/home/widgets/categories_slider.dart';
import 'package:yomo_ecommerce/presentation/widgets/category_section.dart';
import 'package:yomo_ecommerce/presentation/widgets/error/error_screen.dart';
import 'package:yomo_ecommerce/presentation/widgets/loading/custom_card_loading.dart';

part 'widgets/all_categories_section.dart';
part 'widgets/full_category_section.dart';

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
          final categories = state.categories;
          return SingleChildScrollView(
            child: Column(
              children: [
                AllCategoriesSection(categories: categories),
                FullCategorySection(categories: categories),
              ],
            ),
          );
        }
        return const CustomCardLoading();
      },
    );
  }

  loadCategoriesAgain(BuildContext context) {
    context.read<CategoryBloc>().add(CategoryStarted());
  }
}
