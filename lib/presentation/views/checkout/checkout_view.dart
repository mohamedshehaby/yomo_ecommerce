import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:yomo_ecommerce/app/enums.dart';
import 'package:yomo_ecommerce/domain/models/user_order.dart';
import 'package:yomo_ecommerce/presentation/blocs/auth/auth_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/cart/cart_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/order/order_bloc.dart';
import 'package:yomo_ecommerce/presentation/blocs/validation/checkout/checkout_bloc.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';
import 'package:yomo_ecommerce/presentation/views/checkout/widgets/visa_sheet.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/show_order_placed_dialog.dart';
import 'package:yomo_ecommerce/presentation/widgets/loading/loading_screen/loading_screen.dart';
import 'package:yomo_ecommerce/presentation/widgets/order_summary.dart';

part 'widgets/address_text_field.dart';
part 'widgets/city_text_field.dart';
part 'widgets/governorate_text_field.dart';
part 'widgets/order_new_button.dart';
part 'widgets/payment_options.dart';
part 'widgets/phone_text_field.dart';
part 'widgets/zipcode_text_field.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(color: Colors.white),
        title: const Text('Checkout'),
      ),
      body: BlocListener<OrderBloc, OrderState>(
        listener: (context, state) async {
          if (state is OrderLoadingState) {
            LoadingScreen.instance().show(context: context, text: 'Placing your order');
          } else if (state is OrderUploadedState) {
            LoadingScreen.instance().hide();
            await showOrderPlacedDialog(context: context);
            Navigator.of(context).pushNamedAndRemoveUntil(Routes.mainRoute, (_) => false);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const AddressTextField(),
              const CityTextField(),
              const GovernorateTextField(),
              const ZipcodeTextField(),
              const PhoneTextField(),
              const PaymentOptions(),
              OrderSummary(
                subTotal: context.read<CartBloc>().state.cart!.subTotal,
                deliverFee: context.read<CartBloc>().state.cart!.deliverFee,
              ),
              const OrderNowButton()
            ],
          ),
        ),
      ),
    );
  }
}
