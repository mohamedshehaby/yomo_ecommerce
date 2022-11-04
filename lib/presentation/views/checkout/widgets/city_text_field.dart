part of '../checkout_view.dart';


class CityTextField extends StatelessWidget {
  const CityTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CheckoutBloc, CheckoutState>(
      buildWhen: (previous, current) => previous.city != current.city,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            onChanged: (city) => context.read<CheckoutBloc>().add(CheckoutCityChanged(city: city)),
            decoration: InputDecoration(
              labelText: AppStrings.city,
              errorText: (state.city.status == FormzInputStatus.valid ||
                      state.city.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.cityError,
            ),
          ),
        );
      },
    );
  }
}
