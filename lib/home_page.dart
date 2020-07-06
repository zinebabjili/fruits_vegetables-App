import 'package:flutter/material.dart';
import 'package:fruits_vegetables/daoData/notifierData.dart';
import 'package:provider/provider.dart';

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
              child: Padding(
                padding: EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () => _submit(context),
                    child: Icon(Icons.settings, size: 40),
                  ),
                ),
              ),
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
                    Consumer<NotifierData>(
                      builder: (_, cinemaNotf, __) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Center(
                              child: RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(5.0)),
                                  color: Theme.of(context).primaryColor,
                                  child: Text('Niveau Facile',
                                      style:
                                          Theme.of(context).textTheme.button),
                                  onPressed: () {
                                    cinemaNotf.getStarted(1);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              EasyLevel(
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  level: "Facile"),
                                        ));
                                  })),
                        );
                      },
                    ),
                    Consumer<NotifierData>(
                      builder: (_, cinemaNotf, __) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Center(
                              child: RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(5.0)),
                                  color: Theme.of(context).accentColor,
                                  child: Text('Niveau Moyen',
                                      style:
                                          Theme.of(context).textTheme.button),
                                  onPressed: () {
                                    cinemaNotf.getStarted(2);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              EasyLevel(
                                                  color: Theme.of(context)
                                                      .accentColor,
                                                  level: "Moyen"),
                                        ));
                                  })),
                        );
                      },
                    ),
                    Consumer<NotifierData>(
                      builder: (_, cinemaNotf, __) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          child: Center(
                              child: RaisedButton(
                                  shape: new RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(5.0)),
                                  color: Theme.of(context).canvasColor,
                                  child: Text('Niveau Difficile',
                                      style:
                                          Theme.of(context).textTheme.button),
                                  onPressed: () {
                                    cinemaNotf.getStarted(3);
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              EasyLevel(
                                                  color: Theme.of(context)
                                                      .canvasColor,
                                                  level: "Difficile"),
                                        ));
                                  })),
                        );
                      },
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

_submit(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return DialogSetting();
      });
}

class DialogSetting extends StatefulWidget {
  @override
  _DialogSettingState createState() => _DialogSettingState();
}

class _DialogSettingState extends State<DialogSetting> {
  bool volumeUp = true;
  String lang = 'fr';
  Color color = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.height * .99,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text('Game Sounds'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          volumeUp = false;
                        });
                      },
                      child: SoundCircular(
                          iconData: Icons.volume_off,
                          color: !volumeUp ? Colors.black : Colors.grey)),
                  GestureDetector(
                      onTap: () {
                        setState(() {
                          volumeUp = true;
                        });
                      },
                      child: SoundCircular(
                          iconData: Icons.volume_up,
                          color: volumeUp ? Colors.black : Colors.grey))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text('Game Languages'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        lang = 'fr';
                      });
                    },
                    child: Container(
                        height: (lang == 'fr') ? 58 : 50,
                        width: (lang == 'fr') ? 58 : 50,
                        child: DrapeauCircular(nameCountry: 'fr')),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        lang = 'uk';
                      });
                    },
                    child: Container(
                        height: !(lang == 'fr') ? 58 : 50,
                        width: !(lang == 'fr') ? 58 : 50,
                        child: DrapeauCircular(nameCountry: 'uk')),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0),
              child: Text('Game Theme'),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = Colors.black;
                      });
                    },
                    child: Container(
                      height: (color == Colors.black) ? 58 : 50,
                      width: (color == Colors.black) ? 58 : 50,
                      child:Card(
                        color: Colors.black,
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          clipBehavior: Clip.antiAlias,
                        ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        color = Colors.white;
                      });
                    },
                    child: Container(
                        height: !(color == Colors.black) ? 58 : 50,
                        width: !(color == Colors.black) ? 58 : 50,
                        child: Card(
                          color: Colors.white,
                          elevation: 6.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                          clipBehavior: Clip.antiAlias,
                        )),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SoundCircular extends StatelessWidget {
  final IconData iconData;
  final Color color;

  const SoundCircular({Key key, this.iconData, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      clipBehavior: Clip.antiAlias,
      child: Icon(iconData, color: color, size: 50),
    );
  }
}

class DrapeauCircular extends StatelessWidget {
  final String nameCountry;

  const DrapeauCircular({Key key, this.nameCountry}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        'assets/img/' + nameCountry + '.png',
        fit: BoxFit.fill,
        height: double.infinity,
      ),
    );
  }
}
