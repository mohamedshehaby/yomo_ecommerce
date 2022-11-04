import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/domain/models/user_order.dart';
import 'package:yomo_ecommerce/domain/repository/repository.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final Repository repository;
  OrderBloc(this.repository) : super(OrderInitial()) {
    on<OrderAdded>(_onAdded);
    on<OrderGetUserOrder>(_onGetUserOrder);
  }

  _onAdded(OrderAdded event, Emitter<OrderState> emit) async {
    emit(OrderLoadingState());
    (await repository.uploadOrder(event.order, event.userId)).fold((failure) {
      emit(OrderFailureState(failure: failure));
    }, (_) {
      emit(OrderUploadedState());
    });
  }

  _onGetUserOrder(OrderGetUserOrder event, Emitter<OrderState> emit) async {
    emit(OrderLoadingState());
    (await repository.getUserOrder(event.userId)).fold((failure) {
      emit(OrderFailureState(failure: failure));
    }, (orders) {
      emit(OrderSuccessState(orders: orders));
    });
  }
}
