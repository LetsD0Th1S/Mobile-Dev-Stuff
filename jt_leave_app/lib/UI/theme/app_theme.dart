// Light mode them variable ----------------------------------------
import 'package:flutter/material.dart';

final kthemeScheme = ThemeData(fontFamily: 'Arial').copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: Colors.grey,
    primaryContainer: const Color.fromARGB(255, 144, 198, 103),
    secondaryContainer: const Color.fromARGB(255, 117, 194, 144),   
    ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: Colors.white,
  navigationBarTheme: NavigationBarThemeData().copyWith(
    backgroundColor: Colors.transparent,
    labelTextStyle: WidgetStateProperty.all(const TextStyle(color: Colors.grey)),
  ),
  primaryColor: Color.fromARGB(255, 200, 200, 200),
  appBarTheme: AppBarThemeData().copyWith(
    backgroundColor: const Color.fromARGB(255, 247, 247, 176),
    shadowColor: Colors.black,
    elevation: 4.0 // Adds shadow elevation ; must be greater than 0
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    
    style: ButtonStyle(
      backgroundColor: WidgetStatePropertyAll(Colors.green),
      foregroundColor: WidgetStatePropertyAll(Colors.white),
      )
  ),
  textTheme: TextTheme().copyWith(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 20,
      color: Colors.black,
    ),
    titleLarge: TextStyle(
      fontSize: 24,
      color: const Color.fromARGB(255, 77, 76, 76),
      fontWeight: FontWeight.bold,
    ),
    bodyMedium: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 18,
      color: Colors.black,
    ),
    bodySmall: TextStyle(fontWeight: FontWeight.normal, fontSize: 14),
  ),
);



// Dark mode theme varialble ---------------------------------------
final kDarkThemeScheme = ThemeData().copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: const Color.fromARGB(255, 55, 55, 55),
  appBarTheme: AppBarThemeData().copyWith(
    backgroundColor: const Color.fromARGB(198, 239, 239, 167),
    shadowColor: Colors.black,
  ),
  textTheme: TextTheme().copyWith(
    bodyLarge: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 22,
      color: Colors.black,
    ),
    bodySmall: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 22,
      color: Colors.black,
    ),
  ),
);