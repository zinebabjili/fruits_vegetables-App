import 'package:flutter/material.dart';
import 'package:fruits_vegetables/theme.dart';
import 'package:fruits_vegetables/daoData/notifierData.dart';
import 'package:provider/provider.dart';
import 'router.dart' as router;

// void main() {
//   runApp(MaterialApp(
//     debugShowCheckedModeBanner: false,
//     home: MyApp(),
//   ));
// }

void main() {
  runApp(
  ChangeNotifierProvider<NotifierData>(
    create: (BuildContext context)  => NotifierData(),
    // builder: (context) => CinemaNotifier(),
    child: MyApp(),
  )
  );
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