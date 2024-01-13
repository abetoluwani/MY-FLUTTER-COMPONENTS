import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import 'apptext.dart';
import 'space.dart';

class AppTextFormField extends StatelessWidget {
  const AppTextFormField(
      {super.key,
      this.obscureText = false,
      this.controller,
      this.hint,
      this.label,
      this.prefixIcon,
      this.suffixIcon,
      this.keyboardType,
      this.validator,
      this.onSaved,
      this.color});

  final bool obscureText;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final IconButton? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Function? onSaved;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: BigAppText(
            label ?? '',
            color: AppColors.black,
            fontSize: 14.sp,
          ),
        ),
        vSpace(10),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          onSaved: onSaved as void Function(String?)?,

          decoration: InputDecoration(
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.black, width: 1.0),
            ),
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.grey), // Grey border

              borderRadius: BorderRadius.circular(5),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hint,
            fillColor: color ?? AppColors.white,
            filled: true,

            labelStyle: const TextStyle(
                color: AppColors.black), // Customize label text color
          ),
          style: const TextStyle(
            color: AppColors.black,
          ), // Customize text color
          cursorColor: AppColors.primary, // Customize cursor color
          validator:
              validator, // Use the provided validator function, or it will be null by default
        ),
      ],
    );
  }
}
