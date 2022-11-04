part of '../home_view.dart';

class FullCategorySection extends StatelessWidget {
  const FullCategorySection({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: categories.map((category) {
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
}
