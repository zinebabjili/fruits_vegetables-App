import 'package:flutter/material.dart';

// ignore: camel_case_types
class Score extends StatefulWidget {
  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  List<String> _listAddresses;

  @override
  void initState() {
    super.initState();
    _listAddresses = [
      "tajine 3amer mekla",
      "tajine seghira walkin bnine",
      "warah bnine",
      "tajine kbire khanz mafih maytkal"
    ];
  }

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).canvasColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(
                      _size.height * 0.25,
                    ),
                    bottomRight: Radius.circular(
                      _size.height * 0.25,
                    ),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey, blurRadius: 5.0, spreadRadius: 2),
                  ],
                ),
                height: _size.height * 0.45,
                width: _size.width,
                child: Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RotatedBox(
                          quarterTurns: 2,
                          child: Icon(Icons.play_circle_filled,
                              color: Colors.white, size: 60),
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius:
                              BorderRadius.circular(_size.height * 0.15),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black26,
                                blurRadius: 8.0,
                                spreadRadius: 2),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius:
                              BorderRadius.circular(_size.height * 0.15),
                          child: Image.asset(
                            'assets/img/signs.jpg',
                            fit: BoxFit.cover,
                            height: _size.height * 0.30,
                            width: _size.height * 0.30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            //title score
            Text(
              "Votre Score",
              style: TextStyle(
                fontFamily: 'OpenSans-Bold',
                fontSize: 40,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            // pourcantage score
            Text(
              "100 %",
              style: TextStyle(
                fontFamily: 'OpenSans-Bold',
                fontSize: 40,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: Colors.red,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            // list of suggested
            Container(
              height: _size.height * 0.20,
              child: ListView.builder(
                  controller: new ScrollController(keepScrollOffset: false),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: _listAddresses.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              _listAddresses[index],
                              style: new TextStyle(
                                height: 1.5,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(height: 10),
            RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(5.0)),
                color: Colors.red,
                child: Text('Rejouer',
                    style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 30,
                      color: Colors.white,
                    )),
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                }),
            SizedBox(height: 10),
            OutlineButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              textColor: Colors.red,
              child: Text('Choisir Un Niveau'),
              borderSide: BorderSide(
                  color: Colors.red, style: BorderStyle.solid, width: 2),
              onPressed: () {},
            )
          ],
        )),

        // child: RaisedButton(
        //     child: Text('pink Level', style: Theme.of(context).textTheme.button),
        //     onPressed: () {}

        // )
      ),
    );
  }
}
