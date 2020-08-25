import 'dart:async';
import 'package:sorting_visulalization/main.dart';
import 'dart:async';
import 'package:sorting_visulalization/main.dart';

int getNextGap(int gap) {
  gap = (gap * 10) ~/ 13;

  if (gap < 1) return 1;
  return gap;
}

combSort() async {
  int gap = numbers.length;

  bool swapped = true;

  while (gap != 1 || swapped == true) {
    gap = getNextGap(gap);

    swapped = false;

    for (int i = 0; i < numbers.length - gap; i++) {
      if (numbers[i] > numbers[i + gap]) {
        int temp = numbers[i];
        numbers[i] = numbers[i + gap];
        numbers[i + gap] = temp;
        swapped = true;
      }
      await Future.delayed(getDuration());
      streamController.add(numbers);
    }
  }
}
