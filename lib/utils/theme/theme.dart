import 'package:flutter/material.dart';

import 'chip_theme.dart';
import 'colors.dart';
import 'theme_config.dart';

/// Swiss Army Component Theme Factory
///
/// Provides light and dark themes with optional customization.
///
/// Basic usage (with defaults):
/// ```dart
/// MaterialApp(
///   theme: SACTheme.light(),
///   darkTheme: SACTheme.dark(),
/// );
/// ```
///
/// Custom colors:
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
class SACTheme {
  /// Returns default color values merged with custom config
  static _ResolvedColors _resolveColors(SACThemeConfig? config, bool isDark) {
    return _ResolvedColors(
      primary: isDark
          ? (config?.primaryDark ?? config?.primary ?? AppColors.primary)
          : (config?.primaryLight ?? config?.primary ?? AppColors.primary),
      secondary: isDark
          ? (config?.secondaryDark ?? config?.secondary ?? AppColors.secondary)
          : (config?.secondaryLight ??
                config?.secondary ??
                AppColors.secondary),
      error: isDark
          ? (config?.errorDark ?? config?.error ?? AppColors.red)
          : (config?.errorLight ?? config?.error ?? AppColors.red),
      success: isDark
          ? (config?.successDark ?? config?.success ?? AppColors.green)
          : (config?.successLight ?? config?.success ?? AppColors.green),
      background: isDark
          ? (config?.backgroundDark ?? AppColors.backgroundDark)
          : (config?.backgroundLight ?? AppColors.backgroundLight),
      surface: isDark
          ? (config?.surfaceDark ?? AppColors.surfaceDark)
          : (config?.surfaceLight ?? AppColors.surfaceLight),
      border: isDark
          ? (config?.borderDark ?? AppColors.borderDark)
          : (config?.borderLight ?? AppColors.borderLight),
      textPrimary: isDark
          ? (config?.textPrimaryDark ?? AppColors.textPrimaryDark)
          : (config?.textPrimaryLight ?? AppColors.textPrimaryLight),
      textMuted: isDark
          ? (config?.textMutedDark ?? AppColors.textMutedDark)
          : (config?.textMutedLight ?? AppColors.textMutedLight),
    );
  }

  /// Generate a light theme with optional custom colors
  static ThemeData light([SACThemeConfig? config]) {
    final colors = _resolveColors(config, false);

    final lightScheme = ColorScheme.fromSeed(
      seedColor: colors.primary,
      brightness: Brightness.light,
      primary: colors.primary,
      secondary: colors.secondary,
      surface: colors.surface,
      error: colors.error,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: lightScheme,
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: lightScheme.onSurface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: lightScheme.onSurface),
      ),
      chipTheme: AppChipTheme.lightChipTheme.copyWith(
        backgroundColor: colors.surface,
        side: BorderSide(color: colors.border),
      ),
      dividerColor: colors.border,
      popupMenuTheme: PopupMenuThemeData(color: colors.surface),
    );
  }

  /// Generate a dark theme with optional custom colors
  static ThemeData dark([SACThemeConfig? config]) {
    final colors = _resolveColors(config, true);

    final darkScheme = ColorScheme.fromSeed(
      seedColor: colors.primary,
      brightness: Brightness.dark,
      primary: colors.primary,
      secondary: colors.secondary,
      surface: colors.surface,
      error: colors.error,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: darkScheme,
      scaffoldBackgroundColor: colors.background,
      cardColor: colors.surface,
      appBarTheme: AppBarTheme(
        backgroundColor: colors.surface,
        foregroundColor: darkScheme.onSurface,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        iconTheme: IconThemeData(color: darkScheme.onSurface),
      ),
      chipTheme: AppChipTheme.darkChipTheme.copyWith(
        side: BorderSide(color: colors.border),
      ),
      dividerColor: colors.border,
      popupMenuTheme: PopupMenuThemeData(color: colors.surface),
    );
  }
}

/// Legacy aliases for backward compatibility
class AppTheme {
  @Deprecated('Use SACTheme.light() instead')
  static ThemeData get lighttheme => SACTheme.light();

  @Deprecated('Use SACTheme.dark() instead')
  static ThemeData get darkTheme => SACTheme.dark();
}

/// Base class to create your own themed variants while reusing SACTheme builders.
///
/// Example:
/// ```dart
/// class AppTheme extends SACThemeBase {
///   const AppTheme();
///
///   @override
///   SACThemeConfig config() => const SACThemeConfig(
///         primary: Colors.teal,
///         secondary: Colors.amber,
///       );
/// }
///
/// // Usage
/// final appTheme = AppTheme();
/// MaterialApp(
///   theme: appTheme.light(),
///   darkTheme: appTheme.dark(),
/// );
/// ```
abstract class SACThemeBase {
  const SACThemeBase();

  /// Provide your custom config. Return null to use defaults.
  SACThemeConfig? config();

  ThemeData light() => SACTheme.light(config());

  ThemeData dark() => SACTheme.dark(config());
}

/// Internal class to hold resolved color values
class _ResolvedColors {
  final Color primary;
  final Color secondary;
  final Color error;
  final Color success;
  final Color background;
  final Color surface;
  final Color border;
  final Color textPrimary;
  final Color textMuted;

  _ResolvedColors({
    required this.primary,
    required this.secondary,
    required this.error,
    required this.success,
    required this.background,
    required this.surface,
    required this.border,
    required this.textPrimary,
    required this.textMuted,
  });
}
