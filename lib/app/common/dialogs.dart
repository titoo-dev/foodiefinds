import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dialogs {
  static showLoadingDialog() {
    Get.dialog(
        AlertDialog(
          content: Row(
            children: [
              const CircularProgressIndicator(),
              const SizedBox(
                width: 40.0,
              ),
              Text(
                'messages_loading'.tr,
                style: Get.theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        barrierDismissible: false);
  }

  static showSuccessDialog({
    required String message,
    String? successTextButton,
    required Function? onConfirm,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text('messages_success'.tr),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              if (onConfirm != null) onConfirm();
            },
            child: Text(successTextButton ?? 'buttons_ok'.tr),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

  static showFailureDialog(
    BuildContext context, {
    required String message,
    String? failureTextButton,
    required Function? onConfirm,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('dialogs_titles_failure'.tr),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
              if (onConfirm != null) onConfirm();
            },
            child: Text(failureTextButton ?? 'buttons_ok'.tr),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }
}
