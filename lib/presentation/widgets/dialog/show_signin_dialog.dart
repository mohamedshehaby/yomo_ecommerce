import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/generic_dialog.dart';

Future<bool?> showSignInDialog({required BuildContext context}) {
  return showGenericDialog<bool>(
    context: context,
    title: 'No user found',
    content: 'you need to sign in to checkout',
    optionsBuilder: () => {'sign in': true, 'cancel': false},
  );
}
