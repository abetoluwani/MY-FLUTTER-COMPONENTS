import 'package:flutter/foundation.dart';

/// Security configuration for TextField widgets.
///
/// Security is OFF by default. Enable it globally or per-widget.
///
/// Example:
/// ```dart
/// // Enable security globally
/// TextFieldSecurityConfig.enableSecurity();
///
/// // Or per-widget
/// AppTextField(
///   enableSecurity: true,
/// )
/// ```
class TextFieldSecurityConfig {
  /// Whether to enforce validation. Defaults to false (security OFF).
  static bool enforceValidation = false;

  /// Enable debug logging for security events.
  static bool enableSecurityLogging = kDebugMode;

  // ============== Configurable Limits ==============

  /// Maximum allowed input length
  static int maxInputLength = 10000;

  /// Maximum font size
  static double maxFontSize = 48.0;

  /// Minimum font size
  static double minFontSize = 8.0;

  /// Maximum border radius
  static double maxBorderRadius = 100.0;

  /// Maximum border width
  static double maxBorderWidth = 10.0;

  /// Maximum content padding
  static double maxContentPadding = 50.0;

  /// Maximum icon size
  static double maxIconSize = 64.0;

  /// Minimum icon size
  static double minIconSize = 12.0;

  /// Maximum max lines
  static int maxMaxLines = 1000;

  /// Maximum min lines
  static int maxMinLines = 100;

  /// Maximum label spacing
  static double maxLabelSpacing = 32.0;

  /// Maximum height
  static double maxHeight = 500.0;

  /// Minimum height
  static double minHeight = 30.0;

  // ============== Control Methods ==============

  /// Enable security validation globally.
  static void enableSecurity() {
    enforceValidation = true;
  }

  /// Disable security validation globally.
  static void disableSecurity() {
    enforceValidation = false;
  }

  /// Reset all settings to defaults.
  static void resetToDefaults() {
    enforceValidation = false;
    enableSecurityLogging = kDebugMode;
    maxInputLength = 10000;
    maxFontSize = 48.0;
    minFontSize = 8.0;
    maxBorderRadius = 100.0;
    maxBorderWidth = 10.0;
    maxContentPadding = 50.0;
    maxIconSize = 64.0;
    minIconSize = 12.0;
    maxMaxLines = 1000;
    maxMinLines = 100;
    maxLabelSpacing = 32.0;
    maxHeight = 500.0;
    minHeight = 30.0;
  }
}

// ============== Validation Functions ==============

/// Validates input length.
int validateInputLength(
  int? length, {
  int? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (length == null) {
    return defaultValue ?? TextFieldSecurityConfig.maxInputLength;
  }
  if (!shouldValidate) return length;

  if (length < 1) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Input length $length is invalid, using 1',
      );
    }
    return 1;
  }

  if (length > TextFieldSecurityConfig.maxInputLength) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Input length $length above max ${TextFieldSecurityConfig.maxInputLength}',
      );
    }
    return TextFieldSecurityConfig.maxInputLength;
  }

  return length;
}

/// Validates font size within configured bounds.
double? validateTextFieldFontSize(
  double? fontSize, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (fontSize == null) return defaultValue;
  if (!shouldValidate) return fontSize;

  if (fontSize > TextFieldSecurityConfig.maxFontSize) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Font size $fontSize above max ${TextFieldSecurityConfig.maxFontSize}',
      );
    }
    return TextFieldSecurityConfig.maxFontSize;
  }

  if (fontSize < TextFieldSecurityConfig.minFontSize) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Font size $fontSize below min ${TextFieldSecurityConfig.minFontSize}',
      );
    }
    return TextFieldSecurityConfig.minFontSize;
  }

  return fontSize;
}

/// Validates border radius within configured bounds.
double? validateTextFieldBorderRadius(
  double? radius, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (radius == null) return defaultValue;
  if (!shouldValidate) return radius;

  if (radius < 0) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Border radius $radius is negative, using 0',
      );
    }
    return 0;
  }

  if (radius > TextFieldSecurityConfig.maxBorderRadius) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Border radius $radius above max ${TextFieldSecurityConfig.maxBorderRadius}',
      );
    }
    return TextFieldSecurityConfig.maxBorderRadius;
  }

  return radius;
}

/// Validates border width within configured bounds.
double? validateTextFieldBorderWidth(
  double? width, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (width == null) return defaultValue;
  if (!shouldValidate) return width;

  if (width < 0) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Border width $width is negative, using 0',
      );
    }
    return 0;
  }

  if (width > TextFieldSecurityConfig.maxBorderWidth) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Border width $width above max ${TextFieldSecurityConfig.maxBorderWidth}',
      );
    }
    return TextFieldSecurityConfig.maxBorderWidth;
  }

  return width;
}

