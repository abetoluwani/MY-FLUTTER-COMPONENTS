
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../theme/colors.dart';
import 'apptext.dart';
import 'space.dart';

class FavouriteWidget extends StatelessWidget {
  const FavouriteWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  final String title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Handle tap gesture here (e.g., navigate to another page)
        if (kDebugMode) {
          print('Favourite container tapped!');
        }
      },
      //  main container
      child: Container(
        padding: simPad(5, 20),
        child: Center(
          child: Container(
            padding: simPad(0, 15),
            width: double.infinity,
            height: 100.h,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: AppColors.black,
                  offset: Offset(
                    0.4,
                    0.5,
                  ),
                  blurRadius: 4.5,
                ),
              ],
              color: AppColors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 0.5,
              ),
            ),
            // Inner container with the icon
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 80.w,
                  height: 80.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.transparent,
                    image: DecorationImage(
                        image: AssetImage(image), fit: BoxFit.cover),
                  ),
                ),
                hSpace(30),
                // header text and description
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.h,
                      child: BigAppText(
                        title,
                        fontSize: 20,
                      ),
                    ),
                    vSpace(5),
                    SizedBox(
                      width: 150.h,
                      child: SmallAppText(
                        subtitle,
                        color: AppColors.grey,
                        fontSize: 15,
                      ),
                    ),
                    vSpace(10),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: AppColors.primary,
                          size: 18,
                        ),
                        hSpace(5),
                        SmallAppText('20km'),
                        hSpace(10),
                        const Icon(
                          Icons.star,
                          color: Colors.yellow,
                          size: 18,
                        ),
                        hSpace(5),
                        SmallAppText('4.2'),
                      ],
                    )
                  ],
                ),
                hSpace(10),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (kDebugMode) {
                          print('Delete Tapped!');
                        }
                      },
                      child: const Icon(
                        Icons.bookmark_border_outlined,
                        color: AppColors.primary,
                        size: 25,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
