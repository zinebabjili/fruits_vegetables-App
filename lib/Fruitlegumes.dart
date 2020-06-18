import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fruits_vegetables/daoData/notifierData.dart';
import 'package:fruits_vegetables/score.dart';
import 'package:provider/provider.dart';

import 'level.dart';

class Fruitlegumes extends StatefulWidget {
  final String lettre;
  final String level;
  final Color color;
  bool isChanged = false;
  Fruitlegumes({Key key, this.lettre, this.level, this.color})
      : super(key: key);
  @override
  _FruitlegumesState createState() => _FruitlegumesState(
        level: this.level,
        color: this.color,
      );
}

class _FruitlegumesState extends State<Fruitlegumes> {
  String level;
  Color color;
  _FruitlegumesState({
    Key key,
    this.level,
    this.color,
  });
  var champs = ["Animal", "Capital", "Fruit", "Legume", "Metier", "Pays"];
  // this.champs = [Provider.of<NotifierData>(context, listen: false).gameStarted.animal.label];

  List<String> reponse = ["", "", "", "", "", ""];
  var _controllerInput = TextEditingController();

  var i = 0;
  var index = 1;
  var size = 6;

  int minuit = 00;
  int second = 00;
  Timer timer;

  @override
  void initState() {
    super.initState();
    minuit = 00;
    second = 00;
    if (level == "Facile") {
      minuit = 05;
    } else if (level == "Moyen") {
      minuit = 03;
    } else {
      minuit = 01;
    }
    startTimer();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        if (minuit < 1 && second < 1 || getResult(null) == 6) {
          timer.cancel();
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => Score(
                  color: color,
                  level: level,
                  reponse: getResult(null),
                ),
              ));
          timer.cancel();
        } else {
          if (second == 0) {
            minuit--;
            second = 60;
          }
          second--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // this.champs = [Provider.of<NotifierData>(context, listen: false).gameStarted.animal.label];

    var listOfElements =
        Provider.of<NotifierData>(context, listen: false).gameStarted.Elements;

    var onSearching = false;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            child: (listOfElements != null)
                ? Column(
                    children: <Widget>[
                      Container(
                        height: 500,
                        width: double.infinity,
                        decoration: new BoxDecoration(
                          color: widget.color,
                          borderRadius: new BorderRadius.only(
                            bottomLeft: const Radius.circular(250.0),
                            bottomRight: const Radius.circular(250.0),
                          ),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 2),
                          ],
                        ),
                        child: Column(
                          children: <Widget>[
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  GestureDetector(
                                    onTap: () {
                                      timer.cancel();
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => EasyLevel(
                                            color: widget.color,
                                            level: widget.level,
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.white,
                                        child: Transform.rotate(
                                          angle: 45,
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: widget.color,
                                            size: 36.0,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Center(
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            minuit.toString().padLeft(2, '0') +
                                                ":" +
                                                second
                                                    .toString()
                                                    .padLeft(2, '0'),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ]),
                            // list check
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Container(
                                height: 60,
                                child: Stack(
                                  children: <Widget>[
                                    Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        height: 20,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.grey,
                                                blurRadius: 5.0,
                                                spreadRadius: 2),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Align(
                                        alignment: Alignment.center,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 5.0,
                                                          spreadRadius: 2),
                                                    ],
                                                  ),
                                                  child: Icon(
                                                      Icons.check_circle,
                                                      color: (listOfElements[0]
                                                              .isDone)
                                                          ? Colors.green
                                                          : Colors.white,
                                                      size: 40)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 5.0,
                                                          spreadRadius: 2),
                                                    ],
                                                  ),
                                                  child: Icon(
                                                      Icons.check_circle,
                                                      color: (listOfElements[1]
                                                              .isDone)
                                                          ? Colors.green
                                                          : Colors.white,
                                                      size: 40)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 5.0,
                                                          spreadRadius: 2),
                                                    ],
                                                  ),
                                                  child: Icon(
                                                      Icons.check_circle,
                                                      color: (listOfElements[2]
                                                              .isDone)
                                                          ? Colors.green
                                                          : Colors.white,
                                                      size: 40)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 5.0,
                                                          spreadRadius: 2),
                                                    ],
                                                  ),
                                                  child: Icon(
                                                      Icons.check_circle,
                                                      color: (listOfElements[3]
                                                              .isDone)
                                                          ? Colors.green
                                                          : Colors.white,
                                                      size: 40)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 5.0,
                                                          spreadRadius: 2),
                                                    ],
                                                  ),
                                                  child: Icon(
                                                      Icons.check_circle,
                                                      color: (listOfElements[4]
                                                              .isDone)
                                                          ? Colors.green
                                                          : Colors.white,
                                                      size: 40)),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    boxShadow: [
                                                      BoxShadow(
                                                          color: Colors.grey,
                                                          blurRadius: 5.0,
                                                          spreadRadius: 2),
                                                    ],
                                                  ),
                                                  child: Icon(
                                                      Icons.check_circle,
                                                      color: (listOfElements[5]
                                                              .isDone)
                                                          ? Colors.green
                                                          : Colors.white,
                                                      size: 40)),
                                            ),
                                          ],
                                        ))
                                  ],
                                ),
                              ),
                            ),
                            //lettre ais
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 30, left: 20),
                                    child: Text(
                                      "Lettre is: " + widget.lettre,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 25, right: 20),
                                    child: Text(
                                      index.toString() + "/" + size.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ]),

                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Container(
                                  child: Text(
                                '${listOfElements[i].label}',
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    flex: 2, // 20%
                                    child: RaisedButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        if (i != 0) {
                                          previous();
                                        }
                                      },
                                      child: Center(
                                        child: Icon(
                                          Icons.skip_previous,
                                          color: widget.color,
                                          size: 40.0,
                                        ),
                                      ),
                                      shape: CircleBorder(),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 6, // 60%
                                    child: Container(
                                      decoration: BoxDecoration(
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey,
                                            blurRadius: 5.0,
                                          ),
                                        ],
                                        borderRadius:
                                            BorderRadius.circular(125),
                                      ),
                                      child: CircleAvatar(
                                        radius: 120.0,
                                        backgroundColor: Colors.white,
                                        backgroundImage: AssetImage(
                                            listOfElements[i].picture),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2, // 20%
                                    child: RaisedButton(
                                      color: Colors.white,
                                      onPressed: () {
                                        if (i != 5) {
                                          next();
                                        }
                                      },
                                      child: Icon(
                                        Icons.skip_next,
                                        color: widget.color,
                                        size: 40.0,
                                      ),
                                      shape: CircleBorder(),
                                    ),
                                  )
                                ],
                              ),
                            )
                            /*
                        Padding(
                          padding: const EdgeInsets.only(top:25),
                          child: Container(child:
                          Center(
                            child: 
                            Text('${champs[i]}',style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),)
                          ),
                          ),
                        ),*/
                            /*
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            RaisedButton(
                              color: Colors.white,
                              onPressed: previous,
                              child: Icon(
                                Icons.skip_next,
                                color: widget.color,
                                size: 45.0,
                              ),
                              shape: CircleBorder(),
                            ), 
                            Padding(
                              padding: const EdgeInsets.only(top:5),
                              child: CircleAvatar(
                                radius: 70.0,
                                backgroundColor: Colors.white,
                                backgroundImage: AssetImage("images/"+'${champs[i]}'+".jpg"),
                              ),
                            ),
                            RaisedButton(
                              color: Colors.white,
                              onPressed: next,
                              child: Icon(
                                Icons.skip_next,
                                color: widget.color,
                                size: 45.0,
                              ),
                              shape: CircleBorder(),
                            ), 
                          ],
                        ),
                      */
                          ],
                        ),
                      ),
                      Consumer<NotifierData>(
                        builder: (_, smrGame, __) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            child: Material(
                              elevation: 10.0,
                              shadowColor: Colors.blueGrey[100],
                              borderOnForeground: false,
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(10.0),
                              ),
                              color: Colors.white,
                              child: TextFormField(
                                enabled:
                                    (listOfElements[i].isDone) ? false : true,
                                controller: _controllerInput,
                                textAlign: TextAlign.center,
                                decoration: InputDecoration(
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 0.0),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.white, width: 1.0),
                                      borderRadius: const BorderRadius.all(
                                        const Radius.circular(10.0),
                                      ),
                                    ),
                                    filled: true,
                                    prefixIcon: (widget.isChanged == true)? Container(
                                      width: 5.0,
                                      height: 5.0,
                                      child: CircularProgressIndicator(
                                        backgroundColor: widget.color,
                                        valueColor: new AlwaysStoppedAnimation<Color>(Colors.white),
                                        strokeWidth: 02.0,
                                      ),
                                    ): null,
                                    hintStyle: new TextStyle(
                                      color: Colors.grey,
                                      fontSize: 16.0,
                                    ),
                                    hintText: listOfElements[i].input,
                                    fillColor: (listOfElements[i].isDone)
                                        ? Colors.green
                                        : Colors.white70),
                                onChanged: (value) async {
                                  widget.isChanged = true;
                                  print(widget.isChanged);
                                  // print("i is $i and value is $value");
                                  listOfElements[i].input = value;
                                  await smrGame.checkSomething(i, value).then((v) {
                                    if (v == true) {
                                      print("v is $v");
                                      listOfElements[i].isDone = true;
                                    } else {
                                      print("v is $v");
                                      listOfElements[i].isDone = false;
                                    }
                                    widget.isChanged = false;
                                  });
                                  
                                  print(widget.isChanged);

                                },
                              ),
                            ),
                          );
                        },
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(20),
                      //   child: Container(
                      //       child: Text(
                      //     "Vous devez saisir un " +
                      //         '${listOfElements[i].label}' +
                      //         " qui commance par la lettre \n ' " +
                      //         widget.lettre +
                      //         " '",
                      //     style: TextStyle(
                      //       fontSize: 16,
                      //       color: Colors.grey,
                      //     ),
                      //     textAlign: TextAlign.center,
                      //   )),
                      // ),
                      RaisedButton(
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0)),
                          color: widget.color,
                          child: Text('Terminer',
                              style: TextStyle(
                                fontFamily: 'OpenSans-Bold',
                                fontSize: 30,
                                color: Colors.white,
                              )),
                          onPressed: () {
                            timer.cancel();
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => Score(
                                  color: widget.color,
                                  level: widget.level,
                                  reponse: getResult(listOfElements),
                                ),
                              ),
                            );
                          }),
                    ],
                  )
                : null,
          ),
        ),
      ),
    );
  }

  int getResult(List<dynamic> lili) {
    if (lili == null) {
      lili = Provider.of<NotifierData>(context, listen: false)
          .gameStarted
          .Elements;
        return 0;
    }
    int scr = 0;
    for (int i = 0; i < lili.length; i++) {
      if (lili[i].isDone) {
        scr++;
      }
    }
    return scr;
  }

  void next() {
    setState(() {
      if (_controllerInput.text != null) {
        reponse[i] = _controllerInput.text;
        _controllerInput.clear();
      }

      // for (var i = 0; i < reponse.length; i++) {
      //   // print("hey" + reponse[i]);
      // }
      if (i < 5) {
        ++i;

        ++index;
        if (reponse[i] != null) {
          _controllerInput.text = reponse[i];
        }
      }
    });
  }

  void previous() {
    setState(() {
      if (_controllerInput.text != null) {
        reponse[i] = _controllerInput.text;
        _controllerInput.clear();
      }

      // for (var i = 0; i < reponse.length; i++) {
      //   print("hey" + reponse[i]);
      // }

      if (i > 0) {
        --i;
        --index;
        if (reponse[i] != null) {
          _controllerInput.text = reponse[i];
        }
      }
    });
  }
}
