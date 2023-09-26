// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/values_manager.dart';

Divider CustomDivider({double? dividerHeight}) {
  return Divider(
    color: ColorManager.appBarDividerColor,
    thickness: AppSizes.s1,
    height: dividerHeight ?? AppSizes.s12,
  );
}
