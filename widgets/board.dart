import 'package:flutter/material.dart';
import 'space.dart';
import '../theme/colors.dart';
import 'apptext.dart';

class LeagueBoard extends StatelessWidget {
  const LeagueBoard({
    super.key,
    this.rad,
    this.brad,
    required this.club1name,
    required this.club2name,
    required this.club1image,
    required this.club2image,
    required this.time,
    required this.club1score,
    required this.club2score,
  });

  final double? rad;
  final double? brad;
  final String club1name;
  final String club2name;
  final String club1image;
  final String club2image;
  final String time;
  final String club1score;
  final String club2score;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
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
            blurRadius: 10,
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
        padding: simPad(10, 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // the club image and name
                Row(
                  children: [
                    Image.asset(
                      club1image,
                      height: 30,
                    ),
                    hSpace(10),
                    SmallAppText(
                      club1name,
                    )
                  ],
                ),
                vSpace(10),
                Row(
                  children: [
                    Image.asset(
                      club2image,
                      height: 30,
                    ),
                    hSpace(10),
                    SmallAppText(club2name)
                  ],
                ),
              ],
            ),
            const Spacer(), // the time
            SmallAppText(
              "$time'",
            ),
            hSpace(20),

            // the score
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SmallAppText(
                  club1score,
                  fontWeight: FontWeight.bold,
                ),
                SmallAppText(
                  club2score,
                  fontWeight: FontWeight.bold,
                ), // the score
              ],
            )
          ],
        ),
      ),
    );
  }
}
