import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/order/order_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';

import '../../../domain/models/user_order.dart';
import '../../widgets/error/error_screen.dart';

part 'widgets/empty_order.dart';
part 'widgets/orders_list.dart';
part 'widgets/user_not_found.dart';

class OrdersView extends StatelessWidget {
  const OrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        return BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoggedOutState) {
              return const UserNotFound();
            } else if (state is AuthLoggedInState) {
              final userId = state.user.id;
              loadOrders(context, userId);
              return BlocBuilder<OrderBloc, OrderState>(
                builder: (context, state) {
                  if (state is OrderSuccessState) {
                    final orders = state.orders;
                    if (orders.isEmpty) {
                      return const EmptyOrder();
                    }
                    return OrdersList(orders: orders);
                  } else if (state is OrderFailureState) {
                    return ErrorScreen(
                      failure: state.failure,
                      tryAgainFn: () => loadOrders(context, userId),
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              );
            }
            return Container();
          },
        );
      },
    );
  }

  loadOrders(BuildContext context, userId) {
    context.read<OrderBloc>().add(OrderGetUserOrder(userId: userId));
  }
}
