import 'package:flutter/material.dart';
import 'color_manager.dart';
import 'styles_manager.dart';
import 'values_manager.dart';
import 'font_manager.dart';

/// App Theme
ThemeData getApplicationTheme() {
  Size size = WidgetsBinding.instance.window.physicalSize;
  return ThemeData(
    /// FONTS
    fontFamily: FontConstants.fontHelveticaNeue,

    // MAIN COLORS
    primaryColor: ColorManager.primary,
    // primaryColorLight: ColorManager.lightPrimary,
    // primaryColorDark: ColorManager.darkPrimary,
    // disabledColor: ColorManager.grey1,
    scaffoldBackgroundColor: ColorManager.scaffoldBackgroundColor,

    /// MY CODE
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ButtonStyle(
    //     backgroundColor: MaterialStateProperty.all(
    //       ColorManager.primary,
    //     ),
    //   ),
    // ),

    /// CARD VIEW THEME
    // cardTheme: CardTheme(
    //     color: ColorManager.white,
    //     elevation: AppSizes.s4,
    //     shadowColor: ColorManager.grey),

    /// APP BAR THEME
    // appBarTheme: AppBarTheme(
    //   centerTitle: true,
    //   color: ColorManager.primary,
    //   shadowColor: ColorManager.lightPrimary,
    //   elevation: AppSizes.s4,
    //   titleTextStyle: getRegularStyle(
    //       color: ColorManager.white, fontSize: FontSizeManager.s16),
    // ),

    /// BUTTON THEME
    // buttonTheme: ButtonThemeData(
    //     shape: const StadiumBorder(), // ya3ne button rounded from the corners
    //     buttonColor: ColorManager.primary,
    //     splashColor: ColorManager.lightPrimary,
    //     disabledColor: ColorManager.grey1),

    /// ELEVATED BUTTON THEME
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            textStyle: getButtonTextStyle(),
            backgroundColor: ColorManager.primary,
            minimumSize: Size(size.width, AppSizes.s50),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r10)))),

    /// TEXT THEME
    // textTheme: TextTheme(
    //     headlineLarge: getLightStyle(
    //         color: ColorManager.white, fontSize: FontSizeManager.s16),
    //     titleMedium: getMediumStyle(
    //         color: ColorManager.primary, fontSize: FontSizeManager.s16),
    //     titleSmall: getMediumStyle(
    //         color: ColorManager.primary, fontSize: FontSizeManager.s18),
    //     bodyMedium: getMediumStyle(
    //         color: ColorManager.grey2, fontSize: FontSizeManager.s14),
    //     bodySmall: getRegularStyle(
    //         color: ColorManager.white, fontSize: FontSizeManager.s16),
    //     headlineMedium: getRegularStyle(color: ColorManager.darkGrey),
    //     displayLarge: getSemiBoldStyle(
    //         color: ColorManager.darkGrey, fontSize: FontSizeManager.s22)),

    /// INPUT DECORATION THEME (TEXTFORM FIELD)
    inputDecorationTheme: InputDecorationTheme(
      //content padding
      contentPadding: const EdgeInsets.all(AppPaddings.p8),

      //hint style
      hintStyle: getHintTextStyle(),

      //label style
      labelStyle: getHintTextStyle(),

      floatingLabelStyle: getLabelTextStyle(),

      suffixIconColor: ColorManager.primary,

      //   //error style
      //   errorStyle: getRegularStyle(color: ColorManager.error),

      //   //enabled Border
      //   enabledBorder: OutlineInputBorder(
      //       borderSide:
      //           BorderSide(color: ColorManager.grey, width: AppSizes.s1_5),
      //       borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8))),

      //   //focused Border
      //   focusedBorder: OutlineInputBorder(
      //       borderSide:
      //           BorderSide(color: ColorManager.primary, width: AppSizes.s1_5),
      //       borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8))),

      //   //error border
      //   errorBorder: OutlineInputBorder(
      //       borderSide:
      //           BorderSide(color: ColorManager.error, width: AppSizes.s1_5),
      //       borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8))),

      //   //focused error border
      //   focusedErrorBorder: OutlineInputBorder(
      //       borderSide:
      //           BorderSide(color: ColorManager.primary, width: AppSizes.s1_5),
      //       borderRadius: const BorderRadius.all(Radius.circular(AppSizes.s8))),
    ),
  );
}
