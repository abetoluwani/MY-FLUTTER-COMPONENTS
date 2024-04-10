import 'package:flutter/material.dart';
import 'chip_theme.dart';
import 'colors.dart';

class Apptheme {
  Apptheme._();

  static ThemeData theme = ThemeData(
    chipTheme: AppChipTheme.lightChipTheme,
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(
      primary: AppColors.white, // Set the primary color
    ),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.white,
    ),
  );
}
