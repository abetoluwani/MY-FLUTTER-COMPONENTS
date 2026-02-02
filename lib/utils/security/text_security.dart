import 'dart:ui';

import 'package:flutter/foundation.dart';

/// Security configuration for Text widgets.
///
/// Security is OFF by default. Enable it globally or per-widget.
///
/// Example:
/// ```dart
/// // Enable security globally
/// TextSecurityConfig.enableSecurity();
///
/// // Or per-widget
/// AppText(
///   'Hello',
///   enableSecurity: true,
/// )
/// ```
class TextSecurityConfig {
  /// Whether to enforce validation. Defaults to false (security OFF).
  static bool enforceValidation = false;

  /// Enable debug logging for security events.
  static bool enableSecurityLogging = kDebugMode;

  // ============== Configurable Limits ==============

  /// Maximum allowed text length (to prevent memory issues)
  static int maxTextLength = 10000;

  /// Maximum font size
  static double maxFontSize = 200.0;

  /// Minimum font size
  static double minFontSize = 6.0;

  /// Maximum letter spacing
  static double maxLetterSpacing = 50.0;

  /// Minimum letter spacing
  static double minLetterSpacing = -10.0;

  /// Maximum word spacing
  static double maxWordSpacing = 100.0;

  /// Minimum word spacing
  static double minWordSpacing = -20.0;

  /// Maximum line height multiplier
  static double maxLineHeight = 5.0;

  /// Minimum line height multiplier
  static double minLineHeight = 0.5;

  /// Maximum max lines
  static int maxMaxLines = 10000;

  /// Maximum text scale factor
  static double maxTextScaleFactor = 5.0;

  /// Minimum text scale factor
  static double minTextScaleFactor = 0.5;

  /// Maximum decoration thickness
  static double maxDecorationThickness = 10.0;

  /// Maximum shadow blur radius
  static double maxShadowBlurRadius = 50.0;

  /// Maximum number of shadows
  static int maxShadowCount = 5;

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
    maxTextLength = 10000;
    maxFontSize = 200.0;
    minFontSize = 6.0;
    maxLetterSpacing = 50.0;
    minLetterSpacing = -10.0;
    maxWordSpacing = 100.0;
    minWordSpacing = -20.0;
    maxLineHeight = 5.0;
    minLineHeight = 0.5;
    maxMaxLines = 10000;
    maxTextScaleFactor = 5.0;
    minTextScaleFactor = 0.5;
    maxDecorationThickness = 10.0;
    maxShadowBlurRadius = 50.0;
    maxShadowCount = 5;
  }
}

// ============== Validation Functions ==============

/// Validates and sanitizes text content.
/// Returns the validated text string.
String validateTextContent(String? text, {bool? enableSecurity}) {
  final shouldValidate = enableSecurity ?? TextSecurityConfig.enforceValidation;

  if (text == null) return '';
  if (!shouldValidate) return text;

  if (text.length > TextSecurityConfig.maxTextLength) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Text length ${text.length} exceeds max ${TextSecurityConfig.maxTextLength}',
      );
    }
    return '${text.substring(0, TextSecurityConfig.maxTextLength)}...';
  }

  return text;
}

/// Validates font size within configured bounds.
double? validateTextFontSize(
  double? fontSize, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? TextSecurityConfig.enforceValidation;

  if (fontSize == null) return defaultValue;
  if (!shouldValidate) return fontSize;

  if (fontSize > TextSecurityConfig.maxFontSize) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Font size $fontSize above max ${TextSecurityConfig.maxFontSize}',
      );
    }
    return TextSecurityConfig.maxFontSize;
  }

  if (fontSize < TextSecurityConfig.minFontSize) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Font size $fontSize below min ${TextSecurityConfig.minFontSize}',
      );
    }
    return TextSecurityConfig.minFontSize;
  }

  return fontSize;
}

/// Validates letter spacing within configured bounds.
double? validateLetterSpacing(
  double? spacing, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? TextSecurityConfig.enforceValidation;

  if (spacing == null) return defaultValue;
  if (!shouldValidate) return spacing;

  if (spacing > TextSecurityConfig.maxLetterSpacing) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Letter spacing $spacing above max ${TextSecurityConfig.maxLetterSpacing}',
      );
    }
    return TextSecurityConfig.maxLetterSpacing;
  }

  if (spacing < TextSecurityConfig.minLetterSpacing) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Letter spacing $spacing below min ${TextSecurityConfig.minLetterSpacing}',
      );
    }
    return TextSecurityConfig.minLetterSpacing;
  }

  return spacing;
}

