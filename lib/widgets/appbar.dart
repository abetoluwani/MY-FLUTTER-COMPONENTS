import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isCartandNot;

  CustomAppBar({required this.title, Key? key, this.isCartandNot = true})
      : super(key: key);

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
      actions: [
        isCartandNot
            ? NotificationIcon(
                showcontainer: true,
                iconColor: AppColors.white,
                onPressed: () => Get.toNamed(Routes.NOTIFICATIONS))
            : const SizedBox(),
        isCartandNot
            ? IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () {
                  Get.toNamed(Routes.CART);
                },
                color: Colors.white,
              )
            : IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
                color: Colors.white,
              ),
      ],
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
