import 'package:flutter/foundation.dart';

/// Security configuration for SearchBar widgets.
///
/// Security is OFF by default. Enable it globally or per-widget.
///
/// Example:
/// ```dart
/// // Enable security globally
/// SearchBarSecurityConfig.enableSecurity();
///
/// // Or per-widget
/// CustomSearchBar(
///   enableSecurity: true,  // Override global setting
/// )
/// ```
class SearchBarSecurityConfig {
  /// Whether to enforce validation. Defaults to false (security OFF).
  static bool enforceValidation = false;

  /// Enable debug logging for security events.
  static bool enableSecurityLogging = kDebugMode;

  // ============== Configurable Limits ==============

  /// Maximum allowed search query length
  static int maxQueryLength = 500;

  /// Minimum allowed search query length for search to trigger
  static int minQueryLength = 1;

  /// Maximum height for search bar
  static double maxHeight = 100.0;

  /// Minimum height for search bar
  static double minHeight = 40.0;

  /// Maximum border radius
  static double maxBorderRadius = 100.0;

  /// Maximum border width
  static double maxBorderWidth = 5.0;

  /// Maximum icon size
  static double maxIconSize = 48.0;

  /// Minimum icon size
  static double minIconSize = 16.0;

  /// Maximum font size
  static double maxFontSize = 32.0;

  /// Minimum font size
  static double minFontSize = 10.0;

  /// Maximum padding value
  static double maxPadding = 32.0;

  /// Debounce duration for search (milliseconds)
  static int maxDebounceDuration = 2000;

  /// Minimum debounce duration (milliseconds)
  static int minDebounceDuration = 100;

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
    maxQueryLength = 500;
    minQueryLength = 1;
    maxHeight = 100.0;
    minHeight = 40.0;
    maxBorderRadius = 100.0;
    maxBorderWidth = 5.0;
    maxIconSize = 48.0;
    minIconSize = 16.0;
    maxFontSize = 32.0;
    minFontSize = 10.0;
    maxPadding = 32.0;
    maxDebounceDuration = 2000;
    minDebounceDuration = 100;
  }
}

// ============== Validation Functions ==============

/// Validates and sanitizes search query.
/// Returns the validated query string.
String validateSearchQuery(String? query, {bool? enableSecurity}) {
  final shouldValidate =
      enableSecurity ?? SearchBarSecurityConfig.enforceValidation;

  if (query == null || query.isEmpty) return '';
  if (!shouldValidate) return query;

  // Trim whitespace
  String sanitized = query.trim();

  // Enforce max length
  if (sanitized.length > SearchBarSecurityConfig.maxQueryLength) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Query length ${sanitized.length} exceeds max ${SearchBarSecurityConfig.maxQueryLength}',
      );
    }
    sanitized = sanitized.substring(0, SearchBarSecurityConfig.maxQueryLength);
  }

  return sanitized;
}

/// Validates search bar height within configured bounds.
double validateSearchBarHeight(
  double? height, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? SearchBarSecurityConfig.enforceValidation;

  if (height == null) return defaultValue;
  if (!shouldValidate) return height;

  if (height > SearchBarSecurityConfig.maxHeight) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Height $height above max ${SearchBarSecurityConfig.maxHeight}',
      );
    }
    return SearchBarSecurityConfig.maxHeight;
  }

  if (height < SearchBarSecurityConfig.minHeight) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Height $height below min ${SearchBarSecurityConfig.minHeight}',
      );
    }
    return SearchBarSecurityConfig.minHeight;
  }

  return height;
}

/// Validates border radius within configured bounds.
double validateSearchBarBorderRadius(
  double? radius, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? SearchBarSecurityConfig.enforceValidation;

  if (radius == null) return defaultValue;
  if (!shouldValidate) return radius;

  if (radius < 0) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Border radius $radius is negative, using 0',
      );
    }
    return 0;
  }

  if (radius > SearchBarSecurityConfig.maxBorderRadius) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Border radius $radius above max ${SearchBarSecurityConfig.maxBorderRadius}',
      );
    }
    return SearchBarSecurityConfig.maxBorderRadius;
  }

  return radius;
}

