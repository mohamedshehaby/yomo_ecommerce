import 'package:uuid/uuid.dart';
import 'package:yomo_ecommerce/domain/models/cart.dart';
import 'package:yomo_ecommerce/domain/models/item.dart';
import 'package:yomo_ecommerce/domain/models/models.dart';

class OrderItem extends Item {
  const OrderItem({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.category,
    required super.price,
    required super.quantity,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'category': category,
      'quantity': quantity,
    };
  }

  factory OrderItem.fromMap(Map<String, dynamic> map) {
    return OrderItem(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as double,
      category: map['category'] as String,
      quantity: map['quantity'] as int,
    );
  }
  factory OrderItem.fromCartItem(CartItem item) {
    return OrderItem(
      id: item.id,
      name: item.name,
      imageUrl: item.imageUrl,
      price: item.price,
      category: item.category,
      quantity: item.quantity,
    );
  }
}

class UserOrder {
  final String id;
  final DateTime createdAt;
  final List<OrderItem> items;
  final String paymentOption;
  final String status;
  final double subTotal;
  final double total;
  final double deliveryFee;
  final String address;
  final String city;
  final String governorate;
  final String phone;
  final String zipcode;

  const UserOrder({
    required this.id,
    required this.createdAt,
    required this.items,
    required this.paymentOption,
    required this.status,
    required this.subTotal,
    required this.total,
    required this.deliveryFee,
    required this.address,
    required this.city,
    required this.governorate,
    required this.phone,
    required this.zipcode,
  });

  UserOrder.init({
    required this.items,
    required this.paymentOption,
    required this.subTotal,
    required this.total,
    required this.deliveryFee,
    required this.zipcode,
    required this.address,
    required this.phone,
    required this.governorate,
    required this.city,
  })  : id = const Uuid().v4(),
        createdAt = DateTime.now(),
        status = 'pending';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'createdAt': createdAt,
      'items': items.map((item) => item.toMap()).toList(),
      'paymentOption': paymentOption,
      'status': status,
      'subTotal': subTotal,
      'total': total,
      'deliveryFee': deliveryFee,
      'address': address,
      'city': city,
      'governorate': governorate,
      'phone': phone,
      'zipcode': zipcode,
    };
  }

  factory UserOrder.fromMap(Map<String, dynamic> map) {
    return UserOrder(
      id: map['id'] as String,
      createdAt: map['createdAt'].toDate() as DateTime,
      items: (map['items'] as List<dynamic>).map((item) => OrderItem.fromMap(item)).toList(),
      paymentOption: map['paymentOption'] as String,
      status: map['status'] as String,
      subTotal: map['subTotal'] as double,
      total: map['total'] as double,
      deliveryFee: map['deliveryFee'] as double,
      address: map['address'] as String,
      city: map['city'] as String,
      governorate: map['governorate'] as String,
      phone: map['phone'] as String,
      zipcode: map['zipcode'] as String,
    );
  }
}
