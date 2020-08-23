import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sorting_visulalization/main.dart';

class BarPainter extends CustomPainter {
  final double width;
  final int value;
  final int index;

  BarPainter({this.width, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (value < 500 * .20)
      paint.color = Color(0xFFf38375);
    else if (value < 500 * .40)
      paint.color = Color(0xFFfb8f67);
    else if (value < 500 * .60)
      paint.color = Color(0xFFf7a399);
    else if (value < 500 * .80)
      paint.color = Color(0xFFfbc3bc);
    else
      paint.color = Color(0xFFffe3e0);
    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(index * this.width, 598),
        Offset(index * this.width, 600 - this.value.ceilToDouble()), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
