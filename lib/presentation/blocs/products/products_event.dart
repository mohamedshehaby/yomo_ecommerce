part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();
}

@immutable
class ProductStarted extends ProductsEvent {
  final int? productNum;
  final String categoryName;

  @override
  List<Object> get props => [categoryName];

  const ProductStarted({
    this.productNum,
    required this.categoryName,
  });
}
