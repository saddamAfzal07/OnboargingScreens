import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'feature/presentation/onboarding_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'onboarding',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(),
        ),
        home: OnBoarding(),
      ),
      designSize: const Size(360, 800),
    );
  }
}
