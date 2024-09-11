import 'package:flutter/material.dart';
import 'app_colors.dart';

abstract class AppTextStyle {
  static const TextStyle typoHoopBold = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static const TextStyle typoHoopRegular = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static const TextStyle black = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w500,
    color: AppColors.text,
  );

  static const TextStyle bold = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w700,
    color: AppColors.text,
  );

  static const TextStyle medium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.text,
  );

  static const TextStyle book = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textIcon,
  );

  static const TextStyle light = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: AppColors.textIcon,
  );
}
