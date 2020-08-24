import 'dart:async';
import 'package:sorting_visulalization/main.dart';

insertionSort() async {
  for (int i = 1; i < numbers.length; i++) {
    int temp = numbers[i];
    int j = i - 1;
    while (j >= 0 && temp < numbers[j]) {
      numbers[j + 1] = numbers[j];
      --j;
      await Future.delayed(getDuration(), () {});

      streamController.add(numbers);
    }
    numbers[j + 1] = temp;
    await Future.delayed(getDuration(), () {});

    streamController.add(numbers);
  }
}
