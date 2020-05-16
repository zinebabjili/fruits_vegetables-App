import 'package:flutter/material.dart';
import 'package:fruits_vegetables/level.dart';

import 'home_page.dart';

// ignore: camel_case_types
class Score extends StatefulWidget {
  final Color color;
  final String level;
  final List<String> reponse;

  const Score({Key key, this.color, this.level, this.reponse}) : super(key: key);
  @override
  _ScoreState createState() => _ScoreState(reponse:this.reponse);
}

class _ScoreState extends State<Score> {
  List<String> reponse;
  _ScoreState({Key key,  this.reponse});
  List<String> _listSuggestions;
  double score = 0;
  @override
  void initState() {
    super.initState();
    for (var i = 0; i < reponse.length; i++) {
      if(reponse[i] != ""){
        score++;
      }
    }
    _listSuggestions = [
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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                decoration: BoxDecoration(
                  color: widget.color,
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
                          child: SizedBox(height: 60,),
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
                color: widget.color,
              ),
              textAlign: TextAlign.center,
            ),
            // pourcantage score
            Text(
              double.parse((score*100/6).toStringAsFixed(2)).toString()+" %",
              style: TextStyle(
                fontFamily: 'OpenSans-Bold',
                fontSize: 40,
                height: 1.2,
                fontWeight: FontWeight.w600,
                color: widget.color,
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
                  itemCount: _listSuggestions.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Text(
                              _listSuggestions[index],
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
                color: widget.color,
                child: Text('Rejouer',
                    style: TextStyle(
                      fontFamily: 'OpenSans-Bold',
                      fontSize: 30,
                      color: Colors.white,
                    )),
                onPressed: () {
                  Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => EasyLevel(color:widget.color,level: widget.level ,),
                ),);
                }),
            SizedBox(height: 10),
            OutlineButton(
              shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(5.0)),
              textColor: widget.color,
              child: Text('Choisir Un Niveau'),
              borderSide: BorderSide(
                  color: widget.color, style: BorderStyle.solid, width: 2),
              onPressed: () {
                Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(),
                ),);
              },
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
