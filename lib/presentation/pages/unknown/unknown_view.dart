import 'package:flutter/material.dart';

import '../../../presentation/resources/strings_manager.dart';
import '../../../presentation/widgets/custom_scaffold.dart';
import '../../../presentation/widgets/custom_text.dart';

class UnknownView extends StatelessWidget {
  const UnknownView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      context,
      body: Center(
        child: CustomText(
          AppStrings.noRouteFound,
        ),
      ),
    );
  }
}
