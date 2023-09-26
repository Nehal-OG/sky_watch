import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sky_watch/presentation/pages/settings/settings_view_model.dart';
import 'package:sky_watch/presentation/resources/color_manager.dart';
import 'package:sky_watch/presentation/resources/constants_manager.dart';
import 'package:sky_watch/presentation/resources/styles_manager.dart';
import 'package:sky_watch/presentation/widgets/custom_navigation_bar.dart';
import '../../../presentation/resources/strings_manager.dart';
import '../../../presentation/widgets/custom_scaffold.dart';
import '../../../presentation/widgets/custom_text.dart';

enum TempToggle {
  celsius,
  fahrenheit,
}

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    final settingsViewModel = Get.find<SettingsViewModel>();

    return CustomScaffold(
      context,
      appBarTitle: AppStrings.settings,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _addHeader(headerTitle: AppStrings.tempFormatSettings),
            const SizedBox(
              height: 6.0,
            ),
            Obx(
              () => Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Radio<TempToggle>(
                          fillColor: const MaterialStatePropertyAll(
                              ColorManager.primary),
                          value: TempToggle.celsius,
                          groupValue:
                              settingsViewModel.selectedTempFormat.value,
                          onChanged: (TempToggle? value) {
                            if (value != null) {
                              settingsViewModel.selectedTempFormat.value =
                                  value;
                            }
                          },
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        CustomText(AppConstants.celsius),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Radio<TempToggle>(
                          fillColor: const MaterialStatePropertyAll(
                              ColorManager.primary),
                          value: TempToggle.fahrenheit,
                          groupValue:
                              settingsViewModel.selectedTempFormat.value,
                          onChanged: (TempToggle? value) {
                            if (value != null) {
                              settingsViewModel.selectedTempFormat.value =
                                  value;
                            }
                          },
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        CustomText(AppConstants.fahrenheit),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        buttonOneText: AppStrings.save,
        onButtonOnePressed: () => settingsViewModel.saveSettings(context),
        buttonTwoText: AppStrings.close,
        onButtonTwoPressed: () {
          settingsViewModel.close();
        },
        buttonTwoGreyBackground: true,
      ),
    );
  }

  _addHeader({required String headerTitle}) {
    return CustomText(headerTitle,
        textStyle: getSettingsHeaderStyle(fontSize: 15.0));
  }
}
