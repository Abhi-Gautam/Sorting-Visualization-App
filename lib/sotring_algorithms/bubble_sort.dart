import 'dart:async';
import 'package:sorting_visulalization/main.dart';

bubbleSort() async {
  for (int i = 0; i < numbers.length; ++i) {
    for (int j = 0; j < numbers.length - i - 1; ++j) {
      if (numbers[j] > numbers[j + 1]) {
        int temp = numbers[j];
        numbers[j] = numbers[j + 1];
        numbers[j + 1] = temp;
      }

      await Future.delayed(getDuration(), () {});

      streamController.add(numbers);
    }
  }
}
