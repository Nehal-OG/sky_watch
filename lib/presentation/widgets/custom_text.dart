// ignore_for_file: non_constant_identifier_names

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../presentation/resources/styles_manager.dart';

AutoSizeText CustomText(String text,
    {TextStyle? textStyle, TextAlign? textAlign, int? maxLines}) {
  return AutoSizeText(
    text,
    style: textStyle ?? getDefaultTextStyle(),
    textAlign: textAlign ?? TextAlign.start,
    maxLines: maxLines,
  );
}
