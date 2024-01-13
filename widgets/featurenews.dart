import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'apptext.dart';
import 'space.dart';

class FeaturedNews extends StatelessWidget {
  const FeaturedNews({
    super.key,
    required this.category,
    required this.title,
    required this.image,
    //required this.onTap,
  });

  final String category;
  final String title;

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
            width: double.infinity,
            height: 200.0,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black, width: 0.5),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ), //fit: BoxFit.cover, width: double.infinity,
            ),
          ),
          vSpace(5),
          SmallAppText(
            category,
            fontWeight: FontWeight.bold,
          ),
          vSpace(5),
          MedAppText(
            title,
            fontSize: 25.0,
          ),
        ],
      ),
    );
  }
}
