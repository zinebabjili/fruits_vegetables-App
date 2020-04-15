import 'package:flutter/material.dart';

// ignore: camel_case_types
class hardLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child:RaisedButton(
              child: Text('Easy Level',style: Theme.of(context).textTheme.button),
              onPressed: (){}
          )
      ),
    );
  }
}
