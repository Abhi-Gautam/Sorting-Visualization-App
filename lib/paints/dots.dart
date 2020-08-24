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
    if (colors[index] == 1) {
      paint.color = Colors.red;
    } else {
      paint.color = Colors.white;
    }
    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.round;
    canvas.drawLine(
        Offset(index * this.width,
            height - .25 * height - this.value.ceilToDouble()),
        Offset(index * this.width,
            height - .25 * height - this.value.ceilToDouble()),
        paint);
    paint.strokeWidth = width * 5;
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
