import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_places_autocomplete_text_field/google_places_autocomplete_text_field.dart';
import 'package:google_places_autocomplete_text_field/model/prediction.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../logging/app_logger.dart';
import '../utils/constants/app_constants.dart';
import '../theme/colors.dart';
import 'apptext.dart';
import 'space.dart';

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

class AppTextFormField extends StatelessWidget {
  const AppTextFormField({
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
    this.borderRadius,
    this.onFieldSubmitted,
  });

  final bool obscureText;
  final bool? enabled;
  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final String? identifier;
  final double? borderRadius;

  final void Function(String)? onFieldSubmitted;
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
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
          ),
          child: TextFormField(
            enabled: enabled,
            onFieldSubmitted: onFieldSubmitted,
            onChanged: onChanged,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            obscureText: obscureText,
            controller: controller,
            keyboardType: keyboardType,

            textInputAction: textInputAction ?? TextInputAction.next,
            decoration: InputDecoration(
              isDense: true,
              contentPadding: simPad(15, 15),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.grey), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.primary), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.grey.withAlpha(100)), // Grey border
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

// ignore: must_be_immutable
class GooglePlacesTextFormField extends StatelessWidget {
  GooglePlacesTextFormField({
    super.key,
    this.obscureText,
    required this.controller,
    this.hint,
    this.label,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.validator,
    this.hasBgColor,
    this.getPlaceDetailWithLatLng,
    this.textInputAction,
  });

  final bool? obscureText;
  final TextEditingController controller;
  final String? hint;
  final String? label;
  bool? hasBgColor;
  final IconButton? prefixIcon;
  final IconButton? suffixIcon;
  final TextInputType? keyboardType;
  final FormFieldValidator<String>? validator;
  void Function(Prediction)? getPlaceDetailWithLatLng;
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
        vSpace(10),
        Container(
          color: hasBgColor == true ? AppColors.white : null,
          child: GooglePlacesAutoCompleteTextFormField(
            scrollPhysics: const BouncingScrollPhysics(),
            textEditingController: controller,
            googleAPIKey: AppConstants.googleMapsApiKey,
            debounceTime: 400, // defaults to 600 ms,
            // countries: const [
            //   "nga",
            //   "cy"
            // ], // optional, by default the list is empty (no restrictions)
            isLatLngRequired:
                true, // if you require the coordinates from the place details
            getPlaceDetailWithLatLng:
                getPlaceDetailWithLatLng, // this callback is called when isLatLngRequired is true
            itmClick: (prediction) {
              if (prediction.description != null) {
                controller.text = prediction.description!;
                controller.selection = TextSelection.fromPosition(
                  TextPosition(
                    offset: prediction.description!.length,
                  ),
                );
              }
         },   
            //  InputDecoration(
            //   border: OutlineInputBorder(
            //     borderSide:
            //         const BorderSide(color: AppColors.grey), // Grey border
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   focusedBorder: OutlineInputBorder(
            //     borderSide:
            //         const BorderSide(color: AppColors.primary), // Grey border
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   enabledBorder: OutlineInputBorder(
            //     borderSide: BorderSide(
            //         color: AppColors.grey.withAlpha(100)), // Grey border
            //     borderRadius: BorderRadius.circular(10),
            //   ),
            //   prefixIcon: prefixIcon,

            //   suffixIcon: suffixIcon,
            //   hintText: hint,
            //   hintStyle: TextStyle(color: AppColors.grey200, fontSize: 12.sp),
            //   labelStyle: const TextStyle(
            //       color: AppColors.black), // Customize label text color
            // ),
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.grey), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.primary), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.grey.withAlpha(100)), // Grey border
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
          ),
        ),
      ],
    );
  }
}

class PhoneNumberTextFormField extends StatelessWidget {
  const PhoneNumberTextFormField({
    super.key,
    this.controller,
    this.hint,
    this.label,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final String? hint;
  final String? label;
  final void Function(String)? onSubmitted;

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
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              appLog(number.phoneNumber);
            },
            onInputValidated: (bool value) {
              appLog(value);
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.DROPDOWN,
              leadingPadding: 0,
              trailingSpace: false,
              setSelectorButtonAsPrefixIcon: true,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.onUserInteraction,
            selectorTextStyle: const TextStyle(color: AppColors.black),
            initialValue: PhoneNumber(isoCode: 'NG'),
            textFieldController: controller,
            formatInput: false,
            onFieldSubmitted: onSubmitted,
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputBorder: OutlineInputBorder(
              borderSide:
                  const BorderSide(color: AppColors.grey), // Grey border
              borderRadius: BorderRadius.circular(10),
            ),
            onSaved: (PhoneNumber number) {
              appLog('On Saved: $number');
            },
            inputDecoration: InputDecoration(
              isDense: true,
              contentPadding: simPad(15, 15),
              border: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.grey), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.primary), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: AppColors.grey.withAlpha(100)), // Grey border
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Enter your phone number',
              hintStyle: TextStyle(color: AppColors.grey200, fontSize: 12.sp),
              labelStyle: const TextStyle(
                  color: AppColors.black), // Customize label text color
            ),
          ),
        ),
      ],
    );
  }
}
