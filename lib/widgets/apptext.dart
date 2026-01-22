// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/utils.dart';

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
      style: GoogleFonts.poppins(
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 14.sp,
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
      style:
          textStyle ??
          GoogleFonts.poppins(
            color: color ?? AppColors.black,
            fontSize: fontSize ?? 16.sp,
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
      style: GoogleFonts.poppins(
        color: color ?? AppColors.black,
        fontSize: fontSize ?? 18.sp,
        fontWeight: fontWeight ?? FontWeight.bold,
      ),
    );
  }
}

enum Currency { naira, tl }

class PriceText extends StatelessWidget {
  final String price;
  final Color? color;
  final double? fontSize;
  final int? maxLines;
  final TextAlign? textAlign;
  final Currency currency;
  final bool? isProfit;
  final bool showDecimals;

  const PriceText({
    super.key,
    this.fontSize,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
    required this.price,
    this.color,
    this.currency = Currency.tl,
    this.isProfit,
    this.showDecimals = true,
  });

  String get currencySymbol {
    switch (currency) {
      case Currency.naira:
        return '₦';
      case Currency.tl:
        return '₺';
    }
  }

  String _formatNumber(String price) {
    // Handle empty or null price
    if (price.isEmpty) return '0';

    // Convert to double and handle invalid numbers
    double? numPrice = double.tryParse(price);
    if (numPrice == null) return price;

    // Split the number into whole and decimal parts
    String wholeNumber = numPrice.truncate().toString();
    String decimal = (numPrice - numPrice.truncate()).toStringAsFixed(2);

    // Only add decimal if it's not .00
    decimal = decimal == '0.00' ? '' : decimal.substring(1);

    // Format the whole number with commas
    final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    String formatted = wholeNumber.replaceAllMapped(
      reg,
      (Match match) => '${match[1]},',
    );

    // Return formatted number with decimal if present
    return showDecimals ? formatted + decimal : formatted;
  }

  @override
  Widget build(BuildContext context) {
    // Remove any existing + or - from the price
    String cleanPrice = price.replaceAll(RegExp(r'[+-]'), '').trim();

    // Format the number with commas and decimal places
    String formattedNumber = _formatNumber(cleanPrice);

    // Add the profit/loss indicator if isProfit is specified
    String indicator = '';
    if (isProfit != null) {
      indicator = isProfit! ? '+ ' : '- ';
    }

    String formattedPrice = '$indicator$currencySymbol $formattedNumber';
    if (formattedPrice.length > 20) {
      formattedPrice = '${formattedPrice.substring(0, 20)}...';
    }

    return Text(
      formattedPrice,
      style: fontSize != null
          ? Theme.of(context).textTheme.titleMedium!.copyWith(
              fontSize: fontSize,
              color: color ?? AppColors.white,
              overflow: TextOverflow.ellipsis,
            )
          : Theme.of(context).textTheme.titleMedium!.apply(
              color: color ?? AppColors.white,
              overflow: TextOverflow.ellipsis,
            ),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class SlashedPriceText extends StatelessWidget {
  const SlashedPriceText({
    super.key,
    this.currency = '₺',
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
              decoration: TextDecoration.lineThrough,
              color: AppColors.grey,
            )
          : Theme.of(context).textTheme.headlineLarge!.apply(
              decoration: TextDecoration.lineThrough,
              color: AppColors.grey,
            ),
    );
  }
}

class BrandNameText extends StatelessWidget {
  const BrandNameText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.start,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelMedium
          : Theme.of(context).textTheme.titleLarge!.apply(fontWeightDelta: 2),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key,
    required this.title,
    this.smallSize = false,
    this.maxLines = 1,
    this.textAlign = TextAlign.left,
  });

  final String title;
  final bool smallSize;
  final int maxLines;
  final TextAlign textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: smallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
    );
  }
}

class ImportantAppText extends StatelessWidget {
  ImportantAppText(
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
    return Row(
      children: [
        Text(
          data,
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines ?? 99999,
          textAlign: alignment,
          style: GoogleFonts.poppins(
            color: color ?? AppColors.black,
            fontSize: fontSize ?? 20.sp,
            fontWeight: fontWeight ?? FontWeight.bold,
          ),
        ),
        SmallAppText(
          '*',
          color: AppColors.red,
          fontSize: fontSize ?? 22.sp,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
