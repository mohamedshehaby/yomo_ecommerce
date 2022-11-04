part of '../home_view.dart';

class AllCategoriesSection extends StatelessWidget {
  const AllCategoriesSection({super.key, required this.categories});
  final List<Category> categories;
  @override
  Widget build(BuildContext context) {
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
          CategoriesSlider(
            categories: categories,
          )
        ],
      ),
    );
  }
}
