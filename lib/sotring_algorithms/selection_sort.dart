import 'dart:async';
import 'package:sorting_visulalization/main.dart';

selectionSort() async {
  for (int i = 0; i < numbers.length; i++) {
    for (int j = i + 1; j < numbers.length; j++) {
      if (numbers[i] > numbers[j]) {
        int temp = numbers[j];
        numbers[j] = numbers[i];
        numbers[i] = temp;
      }

      await Future.delayed(getDuration(), () {});

      streamController.add(numbers);
    }
  }
}