/// Validates word spacing within configured bounds.
double? validateWordSpacing(
  double? spacing, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? TextSecurityConfig.enforceValidation;

  if (spacing == null) return defaultValue;
  if (!shouldValidate) return spacing;

  if (spacing > TextSecurityConfig.maxWordSpacing) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Word spacing $spacing above max ${TextSecurityConfig.maxWordSpacing}',
      );
    }
    return TextSecurityConfig.maxWordSpacing;
  }

  if (spacing < TextSecurityConfig.minWordSpacing) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Word spacing $spacing below min ${TextSecurityConfig.minWordSpacing}',
      );
    }
    return TextSecurityConfig.minWordSpacing;
  }

  return spacing;
}

/// Validates line height within configured bounds.
double? validateLineHeight(
  double? height, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? TextSecurityConfig.enforceValidation;

  if (height == null) return defaultValue;
  if (!shouldValidate) return height;

  if (height > TextSecurityConfig.maxLineHeight) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Line height $height above max ${TextSecurityConfig.maxLineHeight}',
      );
    }
    return TextSecurityConfig.maxLineHeight;
  }

  if (height < TextSecurityConfig.minLineHeight) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Line height $height below min ${TextSecurityConfig.minLineHeight}',
      );
    }
    return TextSecurityConfig.minLineHeight;
  }

  return height;
}

/// Validates max lines within configured bounds.
int validateMaxLines(int? maxLines, {int? defaultValue, bool? enableSecurity}) {
  final shouldValidate = enableSecurity ?? TextSecurityConfig.enforceValidation;

  if (maxLines == null) return defaultValue ?? TextSecurityConfig.maxMaxLines;
  if (!shouldValidate) return maxLines;

  if (maxLines < 1) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC Text Security] Max lines $maxLines is invalid, using 1');
    }
    return 1;
  }

  if (maxLines > TextSecurityConfig.maxMaxLines) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Max lines $maxLines above max ${TextSecurityConfig.maxMaxLines}',
      );
    }
    return TextSecurityConfig.maxMaxLines;
  }

  return maxLines;
}

/// Validates decoration thickness within configured bounds.
double? validateDecorationThickness(
  double? thickness, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? TextSecurityConfig.enforceValidation;

  if (thickness == null) return defaultValue;
  if (!shouldValidate) return thickness;

  if (thickness < 0) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Decoration thickness $thickness is negative, using 0',
      );
    }
    return 0;
  }

  if (thickness > TextSecurityConfig.maxDecorationThickness) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Decoration thickness $thickness above max ${TextSecurityConfig.maxDecorationThickness}',
      );
    }
    return TextSecurityConfig.maxDecorationThickness;
  }

  return thickness;
}

/// Validates text scale factor within configured bounds.
double? validateTextScaleFactor(
  double? scaleFactor, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? TextSecurityConfig.enforceValidation;

  if (scaleFactor == null) return defaultValue;
  if (!shouldValidate) return scaleFactor;

  if (scaleFactor > TextSecurityConfig.maxTextScaleFactor) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Text scale factor $scaleFactor above max ${TextSecurityConfig.maxTextScaleFactor}',
      );
    }
    return TextSecurityConfig.maxTextScaleFactor;
  }

  if (scaleFactor < TextSecurityConfig.minTextScaleFactor) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Text scale factor $scaleFactor below min ${TextSecurityConfig.minTextScaleFactor}',
      );
    }
    return TextSecurityConfig.minTextScaleFactor;
  }

  return scaleFactor;
}

/// Validates and limits shadow list.
List<Shadow>? validateTextShadows(
  List<Shadow>? shadows, {
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? TextSecurityConfig.enforceValidation;

  if (shadows == null || shadows.isEmpty) return shadows;
  if (!shouldValidate) return shadows;

  if (shadows.length > TextSecurityConfig.maxShadowCount) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC Text Security] Shadow count ${shadows.length} above max ${TextSecurityConfig.maxShadowCount}',
      );
    }
    shadows = shadows.take(TextSecurityConfig.maxShadowCount).toList();
  }

  return shadows.map((shadow) {
    double blurRadius = shadow.blurRadius;
    if (blurRadius > TextSecurityConfig.maxShadowBlurRadius) {
      if (TextSecurityConfig.enableSecurityLogging) {
        debugPrint(
          '[SAC Text Security] Shadow blur radius $blurRadius above max ${TextSecurityConfig.maxShadowBlurRadius}',
        );
      }
      blurRadius = TextSecurityConfig.maxShadowBlurRadius;
    }
    return Shadow(
      color: shadow.color,
      offset: shadow.offset,
      blurRadius: blurRadius,
    );
  }).toList();
}

/// Safely executes a text tap callback with error handling.
void safeTextCallback(
  VoidCallback? callback, {
  String context = 'Text callback',
}) {
  if (callback == null) return;

  try {
    callback();
  } catch (e, stack) {
    if (TextSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC Text Security] $context error: $e');
      debugPrint('$stack');
    }
  }
}
