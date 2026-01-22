import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';


class AppBarSecurityConfig {
 
  static bool enforceValidation = false;
  static bool enableSecurityLogging = kDebugMode;
  static double maxAppBarHeight = 300.0;
  static double minAppBarHeight = 40.0;
  static double maxTitleFontSize = 40.0;
  static double minTitleFontSize = 10.0;
  static double maxIconSize = 60.0;
  static double minIconSize = 12.0;
  static double maxElevation = 24.0;
  static int maxTitleLength = 100;
  static int maxHintLength = 200;
  static int maxTabCount = 20;
  static int maxActionsCount = 10;
  static void enableSecurity() {
    enforceValidation = true;
  }
  static void disableSecurity() {
    enforceValidation = false;
  }

  /// Reset all settings to defaults.
  static void resetToDefaults() {
    enforceValidation = false;
    enableSecurityLogging = kDebugMode;
    maxAppBarHeight = 300.0;
    minAppBarHeight = 40.0;
    maxTitleFontSize = 40.0;
    minTitleFontSize = 10.0;
    maxIconSize = 60.0;
    minIconSize = 12.0;
    maxElevation = 24.0;
    maxTitleLength = 100;
    maxHintLength = 200;
    maxTabCount = 20;
    maxActionsCount = 10;
  }
}

/// Validate AppBar height is within bounds.
/// Pass [enableSecurity] to override global setting, or leave null to use global.
double validateAppBarHeight(
  double? value, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  if (value == null) return defaultValue;
  final shouldValidate =
      enableSecurity ?? AppBarSecurityConfig.enforceValidation;
  if (!shouldValidate) return value;

  if (value < AppBarSecurityConfig.minAppBarHeight) {
    _logAppBarSecurity(
      'Height $value below minimum ${AppBarSecurityConfig.minAppBarHeight}',
    );
    return AppBarSecurityConfig.minAppBarHeight;
  }

  if (value > AppBarSecurityConfig.maxAppBarHeight) {
    _logAppBarSecurity(
      'Height $value above maximum ${AppBarSecurityConfig.maxAppBarHeight}',
    );
    return AppBarSecurityConfig.maxAppBarHeight;
  }

  return value;
}

/// Validate title font size is within bounds.
/// Pass [enableSecurity] to override global setting, or leave null to use global.
double validateTitleFontSize(
  double? value, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  if (value == null) return defaultValue;
  final shouldValidate =
      enableSecurity ?? AppBarSecurityConfig.enforceValidation;
  if (!shouldValidate) return value;

  if (value < AppBarSecurityConfig.minTitleFontSize) {
    _logAppBarSecurity(
      'Title font size $value below minimum ${AppBarSecurityConfig.minTitleFontSize}',
    );
    return AppBarSecurityConfig.minTitleFontSize;
  }

  if (value > AppBarSecurityConfig.maxTitleFontSize) {
    _logAppBarSecurity(
      'Title font size $value above maximum ${AppBarSecurityConfig.maxTitleFontSize}',
    );
    return AppBarSecurityConfig.maxTitleFontSize;
  }

  return value;
}

/// Validate icon size is within bounds.
/// Pass [enableSecurity] to override global setting, or leave null to use global.
double validateIconSize(
  double? value, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  if (value == null) return defaultValue;
  final shouldValidate =
      enableSecurity ?? AppBarSecurityConfig.enforceValidation;
  if (!shouldValidate) return value;

  if (value < AppBarSecurityConfig.minIconSize) {
    _logAppBarSecurity(
      'Icon size $value below minimum ${AppBarSecurityConfig.minIconSize}',
    );
    return AppBarSecurityConfig.minIconSize;
  }

  if (value > AppBarSecurityConfig.maxIconSize) {
    _logAppBarSecurity(
      'Icon size $value above maximum ${AppBarSecurityConfig.maxIconSize}',
    );
    return AppBarSecurityConfig.maxIconSize;
  }

  return value;
}

/// Validate elevation is within bounds.
/// Pass [enableSecurity] to override global setting, or leave null to use global.
double validateAppBarElevation(
  double? value, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  if (value == null) return defaultValue;
  final shouldValidate =
      enableSecurity ?? AppBarSecurityConfig.enforceValidation;
  if (!shouldValidate) return value;

  if (value < 0) {
    _logAppBarSecurity('Elevation $value is negative, using 0');
    return 0;
  }

  if (value > AppBarSecurityConfig.maxElevation) {
    _logAppBarSecurity(
      'Elevation $value above maximum ${AppBarSecurityConfig.maxElevation}',
    );
    return AppBarSecurityConfig.maxElevation;
  }

  return value;
}

/// Sanitize title text to prevent overflow and potential issues.
/// Pass [enableSecurity] to override global setting, or leave null to use global.
String sanitizeTitleText(String? text, {bool? enableSecurity}) {
  if (text == null || text.isEmpty) return '';
  final shouldValidate =
      enableSecurity ?? AppBarSecurityConfig.enforceValidation;
  if (!shouldValidate) return text;

  var sanitized = text.trim();

  if (sanitized.length > AppBarSecurityConfig.maxTitleLength) {
    _logAppBarSecurity(
      'Title truncated from ${sanitized.length} to ${AppBarSecurityConfig.maxTitleLength}',
    );
    sanitized =
        '${sanitized.substring(0, AppBarSecurityConfig.maxTitleLength - 3)}...';
  }

  return sanitized;
}

