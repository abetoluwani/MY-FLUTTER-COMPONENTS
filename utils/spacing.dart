import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

EdgeInsetsGeometry simPad(double h, double v) {
  //NOTE - THIS IS A SYMMETRIC PADDING
  return EdgeInsets.symmetric(
    horizontal: h,
    vertical: v,
  );
}

Widget vSpace(double h) {
  //NOTE - THIS IS VERTICAL SPACING
  return SizedBox(
    height: h.h,
  );
}

Widget hSpace(double w) {
  return SizedBox(
    //NOTE - THIS IS HORIZONTAL SPACING
    width: w.w,
  );
}
