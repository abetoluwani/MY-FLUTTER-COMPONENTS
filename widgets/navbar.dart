
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

import '../theme/colors.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  // final List<BottomNavigationBarItem> items;
  final void Function(int)? onItemTapped;
  final int currentIndex;

  const BottomNavigationBarWidget({
    super.key,
    required this.onItemTapped,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Iconsax.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Iconsax.calendar,
          ),
          label: 'Bookings',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.message_rounded,
          ),
          label: 'Chat',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.account_circle,
          ),
          label: 'Settings',
        ),
      ],
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      elevation: 1,
      selectedIconTheme: const IconThemeData(
        color: AppColors.primary,
      ),
      onTap: onItemTapped,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.black,
    );
  }
}

void handleNavigation(int index) {
  switch (index) {
    case 0:
      // Navigate to HomeScreen
      Get.offAll(() => HomeView());
      break;
    case 1:
      // Navigate to Booking
      Get.offAll(() => BookingsView());
      break;
    case 2:
      // Navigate to chat
      Get.offAll(() => ChatView());
      break;
    case 3:
      // Navigate to profile
      Get.offAll(() => ProfileView());
      break;

    // Add more cases for additional bottom navigation items
  }
}
