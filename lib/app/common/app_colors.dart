import 'package:flutter/material.dart';

abstract class AppColors {
  static const Map<int, Color> primary = {
    50: Color(0xffefeaf2),
    100: Color(0xffdfd5e5),
    200: Color(0xff906ba5),
    300: Color(0xff815599),
    400: Color(0xff71408c),
    500: Color(0xff612b7f),
    600: Color(0xff572772),
    700: Color(0xff4e2266),
    800: Color(0xff441e59),
    900: Color(0xff3a1a4c),
  };

  // black
  static const Color text = Color(0xFF292F36);

  // gray
  static const Color hr = Color(0xFFEBEBEB);
  static const Color bgInput = Color(0xFFEBEBEB);
  static const Color bg = Color(0xFFF4F4F4);
  static const Color textIcon = Color(0xFF959595);
  static const Color bgIcon = Color(0xFFF6F6F6);
  static const Color grey = Color(0xFFCECECE);

  // message
  static const Color error = Color(0xFFFF6B6B);
  static const Color warning = Color(0xFFFFAD32);
  static const Color success = Color(0xFF1BC88D);
  static const Color info = Color(0xFF3981EC);

  // notification black
  static const Color notification = Color(0xFF292F36);
}
