import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiss_army_component/swiss_army_component.dart';

void main() {
  testWidgets(
    'AppText should inherit color from Theme when no color is provided',
    (tester) async {
      const expectedColor = Colors.red;

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MaterialApp(
            theme: ThemeData(
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: expectedColor),
              ),
            ),
            home: Scaffold(
              body: AppText(
                'Theme Test',
                style: AppTextStyle
                    .medium, // defaults to using bodyMedium implicitly via Text widget if not overridden
              ),
            ),
          ),
        ),
      );

      // Find the Text widget that AppText renders
      final textFinder = find.text('Theme Test');
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);

      if (textWidget.style?.color != null) {
        expect(
          textWidget.style!.color,
          expectedColor,
          reason: 'AppText should use theme color, not hardcoded black',
        );
      } else {
        final BuildContext context = tester.element(textFinder);
        final defaultStyle = DefaultTextStyle.of(context).style;
        expect(defaultStyle.color, expectedColor);
      }
    },
  );

  testWidgets(
    'PriceText should inherit color from Theme when no color is provided',
    (tester) async {
      const expectedColor = Colors.blue;

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MaterialApp(
            theme: ThemeData(
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: expectedColor),
              ),
            ),
            home: Scaffold(
              body: PriceText(
                price: '100',
                currency: Currency.usd,
                // No color provided, should inherit
              ),
            ),
          ),
        ),
      );

      // Robustly find the text widget by finding any text containing 100
      final allTexts = tester.widgetList<Text>(find.byType(Text));
      Text? targetWidget;
      for (final text in allTexts) {
        if (text.data?.contains('100') ?? false) {
          targetWidget = text;
          break;
        }
      }

      expect(
        targetWidget,
        isNotNull,
        reason: 'Could not find text widget containing "100"',
      );

      // Verify color
      if (targetWidget!.style?.color != null) {
        expect(
          targetWidget.style!.color,
          expectedColor,
          reason:
              'PriceText should use theme color, not hardcoded black. Found color: ${targetWidget.style!.color}',
        );
      } else {
        final BuildContext context = tester.element(
          find.byWidget(targetWidget),
        );
        final defaultStyle = DefaultTextStyle.of(context).style;
        expect(defaultStyle.color, expectedColor);
      }
    },
  );

  testWidgets(
    'BrandNameText should inherit color from Theme when no color is provided',
    (tester) async {
      const expectedColor = Colors.green;

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MaterialApp(
            theme: ThemeData(
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: expectedColor),
              ),
            ),
            home: Scaffold(
              body: BrandNameText(
                title: 'Brand Test',
                size: BrandNameSize.medium,
                // No color provided, should inherit
              ),
            ),
          ),
        ),
      );

      final textFinder = find.text('Brand Test');
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);

      if (textWidget.style?.color != null) {
        expect(
          textWidget.style!.color,
          expectedColor,
          reason: 'BrandNameText should use theme color, not hardcoded black',
        );
      } else {
        final BuildContext context = tester.element(textFinder);
        final defaultStyle = DefaultTextStyle.of(context).style;
        expect(defaultStyle.color, expectedColor);
      }
    },
  );

  testWidgets(
    'BigAppText should inherit color from Theme when no color is provided',
    (tester) async {
      const expectedColor = Colors.purple;

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MaterialApp(
            theme: ThemeData(
              textTheme: const TextTheme(
                bodyMedium: TextStyle(color: expectedColor),
              ),
            ),
            home: Scaffold(
              body: BigAppText(
                'Big Text Test',
                // No color provided, should inherit
              ),
            ),
          ),
        ),
      );

      final textFinder = find.text('Big Text Test');
      expect(textFinder, findsOneWidget);

      final textWidget = tester.widget<Text>(textFinder);

      if (textWidget.style?.color != null) {
        expect(
          textWidget.style!.color,
          expectedColor,
          reason: 'BigAppText should use theme color, not hardcoded black',
        );
      } else {
        final BuildContext context = tester.element(textFinder);
        final defaultStyle = DefaultTextStyle.of(context).style;
        expect(defaultStyle.color, expectedColor);
      }
    },
  );

  testWidgets('AppText should merge color prop with provided textStyle', (
    tester,
  ) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: AppText(
              'Merge Test',
              textStyle: const TextStyle(fontSize: 20),
              color: Colors.red, // Should override or merge
            ),
          ),
        ),
      ),
    );

    final textFinder = find.text('Merge Test');
    final textWidget = tester.widget<Text>(textFinder);

    // Current implementation might incorrectly return textStyle as-is
    // We generally expect priority:
    // 1. Explicit props on AppText (color, fontSize) should OVERRIDE or MERGE with textStyle?
    //    Actually, typically Component(style: S) means S is the base, but explicit props usually override.
    //    Let's check if the logic supports it.

    expect(
      textWidget.style?.color,
      Colors.red,
      reason: 'Color prop should apply even if textStyle is provided',
    );
  });

  testWidgets('AppText should use custom fontFamily if provided', (
    tester,
  ) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(body: AppText('Font Test', fontFamily: 'CustomFont')),
        ),
      ),
    );

    final textFinder = find.text('Font Test');
    expect(textFinder, findsOneWidget);

    final textWidget = tester.widget<Text>(textFinder);

    expect(textWidget.style?.fontFamily, 'CustomFont');
  });

  testWidgets(
    'AppText should inherit fontFamily from Theme when not provided',
    (tester) async {
      const expectedFontFamily = 'Roboto';

      await tester.pumpWidget(
        ScreenUtilInit(
          designSize: const Size(375, 812),
          child: MaterialApp(
            theme: ThemeData(
              fontFamily: expectedFontFamily, // Set global font
              textTheme: const TextTheme(
                bodyMedium: TextStyle(fontFamily: expectedFontFamily),
              ),
            ),
            home: Scaffold(body: AppText('Theme Font Test')),
          ),
        ),
      );

      final textFinder = find.text('Theme Font Test');
      final textWidget = tester.widget<Text>(textFinder);

      final actualFont = textWidget.style?.fontFamily;

      if (actualFont != null) {
        // Should contain Roboto. If it's Poppins, this fails.
        expect(
          actualFont,
          contains(expectedFontFamily),
          reason: 'Should inherit $expectedFontFamily from theme',
        );
      } else {
        // Inherited. Check context.
        final context = tester.element(textFinder);
        final defaultStyle = DefaultTextStyle.of(context).style;
        expect(defaultStyle.fontFamily, contains(expectedFontFamily));
      }
    },
  );
}
