// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';
import 'package:sky_watch/presentation/widgets/custom_button.dart';

Widget CustomNavigationBar({
  required String buttonOneText,
  required VoidCallback onButtonOnePressed,
  bool? buttonOneGreyBackground,
  String? buttonTwoText,
  VoidCallback? onButtonTwoPressed,
  bool? buttonTwoGreyBackground,
  String? buttonThreeText,
  VoidCallback? onButtonThreePressed,
  bool? buttonThreeGreyBackground,
}) {
  return Padding(
    padding: const EdgeInsets.only(
      left: AppPaddings.p20,
      right: AppPaddings.p20,
      bottom: AppPaddings.p20,
      top: AppPaddings.p10,
    ),
    child: SizedBox(
      height: (buttonThreeText == null) ? 70 : 120,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (buttonThreeText != null)
            CustomButton(
              buttonThreeText,
              onPressed: onButtonThreePressed!,
              greyBackground: buttonThreeGreyBackground ?? false,
            ),
          Padding(
            padding: const EdgeInsets.only(top: AppPaddings.p16),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(buttonOneText,
                      onPressed: onButtonOnePressed,
                      greyBackground: buttonOneGreyBackground ?? false),
                ),
                if (buttonTwoText != null)
                  const SizedBox(
                    width: AppSizes.s24,
                  ),
                if (buttonTwoText != null)
                  Expanded(
                    child: CustomButton(buttonTwoText,
                        onPressed: onButtonTwoPressed!,
                        greyBackground: buttonTwoGreyBackground ?? false),
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
