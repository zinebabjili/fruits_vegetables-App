import 'package:flutter/material.dart';
import 'package:fruits_vegetables/easy_level.dart';
import 'package:fruits_vegetables/Fruitlegumes.dart';
import 'package:fruits_vegetables/hard_level.dart';
import 'package:fruits_vegetables/home_page.dart';
import 'package:fruits_vegetables/medium_level.dart';
import 'package:fruits_vegetables/score.dart';

// ignore: missing_return
Route<dynamic> generateRoute (RouteSettings settings){
  switch (settings.name){
    case '/':
      return MaterialPageRoute(builder: (context) => HomePage());
    case 'level1':
      return MaterialPageRoute(builder: (context) => EasyLevel());
    case 'level2':
      return MaterialPageRoute(builder: (context) => MediumLevel());
    case 'level3':
      return MaterialPageRoute(builder: (context) => HardLevel());
    case 'score':
      return MaterialPageRoute(builder: (context) => Score());
    case 'fruit':
      return MaterialPageRoute(builder: (context) => Fruitlegumes());
  }
}