import 'dart:async';

import 'package:flutter/foundation.dart';

class ButtonSecurityConfig {
  static bool enforceValidation = false;
  static Duration defaultDebounceDuration = const Duration(milliseconds: 300);
  static Duration defaultCooldownDuration = const Duration(seconds: 1);
  static bool enableSecurityLogging = kDebugMode;
  static double maxButtonSize = 1000.0;
  static double minButtonSize = 20.0;
  static double maxFontSize = 100.0;
  static double minFontSize = 8.0;
  static double maxElevation = 24.0;
  static double maxBorderRadius = 100.0;

  static void setDefaultDebounceDuration(Duration duration) {
    defaultDebounceDuration = duration;
  }

  static void setDefaultCooldownDuration(Duration duration) {
    defaultCooldownDuration = duration;
  }

  static void enableSecurity() {
    enforceValidation = true;
  }

  static void disableSecurity() {
    enforceValidation = false;
  }

  static void resetToDefaults() {
    enforceValidation = false;
    defaultDebounceDuration = const Duration(milliseconds: 300);
    defaultCooldownDuration = const Duration(seconds: 1);
    enableSecurityLogging = kDebugMode;
    maxButtonSize = 1000.0;
    minButtonSize = 20.0;
    maxFontSize = 100.0;
    minFontSize = 8.0;
    maxElevation = 24.0;
    maxBorderRadius = 100.0;
  }
}

mixin ButtonDebounceMixin {
  Timer? _debounceTimer;
  bool _isDebouncing = false;

  bool get isDebouncing => _isDebouncing;

  void debounce(VoidCallback? callback, {Duration? duration}) {
    if (callback == null || _isDebouncing) return;

    _isDebouncing = true;
    _debounceTimer?.cancel();

    safeExecute(callback);

    _debounceTimer = Timer(
      duration ?? ButtonSecurityConfig.defaultDebounceDuration,
      () => _isDebouncing = false,
    );
  }

  void cancelDebounce() {
    _debounceTimer?.cancel();
    _isDebouncing = false;
  }
}

mixin ButtonRateLimitMixin {
  DateTime? _lastExecutionTime;
  int _executionCount = 0;

  int get maxExecutionsPerWindow => 5;

  Duration get rateLimitWindow => const Duration(seconds: 10);

  bool get isRateLimited {
    if (_lastExecutionTime == null) return false;

    final now = DateTime.now();
    final elapsed = now.difference(_lastExecutionTime!);

    if (elapsed > rateLimitWindow) {
      _executionCount = 0;
      return false;
    }

    return _executionCount >= maxExecutionsPerWindow;
  }

  void rateLimitedExecute(VoidCallback? callback, {Duration? cooldown}) {
    if (callback == null) return;

    final now = DateTime.now();

    if (_lastExecutionTime != null) {
      final elapsed = now.difference(_lastExecutionTime!);
      final effectiveCooldown =
          cooldown ?? ButtonSecurityConfig.defaultCooldownDuration;

      if (elapsed < effectiveCooldown) {
        _logSecurity('Button press blocked: cooldown active');
        return;
      }
    }

    // Check rate limit
    if (isRateLimited) {
      _logSecurity('Button press blocked: rate limit exceeded');
      return;
    }

    _lastExecutionTime = now;
    _executionCount++;

    safeExecute(callback);
  }

  void resetRateLimit() {
    _lastExecutionTime = null;
    _executionCount = 0;
  }
}

void safeExecute(VoidCallback? callback, {String? context}) {
  if (callback == null) return;

  try {
    callback();
  } catch (e, stackTrace) {
    _logSecurity(
      'Button callback error${context != null ? ' in $context' : ''}: $e',
      stackTrace: stackTrace,
    );
    // In production, you might want to report this to a crash reporting service
  }
}

Future<void> safeExecuteAsync(
  Future<void> Function()? callback, {
  String? context,
}) async {
  if (callback == null) return;

  try {
    await callback();
  } catch (e, stackTrace) {
    _logSecurity(
      'Button async callback error${context != null ? ' in $context' : ''}: $e',
      stackTrace: stackTrace,
    );
  }
}

double? validateSize(
  double? value, {
  double? defaultValue,
  double? min,
  double? max,
  bool? enableSecurity,
}) {
  if (value == null) return defaultValue;
  final shouldValidate =
      enableSecurity ?? ButtonSecurityConfig.enforceValidation;
  if (!shouldValidate) return value;

  final effectiveMin = min ?? ButtonSecurityConfig.minButtonSize;
  final effectiveMax = max ?? ButtonSecurityConfig.maxButtonSize;

  if (value < effectiveMin) {
    _logSecurity('Size $value below minimum $effectiveMin, using minimum');
    return effectiveMin;
  }

  if (value > effectiveMax) {
    _logSecurity('Size $value above maximum $effectiveMax, using maximum');
    return effectiveMax;
  }

  return value;
}

double? validateFontSize(
  double? value, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  return validateSize(
    value,
    defaultValue: defaultValue,
    min: ButtonSecurityConfig.minFontSize,
    max: ButtonSecurityConfig.maxFontSize,
    enableSecurity: enableSecurity,
  );
}

double? validateElevation(
  double? value, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  if (value == null) return defaultValue;
  final shouldValidate =
      enableSecurity ?? ButtonSecurityConfig.enforceValidation;
  if (!shouldValidate) return value;

  if (value < 0) {
    _logSecurity('Elevation $value is negative, using 0');
    return 0;
  }

  if (value > ButtonSecurityConfig.maxElevation) {
    _logSecurity(
      'Elevation $value above maximum ${ButtonSecurityConfig.maxElevation}',
    );
    return ButtonSecurityConfig.maxElevation;
  }

  return value;
}

double? validateBorderRadius(
  double? value, {
  double? defaultValue,
  bool? enableSecurity,
}) {
  if (value == null) return defaultValue;
  final shouldValidate =
      enableSecurity ?? ButtonSecurityConfig.enforceValidation;
  if (!shouldValidate) return value;

  if (value < 0) {
    _logSecurity('Border radius $value is negative, using 0');
    return 0;
  }

  if (value > ButtonSecurityConfig.maxBorderRadius) {
    _logSecurity(
      'Border radius $value above maximum ${ButtonSecurityConfig.maxBorderRadius}',
    );
    return ButtonSecurityConfig.maxBorderRadius;
  }

  return value;
}

/// Sanitize text input to prevent potential issues.
String sanitizeButtonText(
  String? text, {
  int maxLength = 500,
  bool? enableSecurity,
}) {
  if (text == null) return '';
  final shouldValidate =
      enableSecurity ?? ButtonSecurityConfig.enforceValidation;
  if (!shouldValidate) return text;

  // Trim whitespace
  var sanitized = text.trim();

  // Limit length to prevent UI overflow attacks
  if (sanitized.length > maxLength) {
    _logSecurity(
      'Button text truncated from ${sanitized.length} to $maxLength',
    );
    sanitized = '${sanitized.substring(0, maxLength - 3)}...';
  }

  return sanitized;
}

/// Log security-related events.
void _logSecurity(String message, {StackTrace? stackTrace}) {
  if (ButtonSecurityConfig.enableSecurityLogging) {
    debugPrint('[SAC Security] $message');
    if (stackTrace != null) {
      debugPrint(stackTrace.toString());
    }
  }
}

/// Extension to add security features to VoidCallback.
extension SecureCallbackExtension on VoidCallback? {
  /// Wrap callback with try-catch for safe execution.
  VoidCallback? get safe {
    if (this == null) return null;
    return () => safeExecute(this);
  }
}
