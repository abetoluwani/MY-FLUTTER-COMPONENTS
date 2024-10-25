import 'package:flutter/material.dart';

import '../../../widgets/space.dart';
import 'colors.dart';

class AppChipTheme {
  AppChipTheme._();
  static ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: AppColors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: AppColors.black),
    selectedColor: AppColors.primary,
    padding: simPad(12, 12),
    checkmarkColor: AppColors.white,
  );

}
