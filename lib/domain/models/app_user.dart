import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String id;
  final String name;
  final String email;
  final String? address;
  final String? phone;
  final String? imageUrl;

  const AppUser({
    required this.id,
    required this.name,
    required this.email,
    this.address,
    this.phone,
    this.imageUrl,
  });

  @override
  List<Object?> get props => [id, name, email, address, phone, imageUrl];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'address': address ?? '',
      'phone': phone ?? '',
      'imageUrl': imageUrl ?? '',
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      phone: map['phone'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }
}
