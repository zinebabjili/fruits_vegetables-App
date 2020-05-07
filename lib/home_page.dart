import 'package:flutter/material.dart';

// ignore: camel_case_types
class  HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
            child: Column(
              children: <Widget>[
                RaisedButton(
                    child: Text('Easy Level',style: Theme.of(context).textTheme.button),
                    onPressed: (){
                      Navigator.of(context).pushNamed('level1');
                    }
                ),
                RaisedButton(
                    child: Text('Medium Level',style: Theme.of(context).textTheme.button),
                    onPressed: (){
                      Navigator.of(context).pushNamed('level2');
                    }
                ),
                RaisedButton(
                    child: Text('Hard Level',style: Theme.of(context).textTheme.button),
                    onPressed: (){
                      Navigator.of(context).pushNamed('level3');
                    }
                ),
              ],

            )

      ),

    );
  }
}
