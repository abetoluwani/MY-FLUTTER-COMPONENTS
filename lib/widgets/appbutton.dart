import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/utils.dart';
import 'widget.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    super.key,
    this.onPressed,
    //required String text,
    this.title,
    this.child,
    this.bgColor,
    this.textColor,
  });
  final void Function()? onPressed;
  final String? title;
  final Widget? child;
  final Color? bgColor;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: bgColor ?? AppColors.primary,
        foregroundColor: textColor ?? AppColors.white,
        minimumSize: Size(double.infinity, 50.h),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
      child: child ??
          SmallAppText(
            title ?? "",
            color: textColor ?? AppColors.white,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp,
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
          minimumSize: Size(double.infinity, 50.h),
          padding: padding ??
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          backgroundColor: color ?? AppColors.primaryDark,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius ?? 10.r),
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
            backgroundColor: AppColors.white,
            padding: simPad(0, 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 0,
            disabledBackgroundColor: AppColors.white),
        onPressed: onPressed,
        child: SmallAppText(
          label,
          color: AppColors.primary,
        ),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({
    super.key,
    this.label,
    this.bgColor,
    this.brdColor,
    this.hideBorder,
    this.onPressed,
    this.child,
    this.buttonHeight,
    this.textcolour,
  });

  /// Does something fun with the [funParameter].
  final String? label;
  final Color? bgColor;
  final Color? textcolour;
  //Border Color
  final Color? brdColor;
  final Widget? child;
  final double? buttonHeight;
  final bool? hideBorder;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: buttonHeight ?? 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor ?? Colors.transparent,
          side: hideBorder == null
              ? BorderSide(width: 1.0, color: brdColor ?? AppColors.primary)
              : null,
          padding: simPad(0, 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 0,
        ),
        onPressed: onPressed ?? () {},
        child: child ??
            SmallAppText(
              label ?? '',
              color: textcolour ?? AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class ConfigElevatedButton extends StatelessWidget {
  const ConfigElevatedButton({
    super.key,
    this.width,
    this.height,
    this.onPressed,
    required this.label,
    this.bgcolour,
    this.textcolour,
    this.radius,
  });
  final double? width, height;
  final void Function()? onPressed;
  final String label;
  final Color? bgcolour, textcolour;
  final BorderRadiusGeometry? radius;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppHelpers.screenWidth() * 0.40,
      height: height ?? 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgcolour ?? AppColors.primary,
            padding: simPad(0, 14),
            shape: RoundedRectangleBorder(
              borderRadius: radius ?? BorderRadius.circular(10.0),
            ),
            elevation: 0,
            disabledBackgroundColor: AppColors.primary),
        onPressed: onPressed ?? () {},
        child: SmallAppText(
          label,
          color: textcolour ?? AppColors.white,
        ),
      ),
    );
  }
}

class ConfigOutlinedButton extends StatelessWidget {
  const ConfigOutlinedButton({
    super.key,
    this.width,
    this.height,
    this.onPressed,
    required this.label,
    this.brdcolour,
    this.textcolour,
    this.bgColour,
  });
  final double? width, height;
  final void Function()? onPressed;
  final String label;
  final Color? brdcolour;
  final Color? textcolour, bgColour;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? AppHelpers.screenWidth() * 0.40,
      height: height ?? 50.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: bgColour ?? AppColors.white,
            padding: simPad(0, 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: brdcolour ?? AppColors.grey200),
            ),
            elevation: 0,
            disabledBackgroundColor: AppColors.white),
        onPressed: onPressed ?? () {},
        child: SmallAppText(
          label,
          color: textcolour ?? AppColors.black,
        ),
      ),
    );
  }
}
