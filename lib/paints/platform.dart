import 'dart:async';
import 'dart:math';

import 'package:sorting_visulalization/main.dart';
import 'package:flutter/material.dart';

class Platform extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(0, 600);
    final p2 = Offset(width, 600);
    final paint = Paint()
      ..color = Color(0xFF011638)
      ..strokeWidth = 4;
    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
