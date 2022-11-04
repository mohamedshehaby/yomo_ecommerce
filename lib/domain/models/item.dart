import 'package:equatable/equatable.dart';

abstract class Item extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final String category;
  final int quantity;

  const Item({
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
}
