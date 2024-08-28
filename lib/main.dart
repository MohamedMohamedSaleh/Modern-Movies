import 'package:flutter/material.dart';
import 'package:modern_movies/core/api/kiwi.dart';
import 'package:modern_movies/core/helpers/methods.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modern_movies/core/themes/my_theme.dart';

import 'views/screens/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initKiwi();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(330, 700),
      minTextAdapt: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        title: 'Modern Movies',
        theme: MyTheme.lightTheme,
        darkTheme: MyTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: child,
      ),
      child: const HomePage(),
    );
  }
}
