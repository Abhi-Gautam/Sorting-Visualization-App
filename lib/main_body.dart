import 'dart:ui';

import 'package:sorting_visulalization/main.dart';
import 'package:flutter/material.dart';
import 'package:sorting_visulalization/paints/bars.dart';
import 'package:sorting_visulalization/paints/dots.dart';

class MainBody extends StatelessWidget {
  const MainBody({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.only(top: 0.0),
        child: StreamBuilder<Object>(
            initialData: numbers,
            stream: streamController.stream,
            builder: (context, snapshot) {
              List<int> numbers = snapshot.data;
              int counter = 0;
              width = MediaQuery.of(context).size.width;
              height = MediaQuery.of(context).size.height;
              if (currentPlotStyle == 'bar') {
                return Row(
                  children: numbers.map((int num) {
                    counter++;
                    return Container(
                      child: CustomPaint(
                        painter: BarPainter(
                            index: counter,
                            value: num,
                            width:
                                MediaQuery.of(context).size.width / sampleSize),
                      ),
                    );
                  }).toList(),
                );
              } else {
                return Row(
                  children: numbers.map((int num) {
                    counter++;
                    return Container(
                      child: CustomPaint(
                        painter: DotPainter(
                            index: counter,
                            value: num,
                            width:
                                MediaQuery.of(context).size.width / sampleSize),
                      ),
                    );
                  }).toList(),
                );
              }
            }),
      ),
    );
  }
}
