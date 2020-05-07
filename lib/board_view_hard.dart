import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'arrow_view_hard.dart';
import 'model.dart';

class BoardView extends StatefulWidget {
  final double angle;
  final double current;
  final List<Alphabet> items;

  const BoardView({Key key, this.angle, this.current, this.items})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _BoardViewState();
  }
}

class _BoardViewState extends State<BoardView> {
  Size get size => Size(MediaQuery.of(context).size.width * 0.85,
      MediaQuery.of(context).size.width * 0.85);

  double _rotote(int index) => (index / widget.items.length) * 2 * pi;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        //shadow
        Container(
          height: size.height,
          width: size.width,
          /*decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [BoxShadow(blurRadius: 20, color: Colors.red)],
          ),*/
        ),
        Transform.rotate(
          angle: -(widget.current + widget.angle) * 2 * pi,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              for (var Alphabet in widget.items) ...[_buildCard(Alphabet)],
              for (var Alphabet in widget.items) ...[_buildImage(Alphabet)],
            ],
          ),
        ),
        Container(
          height: size.height,
          width: size.width,
          child: ArrowView(),
        ),
      ],
    );
  }

  _buildCard(Alphabet Alphabet) {
    var _rotate = _rotote(widget.items.indexOf(Alphabet));
    var _angle = 2 * pi / widget.items.length;
    return Transform.rotate(
      angle: _rotate,
      child: ClipPath(
        clipper: _AlphabetPath(_angle),
        child: Container(
          height: size.height,
          width: size.width,
          //color: Colors.white,
          decoration:  BoxDecoration(
            border: Border.all(
              color: Colors.red,
              width: 4,
            ),
          ),
        ),
      ),
    );
  }

  _buildImage(Alphabet Alphabet) {
    var _rotate = _rotote(widget.items.indexOf(Alphabet));
    return Transform.rotate(
      angle: _rotate,
      child: Container(
        height: size.height,
        width: size.width,
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              BoxConstraints.expand(height: size.height / 3, width: 44),
          child: Text(Alphabet.alphabet,style: TextStyle(fontSize: 19.0, fontWeight: FontWeight.bold, color: Colors.black),textAlign: TextAlign.center),
        ),
      ),
    );
  }
}

class _AlphabetPath extends CustomClipper<Path> {
  final double angle;

  _AlphabetPath(this.angle);

  @override
  Path getClip(Size size) {
    Path _path = Path();
    Offset _center = size.center(Offset.zero);
    Rect _rect = Rect.fromCircle(center: _center, radius: size.width / 2);
    _path.moveTo(_center.dx, _center.dy);
    _path.arcTo(_rect, -pi / 2 - angle / 2, angle, false);
    _path.close();
    return _path;
  }

  @override
  bool shouldReclip(_AlphabetPath oldClipper) {
    return angle != oldClipper.angle;
  }
}
