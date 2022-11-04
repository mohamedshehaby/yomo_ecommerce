part of '../signup_view.dart';

class NameTextField extends StatelessWidget {
  const NameTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignupBloc, SignupState>(
      buildWhen: (previous, current) => previous.name != current.name,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p36, vertical: AppPadding.p12),
          child: TextField(
            onChanged: (name) => context.read<SignupBloc>().add(SignupNameChanged(name)),
            decoration: InputDecoration(
              labelText: AppStrings.name,
              errorText: (state.name.status == FormzInputStatus.valid ||
                      state.name.status == FormzInputStatus.pure)
                  ? null
                  : AppStrings.nameError,
            ),
          ),
        );
      },
    );
  }
}
