import 'package:flutter/material.dart';
import 'package:fruits_vegetables/theme.dart';
import 'router.dart' as router;

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: basicTheme(),
      initialRoute: '/',
      onGenerateRoute: router.generateRoute,

    );
  }
}