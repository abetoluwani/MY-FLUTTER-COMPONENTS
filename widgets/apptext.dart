// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/theme/colors.dart';

class SmallAppText extends StatelessWidget {
  SmallAppText(this.data,
      {super.key, this.color, this.fontSize, this.fontWeight, this.alignment});
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? alignment;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: alignment,
      style: GoogleFonts.figtree(
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 15.sp,
        fontWeight: fontWeight,
      ),
    );
  }
}

class MedAppText extends StatelessWidget {
  MedAppText(this.data,
      {super.key, this.color, this.fontSize, this.fontWeight, this.textAlign});
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.figtree(
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.normal,
      ),
      textAlign: textAlign,
    );
  }
}

class BigAppText extends StatelessWidget {
  BigAppText(this.data,
      {super.key, this.color, this.fontSize, this.fontWeight, this.textAlign});
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: GoogleFonts.figtree(
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 25.sp,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
      textAlign: textAlign ?? TextAlign.left,
    );
  }
}

class TitleTextEllipsis extends StatelessWidget {
  const TitleTextEllipsis({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.titleMedium
          : Theme.of(context).textTheme.headlineSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class MaxLineText extends StatelessWidget {
  const MaxLineText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 2,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.titleMedium,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class PriceText extends StatelessWidget {
  const PriceText({
    super.key,
    this.currency = '\$',
    this.smallSize = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    required this.price,
    this.color,
  });

  final String price, currency;
  final bool smallSize;
  final int maxLines;
  final TextAlign textAlign;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Text(
      currency + price,
      style: smallSize
          ? Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: color ?? AppColors.black)
          : Theme.of(context)
              .textTheme
              .titleMedium!
              .apply(color: color ?? AppColors.black),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class SlashedPriceText extends StatelessWidget {
  const SlashedPriceText({
    super.key,
    this.currency = '\$',
    this.smallSize = true,
    required this.price,
  });

  final String price, currency;
  final bool smallSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      currency + price,
      style: smallSize
          ? Theme.of(context).textTheme.titleMedium!.apply(
              decoration: TextDecoration.lineThrough, color: AppColors.grey)
          : Theme.of(context).textTheme.headlineLarge!.apply(
              decoration: TextDecoration.lineThrough, color: AppColors.grey),
    );
  }
}
