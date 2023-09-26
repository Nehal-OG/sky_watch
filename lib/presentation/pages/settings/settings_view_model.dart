import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:sky_watch/application/app_prefs.dart';
import 'package:sky_watch/application/functions.dart';
import 'package:sky_watch/presentation/pages/settings/settings_view.dart';
import 'package:sky_watch/presentation/resources/constants_manager.dart';

class SettingsViewModel extends GetxController {
  final AppPreferences _appPreferences = Get.find<AppPreferences>();

  var selectedTempFormat = TempToggle.celsius.obs;

  SettingsViewModel();

  @override
  void onInit() {
    super.onInit();
    initialize();
  }

  close() {
    Get.back();
  }

// Checking which temp formate is save by user
  initialize() {
    selectedTempFormat.value =
        (_appPreferences.getTempFormate() == AppConstants.celsius)
            ? TempToggle.celsius
            : TempToggle.fahrenheit;
  }

// Update setting of temp formate
  Future<void> saveSettings(BuildContext context) async {
    EasyLoading.show();

    try {
      await _appPreferences.setTempFormate(
          (selectedTempFormat.value == TempToggle.celsius)
              ? AppConstants.celsius
              : AppConstants.fahrenheit);

      // ignore: use_build_context_synchronously
      showSuccessDialog(context,
          successMessageText: 'Settings saved successfully!');
    } catch (e) {
      // print(e.toString());
    }

    EasyLoading.dismiss();
  }
}
