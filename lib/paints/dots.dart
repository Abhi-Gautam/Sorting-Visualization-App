import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:sorting_visulalization/main.dart';
import 'package:flutter/material.dart';

class DotPainter extends CustomPainter {
  final double width;
  final int value;
  final int index;

  DotPainter({this.width, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (value < 500 * .25)
      paint.color = Color(0xFFf38375);
    else if (value < 500 * .50)
      paint.color = Color(0xFFf7a399);
    else if (value < 500 * .75)
      paint.color = Color(0xFFfbc3bc);
    else
      paint.color = Color(0xFFffe3e0);
    paint.strokeWidth = width * 5;
    paint.strokeCap = StrokeCap.round;

    canvas.drawPoints(
        PointMode.points,
        [
          Offset(index * this.width,
              height - .25 * height - this.value.ceilToDouble())
        ],
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
