// ignore_for_file: must_be_immutable, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';
import '../utils/utils.dart';

class OTPTextField extends StatelessWidget {
  OTPTextField({super.key, this.controller, this.focusNode, this.onCompleted});

  Color borderColor = AppColors.primary;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final void Function(String)? onCompleted;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: AppColors.primary, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.grey),
        borderRadius: BorderRadius.circular(15),
      ),
    );

    final cursor = Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          width: 56.w,
          height: 2.h,
          decoration: BoxDecoration(
            color: borderColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ],
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: AppColors.primary),
      borderRadius: BorderRadius.circular(15),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primary),
      ),
    );

    return Pinput(
      focusedPinTheme: focusedPinTheme,
      onCompleted: onCompleted,
      submittedPinTheme: submittedPinTheme,
      length: 6,
      pinAnimationType: PinAnimationType.slide,
      controller: controller,
      focusNode: focusNode,
      defaultPinTheme: defaultPinTheme,
      showCursor: true,
      keyboardType: TextInputType.none,
      // cursor: cursor,
      // preFilledWidget: preFilledWidget,
    );
  }
}

// Helper class to disable keyboard focus
class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
