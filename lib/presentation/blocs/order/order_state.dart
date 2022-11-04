part of 'order_bloc.dart';

abstract class OrderState extends Equatable {
  const OrderState();
}

class OrderInitial extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderLoadingState extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderUploadedState extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderSuccessState extends OrderState {
  final List<UserOrder> orders;

  const OrderSuccessState({
    required this.orders,
  });

  @override
  List<Object?> get props => [orders];
}

class OrderFailureState extends OrderState {
  final Failure failure;

  const OrderFailureState({
    required this.failure,
  });

  @override
  List<Object> get props => [failure];
}
