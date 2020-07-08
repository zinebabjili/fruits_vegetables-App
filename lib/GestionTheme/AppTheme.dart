import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  static const Color appBackgroundColor = Colors.white;

  static final TextTheme lightTextTheme = TextTheme(
    button: _buttonLight,
    headline: _headlineLight,
    title: _headlineLight1
  );
  static final TextTheme darkTextTheme = TextTheme(
    button: _buttonDark,
    headline: _headlineDark,
    title: _headlineDark1
   );

  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppTheme.appBackgroundColor,
    brightness: Brightness.light,
    primaryColor: Color.fromARGB(255, 76, 187, 23),
    accentColor: Colors.yellow,
    canvasColor: Colors.red,
    textTheme: lightTextTheme
  );

  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black38,
    brightness: Brightness.dark,
    primaryColor: Color.fromARGB(255, 76, 187, 23),
    accentColor: Colors.yellow,
    canvasColor: Colors.red,
    textTheme: darkTextTheme
  );
  static final TextStyle _buttonLight = TextStyle(
    fontFamily: 'OpenSans-Bold',
        fontSize: 30,
        color: Colors.white,
  );
  static final TextStyle _headlineLight = TextStyle(
        fontFamily: 'OpenSans-Bold',
        fontSize: 30,
        color: Colors.black,
  );
  static final TextStyle _headlineLight1 = TextStyle(
        fontFamily: 'OpenSans-Bold',
        fontSize: 30,
        color: Colors.black,
  );
  static final TextStyle _buttonDark = _buttonLight.copyWith(color: Colors.black);
  static final TextStyle _headlineDark = _headlineLight.copyWith(color: Colors.black);
  static final TextStyle _headlineDark1 = _headlineLight1.copyWith(color: Colors.white);


}