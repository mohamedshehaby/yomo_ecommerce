import 'package:flutter/cupertino.dart';

import 'package:yomo_ecommerce/data/error_handling/failure.dart';
import 'package:yomo_ecommerce/presentation/widgets/dialog/generic_dialog.dart';

Future<void> showAuthFailureDialog({required BuildContext context, required Failure authFailure}) {
  return showGenericDialog<void>(
    context: context,
    title: authFailure.title,
    content: authFailure.title,
    optionsBuilder: () => {'ok': true},
  );
}
