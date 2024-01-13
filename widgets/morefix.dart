import 'package:flutter/material.dart';
import 'space.dart';
import '../theme/colors.dart';
import 'apptext.dart';

class MoreFix extends StatelessWidget {
  const MoreFix({
    super.key,
    this.rad,
    this.brad,
  });

  final double? rad;
  final double? brad;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: const [
          BoxShadow(
            color: AppColors.grey,
            spreadRadius: 1,
            offset: Offset(
              1.5,
              10.5,
            ),
            blurRadius: 10.5,
          ),
        ],
        // make the border have an elevation that would not affect the overlay color of the image

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(rad ?? 15),
          bottom: Radius.circular(brad ?? 15),
        ),
        border: Border.all(
          color: AppColors.grey,
          width: 0.5,
        ),
        //fit: BoxFit.cover, width: double.infinity,
      ),
      child: Container(
        padding: simPad(15, 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SmallAppText('Show more fixtures'),
                hSpace(10),
                const Icon(
                  Icons.chevron_right,
                  size: 20,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
