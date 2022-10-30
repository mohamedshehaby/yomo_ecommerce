import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yomo_ecommerce/presentation/resources/resources.dart';

ThemeData getAppTheme() {
  return ThemeData(
    useMaterial3: true,

    // Main Colors
    primaryColor: ColorManager.primary,

    primaryColorLight: ColorManager.lightPrimary,
    primaryColorDark: ColorManager.darkPrimary,
    disabledColor: ColorManager.grey1,
    errorColor: ColorManager.error,
    splashColor: ColorManager.lightPrimary,

    // CardView Theme
    cardTheme: const CardTheme(
      color: Colors.white,
      shadowColor: ColorManager.grey,
      elevation: AppSize.s4,
      surfaceTintColor: Colors.white,
    ),

    // App Bar Theme
    appBarTheme: AppBarTheme(
      iconTheme: const IconThemeData(color: Colors.white),
      // actionsIconTheme: const IconThemeData(color: Colors.white),
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: ColorManager.primary,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      ),
      centerTitle: true,
      backgroundColor: ColorManager.primary,
      shadowColor: ColorManager.lightPrimary,
      foregroundColor: Colors.white,
      elevation: AppSize.s4,
      titleTextStyle: getSemiBoldTextStyle(fontSize: FontSize.s16, color: Colors.white),
    ),

    // Elevated Button Theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, AppSize.s40),
        textStyle: getRegularTextStyle(color: Colors.white, fontSize: FontSize.s16),
        backgroundColor: ColorManager.primary,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s12)),
      ),
    ),

    // Text Button Theme
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: ColorManager.primary,
        textStyle: getRegularTextStyle(color: ColorManager.primary, fontSize: FontSize.s14),
      ),
    ),

    //Text Theme
    textTheme: TextTheme(
      titleLarge: getSemiBoldTextStyle(color: Colors.black, fontSize: FontSize.s18),
      titleMedium: getSemiBoldTextStyle(color: ColorManager.darkGrey, fontSize: FontSize.s16),
      titleSmall: getMediumTextStyle(color: ColorManager.primary, fontSize: FontSize.s16),
      labelLarge: getRegularTextStyle(color: Colors.black, fontSize: FontSize.s14),
      labelMedium: getBoldTextStyle(color: ColorManager.primary, fontSize: FontSize.s12),
      labelSmall: getRegularTextStyle(color: ColorManager.grey, fontSize: FontSize.s12),
      bodyMedium: getRegularTextStyle(color: ColorManager.lightGrey, fontSize: FontSize.s14),
      bodySmall: getRegularTextStyle(color: ColorManager.grey2, fontSize: FontSize.s12),
    ),

    // Form Field Theme
    inputDecorationTheme: InputDecorationTheme(
      // content padding
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      // hint style
      hintStyle: getRegularTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      // label style
      labelStyle: getMediumTextStyle(color: ColorManager.grey, fontSize: FontSize.s14),
      // error style
      errorStyle: getRegularTextStyle(color: ColorManager.error),
      // enabled border
      enabledBorder: _getOutlineInputBorder(color: ColorManager.arapawa20),
      // focused border
      focusedBorder: _getOutlineInputBorder(color: ColorManager.primary),
      // error border
      errorBorder: _getOutlineInputBorder(color: ColorManager.error),
      // focused error border
      focusedErrorBorder: _getOutlineInputBorder(color: ColorManager.primary),
    ),
  );
}

OutlineInputBorder _getOutlineInputBorder({required Color color}) {
  return OutlineInputBorder(
    borderSide: BorderSide(color: color, width: AppSize.s1),
    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
  );
}
