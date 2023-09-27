import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../presentation/resources/assets_manager.dart';
import '../../../presentation/widgets/custom_scaffold.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      context,
      backgroundColor: Colors.blue.shade500,
      body: Center(
        child: SvgPicture.asset(
          ImageAssets.splashLogo,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
