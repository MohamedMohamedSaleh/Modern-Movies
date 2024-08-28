import 'package:flutter/material.dart';

class MyTheme {
  static const Color myBlackDark = Color.fromARGB(255, 10, 26, 36);
  static const Color myBlackLight = Color.fromARGB(255, 13, 33, 46);

  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      primary: Colors.black.withOpacity(.7),
      primaryContainer: Colors.grey[200],
      seedColor: Colors.deepPurpleAccent,
    ),
    useMaterial3: true,
  );

  static ThemeData darkTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: myBlackDark,
      scrolledUnderElevation: 0,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        // color: Colors.black,
      ),
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: myBlackDark,
    primaryColor: Colors.blue,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      primary: Colors.white70,
      primaryContainer: myBlackLight,
      brightness: Brightness.dark,
      seedColor: Colors.deepPurpleAccent,
    ),
  );
}
