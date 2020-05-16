import 'dart:math';
import 'package:flutter/material.dart';

class ArrowView extends StatelessWidget {
  final Color color;

  const ArrowView({Key key, this.color}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Transform.rotate(
        angle: pi,
        child: Padding(
          padding: EdgeInsets.only(top: 80),
          // clip path is for drawing any shape : circle, triangle ....
          child: ClipPath(
            clipper: ArrowClipper(),
            child: Container(
              color: color,
              // decoration: BoxDecoration(
              //   // degree of color
              //     gradient: LinearGradient(
              //         begin: Alignment.topCenter,
              //         end: Alignment.bottomCenter,
              //         colors: [Colors.black12, Colors.green])),
              // height and width of arrow
              height: 40,
              width: 40,
            ),
          ),
        ),
      ),
    );
  }
}

class ArrowClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    Offset center = size.center(Offset.zero);
    path.lineTo(center.dx, size.height);
    path.lineTo(size.width, 0);
    path.lineTo(center.dx, center.dy);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
