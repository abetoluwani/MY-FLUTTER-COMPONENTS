import 'package:flutter/material.dart';
import '../theme/colors.dart';

class LeaguesWidget extends StatelessWidget {
  const LeaguesWidget({
    super.key,
    required this.image,
    required this.onTap,
  });

  final String image;
 final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.grey,
              offset: Offset(
                0.4,
                1.5,
              ),
              blurRadius: 1.5,
            ),
          ],
          // make the border have an elevation that would not affect the overlay color of the image

          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: AppColors.black,
            width: 0.5,
          ),
          //fit: BoxFit.cover, width: double.infinity,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
