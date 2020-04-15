import 'package:flutter/material.dart';
import 'package:fruits_vegetables/easyLevel.dart';
import 'package:fruits_vegetables/fruitName.dart';
import 'package:fruits_vegetables/hardLevel.dart';
import 'package:fruits_vegetables/home.dart';
import 'package:fruits_vegetables/mediumLevel.dart';
import 'package:fruits_vegetables/score.dart';

Route<dynamic> generateRoute (RouteSettings settings){
  switch (settings.name){
    case '/':
      return MaterialPageRoute(builder: (context) => home());
    case 'level1':
      return MaterialPageRoute(builder: (context) => easyLevel());
    case '/level2':
      return MaterialPageRoute(builder: (context) => mediumLevel());
    case 'level3':
      return MaterialPageRoute(builder: (context) => hardLevel());
    case 'score':
      return MaterialPageRoute(builder: (context) => score());
    case 'fruit':
      return MaterialPageRoute(builder: (context) => fruitName());
  }
}