import 'package:flutter/material.dart';

import 'color_manager.dart';
import 'font_manager.dart';

/// Text Styles
TextStyle _getTextStyle({
  double fontSize = FontSizeManager.s16,
  FontWeight fontWeight = FontWeightManager.helveticaRegular,
  Color textColor = ColorManager.black,
  String? fontFamily,
  TextDecoration? textDecoration,
  double? decorationThickness,
  TextBaseline? textBaseline,
}) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: textColor,
    fontFamily: fontFamily ?? FontConstants.fontHelveticaNeue,
    decoration: textDecoration,
    decorationThickness: decorationThickness,
    textBaseline: textBaseline,
  );
}

TextStyle getDefaultTextStyle() {
  return _getTextStyle();
}

TextStyle getTextFieldTextStyle({Color? color, double? fontSize}) {
  return _getTextStyle(
      textDecoration: TextDecoration.none,
      decorationThickness: 0.0,
      fontSize: fontSize ?? FontSizeManager.s16,
      textColor: ColorManager.white);
}

TextStyle getButtonTextStyle({Color? color}) {
  return _getTextStyle(
    fontWeight: FontWeightManager.helveticaMedium,
    textColor: color ?? ColorManager.white,
    //fontSize: FontSizeManager.s12,
  );
}

TextStyle getHintTextStyle({double? fontSize}) {
  return _getTextStyle(
    fontWeight: FontWeightManager.helveticaRegular,
    textColor: ColorManager.labelTextColor,
    fontSize: fontSize ?? FontSizeManager.s16,
  );
}

TextStyle getLabelTextStyle() {
  return getHintTextStyle(
    fontSize: FontSizeManager.s14,
  );
}

TextStyle getCustomTextFieldTextStyle(
    {FontWeight? fontWeight, double? fontSize}) {
  return _getTextStyle(
    fontWeight: fontWeight ?? FontWeightManager.helveticaRegular,
    fontSize: fontSize ?? FontSizeManager.s16,
  );
}

TextStyle getErrorTextStyle() {
  return _getTextStyle(
    fontSize: FontSizeManager.s13,
    textColor: ColorManager.errorTextColor,
  );
}

TextStyle getAppBarTextStyle() {
  return _getTextStyle(
    fontSize: FontSizeManager.s17,
    fontWeight: FontWeightManager.helveticaMedium,
    textColor: ColorManager.appBarTextColor,
  );
}

TextStyle getDashboardTextStyle({Color? color}) {
  return _getTextStyle(
    fontWeight: FontWeightManager.helveticaMedium,
    textColor: ColorManager.black,
    fontSize: FontSizeManager.s15,
  );
}

TextStyle getGraphikTextStyle(
    {double? fontSize, Color? textColor, FontWeight? fontWeight}) {
  return _getTextStyle(
    fontFamily: FontConstants.fontGraphik,
    fontWeight: fontWeight ?? FontWeightManager.graphikLight,
    fontSize: fontSize ?? FontSizeManager.s16,
    textColor: textColor ?? ColorManager.versionTextColor,
  );
}

TextStyle getListItemTextStyle({required bool isLabel, double? fontsize}) {
  return _getTextStyle(
    fontWeight: isLabel
        ? FontWeightManager.helveticaLight
        : FontWeightManager.helveticaMedium,
    textColor: ColorManager.black,
    fontSize: fontsize ?? FontSizeManager.s13,
  );
}

TextStyle getDialogTextStyle() {
  return _getTextStyle(
    fontWeight: FontWeightManager.helveticaMedium,
    textColor: ColorManager.appBarTextColor,
    fontSize: FontSizeManager.s18,
  );
}

// TextStyle getDropdownDialogTextStyle() {
//   return _getTextStyle(
//     fontWeight: FontWeightManager.helveticaMedium,
//     textColor: ColorManager.appBarTextColor,
//     fontSize: FontSizeManager.s18,
//   );
// }

TextStyle getBoldTextStyle({double? fontSize}) {
  return _getTextStyle(
    fontWeight: FontWeightManager.helveticaBold,
    textColor: ColorManager.black,
    fontSize: fontSize ?? FontSizeManager.s14,
  );
}

TextStyle getBranchPlantTextStyle({Color? color}) {
  return _getTextStyle(
    textColor: ColorManager.black,
    fontSize: FontSizeManager.s14,
  );
}

//
TextStyle getErrorMessageTextStyle() {
  return _getTextStyle(
    fontSize: FontSizeManager.s15,
    textColor: ColorManager.errorMessageTextColor,
  );
}

TextStyle getFloatingLabelTextStyle() {
  return _getTextStyle(
    fontSize: FontSizeManager.s10,
    textColor: ColorManager.floatingLabelTextColor,
  );
}

// Suffix style
TextStyle getTextFieldSuffixTextStyle({
  Color? color,
  double? fontSize,
  TextBaseline? textBaseline,
}) {
  return _getTextStyle(
    textDecoration: TextDecoration.none,
    decorationThickness: 0.0,
    fontSize: fontSize ?? FontSizeManager.s16,
    textBaseline: textBaseline,
  );
}

TextStyle getSettingsHeaderStyle({double? fontSize}) {
  return _getTextStyle(
    fontWeight: FontWeightManager.helveticaBold,
    textColor: ColorManager.black,
    fontSize: fontSize ?? FontSizeManager.s14,
  );
}

TextStyle kTempTextStyle() {
  return _getTextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 60.0,
    textColor: ColorManager.white,
  );
}

TextStyle kConditionTextStyle() {
  return _getTextStyle(
    fontFamily: 'Spartan MB',
    fontSize: 100.0,
    textColor: ColorManager.white,
  );
}
