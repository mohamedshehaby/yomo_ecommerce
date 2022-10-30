part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  @override
  List<Object> get props => [];

  const CartState();
}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final Cart cart;

  const CartSuccessState({
    required this.cart,
  });

  @override
  List<Object> get props => [cart];
}

class CartFailureState extends CartState {
  final Failure failure;

  const CartFailureState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}

extension CartItems on CartState {
  Cart? get cart {
    final cs = this;
    if (cs is CartSuccessState) {
      return cs.cart;
    } else {
      return null;
    }
  }
}
