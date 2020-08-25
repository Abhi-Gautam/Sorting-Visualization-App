import 'dart:async';
import 'package:sorting_visulalization/main.dart';

cocktailSort() async {
  bool swapped = true;
  int start = 0;
  int end = numbers.length;

  while (swapped == true) {
    swapped = false;
    for (int i = start; i < end - 1; ++i) {
      if (numbers[i] > numbers[i + 1]) {
        int temp = numbers[i];
        numbers[i] = numbers[i + 1];
        numbers[i + 1] = temp;
        swapped = true;
      }
      await Future.delayed(getDuration());
      streamController.add(numbers);
    }
    if (swapped == false) break;
    swapped = false;
    end = end - 1;
    for (int i = end - 1; i >= start; i--) {
      if (numbers[i] > numbers[i + 1]) {
        int temp = numbers[i];
        numbers[i] = numbers[i + 1];
        numbers[i + 1] = temp;
        swapped = true;
      }
      await Future.delayed(getDuration());
      streamController.add(numbers);
    }
    start = start + 1;
  }
}
