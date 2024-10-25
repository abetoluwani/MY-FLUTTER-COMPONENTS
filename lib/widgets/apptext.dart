// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/theme/colors.dart';

class SmallAppText extends StatelessWidget {
  SmallAppText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.alignment,
    this.maxLines,
  });
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? alignment;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 99999,
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
  MedAppText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.alignment,
    this.maxLines,
    this.textStyle,
  });
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextAlign? alignment;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 99999,
      textAlign: alignment,
      style: textStyle ??
          GoogleFonts.outfit(
            color: color ?? AppColors.black,
            fontSize: fontSize ?? 18.sp,
            fontWeight: fontWeight ?? FontWeight.normal,
          ),
    );
  }
}

class BigAppText extends StatelessWidget {
  BigAppText(
    this.data, {
    super.key,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.alignment,
    this.maxLines,
  });
  String data;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final TextAlign? alignment;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines ?? 99999,
      textAlign: alignment,
      style: GoogleFonts.outfit(
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 20.sp,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
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