/// Validates icon size within configured bounds.
double validateSearchBarIconSize(
  double? size, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? SearchBarSecurityConfig.enforceValidation;

  if (size == null) return defaultValue;
  if (!shouldValidate) return size;

  if (size > SearchBarSecurityConfig.maxIconSize) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Icon size $size above max ${SearchBarSecurityConfig.maxIconSize}',
      );
    }
    return SearchBarSecurityConfig.maxIconSize;
  }

  if (size < SearchBarSecurityConfig.minIconSize) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Icon size $size below min ${SearchBarSecurityConfig.minIconSize}',
      );
    }
    return SearchBarSecurityConfig.minIconSize;
  }

  return size;
}

/// Validates font size within configured bounds.
double validateSearchBarFontSize(
  double? fontSize, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? SearchBarSecurityConfig.enforceValidation;

  if (fontSize == null) return defaultValue;
  if (!shouldValidate) return fontSize;

  if (fontSize > SearchBarSecurityConfig.maxFontSize) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Font size $fontSize above max ${SearchBarSecurityConfig.maxFontSize}',
      );
    }
    return SearchBarSecurityConfig.maxFontSize;
  }

  if (fontSize < SearchBarSecurityConfig.minFontSize) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Font size $fontSize below min ${SearchBarSecurityConfig.minFontSize}',
      );
    }
    return SearchBarSecurityConfig.minFontSize;
  }

  return fontSize;
}

/// Validates padding within configured bounds.
double validateSearchBarPadding(
  double? padding, {
  required double defaultValue,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? SearchBarSecurityConfig.enforceValidation;

  if (padding == null) return defaultValue;
  if (!shouldValidate) return padding;

  if (padding < 0) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Padding $padding is negative, using 0',
      );
    }
    return 0;
  }

  if (padding > SearchBarSecurityConfig.maxPadding) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Padding $padding above max ${SearchBarSecurityConfig.maxPadding}',
      );
    }
    return SearchBarSecurityConfig.maxPadding;
  }

  return padding;
}

/// Validates debounce duration within configured bounds.
int validateDebounceDuration(
  int? duration, {
  int defaultValue = 300,
  bool? enableSecurity,
}) {
  final shouldValidate =
      enableSecurity ?? SearchBarSecurityConfig.enforceValidation;

  if (duration == null) return defaultValue;
  if (!shouldValidate) return duration;

  if (duration > SearchBarSecurityConfig.maxDebounceDuration) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Debounce $duration above max ${SearchBarSecurityConfig.maxDebounceDuration}',
      );
    }
    return SearchBarSecurityConfig.maxDebounceDuration;
  }

  if (duration < SearchBarSecurityConfig.minDebounceDuration) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint(
        '[SAC SearchBar Security] Debounce $duration below min ${SearchBarSecurityConfig.minDebounceDuration}',
      );
    }
    return SearchBarSecurityConfig.minDebounceDuration;
  }

  return duration;
}

/// Safely executes a search callback with error handling.
void safeSearchCallback(
  void Function(String)? callback,
  String value, {
  String context = 'Search callback',
}) {
  if (callback == null) return;

  try {
    callback(value);
  } catch (e, stack) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC SearchBar Security] $context error: $e');
      debugPrint('$stack');
    }
  }
}

/// Safely executes a void callback with error handling.
void safeSearchVoidCallback(
  VoidCallback? callback, {
  String context = 'Search void callback',
}) {
  if (callback == null) return;

  try {
    callback();
  } catch (e, stack) {
    if (SearchBarSecurityConfig.enableSecurityLogging) {
      debugPrint('[SAC SearchBar Security] $context error: $e');
      debugPrint('$stack');
    }
  }
}

/// Rate limiter for search queries to prevent abuse.
class SearchRateLimiter {
  final int maxQueriesPerMinute;
  final List<DateTime> _queryTimestamps = [];

  SearchRateLimiter({this.maxQueriesPerMinute = 60});

  /// Check if a new query is allowed.
  bool isQueryAllowed() {
    final now = DateTime.now();
    final oneMinuteAgo = now.subtract(const Duration(minutes: 1));

    // Remove old timestamps
    _queryTimestamps.removeWhere(
      (timestamp) => timestamp.isBefore(oneMinuteAgo),
    );

    if (_queryTimestamps.length >= maxQueriesPerMinute) {
      if (SearchBarSecurityConfig.enableSecurityLogging) {
        debugPrint('[SAC SearchBar Security] Rate limit exceeded');
      }
      return false;
    }

    _queryTimestamps.add(now);
    return true;
  }

  /// Reset the rate limiter.
  void reset() {
    _queryTimestamps.clear();
  }
}
