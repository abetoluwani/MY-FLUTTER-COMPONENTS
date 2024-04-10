import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/apptext.dart';
import '../theme/colors.dart';

class AppHelpers {
  static Color? getColor(String value) {
    switch (value) {
      case "primary":
        return AppColors.primary;
      case "secondary":
        return AppColors.secondary;
      case "accent":
        return AppColors.accent;
      case "black":
        return AppColors.black;
      case "white":
        return AppColors.white;
      case "green":
        return Colors.green;
      case "red":
        return AppColors.red;
      case "yellow":
        return AppColors.yellow;
      case "pink":
        return AppColors.pink;
      case "purple":
        return AppColors.purple;
      case "orange":
        return Colors.orange;
      case "grey":
        return AppColors.grey;
      case "darkgrey":
        return AppColors.darkgrey;
      case "lime":
        return Colors.limeAccent;
      case "blue":
        return Colors.blue;
    }
    return null;
  }

  static void showSnackBar(String message) {
    Get.snackbar(
      "",
      message,
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showAlert(String title, String message) {
    Get.dialog(
      AlertDialog(
        title: BigAppText(title),
        content: BigAppText(message),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: BigAppText(
              "OK",
            ),
          ),
        ],
      ),
    );
  }

  static String truncateText(String text, int maxLength) {
    if (text.length <= maxLength) {
      return text;
    } else {
      return "${text.substring(0, maxLength)}...";
    }
  }

  static Size screenSize() {
    return Get.size;
  }

  static double screenWidth() {
    return Get.width;
  }

  static double screenHeight() {
    return Get.height;
  }
}