/// Validates content padding within configured bounds.
double? validateContentPadding(
  double? padding, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (padding == null) return defaultValue;
  if (!shouldValidate) return padding;

  if (padding < 0) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Padding $padding is negative, using 0',
      );
    }
    return 0;
  }

  if (padding > TextFieldSecurityConfig.maxContentPadding) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Padding $padding above max ${TextFieldSecurityConfig.maxContentPadding}',
      );
    }
    return TextFieldSecurityConfig.maxContentPadding;
  }

  return padding;
}

/// Validates icon size within configured bounds.
double? validateTextFieldIconSize(
  double? size, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (size == null) return defaultValue;
  if (!shouldValidate) return size;

  if (size > TextFieldSecurityConfig.maxIconSize) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Icon size $size above max ${TextFieldSecurityConfig.maxIconSize}',
      );
    }
    return TextFieldSecurityConfig.maxIconSize;
  }

  if (size < TextFieldSecurityConfig.minIconSize) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Icon size $size below min ${TextFieldSecurityConfig.minIconSize}',
      );
    }
    return TextFieldSecurityConfig.minIconSize;
  }

  return size;
}

/// Validates max lines within configured bounds.
int validateTextFieldMaxLines(
  int? maxLines, {
  int defaultValue = 1,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (maxLines == null) return defaultValue;
  if (!shouldValidate) return maxLines;

  if (maxLines < 1) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Max lines $maxLines is invalid, using 1',
      );
    }
    return 1;
  }

  if (maxLines > TextFieldSecurityConfig.maxMaxLines) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Max lines $maxLines above max ${TextFieldSecurityConfig.maxMaxLines}',
      );
    }
    return TextFieldSecurityConfig.maxMaxLines;
  }

  return maxLines;
}

/// Validates min lines within configured bounds.
int validateTextFieldMinLines(
  int? minLines, {
  int defaultValue = 1,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (minLines == null) return defaultValue;
  if (!shouldValidate) return minLines;

  if (minLines < 1) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Min lines $minLines is invalid, using 1',
      );
    }
    return 1;
  }

  if (minLines > TextFieldSecurityConfig.maxMinLines) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Min lines $minLines above max ${TextFieldSecurityConfig.maxMinLines}',
      );
    }
    return TextFieldSecurityConfig.maxMinLines;
  }

  return minLines;
}

/// Validates height within configured bounds.
double validateTextFieldHeight(
  double? height, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (height == null) return defaultValue ?? 56.0;
  if (!shouldValidate) return height;

  if (height > TextFieldSecurityConfig.maxHeight) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Height $height above max ${TextFieldSecurityConfig.maxHeight}',
      );
    }
    return TextFieldSecurityConfig.maxHeight;
  }

  if (height < TextFieldSecurityConfig.minHeight) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Height $height below min ${TextFieldSecurityConfig.minHeight}',
      );
    }
    return TextFieldSecurityConfig.minHeight;
  }

  return height;
}

/// Validates label spacing within configured bounds.
double? validateLabelSpacing(
  double? spacing, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? TextFieldSecurityConfig.enforceValidation;

  if (spacing == null) return defaultValue;
  if (!shouldValidate) return spacing;

  if (spacing < 0) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Label spacing $spacing is negative, using 0',
      );
    }
    return 0;
  }

  if (spacing > TextFieldSecurityConfig.maxLabelSpacing) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC TextField Security] Label spacing $spacing above max ${TextFieldSecurityConfig.maxLabelSpacing}',
      );
    }
    return TextFieldSecurityConfig.maxLabelSpacing;
  }

  return spacing;
}

/// Safely executes a text field callback with error handling.
void safeTextFieldCallback(
  void Function(String)? callback,
  String value, {
  String context = 'TextField callback',
}) {
  if (callback == null) return;

  try {
    callback(value);
  } catch (e, stack) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC TextField Security] $context error: $e');
      debugPrint('$stack');
    }
  }
}

/// Safely executes a void callback with error handling.
void safeTextFieldVoidCallback(
  VoidCallback? callback, {
  String context = 'TextField void callback',
}) {
  if (callback == null) return;

  try {
    callback();
  } catch (e, stack) {
    if (TextFieldSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC TextField Security] $context error: $e');
      debugPrint('$stack');
    }
  }
}
