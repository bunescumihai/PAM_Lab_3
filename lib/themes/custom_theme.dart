import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData theme() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      scaffoldBackgroundColor: Colors.white,
      fontFamily: "OpenSans",
      iconTheme: IconThemeData(color: Color.fromRGBO(54,48,98,1)),
      textTheme: TextTheme(
          bodyLarge: TextStyle(
            fontFamily: 'OpenSans',
          ),
          bodyMedium: TextStyle(
            fontFamily: 'OpenSans',
          ),
          displayLarge: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w400,
          ),
          displayMedium: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.w400,
          ),
          titleMedium: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontSize: 20),
          titleSmall: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.w600,
              fontSize: 16 // Italic
              ),
        labelMedium: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(134,131,161, 1),
        ),
        labelSmall: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(134,131,161, 1),
        )

      ),

    );
  }
}
