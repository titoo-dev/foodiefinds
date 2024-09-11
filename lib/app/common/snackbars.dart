import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';
import 'text_styles.dart';

abstract class SnackbarManager {
  /**
   * Show Success Snackbar
   */
  static void showSuccessSnackbar({
    required String message,
    String title = 'Success',
    Color color = AppColors.success,
  }) {
    Get.snackbar(
      '',
      '',
      shouldIconPulse: false,
      titleText: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          title,
          style: AppTextStyle.medium.copyWith(color: color),
        ),
      ),
      messageText: Text(
        message,
        style: AppTextStyle.medium,
      ),
      snackPosition: SnackPosition.TOP,
      backgroundColor: AppColors.success.withOpacity(0.1),
      margin: const EdgeInsets.only(
        top: 20,
        right: 20,
        left: 20,
      ),
      padding: const EdgeInsets.all(10),
      borderRadius: 4,
      borderColor: color,
      borderWidth: 1,
      icon: Icon(
        Icons.notifications,
        color: color,
        size: 18,
      ),
      duration: const Duration(seconds: 3),
    );
  }

  /**
   * Show Error Snackbar
   */
  static void showErrorSnackbar(String title, String message) => Get.snackbar(
        '',
        '',
        shouldIconPulse: false,
        titleText: Align(
          alignment: Alignment.bottomLeft,
          child: Text(
            title,
            style: AppTextStyle.medium,
          ),
        ),
        messageText: Text(
          message,
          style: AppTextStyle.medium,
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: AppColors.error.withOpacity(0.1),
        margin: const EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        padding: const EdgeInsets.all(10),
        borderRadius: 4,
        borderColor: AppColors.error,
        borderWidth: 1,
        icon: const Icon(
          Icons.notifications,
          color: AppColors.error,
          size: 18,
        ),
        duration: const Duration(seconds: 3),
      );
}
