import 'package:flutter/material.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/generic_dialog.dart';

Future<bool?> showOrderPlacedDialog({required BuildContext context}) {
  return showGenericDialog<bool>(
    context: context,
    title: 'Order Success',
    content: 'Order has been placed',
    optionsBuilder: () => {'ok': true},
  );
}
