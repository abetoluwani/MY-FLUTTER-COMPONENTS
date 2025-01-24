import 'package:flutter/material.dart';

class AppSizes {
  // Define static fields for sizes
  static late double xs, sm, md, lg, xl;
  static late double iconXs, iconSm, iconMd, iconLg;
  static late double buttonHeight, buttonWidth, buttonRadius, buttonElevation;
  static late double imageThumbSize,
      defaultSpace,
      spaceBTWitems,
      spaceBtwSections;
  static late double borderRadiusSm, borderRadiusMd, borderRadiusLg;
  static late double inputFieldRadius, spaceBtwInputFields;
  static late double cardRadiusLg,
      cardRadiusMd,
      cardRadiusSm,
      cardRadiusXs,
      cardElevation;
  static late double imageCarouselHeight, loadingIndicatorSize, gridViewSpacing;
  static late double productImageSize, productImageRadius, productItemHeight;

  // Initialization method
  static void initialize(BuildContext context) {
    // Get screen dimensions
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    // Compute responsive sizes based on screen dimensions
    // General padding and spacing
    xs = width * 0.01; // 1% of screen width
    sm = width * 0.02; // 2% of screen width
    md = width * 0.04; // 4% of screen width
    lg = width * 0.06; // 6% of screen width
    xl = width * 0.08; // 8% of screen width

    // Icon sizes
    iconXs = width * 0.03; // 3% of screen width
    iconSm = width * 0.04; // 4% of screen width
    iconMd = width * 0.06; // 6% of screen width
    iconLg = width * 0.08; // 8% of screen width

    // Button dimensions
    buttonHeight = height * 0.06; // 6% of screen height
    buttonWidth = width * 0.4; // 40% of screen width
    buttonRadius = width * 0.03; // 3% of screen width
    buttonElevation = height * 0.005; // 0.5% of screen height

    // Image sizes
    imageThumbSize = width * 0.2; // Thumbnail size is 20% of screen width
    imageCarouselHeight =
        height * 0.25; // Carousel height is 25% of screen height
    productImageSize = width * 0.3; // Product image is 30% of screen width
    productImageRadius = width * 0.04; // 4% of screen width

    // Spacing
    defaultSpace = height * 0.03; // 3% of screen height
    spaceBTWitems = height * 0.02; // 2% of screen height
    spaceBtwSections = height * 0.04; // 4% of screen height
    spaceBtwInputFields = height * 0.02; // 2% of screen height

    // Borders and radii
    borderRadiusSm = width * 0.01; // 1% of screen width
    borderRadiusMd = width * 0.02; // 2% of screen width
    borderRadiusLg = width * 0.04; // 4% of screen width
    inputFieldRadius = width * 0.03; // 3% of screen width
    cardRadiusXs = width * 0.015; // 1.5% of screen width
    cardRadiusSm = width * 0.025; // 2.5% of screen width
    cardRadiusMd = width * 0.03; // 3% of screen width
    cardRadiusLg = width * 0.04; // 4% of screen width
    cardElevation = height * 0.005; // 0.5% of screen height

    // Grid and item spacing
    gridViewSpacing = width * 0.04; // 4% of screen width
    productItemHeight = height * 0.2; // 20% of screen height

    // Loading indicator size
    loadingIndicatorSize = width * 0.09; // 9% of screen width
  }
}
  