import 'package:flutter/material.dart';

ThemeData basicTheme(){
  TextTheme _basicTextTheme(TextTheme base){
    return base.copyWith(
      //for name of levels and result score
      headline: base.headline.copyWith(
        fontFamily: 'OpenSans-Bold',
        fontSize: 30,
        color: Colors.black,
      ),
      //for name of buttons
      button: base.button.copyWith(
        fontFamily: 'OpenSans-Bold',
        fontSize: 30,
        color: Colors.white,
      ),
      //for text in grey
      body1: base.body1.copyWith(
        fontFamily: 'OpenSans-Regular',
        fontSize: 25,
        color: Colors.grey,
      ),
      //use for text like job name, letter is, .....
      body2: base.headline.copyWith(
        fontFamily: 'OpenSans-Bold',
        fontSize: 30,
        color: Colors.white,
      )
    );
  }

  final ThemeData base=ThemeData.light();
  return base.copyWith(
    primaryColor: Color.fromARGB(255, 76 ,187, 23),
    accentColor: Colors.yellow,
    canvasColor: Colors.red,
    textTheme: _basicTextTheme(base.textTheme),
    buttonTheme: ButtonThemeData(
        buttonColor: Colors.yellow,
        height: 45,
        minWidth: 300
    ),
  );
}