import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fruits_vegetables/daoData/notifierData.dart';
import 'package:provider/provider.dart';
import 'board_view.dart';
import 'model.dart';
import 'Fruitlegumes.dart';

class EasyLevel extends StatefulWidget {
  final Color color;
  final String level;

  const EasyLevel({
    Key key,
    this.color,
    this.level,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _EasyLevelState();
  }
}

class _EasyLevelState extends State<EasyLevel>
    with SingleTickerProviderStateMixin {
  bool clicked = false;
  bool clickedButFirstTime = false;
  double _angle = 0;
  double _current = 0;
  AnimationController _ctrl;
  Animation _ani;
  List<Alphabet> _items = [
    Alphabet("Aa"),
    Alphabet("Bb"),
    Alphabet("Cc"),
    Alphabet("Dd"),
    Alphabet("Ee"),
    Alphabet("Ff"),
    Alphabet("Gg"),
    Alphabet("Hh"),
    Alphabet("Ii"),
    Alphabet("jj"),
    Alphabet("Kk"),
    Alphabet("Ll"),
    Alphabet("Mm"),
    Alphabet("Nn"),
    Alphabet("Oo"),
    Alphabet("Pp"),
    Alphabet("Qq"),
    Alphabet("Rr"),
    Alphabet("Ss"),
    Alphabet("Tt"),
    Alphabet("Uu"),
    Alphabet("Vv"),
    Alphabet("Ww"),
    Alphabet("Xx"),
    Alphabet("Yy"),
    Alphabet("Zz"),
  ];
  @override
  void initState() {
    super.initState();
    var _duration = Duration(milliseconds: 6000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
    Provider.of<NotifierData>(context, listen: false).gameStarted.lettre = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: AnimatedBuilder(
            animation: _ani,
            builder: (context, child) {
              final _value = _ani.value;
              final _angle = _value * this._angle;
              // print("Angle" + _angle.toString());
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  BoardView(
                      color: widget.color,
                      items: _items,
                      current: _current,
                      angle: _angle),
                  _buildGo(),
                  _buildResult(_value),
                  _buildButton(_value),
                  _buildText(),
                  _buildBtnBack()
                ],
              );
            }),
      ),
    );
  }

  _buildGo() {
    return Material(
      color: Colors.white,
      shape: CircleBorder(
        side: BorderSide(
          color: widget.color,
          width: 4,
        ),
      ),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          child: Text(
            "GO",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),
        ),
        onTap: _animation,
      ),
    );
  }

  _animation() {
    if (!_ctrl.isAnimating) {
      var _random = Random().nextDouble();
      _angle = 20 + Random().nextInt(5) + _random;
      _ctrl.forward(from: 0.0).then((_) {
        _current = (_current + _random);
        _current = _current - _current ~/ 1;
        _ctrl.reset();
      });
    }
    this.clicked = true;
  }

  int _calIndex(value) {
    var _base = (2 * pi / _items.length / 2) / (2 * pi);
    return (((_base + value) % 1) * _items.length).floor();
  }

  //RESULT
  _buildResult(_value) {

    var _index = _calIndex(_value * _angle + _current);
    //String _asset = _items[_index].asset;
    String _asset = _items[_index].alphabet;
    if(_value == 0 && this.clicked == true && this.clickedButFirstTime== true){
      String letter = _asset[0];
      Provider.of<NotifierData>(context, listen: false).gameStarted.lettre = letter;
      // print(letter);
    }
    if(_value == 0 &&  this.clicked == true){
      this.clickedButFirstTime = true;
    }
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 85.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 14),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(color: Colors.grey, blurRadius: 5.0, spreadRadius: 2),
            ],
          ),
          child: Text(_asset, style: Theme.of(context).textTheme.headline),
        ),
      ),
    );
  }

  _buildButton(_value) {
    var _index = _calIndex(_value * _angle + _current);
    //String _asset = _items[_index].asset;
    String _asset = _items[_index].alphabet;
    return Consumer<NotifierData>(
      builder: (_, smrGame, __) {
        if(Provider.of<NotifierData>(context,listen: false).gameStarted.lettre == ""){
          return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
                color: widget.color,
                child: Text('Commencer',
                    style: Theme.of(context).textTheme.button),
                onPressed: null),
          ),
        );
        }else{
          return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: RaisedButton(
                color: widget.color,
                child: Text('Commencer',
                    style: Theme.of(context).textTheme.button),
                onPressed: () {
                  if (widget.level == "Facile") {
                    smrGame.setGameInitialDATA(1);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Fruitlegumes(
                            color: widget.color,
                            lettre: Provider.of<NotifierData>(context, listen: false).gameStarted.lettre,
                            level: widget.level),
                      ),
                    );
                  } else if (widget.level == "Moyen") {
                    smrGame.setGameInitialDATA(2);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Fruitlegumes(
                            color: widget.color,
                            lettre: Provider.of<NotifierData>(context, listen: false).gameStarted.lettre,
                            level: widget.level),
                      ),
                    );
                  } else {
                    smrGame.setGameInitialDATA(3);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Fruitlegumes(
                            color: widget.color,
                            lettre: Provider.of<NotifierData>(context, listen: false).gameStarted.lettre,
                            level: widget.level),
                      ),
                    );
                  }
                  /*Navigator.of(context).pushNamed('/Fruitlegumes');*/
                }),
          ),
        );
        }
        
      },
    );
  }

  _buildText() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text('Niveau : ' + widget.level,
            style: (Theme.of(context).textTheme.headline)),
      ),
    );
  }

  _buildBtnBack() {
    return Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 30),
          child: RotatedBox(
            quarterTurns: 2,
            child: IconButton(
              icon:
                  Icon(Icons.play_circle_filled, color: widget.color, size: 60),
              onPressed: () {
                Navigator.of(context).pushNamed('/');
              },
            ),
          ),
        ),
      ),
    );
  }
}

/*import 'dart:math';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class easyLevel extends StatefulWidget {
  @override
  _easyLevelState createState() => _easyLevelState();
}

// ignore: camel_case_types
class _easyLevelState extends State<easyLevel> with TickerProviderStateMixin {
  var lastPosition=0.0;
  var random=new Random();
  AnimationController animationController;

  double getRandomNumber(){
    lastPosition=random.nextDouble()*pi*3;
    return lastPosition;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
      vsync: this, duration: Duration(seconds:0),
    );
    animationController.forward();
  }

  spinTheWheel(){
    animationController = AnimationController(
      vsync: this, duration: Duration(seconds:3),
    );
    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
     return Scaffold(
      body: Center(
        child: Container(child:
        RotationTransition(
            turns: Tween(begin: lastPosition, end: getRandomNumber()).animate(new CurvedAnimation(parent: animationController, curve: Curves.linear)),
            child: GestureDetector(
              onTap: (){
                if(animationController.isCompleted)
                  setState(() {
                    spinTheWheel();
                  });
              },
                child: Image.asset('images/spin.png'))),
          width: 350,
          height: 350,
          //SonEnd: _dividerController.add,
        ),
      ),
    );
  }
  }
*/
