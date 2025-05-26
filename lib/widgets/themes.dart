import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.white,
    canvasColor: creamColor,
    // Use colorScheme for primary and secondary colors
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.deepPurple,
      accentColor: darkBluishColor,
    ).copyWith(
      secondary: darkBluishColor,
    ),
    // AppBar theme updated with toolbarTextStyle and titleTextStyle
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: Theme.of(context).textTheme.bodyMedium,
      titleTextStyle: Theme.of(context).textTheme.titleLarge,
    ),
  );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
    fontFamily: GoogleFonts.poppins().fontFamily,
    cardColor: Colors.black,
    canvasColor: darkCreamColor,
    colorScheme: ColorScheme.dark(
      primary: lightBluishColor,
      secondary: Colors.white,
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.white),
      toolbarTextStyle: TextStyle(color: Colors.white),
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  // Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color darkBluishColor = Color(0xff403b58);
  static Color lightBluishColor = Vx.indigo500;
}
