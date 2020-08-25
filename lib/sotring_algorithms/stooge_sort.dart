import 'dart:async';
import 'package:sorting_visulalization/main.dart';

stoogesort(int l, int h) async {
  if (l >= h) return;

  if (numbers[l] > numbers[h]) {
    int temp = numbers[l];
    numbers[l] = numbers[h];
    numbers[h] = temp;
    await Future.delayed(getDuration());
    streamController.add(numbers);
  }

  if (h - l + 1 > 2) {
    int t = (h - l + 1) ~/ 3;
    await stoogesort(l, h - t);
    await stoogesort(l + t, h);
    await stoogesort(l, h - t);
  }
}
