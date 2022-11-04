part of '../checkout_view.dart';

class PaymentOptions extends StatefulWidget {
  const PaymentOptions({super.key});

  @override
  State<PaymentOptions> createState() => _PaymentOptionsState();
}

class _PaymentOptionsState extends State<PaymentOptions> {
  Payment? _payment = Payment.cash;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Text(
            'Select a payment Method',
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        ListTile(
          title: const Text('Cash on Delivery'),
          leading: Radio<Payment>(
            value: Payment.cash,
            groupValue: _payment,
            onChanged: (Payment? value) {
              context.read<CheckoutBloc>().add(CheckoutPaymentChanged(paymentOption: value!));
              setState(() {
                _payment = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('Visa'),
          leading: Radio<Payment>(
            value: Payment.visa,
            groupValue: _payment,
            onChanged: (Payment? value) {
              context.read<CheckoutBloc>().add(CheckoutPaymentChanged(paymentOption: value!));
              showBottomSheet(
                enableDrag: false,
                context: context,
                builder: (context) {
                  return const VisaSheet();
                },
              );
              setState(() {
                _payment = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
