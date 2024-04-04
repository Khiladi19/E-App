import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class Mythemes {
  static ThemeData lightheme(BuildContext context) => ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: GoogleFonts.poppins().fontFamily,
      cardColor: Colors.white,
      // darknbuish
      canvasColor: cremecolor,
      // ignore: deprecated_member_use
      accentColor: darkbuishcolor,
      // ignore: deprecated_member_use
      buttonColor: darkbuishcolor,
      appBarTheme: const AppBarTheme(
        color: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
        // textTheme: Theme.of(context).textTheme,

        titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.normal,
        ),
      ));

  static ThemeData darktheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        cardColor: Colors.black,
        canvasColor: darkcremecolor,
        
        // ignore: deprecated_member_use
        accentColor: Colors.white,
        // ignore: deprecated_member_use
        buttonColor: lightbuishcolor,
        appBarTheme: const AppBarTheme(
          // white 
            color: Colors.black,
            elevation: 0.0,
            // black
            iconTheme: IconThemeData(color: Colors.white),
            // textTheme: Theme.of(context).textTheme,
            titleTextStyle: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.normal)),
      );
  static Color cremecolor = const Color(0xFFF4F1F1);
  static Color darkcremecolor = Vx.gray800;

  static Color lightbuishcolor = Vx.indigo500;
  static Color darkbuishcolor = const Color(0xff403b58);
}
