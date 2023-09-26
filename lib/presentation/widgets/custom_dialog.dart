// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/strings_manager.dart';
import 'package:sky_watch/presentation/resources/styles_manager.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';
import 'package:sky_watch/presentation/widgets/custom_button.dart';
import 'package:sky_watch/presentation/widgets/custom_text.dart';

Dialog CustomDialog({
  required String message,
  String buttonText = AppStrings.ok,
  String? imageAssets,
  bool showErrorDialog = false,
  bool doubleBackButtonPressed = true,
  VoidCallback? onOkayButtonPressed,
}) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    backgroundColor: ColorManager.white,
    elevation: AppSizes.s10,
    child: Padding(
      padding: const EdgeInsets.all(26.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            showErrorDialog
                ? const Icon(
                    Icons.error,
                    color: Color(0XFFF29E00),
                    size: AppSizes.s50,
                  )
                : const Icon(Icons.check),
            const SizedBox(
              height: 26.0,
            ),
            CustomText(
              message,
              textStyle: getDialogTextStyle(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30.0,
            ),
            CustomButton(
              buttonText,
              onPressed: onOkayButtonPressed ??
                  () {
                    Get.back();
                    if (doubleBackButtonPressed) {
                      Get.back(result: true);
                    }
                  },
              buttonWidth: AppSizes.s125,
            ),
            const SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    ),
  );
}

// DIALOG
Dialog CustomTextDropDownDialog(List<String> dropdownList) {
  return Dialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: dropdownList.length,
        itemBuilder: (context, position) {
          return InkWell(
            onTap: () {
              Get.back(result: position);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 22.0, horizontal: 12.0),
                  child: CustomText(dropdownList[position],
                      maxLines: 5, textStyle: getDialogTextStyle()),
                ),
                if (dropdownList.length != (position + 1))
                  const Divider(
                    height: 1.0,
                  ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
