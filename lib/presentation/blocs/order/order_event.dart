part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();
}

class OrderAdded extends OrderEvent {
  final UserOrder order;
  final String userId;

  const OrderAdded({required this.order, required this.userId});

  @override
  List<Object> get props => [order];
}

class OrderGetUserOrder extends OrderEvent {
  final String userId;

  @override
  List<Object> get props => [userId];

  const OrderGetUserOrder({
    required this.userId,
  });
}
