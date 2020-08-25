import 'dart:ui';

import 'package:sorting_visulalization/main.dart';
import 'package:flutter/material.dart';
import 'package:sorting_visulalization/color_list.dart';

var length = max_len;

class MultiplePainter extends CustomPainter {
  final double width;
  final int value;
  final int index;

  MultiplePainter({this.width, this.value, this.index});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint1 = Paint();
    Paint paint2 = Paint();
    Paint paint3 = Paint();
    if (value < .25 * length) {
      paint1.color = colors1[0];
      paint2.color = colors2[0];
      paint3.color = colors3[0];
    } else if (value < .5 * length) {
      paint1.color = colors1[1];
      paint2.color = colors2[1];
      paint3.color = colors3[1];
    } else if (value > .75 * length) {
      paint1.color = colors1[2];
      paint2.color = colors2[2];
      paint3.color = colors3[2];
    } else {
      paint1.color = colors1[3];
      paint2.color = colors2[3];
      paint3.color = colors3[3];
    }
    paint1.strokeCap = StrokeCap.round;
    paint1.strokeWidth = width * 5;
    paint2.strokeCap = StrokeCap.round;
    paint2.strokeWidth = width * 2.5;
    paint3.strokeCap = StrokeCap.round;
    paint3.strokeWidth = width;
    canvas.drawPoints(PointMode.points,
        [Offset(index * this.width, this.value.ceilToDouble())], paint1);
    canvas.drawPoints(
        PointMode.points,
        [
          Offset(
              index * this.width, this.value.ceilToDouble() + screen_height / 7)
        ],
        paint2);
    paint2.strokeWidth = width;
    canvas.drawPoints(
        PointMode.points,
        [
          Offset(index * this.width,
              this.value.ceilToDouble() + 2 * screen_height / 7)
        ],
        paint3);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
