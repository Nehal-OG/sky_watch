import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sky_watch/application/extensions.dart';
import 'package:sky_watch/presentation/resources/strings_manager.dart';
import 'package:sky_watch/presentation/widgets/custom_dialog.dart';

isEmailValid(String email) {
  return RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);
}

bool isAllRequiredFieldsFilled(List<TextEditingController> controllers) {
  for (TextEditingController textEditingController in controllers) {
    if (textEditingController.text.isEmpty) return false;
  }
  return true;
}

assign(TextEditingController textEditingController, String? controllerText) {
  if (controllerText.orEmpty().isNotEmpty) {
    textEditingController.text = controllerText.orEmpty();
  }
}

clearController(TextEditingController controllerName) {
  controllerName.clear();
}

toggleErrorText(bool displayError,
    {String errorText = AppStrings.fillInRequiredFields}) {
  if (displayError) {
    EasyLoading.showToast(errorText);
  }
}

// showErrorDialog(BuildContext context, {required String errorText}) {
showErrorDialog(BuildContext context, {required String errorText}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        message: errorText,
        showErrorDialog: true,
        doubleBackButtonPressed: false,
      );
    },
  );
}

//Custom Error Cycle Count
showCCErrorDialog(
    {required BuildContext context,
    required String errorText,
    Function? onOkayPress}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        message: errorText,
        showErrorDialog: true,
        doubleBackButtonPressed: false,
        onOkayButtonPressed: () => onOkayPress,
      );
    },
  );
}

showSuccessDialog(
  BuildContext context, {
  required String successMessageText,
  bool doubleBackButtonPressed = true,
  VoidCallback? onOkayButtonPressed,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return CustomDialog(
        message: successMessageText,
        doubleBackButtonPressed: doubleBackButtonPressed,
        onOkayButtonPressed: onOkayButtonPressed,
      );
    },
  );
}

Future<int?> showDropdownDialog(
    BuildContext context, List<String> dropdownList) async {
  closeKeyboard(context);

  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomTextDropDownDialog(
        dropdownList,
      );
    },
  );
}

/// KEYBOARD
bool isKeyboardShowing() {
  // ignore: unnecessary_null_comparison
  if (WidgetsBinding.instance != null) {
    return WidgetsBinding.instance.window.viewInsets.bottom > 0;
  } else {
    return false;
  }
}

void closeKeyboard(BuildContext context) {
  if (isKeyboardShowing()) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) currentFocus.unfocus();
  }
}
