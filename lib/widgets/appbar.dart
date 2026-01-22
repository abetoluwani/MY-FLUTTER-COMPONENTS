import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utils/utils.dart';
import 'widget.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isCartandNot;

  const CustomAppBar({
    required this.title,
    super.key,
    this.isCartandNot = true,
  });

  @override
  Size get preferredSize => const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios),
        onPressed: () => Get.back(),
        color: Colors.white,
      ),
      title: SmallAppText(
        title,
        color: AppColors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        maxLines: 1,
      ),
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF10BB76),
              Color(0xFF086D50),
              Color(0xFF001726),
            ], // Replace with exact colors
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
      elevation: 0,
    );
  }
}
