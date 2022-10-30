import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class Product extends Equatable {
  //
  final String id;
  final String name;
  final String imageUrl;
  final double price;
  final int quantity;
  final DateTime createdAt;
  final String category;

  final String description;

  const Product({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.description,
    required this.price,
    required this.quantity,
    required this.id,
    required this.createdAt,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] as String,
      name: map['name'] as String,
      imageUrl: map['imageUrl'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      createdAt: map['createdAt'].toDate() as DateTime,
      category: map['category'] as String,
      description: map['description'] as String,
    );
  }

  Product.init({
    required this.name,
    required this.imageUrl,
    required this.category,
    required this.price,
    required this.description,
    required this.quantity,
  })  : id = const Uuid().v4(),
        createdAt = DateTime.now();

  @override
  List<Object> get props => [id, name, imageUrl, price, quantity, createdAt, category, description];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'price': price,
      'quantity': quantity,
      'createdAt': createdAt,
      'category': category,
      'description': description,
    };
  }

  // static List<Product> products = [
//   Product.init(
//     name: 'Cadbury Hot Chocolate 3 in 1, 30g x 10',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FHot%20Drinks%2Fcabury_hot.jpg?alt=media&token=18a32fae-5316-4a68-b068-71343345db9d',
//     category: 'Hot Drinks',
//     price: 50,
//     quantity: 6,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
//   ),
//   Product.init(
//     name: 'Corona Drinking Chocolate Powder - 230 gm',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FHot%20Drinks%2Fcorona_hot.jpg?alt=media&token=e772d689-d5c4-4269-b9de-bc71ef6019b9',
//     category: 'Hot Drinks',
//     price: 22,
//     quantity: 16,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//   ),
//   Product.init(
//     name: 'Galaxy Instant hot chocolate , 200 gm',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FHot%20Drinks%2Fgalaxy_hot.jpg?alt=media&token=6ff99786-7b1b-447f-84a0-df408ffa7ca1',
//     category: 'Hot Drinks',
//     price: 150,
//     quantity: 22,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//   ),
//   Product.init(
//     name: 'Abu Auf Hot Chocolate, 250 gm',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FHot%20Drinks%2Fabu_auf_hot.jpg?alt=media&token=64685d6e-3f2d-4313-8742-ef32a9a35bd0',
//     category: 'Hot Drinks',
//     price: 60,
//     quantity: 5,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//   ),
//   Product.init(
//     name: 'Ahmad Tea Strawberry Sensation Black Tea, 20 Teabags',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FHot%20Drinks%2Fahmed_tea_hot.jpg?alt=media&token=0e870920-ad1b-46cb-97de-410f63ef5585',
//     category: 'Hot Drinks',
//     price: 35,
//     quantity: 8,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//   ),
//   Product.init(
//     name: 'Lamar Full Fat Milk - 1 Liter',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FDairy%2Flamar_milk.jpg?alt=media&token=8a207304-4df5-44bd-8dda-4d439335aeb4',
//     category: 'Dairy',
//     price: 18,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     quantity: 19,
//   ),
//   Product.init(
//     name: 'Bekhero Milk Full Cream',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FDairy%2Fbekhero_milk.jpg?alt=media&token=7ba65f87-efe2-40ce-90ed-edeaa1d15afb',
//     category: 'Dairy',
//     price: 12,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     quantity: 34,
//   ),
//   Product.init(
//     name: 'Almarai Plain Full Fat Milk',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FDairy%2Falmarai_milk.jpg?alt=media&token=a4cc4400-3eaa-41b1-9318-dea2b3df0846',
//     category: 'Dairy',
//     price: 12,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     quantity: 34,
//   ),
//   Product.init(
//     name: 'Almarai Plain Yoghurt',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FDairy%2Falmarai_yougurt.jpg?alt=media&token=93cb7f8e-ba4b-479d-8048-f98be3a11236',
//     category: 'Dairy',
//     price: 3,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     quantity: 112,
//   ),
//   Product.init(
//     name: 'Almarai Treats Strawberry Yoghurt',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FDairy%2Falmarai_yougurt_fruits.jpg?alt=media&token=255e027d-d950-4a7a-9dcc-b79b785cd961',
//     category: 'Dairy',
//     price: 3,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
//     quantity: 102,
//   ),
//   Product.init(
//     name: 'Fayrouz Malt Beverage with Mango- Peach Flavor - 330 ml',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FCold%20Drinks%2Ffayrouz_cold.jpg?alt=media&token=32a3da14-8943-4c69-a6d0-16c557af5fa7',
//     category: 'Cold Drinks',
//     price: 7,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
//     quantity: 18,
//   ),
//   Product.init(
//     name: 'MOUSSY MALT POMEGRANATE DRINK 330ML',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FCold%20Drinks%2Fmoussy_cold.jpg?alt=media&token=5c26092d-4bc8-405d-8eec-623511430067',
//     category: 'Cold Drinks',
//     price: 55,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
//     quantity: 22,
//   ),
//   Product.init(
//     name: 'AGA Mango Pieces Drink,240 ml',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FCold%20Drinks%2Faga_mango_cold.jpg?alt=media&token=45f1bdb3-c649-430f-93ff-aa77b7ba5fa1',
//     category: 'Cold Drinks',
//     price: 9,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
//     quantity: 44,
//   ),
//   Product.init(
//     name: 'Red Bull Energy Drink, Sugar Free, 250 ml',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FCold%20Drinks%2Fred_bull_cold.jpg?alt=media&token=d2ef18bd-fd13-4ad5-a96a-e10c8f6aad54',
//     category: 'Cold Drinks',
//     price: 30,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
//     quantity: 13,
//   ),
//   Product.init(
//     name: 'Birell Non-Alcoholic drink malt beverage 330ml',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FCold%20Drinks%2Fred_bull_cold.jpg?alt=media&token=d2ef18bd-fd13-4ad5-a96a-e10c8f6aad54',
//     category: 'Cold Drinks',
//     price: 8,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
//     quantity: 16,
//   ),
//   Product.init(
//     name: 'Mirinda plus Citrus Carbonated drink, 400ml',
//     imageUrl:
//         'https://firebasestorage.googleapis.com/v0/b/yomo-ecommerce.appspot.com/o/products%2FCold%20Drinks%2Fmirinda_cold.jpg?alt=media&token=e02e402f-94bd-4da5-a409-7416f55069cf',
//     category: 'Cold Drinks',
//     price: 12,
//     description:
//         'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. ',
//     quantity: 16,
//   ),
// ];
}
