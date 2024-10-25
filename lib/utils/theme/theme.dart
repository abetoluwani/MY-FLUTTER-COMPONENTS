import 'package:flutter/material.dart';

import '../../widgets/widget.dart';
import '../utils.dart';

class AppTheme {
  static ThemeData get lighttheme {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        dialogBackgroundColor: AppColors.white,
        dialogTheme: const DialogTheme(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
        ),
        primaryColor: AppColors.primary,
        cardColor: AppColors.white,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          iconTheme: IconThemeData(color: AppColors.black),
          surfaceTintColor: Colors.transparent,
        ),
        chipTheme: ChipThemeData(
          padding: simPad(5, 5),
          shape: const StadiumBorder(
            side: BorderSide.none,
          ),
          side: BorderSide.none,
        ),
        primaryColorLight: AppColors.white,
        popupMenuTheme: const PopupMenuThemeData(color: AppColors.white));
  }

  static ThemeData get darkTheme {
    return ThemeData(
        scaffoldBackgroundColor: AppColors.white,
        dialogBackgroundColor: AppColors.white,
        dialogTheme: const DialogTheme(
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          iconTheme: IconThemeData(color: AppColors.black),
        ),
        chipTheme: ChipThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        dividerColor: AppColors.grey200,
        primaryColorLight: AppColors.white,
        popupMenuTheme: const PopupMenuThemeData(color: AppColors.white));
  }
}

