import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiss_army_component/swiss_army_component.dart';

void main() {
  testWidgets('SocialButton renders Google button correctly', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: SocialButton(
              provider: SocialProvider.google,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Continue with Google'), findsOneWidget);
    expect(find.byType(SvgPicture), findsOneWidget);

    // Google button should have white background
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.style?.backgroundColor?.resolve({}), Colors.white);
  });

  testWidgets('SocialButton renders Apple button correctly (light mode)', (
    tester,
  ) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SocialButton(
              provider: SocialProvider.apple,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Continue with Apple'), findsOneWidget);
    // Apple (light mode) uses Black background
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.style?.backgroundColor?.resolve({}), Colors.black);
  });

  testWidgets('SocialButton renders Facebook button correctly', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: SocialButton(
              provider: SocialProvider.facebook,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    expect(find.text('Continue with Facebook'), findsOneWidget);
    // Facebook uses standard blue
    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.style?.backgroundColor?.resolve({}), const Color(0xFF1877F2));
  });

  testWidgets('SocialButton renders Twitter button', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        child: MaterialApp(
          home: Scaffold(
            body: SocialButton(
              provider: SocialProvider.twitter,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
    expect(find.text('Continue with X'), findsOneWidget);
  });

  testWidgets('SocialButton renders Outlined style correctly', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        child: MaterialApp(
          home: Scaffold(
            body: SocialButton(
              provider: SocialProvider.google,
              style: SocialButtonStyle.outlined,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    // Outlined should have transparent background
    expect(button.style?.backgroundColor?.resolve({}), Colors.transparent);
    // Should have border side
    expect(
      button.style?.shape?.resolve({}),
      isInstanceOf<RoundedRectangleBorder>(),
    );
  });

  testWidgets('SocialButton filled style has 0 elevation', (tester) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        child: MaterialApp(
          home: Scaffold(
            body: SocialButton(
              provider: SocialProvider.linkedin,
              style: SocialButtonStyle.filled,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );

    final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
    expect(button.style?.elevation?.resolve({}), 0.0);
  });
}
