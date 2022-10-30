part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object> get props => [];

  const ProductsState();
}

class ProductsLoadingState extends ProductsState {}

class ProductsSuccessState extends ProductsState {
  final List<Product> products;

  @override
  List<Object> get props => [];

  const ProductsSuccessState({
    required this.products,
  });
}

class ProductsFailureState extends ProductsState {
  final Failure failure;

  const ProductsFailureState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