/// Sanitize hint text for search bars.
/// Pass [enableSecurity] to override global setting, or leave null to use global.
String sanitizeHintText(
  String? text, {
  String defaultHint = 'Search...',
  bool? enableSecurity,
}) {
  if (text == null || text.isEmpty) return defaultHint;
  final shouldValidate =
      enableSecurity ?? AppBarSecurityConfig.enforceValidation;
  if (!shouldValidate) return text;

  var sanitized = text.trim();

  if (sanitized.length > AppBarSecurityConfig.maxHintLength) {
    sanitized =
        '${sanitized.substring(0, AppBarSecurityConfig.maxHintLength - 3)}...';
  }

  return sanitized;
}

/// Validate tabs list is within bounds.
/// Pass [enableSecurity] to override global setting, or leave null to use global.
List<T> validateTabs<T>(List<T> tabs, {bool? enableSecurity}) {
  if (tabs.isEmpty) {
    _logAppBarSecurity('Warning: Empty tabs list provided');
    return tabs;
  }

  final shouldValidate =
      enableSecurity ?? AppBarSecurityConfig.enforceValidation;
  if (!shouldValidate) return tabs;

  if (tabs.length > AppBarSecurityConfig.maxTabCount) {
    _logAppBarSecurity(
      'Tabs truncated from ${tabs.length} to ${AppBarSecurityConfig.maxTabCount}',
    );
    return tabs.take(AppBarSecurityConfig.maxTabCount).toList();
  }

  return tabs;
}

/// Validate actions list is within bounds.
/// Pass [enableSecurity] to override global setting, or leave null to use global.
List<T>? validateActions<T>(List<T>? actions, {bool? enableSecurity}) {
  if (actions == null || actions.isEmpty) return actions;
  final shouldValidate =
      enableSecurity ?? AppBarSecurityConfig.enforceValidation;
  if (!shouldValidate) return actions;

  if (actions.length > AppBarSecurityConfig.maxActionsCount) {
    _logAppBarSecurity(
      'Actions truncated from ${actions.length} to ${AppBarSecurityConfig.maxActionsCount}',
    );
    return actions.take(AppBarSecurityConfig.maxActionsCount).toList();
  }

  return actions;
}

/// Validate gradient colors list.
/// Pass [enableSecurity] to override global setting, or leave null to use global.
List<Color>? validateGradientColors(
  List<Color>? colors, {
  bool? enableSecurity,
}) {
  if (colors == null || colors.isEmpty) return null;
  final shouldValidate =
      enableSecurity ?? AppBarSecurityConfig.enforceValidation;
  if (!shouldValidate) return colors;

  // Need at least 2 colors for a gradient
  if (colors.length < 2) {
    _logAppBarSecurity(
      'Gradient needs at least 2 colors, got ${colors.length}',
    );
    return null;
  }

  // Limit to reasonable number of colors
  if (colors.length > 10) {
    _logAppBarSecurity('Gradient colors truncated from ${colors.length} to 10');
    return colors.take(10).toList();
  }

  return colors;
}

/// Safe callback execution for AppBar callbacks.
void safeAppBarCallback(VoidCallback? callback, {String? context}) {
  if (callback == null) return;

  try {
    callback();
  } catch (e, stackTrace) {
    _logAppBarSecurity(
      'AppBar callback error${context != null ? ' in $context' : ''}: $e',
      stackTrace: stackTrace,
    );
  }
}

/// Safe value changed callback execution.
void safeValueChanged<T>(
  ValueChanged<T>? callback,
  T value, {
  String? context,
}) {
  if (callback == null) return;

  try {
    callback(value);
  } catch (e, stackTrace) {
    _logAppBarSecurity(
      'AppBar value changed error${context != null ? ' in $context' : ''}: $e',
      stackTrace: stackTrace,
    );
  }
}

/// Validate system overlay style for security.
SystemUiOverlayStyle? validateSystemOverlayStyle(SystemUiOverlayStyle? style) {
  // Just pass through - Flutter handles validation
  // This is a hook for future security checks if needed
  return style;
}

/// Log AppBar security-related events.
void _logAppBarSecurity(String message, {StackTrace? stackTrace}) {
  if (AppBarSecurityConfig.enableSecurityLogging) {
    debugPrint('[SAC AppBar Security] $message');
    if (stackTrace != null) {
      debugPrint(stackTrace.toString());
    }
  }
}

/// Extension to add security features to AppBar callbacks.
extension SecureAppBarCallbackExtension on VoidCallback? {
  /// Wrap callback with try-catch for safe execution.
  VoidCallback? get safeAppBar {
    if (this == null) return null;
    return () => safeAppBarCallback(this);
  }
}

/// Extension for ValueChanged with safety.
extension SecureValueChangedExtension<T> on ValueChanged<T>? {
  /// Wrap callback with try-catch for safe execution.
  ValueChanged<T>? get safe {
    if (this == null) return null;
    return (value) => safeValueChanged(this, value);
  }
}
