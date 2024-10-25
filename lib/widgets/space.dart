import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget vSpace(double height) {
  return SizedBox(
    height: height.h,
  );
}

Widget hSpace(double width) {
  return SizedBox(
    width: width.w,
  );
}

EdgeInsetsGeometry simPad(double v, double h) {
  return EdgeInsets.symmetric(vertical: v.h, horizontal: h.h);
}
