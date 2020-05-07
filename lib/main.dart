import 'package:flutter/material.dart';
import 'package:fruits_vegetables/theme.dart';
import 'router.dart' as router;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: basicTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: router.generateRoute,

    );
  }
}