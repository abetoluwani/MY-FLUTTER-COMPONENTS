import 'package:flutter/widgets.dart';
import 'apptext.dart';
import 'space.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  final String image;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          height: 300,
          width: 300,
        ),
        vSpace(50),
        BigAppText(
          title,
          textAlign: TextAlign.center,
        ),
        vSpace(10),
        SmallAppText(
          description,
          alignment: TextAlign.center,
        )
      ],
    );
  }
}
