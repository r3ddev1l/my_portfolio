import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFFE53935);
  static const Color secondary = Color(0xFF1E1E1E);
  static const Color background = Colors.black;
  static const Color text = Colors.white;
  static const Color card = Color(0xFF2A2A2A);
}

class AppTextStyles {
  static const heading = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    color: AppColors.text,
  );

  static const subheading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.text,
  );

  static const body = TextStyle(fontSize: 16, color: AppColors.text);
}

class AppDurations {
  static const animation = Duration(milliseconds: 300);
}
