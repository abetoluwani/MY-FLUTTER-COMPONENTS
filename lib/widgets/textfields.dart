import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../utils/utils.dart';
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
      this.color,
      this.bordercolor,
      required TextInputAction textInputAction,
      this.fontsize});

  final bool obscureText;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Function? onSaved;
  final Color? color;
  final Color? bordercolor;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: MedAppText(
            label ?? '',
            color: AppColors.black,
            fontSize: 18.sp,
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: bordercolor ?? AppColors.green, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: bordercolor ?? AppColors.grey100, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.grey), // Grey border
                borderRadius: BorderRadius.circular(12),
              ),
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              hintText: hint,
              fillColor: color ?? AppColors.white,
              filled: true,
              labelStyle: const TextStyle(
                  color: AppColors.grey200), // Customize label text color
              hintStyle: const TextStyle(color: AppColors.grey100)),
          style: TextStyle(
              color: AppColors.black,
              fontSize: fontsize ?? 14.sp), // Customize text color
          cursorColor: AppColors.primary, // Customize cursor color
          validator:
              validator, // Use the provided validator function, or it will be null by default
        ),
      ],
    );
  }
}

class NormalAppTextFormField extends StatelessWidget {
  const NormalAppTextFormField(
      {super.key,
      this.obscureText = false,
      this.controller,
      this.hint,
      this.label,
      this.keyboardType,
      this.fontsize,
      this.validator,
      this.onSaved,
      this.color,
      this.bordercolor});

  final bool obscureText;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final Function? onSaved;
  final Color? color;
  final Color? bordercolor;
  final double? fontsize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: MedAppText(
            label ?? '',
            color: AppColors.black,
            fontSize: 18.sp,
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
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: bordercolor ?? AppColors.green, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: bordercolor ?? AppColors.grey100, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.grey), // Grey border

                borderRadius: BorderRadius.circular(12),
              ),
              hintText: hint,
              fillColor: color ?? AppColors.white,
              filled: true,
              labelStyle: const TextStyle(
                  color: AppColors.grey200), // Customize label text color
              hintStyle: const TextStyle(color: AppColors.grey100)),
          style: TextStyle(
              color: AppColors.black,
              fontSize: fontsize ?? 14.sp), // Customize text color
          cursorColor: AppColors.primary, // Customize cursor color
          validator:
              validator, // Use the provided validator function, or it will be null by default
        ),
      ],
    );
  }
}

class AppPhoneTextField extends StatelessWidget {
  const AppPhoneTextField({
    super.key,
    this.label,
    this.obscureText = false,
    this.controller,
    this.readOnly = false,
    this.onChanged,
  });
  final String? label;
  final bool obscureText;
  final TextEditingController? controller;
  final bool readOnly;
  final Function(PhoneNumber)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: MedAppText(
            label ?? '',
            color: AppColors.black,
            fontSize: 18.sp,
          ),
        ),
        vSpace(10),
        IntlPhoneField(
          onChanged: onChanged ??
              (value) => print(value.countryCode + '' + value.number),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          controller: controller,
          decoration: InputDecoration(
              // labelText: 'Phone Number',
              border: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.grey100),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: AppColors.green, width: 1.5),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey100, width: 1.5),
                  borderRadius: BorderRadius.all(Radius.circular(12)))),
          cursorColor: AppColors.green,
          keyboardType: TextInputType.phone,
          initialCountryCode: 'NG',
          showDropdownIcon: true,
        ),
      ],
    );
  }
}
class AppMultiLineTextFormField extends StatelessWidget {
  const AppMultiLineTextFormField({
    super.key,
    this.obscureText = false,
    this.controller,
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.maxLines,
    this.textInputAction,
  });

  final bool obscureText;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final IconButton? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final TextInputAction? textInputAction;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: SmallAppText(
            label ?? '',
            color: AppColors.black,
            fontSize: 16.sp,
          ),
        ),
        vSpace(5),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obscureText,
          controller: controller,
          keyboardType: keyboardType,
          textInputAction: textInputAction,
          maxLines: maxLines,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.grey200), // Grey border
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.primary), // Grey border
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.grey200, fontSize: 12.sp),
            labelStyle: const TextStyle(
                color: AppColors.black), // Customize label text color
          ),
          style:
              const TextStyle(color: AppColors.black), // Customize text color
          cursorColor: AppColors.primary, // Customize cursor color
          validator:
              validator, // Use the provided validator function, or it will be null by default
        ),
      ],
    );
  }
}

class AppRoundedTextFormField extends StatelessWidget {
  const AppRoundedTextFormField({
    super.key,
    this.obscureText = false,
    this.controller,
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.textInputAction,
    this.onChanged,
    this.identifier,
    this.enabled,
    this.onFieldSubmitted,
  });

  final bool obscureText;
  final bool? enabled;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final IconButton? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final String? identifier;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey400,
        borderRadius: BorderRadius.circular(40),
      ),
      child: TextFormField(
        enabled: enabled,
        onChanged: onChanged,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        obscureText: obscureText,

        controller: controller,
        keyboardType: keyboardType,
        textInputAction: textInputAction,

        decoration: InputDecoration(
          isDense: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none, // Grey border
            borderRadius: BorderRadius.circular(40),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(40),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hint,
          hintStyle: TextStyle(color: AppColors.grey200, fontSize: 12.sp),
          labelStyle: const TextStyle(
              color: AppColors.black), // Customize label text color
        ),
        style: const TextStyle(color: AppColors.black), // Customize text color
        cursorColor: AppColors.primary, // Customize cursor color
        onFieldSubmitted: onFieldSubmitted,
        validator:
            validator, // Use the provided validator function, or it will be null by default
      ),
    );
  }
}


class BioField extends StatelessWidget {
  const BioField({
    super.key,
    this.label,
    this.fontsize,
    this.validator,
    this.hint,
    this.bordercolor,
  });
  final double? fontsize;
  final FormFieldValidator<String>? validator;
  final String? label, hint;
  final Color? bordercolor;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Visibility(
          visible: label != null,
          child: MedAppText(
            label ?? '',
            color: AppColors.black,
            fontSize: 18.sp,
          ),
        ),
        vSpace(10),
        TextField(
          decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: bordercolor ?? AppColors.primary, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: bordercolor ?? AppColors.grey100, width: 1.5),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.grey), // Grey border
                borderRadius: BorderRadius.circular(12),
              ),
              hintText: hint ?? "Send us a message",
              fillColor: AppColors.white,
              filled: true,
              // Use the provided validator function, or it
              labelStyle: const TextStyle(
                  color: AppColors.grey200), // Customize label text color
              hintStyle: const TextStyle(color: AppColors.grey100)),
          cursorColor: AppColors.primary,
          minLines: 3, // Set this
          maxLines: 10, // and this
          keyboardType: TextInputType.multiline,
        ),
      ],
    );
  }
}
