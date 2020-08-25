import 'package:flutter/material.dart';
import 'package:sorting_visulalization/main.dart';
import 'package:sorting_visulalization/color_list.dart';
import 'dart:math';

double color_wheel = 120;
var length = max_len;
List<Color> colors;

class ColorPainter extends CustomPainter {
  final double width;
  final int value;
  final int index;

  ColorPainter({this.width, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    if (toss == 0)
      color_wheel = 120;
    else if (toss == 1)
      color_wheel = 60;
    else
      color_wheel = 180;
    Paint paint = Paint();
    paint.color =
        HSVColor.fromAHSV(0.8, color_wheel + 120 * this.value / length, .8, .9)
            .toColor();
    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.round;

    canvas.drawLine(Offset(index * this.width, screen_height),
        Offset(index * this.width, 0), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
