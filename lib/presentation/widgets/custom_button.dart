// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/styles_manager.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';
import 'package:sky_watch/presentation/widgets/custom_text.dart';

var switchh = false;

ElevatedButton CustomButton(String buttonText,
    {required VoidCallback onPressed,
    bool greyBackground = false,
    double? buttonWidth}) {
  return ElevatedButton(
      onPressed: onPressed,
      style: Get.theme.elevatedButtonTheme.style!.copyWith(
        backgroundColor: greyBackground
            ? const MaterialStatePropertyAll(ColorManager.greyButtonColor)
            : Get.theme.elevatedButtonTheme.style!.backgroundColor,
        minimumSize: (buttonWidth != null)
            ? MaterialStatePropertyAll(Size(buttonWidth, AppSizes.s50))
            : Get.theme.elevatedButtonTheme.style!.minimumSize,
        // textStyle: greyBackground
        //     ? MaterialStatePropertyAll(
        //         getButtonTextStyle(color: ColorManager.greyButtonTextColor))
        //     : Get.theme.elevatedButtonTheme.style!.textStyle,
      ),
      child: CustomText(
        buttonText,
        textStyle: greyBackground
            ? getButtonTextStyle(color: ColorManager.greyButtonTextColor)
            : getButtonTextStyle(),
      ));
}

ElevatedButton CustomIconButton(
  String assetPath, {
  required VoidCallback onPressed,
  bool greyBackground = false,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: Get.theme.elevatedButtonTheme.style!.copyWith(
      minimumSize:
          const MaterialStatePropertyAll(Size(AppSizes.s50, AppSizes.s50)),
      backgroundColor: greyBackground
          ? const MaterialStatePropertyAll(ColorManager.greyButtonColor)
          : Get.theme.elevatedButtonTheme.style!.backgroundColor,
    ),
    child: SvgPicture.asset(
      fit: BoxFit.cover,
      assetPath,
      width: AppSizes.s25,
      height: AppSizes.s25,
      color: greyBackground ? ColorManager.primary : ColorManager.white,
    ),
  );
}

Widget androidSwitch() => Transform.scale(
      scale: 1,
      child: Switch(
        // thumb color (round icon)
        activeColor: Colors.amber,
        activeTrackColor: Colors.cyan,
        inactiveThumbColor: Colors.blueGrey.shade600,
        inactiveTrackColor: Colors.grey.shade400,
        splashRadius: 50.0,
        // boolean variable value
        value: switchh,
        // changes the state of the switch
        onChanged: (value) => switchh,
      ),
    );
