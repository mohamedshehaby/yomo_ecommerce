import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/generic_dialog.dart';

Future<bool?> showConfirmSignOutDialog({required BuildContext context}) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Are you sure?',
    content: 'Sure you want to sign out',
    optionsBuilder: () => {'sign out': true, 'cancel': false},
  );
}
