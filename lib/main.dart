import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:fruits_vegetables/daoData/AppLocalizations.dart';
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
      theme: Provider.of<NotifierData>(context).currentTheme,
      supportedLocales: [
          Locale('en', 'US'),
          Locale('fr', '')
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocaleLanguage in supportedLocales) {
            if (supportedLocaleLanguage.languageCode == locale.languageCode &&
                supportedLocaleLanguage.countryCode == locale.countryCode) {
              return supportedLocaleLanguage;
            }
          }
          // If device not support with locale to get language code then default get first on from the list
          return supportedLocales.first;
        },
        locale: Provider.of<NotifierData>(context).currentLang,
      initialRoute: '/',
      onGenerateRoute: router.generateRoute,
    );
  }
}