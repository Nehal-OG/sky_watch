// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/styles_manager.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';
import 'package:sky_watch/presentation/widgets/custom_divider.dart';
import 'package:sky_watch/presentation/widgets/custom_text.dart';

Widget CustomAppBar(
  String appBarText, {
  bool backButtonNeeded = true,
  String? suffixIconAssetPath,
  VoidCallback? onSuffixIconPressed,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.end,
    mainAxisSize: MainAxisSize.min,
    children: [
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (backButtonNeeded)
              InkWell(
                onTap: () => Get.back(),
                child: const Padding(
                  padding: EdgeInsets.only(
                      left: 10.0, right: 15.0, top: 10.0, bottom: 8.0),
                  child: Icon(
                    Icons.navigate_before,
                    size: AppSizes.s30,
                    color: ColorManager.appBarBackButtonColor,
                  ),
                ),
              ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: backButtonNeeded ? 0.0 : 18.0),
                child: CustomText(appBarText, textStyle: getAppBarTextStyle()),
              ),
            ),
            if (suffixIconAssetPath != null)
              IconButton(
                onPressed: onSuffixIconPressed,
                icon: SvgPicture.asset(
                  suffixIconAssetPath,
                  width: AppSizes.s30,
                  height: AppSizes.s30,
                  color: ColorManager.appBarTextColor,
                ),
              ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        child: CustomDivider(dividerHeight: 0.0),
      ),
      const SizedBox(
        height: AppSizes.s6,
      ),
    ],
  );
}
