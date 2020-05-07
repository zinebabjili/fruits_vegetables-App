import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'board_view_easy.dart';
import 'model.dart';

class EasyLevel extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _EasyLevelState();
  }
}

class _EasyLevelState extends State<EasyLevel>
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
                  _buildText()
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
          color: Colors.green,
          width: 4,
        ),
      ),
      child: InkWell(
        customBorder: CircleBorder(),
        child: Container(
          alignment: Alignment.center,
          height: 72,
          width: 72,
          /*child: Text(
            "GO",
            style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
          ),*/
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
      padding: EdgeInsets.symmetric(vertical: 100.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(_asset, style: Theme.of(context).textTheme.headline),
      ),
    );
  }

  _buildButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20.0),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: RaisedButton(
          color: Colors.green,
            child: Text('Start',style: Theme.of(context).textTheme.button),
            onPressed: (){
              Navigator.of(context).pushNamed('');
            }
        ),
      ),
    );
  }

  _buildText() {
    return Padding(
      padding: EdgeInsets.only(top: 100),
      child: Align(
        alignment: Alignment.topCenter,
            child: Text('Level : Easy',style: (Theme.of(context).textTheme.headline)),
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