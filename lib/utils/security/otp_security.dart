import 'package:flutter/foundation.dart';

/// Security configuration for OTP/PIN input fields.
///
/// Security is OFF by default. Enable it globally or per-widget.
///
/// Example:
/// ```dart
/// // Enable security globally
/// OTPSecurityConfig.enableSecurity();
///
/// // Or per-widget
/// OTPTextField(
///   length: 6,
///   enableSecurity: true,  // Override global setting
/// )
/// ```
class OTPSecurityConfig {
  /// Whether to enforce validation. Defaults to false (security OFF).
  static bool enforceValidation = false;

  /// Enable debug logging for security events.
  static bool enableSecurityLogging = kDebugMode;

  // ============== Configurable Limits ==============

  /// Maximum allowed OTP/PIN length
  static int maxOTPLength = 10;

  /// Minimum allowed OTP/PIN length
  static int minOTPLength = 4;

  /// Maximum pin box size
  static double maxPinSize = 100.0;

  /// Minimum pin box size
  static double minPinSize = 30.0;

  /// Maximum font size for OTP digits
  static double maxFontSize = 48.0;

  /// Minimum font size for OTP digits
  static double minFontSize = 12.0;

  /// Maximum border width
  static double maxBorderWidth = 5.0;

  /// Maximum border radius
  static double maxBorderRadius = 50.0;

  /// Maximum spacing between pins
  static double maxSpacing = 32.0;

  /// Maximum attempts before lockout (0 = no limit)
  static int maxAttempts = 5;

  /// Lockout duration after max attempts
  static Duration lockoutDuration = const Duration(minutes: 1);

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
    maxOTPLength = 10;
    minOTPLength = 4;
    maxPinSize = 100.0;
    minPinSize = 30.0;
    maxFontSize = 48.0;
    minFontSize = 12.0;
    maxBorderWidth = 5.0;
    maxBorderRadius = 50.0;
    maxSpacing = 32.0;
    maxAttempts = 5;
    lockoutDuration = const Duration(minutes: 1);
  }
}

// ============== Validation Functions ==============

/// Validates OTP length within configured bounds.
/// Returns the validated length.
int validateOTPLength(
  int? length, {
  int defaultValue = 6,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? OTPSecurityConfig.enforceValidation;

  if (length == null) return defaultValue;
  if (!shouldValidate) return length;

  if (length > OTPSecurityConfig.maxOTPLength) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Length $length exceeds max ${OTPSecurityConfig.maxOTPLength}',
      );
    }
    return OTPSecurityConfig.maxOTPLength;
  }

  if (length < OTPSecurityConfig.minOTPLength) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Length $length below min ${OTPSecurityConfig.minOTPLength}',
      );
    }
    return OTPSecurityConfig.minOTPLength;
  }

  return length;
}

/// Validates pin box size within configured bounds.
double validatePinSize(
  double? size, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? OTPSecurityConfig.enforceValidation;

  if (size == null) return defaultValue;
  if (!shouldValidate) return size;

  if (size > OTPSecurityConfig.maxPinSize) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Pin size $size above max ${OTPSecurityConfig.maxPinSize}',
      );
    }
    return OTPSecurityConfig.maxPinSize;
  }

  if (size < OTPSecurityConfig.minPinSize) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Pin size $size below min ${OTPSecurityConfig.minPinSize}',
      );
    }
    return OTPSecurityConfig.minPinSize;
  }

  return size;
}

/// Validates font size within configured bounds.
double validateOTPFontSize(
  double? fontSize, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? OTPSecurityConfig.enforceValidation;

  if (fontSize == null) return defaultValue;
  if (!shouldValidate) return fontSize;

  if (fontSize > OTPSecurityConfig.maxFontSize) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Font size $fontSize above max ${OTPSecurityConfig.maxFontSize}',
      );
    }
    return OTPSecurityConfig.maxFontSize;
  }

  if (fontSize < OTPSecurityConfig.minFontSize) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Font size $fontSize below min ${OTPSecurityConfig.minFontSize}',
      );
    }
    return OTPSecurityConfig.minFontSize;
  }

  return fontSize;
}

