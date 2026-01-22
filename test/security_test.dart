// Security Features Test
// Run with: flutter test test/security_test.dart

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swiss_army_component/utils/utils.dart';

void main() {
  setUp(() {
    // Reset to defaults before each test
    ButtonSecurityConfig.resetToDefaults();
    AppBarSecurityConfig.resetToDefaults();
  });

  group('Security Config Defaults', () {
    test('Button security is OFF by default', () {
      expect(ButtonSecurityConfig.enforceValidation, false);
    });

    test('AppBar security is OFF by default', () {
      expect(AppBarSecurityConfig.enforceValidation, false);
    });
  });

  group('Security OFF - Values Pass Through', () {
    test('validateSize returns original value when security OFF', () {
      final result = validateSize(5000.0, defaultValue: 50.0);
      expect(result, 5000.0);
    });

    test('validateFontSize returns original value when security OFF', () {
      final result = validateFontSize(500.0, defaultValue: 14.0);
      expect(result, 500.0);
    });

    test('sanitizeButtonText returns original text when security OFF', () {
      final longText = 'A' * 1000;
      final result = sanitizeButtonText(longText);
      expect(result.length, 1000);
    });

    test('validateAppBarHeight returns original value when security OFF', () {
      final result = validateAppBarHeight(1000.0, defaultValue: 60.0);
      expect(result, 1000.0);
    });

    test('sanitizeTitleText returns original text when security OFF', () {
      final longTitle = 'B' * 500;
      final result = sanitizeTitleText(longTitle);
      expect(result.length, 500);
    });
  });

  group('Security ON - Values Validated', () {
    setUp(() {
      ButtonSecurityConfig.enableSecurity();
      AppBarSecurityConfig.enableSecurity();
    });

    test('validateSize clamps to max when security ON', () {
      final result = validateSize(5000.0, defaultValue: 50.0);
      expect(result, ButtonSecurityConfig.maxButtonSize);
    });

    test('validateSize clamps to min when security ON', () {
      final result = validateSize(1.0, defaultValue: 50.0);
      expect(result, ButtonSecurityConfig.minButtonSize);
    });

    test('validateFontSize clamps when security ON', () {
      final result = validateFontSize(500.0, defaultValue: 14.0);
      expect(result, ButtonSecurityConfig.maxFontSize);
    });

    test('sanitizeButtonText truncates when security ON', () {
      final longText = 'A' * 1000;
      final result = sanitizeButtonText(longText);
      expect(result.length, lessThanOrEqualTo(500));
      expect(result.endsWith('...'), true);
    });

    test('validateAppBarHeight clamps when security ON', () {
      final result = validateAppBarHeight(1000.0, defaultValue: 60.0);
      expect(result, AppBarSecurityConfig.maxAppBarHeight);
    });

    test('sanitizeTitleText truncates when security ON', () {
      final longTitle = 'B' * 500;
      final result = sanitizeTitleText(longTitle);
      expect(
        result.length,
        lessThanOrEqualTo(AppBarSecurityConfig.maxTitleLength),
      );
    });

    test('validateElevation prevents negative values', () {
      final result = validateElevation(-5.0, defaultValue: 2.0);
      expect(result, 0);
    });
  });

  group('Per-Widget Override', () {
    test('enableSecurity=false overrides global ON setting', () {
      ButtonSecurityConfig.enableSecurity();
      final result = validateSize(
        5000.0,
        defaultValue: 50.0,
        enableSecurity: false,
      );
      expect(result, 5000.0); // Original value, not clamped
    });

    test('enableSecurity=true overrides global OFF setting', () {
      ButtonSecurityConfig.disableSecurity();
      final result = validateSize(
        5000.0,
        defaultValue: 50.0,
        enableSecurity: true,
      );
      expect(result, ButtonSecurityConfig.maxButtonSize); // Clamped
    });

    test('enableSecurity=false for text bypasses truncation', () {
      ButtonSecurityConfig.enableSecurity();
      final longText = 'A' * 1000;
      final result = sanitizeButtonText(longText, enableSecurity: false);
      expect(result.length, 1000);
    });

    test('enableSecurity=true for AppBar overrides global OFF', () {
      AppBarSecurityConfig.disableSecurity();
      final result = validateAppBarHeight(
        1000.0,
        defaultValue: 60.0,
        enableSecurity: true,
      );
      expect(result, AppBarSecurityConfig.maxAppBarHeight);
    });
  });

  group('Custom Limits', () {
    test('Custom maxButtonSize is respected', () {
      ButtonSecurityConfig.enableSecurity();
      ButtonSecurityConfig.maxButtonSize = 2000.0;

      final withinLimit = validateSize(1500.0, defaultValue: 50.0);
      expect(withinLimit, 1500.0);

      final exceedsLimit = validateSize(3000.0, defaultValue: 50.0);
      expect(exceedsLimit, 2000.0);
    });

    test('Custom maxTitleLength is respected', () {
      AppBarSecurityConfig.enableSecurity();
      AppBarSecurityConfig.maxTitleLength = 50;

      final longTitle = 'B' * 100;
      final result = sanitizeTitleText(longTitle);
      expect(result.length, lessThanOrEqualTo(50));
    });
  });

  group('Enable/Disable Methods', () {
    test('enableSecurity() turns on validation', () {
      ButtonSecurityConfig.disableSecurity();
      expect(ButtonSecurityConfig.enforceValidation, false);

      ButtonSecurityConfig.enableSecurity();
      expect(ButtonSecurityConfig.enforceValidation, true);
    });

    test('disableSecurity() turns off validation', () {
      ButtonSecurityConfig.enableSecurity();
      expect(ButtonSecurityConfig.enforceValidation, true);

      ButtonSecurityConfig.disableSecurity();
      expect(ButtonSecurityConfig.enforceValidation, false);
    });

    test('resetToDefaults() resets all settings', () {
      ButtonSecurityConfig.enableSecurity();
      ButtonSecurityConfig.maxButtonSize = 5000.0;

      ButtonSecurityConfig.resetToDefaults();

      expect(ButtonSecurityConfig.enforceValidation, false);
      expect(ButtonSecurityConfig.maxButtonSize, 1000.0);
    });
  });

  group('Safe Callback Execution', () {
    test('safeExecute runs callback successfully', () {
      var executed = false;
      safeExecute(() {
        executed = true;
      });
      expect(executed, true);
    });

    test('safeExecute catches errors without crashing', () {
      // This should not throw
      expect(() {
        safeExecute(() {
          throw Exception('Test error');
        });
      }, returnsNormally);
    });

    test('safeExecute handles null callback', () {
      expect(() {
        safeExecute(null);
      }, returnsNormally);
    });
  });

  group('AppBar Specific Validation', () {
    setUp(() {
      AppBarSecurityConfig.enableSecurity();
    });

    test('validateTabs limits tab count', () {
      final tabs = List.generate(50, (i) => Tab(text: 'Tab $i'));
      final result = validateTabs(tabs);
      expect(result.length, AppBarSecurityConfig.maxTabCount);
    });

    test('validateActions limits action count', () {
      final actions = List.generate(
        20,
        (i) => IconButton(icon: Icon(Icons.add), onPressed: () {}),
      );
      final result = validateActions(actions);
      expect(result!.length, AppBarSecurityConfig.maxActionsCount);
    });

    test('validateGradientColors requires at least 2 colors', () {
      final singleColor = [Colors.red];
      final result = validateGradientColors(singleColor);
      expect(result, null);
    });

    test('validateGradientColors passes with valid colors', () {
      final validColors = [Colors.red, Colors.blue];
      final result = validateGradientColors(validColors);
      expect(result, validColors);
    });
  });
}
