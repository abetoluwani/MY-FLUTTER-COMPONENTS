import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/theme/colors.dart';
import 'apptext.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    //required String text,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.r),
        ),
      ),
      child: SmallAppText(
        title,
        color: AppColors.white,
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    this.onPressed,
    required this.title,
  });
  final void Function()? onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        side: const BorderSide(width: 1.0, color: AppColors.primary),
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: SmallAppText(
        title,
        color: AppColors.primary,
      ),
    );
  }
}

class NormalElevatedButton extends StatelessWidget {
  const NormalElevatedButton({
    super.key,
    required this.title,
    this.onPressed,
    this.color,
    this.txtcolor,
    this.padding,
    this.radius,
  });
  final String title;
  final void Function()? onPressed;
  final Color? color, txtcolor;
  final EdgeInsetsGeometry? padding;
  final double? radius;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          backgroundColor: color ?? AppColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 24.r),
          ),
        ),
        onPressed: onPressed,
        child: SmallAppText(
          title,
          color: txtcolor ?? AppColors.white,
        ));
  }
}


class AppSecondaryElevatedButton extends StatelessWidget {
  const AppSecondaryElevatedButton(
      {super.key, required this.label, this.onPressed});
  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.disabledPrimary,
            padding: simPad(0, 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0,
            disabledBackgroundColor: AppColors.disabledPrimary),
        onPressed: onPressed,
        child: SmallAppText(
          label,
          color: AppColors.primaryDark,
        ),
      ),
    );
  }
}