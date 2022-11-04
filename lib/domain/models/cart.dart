import 'package:equatable/equatable.dart';
import 'package:yomo_ecommerce/domain/models/item.dart';
import 'package:yomo_ecommerce/domain/models/product.dart';

class CartItem extends Item {
  final int maxQuantity;
  const CartItem({
    required this.maxQuantity,
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.category,
    required super.price,
    required super.quantity,
  });

  factory CartItem.fromProduct(Product product) {
    return CartItem(
      maxQuantity: product.quantity,
      id: product.id,
      name: product.name,
      imageUrl: product.imageUrl,
      category: product.category,
      price: product.price,
      quantity: 1,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'category': category,
      'quantity': quantity,
      'maxQuantity': maxQuantity
    };
  }

  factory CartItem.fromMap(Map<String, dynamic> map) {
    return CartItem(
      maxQuantity: map['maxQuantity'] as int,
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      quantity: map['quantity'] as int,
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
