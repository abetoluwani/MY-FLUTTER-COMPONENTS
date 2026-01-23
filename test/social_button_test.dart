import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:swiss_army_component/swiss_army_component.dart';

void main() {
  testWidgets('SocialLoginButton renders Google button correctly', (
    tester,
  ) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: SocialLoginButton(
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

  testWidgets('SocialLoginButton renders Apple button correctly (light mode)', (
    tester,
  ) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          theme: ThemeData.light(),
          home: Scaffold(
            body: SocialLoginButton(
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

  testWidgets('SocialLoginButton renders Facebook button correctly', (
    tester,
  ) async {
    await tester.pumpWidget(
      ScreenUtilInit(
        designSize: const Size(375, 812),
        child: MaterialApp(
          home: Scaffold(
            body: SocialLoginButton(
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
}
