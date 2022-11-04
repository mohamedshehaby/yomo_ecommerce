// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object?> get props => [];
}

class CartProductAdded extends CartEvent {
  final CartItem cartItem;

  const CartProductAdded({
    required this.cartItem,
  });

  @override
  List<Object> get props => [cartItem];
}

class CartProductRemoved extends CartEvent {
  final CartItem cartItem;

  const CartProductRemoved({
    required this.cartItem,
  });

  @override
  List<Object> get props => [cartItem];
}

class CartStarted extends CartEvent {
  final String? userId;

  const CartStarted({
    this.userId,
  });

  @override
  List<Object?> get props => [userId];
}

class CartUploaded extends CartEvent {
  final String userId;

  const CartUploaded({
    required this.userId,
  });

  @override
  List<Object> get props => [userId];
}
