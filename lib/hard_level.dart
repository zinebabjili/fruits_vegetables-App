import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'board_view_hard.dart';
import 'model.dart';

class HardLevel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HardLevelState();
  }
}

class _HardLevelState extends State<HardLevel>
    with SingleTickerProviderStateMixin {
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
    // TODO: implement initState
    super.initState();
    var _duration = Duration(milliseconds: 6000);
    _ctrl = AnimationController(vsync: this, duration: _duration);
    _ani = CurvedAnimation(parent: _ctrl, curve: Curves.fastLinearToSlowEaseIn);
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
              return Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  BoardView(items: _items, current: _current, angle: _angle),
                  _buildGo(),
                  _buildResult(_value),
                  _buildButton(),
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
          color: Colors.red,
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

  _buildButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RaisedButton(
            color: Colors.red,
            child: Text('Commencer', style: Theme.of(context).textTheme.button),
            onPressed: () {
              Navigator.of(context).pushNamed('');
            }),
      ),
    );
  }

  _buildText() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Align(
        alignment: Alignment.topCenter,
        child: Text('Niveau : Difficile',
            style: Theme.of(context).textTheme.headline),
      ),
    );
  }

  _buildBtnBack() {
    return Container(
      child: Align(
        alignment: Alignment.topLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left:30 ),
          child: RotatedBox(
            quarterTurns: 2,
            child: IconButton(
              icon: Icon(
                  Icons.play_circle_filled, color: Colors.red, size: 60
              ),
              onPressed: (){
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
class HardLevel extends StatefulWidget {
  @override
  _HardLevelState createState() => _HardLevelState();
}

// ignore: camel_case_types
class _HardLevelState extends State<HardLevel> with TickerProviderStateMixin {
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
