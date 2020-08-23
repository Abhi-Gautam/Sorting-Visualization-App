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
    paint.color = Color(0xFF1D9A6C);
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
