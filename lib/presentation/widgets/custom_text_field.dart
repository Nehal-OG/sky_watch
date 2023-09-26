// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/styles_manager.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';

Padding CustomTextField({
  required String hintText,
  String? suffixIconAssetPath,
  IconData? suffixIconName,
  VoidCallback? onSuffixIconPressed,
  TextEditingController? controller,
  bool? obscureText,
  void Function(String)? onChanged,
  bool disabled = false,
  bool isLastTextField = false,
  void Function(String)? onSubmitted,
  double? bottomPadding,
  TextInputType? keyboardType,
  int? maxLines,
  int? minLines,
  double? textFontSize,
  double? maxHeight,
  VoidCallback? onTap,
  String? suffixText,
  FocusNode? focusNode,
}) {
  return Padding(
    padding: EdgeInsets.only(bottom: bottomPadding ?? AppPaddings.p16),
    child: TextField(
      focusNode: focusNode,
      keyboardType: keyboardType,
      onTap: onTap,
      readOnly: disabled,
      obscureText: obscureText ?? false,
      controller: controller,
      onChanged: onChanged,
      style: getTextFieldTextStyle(fontSize: textFontSize),
      textInputAction:
          isLastTextField ? TextInputAction.done : TextInputAction.next,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        suffixText: suffixText,
        suffixStyle: getTextFieldSuffixTextStyle(
          fontSize: textFontSize,
          textBaseline: TextBaseline.ideographic,
        ),
        contentPadding: const EdgeInsets.only(bottom: 4, left: 5, top: 4),
        //hintText: hintText,
        constraints: BoxConstraints(maxHeight: maxHeight ?? AppSizes.s50),
        filled: disabled,
        enabled: !disabled,
        border: disabled
            ? UnderlineInputBorder(
                borderRadius: BorderRadius.circular(AppRadius.r10),
              )
            : null,
        fillColor:
            disabled ? ColorManager.disabledBackgroundTextFieldColor : null,
        labelText: hintText,
        labelStyle: const TextStyle(
            color: ColorManager.white,
            fontSize: AppPaddings.p16,
            fontWeight: FontWeight.bold),
        suffixIcon: (suffixIconAssetPath != null)
            ? IconButton(
                onPressed: onSuffixIconPressed,
                icon: SvgPicture.asset(
                  suffixIconAssetPath,
                  width: AppSizes.s25,
                  height: AppSizes.s25,
                  color: ColorManager.primary,
                ),
              )
            : (suffixIconName != null)
                ? IconButton(
                    onPressed: onSuffixIconPressed,
                    icon: Icon(suffixIconName),
                    color: Colors.white,
                  )
                : null,
        suffixIconConstraints: const BoxConstraints(
          minWidth: AppSizes.s25,
          minHeight: AppSizes.s25,
        ),
      ),
      minLines: minLines ?? 1,
      maxLines: maxLines ?? 1,
    ),
  );
}
