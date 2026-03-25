// Light mode them variable ----------------------------------------
import 'package:flutter/material.dart';

// Light mode theme varialble ---------------------------------------
final kthemeScheme = ThemeData(fontFamily: 'Arial').copyWith(
  primaryColorLight: Colors.white,
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey,
    primaryContainer: const Color.fromARGB(255, 144, 198, 103),
    secondaryContainer: const Color.fromARGB(255, 117, 194, 144),
    tertiaryContainer: Colors.white,
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  navigationBarTheme: NavigationBarThemeData().copyWith(
    backgroundColor: Colors.transparent,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: Colors.grey),
    ),
  ),
  primaryColor: Color.fromARGB(255, 240, 240, 240),
  appBarTheme: AppBarThemeData().copyWith(
    backgroundColor: const Color.fromARGB(255, 242, 242, 241),
    shadowColor: Colors.black,
    elevation: 4.0, // Adds shadow elevation ; must be greater than 0
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.green),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  textTheme: TextTheme().copyWith(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      color: const Color.fromARGB(255, 77, 76, 76),
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: Colors.black,
    ),
    bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
  ),
  cardTheme: CardThemeData().copyWith(color: .fromARGB(255, 115, 248, 115)),
);

// Dark mode theme varialble ---------------------------------------
final kDarkThemeScheme = ThemeData(fontFamily: 'Arial').copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 224, 224, 224),
    primaryContainer: const Color.fromARGB(255, 177, 242, 128),
    secondaryContainer: const Color.fromARGB(255, 143, 233, 174),
    tertiaryContainer: const .fromARGB(255, 51, 49, 49),
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 51, 49, 49),
  navigationBarTheme: NavigationBarThemeData().copyWith(
    backgroundColor: Colors.transparent,
    labelTextStyle: WidgetStateProperty.all(
      const TextStyle(color: Color.fromARGB(255, 240, 239, 239)),
    ),
  ),
  primaryColor: const Color.fromARGB(255, 67, 67, 67),
  appBarTheme: AppBarThemeData().copyWith(
    backgroundColor: const Color.fromARGB(255, 56, 56, 56),
    foregroundColor: Colors.white,
    shadowColor: const Color.fromARGB(199, 212, 210, 210),
    elevation: 4.0, // Adds shadow elevation ; must be greater than 0
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(
        const Color.fromARGB(255, 101, 232, 106),
      ),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
    ),
  ),
  textTheme: TextTheme().copyWith(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: Colors.white,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      color: const Color.fromARGB(255, 237, 237, 237),
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: Colors.white,
    ),
    bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
  ),
  cardTheme: CardThemeData().copyWith(color: .fromARGB(255, 27, 160, 27)),
);
