import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/domain/models/category.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';

class CategoriesSlider extends StatelessWidget {
  const CategoriesSlider({super.key, required this.categories});
  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: categories.length,
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: .8,
        autoPlay: true,
        enlargeCenterPage: true,
        enlargeStrategy: CenterPageEnlargeStrategy.height,
      ),
      itemBuilder: (BuildContext context, int index, int realIndex) {
        return _buildSliderSlide(context, categories[index]);
      },
    );
  }

  GestureDetector _buildSliderSlide(BuildContext context, Category cat) {
    return GestureDetector(
      onTap: () => _goToProductsView(context, cat.name),
      child: Container(
        margin: const EdgeInsets.all(AppMargin.m5),
        child: ClipRRect(
          borderRadius: const BorderRadius.all(Radius.circular(AppSize.s5)),
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(cat.imageUrl),
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                left: 0.0,
                right: 0.0,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: AppPadding.p10, horizontal: AppPadding.p20,),
                  child: Text(
                    cat.name,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _goToProductsView(BuildContext context, String categoryName) {
    Navigator.of(context).pushNamed(Routes.productsRoute, arguments: categoryName);
  }
}
