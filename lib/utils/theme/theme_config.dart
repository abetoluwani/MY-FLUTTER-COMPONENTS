import 'package:flutter/material.dart';

/// Configuration class for customizing Swiss Army Component theme colors.
///
/// Pass custom colors to override defaults. Any null values will use the default colors.
///
/// Example:
/// ```dart
/// final config = SACThemeConfig(
///   primary: Colors.blue,
///   secondary: Colors.amber,
/// );
///
/// MaterialApp(
///   theme: SACTheme.light(config),
///   darkTheme: SACTheme.dark(config),
/// );
/// ```
class SACThemeConfig {
  /// Primary brand color
  final Color? primary;

  /// Primary color for light mode (overrides [primary] when set)
  final Color? primaryLight;

  /// Primary color for dark mode (overrides [primary] when set)
  final Color? primaryDark;

  /// Secondary brand color
  final Color? secondary;

  /// Secondary color for light mode (overrides [secondary] when set)
  final Color? secondaryLight;

  /// Secondary color for dark mode (overrides [secondary] when set)
  final Color? secondaryDark;

  /// Error color (used for validation, alerts)
  final Color? error;

  /// Error color for light mode (overrides [error] when set)
  final Color? errorLight;

  /// Error color for dark mode (overrides [error] when set)
  final Color? errorDark;

  /// Success/green color
  final Color? success;

  /// Success color for light mode (overrides [success] when set)
  final Color? successLight;

  /// Success color for dark mode (overrides [success] when set)
  final Color? successDark;

  // Light theme colors
  final Color? backgroundLight;
  final Color? surfaceLight;
  final Color? borderLight;
  final Color? textPrimaryLight;
  final Color? textMutedLight;

  // Dark theme colors
  final Color? backgroundDark;
  final Color? surfaceDark;
  final Color? borderDark;
  final Color? textPrimaryDark;
  final Color? textMutedDark;

  // Additional brand colors
  final Color? lightRed;
  final Color? purple;
  final Color? grey;
  final Color? darkGrey;

  const SACThemeConfig({
    this.primary,
    this.primaryLight,
    this.primaryDark,
    this.secondary,
    this.secondaryLight,
    this.secondaryDark,
    this.error,
    this.errorLight,
    this.errorDark,
    this.success,
    this.successLight,
    this.successDark,
    this.backgroundLight,
    this.surfaceLight,
    this.borderLight,
    this.textPrimaryLight,
    this.textMutedLight,
    this.backgroundDark,
    this.surfaceDark,
    this.borderDark,
    this.textPrimaryDark,
    this.textMutedDark,
    this.lightRed,
    this.purple,
    this.grey,
    this.darkGrey,
  });

  /// Returns a new config overriding selected fields.
  SACThemeConfig copyWith({
    Color? primary,
    Color? primaryLight,
    Color? primaryDark,
    Color? secondary,
    Color? secondaryLight,
    Color? secondaryDark,
    Color? error,
    Color? errorLight,
    Color? errorDark,
    Color? success,
    Color? successLight,
    Color? successDark,
    Color? backgroundLight,
    Color? surfaceLight,
    Color? borderLight,
    Color? textPrimaryLight,
    Color? textMutedLight,
    Color? backgroundDark,
    Color? surfaceDark,
    Color? borderDark,
    Color? textPrimaryDark,
    Color? textMutedDark,
    Color? lightRed,
    Color? purple,
    Color? grey,
    Color? darkGrey,
  }) {
    return SACThemeConfig(
      primary: primary ?? this.primary,
      primaryLight: primaryLight ?? this.primaryLight,
      primaryDark: primaryDark ?? this.primaryDark,
      secondary: secondary ?? this.secondary,
      secondaryLight: secondaryLight ?? this.secondaryLight,
      secondaryDark: secondaryDark ?? this.secondaryDark,
      error: error ?? this.error,
      errorLight: errorLight ?? this.errorLight,
      errorDark: errorDark ?? this.errorDark,
      success: success ?? this.success,
      successLight: successLight ?? this.successLight,
      successDark: successDark ?? this.successDark,
      backgroundLight: backgroundLight ?? this.backgroundLight,
      surfaceLight: surfaceLight ?? this.surfaceLight,
      borderLight: borderLight ?? this.borderLight,
      textPrimaryLight: textPrimaryLight ?? this.textPrimaryLight,
      textMutedLight: textMutedLight ?? this.textMutedLight,
      backgroundDark: backgroundDark ?? this.backgroundDark,
      surfaceDark: surfaceDark ?? this.surfaceDark,
      borderDark: borderDark ?? this.borderDark,
      textPrimaryDark: textPrimaryDark ?? this.textPrimaryDark,
      textMutedDark: textMutedDark ?? this.textMutedDark,
      lightRed: lightRed ?? this.lightRed,
      purple: purple ?? this.purple,
      grey: grey ?? this.grey,
      darkGrey: darkGrey ?? this.darkGrey,
    );
  }

  /// Merges this config with another, giving priority to the other config's non-null values
  SACThemeConfig merge(SACThemeConfig? other) {
    if (other == null) return this;
    return SACThemeConfig(
      primary: other.primary ?? primary,
      primaryLight: other.primaryLight ?? primaryLight,
      primaryDark: other.primaryDark ?? primaryDark,
      secondary: other.secondary ?? secondary,
      secondaryLight: other.secondaryLight ?? secondaryLight,
      secondaryDark: other.secondaryDark ?? secondaryDark,
      error: other.error ?? error,
      errorLight: other.errorLight ?? errorLight,
      errorDark: other.errorDark ?? errorDark,
      success: other.success ?? success,
      successLight: other.successLight ?? successLight,
      successDark: other.successDark ?? successDark,
      backgroundLight: other.backgroundLight ?? backgroundLight,
      surfaceLight: other.surfaceLight ?? surfaceLight,
      borderLight: other.borderLight ?? borderLight,
      textPrimaryLight: other.textPrimaryLight ?? textPrimaryLight,
      textMutedLight: other.textMutedLight ?? textMutedLight,
      backgroundDark: other.backgroundDark ?? backgroundDark,
      surfaceDark: other.surfaceDark ?? surfaceDark,
      borderDark: other.borderDark ?? borderDark,
      textPrimaryDark: other.textPrimaryDark ?? textPrimaryDark,
      textMutedDark: other.textMutedDark ?? textMutedDark,
      lightRed: other.lightRed ?? lightRed,
      purple: other.purple ?? purple,
      grey: other.grey ?? grey,
      darkGrey: other.darkGrey ?? darkGrey,
    );
  }
}
