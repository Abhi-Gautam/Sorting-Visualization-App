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
    if (colors[index] == 1) {
      paint.color = Colors.red;
    } else {
      paint.color = Colors.white;
    }
    paint.strokeWidth = width;
    paint.strokeCap = StrokeCap.round;

    canvas.drawLine(
        Offset(index * this.width, height - height / 20),
        Offset(index * this.width,
            height - .25 * height - this.value.ceilToDouble()),
        paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
