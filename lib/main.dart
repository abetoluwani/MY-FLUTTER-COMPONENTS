import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../app/modules/splashscreen/bindings/splashscreen_binding.dart';
import 'app/routes/app_pages.dart';
import 'utils/utils.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MediaQueryData windowData = MediaQueryData.fromView(View.of(context));
    windowData = windowData.copyWith(
      textScaler: TextScaler.linear(1.0), //or whatever you want
    );
    AppSizes.initialize(context);
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        splitScreenMode: true,
        builder: (context, _) {
          return ResponsiveBreakpoints.builder(
            child: MediaQuery(
              data: windowData,
              child: GetMaterialApp(
                useInheritedMediaQuery: true,
                debugShowCheckedModeBanner: false,
                initialRoute: AppPages.INITIAL,
                initialBinding: SplashScreenBinding(),
                getPages: AppPages.routes,
                theme: AppTheme.darkTheme,
              ),
            ),
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 451, end: 800, name: TABLET),
              const Breakpoint(start: 801, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          );
        });
  }
}
