import 'package:flutter/material.dart';

import 'package:yomo_ecommerce/presentation/resources/font_manager.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required Color color,
  required FontWeight fontWeight,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: FontConstants.fontFamily,
    color: color,
    fontWeight: fontWeight,
  );
}

TextStyle getLightTextStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize: fontSize, color: color, fontWeight: FontWeightManager.light);
}

TextStyle getRegularTextStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize: fontSize, color: color, fontWeight: FontWeightManager.regular);
}

TextStyle getMediumTextStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize: fontSize, color: color, fontWeight: FontWeightManager.medium);
}

TextStyle getSemiBoldTextStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize: fontSize, color: color, fontWeight: FontWeightManager.semiBold);
}

TextStyle getBoldTextStyle({double fontSize = FontSize.s12, required Color color}) {
  return _getTextStyle(fontSize: fontSize, color: color, fontWeight: FontWeightManager.bold);
}
