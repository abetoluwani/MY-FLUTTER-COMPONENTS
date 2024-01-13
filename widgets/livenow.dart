import 'package:flutter/material.dart';
import '../theme/colors.dart';
import 'apptext.dart';
import 'space.dart';

class LiveNow extends StatelessWidget {
  const LiveNow(
      {super.key,
      required this.image,
      required this.time,
      required this.club1,
      required this.club1name,
      required this.club2,
      required this.club2name,
      required this.club1score,
      required this.club2score
      //required this.onTap,
      });

  final String image;
  final String time;
  final String club1;
  final String club1name;
  final String club2;
  final String club2name;
  final String club1score;
  final String club2score;
  // final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: onTap(),
      child: Container(
        width: 300,
        height: 150,
        padding: simPad(10, 15),
        decoration: BoxDecoration(
          color: AppColors.white,
          boxShadow: const [
            BoxShadow(
              color: AppColors.black,
              offset: Offset(
                0.5,
                1.0,
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
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  image,
                  height: 30,
                ),
                MedAppText(
                  "$time'",
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                )
              ],
            ),
            vSpace(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      club1,
                      height: 50,
                    ),
                    SmallAppText(
                      club1name,
                    )
                  ],
                ),
                hSpace(20),
                BigAppText(club1score),
                hSpace(10),
                BigAppText(
                  '-',
                ),
                hSpace(10),
                BigAppText(club2score),
                hSpace(20),
                Column(
                  children: [
                    Image.asset(
                      club2,
                      height: 50,
                    ),
                    SmallAppText(
                      club2name,
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
