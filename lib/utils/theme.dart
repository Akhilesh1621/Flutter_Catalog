import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        cardColor: Colors.white,
        canvasColor: creamColor,
        buttonColor: darkBulishColor,
        accentColor: darkBulishColor,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.white,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.black),
            textTheme: Theme.of(context).textTheme),
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        cardColor: Colors.black,
        canvasColor: darkcreamColor,
        buttonColor: lightBulishColor,
        accentColor: Colors.white,
        appBarTheme: AppBarTheme(
            centerTitle: true,
            color: Colors.black,
            elevation: 0.0,
            iconTheme: IconThemeData(color: Colors.white),
            textTheme: Theme.of(context).textTheme),
        fontFamily: GoogleFonts.poppins().fontFamily,
        primaryTextTheme: GoogleFonts.poppinsTextTheme(),
      );

  //Colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color darkBulishColor = Color(0xff403b58);
  static Color lightBulishColor = Vx.indigo500;
}
