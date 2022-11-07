import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/generic_dialog.dart';

Future<bool?> showConfirmRemoveAccountDialog({required BuildContext context}) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Are you sure?',
    content: 'Sure you want to remove your account, you can\'t undo this operation ',
    optionsBuilder: () => {'Remove Account': true, 'cancel': false},
  );
}
