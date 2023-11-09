import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class AppTheme {
  
  static ThemeData appTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
    
  );
}
