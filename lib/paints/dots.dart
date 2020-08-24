import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:sorting_visulalization/main.dart';
import 'package:flutter/material.dart';
import 'package:sorting_visulalization/color_list.dart';

var length = max_len;
List<Color> colors;

class DotPainter extends CustomPainter {
  final double width;
  final int value;
  final int index;

  DotPainter({this.width, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    if (toss == 0)
      colors = colors1;
    else if (toss == 1)
      colors = colors2;
    else if (toss == 2) colors = colors3;
    Paint paint = Paint();
    if (value < .25 * length)
      paint.color = colors[0];
    else if (value < .5 * length)
      paint.color = colors[1];
    else if (value < .75 * length)
      paint.color = colors[2];
    else
      paint.color = colors[3];
    paint.strokeCap = StrokeCap.round;
    paint.strokeWidth = width * 5;
    canvas.drawPoints(
        PointMode.points,
        [
          Offset(index * this.width,
              height - .22 * height - this.value.ceilToDouble())
        ],
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
