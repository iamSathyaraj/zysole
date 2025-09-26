import 'package:e_commerce/util/theme/text_theme.dart';
import 'package:flutter/material.dart';

class TAppTheme {

  TAppTheme._();
  static ThemeData lightTheme  = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TTextTheme.lightTextTheme
  );
  static ThemeData darkTheme =ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
    textTheme: TTextTheme.darkTextTheme
  );
} 