/// Validates border width within configured bounds.
double validateOTPBorderWidth(
  double? width, {
  double defaultValue = 1.5,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? OTPSecurityConfig.enforceValidation;

  if (width == null) return defaultValue;
  if (!shouldValidate) return width;

  if (width < 0) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC OTP Security] Border width $width is negative, using 0');
    }
    return 0;
  }

  if (width > OTPSecurityConfig.maxBorderWidth) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Border width $width above max ${OTPSecurityConfig.maxBorderWidth}',
      );
    }
    return OTPSecurityConfig.maxBorderWidth;
  }

  return width;
}

/// Validates border radius within configured bounds.
double validateOTPBorderRadius(
  double? radius, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? OTPSecurityConfig.enforceValidation;

  if (radius == null) return defaultValue;
  if (!shouldValidate) return radius;

  if (radius < 0) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Border radius $radius is negative, using 0',
      );
    }
    return 0;
  }

  if (radius > OTPSecurityConfig.maxBorderRadius) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Border radius $radius above max ${OTPSecurityConfig.maxBorderRadius}',
      );
    }
    return OTPSecurityConfig.maxBorderRadius;
  }

  return radius;
}

/// Validates spacing between pins.
double validateOTPSpacing(
  double? spacing, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate = enableSecurity ?? OTPSecurityConfig.enforceValidation;

  if (spacing == null) return defaultValue;
  if (!shouldValidate) return spacing;

  if (spacing < 0) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC OTP Security] Spacing $spacing is negative, using 0');
    }
    return 0;
  }

  if (spacing > OTPSecurityConfig.maxSpacing) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC OTP Security] Spacing $spacing above max ${OTPSecurityConfig.maxSpacing}',
      );
    }
    return OTPSecurityConfig.maxSpacing;
  }

  return spacing;
}

/// Safely executes an OTP callback with error handling.
void safeOTPCallback(
  void Function(String)? callback,
  String value, {
  String context = 'OTP callback',
}) {
  if (callback == null) return;

  try {
    callback(value);
  } catch (e, stack) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC OTP Security] $context error: $e');
      debugPrint('$stack');
    }
  }
}

/// Safely executes a void callback with error handling.
void safeOTPVoidCallback(
  VoidCallback? callback, {
  String context = 'OTP void callback',
}) {
  if (callback == null) return;

  try {
    callback();
  } catch (e, stack) {
    if (OTPSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC OTP Security] $context error: $e');
      debugPrint('$stack');
    }
  }
}

/// Rate limiter for OTP verification attempts.
class OTPAttemptTracker {
  final int maxAttempts;
  final Duration lockoutDuration;

  int _attempts = 0;
  DateTime? _lockoutUntil;

  OTPAttemptTracker({int? maxAttempts, Duration? lockoutDuration})
    : maxAttempts = maxAttempts ?? OTPSecurityConfig.maxAttempts,
      lockoutDuration = lockoutDuration ?? OTPSecurityConfig.lockoutDuration;

  /// Check if currently locked out.
  bool get isLockedOut {
    if (_lockoutUntil == null) return false;
    if (DateTime.now().isAfter(_lockoutUntil!)) {
      _lockoutUntil = null;
      _attempts = 0;
      return false;
    }
    return true;
  }

  /// Get remaining lockout time.
  Duration get remainingLockout {
    if (_lockoutUntil == null) return Duration.zero;
    final remaining = _lockoutUntil!.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }

  /// Get current attempt count.
  int get attempts => _attempts;

  /// Record an attempt. Returns true if attempt is allowed, false if locked out.
  bool recordAttempt() {
    if (isLockedOut) return false;

    _attempts++;

    if (maxAttempts > 0 && _attempts >= maxAttempts) {
      _lockoutUntil = DateTime.now().add(lockoutDuration);
      if (OTPSecurityConfig.enableSecurityLogging) {
        debugPrint(
          '[SAC OTP Security] Max attempts reached, locked out for ${lockoutDuration.inSeconds}s',
        );
      }
      return false;
    }

    return true;
  }

  /// Reset attempts on successful verification.
  void resetAttempts() {
    _attempts = 0;
    _lockoutUntil = null;
  }

  /// Clear lockout (for admin/testing purposes).
  void clearLockout() {
    _lockoutUntil = null;
    _attempts = 0;
  }
}
