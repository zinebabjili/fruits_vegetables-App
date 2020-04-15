import 'package:flutter/material.dart';

// ignore: camel_case_types
class score extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: RaisedButton(
              child: Text('pink Level', style: Theme.of(context).textTheme.button),
              onPressed: () {}

          )
      ),

    );
  }
}