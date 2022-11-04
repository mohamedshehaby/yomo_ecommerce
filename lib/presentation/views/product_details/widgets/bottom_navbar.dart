part of '../product_details_view.dart';

class BottomNavbar extends StatelessWidget {
  final Product product;
  const BottomNavbar({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
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
    );
  }
}
