import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final String imageUrl;

  const Category({
    required this.name,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
    };
  }

  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  @override
  List<Object> get props => [name, imageUrl];
  //
  // static List<Category> categories = const [
  //   Category(name: 'Hot Drinks', imageUrl: ''),
  //   Category(name: 'Cold Drinks', imageUrl: ''),
  //   Category(name: 'Dairy', imageUrl: ''),
  // ];
}
