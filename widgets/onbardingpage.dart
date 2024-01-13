import 'package:flutter/material.dart';
import 'appbutton.dart';
import 'apptext.dart';
import 'space.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    super.key,
    required this.image,
    required this.text1,
    required this.buttontext,
    required this.onPressed,
  });

  
  final AssetImage? image;
  final String? text1;
  final String? buttontext;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 6,
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: image ??
                        const AssetImage('assets/images/onboarding1.png'),
                    fit: BoxFit.cover)),
          ),
        ),
        vSpace(50),
        Expanded(
          flex: 1,
          child: Container(
            padding: simPad(0, 20),
            child: BigAppText(
              text1 ?? 'Great Look Isn`t By Accident but by Appointment',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        vSpace(10),
        Container(
          padding: simPad(36, 30),
          child: AppElevatedButton(
              title: buttontext ?? 'Continue',
              onPressed: () {
                onPressed();
              }),
        )
      ],
    );
  }
}
