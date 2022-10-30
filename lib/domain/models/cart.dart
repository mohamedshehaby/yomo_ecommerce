import 'package:equatable/equatable.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';

class CartItem extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final int quantity;

  const CartItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.quantity,
  });

  @override
  List<Object> get props => [
        id,
        name,
        imageUrl,
        price,
        category,
        quantity,
      ];

  factory CartItem.fromProduct(Product product) {
    return CartItem(
      id: product.id,
      name: product.name,
      imageUrl: product.imageUrl,
      category: product.category,
      price: product.price,
      quantity: 1,
    );
  }
}

class Cart extends Equatable {
  final List<CartItem> items;

  const Cart({
    required this.items,
  });

  double get subTotal => items.fold<double>(
        0,
        (previousValue, element) => previousValue + (element.price * element.quantity),
      );

  double get deliverFee => (subTotal >= 30) ? 0 : 10;

  @override
  List<Object?> get props => [items];
}
