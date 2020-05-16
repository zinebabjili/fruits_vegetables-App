import 'package:flutter/material.dart';

import 'level.dart';

// ignore: camel_case_types
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Align(
                  alignment: Alignment.centerRight,
                  child: Icon(Icons.info_outline, size: 40)),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(175),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8.0,
                          spreadRadius: 2),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(175),
                    child: Image.asset(
                      'assets/img/logo.jpg',
                      fit: BoxFit.cover,
                      height: 350,
                      width: 350,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
                flex: 4,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                          child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                              color: Theme.of(context).primaryColor,
                              child: Text('Niveau Facile',
                                  style: Theme.of(context).textTheme.button),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EasyLevel(color:Theme.of(context).primaryColor,level:"Facile"),
                                    ));
                              })),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                          child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                              color: Theme.of(context).accentColor,
                              child: Text('Niveau Moyen',
                                  style: Theme.of(context).textTheme.button),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EasyLevel(color:Theme.of(context).accentColor,level:"Moyen"),
                                    ));
                              })),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Center(
                          child: RaisedButton(
                              shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(5.0)),
                              color: Theme.of(context).canvasColor,
                              child: Text('Niveau Difficile',
                                  style: Theme.of(context).textTheme.button),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          EasyLevel(color:Theme.of(context).canvasColor,level:"Difficile"),
                                    ));
                              })),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
