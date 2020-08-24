import 'package:flutter/material.dart';
import 'package:sorting_visulalization/main.dart';
import 'package:sorting_visulalization/color_list.dart';
import 'dart:math';

var length = max_len;
List<Color> colors;

class BarPainter extends CustomPainter {
  final double width;
  final int value;
  final int index;

  BarPainter({this.width, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (toss == 0)
      colors = colors1;
    else if (toss == 1)
      colors = colors2;
    else if (toss == 2) colors = colors3;
    if (value < .25 * length)
      paint.color = colors[0];
    else if (value < .5 * length)
      paint.color = colors[1];
    else if (value < .75 * length)
      paint.color = colors[2];
    else
      paint.color = colors[3];
    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.round;

    canvas.drawLine(
        Offset(index * this.width, height),
        Offset(index * this.width, .85 * height - this.value.ceilToDouble()),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
