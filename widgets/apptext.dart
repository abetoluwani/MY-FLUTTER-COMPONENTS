// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/colors.dart';

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
