// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:sky_watch/presentation/widgets/custom_app_bar.dart';

Widget CustomScaffold(
  BuildContext context, {
  required Widget body,
  Widget? listOrGridBody,
  Widget? widgetAfterList,
  String appBarTitle = '',
  double? scaffoldPadding,
  Color? backgroundColor,
  Widget? bottomNavigationBar,
  bool isBackButtonNeededInAppBar = true,
  String? suffixIconAssetPathInAppBar,
  VoidCallback? onSuffixIconPressed,
  bool onlyListOrGridView = false,
  bool isScrollable = false,
  PreferredSizeWidget? appBar,
  bool collapse = false,
}) {
  return SafeArea(
    child: Scaffold(
      backgroundColor:
          backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      appBar: appBar,
      body: appBarTitle.isNotEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomAppBar(
                  appBarTitle,
                  backButtonNeeded: isBackButtonNeededInAppBar,
                  suffixIconAssetPath: suffixIconAssetPathInAppBar,
                  onSuffixIconPressed: onSuffixIconPressed,
                ),
                if (!onlyListOrGridView && !isScrollable)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: body,
                  ),
                if (isScrollable)
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 8.0),
                        child: body,
                      ),
                    ),
                  ),
                if (listOrGridBody != null) listOrGridBody,
                if (widgetAfterList != null) widgetAfterList,
              ],
            )
          : Padding(
              padding: EdgeInsets.all(scaffoldPadding ?? 20.0),
              child: body,
            ),
      bottomNavigationBar: bottomNavigationBar,
    ),
  );
}
