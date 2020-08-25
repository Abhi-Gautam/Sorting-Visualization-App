import 'dart:async';
import 'package:sorting_visulalization/main.dart';

oddEvenSort() async {
  bool isSorted = false;

  while (!isSorted) {
    isSorted = true;

    for (int i = 1; i <= numbers.length - 2; i = i + 2) {
      if (numbers[i] > numbers[i + 1]) {
        int temp = numbers[i];
        numbers[i] = numbers[i + 1];
        numbers[i + 1] = temp;
        isSorted = false;
        await Future.delayed(getDuration());
        streamController.add(numbers);
      }
    }

    for (int i = 0; i <= numbers.length - 2; i = i + 2) {
      if (numbers[i] > numbers[i + 1]) {
        int temp = numbers[i];
        numbers[i] = numbers[i + 1];
        numbers[i + 1] = temp;
        isSorted = false;
        await Future.delayed(getDuration());
        streamController.add(numbers);
      }
    }
  }

  return;
}
