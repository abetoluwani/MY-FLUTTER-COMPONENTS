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
///   scaffoldBackgroundLight: Colors.grey[50],
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
      // --- Component Colors ---
      scaffoldBackground: isDark
          ? (config?.scaffoldBackgroundDark ??
                config?.backgroundDark ??
                AppColors.backgroundDark)
          : (config?.scaffoldBackgroundLight ??
                config?.backgroundLight ??
                AppColors.backgroundLight),
      appBarBackground: isDark
          ? (config?.appBarBackgroundDark ??
                config?.surfaceDark ??
                AppColors.surfaceDark)
          : (config?.appBarBackgroundLight ??
                config?.surfaceLight ??
                AppColors.surfaceLight),
      appBarForeground: isDark
          ? (config?.appBarForegroundDark ??
                config?.textPrimaryDark ??
                AppColors.textPrimaryDark)
          : (config?.appBarForegroundLight ??
                config?.textPrimaryLight ??
                AppColors.textPrimaryLight),
      bottomNavBackground: isDark
          ? (config?.bottomNavBackgroundDark ??
                config?.surfaceDark ??
                AppColors.surfaceDark)
          : (config?.bottomNavBackgroundLight ??
                config?.surfaceLight ??
                AppColors.surfaceLight),
      drawerBackground: isDark
          ? (config?.drawerBackgroundDark ??
                config?.surfaceDark ??
                AppColors.surfaceDark)
          : (config?.drawerBackgroundLight ??
                config?.surfaceLight ??
                AppColors.surfaceLight),
      fabBackground: isDark
          ? (config?.fabBackgroundDark ??
                config?.primaryDark ??
                config?.primary ??
                AppColors.primary)
          : (config?.fabBackgroundLight ??
                config?.primaryLight ??
                config?.primary ??
                AppColors.primary),
      fabForeground: isDark
          ? (config?.fabForegroundDark ?? AppColors.white)
          : (config?.fabForegroundLight ?? AppColors.white),
      cardColor: isDark
          ? (config?.cardColorDark ??
                config?.surfaceDark ??
                AppColors.surfaceDark)
          : (config?.cardColorLight ??
                config?.surfaceLight ??
                AppColors.surfaceLight),
      dialogBackground: isDark
          ? (config?.dialogBackgroundDark ??
                config?.surfaceDark ??
                AppColors.surfaceDark)
          : (config?.dialogBackgroundLight ??
                config?.surfaceLight ??
                AppColors.surfaceLight),
      bottomSheetBackground: isDark
          ? (config?.bottomSheetBackgroundDark ??
                config?.surfaceDark ??
                AppColors.surfaceDark)
          : (config?.bottomSheetBackgroundLight ??
                config?.surfaceLight ??
                AppColors.surfaceLight),
      inputFillColor: isDark
          ? (config?.inputFillColorDark ??
                config?.surfaceDark ??
                AppColors.surfaceDark)
          : (config?.inputFillColorLight ??
                config?.surfaceLight ??
                AppColors.surfaceLight),
      chipBackground: isDark
          ? (config?.chipBackgroundDark ??
                config?.surfaceDark ??
                AppColors.surfaceDark)
          : (config?.chipBackgroundLight ??
                config?.surfaceLight ??
                AppColors.surfaceLight),
      popupMenuBackground: isDark
          ? (config?.popupMenuBackgroundDark ??
                config?.surfaceDark ??
                AppColors.surfaceDark)
          : (config?.popupMenuBackgroundLight ??
                config?.surfaceLight ??
                AppColors.surfaceLight),
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

      onPrimary: AppColors.white,
      onSecondary: AppColors.black,
      onSurface: colors.textPrimary,

      onError: AppColors.white,
    );

    return _buildTheme(
      brightness: Brightness.light,
      colors: colors,
      scheme: lightScheme,
      config: config,
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

      onPrimary: AppColors.white,
      onSecondary: AppColors.black,
      onSurface: colors.textPrimary,

      onError: AppColors.white,
    );

    return _buildTheme(
      brightness: Brightness.dark,
      colors: colors,
      scheme: darkScheme,
      config: config,
    );
  }

  static ThemeData _buildTheme({
    required Brightness brightness,
    required _ResolvedColors colors,
    required ColorScheme scheme,
    SACThemeConfig? config,
  }) {
    final isDark = brightness == Brightness.dark;

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: colors.scaffoldBackground,
      cardColor: colors.cardColor,
      dividerColor: config?.dividerColor ?? colors.border,
      disabledColor:
          config?.disabledColor ?? AppColors.grey.withValues(alpha: 0.5),
      splashColor: config?.splashColor,
      highlightColor: config?.highlightColor,
      hoverColor: config?.hoverColor,
      focusColor: config?.focusColor,
      shadowColor: config?.shadowColor,
      visualDensity: config?.visualDensity,
      materialTapTargetSize: config?.materialTapTargetSize,

      // Typography
      fontFamily: config?.fontFamily,
      textTheme:
          TextTheme(
            displayLarge: config?.displayLarge,
            displayMedium: config?.displayMedium,
            displaySmall: config?.displaySmall,
            headlineLarge: config?.headlineLarge,
            headlineMedium: config?.headlineMedium,
            headlineSmall: config?.headlineSmall,
            titleLarge: config?.titleLarge,
            titleMedium: config?.titleMedium,
            titleSmall: config?.titleSmall,
            bodyLarge:
                config?.bodyLarge ?? TextStyle(color: colors.textPrimary),
            bodyMedium:
                config?.bodyMedium ?? TextStyle(color: colors.textPrimary),
            bodySmall: config?.bodySmall ?? TextStyle(color: colors.textMuted),
            labelLarge: config?.labelLarge,
            labelMedium: config?.labelMedium,
            labelSmall: config?.labelSmall,
          ).apply(
            bodyColor: colors.textPrimary,
            displayColor: colors.textPrimary,
            fontFamily: config?.fontFamily,
          ),

      // AppBar
      appBarTheme: AppBarTheme(
        backgroundColor: colors.appBarBackground,
        foregroundColor: colors.appBarForeground,
        elevation: config?.appBarElevation ?? 0,
        centerTitle: config?.appBarCenterTitle,
        titleTextStyle:
            config?.appBarTitleTextStyle?.copyWith(
              color: colors.appBarForeground,
            ) ??
            TextStyle(
              color: colors.appBarForeground,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
        iconTheme:
            config?.appBarIconTheme ??
            IconThemeData(color: colors.appBarForeground),
        surfaceTintColor: Colors.transparent,
      ),

      // Bottom Navigation Bar
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colors.bottomNavBackground,
        selectedItemColor: config?.bottomNavSelectedColor ?? colors.primary,
        unselectedItemColor:
            config?.bottomNavUnselectedColor ?? colors.textMuted,
        elevation: config?.bottomNavElevation ?? 8,
        type: config?.bottomNavType,
      ),

      // Navigation Bar (M3)
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: isDark
            ? (config?.navigationBarBackgroundDark ?? colors.surface)
            : (config?.navigationBarBackgroundLight ?? colors.surface),
        indicatorColor:
            config?.navigationBarIndicatorColor ??
            colors.primary.withValues(alpha: 0.2),
        height: config?.navigationBarHeight,
      ),

      // Navigation Rail
      navigationRailTheme: NavigationRailThemeData(
        backgroundColor: isDark
            ? (config?.navigationRailBackgroundDark ?? colors.surface)
            : (config?.navigationRailBackgroundLight ?? colors.surface),
        selectedIconTheme: IconThemeData(
          color: config?.navigationRailSelectedColor ?? colors.primary,
        ),
        unselectedIconTheme: IconThemeData(
          color: config?.navigationRailUnselectedColor ?? colors.textMuted,
        ),
      ),

      // Drawer
      drawerTheme: DrawerThemeData(
        backgroundColor: colors.drawerBackground,
        width: config?.drawerWidth,
        elevation: config?.drawerElevation,
      ),

      // FAB
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: colors.fabBackground,
        foregroundColor: colors.fabForeground,
        elevation: config?.fabElevation,
        shape: config?.fabShape,
      ),

      // Buttons
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: config?.elevatedButtonStyle,
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: config?.outlinedButtonStyle,
      ),
      textButtonTheme: TextButtonThemeData(style: config?.textButtonStyle),
      filledButtonTheme: FilledButtonThemeData(
        style: config?.filledButtonStyle,
      ),
      iconButtonTheme: IconButtonThemeData(style: config?.iconButtonStyle),

      // Card
      cardTheme: CardThemeData(
        color: colors.cardColor,
        elevation: config?.cardElevation ?? 0,
        shape:
            config?.cardShape ??
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
              side: BorderSide(color: colors.border, width: 1),
            ),
        margin: config?.cardMargin,
      ),

      // Dialog
      dialogTheme: DialogThemeData(
        backgroundColor: colors.dialogBackground,
        elevation: config?.dialogElevation,
        shape:
            config?.dialogShape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        titleTextStyle: config?.dialogTitleStyle,
        contentTextStyle: config?.dialogContentStyle,
      ),

      // BottomSheet
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: colors.bottomSheetBackground,
        elevation: config?.bottomSheetElevation,
        shape:
            config?.bottomSheetShape ??
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
            ),
        dragHandleColor: config?.bottomSheetDragHandleColor,
      ),

      // SnackBar
      snackBarTheme: SnackBarThemeData(
        backgroundColor: isDark
            ? (config?.snackBarBackgroundDark ?? AppColors.surfaceLight)
            : (config?.snackBarBackgroundLight ?? AppColors.surfaceDark),
        actionTextColor: config?.snackBarActionColor ?? colors.primary,
        behavior: config?.snackBarBehavior,
        contentTextStyle: TextStyle(
          color: isDark
              ? AppColors.textPrimaryLight
              : AppColors.textPrimaryDark,
        ),
      ),

      // Input Decoration
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: colors.inputFillColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(config?.inputBorderRadius ?? 12),
          borderSide: BorderSide(
            color: config?.inputBorderColor ?? colors.border,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(config?.inputBorderRadius ?? 12),
          borderSide: BorderSide(
            color: config?.inputBorderColor ?? colors.border,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(config?.inputBorderRadius ?? 12),
          borderSide: BorderSide(
            color: config?.inputFocusedBorderColor ?? colors.primary,
            width: 1.5,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(config?.inputBorderRadius ?? 12),
          borderSide: BorderSide(
            color: config?.inputErrorBorderColor ?? colors.error,
          ),
        ),
        labelStyle: config?.inputLabelStyle,
        hintStyle: config?.inputHintStyle ?? TextStyle(color: colors.textMuted),
      ),

      // Checkbox, Radio, Switch
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? (config?.checkboxFillColor ?? colors.primary)
              : null,
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? (config?.radioFillColor ?? colors.primary)
              : null,
        ),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? (config?.switchActiveColor ?? colors.primary)
              : (config?.switchInactiveColor ?? colors.textMuted),
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) =>
              (config?.switchTrackColor ??
              colors.border.withValues(alpha: 0.3)),
        ),
      ),

      // Slider
      sliderTheme: SliderThemeData(
        activeTrackColor: config?.sliderActiveColor ?? colors.primary,
        inactiveTrackColor: config?.sliderInactiveColor ?? colors.border,
        thumbColor: config?.sliderThumbColor ?? colors.primary,
      ),

      // Progress Indicator
      progressIndicatorTheme: ProgressIndicatorThemeData(
        color: config?.progressIndicatorColor ?? colors.primary,
        circularTrackColor:
            config?.progressIndicatorBackgroundColor ??
            colors.border.withValues(alpha: 0.2),
      ),

      // Tooltip
      tooltipTheme: TooltipThemeData(
        decoration: BoxDecoration(
          color:
              config?.tooltipBackgroundColor ??
              (isDark ? AppColors.surfaceLight : AppColors.surfaceDark),
          borderRadius: BorderRadius.circular(4),
        ),
        textStyle:
            config?.tooltipTextStyle ??
            TextStyle(
              color: isDark
                  ? AppColors.textPrimaryLight
                  : AppColors.textPrimaryDark,
            ),
        padding: config?.tooltipPadding,
      ),

      // Divider
      dividerTheme: DividerThemeData(
        color: config?.dividerColor ?? colors.border,
        thickness: config?.dividerThickness ?? 1,
        indent: config?.dividerIndent ?? 0,
        endIndent: config?.dividerIndent ?? 0,
      ),

      // ListTile
      listTileTheme: ListTileThemeData(
        iconColor: config?.listTileIconColor ?? colors.textMuted,
        titleTextStyle: config?.listTileTitleStyle,
        subtitleTextStyle: config?.listTileSubtitleStyle,
        selectedColor: config?.listTileSelectedColor ?? colors.primary,
      ),

      // TabBar
      tabBarTheme: TabBarThemeData(
        indicatorColor: config?.tabBarIndicatorColor ?? colors.primary,
        labelColor: config?.tabBarLabelColor ?? colors.primary,
        unselectedLabelColor:
            config?.tabBarUnselectedLabelColor ?? colors.textMuted,
        indicatorSize: TabBarIndicatorSize.tab,
      ),

      // DataTable
      dataTableTheme: DataTableThemeData(
        headingRowColor: WidgetStateProperty.all(
          config?.dataTableHeadingRowColor ?? colors.surface,
        ),
        dataRowColor: WidgetStateProperty.all(
          config?.dataTableDataRowColor ?? colors.background,
        ),
        dividerThickness: config?.dataTableDividerThickness,
      ),

      // Chip
      chipTheme:
          (isDark ? AppChipTheme.darkChipTheme : AppChipTheme.lightChipTheme)
              .copyWith(
                backgroundColor: colors.chipBackground,
                labelStyle:
                    config?.chipLabelStyle ??
                    TextStyle(color: colors.textPrimary),
                deleteIconColor:
                    config?.chipDeleteIconColor ?? colors.textMuted,
                selectedColor:
                    config?.chipSelectedColor ??
                    colors.primary.withValues(alpha: 0.2),
                side: BorderSide(color: colors.border),
              ),

      // Badge
      badgeTheme: BadgeThemeData(
        backgroundColor: config?.badgeBackgroundColor ?? colors.error,
        textColor: config?.badgeTextColor ?? AppColors.white,
      ),

      // SearchBar
      searchBarTheme: SearchBarThemeData(
        backgroundColor: WidgetStateProperty.all(
          isDark
              ? (config?.searchBarBackgroundDark ?? colors.surface)
              : (config?.searchBarBackgroundLight ?? colors.surface),
        ),
        elevation: WidgetStateProperty.all(config?.searchBarElevation ?? 0),
        hintStyle: WidgetStateProperty.all(
          config?.searchBarHintStyle ?? TextStyle(color: colors.textMuted),
        ),
      ),

      // SegmentedButton
      segmentedButtonTheme: SegmentedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.resolveWith<Color?>((
            Set<WidgetState> states,
          ) {
            if (states.contains(WidgetState.selected)) {
              return config?.segmentedButtonSelectedColor ??
                  colors.primary.withValues(alpha: 0.2);
            }
            return null;
          }),
          foregroundColor: WidgetStateProperty.all(
            config?.segmentedButtonForegroundColor ?? colors.textPrimary,
          ),
        ),
      ),

      // PopupMenu
      popupMenuTheme: PopupMenuThemeData(
        color: colors.popupMenuBackground,
        elevation: config?.popupMenuElevation,
        shape:
            config?.popupMenuShape ??
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),

      // ExpansionTile
      expansionTileTheme: ExpansionTileThemeData(
        backgroundColor:
            config?.expansionTileBackgroundColor ?? Colors.transparent,
        collapsedBackgroundColor:
            config?.expansionTileCollapsedBackgroundColor ?? Colors.transparent,
        iconColor: config?.expansionTileIconColor ?? colors.primary,
        textColor: colors.textPrimary,
        collapsedTextColor: colors.textPrimary,
      ),
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

  // Component specific
  final Color scaffoldBackground;
  final Color appBarBackground;
  final Color appBarForeground;
  final Color bottomNavBackground;
  final Color drawerBackground;
  final Color fabBackground;
  final Color fabForeground;
  final Color cardColor;
  final Color dialogBackground;
  final Color bottomSheetBackground;
  final Color inputFillColor;
  final Color chipBackground;
  final Color popupMenuBackground;

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
    required this.scaffoldBackground,
    required this.appBarBackground,
    required this.appBarForeground,
    required this.bottomNavBackground,
    required this.drawerBackground,
    required this.fabBackground,
    required this.fabForeground,
    required this.cardColor,
    required this.dialogBackground,
    required this.bottomSheetBackground,
    required this.inputFillColor,
    required this.chipBackground,
    required this.popupMenuBackground,
  });
}
