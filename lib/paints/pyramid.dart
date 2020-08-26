import 'package:flutter/material.dart';
import 'package:sorting_visulalization/main.dart';
import 'package:sorting_visulalization/color_list.dart';
import 'dart:math';

List<Color> colors;

class PyramidPainter extends CustomPainter {
  final double width;
  final int value;
  final int index;

  PyramidPainter({this.width, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    var length = 6 * screen_width / 4;
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
        Offset(screen_width / 2 - this.value * screen_width / (2 * max_len),
            index * this.width),
        Offset(screen_width / 2 + this.value * screen_width / (2 * max_len),
            index * this.width),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
