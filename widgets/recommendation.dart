
import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'apptext.dart';
import 'space.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    //required this.onTap,
  });

  final String title;
  final String subtitle;
  final String image;
  // final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 158,
            height: 175.0,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit
                      .cover), //fit: BoxFit.cover, width: double.infinity,
            ),
          ),
          vSpace(5),
          SizedBox(
            width: 156.0,
            height: 100.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigAppText(
                  title,
                  color: AppColors.primary,
                ),
                vSpace(5),
                SmallAppText(
                  subtitle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
